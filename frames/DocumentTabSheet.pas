unit DocumentTabSheet;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, VirtualTrees, SynEdit, BCSynEdit,
  Xml.XMLIntf, Xml.xmldom, Xml.Win.msxmldom, Xml.XMLDoc, Vcl.ImgList;

type
  PXMLTreeRec = ^TXMLTreeRec;
  TXMLTreeRec = record
    Data: IXMLNode;
  end;

  TTabSheetFrame = class(TFrame)
    Panel: TPanel;
    VirtualDrawTree: TVirtualDrawTree;
    VerticalSplitter: TSplitter;
    DocumentPanel: TPanel;
    SynEdit: TBCSynEdit;
    SplitSynEdit: TBCSynEdit;
    HorizontalSplitter: TSplitter;
    XMLDocument: TXMLDocument;
    ImageList: TImageList;
    procedure VirtualDrawTreeDrawNode(Sender: TBaseVirtualTree; const PaintInfo: TVTPaintInfo);
    procedure VirtualDrawTreeFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure VirtualDrawTreeGetImageIndex(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Kind: TVTImageKind; Column: TColumnIndex; var Ghosted: Boolean; var ImageIndex: Integer);
    procedure VirtualDrawTreeGetNodeWidth(Sender: TBaseVirtualTree; HintCanvas: TCanvas;
      Node: PVirtualNode; Column: TColumnIndex; var NodeWidth: Integer);
    procedure VirtualDrawTreeInitChildren(Sender: TBaseVirtualTree; Node: PVirtualNode;
      var ChildCount: Cardinal);
    procedure VirtualDrawTreeInitNode(Sender: TBaseVirtualTree; ParentNode, Node: PVirtualNode;
      var InitialStates: TVirtualNodeInitStates);
  private
    { Private declarations }
    function GetXMLTreeVisible: Boolean;
    procedure SetXMLTreeVisible(Value: Boolean);
    function GetSplitVisible: Boolean;
    procedure SetSplitVisible(Value: Boolean);
  public
    { Public declarations }
    procedure LoadFromXML(XML: string);
    property XMLTreeVisible: Boolean read GetXMLTreeVisible write SetXMLTreeVisible;
    property SplitVisible: Boolean read GetSplitVisible write SetSplitVisible;
  end;

implementation

{$R *.dfm}

uses
  Vcl.Themes;

function TTabSheetFrame.GetXMLTreeVisible: Boolean;
begin
  Result := VirtualDrawTree.Visible;
end;

procedure TTabSheetFrame.SetXMLTreeVisible(Value: Boolean);
begin
  VirtualDrawTree.Visible := Value;
  VerticalSplitter.Visible := Value;
end;

procedure TTabSheetFrame.VirtualDrawTreeDrawNode(Sender: TBaseVirtualTree;
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
    S := IntToStr(Ord(TreeNode.Data.NodeType)) + ': ' + TreeNode.Data.NodeName;

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

procedure TTabSheetFrame.VirtualDrawTreeFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
var
  Data: PXMLTreeRec;
begin
  Data := Sender.GetNodeData(Node);
  if Assigned(Data) then
    Data^.Data := nil;
  //Finalize(Data^);
end;

procedure TTabSheetFrame.VirtualDrawTreeGetImageIndex(Sender: TBaseVirtualTree; Node: PVirtualNode;
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

procedure TTabSheetFrame.VirtualDrawTreeGetNodeWidth(Sender: TBaseVirtualTree; HintCanvas: TCanvas;
  Node: PVirtualNode; Column: TColumnIndex; var NodeWidth: Integer);
var
  TreeNode: PXMLTreeRec;
  AMargin: Integer;
begin
  with Sender as TVirtualDrawTree do
  begin
    AMargin := TextMargin;
    TreeNode := Sender.GetNodeData(Node);
    NodeWidth := Canvas.TextWidth(TreeNode.Data.NodeName) + 2 * AMargin;
  end;
end;

procedure TTabSheetFrame.VirtualDrawTreeInitChildren(Sender: TBaseVirtualTree; Node: PVirtualNode;
  var ChildCount: Cardinal);
var
  Data, ChildData: PXMLTreeRec;
  ChildNode: PVirtualNode;
begin
 { Data := VirtualDrawTree.GetNodeData(Node);
  if PrivilegesQuery.Locate('GRANTEE', Data.GrantedRole, []) then
  begin
    while not PrivilegesQuery.Eof and (PrivilegesQuery.FieldByName('GRANTEE').AsString = Data.GrantedRole) do
    begin
      ChildNode := VirtualDrawTree.AddChild(Node);
      ChildData := VirtualDrawTree.GetNodeData(ChildNode);
      ChildData.Grantee := PrivilegesQuery.FieldByName('GRANTEE').AsString;
      ChildData.GrantedRole := PrivilegesQuery.FieldByName('PRIVILEGE').AsString;
      ChildData.Grantor := PrivilegesQuery.FieldByName('GRANTOR').AsString;
      ChildData.Owner := PrivilegesQuery.FieldByName('OWNER').AsString;
      ChildData.ObjectName := PrivilegesQuery.FieldByName('TABLE_NAME').AsString;
      ChildData.ImageIndex := 1;
      PrivilegesQuery.Next;
    end;
    ChildCount := VirtualDrawTree.ChildCount[Node];
  end;  }
end;

procedure TTabSheetFrame.VirtualDrawTreeInitNode(Sender: TBaseVirtualTree; ParentNode,
  Node: PVirtualNode; var InitialStates: TVirtualNodeInitStates);
var
  TreeNode: PXMLTreeRec;
begin
  inherited;
  TreeNode := VirtualDrawTree.GetNodeData(Node);
  if TreeNode.Data.HasChildNodes or (UpperCase(TreeNode.Data.NodeName) = 'XML') then
    Include(InitialStates, ivsHasChildren);
end;

function TTabSheetFrame.GetSplitVisible: Boolean;
begin
  Result := SplitSynEdit.Visible;
end;

procedure TTabSheetFrame.SetSplitVisible(Value: Boolean);
begin
  SplitSynEdit.Visible := Value;
  HorizontalSplitter.Visible := Value;
end;

procedure TTabSheetFrame.LoadFromXML(XML: string);
var
  XMLNode: IXMLNode;

  procedure ProcessNode(Node: IXMLNode);
  var
    VirtualNode: PVirtualNode;
    NodeData: PXMLTreeRec;
  begin
    if not Assigned(Node) then
      Exit;
    Application.ProcessMessages;

    VirtualNode := VirtualDrawTree.AddChild(nil);
    NodeData := VirtualDrawTree.GetNodeData(VirtualNode);
    NodeData.Data := Node;
  end;

begin
  try
    XMLDocument.LoadFromXML(XML);

    VirtualDrawTree.Clear;
    VirtualDrawTree.NodeDataSize := SizeOf(TXMLTreeRec);
    VirtualDrawTree.BeginUpdate;

    XMLNode := XMLDocument.ChildNodes.First;
    while Assigned(XMLNode) do
    begin
      ProcessNode(XMLNode);
      XMLNode := XMLNode.NextSibling;
    end;
  finally
    VirtualDrawTree.EndUpdate;
  end;
end;

end.
