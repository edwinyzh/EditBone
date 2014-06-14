unit DocumentXMLTree;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls,
  Vcl.Forms, Vcl.Dialogs, VirtualTrees, BCControls.Synedit, Xml.XMLIntf, Xml.Win.msxmldom, Xml.XMLDoc, Xml.xmldom,
  SynEditTypes, BCControls.ProgressBar;

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

  TDocumentXMLTreeFrame = class(TFrame)
    VirtualDrawTree: TVirtualDrawTree;
    XMLDocument: TXMLDocument;
    procedure VirtualDrawTreeClick(Sender: TObject);
    procedure VirtualDrawTreeDrawNode(Sender: TBaseVirtualTree; const PaintInfo: TVTPaintInfo);
    procedure VirtualDrawTreeFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure VirtualDrawTreeGetImageIndex(Sender: TBaseVirtualTree; Node: PVirtualNode; Kind: TVTImageKind;
      Column: TColumnIndex; var Ghosted: Boolean; var ImageIndex: Integer);
    procedure VirtualDrawTreeGetNodeWidth(Sender: TBaseVirtualTree; HintCanvas: TCanvas; Node: PVirtualNode;
      Column: TColumnIndex; var NodeWidth: Integer);
    procedure VirtualDrawTreeInitNode(Sender: TBaseVirtualTree; ParentNode, Node: PVirtualNode;
      var InitialStates: TVirtualNodeInitStates);
  private
    { Private declarations }
    FSynEdit: TBCSynEdit;
    FProgressBar: TBCProgressBar;
    FXMLNodeCount: Integer;
    function ProcessNode(Node: IXMLNode; TreeNode: PVirtualNode): PVirtualNode;
    procedure SetBlockData;
  public
    { Public declarations }
    procedure LoadFromXML(XML: string);
    property ProgressBar: TBCProgressBar read FProgressBar write FProgressBar;
    property SynEdit: TBCSynEdit read FSynEdit write FSynEdit;
  end;

implementation

{$R *.dfm}

uses
  Vcl.Themes, System.Types;

function IsNameNodeType(NodeType: TNodeType): Boolean;
begin
  Result := (Ord(NodeType) <> 3) and (Ord(NodeType) <> 4) and (Ord(NodeType) <> 8);
end;

procedure TDocumentXMLTreeFrame.SetBlockData;
var
  S: string;
  Data: PXMLTreeRec;
  Node: PVirtualNode;
  TempSynEdit: TBCSynEdit;

  procedure SetData(Node: PVirtualNode);
  begin
    Data := VirtualDrawTree.GetNodeData(Node);

    if IsNameNodeType(Data.NodeType) then
      S := Data.NodeName
    else
      S := Data.NodeValue;

    if Data.NodeType = ntElement then
      S := '<' + S;

    TempSynEdit.SearchReplace(S, '', []);

    Data.BlockBegin := TempSynEdit.BlockBegin;
    Data.BlockEnd := TempSynEdit.BlockEnd;

    if Data.NodeType = ntElement then
      Inc(Data.BlockBegin.Char);
  end;

begin
  TempSynEdit := TBCSynEdit.Create(nil);
  try
    TempSynEdit.Text := SynEdit.Text;
    TempSynEdit.SearchEngine := SynEdit.SearchEngine;
    TempSynEdit.SetCaretXYEx(False, BufferCoord(0, 0));
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
  finally
    TempSynEdit.Free;
  end;
end;

procedure TDocumentXMLTreeFrame.VirtualDrawTreeClick(Sender: TObject);
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

procedure TDocumentXMLTreeFrame.VirtualDrawTreeDrawNode(Sender: TBaseVirtualTree; const PaintInfo: TVTPaintInfo);
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

procedure TDocumentXMLTreeFrame.VirtualDrawTreeFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
var
  Data: PXMLTreeRec;
begin
  Data := Sender.GetNodeData(Node);
  Finalize(Data^);
  inherited;
end;

procedure TDocumentXMLTreeFrame.VirtualDrawTreeGetImageIndex(Sender: TBaseVirtualTree; Node: PVirtualNode; Kind: TVTImageKind;
  Column: TColumnIndex; var Ghosted: Boolean; var ImageIndex: Integer);
var
  Data: PXMLTreeRec;
begin
  if Kind in [ikNormal, ikSelected] then
  begin
    Data := VirtualDrawTree.GetNodeData(Node);
    ImageIndex := Ord(Data.NodeType);
  end;
end;

procedure TDocumentXMLTreeFrame.VirtualDrawTreeGetNodeWidth(Sender: TBaseVirtualTree; HintCanvas: TCanvas; Node: PVirtualNode;
  Column: TColumnIndex; var NodeWidth: Integer);
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

procedure TDocumentXMLTreeFrame.VirtualDrawTreeInitNode(Sender: TBaseVirtualTree; ParentNode, Node: PVirtualNode;
  var InitialStates: TVirtualNodeInitStates);
var
  Data: PXMLTreeRec;
begin
  inherited;
  Data := VirtualDrawTree.GetNodeData(Node);
  if Assigned(Data) then
    if Data.HasChildNodes then //or (UpperCase(TreeNode.Data.NodeName) = 'XML') then
      Include(InitialStates, ivsHasChildren);
end;

function TDocumentXMLTreeFrame.ProcessNode(Node: IXMLNode; TreeNode: PVirtualNode): PVirtualNode;
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

procedure TDocumentXMLTreeFrame.LoadFromXML(XML: string);
var
  i: Integer;
  XMLNode: IXMLNode;
  Node: PVirtualNode;
begin
  MSXMLDOMDocumentFactory.AddDOMProperty('ProhibitDTD', False);
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
    SynEdit.CaretX := 0;
    SynEdit.CaretY := 0;
  end;
end;

end.
