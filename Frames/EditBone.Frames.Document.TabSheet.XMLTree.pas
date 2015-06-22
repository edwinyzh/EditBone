unit EditBone.Frames.Document.TabSheet.XMLTree;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls,
  Vcl.Forms, Vcl.Dialogs, VirtualTrees, BCEditor.Types, BCControls.ProgressBar, BCEditor.Editor, sFrameAdapter,
  System.Generics.Collections, System.UITypes;

type
  TNodeType = (ntReserved, ntElement, ntAttribute, ntText, ntCData, ntProcessingInstr, ntComment);
  TCharset = set of AnsiChar;

  PXMLTreeRec = ^TXMLTreeRec;
  TXMLTreeRec = record
    HasChildNodes: Boolean;
    NodeType: TNodeType;
    NodeName: string;
    BlockBegin: TBCEditorTextPosition;
    BlockEnd: TBCEditorTextPosition;
  end;

  TDocumentXMLTreeFrame = class(TFrame)
    VirtualDrawTree: TVirtualDrawTree;
    FrameAdapter: TsFrameAdapter;
    procedure VirtualDrawTreeClick(Sender: TObject);
    procedure VirtualDrawTreeDrawNode(Sender: TBaseVirtualTree; const PaintInfo: TVTPaintInfo);
    procedure VirtualDrawTreeFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure VirtualDrawTreeGetNodeWidth(Sender: TBaseVirtualTree; HintCanvas: TCanvas; Node: PVirtualNode;
      Column: TColumnIndex; var NodeWidth: Integer);
    procedure VirtualDrawTreeInitNode(Sender: TBaseVirtualTree; ParentNode, Node: PVirtualNode;
      var InitialStates: TVirtualNodeInitStates);
    procedure VirtualDrawTreeGetImageIndex(Sender: TBaseVirtualTree; Node: PVirtualNode; Kind: TVTImageKind;
      Column: TColumnIndex; var Ghosted: Boolean; var ImageIndex: TImageIndex);
  private
    FEditor: TBCEditor;
    FProgressBar: TBCProgressBar;
    FXMLNodeCount: Integer;
  public
    procedure LoadFromXML(XML: string);
    property ProgressBar: TBCProgressBar read FProgressBar write FProgressBar;
    property Editor: TBCEditor read FEditor write FEditor;
  end;

implementation

{$R *.dfm}

uses
  System.Types, VirtualTrees.Utils, BCEditor.Editor.Utils;

const
  CWHITESPACE = [#32, #9];

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
    S := TreeNode.NodeName;

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

procedure TDocumentXMLTreeFrame.VirtualDrawTreeGetImageIndex(Sender: TBaseVirtualTree; Node: PVirtualNode;
  Kind: TVTImageKind; Column: TColumnIndex; var Ghosted: Boolean; var ImageIndex: TImageIndex);
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
      NodeWidth := Canvas.TextWidth(Data.NodeName) + 2 * AMargin
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
    if Data.HasChildNodes then
      Include(InitialStates, ivsHasChildren);
end;

procedure TDocumentXMLTreeFrame.LoadFromXML(XML: string);
var
  LLine: Integer;
  LNode: PVirtualNode;
  LData: PXMLTreeRec;
  LPLineText: PChar;
  LChar: Integer;
  LNodeStack: TStack<PVirtualNode>;
  LLines: TStrings;

  procedure IncChar(N: Integer = 1);
  begin
    if CharInSet(LPLineText^, [#$D, #$A, #0]) then
    begin
      if LPLineText^ = #$D then
      begin
        Inc(LLine);
        FProgressBar.StepIt;
      end;
      LChar := 1;
    end
    else
      Inc(LChar, N);
    Inc(LPLineText, N);
  end;

  function ExtractText(ABufferStart: PChar; ATerminators: TCharset): string;
  begin
    while not CharInSet((LPLineText + 1)^, ATerminators) do
      IncChar;
    IncChar; { char before terminator }
    SetString(Result, ABufferStart, LPLineText - ABufferStart);
  end;

  procedure PopAttribute;
  begin
    LData := VirtualDrawTree.GetNodeData(LNodeStack.Peek);
    if LData.NodeType = ntAttribute then
      if LNodeStack.Count > 0 then
        LNodeStack.Pop;
  end;

  procedure ReadAttributes;
  const
    CNameStart = [#$41 .. #$5A, #$61 .. #$7A, #$C0 .. #$D6, #$D8 .. #$F6, #$F8 .. #$FF, '_', ':'];
  type
    TAttributePhase = (apName, apEqual, apValue);
  var
    AttributePhase: TAttributePhase;
  begin
    AttributePhase := apName;
    while (LPLineText^ <> #0) and (LPLineText^ <> '>') do
    begin
      if not CharInSet(LPLineText^, CWHITESPACE) then
      case AttributePhase of
        apName:
          begin
            if not CharInSet(LPLineText^, CNameStart) then
              Break;

            PopAttribute;

            LNode := VirtualDrawTree.AddChild(LNodeStack.Peek);
            LData := VirtualDrawTree.GetNodeData(LNode);
            LData.NodeType := ntAttribute;
            LData.BlockBegin := GetTextPosition(LChar, LLine);
            LData.NodeName := ExtractText(LPLineText, CWHITESPACE + ['=', '/', #0, '>']);
            LData.BlockEnd := GetTextPosition(LChar, LLine);
            LNodeStack.Push(LNode);

            AttributePhase := apEqual;
          end;
        apEqual:
          begin
            if LPLineText^ = '=' then
              AttributePhase := apValue;
            IncChar; { '=' }
          end;
        apValue:
          begin
            if CharInSet(LPLineText^, ['"']) then
            begin
              IncChar; { '"' or '''' }
              LData.HasChildNodes := True; { apName }
              LNode := VirtualDrawTree.AddChild(LNodeStack.Pop);
              LData := VirtualDrawTree.GetNodeData(LNode);
              LData.NodeType := ntText;
              LData.BlockBegin := GetTextPosition(LChar, LLine);
              LData.NodeName := ExtractText(LPLineText, ['"']);
              LData.BlockEnd := GetTextPosition(LChar, LLine);
              IncChar; { '"' or '''' }
              AttributePhase := apName;
            end
            else
              IncChar;
          end
      end
      else
        IncChar; { whitespace }
    end;
    PopAttribute;
    if (LPLineText^ = '/') or ((LPLineText + 1)^ = '/') then
      LNodeStack.Pop;
  end;

  procedure ReadProlog;
  begin
    IncChar(2); { '<?' }
    LNode := VirtualDrawTree.AddChild(nil);
    LData := VirtualDrawTree.GetNodeData(LNode);
    LData.HasChildNodes := True;
    LData.NodeType := ntReserved;
    LData.BlockBegin := GetTextPosition(LChar, LLine);
    LData.NodeName := 'xml';
    IncChar(3); { 'xml' }
    LData.BlockEnd := GetTextPosition(LChar, LLine);
    IncChar(1); { ' ' }
    LNodeStack.Push(LNode);
    ReadAttributes;
    LNodeStack.Pop;
  end;

  procedure ReadProcessingInstruction;
  begin
    IncChar(2); { '<?' }
    LNode := VirtualDrawTree.AddChild(nil);
    LData := VirtualDrawTree.GetNodeData(LNode);
    LData.NodeType := ntReserved;
    LData.BlockBegin := GetTextPosition(LChar, LLine);
    LData.NodeName := ExtractText(LPLineText, CWHITESPACE + ['=', '/', #0, '>']);
    LData.BlockEnd := GetTextPosition(LChar, LLine);
    LNodeStack.Push(LNode);
    ReadAttributes;
    PopAttribute;
    LNodeStack.Pop;
  end;

  procedure ReadComment;
  begin
    if LNodeStack.Count > 0 then
      LNode := VirtualDrawTree.AddChild(LNodeStack.Peek)
    else
      LNode := VirtualDrawTree.AddChild(nil);
    LData := VirtualDrawTree.GetNodeData(LNode);
    LData.NodeType := ntComment;
    LData.BlockBegin := GetTextPosition(LChar, LLine);
    LData.NodeName := 'comment';
    while (LPLineText^ <> #0) and (StrLComp(LPLineText, '-->', 3) <> 0) do
      IncChar;
    IncChar(3); { '-->' }
    LData.BlockEnd := GetTextPosition(LChar, LLine);
  end;

  procedure ReadDocTypeItem;
  begin
    LNode := VirtualDrawTree.AddChild(LNodeStack.Peek);
    LData := VirtualDrawTree.GetNodeData(LNode);
    LData.NodeType := ntElement;
    LData.BlockBegin := GetTextPosition(LChar, LLine);
    LData.NodeName := ExtractText(LPLineText, CWHITESPACE + ['=', '/', #0, '>']);
    LData.BlockEnd := GetTextPosition(LChar, LLine);

    LNode := VirtualDrawTree.AddChild(LNode);
    LData := VirtualDrawTree.GetNodeData(LNode);
    LData.NodeType := ntAttribute;
    LData.BlockBegin := GetTextPosition(LChar, LLine);
    LData.NodeName := ExtractText(LPLineText, CWHITESPACE + ['=', '/', #0, '>']);
    LData.BlockEnd := GetTextPosition(LChar, LLine);
  end;

  procedure ReadDocTypeItems;
  begin
    while (LPLineText^ <> #0) and (LPLineText^ <> ']') do
    begin
      if StrLComp(LPLineText, '<!--', 4) = 0 then
        ReadComment
      else
      if StrLComp(LPLineText, '<!', 2) = 0 then
        ReadDocTypeItem;
      IncChar;
    end;
  end;

  procedure ReadDoctype;
  begin
    IncChar(2); { '<!' }

    if LNodeStack.Count > 0 then
      LNode := VirtualDrawTree.AddChild(LNodeStack.Peek)
    else
      LNode := VirtualDrawTree.AddChild(nil);
    LData := VirtualDrawTree.GetNodeData(LNode);
    LData.NodeType := ntElement;
    LData.BlockBegin := GetTextPosition(LChar, LLine);
    LData.NodeName := 'DOCTYPE';
    IncChar(7); { DOCTYPE }
    LData.BlockEnd := GetTextPosition(LChar, LLine);
    LNodeStack.Push(LNode);

    LNode := VirtualDrawTree.AddChild(LNode);
    LData := VirtualDrawTree.GetNodeData(LNode);
    LData.NodeType := ntAttribute;
    LData.BlockBegin := GetTextPosition(LChar, LLine);
    LData.NodeName := ExtractText(LPLineText, CWHITESPACE + ['=', '/', #0, '>']);
    LData.BlockEnd := GetTextPosition(LChar, LLine);

    while (LPLineText^ <> #0) and (LPLineText^ <> '>') do
    begin
      if StrLComp(LPLineText, '[', 1) = 0 then
        ReadDocTypeItems;
      IncChar;
    end;
    LNodeStack.Pop; { DOCTYPE }
  end;

  procedure ReadCData;
  begin
    if LNodeStack.Count > 0 then
      LNode := VirtualDrawTree.AddChild(LNodeStack.Peek)
    else
      LNode := VirtualDrawTree.AddChild(nil);
    LData := VirtualDrawTree.GetNodeData(LNode);
    LData.NodeType := ntComment;
    LData.BlockBegin := GetTextPosition(LChar, LLine);
    LData.NodeName := 'CDATA';
    while (LPLineText^ <> #0) and (StrLComp(LPLineText, ']]>', 3) <> 0) do
      IncChar;
    IncChar(3); { ']]>' }
    LData.BlockEnd := GetTextPosition(LChar, LLine);
  end;

  procedure ReadStartTag;
  begin
    IncChar; { '<' }
    if LNodeStack.Count > 0 then
      LNode := VirtualDrawTree.AddChild(LNodeStack.Peek)
    else
      LNode := VirtualDrawTree.AddChild(nil);
    LData := VirtualDrawTree.GetNodeData(LNode);
    LData.NodeType := ntElement;
    LData.BlockBegin := GetTextPosition(LChar, LLine);
    LData.NodeName := ExtractText(LPLineText, CWHITESPACE + ['=', '/', #0, '>']);
    LData.BlockEnd := GetTextPosition(LChar, LLine);
    if LPLineText^ <> '/' then
    begin
      LNodeStack.Push(LNode);
      ReadAttributes;
      //PopAttribute;
    end;
  end;

  procedure ReadEndTag;
  begin
    IncChar(2); { '</' }
    ExtractText(LPLineText, CWHITESPACE + ['=', '/', #0, '>']); { skip tag }
    if LNodeStack.Count > 0 then
      LNodeStack.Pop;
  end;

  procedure ProcessLines;
  begin
    LChar := 1;
    while LPLineText^ <> #0 do
    begin
      while CharInSet(LPLineText^, [#8, #10, #13, #32]) do
        IncChar;

      if StrLComp(LPLineText, '<?xml ', 6) = 0 then
        ReadProlog
      else
      if StrLComp(LPLineText, '<?', 2) = 0 then
        ReadProcessingInstruction
      else
      if StrLComp(LPLineText, '<!--', 4) = 0 then
        ReadComment
      else
      if StrLComp(LPLineText, '<!DOCTYPE', 9) = 0 then
        ReadDoctype
      else
      if StrLComp(LPLineText, '<![CDATA[', 9) = 0 then
        ReadCData
      else
      if StrLComp(LPLineText, '</', 2) = 0 then
        ReadEndTag
      else
      if StrLComp(LPLineText, '<', 1) = 0 then
        ReadStartTag;

      IncChar;
    end;
  end;

begin
  LNodeStack := TStack<PVirtualNode>.Create;
  try
    FXMLNodeCount := 0;
    LLine := 1;
    LPLineText := pChar(XML);

    VirtualDrawTree.Clear;
    VirtualDrawTree.NodeDataSize := SizeOf(TXMLTreeRec);
    VirtualDrawTree.BeginUpdate;

    LLines := TStringList.Create;
    try
      LLines.Text := XML;
      FProgressBar.Count := LLines.Count;
    finally
      LLines.Free;
    end;
    FProgressBar.Show;
    ProcessLines;
    FProgressBar.Hide;

    VirtualDrawTree.Expanded[VirtualDrawTree.GetFirst] := True;
    VirtualDrawTree.EndUpdate;
    Editor.CaretZero;
  finally
    LNodeStack.Free;
  end;
end;

end.
