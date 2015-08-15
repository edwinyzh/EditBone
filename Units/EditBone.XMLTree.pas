unit EditBone.XMLTree;

interface

uses
  VirtualTrees, Vcl.Graphics, Vcl.ImgList, System.Classes, BCEditor.Editor, BCControls.ProgressBar, BCEditor.Types,
  sCommonData, System.UITypes;

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

  TEBXMLTree = class(TVirtualDrawTree)
  private
    FCommonData: TsCtrlSkinData;
    FEditor: TBCEditor;
    FProgressBar: TBCProgressBar;
  protected
    procedure DoNodeClick(const HitInfo: THitInfo); override;
    procedure DoPaintNode(var PaintInfo: TVTPaintInfo); override;
    procedure DoFreeNode(Node: PVirtualNode); override;
    function DoGetNodeWidth(Node: PVirtualNode; Column: TColumnIndex; Canvas: TCanvas = nil): Integer; override;
    procedure DoInitNode(Parent, Node: PVirtualNode; var InitStates: TVirtualNodeInitStates); override;
    //function DoGetImageIndex(Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex;
     // var Ghosted: Boolean; var Index: TImageIndex): TCustomImageList; override;
    function DoGetImageIndex(Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex;
      var Ghosted: Boolean; var Index: Integer): TCustomImageList; override;
    procedure CreateWnd; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure LoadFromXML(AXML: string);
    property ProgressBar: TBCProgressBar read FProgressBar write FProgressBar;
    property Editor: TBCEditor read FEditor write FEditor;
    property SkinData: TsCtrlSkinData read FCommonData write FCommonData;
  end;

implementation

uses
  Winapi.Windows, System.SysUtils, System.Generics.Collections, System.Types, BCEditor.Editor.Utils, VirtualTrees.Utils;

const
  CWHITESPACE = [#32, #9];

constructor TEBXMLTree.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FCommonData := TsCtrlSkinData.Create(Self, True);
end;

destructor TEBXMLTree.Destroy;
begin
  if Assigned(FCommonData) then
    FreeAndNil(FCommonData);

  inherited Destroy;
end;

procedure TEBXMLTree.CreateWnd;
begin
  inherited;
  FCommonData.Loaded;

  if HandleAllocated and FCommonData.Skinned then begin
    if not FCommonData.CustomColor then
      Color := FCommonData.SkinManager.gd[FCommonData.SkinIndex].Props[0].Color;

    if not FCommonData.CustomFont then
      Font.Color := FCommonData.SkinManager.gd[FCommonData.SkinIndex].Props[0].FontColor.Color;
  end;
end;

procedure TEBXMLTree.LoadFromXML(AXML: string);
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
    LData := GetNodeData(LNodeStack.Peek);
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

            LNode := AddChild(LNodeStack.Peek);
            LData := GetNodeData(LNode);
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
              LNode := AddChild(LNodeStack.Pop);
              LData := GetNodeData(LNode);
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
    LNode := AddChild(nil);
    LData := GetNodeData(LNode);
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
    LNode := AddChild(nil);
    LData := GetNodeData(LNode);
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
      LNode := AddChild(LNodeStack.Peek)
    else
      LNode := AddChild(nil);
    LData := GetNodeData(LNode);
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
    LNode := AddChild(LNodeStack.Peek);
    LData := GetNodeData(LNode);
    LData.NodeType := ntElement;
    LData.BlockBegin := GetTextPosition(LChar, LLine);
    LData.NodeName := ExtractText(LPLineText, CWHITESPACE + ['=', '/', #0, '>']);
    LData.BlockEnd := GetTextPosition(LChar, LLine);

    LNode := AddChild(LNode);
    LData := GetNodeData(LNode);
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
      LNode := AddChild(LNodeStack.Peek)
    else
      LNode := AddChild(nil);
    LData := GetNodeData(LNode);
    LData.NodeType := ntElement;
    LData.BlockBegin := GetTextPosition(LChar, LLine);
    LData.NodeName := 'DOCTYPE';
    IncChar(7); { DOCTYPE }
    LData.BlockEnd := GetTextPosition(LChar, LLine);
    LNodeStack.Push(LNode);

    LNode := AddChild(LNode);
    LData := GetNodeData(LNode);
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
      LNode := AddChild(LNodeStack.Peek)
    else
      LNode := AddChild(nil);
    LData := GetNodeData(LNode);
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
      LNode := AddChild(LNodeStack.Peek)
    else
      LNode := AddChild(nil);
    LData := GetNodeData(LNode);
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
    LLine := 1;
    LPLineText := PChar(AXML);

    Clear;
    NodeDataSize := SizeOf(TXMLTreeRec);
    BeginUpdate;

    LLines := TStringList.Create;
    try
      LLines.Text := AXML;
      FProgressBar.Count := LLines.Count;
    finally
      LLines.Free;
    end;
    FProgressBar.Show;
    ProcessLines;
    FProgressBar.Hide;

    Expanded[GetFirst] := True;
    EndUpdate;
    Editor.CaretZero;
  finally
    LNodeStack.Free;
  end;
end;

procedure TEBXMLTree.DoNodeClick(const HitInfo: THitInfo);
var
  SelectedNode: PVirtualNode;
  Data: PXMLTreeRec;
begin
  inherited;
  SelectedNode := HitInfo.HitNode; //VirtualDrawTree.GetFirstSelected;
  if Assigned(SelectedNode) then
  begin
    Data := GetNodeData(SelectedNode);
    Editor.DisplayCaretX := Data.BlockBegin.Char;
    Editor.DisplayCaretY := Data.BlockBegin.Line;
    Editor.EnsureCursorPositionVisible(True);
    Editor.SelectionBeginPosition := Data.BlockBegin;
    Editor.SelectionEndPosition := Data.BlockEnd;
  end;
end;

procedure TEBXMLTree.DoPaintNode(var PaintInfo: TVTPaintInfo);
var
  TreeNode: PXMLTreeRec;
  S: string;
  R: TRect;
  Format: Cardinal;
begin
  with PaintInfo do
  begin
    TreeNode := GetNodeData(Node);

    if not Assigned(TreeNode) then
      Exit;

    if Assigned(FCommonData) then
      Canvas.Font.Color := FCommonData.SkinManager.GetActiveEditFontColor
    else
      Canvas.Font.Color := clWindowText;

    if vsSelected in PaintInfo.Node.States then
    begin
      if Assigned(SkinData) and Assigned(SkinData.SkinManager) and SkinData.SkinManager.Active then
      begin
        Canvas.Brush.Color := SkinData.SkinManager.GetHighLightColor;
        Canvas.Font.Color := SkinData.SkinManager.GetHighLightFontColor
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

procedure TEBXMLTree.DoFreeNode(Node: PVirtualNode);
var
  Data: PXMLTreeRec;
begin
  Data := GetNodeData(Node);
  Finalize(Data^);
  inherited;
end;

function TEBXMLTree.DoGetImageIndex(Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex;
  var Ghosted: Boolean; var Index: Integer): TCustomImageList;
//function TEBXMLTree.DoGetImageIndex(Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex;
//  var Ghosted: Boolean; var Index: TImageIndex): TCustomImageList;
var
  Data: PXMLTreeRec;
begin
  Result := nil;
  if Kind in [ikNormal, ikSelected] then
  begin
    Data := GetNodeData(Node);
    Index := Ord(Data.NodeType);
  end;
end;

function TEBXMLTree.DoGetNodeWidth(Node: PVirtualNode; Column: TColumnIndex; Canvas: TCanvas = nil): Integer;
var
  Data: PXMLTreeRec;
  AMargin: Integer;
begin
  Result := 0;
  AMargin := TextMargin;
  Data := GetNodeData(Node);
  if Assigned(Data) and Assigned(Canvas) then
    Result := Canvas.TextWidth(Data.NodeName) + 2 * AMargin
end;

procedure TEBXMLTree.DoInitNode(Parent, Node: PVirtualNode; var InitStates: TVirtualNodeInitStates);
var
  Data: PXMLTreeRec;
begin
  inherited;
  Data := GetNodeData(Node);
  if Assigned(Data) then
    if Data.HasChildNodes then
      Include(InitStates, ivsHasChildren);
end;

end.
