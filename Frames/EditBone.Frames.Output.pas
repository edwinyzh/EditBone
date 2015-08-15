unit EditBone.Frames.Output;

interface

uses
  Winapi.Windows, System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Buttons, Vcl.ComCtrls,
  Vcl.ActnList, Vcl.Menus, VirtualTrees, Vcl.PlatformDefaultStyleActnCtrls,
  EditBone.Frames.Output.TabSheet, BCControls.PageControl, System.Actions, BCCommon.Images, sPageControl,
  sFrameAdapter;

type
  TOpenAllEvent = procedure(var FileNames: TStrings);

  TOutputFrame = class(TFrame)
    ActionCloseAllOtherPages: TAction;
    ActionCopyAllToClipboard: TAction;
    ActionCopySelectedToClipboard: TAction;
    ActionList: TActionList;
    ActionOpenAll: TAction;
    ActionOpenSelected: TAction;
    ActionOutputClose: TAction;
    ActionOutputCloseAll: TAction;
    ActionSelectAll: TAction;
    ActionUnselectAll: TAction;
    FrameAdapter: TsFrameAdapter;
    MenuItemClose: TMenuItem;
    MenuItemCloseAll: TMenuItem;
    MenuItemCloseAllOtherPages: TMenuItem;
    MenuItemCopySelectedToClipboard: TMenuItem;
    MenuItemCopyToClipboard: TMenuItem;
    MenuItemOpenAll: TMenuItem;
    MenuItemOpenSelected: TMenuItem;
    MenuItemSelectAll: TMenuItem;
    MenuItemSeparator1: TMenuItem;
    MenuItemSeparator2: TMenuItem;
    MenuItemSeparator3: TMenuItem;
    MenuItemUnselectAll: TMenuItem;
    PageControl: TBCPageControl;
    PopupMenu: TPopupMenu;
    procedure ActionCloseAllOtherPagesExecute(Sender: TObject);
    procedure ActionOutputCloseExecute(Sender: TObject);
    procedure ActionOutputCloseAllExecute(Sender: TObject);
    procedure TabsheetDblClick(Sender: TObject);
    procedure VirtualDrawTreeDrawNode(Sender: TBaseVirtualTree; const PaintInfo: TVTPaintInfo);
    procedure VirtualDrawTreeFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure VirtualDrawTreeGetNodeWidth(Sender: TBaseVirtualTree; HintCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex; var NodeWidth: Integer);
    procedure PageControlCloseButtonClick(Sender: TComponent; TabIndex: Integer; var CanClose: Boolean;
      var Action: TacCloseAction);
    procedure PageControlDblClick(Sender: TObject);
    procedure ActionCopyAllToClipboardExecute(Sender: TObject);
    procedure ActionOpenAllExecute(Sender: TObject);
    procedure PageControlMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ActionOpenSelectedExecute(Sender: TObject);
    procedure ActionCopySelectedToClipboardExecute(Sender: TObject);
    procedure ActionSelectAllExecute(Sender: TObject);
    procedure ActionUnselectAllExecute(Sender: TObject);
  private
    FCancelSearch: Boolean;
    FProcessingTabSheet: Boolean;
    FProcessingPage: TsTabSheet;
    FTabsheetDblClick: TNotifyEvent;
    FOpenAll: TOpenAllEvent;
    FRootNode: PVirtualNode;
    function GetCount: Integer;
    function GetIsAnyOutput: Boolean;
    function GetIsEmpty: Boolean;
    function GetOutputTabSheetFrame(TabSheet: TsTabSheet): TOutputTabSheetFrame;
    function TabFound(TabCaption: string): Boolean;
    procedure CloseAllOtherTabSheets;
    procedure CloseAllTabSheets;
    procedure CopyToClipboard(OnlySelected: Boolean = False);
    procedure SetProcessingTabSheet(Value: Boolean);
    procedure OpenFiles(OnlySelected: Boolean = False);
    procedure SetCheckedState(Value: TCheckState);
    function CheckCancel(ATabIndex: Integer = -1): Boolean;
  public
    constructor Create(AOwner: TComponent); override;
    function CloseTabSheet(AFreePage: Boolean = True; ATabIndex: Integer = -1): Boolean;
    function SelectedLine(var Filename: string; var Ln: LongWord; var Ch: LongWord): Boolean;
    function AddTreeView(TabCaption: string): TVirtualDrawTree;
    procedure AddTreeViewLine(OutputTreeView: TVirtualDrawTree; Filename: WideString; Ln, Ch: LongInt; Text: WideString; SearchString: WideString = '');
    procedure ReadOutputFile;
    procedure SetOptions;
    procedure WriteOutputFile;
    property Count: Integer read GetCount;
    property IsAnyOutput: Boolean read GetIsAnyOutput;
    property IsEmpty: Boolean read GetIsEmpty;
    property OnTabsheetDblClick: TNotifyEvent read FTabsheetDblClick write FTabsheetDblClick;
    property OnOpenAll: TOpenAllEvent read FOpenAll write FOpenAll;
    property ProcessingTabSheet: Boolean read FProcessingTabSheet write SetProcessingTabSheet;
    property CancelSearch: Boolean read FCancelSearch write FCancelSearch;
  end;

implementation

{$R *.dfm}

uses
  EditBone.Types, BCCommon.Options.Container, System.Math, System.UITypes, Vcl.Clipbrd, BCCommon.Messages,
  BCCommon.Language.Strings, BCCommon.FileUtils, BCCommon.Consts, BCCommon.StringUtils, System.Types;

constructor TOutputFrame.Create(AOwner: TComponent);
begin
  inherited;
  { IDE can lose there properties }
  ActionList.Images := ImagesDataModule.ImageListSmall;
  PopupMenu.Images := ImagesDataModule.ImageListSmall;
end;

procedure TOutputFrame.ActionOpenAllExecute(Sender: TObject);
begin
  OpenFiles;
end;

procedure TOutputFrame.ActionOutputCloseExecute(Sender: TObject);
begin
  CloseTabSheet;
end;

procedure TOutputFrame.ActionOutputCloseAllExecute(Sender: TObject);
begin
  CloseAllTabSheets;
end;

procedure TOutputFrame.PageControlCloseButtonClick(Sender: TComponent; TabIndex: Integer; var CanClose: Boolean;
  var Action: TacCloseAction);
begin
  if CloseTabSheet(False, TabIndex) then
  begin
    Application.ProcessMessages;
    Action := acaFree
  end
  else
    CanClose := False;
end;

procedure TOutputFrame.PageControlDblClick(Sender: TObject);
begin
  if OptionsContainer.OutputCloseTabByDblClick then
    ActionOutputClose.Execute;
end;

procedure TOutputFrame.PageControlMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if (Button = mbMiddle) and OptionsContainer.OutputCloseTabByMiddleClick then
    ActionOutputClose.Execute;
end;

procedure TOutputFrame.TabsheetDblClick(Sender: TObject);
begin
  if Assigned(FTabsheetDblClick) then
    FTabsheetDblClick(Sender);
end;

procedure TOutputFrame.OpenFiles(OnlySelected: Boolean);
var
  FileNames: TStrings;

  procedure GetFileNames;
  var
    OutputTreeView: TVirtualDrawTree;
    Node: PVirtualNode;
    Data: POutputRec;
  begin
    OutputTreeView := GetOutputTabSheetFrame(PageControl.ActivePage).VirtualDrawTree;
    Node := OutputTreeView.GetFirst;
    while Assigned(Node) do
    begin
      if not OnlySelected or OnlySelected and (OutputTreeView.CheckState[Node] = csCheckedNormal) then
      begin
        Data := OutputTreeView.GetNodeData(Node);
        FileNames.Add(Data.FileName);
      end;
      Node := Node.NextSibling;
    end;
  end;

begin
  if Assigned(FOpenAll) then
  begin
    FileNames := TStringList.Create;
    try
      GetFileNames;
      FOpenAll(FileNames);
    finally
      FileNames.Free;
    end;
  end;
end;

procedure TOutputFrame.ActionOpenSelectedExecute(Sender: TObject);
begin
  OpenFiles(True);
end;

function TOutputFrame.TabFound(TabCaption: string): Boolean;
var
  i: Integer;
begin
  Result := False;
  { check if there already is a tab with same name }
  for i := 0 to PageControl.PageCount - 1 do
    if Trim(PageControl.Pages[i].Caption) = TabCaption then
    begin
      PageControl.ActivePageIndex := i;
      Result := True;
      Break;
    end;
end;

function TOutputFrame.AddTreeView(TabCaption: string): TVirtualDrawTree;
var
  TabSheet: TsTabSheet;
  OutputTabSheetFrame: TOutputTabSheetFrame;
begin
  { check if there already is a tab with same name }
  if TabFound(StringReplace(TabCaption, '&', '&&', [rfReplaceAll])) then
  begin
    Result := GetOutputTabSheetFrame(PageControl.ActivePage).VirtualDrawTree;
    if Assigned(Result) then
    begin
      Result.Clear;
      Result.Tag := 0;
    end;
    Exit;
  end;

  TabSheet := TsTabSheet.Create(PageControl);
  TabSheet.PageControl := PageControl;
  TabSheet.TabVisible := False;
  TabSheet.ImageIndex := IMAGE_INDEX_FIND_IN_FILES;
  TabSheet.Caption := StringReplace(TabCaption, '&', '&&', [rfReplaceAll]);
  PageControl.ActivePage := TabSheet;

  OutputTabSheetFrame := TOutputTabSheetFrame.Create(TabSheet);
  with OutputTabSheetFrame do
  begin
    Parent := TabSheet;
    with VirtualDrawTree do
    begin
      OnDrawNode := VirtualDrawTreeDrawNode;
      OnFreeNode := VirtualDrawTreeFreeNode;
      OnGetNodeWidth := VirtualDrawTreeGetNodeWidth;
      OnDblClick := TabsheetDblClick;
      NodeDataSize := SizeOf(TOutputRec);
    end;
    Result := VirtualDrawTree;
  end;
  TabSheet.TabVisible := True;
end;

procedure TOutputFrame.VirtualDrawTreeDrawNode(Sender: TBaseVirtualTree;
  const PaintInfo: TVTPaintInfo);
var
  Data: POutputRec;
  S, Temp: string;
  R: TRect;
  Format: Cardinal;
  LColor: TColor;
begin
  with Sender as TVirtualDrawTree, PaintInfo do
  begin
    Data := Sender.GetNodeData(Node);

    if not Assigned(Data) then
      Exit;

    if Assigned(FrameAdapter.SkinData) then
      LColor := FrameAdapter.SkinData.SkinManager.GetActiveEditFontColor
    else
      LColor := clWindowText;

    if vsSelected in PaintInfo.Node.States then
    begin
      if Assigned(FrameAdapter.SkinData) then
      begin
        Canvas.Brush.Color := FrameAdapter.SkinData.SkinManager.GetHighLightColor;
        LColor := FrameAdapter.SkinData.SkinManager.GetHighLightFontColor
      end
      else
      begin
        Canvas.Brush.Color := clHighlight;
        LColor := clHighlightText;
      end;
    end;
    Canvas.Font.Color := LColor;

    if Data.Level = 0 then
      Canvas.Font.Style := Canvas.Font.Style + [fsBold]
    else
      Canvas.Font.Style := Canvas.Font.Style - [fsBold];

    SetBKMode(Canvas.Handle, TRANSPARENT);

    R := ContentRect;
    InflateRect(R, -TextMargin, 0);
    Dec(R.Right);
    Dec(R.Bottom);
    if Data.Level = 2 then
      R.Left := 4;

    if (Data.Level = 0) or (Data.Level = 2) then
      S := Data.Filename
    else
      S := String(Data.Text);

    if Length(S) > 0 then
    begin
      Format := DT_TOP or DT_LEFT or DT_VCENTER or DT_SINGLELINE;
      if (Data.Level = 0) or (Data.Level = 2) or (Data.SearchString = '') then
      begin
        if Data.Level = 0 then
          S := System.SysUtils.Format('%s [%d]', [S, Node.ChildCount]);
        if Data.Level = 1 then
          S := System.SysUtils.Format('%s (%d, %d): ', [ExtractFilename(String(Data.Filename)), Data.Ln + OptionsContainer.LeftMarginLineNumbersStartFrom, Data.Ch]) + S;
        DrawText(Canvas.Handle, S, Length(S), R, Format)
      end
      else
      begin
        S := String(Data.Text);
        S := System.Copy(S, 0, Data.TextCh - 1);

        S := System.SysUtils.Format('%s (%d, %d): ', [ExtractFilename(String(Data.Filename)), Data.Ln + OptionsContainer.LeftMarginLineNumbersStartFrom, Data.Ch]) + S;

        DrawText(Canvas.Handle, S, Length(S), R, Format);
        S := StringReplace(S, Chr(9), '', [rfReplaceAll]); { replace tabs }
        R.Left := R.Left + Canvas.TextWidth(S);
        Canvas.Font.Color := clRed;
        S := Copy(String(Data.Text), Data.TextCh, Length(Data.SearchString));
        Temp := StringReplace(S, '&', '&&', [rfReplaceAll]);
        Canvas.Font.Style := Canvas.Font.Style + [fsBold];
        DrawText(Canvas.Handle, Temp, Length(Temp), R, Format);
        Canvas.Font.Color := LColor;
        R.Left := R.Left + Canvas.TextWidth(S);
        Canvas.Font.Style := Canvas.Font.Style - [fsBold];
        S := System.Copy(Data.Text, Integer(Data.TextCh) + Integer(System.Length(Data.SearchString)), Length(Data.Text));
        DrawText(Canvas.Handle, S, Length(S), R, Format);
      end;
    end;
  end;
end;

procedure TOutputFrame.VirtualDrawTreeGetNodeWidth(Sender: TBaseVirtualTree;
  HintCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex; var NodeWidth: Integer);
var
  Data: POutputRec;
  AMargin, BoldWidth: Integer;
  S: string;
begin
  with Sender as TVirtualDrawTree do
  begin
    AMargin := TextMargin;
    Data := Sender.GetNodeData(Node);
    if Assigned(Data) then
    case Data.Level of
      0: begin
           Canvas.Font.Style := Canvas.Font.Style + [fsBold];
           NodeWidth := Canvas.TextWidth(Trim(Format('%s [%d]', [String(Data.FileName), Node.ChildCount]))) + 2 * AMargin;
         end;
      1: begin
           S := System.SysUtils.Format('%s (%d, %d): ', [ExtractFilename(String(Data.Filename)), Data.Ln, Data.Ch]);
           Canvas.Font.Style := Canvas.Font.Style + [fsBold];
           BoldWidth := Canvas.TextWidth(String(Data.SearchString));
           Canvas.Font.Style := Canvas.Font.Style - [fsBold];
           BoldWidth := BoldWidth - Canvas.TextWidth(string(Data.SearchString));
           NodeWidth := Canvas.TextWidth(Trim(S + String(Data.Text))) + 2 * AMargin + BoldWidth;
         end;
    end;
  end;
end;

procedure TOutputFrame.VirtualDrawTreeFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
var
  Data: POutputRec;
begin
  Data := Sender.GetNodeData(Node);
  Finalize(Data^);
  inherited;
end;

procedure TOutputFrame.AddTreeViewLine(OutputTreeView: TVirtualDrawTree; Filename: WideString; Ln, Ch: LongInt;
  Text: WideString; SearchString: WideString);
var
  Node, LastNode: PVirtualNode;
  NodeData: POutputRec;
  s: WideString;
begin
  if not FProcessingTabSheet then
    Exit;
  if FCancelSearch then
    Exit;
  if not Assigned(OutputTreeView) then
    Exit;
  OutputTreeView.BeginUpdate;
  LastNode := OutputTreeView.GetLast;
  if Assigned(LastNode) then
  begin
    NodeData := OutputTreeView.GetNodeData(LastNode);
    if (NodeData.Filename <> FileName) or (NodeData.Ln = -1) then
      LastNode := nil;
  end;
  if not Assigned(LastNode) then
  begin
    FRootNode := OutputTreeView.AddChild(nil);
    NodeData := OutputTreeView.GetNodeData(FRootNode);
    NodeData.Level := 0;
    if Ln = -1 then
    begin
      NodeData.Level := 2;
      NodeData.Filename := Text;
    end
    else
      NodeData.Filename := Filename;
  end;
  if Ln <> -1  then
  begin
    Node := OutputTreeView.AddChild(FRootNode);
    NodeData := OutputTreeView.GetNodeData(Node);
    NodeData.Level := 1;
    NodeData.Ln := Ln;
    NodeData.Ch := Ch;
    NodeData.SearchString := SearchString;
    NodeData.Filename := Filename;

    s := Text;

    if NodeData.SearchString <> '' then
    begin
      if Ch > 255 then
      begin
        NodeData.TextCh := 11;
        s := System.Copy(s, Ch - 10, System.Length(s));
      end
      else
        NodeData.TextCh := Ch;
      if System.Length(s) > 255 then
        s := Format('%s...', [System.Copy(s, 0, 251)]);
    end;

    if toAutoExpand in OutputTreeView.TreeOptions.AutoOptions then
      if not OutputTreeView.Expanded[FRootNode] then
        OutputTreeView.FullExpand(FRootNode);

    NodeData.Text := s;
    OutputTreeView.Tag := OutputTreeView.Tag + 1;
  end;
  OutputTreeView.EndUpdate;
  { fix for scrollbar resize bug }
  SetWindowPos(OutputTreeView.Handle, 0, 0, 0, OutputTreeView.Width, OutputTreeView.Height, SWP_DRAWFRAME);
  Application.ProcessMessages;
end;

procedure TOutputFrame.ActionSelectAllExecute(Sender: TObject);
begin
  SetCheckedState(csCheckedNormal);
end;

function TOutputFrame.SelectedLine(var Filename: string; var Ln: LongWord; var Ch: LongWord): Boolean;
var
  Node: PVirtualNode;
  NodeData: POutputRec;
  OutputTreeView: TVirtualDrawTree;
begin
  Result := False;
  OutputTreeView := GetOutputTabSheetFrame(PageControl.ActivePage).VirtualDrawTree;
  if not Assigned(OutputTreeView) then
    Exit;

  Node := OutputTreeView.GetFirstSelected;
  NodeData := OutputTreeView.GetNodeData(Node);

  Result := Assigned(NodeData) and (NodeData.Text <> '');
  if Result then
  begin
    Filename := String(NodeData.Filename);
    Ln := NodeData.Ln;
    Ch := NodeData.Ch;
  end;
end;

function TOutputFrame.GetIsEmpty: Boolean;
var
  OutputTreeView: TVirtualDrawTree;
begin
  Result := True;
  if FCancelSearch then
    Exit;
  OutputTreeView := GetOutputTabSheetFrame(PageControl.ActivePage).VirtualDrawTree;
  if not Assigned(OutputTreeView) then
    Exit;
  Result := OutputTreeView.GetFirst = nil;
end;

function TOutputFrame.GetCount: Integer;
var
  OutputTreeView: TVirtualDrawTree;
begin
  Result := 0;
  if FCancelSearch then
    Exit;
  OutputTreeView := GetOutputTabSheetFrame(PageControl.ActivePage).VirtualDrawTree;
  if not Assigned(OutputTreeView) then
    Exit;
  Result := OutputTreeView.Tag;
end;

procedure TOutputFrame.CopyToClipboard(OnlySelected: Boolean);
var
  OutputTreeView: TVirtualDrawTree;
  Node, ChildNode: PVirtualNode;
  Data, ChildData: POutputRec;
  StringList: TStrings;
begin
  OutputTreeView := GetOutputTabSheetFrame(PageControl.ActivePage).VirtualDrawTree;
  if Assigned(OutputTreeView) then
  begin
    StringList := TStringList.Create;
    try
      Node := OutputTreeView.GetFirst;
      while Assigned(Node) do
      begin
        if not OnlySelected or OnlySelected and (OutputTreeView.CheckState[Node] = csCheckedNormal) then
        begin
          Data := OutputTreeView.GetNodeData(Node);
          StringList.Add(Data.FileName);
          ChildNode := Node.FirstChild;
          while Assigned(ChildNode) do
          begin
            ChildData := OutputTreeView.GetNodeData(ChildNode);
            StringList.Add(System.SysUtils.Format('  %s (%d, %d): %s', [ExtractFilename(String(ChildData.Filename)),
              ChildData.Ln, ChildData.Ch, ChildData.Text]));
            ChildNode := ChildNode.NextSibling;
          end;
        end;
        Node := Node.NextSibling;
      end;
    finally
      Clipboard.AsText := StringList.Text;
      StringList.Free;
    end;
  end;
end;

procedure TOutputFrame.ActionCopyAllToClipboardExecute(Sender: TObject);
begin
  CopyToClipboard;
end;

procedure TOutputFrame.ActionCopySelectedToClipboardExecute(Sender: TObject);
begin
  CopyToClipboard(True);
end;

function TOutputFrame.GetIsAnyOutput: Boolean;
begin
  Result := False;
  if Assigned(PageControl) then
    Result := PageControl.PageCount <> 0;
end;

function TOutputFrame.CheckCancel(ATabIndex: Integer = -1): Boolean;
var
  LTabSheet: TTabSheet;
begin
  Result := False;
  Application.ProcessMessages;
  if ATabIndex <> -1 then
    LTabSheet := PageControl.Pages[ATabIndex]
  else
    LTabSheet := PageControl.ActivePage;
  if FProcessingTabSheet then
    if FProcessingPage = LTabSheet then
    begin
      if AskYesOrNo(LanguageDataModule.GetYesOrNoMessage('CancelSearch')) then
        FCancelSearch := True
      else
        Result := True;
    end;
end;

function TOutputFrame.CloseTabSheet(AFreePage: Boolean = True; ATabIndex: Integer = -1): Boolean;
var
  LActivePageIndex: Integer;
begin
  Result := True;
  if CheckCancel(ATabIndex) then
    Exit(False);
  if PageControl.PageCount > 0 then
  begin
    PageControl.TabClosed := True;

    if ATabIndex = -1 then
      LActivePageIndex := PageControl.ActivePageIndex
    else
      LActivePageIndex := ATabIndex;

    if AFreePage and (PageControl.PageCount > 0) then
    begin
      PageControl.Pages[LActivePageIndex].Free;
      if LActivePageIndex > 0 then
        PageControl.ActivePageIndex := LActivePageIndex - 1
      else
      if PageControl.PageCount > 0 then
        PageControl.ActivePageIndex := 0;
    end
    else
      TsTabSheet(PageControl.Pages[LActivePageIndex]).TabVisible := False;
  end;
end;

procedure TOutputFrame.CloseAllTabSheets;
var
  i, j: Integer;
begin
  if CheckCancel then
    Exit;
  j := PageControl.PageCount - 1;
  for i := j downto 0 do
    PageControl.Pages[i].Free;
end;

procedure TOutputFrame.ActionCloseAllOtherPagesExecute(Sender: TObject);
begin
  CloseAllOtherTabSheets;
end;

procedure TOutputFrame.CloseAllOtherTabSheets;
var
  i, j: Integer;
begin
  if CheckCancel then
    Exit;
  PageControl.ActivePage.PageIndex := 0;
  j := PageControl.PageCount - 1;
  for i := j downto 1 do
    PageControl.Pages[i].Free;
end;

procedure TOutputFrame.SetProcessingTabSheet(Value: Boolean);
begin
  FProcessingTabSheet := Value;
  FProcessingPage := PageControl.ActivePage;
  FCancelSearch := False;
end;

function TOutputFrame.GetOutputTabSheetFrame(TabSheet: TsTabSheet): TOutputTabSheetFrame;
begin
  Result := nil;
  if Assigned(TabSheet) then
    if TabSheet.ComponentCount <> 0 then
      if Assigned(TabSheet.Components[0]) then
        if TabSheet.Components[0] is TOutputTabSheetFrame then
          Result := TOutputTabSheetFrame(TabSheet.Components[0]);
end;

procedure TOutputFrame.SetOptions;
var
  i: Integer;
  VirtualDrawTree: TVirtualDrawTree;
  Node: PVirtualNode;
begin
  PageControl.MultiLine := OptionsContainer.OutputMultiLine;
  PageControl.ShowCloseBtns := OptionsContainer.OutputShowCloseButton;
  PageControl.RightClickSelect := OptionsContainer.OutputRightClickSelect;

  if OptionsContainer.OutputShowImage then
    PageControl.Images := ImagesDataModule.ImageListSmall
  else
    PageControl.Images := nil;
  for i := 0 to PageControl.PageCount - 1 do
  begin
    VirtualDrawTree := TOutputTabSheetFrame(PageControl.Pages[i].Components[0]).VirtualDrawTree;
    VirtualDrawTree.Indent := OptionsContainer.OutputIndent;
    if OptionsContainer.OutputShowTreeLines then
      VirtualDrawTree.TreeOptions.PaintOptions := VirtualDrawTree.TreeOptions.PaintOptions + [toShowTreeLines]
    else
      VirtualDrawTree.TreeOptions.PaintOptions := VirtualDrawTree.TreeOptions.PaintOptions - [toShowTreeLines];

    { check box }
    Node := VirtualDrawTree.GetFirst;
    while Assigned(Node) do
    begin
      VirtualDrawTree.ReinitNode(Node, False);
      Node := VirtualDrawTree.GetNextSibling(Node);
    end;
  end;

  ActionCopySelectedToClipboard.Visible := OptionsContainer.OutputShowCheckBox;
  ActionOpenSelected.Visible := OptionsContainer.OutputShowCheckBox;
  ActionSelectAll.Visible := OptionsContainer.OutputShowCheckBox;
  ActionUnselectAll.Visible := OptionsContainer.OutputShowCheckBox;
end;

procedure TOutputFrame.SetCheckedState(Value: TCheckState);
var
  OutputTreeView: TVirtualDrawTree;
  Node: PVirtualNode;
begin
  OutputTreeView := GetOutputTabSheetFrame(PageControl.ActivePage).VirtualDrawTree;
  Node := OutputTreeView.GetFirst;
  while Assigned(Node) do
  begin
    OutputTreeView.CheckState[Node] := Value;
    Node := Node.NextSibling;
  end;
end;

procedure TOutputFrame.ActionUnselectAllExecute(Sender: TObject);
begin
  SetCheckedState(csUncheckedNormal);
end;

procedure TOutputFrame.ReadOutputFile;
var
  Filename, S: string;
  OutputFile: TextFile;
  VirtualDrawTree: TVirtualDrawTree;
  AFilename, Text, SearchString: WideString;
  Ln, Ch: Cardinal;
begin
  FProcessingTabSheet := True;
  VirtualDrawTree := nil;
  Filename := GetOutFilename;
  if FileExists(Filename) then
  begin
    AssignFile(OutputFile, Filename);
    Reset(OutputFile);
    while not Eof(OutputFile) do
    begin
      Readln(OutputFile, S);
      if Pos('s:', S) = 1 then
        VirtualDrawTree := AddTreeView(Format(LanguageDataModule.GetConstant('SearchFor'), [Copy(S, 3, Length(S))]))
      else
      begin
        if Assigned(VirtualDrawTree) then
        begin
          AFilename := GetNextToken(OUTPUT_FILE_SEPARATOR, S);
          S := RemoveTokenFromStart(OUTPUT_FILE_SEPARATOR, S);
          Ln := StrToInt(GetNextToken(OUTPUT_FILE_SEPARATOR, S));
          S := RemoveTokenFromStart(OUTPUT_FILE_SEPARATOR, S);
          Ch := StrToInt(GetNextToken(OUTPUT_FILE_SEPARATOR, S));
          S := RemoveTokenFromStart(OUTPUT_FILE_SEPARATOR, S);
          Text := GetNextToken(OUTPUT_FILE_SEPARATOR, S);
          S := RemoveTokenFromStart(OUTPUT_FILE_SEPARATOR, S);
          SearchString := S;
          AddTreeViewLine(VirtualDrawTree, AFilename, Ln, Ch, Text, SearchString);
        end;
      end;
    end;
    CloseFile(OutputFile);
  end;
  FProcessingTabSheet := False;
end;

procedure TOutputFrame.WriteOutputFile;
var
  i: Integer;
  Filename: string;
  OutputFile: TextFile;
  Node: PVirtualNode;
  NodeData: POutputRec;
  VirtualDrawTree: TVirtualDrawTree;
begin
  FProcessingTabSheet := True;
  Filename := GetOutFilename;
  if FileExists(Filename) then
    DeleteFile(Filename);
  if OptionsContainer.OutputSaveTabs then
    if PageControl.PageCount > 0 then
    begin
      AssignFile(OutputFile, Filename);
      ReWrite(OutputFile);
      for i := 0 to PageControl.PageCount - 1 do
      begin
        VirtualDrawTree := TOutputTabSheetFrame(PageControl.Pages[i].Components[0]).VirtualDrawTree;
        if Assigned(VirtualDrawTree) then
        begin
          { tab sheet }
          Node := VirtualDrawTree.GetFirst;
          Node := VirtualDrawTree.GetFirstChild(Node);
          if Assigned(Node) then
          begin
            NodeData := VirtualDrawTree.GetNodeData(Node);
            Writeln(OutputFile, Format('s:%s', [NodeData.SearchString]));
          end;
          { data }
          while Assigned(Node) do
          begin
            NodeData := VirtualDrawTree.GetNodeData(Node);
            if NodeData.SearchString <> '' then
              WriteLn(OutputFile, Format('%s%s%d%s%d%s%s%s%s', [NodeData.Filename, OUTPUT_FILE_SEPARATOR, NodeData.Ln,
                OUTPUT_FILE_SEPARATOR, NodeData.Ch, OUTPUT_FILE_SEPARATOR, NodeData.Text, OUTPUT_FILE_SEPARATOR, NodeData.SearchString]));
            Node := VirtualDrawTree.GetNext(Node);
          end;
        end;
      end;
      CloseFile(OutputFile);
    end;
  FProcessingTabSheet := False;
end;

end.
