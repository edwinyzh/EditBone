unit EditBone.Frames.Document.TabSheet.XMLTree;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls,
  Vcl.Forms, Vcl.Dialogs, VirtualTrees, BCEditor.Types, Xml.XMLIntf, Xml.Win.msxmldom, Xml.XMLDoc,
  BCControls.ProgressBar, BCEditor.Editor, sFrameAdapter, Xml.xmldom;

type
  PXMLTreeRec = ^TXMLTreeRec;
  TXMLTreeRec = record
    HasChildNodes: Boolean;
    NodeType: TNodeType;
    NodeName: string;
    NodeValue: string;
    BlockBegin: TBCEditorTextPosition;
    BlockEnd: TBCEditorTextPosition;
  end;

  TDocumentXMLTreeFrame = class(TFrame)
    VirtualDrawTree: TVirtualDrawTree;
    XMLDocument: TXMLDocument;
    FrameAdapter: TsFrameAdapter;
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
    FEditor: TBCEditor;
    FProgressBar: TBCProgressBar;
    FXMLNodeCount: Integer;
    function ProcessNode(Node: IXMLNode; TreeNode: PVirtualNode): PVirtualNode;
    procedure SetBlockData;
  public
    procedure LoadFromXML(XML: string);
    property ProgressBar: TBCProgressBar read FProgressBar write FProgressBar;
    property Editor: TBCEditor read FEditor write FEditor;
  end;

implementation

{$R *.dfm}

uses
  System.Types, VirtualTrees.Utils;

function IsNameNodeType(NodeType: TNodeType): Boolean;
begin
  Result := (Ord(NodeType) <> 3) and (Ord(NodeType) <> 4) and (Ord(NodeType) <> 8);
end;

procedure TDocumentXMLTreeFrame.SetBlockData;
var
  S: string;
  Data: PXMLTreeRec;
  Node: PVirtualNode;
  TempEditor: TBCEditor;

  procedure SetData(Node: PVirtualNode);
  begin
    Data := VirtualDrawTree.GetNodeData(Node);

    if IsNameNodeType(Data.NodeType) then
      S := Data.NodeName
    else
      S := Data.NodeValue;

    if Data.NodeType = ntElement then
      S := '<' + S;

    TempEditor.Search.SearchText := S;

    Data.BlockBegin := TempEditor.SelectionBeginPosition;
    Data.BlockEnd := TempEditor.SelectionEndPosition;

    if Data.NodeType = ntElement then
      Inc(Data.BlockBegin.Char);
  end;

begin
  TempEditor := TBCEditor.Create(nil);
  try
    TempEditor.Text := Editor.Text;
    TempEditor.Search.Engine := Editor.Search.Engine;
    TempEditor.Search.Enabled := True;
    TempEditor.CaretX := 0; // SetCaretXYEx(False, BufferCoord(0, 0));
    TempEditor.CaretY := 0;
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
    TempEditor.Free;
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
    Editor.CaretX := Data.BlockBegin.Char;
    Editor.CaretY := Data.BlockBegin.Line;
    Editor.EnsureCursorPositionVisible(True);
    Editor.SelectionBeginPosition := Data.BlockBegin;
    Editor.SelectionEndPosition := Data.BlockEnd;
  end;
end;

procedure TDocumentXMLTreeFrame.VirtualDrawTreeDrawNode(Sender: TBaseVirtualTree; const PaintInfo: TVTPaintInfo);
var
  TreeNode: PXMLTreeRec;
  S: string;
  R: TRect;
  Format: Cardinal;
begin
  with Sender as TVirtualDrawTree, PaintInfo do
  begin
    TreeNode := Sender.GetNodeData(Node);

    if not Assigned(TreeNode) then
      Exit;

    if Assigned(FrameAdapter.SkinData) and Assigned(FrameAdapter.SkinData.SkinManager) then
      Canvas.Font.Color := FrameAdapter.SkinData.SkinManager.GetActiveEditFontColor
    else
      Canvas.Font.Color := clWindowText;

    if vsSelected in PaintInfo.Node.States then
    begin
      if Assigned(FrameAdapter.SkinData) and Assigned(FrameAdapter.SkinData.SkinManager) then
      begin
        Canvas.Brush.Color := FrameAdapter.SkinData.SkinManager.GetHighLightColor;
        Canvas.Font.Color := FrameAdapter.SkinData.SkinManager.GetHighLightFontColor
      end
      else
      begin
        Canvas.Brush.Color := clHighlight;
        Canvas.Font.Color := clHighlightText;
      end;
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
    Editor.CaretX := 0;
    Editor.CaretY := 0;
  end;
end;

end.
