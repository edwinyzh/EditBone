unit EditBone.Forms.Options;

interface

uses
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, BCCommon.FileUtils, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  System.Classes, System.SysUtils, Vcl.ActnList, BCCommon.Images, BCCommon.Frames.Options.Editor.Color,
  Vcl.ActnMenus, System.Actions, VirtualTrees, BCCommon.Options.Container, System.Generics.Collections,
  sSkinProvider, sScrollBox, BCControls.ScrollBox, BCControls.Splitter, sSplitter, sPanel, BCControls.Panel;

type
  POptionsRec = ^TOptionsRec;
  TOptionsRec = record
    Index: Integer;
    Caption: string;
    ImageIndex: Integer;
  end;

  TOptionsForm = class(TForm)
    ActionCompare: TAction;
    ActionDirectory: TAction;
    ActionDirectoryTabs: TAction;
    ActionEditor: TAction;
    ActionEditorCaret: TAction;
    ActionEditorCodeFolding: TAction;
    ActionEditorColors: TAction;
    ActionEditorCompletionProposal: TAction;
    ActionEditorDefaults: TAction;
    ActionEditorFonts: TAction;
    ActionEditorLeftMargin: TAction;
    ActionEditorMatchingPair: TAction;
    ActionEditorMinimap: TAction;
    ActionEditorRightMargin: TAction;
    ActionEditorScroll: TAction;
    ActionEditorSearch: TAction;
    ActionEditorSelection: TAction;
    ActionEditorSpecialChars: TAction;
    ActionEditorTabs: TAction;
    ActionEditorTabulator: TAction;
    ActionFileTypes: TAction;
    ActionList: TActionList;
    ActionMainMenu: TAction;
    ActionOutput: TAction;
    ActionOutputTabs: TAction;
    ActionPrint: TAction;
    ActionSQLAlignments: TAction;
    ActionSQLCapitalization: TAction;
    ActionSQLFormatter: TAction;
    ActionSQLIndentation: TAction;
    ActionSQLInsert: TAction;
    ActionSQLSelect: TAction;
    ActionSQLUpdate: TAction;
    ActionSQLWhitespace: TAction;
    ActionStatusBar: TAction;
    ActionToolBar: TAction;
    ButtonCancel: TButton;
    ButtonOK: TButton;
    OptionsPanel: TBCPanel;
    PanelButton: TBCPanel;
    PanelTop: TBCPanel;
    ScrollBox: TBCScrollBox;
    SkinProvider: TsSkinProvider;
    Splitter: TBCSplitter;
    VirtualDrawTreeOptions: TVirtualDrawTree;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure VirtualDrawTreeOptionsClick(Sender: TObject);
    procedure VirtualDrawTreeOptionsFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure VirtualDrawTreeOptionsGetImageIndex(Sender: TBaseVirtualTree; Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex; var Ghosted: Boolean; var ImageIndex: Integer);
    procedure VirtualDrawTreeOptionsDrawNode(Sender: TBaseVirtualTree; const PaintInfo: TVTPaintInfo);
    procedure VirtualDrawTreeOptionsGetNodeWidth(Sender: TBaseVirtualTree; HintCanvas: TCanvas; Node: PVirtualNode;
      Column: TColumnIndex; var NodeWidth: Integer);
    procedure VirtualDrawTreeOptionsKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    FActionList: TObjectList<TAction>;
    FSQLFormatterDLLFound: Boolean;
    procedure CreateTree;
    procedure ReadIniFile;
    procedure SaveSelectedTreeNode;
    procedure SetVisibleFrame;
    procedure WriteIniFile;
  public
    function Execute(ActionList: TObjectList<TAction>): Boolean;
  end;

function OptionsForm: TOptionsForm;

implementation

{$R *.dfm}

uses
  BCCommon.Language.Strings, System.IniFiles,  BCCommon.Language.Utils, BCCommon.Utils, Winapi.Windows,
  System.Types, BCCommon.Frames.Options.Editor.Minimap, BCCommon.Frames.Options.Editor.Scroll,
  BCCommon.Frames.Options.Editor.Selection, BCCommon.Frames.Options.Editor.SpecialChars,
  BCCommon.Frames.Options.Editor.Tabulator, EditBone.Frames.Options.Editor.Defaults,
  BCCommon.Options.Container.SQL.Formatter, EditBone.Frames.Options.Editor.TabSheet,
  BCCommon.Frames.Options.Editor.CompletionProposal, BCCommon.Frames.Options.Editor.Caret,
  BCCommon.Frames.Options.Editor.CodeFolding, BCCommon.Frames.Options.Editor.MatchingPair,
  BCCommon.Frames.Options.Editor.Search, BCCommon.Frames.Options.Editor.Options, BCCommon.Frames.Options.Editor.Font,
  BCCommon.Frames.Options.Editor.LeftMargin, BCCommon.Frames.Options.Editor.RightMargin,
  EditBone.Frames.Options.FileTypes, EditBone.Frames.Options.Directory, EditBone.Frames.Options.Directory.TabSheet,
  EditBone.Frames.Options.Output.TabSheet, BCCommon.Frames.Options.Compare,
  BCCommon.Frames.Options.MainMenu, BCCommon.Frames.Options.StatusBar, BCCommon.Frames.Options.Output,
  BCCommon.Frames.Options.ToolBar, BCCommon.Frames.Options.Print, BCCommon.Frames.Options.SQL.Select,
  BCCommon.Frames.Options.SQL.Alignments, BCCommon.Frames.Options.SQL.Insert, BCCommon.Frames.Options.SQL.Update,
  BCCommon.Frames.Options.SQL.Whitespace, BCCommon.Frames.Options.SQL.Capitalization,
  BCCommon.Frames.Options.SQL.Indentation, BCCommon.Frames.Options.SQL.Formatter;

var
  FOptionsForm: TOptionsForm;

{ TOptionsDialog }

function OptionsForm: TOptionsForm;
begin
  if not Assigned(FOptionsForm) then
    Application.CreateForm(TOptionsForm, FOptionsForm);
  Result := FOptionsForm;
end;

procedure TOptionsForm.FormDestroy(Sender: TObject);
begin
  FOptionsForm := nil;
end;

procedure TOptionsForm.CreateTree;
var
  i: Integer;
  Data: POptionsRec;
  Node, ChildNode: PVirtualNode;
begin
  with VirtualDrawTreeOptions do
  begin
    Clear;
    i := 0;
    { Editor }
    Node := AddChild(nil);
    Data := GetNodeData(Node);
    Data.Index := PostInc(i);
    Data.ImageIndex := ActionEditor.ImageIndex;
    Data.Caption := ActionEditor.Caption;
    { Editor caret }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.Index := PostInc(i);
    Data.ImageIndex := ActionEditorCaret.ImageIndex;
    Data.Caption := ActionEditorCaret.Caption;
    { Editor code folding }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.Index := PostInc(i);
    Data.ImageIndex := ActionEditorCodeFolding.ImageIndex;
    Data.Caption := ActionEditorCodeFolding.Caption;
    { Editor color }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.Index := PostInc(i);
    Data.ImageIndex := ActionEditorColors.ImageIndex;
    Data.Caption := ActionEditorColors.Caption;
    { Editor completion proposal }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.Index := PostInc(i);
    Data.ImageIndex := ActionEditorCompletionProposal.ImageIndex;
    Data.Caption := ActionEditorCompletionProposal.Caption;
    { Editor defaults }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.Index := PostInc(i);
    Data.ImageIndex :=  ActionEditorDefaults.ImageIndex;
    Data.Caption :=  ActionEditorDefaults.Caption;
    { Editor font }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.Index := PostInc(i);
    Data.ImageIndex := ActionEditorFonts.ImageIndex;
    Data.Caption := ActionEditorFonts.Caption;
    { Editor left margin }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.Index := PostInc(i);
    Data.ImageIndex := ActionEditorLeftMargin.ImageIndex;
    Data.Caption := ActionEditorLeftMargin.Caption;
    { Editor matching pair }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.Index := PostInc(i);
    Data.ImageIndex := ActionEditorMatchingPair.ImageIndex;
    Data.Caption := ActionEditorMatchingPair.Caption;
    { Editor minimap }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.Index := PostInc(i);
    Data.ImageIndex := ActionEditorMinimap.ImageIndex;
    Data.Caption := ActionEditorMinimap.Caption;
    { Editor right margin }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.Index := PostInc(i);
    Data.ImageIndex := ActionEditorRightMargin.ImageIndex;
    Data.Caption := ActionEditorRightMargin.Caption;
    { Editor scroll }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.Index := PostInc(i);
    Data.ImageIndex := ActionEditorScroll.ImageIndex;
    Data.Caption := ActionEditorScroll.Caption;
    { Editor search }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.Index := PostInc(i);
    Data.ImageIndex := ActionEditorSearch.ImageIndex;
    Data.Caption := ActionEditorSearch.Caption;
    { Editor selection }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.Index := PostInc(i);
    Data.ImageIndex := ActionEditorSelection.ImageIndex;
    Data.Caption := ActionEditorSelection.Caption;
    { Editor special chars }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.Index := PostInc(i);
    Data.ImageIndex := ActionEditorSpecialChars.ImageIndex;
    Data.Caption := ActionEditorSpecialChars.Caption;
    { Editor tabs }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.Index := PostInc(i);
    Data.ImageIndex := ActionEditorTabs.ImageIndex;
    Data.Caption := ActionEditorTabs.Caption;
    { Editor tabulator }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.Index := PostInc(i);
    Data.ImageIndex := ActionEditorTabulator.ImageIndex;
    Data.Caption := ActionEditorTabulator.Caption;

    Node.ChildCount := VirtualDrawTreeOptions.ChildCount[Node];
    VirtualDrawTreeOptions.Selected[Node] := True;
    VirtualDrawTreeOptions.Expanded[Node] := True;
    { Directory }
    Node := AddChild(nil);
    Data := GetNodeData(Node);
    Data.Index := PostInc(i);
    Data.ImageIndex := ActionDirectory.ImageIndex;
    Data.Caption := ActionDirectory.Caption;
    { Directory tabs }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.Index := PostInc(i);
    Data.ImageIndex := ActionDirectoryTabs.ImageIndex;
    Data.Caption := ActionDirectoryTabs.Caption;
    Node.ChildCount := VirtualDrawTreeOptions.ChildCount[Node];
    VirtualDrawTreeOptions.Selected[Node] := True;
    VirtualDrawTreeOptions.Expanded[Node] := True;
    { Output }
    Node := AddChild(nil);
    Data := GetNodeData(Node);
    Data.Index := PostInc(i);
    Data.ImageIndex := ActionOutput.ImageIndex;
    Data.Caption := ActionOutput.Caption;
    { Output tabs }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.Index := PostInc(i);
    Data.ImageIndex := ActionOutputTabs.ImageIndex;
    Data.Caption := ActionOutputTabs.Caption;
    Node.ChildCount := VirtualDrawTreeOptions.ChildCount[Node];
    VirtualDrawTreeOptions.Selected[Node] := True;
    VirtualDrawTreeOptions.Expanded[Node] := True;
    { Compare }
    Node := AddChild(nil);
    Data := GetNodeData(Node);
    Data.Index := PostInc(i);
    Data.ImageIndex := ActionCompare.ImageIndex;
    Data.Caption := ActionCompare.Caption;
    { Print }
    Node := AddChild(nil);
    Data := GetNodeData(Node);
    Data.Index := PostInc(i);
    Data.ImageIndex := ActionPrint.ImageIndex;
    Data.Caption := ActionPrint.Caption;
    { Main menu }
    Node := AddChild(nil);
    Data := GetNodeData(Node);
    Data.Index := PostInc(i);
    Data.ImageIndex := ActionMainMenu.ImageIndex;
    Data.Caption := ActionMainMenu.Caption;
    { Tool Bar }
    Node := AddChild(nil);
    Data := GetNodeData(Node);
    Data.Index := PostInc(i);
    Data.ImageIndex := ActionToolBar.ImageIndex;
    Data.Caption := ActionToolBar.Caption;
    { Status Bar }
    Node := AddChild(nil);
    Data := GetNodeData(Node);
    Data.Index := PostInc(i);
    Data.ImageIndex := ActionStatusBar.ImageIndex;
    Data.Caption := ActionStatusBar.Caption;
    { File types }
    Node := AddChild(nil);
    Data := GetNodeData(Node);
    Data.Index := PostInc(i);
    Data.ImageIndex := ActionFileTypes.ImageIndex;
    Data.Caption := ActionFileTypes.Caption;
    if FSQLFormatterDLLFound then
    begin
      { SQL Formatter }
      Node := AddChild(nil);
      Data := GetNodeData(Node);
      Data.Index := PostInc(i);
      Data.ImageIndex := ActionSQLFormatter.ImageIndex;
      Data.Caption := ActionSQLFormatter.Caption;
      { Alignments }
      ChildNode := AddChild(Node);
      Data := GetNodeData(ChildNode);
      Data.Index := PostInc(i);
      Data.ImageIndex := ActionSQLAlignments.ImageIndex;
      Data.Caption := ActionSQLAlignments.Caption;
      { Capitalization }
      ChildNode := AddChild(Node);
      Data := GetNodeData(ChildNode);
      Data.Index := PostInc(i);
      Data.ImageIndex := ActionSQLCapitalization.ImageIndex;
      Data.Caption := ActionSQLCapitalization.Caption;
      { Indentation }
      ChildNode := AddChild(Node);
      Data := GetNodeData(ChildNode);
      Data.Index := PostInc(i);
      Data.ImageIndex := ActionSQLIndentation.ImageIndex;
      Data.Caption := ActionSQLIndentation.Caption;
      { Insert }
      ChildNode := AddChild(Node);
      Data := GetNodeData(ChildNode);
      Data.Index := PostInc(i);
      Data.ImageIndex := ActionSQLInsert.ImageIndex;
      Data.Caption := ActionSQLInsert.Caption;
      { Select }
      ChildNode := AddChild(Node);
      Data := GetNodeData(ChildNode);
      Data.Index := PostInc(i);
      Data.ImageIndex := ActionSQLSelect.ImageIndex;
      Data.Caption := ActionSQLSelect.Caption;
      { Update }
      ChildNode := AddChild(Node);
      Data := GetNodeData(ChildNode);
      Data.Index := PostInc(i);
      Data.ImageIndex := ActionSQLUpdate.ImageIndex;
      Data.Caption := ActionSQLUpdate.Caption;
      { Whitespace }
      ChildNode := AddChild(Node);
      Data := GetNodeData(ChildNode);
      Data.Index := PostInc(i);
      Data.ImageIndex := ActionSQLWhitespace.ImageIndex;
      Data.Caption := ActionSQLWhitespace.Caption;

      //Node.ChildCount := 7;
      Node.ChildCount := VirtualDrawTreeOptions.ChildCount[Node];
      VirtualDrawTreeOptions.Selected[Node] := True;
      VirtualDrawTreeOptions.Expanded[Node] := True;
    end;

    VirtualDrawTreeOptions.Selected[VirtualDrawTreeOptions.GetFirst] := True;
  end;
end;

function TOptionsForm.Execute(ActionList: TObjectList<TAction>): Boolean;
begin
  FActionList := ActionList;
  try
    ReadIniFile;
    UpdateLanguage(Self, GetSelectedLanguage);
    Result := Showmodal = mrOk;
    WriteIniFile;
    SaveSelectedTreeNode;
  finally
    Free;
  end;
  if Result then
    SQLFormatterOptionsContainer.WriteIniFile; { this is written here because dll is reading settings from the ini file }
end;

procedure TOptionsForm.SaveSelectedTreeNode;
var
  Node: PVirtualNode;
  Data: POptionsRec;
begin
  with TIniFile.Create(GetIniFilename) do
  try
    Node := VirtualDrawTreeOptions.GetFirstSelected;
    Data := VirtualDrawTreeOptions.GetNodeData(Node);
    WriteInteger('Options', 'OptionsSelectedItemIndex', Data.Index);
  finally
    Free;
  end;
end;

procedure TOptionsForm.VirtualDrawTreeOptionsClick(Sender: TObject);
begin
  SetVisibleFrame;
end;

procedure TOptionsForm.VirtualDrawTreeOptionsDrawNode(Sender: TBaseVirtualTree; const PaintInfo: TVTPaintInfo);
var
  Data: POptionsRec;
  S: string;
  R: TRect;
  Format: Cardinal;
begin
  with Sender as TVirtualDrawTree, PaintInfo do
  begin
    Data := Sender.GetNodeData(Node);

    if not Assigned(Data) then
      Exit;

    if Assigned(SkinProvider.SkinData) and Assigned(SkinProvider.SkinData.SkinManager) then
      Canvas.Font.Color := SkinProvider.SkinData.SkinManager.GetActiveEditFontColor
    else
      Canvas.Font.Color := clWindowText;

    if vsSelected in PaintInfo.Node.States then
    begin
      if Assigned(SkinProvider.SkinData) and Assigned(SkinProvider.SkinData.SkinManager) then
      begin
        Canvas.Brush.Color := SkinProvider.SkinData.SkinManager.GetHighLightColor;
        Canvas.Font.Color := SkinProvider.SkinData.SkinManager.GetHighLightFontColor
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
    S := Data.Caption;

    if Length(S) > 0 then
    begin
      Format := DT_TOP or DT_LEFT or DT_VCENTER or DT_SINGLELINE;
      DrawText(Canvas.Handle, S, Length(S), R, Format)
    end;
  end;
end;

procedure TOptionsForm.SetVisibleFrame;
var
  i, Level, ParentIndex: Integer;
  TreeNode: PVirtualNode;
begin
  inherited;
  TreeNode := VirtualDrawTreeOptions.GetFirstSelected;
  if Assigned(TreeNode) then
  begin
    Level := VirtualDrawTreeOptions.GetNodeLevel(TreeNode);
    ParentIndex := -1;
    if Level = 1 then
      ParentIndex := TreeNode.Parent.Index;
    for i := 0 to ComponentCount - 1 do
      if Components[i] is TFrame then
        (Components[i] as TFrame).Hide;

    { don't set the visibility value with the condition because the frame is created }
    if (Level = 0) and (TreeNode.Index = 0) then
      OptionsEditorOptionsFrame(Self).ShowFrame;
    if (ParentIndex = 0) and (Level = 1) and (TreeNode.Index = 0) then
      OptionsEditorCaretFrame(Self).ShowFrame;
    if (ParentIndex = 0) and (Level = 1) and (TreeNode.Index = 1) then
      OptionsEditorCodeFoldingFrame(Self).ShowFrame;
    if (ParentIndex = 0) and (Level = 1) and (TreeNode.Index = 2) then
      OptionsEditorColorFrame(Self).ShowFrame;
    if (ParentIndex = 0) and (Level = 1) and (TreeNode.Index = 3) then
      OptionsEditorCompletionProposalFrame(Self).ShowFrame;
    if (ParentIndex = 0) and (Level = 1) and (TreeNode.Index = 4) then
      OptionsEditorDefaultsFrame(Self).ShowFrame;
    if (ParentIndex = 0) and (Level = 1) and (TreeNode.Index = 5) then
      OptionsEditorFontFrame(Self).ShowFrame;
    if (ParentIndex = 0) and (Level = 1) and (TreeNode.Index = 6) then
      OptionsEditorLeftMarginFrame(Self).ShowFrame;
    if (ParentIndex = 0) and (Level = 1) and (TreeNode.Index = 7) then
      OptionsEditorMatchingPairFrame(Self).ShowFrame;
    if (ParentIndex = 0) and (Level = 1) and (TreeNode.Index = 8) then
      OptionsEditorMinimapFrame(Self).ShowFrame;
    if (ParentIndex = 0) and (Level = 1) and (TreeNode.Index = 9) then
      OptionsEditorRightMarginFrame(Self).ShowFrame;
    if (ParentIndex = 0) and (Level = 1) and (TreeNode.Index = 10) then
      OptionsEditorScrollFrame(Self).ShowFrame;
    if (ParentIndex = 0) and (Level = 1) and (TreeNode.Index = 11) then
      OptionsEditorSearchFrame(Self).ShowFrame;
    if (ParentIndex = 0) and (Level = 1) and (TreeNode.Index = 12) then
      OptionsEditorSelectionFrame(Self).ShowFrame;
    if (ParentIndex = 0) and (Level = 1) and (TreeNode.Index = 13) then
      OptionsEditorSpecialCharsFrame(Self).ShowFrame;
    if (ParentIndex = 0) and (Level = 1) and (TreeNode.Index = 14) then
      OptionsEditorTabsFrame(Self).ShowFrame;
    if (ParentIndex = 0) and (Level = 1) and (TreeNode.Index = 15) then
      OptionsEditorTabulatorFrame(Self).ShowFrame;
    if (Level = 0) and (TreeNode.Index = 1) then
      OptionsDirectoryFrame(Self).ShowFrame;
    if (ParentIndex = 1) and (Level = 1) and (TreeNode.Index = 0) then
      OptionsDirectoryTabsFrame(Self).ShowFrame;
    if (Level = 0) and (TreeNode.Index = 2) then
      OptionsOutputFrame(Self).ShowFrame;
    if (ParentIndex = 2) and (Level = 1) and (TreeNode.Index = 0) then
      OptionsOutputTabsFrame(Self).ShowFrame;
    if (Level = 0) and (TreeNode.Index = 3) then
      OptionsCompareFrame(Self).ShowFrame;
    if (Level = 0) and (TreeNode.Index = 4) then
      OptionsPrintFrame(Self).ShowFrame;
    if (Level = 0) and (TreeNode.Index = 5) then
      OptionsMainMenuFrame(Self).ShowFrame;
    if (Level = 0) and (TreeNode.Index = 6) then
      OptionsToolBarFrame(Self, FActionList).Show;
    if (Level = 0) and (TreeNode.Index = 7) then
      OptionsStatusBarFrame(Self).ShowFrame;
    if (Level = 0) and (TreeNode.Index = 8) then
      OptionsFileTypesFrame(Self).ShowFrame;
    if FSQLFormatterDLLFound then
    begin
      { SQL Formatter options }
      if (Level = 0) and (TreeNode.Index = 9) then
        OptionsSQLFormatterFrame(Self).ShowFrame;
      if (ParentIndex = 9) and (Level = 1) and (TreeNode.Index = 0) then
        OptionsSQLAlignmentsFrame(Self).ShowFrame;
      if (ParentIndex = 9) and (Level = 1) and (TreeNode.Index = 1) then
        OptionsSQLCapitalizationFrame(Self).ShowFrame;
      if (ParentIndex = 9) and (Level = 1) and (TreeNode.Index = 2) then
        OptionsSQLIndentationFrame(Self).ShowFrame;
      if (ParentIndex = 9) and (Level = 1) and (TreeNode.Index = 3) then
        OptionsSQLInsertFrame(Self).ShowFrame;
      if (ParentIndex = 9) and (Level = 1) and (TreeNode.Index = 4) then
        OptionsSQLSelectFrame(Self).ShowFrame;
      if (ParentIndex = 9) and (Level = 1) and (TreeNode.Index = 5) then
        OptionsSQLUpdateFrame(Self).ShowFrame;
      if (ParentIndex = 9) and (Level = 1) and (TreeNode.Index = 6) then
        OptionsSQLWhitespaceFrame(Self).ShowFrame;
    end;
  end;
end;

procedure TOptionsForm.VirtualDrawTreeOptionsFreeNode(Sender: TBaseVirtualTree;
  Node: PVirtualNode);
var
  Data: POptionsRec;
begin
  Data := Sender.GetNodeData(Node);
  Finalize(Data^);
  inherited;
end;

procedure TOptionsForm.VirtualDrawTreeOptionsGetImageIndex(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex; var Ghosted: Boolean;
  var ImageIndex: Integer);
var
  Data: POptionsRec;
begin
  inherited;
  if not (Kind in [ikNormal, ikSelected]) then
    Exit;
  Data := Sender.GetNodeData(Node);
  if Assigned(Data) then
    ImageIndex := Data.ImageIndex;
end;

procedure TOptionsForm.VirtualDrawTreeOptionsGetNodeWidth(Sender: TBaseVirtualTree; HintCanvas: TCanvas;
  Node: PVirtualNode; Column: TColumnIndex; var NodeWidth: Integer);
var
  Data: POptionsRec;
begin
  Data := Sender.GetNodeData(Node);
  if Assigned(Data) then
    NodeWidth := Canvas.TextWidth(Trim(Data.Caption)) + 2;
end;

procedure TOptionsForm.VirtualDrawTreeOptionsKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  SetVisibleFrame;
end;

procedure TOptionsForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  OptionsContainer.SupportedFileExts(True);
end;

procedure TOptionsForm.ReadIniFile;
begin
  with TMemIniFile.Create(GetIniFilename) do
  try
    { Size }
    Width := ReadInteger('OptionsSize', 'Width', Width);
    Height := ReadInteger('OptionsSize', 'Height', Height);
    { Position }
    Left := ReadInteger('OptionsPosition', 'Left', (Screen.Width - Width) div 2);
    Top := ReadInteger('OptionsPosition', 'Top', (Screen.Height - Height) div 2);
    { Check if the form is outside the workarea }
    Left := SetFormInsideWorkArea(Left, Width);
    { Tree width }
    VirtualDrawTreeOptions.Width := ReadInteger('OptionsSize', 'TreeWidth', VirtualDrawTreeOptions.Width);
  finally
    Free;
  end;
end;

procedure TOptionsForm.WriteIniFile;
begin
  if Windowstate = wsNormal then
  with TMemIniFile.Create(GetIniFilename) do
  try
    { Size }
    WriteInteger('OptionsSize', 'Width', Width);
    WriteInteger('OptionsSize', 'Height', Height);
    { Position }
    WriteInteger('OptionsPosition', 'Left', Left);
    WriteInteger('OptionsPosition', 'Top', Top);
    { Tree width }
    WriteInteger('OptionsSize', 'TreeWidth', VirtualDrawTreeOptions.Width);
  finally
    UpdateFile;
    Free;
  end;
end;

procedure TOptionsForm.FormCreate(Sender: TObject);
begin
  VirtualDrawTreeOptions.NodeDataSize := SizeOf(TOptionsRec);
  { IDE can lose these properties }
  ActionList.Images := ImagesDataModule.ImageListSmall;
  VirtualDrawTreeOptions.Images := ImagesDataModule.ImageListSmall;
  FSQLFormatterDLLFound := FileExists(GetSQLFormatterDLLFilename);
end;

procedure TOptionsForm.FormShow(Sender: TObject);
var
  SelectedItemIndex: Integer;
  Node: PVirtualNode;

  function FindItem(CurrentNode: PVirtualNode; ItemIndex: Integer): PVirtualNode;
  var
    Data: POptionsRec;
  begin
    Data := VirtualDrawTreeOptions.GetNodeData(CurrentNode);
    while Assigned(CurrentNode) and (Data.Index <> ItemIndex) do
    begin
      CurrentNode := VirtualDrawTreeOptions.GetNext(CurrentNode);
      Data := VirtualDrawTreeOptions.GetNodeData(CurrentNode);
    end;
    Result := CurrentNode;
  end;

begin
  inherited;
  CreateTree;

  with TIniFile.Create(GetIniFilename) do
  try
    SelectedItemIndex := ReadInteger('Options', 'OptionsSelectedItemIndex', 0);
  finally
    Free;
  end;
  Node := FindItem(VirtualDrawTreeOptions.GetFirst, SelectedItemIndex);
  if Assigned(Node) then
  begin
    VirtualDrawTreeOptions.Selected[Node] := True;
    VirtualDrawTreeOptions.ScrollIntoView(Node, True);
  end;
  SetVisibleFrame;
end;

end.



