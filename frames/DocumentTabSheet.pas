unit DocumentTabSheet;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls,
  Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, VirtualTrees, SynEdit, BCControls.SynEdit, Xml.XMLIntf, Xml.Win.msxmldom,
  Xml.XMLDoc, Vcl.ActnList, SynEditHighlighter, SynURIOpener, SynHighlighterURI, SynCompletionProposal, Xml.xmldom,
  BCControls.ProgressBar;

type
  PXMLTreeRec = ^TXMLTreeRec;
  TXMLTreeRec = record
    HasChildNodes: Boolean;
    NodeType: TNodeType;
    NodeName: string;
    NodeValue: string;
    BlockBegin: TBufferCoord;
    BlockEnd: TBufferCoord;
  end;

  TDocTabSheetFrame = class(TFrame)
    DocumentPanel: TPanel;
    HorizontalSplitter: TSplitter;
    Panel: TPanel;
    SplitSynEdit: TBCSynEdit;
    SynURIOpener: TSynURIOpener;
    SynURISyn: TSynURISyn;
    VerticalSplitter: TSplitter;
    VirtualDrawTree: TVirtualDrawTree;
    XMLDocument: TXMLDocument;
    SplitSynEditPanel: TPanel;
    SynEdit: TBCSynEdit;
    SynCompletionProposal: TSynCompletionProposal;
    SplitSynCompletionProposal: TSynCompletionProposal;
    procedure RefreshActionExecute(Sender: TObject);
    procedure VirtualDrawTreeDrawNode(Sender: TBaseVirtualTree; const PaintInfo: TVTPaintInfo);
    procedure VirtualDrawTreeFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure VirtualDrawTreeGetImageIndex(Sender: TBaseVirtualTree; Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex; var Ghosted: Boolean; var ImageIndex: Integer);
    procedure VirtualDrawTreeGetNodeWidth(Sender: TBaseVirtualTree; HintCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex; var NodeWidth: Integer);
    procedure VirtualDrawTreeInitNode(Sender: TBaseVirtualTree; ParentNode, Node: PVirtualNode; var InitialStates: TVirtualNodeInitStates);
    procedure SynCompletionProposalExecute(Kind: SynCompletionType; Sender: TObject; var CurrentInput: string; var x,
      y: Integer; var CanExecute: Boolean);
    procedure SplitSynCompletionProposalExecute(Kind: SynCompletionType; Sender: TObject; var CurrentInput: string;
      var x, y: Integer; var CanExecute: Boolean);
    procedure SynEditRightEdgeMouseUp(Sender: TObject);
    procedure SplitSynEditRightEdgeMouseUp(Sender: TObject);
    procedure VirtualDrawTreeClick(Sender: TObject);
    procedure SynEditMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure SplitSynEditMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    FModified: Boolean;
    FProgressBar: TBCProgressBar;
    FXMLNodeCount: Integer;
    function GetSplitVisible: Boolean;
    function GetMinimapVisible: Boolean;
    function GetXMLTreeVisible: Boolean;
    function GetCaretX: Integer;
    function GetCaretY: Integer;
    function ProcessNode(Node: IXMLNode; TreeNode: PVirtualNode): PVirtualNode;
    procedure NormalSelectionMode(SynEdit: TBCSynEdit);
    procedure SetSplitVisible(Value: Boolean);
    procedure SetMinimapVisible(Value: Boolean);
    procedure SetXMLTreeVisible(Value: Boolean);
    procedure SetBlockData;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    procedure LoadFromXML(XML: string);
    procedure UpdateOptionsAndStyles(Right: Integer);
    property SplitVisible: Boolean read GetSplitVisible write SetSplitVisible;
    property MinimapVisible: Boolean read GetMinimapVisible write SetMinimapVisible;
    property XMLTreeVisible: Boolean read GetXMLTreeVisible write SetXMLTreeVisible;
    property ProgressBar: TBCProgressBar read FProgressBar write FProgressBar;
    property CaretX: Integer read GetCaretX;
    property CaretY: Integer read GetCaretY;
  end;

implementation

{$R *.dfm}

uses
  Vcl.Themes, BCCommon.OptionsContainer, BCCommon.StyleUtils, BCCommon.StringUtils, System.Math, BCCommon.Math,
  SynEditTypes, System.Types;

const
  TAG_ZERO = 0;
  TAG_NO_MOVE_EVENTS = 1;
  TAG_POINT_IN_SELECTION = 2;

constructor TDocTabSheetFrame.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FModified := False;

  Panel.Padding.Right := GetRightPadding;
  UpdateOptionsAndStyles(Panel.Padding.Right);

  VerticalSplitter.Width := GetSplitterSize;
  HorizontalSplitter.Height := VerticalSplitter.Width;
  UpdateOptionsAndStyles(Panel.Padding.Right);
end;

procedure TDocTabSheetFrame.NormalSelectionMode(SynEdit: TBCSynEdit);
begin
  if OptionsContainer.EnableSelectionMode and (eoAltSetsColumnMode in SynEdit.Options) then
  begin
    OptionsContainer.EnableSelectionMode := False;
    SynEdit.Options := SynEdit.Options - [eoAltSetsColumnMode];
    SynEdit.Selectionmode := smNormal;
  end;
end;

procedure TDocTabSheetFrame.SynEditMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  NormalSelectionMode(SynEdit);
end;

procedure TDocTabSheetFrame.SynEditRightEdgeMouseUp(Sender: TObject);
begin
  OptionsContainer.MarginRightMargin := SynEdit.RightEdge.Position;
  SplitSynEdit.RightEdge.Position := SynEdit.RightEdge.Position;
end;

function TDocTabSheetFrame.GetXMLTreeVisible: Boolean;
begin
  Result := VirtualDrawTree.Visible;
  Application.ProcessMessages;
end;

procedure TDocTabSheetFrame.SetXMLTreeVisible(Value: Boolean);
begin
  VerticalSplitter.Visible := Value;
  VirtualDrawTree.Visible := Value;
end;

procedure TDocTabSheetFrame.SynCompletionProposalExecute(Kind: SynCompletionType; Sender: TObject;
  var CurrentInput: string; var x, y: Integer; var CanExecute: Boolean);
var
  MaxLengthWord: string;
begin
  SynCompletionProposal.NbLinesInWindow := 8; { Bug fix }
  MaxLengthWord := SplitTextIntoWords(SynCompletionProposal, SynEdit, OptionsContainer.CompletionProposalCaseSensitive);
  SynCompletionProposal.Width := SynEdit.Canvas.TextWidth(MaxLengthWord) + 40;
  CanExecute := SynCompletionProposal.ItemList.Count > 0;
end;

procedure TDocTabSheetFrame.SplitSynCompletionProposalExecute(Kind: SynCompletionType; Sender: TObject;
  var CurrentInput: string; var x, y: Integer; var CanExecute: Boolean);
var
  MaxLengthWord: string;
begin
  SplitSynCompletionProposal.NbLinesInWindow := 8; { Bug fix }
  MaxLengthWord := SplitTextIntoWords(SplitSynCompletionProposal, SplitSynEdit, OptionsContainer.CompletionProposalCaseSensitive);
  SynCompletionProposal.Width := SplitSynEdit.Canvas.TextWidth(MaxLengthWord);
  CanExecute := SplitSynCompletionProposal.ItemList.Count > 0;
end;

procedure TDocTabSheetFrame.SplitSynEditMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  NormalSelectionMode(SplitSynEdit);
end;

procedure TDocTabSheetFrame.SplitSynEditRightEdgeMouseUp(Sender: TObject);
begin
  OptionsContainer.MarginRightMargin := SplitSynEdit.RightEdge.Position;
  SynEdit.RightEdge.Position := SplitSynEdit.RightEdge.Position;
end;

function IsNameNodeType(NodeType: TNodeType): Boolean;
begin
  Result := (Ord(NodeType) <> 3) and (Ord(NodeType) <> 4) and (Ord(NodeType) <> 8);
end;

procedure TDocTabSheetFrame.SetBlockData;
var
  S: string;
  Data: PXMLTreeRec;
  Node: PVirtualNode;

  procedure SetData(Node: PVirtualNode);
  begin
    Data := VirtualDrawTree.GetNodeData(Node);

    if IsNameNodeType(Data.NodeType) then
      S := Data.NodeName
    else
      S := Data.NodeValue;

    if Data.NodeType = ntElement then
      S := '<' + S;

    SynEdit.SearchReplace(S, '', []);

    Data.BlockBegin := SynEdit.BlockBegin;
    Data.BlockEnd := SynEdit.BlockEnd;

    if Data.NodeType = ntElement then
      Inc(Data.BlockBegin.Char);
  end;

begin
  SynEdit.SetCaretXYEx(False, BufferCoord(0, 0));
  FProgressBar.Count := FXMLNodeCount;
  FProgressBar.Show;
  Node := VirtualDrawTree.GetFirst;
  while Assigned(Node) do
  begin
    SetData(Node);
    FProgressBar.StepIt;
    Application.ProcessMessages;
    Node := VirtualDrawTree.GetNext(Node);
  end;
  FProgressBar.Hide;
end;

procedure TDocTabSheetFrame.VirtualDrawTreeClick(Sender: TObject);
var
  SelectedNode: PVirtualNode;
  Data: PXMLTreeRec;
begin
  SelectedNode := VirtualDrawTree.GetFirstSelected;
  if Assigned(SelectedNode) then
  begin
    Data := VirtualDrawTree.GetNodeData(SelectedNode);
    SynEdit.SetCaretXYEx(True, Data.BlockBegin);
    SynEdit.EnsureCursorPosVisibleEx(True);
    SynEdit.BlockBegin := Data.BlockBegin;
    SynEdit.BlockEnd := Data.BlockEnd;
  end;
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
    if IsNameNodeType(TreeNode.NodeType) then
      S := TreeNode.NodeName
    else
      S := TreeNode.NodeValue;

    if Length(S) > 0 then
    begin
      with R do
      begin
        if (NodeWidth - 2 * Margin) > (Right - Left) then
          S := ShortenString(Canvas.Handle, S, Right - Left);
      end;
      Format := DT_TOP or DT_LEFT or DT_VCENTER or DT_SINGLELINE;
      DrawText(Canvas.Handle, S, Length(S), R, Format);
    end;

  end;
end;

procedure TDocTabSheetFrame.VirtualDrawTreeFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
var
  Data: PXMLTreeRec;
begin
  Data := Sender.GetNodeData(Node);
  Finalize(Data^);
  inherited;
end;

procedure TDocTabSheetFrame.VirtualDrawTreeGetImageIndex(Sender: TBaseVirtualTree; Node: PVirtualNode;
  Kind: TVTImageKind; Column: TColumnIndex; var Ghosted: Boolean; var ImageIndex: Integer);
var
  Data: PXMLTreeRec;
begin
  if Kind in [ikNormal, ikSelected] then
  begin
    Data := VirtualDrawTree.GetNodeData(Node);
    ImageIndex := Ord(Data.NodeType);
  end;
end;

procedure TDocTabSheetFrame.VirtualDrawTreeGetNodeWidth(Sender: TBaseVirtualTree; HintCanvas: TCanvas;
  Node: PVirtualNode; Column: TColumnIndex; var NodeWidth: Integer);
var
  Data: PXMLTreeRec;
  AMargin: Integer;
begin
  with Sender as TVirtualDrawTree do
  begin
    AMargin := TextMargin;
    Data := Sender.GetNodeData(Node);
    if Assigned(Data) then
    begin
      if IsNameNodeType(Data.NodeType) then
        NodeWidth := Canvas.TextWidth(Data.NodeName) + 2 * AMargin
      else
        NodeWidth := Canvas.TextWidth(Data.NodeValue) + 2 * AMargin
    end;
  end;
end;

procedure TDocTabSheetFrame.RefreshActionExecute(Sender: TObject);
begin
  LoadFromXML(SynEdit.Text);
end;

procedure TDocTabSheetFrame.VirtualDrawTreeInitNode(Sender: TBaseVirtualTree; ParentNode,
  Node: PVirtualNode; var InitialStates: TVirtualNodeInitStates);
var
  Data: PXMLTreeRec;
begin
  inherited;
  Data := VirtualDrawTree.GetNodeData(Node);
  if Assigned(Data) then
    if Data.HasChildNodes then //or (UpperCase(TreeNode.Data.NodeName) = 'XML') then
      Include(InitialStates, ivsHasChildren);
end;

function TDocTabSheetFrame.GetSplitVisible: Boolean;
begin
  Result := SplitSynEditPanel.Visible;
end;

procedure TDocTabSheetFrame.SetSplitVisible(Value: Boolean);
begin
  SplitSynEditPanel.Visible := Value;
  HorizontalSplitter.Visible := Value;
end;

function TDocTabSheetFrame.GetMinimapVisible: Boolean;
begin
  Result := SynEdit.MiniMap.Visible;
end;

procedure TDocTabSheetFrame.SetMinimapVisible(Value: Boolean);
begin
  SynEdit.Minimap.Visible := Value;
  SplitSynEdit.Minimap.Visible := Value;
  UpdateOptionsAndStyles(GetRightPadding);
end;

function TDocTabSheetFrame.GetCaretY: Integer;
begin
  Result := SynEdit.CaretY;
end;

function TDocTabSheetFrame.GetCaretX: Integer;
begin
  Result := SynEdit.CaretX;
end;

function TDocTabSheetFrame.ProcessNode(Node: IXMLNode; TreeNode: PVirtualNode): PVirtualNode;
var
  i: Integer;
  Data: PXMLTreeRec;
begin
  if Node.NodeType = ntComment then
    Exit(nil);
  Inc(FXMLNodeCount);
  Result := VirtualDrawTree.AddChild(TreeNode);

  Data := VirtualDrawTree.GetNodeData(Result);
  Data.HasChildNodes := Node.HasChildNodes; // and (Node.NodeType <> ntAttribute);
  Data.NodeType := Node.NodeType;
  Data.NodeName := Node.NodeName;
  if Node.NodeName = '#text' then
    Data.NodeValue := Node.NodeValue;

  { attributes }
  for i := 0 to Node.AttributeNodes.Count - 1 do
    ProcessNode(Node.AttributeNodes.Get(i), Result);

  if Assigned(TreeNode) and Data.HasChildNodes then
    for i := 0 to Node.ChildNodes.Count - 1 do
      ProcessNode(Node.ChildNodes.Get(i), Result);
end;

procedure TDocTabSheetFrame.LoadFromXML(XML: string);
var
  i: Integer;
  XMLNode: IXMLNode;
  Node: PVirtualNode;
begin
  try
    FXMLNodeCount := 0;
    XMLDocument.LoadFromXML(XML);

    VirtualDrawTree.Clear;
    VirtualDrawTree.NodeDataSize := SizeOf(TXMLTreeRec);
    VirtualDrawTree.BeginUpdate;

    XMLNode := XMLDocument.DocumentElement;
    Node := nil;
    while Assigned(XMLNode) do
    begin
      Node := ProcessNode(XMLNode, Node);
      if XMLNode.HasChildNodes then
        for i := 0 to XMLNode.ChildNodes.Count - 1 do
          ProcessNode(XMLNode.ChildNodes.Get(i), Node);
      XMLNode := XMLNode.NextSibling;
    end;
    VirtualDrawTree.Expanded[VirtualDrawTree.GetFirst] := True;
  finally
    VirtualDrawTree.EndUpdate;
    Application.ProcessMessages;
    SetBlockData;
  end;
end;

procedure TDocTabSheetFrame.UpdateOptionsAndStyles(Right: Integer);
var
  LStyles: TCustomStyleServices;

  procedure SetFontAndColors(SynCompletionProposal: TSynCompletionProposal);
  begin
    SynCompletionProposal.Font.Name := SynEdit.Font.Name;
    SynCompletionProposal.Font.Color := LStyles.GetStyleFontColor(sfEditBoxTextNormal);
    SynCompletionProposal.Font.Size := SynEdit.Font.Size;
    if LStyles.Enabled then
    begin
      with SynCompletionProposal do
      begin
        ClBackground := LStyles.GetStyleColor(scEdit);
        ClSelect := LStyles.GetSystemColor(clHighlight);
        ClSelectedText := LStyles.GetSystemColor(clHighlightText);
        ClTitleBackground := LStyles.GetStyleColor(scEdit);
        ClBorder := LStyles.GetStyleColor(scPanel);
      end;
    end
    else
    begin
      with SynCompletionProposal do
      begin
        ClBackground := clWindow;
        ClSelect := clHighlight;
        ClSelectedText := clHighlightText;
        ClTitleBackground := clBtnFace;
        ClBorder := clBtnFace;
      end;
    end;
  end;

begin
  Panel.Padding.Right := Right;

  { SynCompletionProposal }
  LStyles := StyleServices;
  SetFontAndColors(SynCompletionProposal);
  SetFontAndColors(SplitSynCompletionProposal);
  OptionsContainer.AssignTo(SynCompletionProposal);
  OptionsContainer.AssignTo(SplitSynCompletionProposal);
end;

end.
