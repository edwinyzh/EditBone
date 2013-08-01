unit DocumentTabSheet;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, VirtualTrees, SynEdit, BCControls.SynEdit,
  Xml.XMLIntf, Xml.xmldom, Xml.Win.msxmldom, Xml.XMLDoc, Vcl.ImgList, BCControls.ImageList, Vcl.Menus,
  Vcl.ActnList, SynEditHighlighter, SynHighlighterMulti, SynURIOpener, SynHighlighterURI, SynMiniMap;

type
  PXMLTreeRec = ^TXMLTreeRec;
  TXMLTreeRec = record
    Data: IXMLNode;
  end;

  TDocTabSheetFrame = class(TFrame)
    DocumentPanel: TPanel;
    HorizontalSplitter: TSplitter;
    Panel: TPanel;
    SplitSynEdit: TBCSynEdit;
    SynEdit: TBCSynEdit;
    SynURIOpener: TSynURIOpener;
    SynURISyn: TSynURISyn;
    VerticalSplitter: TSplitter;
    VirtualDrawTree: TVirtualDrawTree;
    XMLDocument: TXMLDocument;
    SynMiniMap1: TSynMiniMap;
    procedure RefreshActionExecute(Sender: TObject);
    procedure VirtualDrawTreeDrawNode(Sender: TBaseVirtualTree; const PaintInfo: TVTPaintInfo);
    procedure VirtualDrawTreeFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure VirtualDrawTreeGetImageIndex(Sender: TBaseVirtualTree; Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex; var Ghosted: Boolean; var ImageIndex: Integer);
    procedure VirtualDrawTreeGetNodeWidth(Sender: TBaseVirtualTree; HintCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex; var NodeWidth: Integer);
    procedure VirtualDrawTreeInitChildren(Sender: TBaseVirtualTree; Node: PVirtualNode; var ChildCount: Cardinal);
    procedure VirtualDrawTreeInitNode(Sender: TBaseVirtualTree; ParentNode, Node: PVirtualNode; var InitialStates: TVirtualNodeInitStates);
    procedure SynMiniMap1Click(Sender: TObject; Data: PSynMiniMapEventData);
  private
    { Private declarations }
    function GetSplitVisible: Boolean;
    function GetXMLTreeVisible: Boolean;
    procedure ProcessNode(Node: IXMLNode; TreeNode: PVirtualNode);
    procedure SetSplitVisible(Value: Boolean);
    procedure SetXMLTreeVisible(Value: Boolean);
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    procedure LoadFromXML(XML: string);
    property SplitVisible: Boolean read GetSplitVisible write SetSplitVisible;
    property XMLTreeVisible: Boolean read GetXMLTreeVisible write SetXMLTreeVisible;
  end;

implementation

{$R *.dfm}

uses
  Vcl.Themes, Options, BCCommon.StyleHooks;

constructor TDocTabSheetFrame.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Panel.Padding.Right := GetRightPadding;
end;

function TDocTabSheetFrame.GetXMLTreeVisible: Boolean;
begin
  Result := VirtualDrawTree.Visible;
end;

procedure TDocTabSheetFrame.SetXMLTreeVisible(Value: Boolean);
begin
  VerticalSplitter.Visible := Value;
  VirtualDrawTree.Visible := Value;
  //VerticalSplitter.Visible := Value;
end;

procedure TDocTabSheetFrame.SynMiniMap1Click(Sender: TObject; Data: PSynMiniMapEventData);
begin
  if Assigned(SynMiniMap1.Editor) then
  begin
    SynMiniMap1.Editor.GotoLineAndCenter(Data.Coord.Line);
    SynMiniMap1.Editor.CaretX := Data.Coord.Char;
  end;
end;

function IsNameNodeType(NodeType: TNodeType): Boolean;
begin
  Result := (Ord(NodeType) <> 3) and (Ord(NodeType) <> 4) and (Ord(NodeType) <> 8);
end;

procedure TDocTabSheetFrame.VirtualDrawTreeDrawNode(Sender: TBaseVirtualTree;
  const PaintInfo: TVTPaintInfo);
var
  TreeNode: PXMLTreeRec;
  S: UnicodeString;
  R: TRect;
  Format: Cardinal;
  LStyles: TCustomStyleServices;
  LColor: TColor;
begin
  LStyles := StyleServices;
  with Sender as TVirtualDrawTree, PaintInfo do
  begin
    TreeNode := Sender.GetNodeData(Node);

    if not Assigned(TreeNode) then
      Exit;

    if not LStyles.GetElementColor(LStyles.GetElementDetails(tgCellNormal), ecTextColor, LColor) or  (LColor = clNone) then
      LColor := LStyles.GetSystemColor(clWindowText);
    //get and set the background color
    Canvas.Brush.Color := LStyles.GetStyleColor(scEdit);
    Canvas.Font.Color := LColor;

    if LStyles.Enabled and (vsSelected in PaintInfo.Node.States) then
    begin
       Colors.FocusedSelectionColor := LStyles.GetSystemColor(clHighlight);
       Colors.FocusedSelectionBorderColor := LStyles.GetSystemColor(clHighlight);
       Colors.UnfocusedSelectionColor := LStyles.GetSystemColor(clHighlight);
       Colors.UnfocusedSelectionBorderColor := LStyles.GetSystemColor(clHighlight);
       Canvas.Brush.Color := LStyles.GetSystemColor(clHighlight);
       Canvas.Font.Color := LStyles.GetStyleFontColor(sfMenuItemTextSelected);// GetSystemColor(clHighlightText);
    end
    else
    if not LStyles.Enabled and (vsSelected in PaintInfo.Node.States) then
    begin
      Canvas.Brush.Color := clHighlight;
      Canvas.Font.Color := clHighlightText;
    end;

    SetBKMode(Canvas.Handle, TRANSPARENT);

    R := ContentRect;
    InflateRect(R, -TextMargin, 0);
    Dec(R.Right);
    Dec(R.Bottom);
    if IsNameNodeType(TreeNode.Data.NodeType) then
      S := TreeNode.Data.NodeName
    else
      S := TreeNode.Data.NodeValue;

    if Length(S) > 0 then
    begin
      with R do
      begin
        if (NodeWidth - 2 * Margin) > (Right - Left) then
          S := ShortenString(Canvas.Handle, S, Right - Left);
      end;
      Format := DT_TOP or DT_LEFT or DT_VCENTER or DT_SINGLELINE;
      DrawTextW(Canvas.Handle, PWideChar(S), Length(S), R, Format);
    end;

  end;
end;

procedure TDocTabSheetFrame.VirtualDrawTreeFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
var
  Data: PXMLTreeRec;
begin
  Data := Sender.GetNodeData(Node);
  Finalize(Data^);
end;

procedure TDocTabSheetFrame.VirtualDrawTreeGetImageIndex(Sender: TBaseVirtualTree; Node: PVirtualNode;
  Kind: TVTImageKind; Column: TColumnIndex; var Ghosted: Boolean; var ImageIndex: Integer);
var
  TreeNode: PXMLTreeRec;
begin
  if Kind in [ikNormal, ikSelected] then
  begin
    TreeNode := VirtualDrawTree.GetNodeData(Node);
    ImageIndex := Ord(TreeNode.Data.NodeType);
  end;
end;

procedure TDocTabSheetFrame.VirtualDrawTreeGetNodeWidth(Sender: TBaseVirtualTree; HintCanvas: TCanvas;
  Node: PVirtualNode; Column: TColumnIndex; var NodeWidth: Integer);
var
  TreeNode: PXMLTreeRec;
  AMargin: Integer;
begin
  with Sender as TVirtualDrawTree do
  begin
    AMargin := TextMargin;
    TreeNode := Sender.GetNodeData(Node);
    if IsNameNodeType(TreeNode.Data.NodeType) then
      NodeWidth := Canvas.TextWidth(TreeNode.Data.NodeName) + 2 * AMargin
    else
      NodeWidth := Canvas.TextWidth(TreeNode.Data.NodeValue) + 2 * AMargin
  end;
end;

procedure TDocTabSheetFrame.ProcessNode(Node: IXMLNode; TreeNode: PVirtualNode);
var
  VirtualNode: PVirtualNode;
  NodeData: PXMLTreeRec;
begin
  if not Assigned(Node) then
    Exit;
  Application.ProcessMessages;

  VirtualNode := VirtualDrawTree.AddChild(TreeNode);
  NodeData := VirtualDrawTree.GetNodeData(VirtualNode);
  NodeData.Data := Node;
end;

procedure TDocTabSheetFrame.RefreshActionExecute(Sender: TObject);
begin
  LoadFromXML(SynEdit.Text);
end;

procedure TDocTabSheetFrame.VirtualDrawTreeInitChildren(Sender: TBaseVirtualTree; Node: PVirtualNode;
  var ChildCount: Cardinal);
var
  i: Integer;
  TreeNode: PXMLTreeRec;
  XMLNode: IXMLNode;
begin
  TreeNode := VirtualDrawTree.GetNodeData(Node);
  XMLNode := TreeNode.Data;
  { attributes }
  for i := 0 to XMLNode.AttributeNodes.Count - 1 do
    ProcessNode(XMLNode.AttributeNodes.Get(i), Node);
  { childnodes }
  XMLNode := TreeNode.Data.ChildNodes.First;
  while Assigned(XMLNode) do
  begin
    ProcessNode(XMLNode, Node);
    XMLNode := XMLNode.NextSibling;
  end;
  ChildCount := VirtualDrawTree.ChildCount[Node];
end;

procedure TDocTabSheetFrame.VirtualDrawTreeInitNode(Sender: TBaseVirtualTree; ParentNode,
  Node: PVirtualNode; var InitialStates: TVirtualNodeInitStates);
var
  TreeNode: PXMLTreeRec;
begin
  inherited;
  TreeNode := VirtualDrawTree.GetNodeData(Node);
  if TreeNode.Data.HasChildNodes or (UpperCase(TreeNode.Data.NodeName) = 'XML') then
    Include(InitialStates, ivsHasChildren);
end;

function TDocTabSheetFrame.GetSplitVisible: Boolean;
begin
  Result := SplitSynEdit.Visible;
end;

procedure TDocTabSheetFrame.SetSplitVisible(Value: Boolean);
begin
  SplitSynEdit.Visible := Value;
  HorizontalSplitter.Visible := Value;
end;

procedure TDocTabSheetFrame.LoadFromXML(XML: string);
var
  XMLNode: IXMLNode;
begin
  try
    XMLDocument.LoadFromXML(XML);

    VirtualDrawTree.Clear;
    VirtualDrawTree.NodeDataSize := SizeOf(TXMLTreeRec);
    VirtualDrawTree.BeginUpdate;

    XMLNode := XMLDocument.ChildNodes.First;
    while Assigned(XMLNode) do
    begin
      ProcessNode(XMLNode, nil);
      XMLNode := XMLNode.NextSibling;
    end;
  finally
    VirtualDrawTree.EndUpdate;
  end;
end;

end.
