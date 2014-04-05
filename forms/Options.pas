unit Options;

interface

uses
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, BCCommon.FileUtils, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.Menus, SynEdit, SynEditMiscClasses, System.Classes, System.SysUtils, Vcl.ImgList,
  Vcl.ActnList, Vcl.Themes, BCFrames.OptionsPrint, BCFrames.OptionsEditorSearch, BCCommon.Images,
  VirtualTrees, BCFrames.OptionsEditorOptions, BCFrames.OptionsEditorFont, BCFrames.OptionsEditorLeftMargin,
  OptionsEditorTabs, Lib, OptionsEditorErrorChecking, OptionsEditorOther, OptionsFileTypes, BCFrames.OptionsCompare,
  BCFrames.OptionsMainMenu, OptionsDirectoryTabs, OptionsOutputTabs, OptionsDirectory, BCFrames.OptionsStatusBar,
  BCFrames.OptionsOutput, BCFrames.OptionsToolBar, Vcl.ActnMenus, System.Actions, BCFrames.OptionsEditorCompletionProposal,
  BCFrames.OptionsEditorRightMargin, BCCommon.OptionsContainer, System.Generics.Collections, BCSQL.Formatter,
  BCFrames.OptionsSQLSelect, BCFrames.OptionsSQLAlignments, BCFrames.OptionsSQLInsert, BCFrames.OptionsSQLUpdate,
  BCFrames.OptionsSQLWhitespace, BCFrames.OptionsSQLCapitalization, BCFrames.OptionsSQLIndentation,
  BCFrames.OptionsSQLFormatter;

type
  POptionsRec = ^TOptionsRec;
  TOptionsRec = record
    Index: Integer;
    Caption: UnicodeString;
    ImageIndex: Integer;
  end;

  TOptionsForm = class(TForm)
    ActionList: TActionList;
    ButtonDividerPanel: TPanel;
    ButtonPanel: TPanel;
    CancelButton: TButton;
    CompareAction: TAction;
    DirectoryAction: TAction;
    DirectoryTabsAction: TAction;
    EditorAction: TAction;
    EditorCompletionProposalAction: TAction;
    EditorErrorCheckingAction: TAction;
    EditorFontAction: TAction;
    EditorLeftMarginAction: TAction;
    EditorOtherAction: TAction;
    EditorRightMarginAction: TAction;
    EditorSearchAction: TAction;
    EditorTabsAction: TAction;
    FileTypesAction: TAction;
    MainMenuAction: TAction;
    OKButton: TButton;
    OptionsPanel: TPanel;
    OptionsVirtualDrawTree: TVirtualDrawTree;
    OutputAction: TAction;
    OutputTabsAction: TAction;
    PrintAction: TAction;
    Splitter: TSplitter;
    StatusBarAction: TAction;
    ToolBarAction: TAction;
    TopPanel: TPanel;
    ScrollBox: TScrollBox;
    SQLFormatterAction: TAction;
    SQLAlignmentsAction: TAction;
    SQLCapitalizationAction: TAction;
    SQLIndentationAction: TAction;
    SQLInsertAction: TAction;
    SQLSelectAction: TAction;
    SQLUpdateAction: TAction;
    SQLWhitespaceAction: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure OptionsVirtualDrawTreeClick(Sender: TObject);
    procedure OptionsVirtualDrawTreeFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure OptionsVirtualDrawTreeGetImageIndex(Sender: TBaseVirtualTree; Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex; var Ghosted: Boolean; var ImageIndex: Integer);
    procedure OptionsVirtualDrawTreeDrawNode(Sender: TBaseVirtualTree; const PaintInfo: TVTPaintInfo);
    procedure OptionsVirtualDrawTreeGetNodeWidth(Sender: TBaseVirtualTree; HintCanvas: TCanvas; Node: PVirtualNode;
      Column: TColumnIndex; var NodeWidth: Integer);
    procedure OptionsVirtualDrawTreeKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
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
  BCCommon.StyleUtils, BCCommon.LanguageStrings, System.IniFiles,  BCCommon.LanguageUtils, BCCommon.Lib, Winapi.Windows,
  System.Types;

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
  with OptionsVirtualDrawTree do
  begin
    Clear;
    i := 0;
    { Editor }
    Node := AddChild(nil);
    Data := GetNodeData(Node);
    Data.Index := PostInc(i);
    Data.ImageIndex := EditorAction.ImageIndex;
    Data.Caption := EditorAction.Caption;
    { Font }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.Index := PostInc(i);
    Data.ImageIndex := EditorFontAction.ImageIndex;
    Data.Caption := EditorFontAction.Caption;
    { Left Margin }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.Index := PostInc(i);
    Data.ImageIndex := EditorLeftMarginAction.ImageIndex;
    Data.Caption := EditorLeftMarginAction.Caption;
    { Right Margin }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.Index := PostInc(i);
    Data.ImageIndex := EditorRightMarginAction.ImageIndex;
    Data.Caption := EditorRightMarginAction.Caption;
    { Tabs }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.Index := PostInc(i);
    Data.ImageIndex := EditorTabsAction.ImageIndex;
    Data.Caption := EditorTabsAction.Caption;
    { Search }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.Index := PostInc(i);
    Data.ImageIndex := EditorSearchAction.ImageIndex;
    Data.Caption := EditorSearchAction.Caption;
    { Completion proposal }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.Index := PostInc(i);
    Data.ImageIndex := EditorCompletionProposalAction.ImageIndex;
    Data.Caption := EditorCompletionProposalAction.Caption;
    { Error checking }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.Index := PostInc(i);
    Data.ImageIndex := EditorErrorCheckingAction.ImageIndex;
    Data.Caption := EditorErrorCheckingAction.Caption;
    { Other }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.Index := PostInc(i);
    Data.ImageIndex := EditorOtherAction.ImageIndex;
    Data.Caption := EditorOtherAction.Caption;
    Node.ChildCount := OptionsVirtualDrawTree.ChildCount[Node];
    OptionsVirtualDrawTree.Selected[Node] := True;
    OptionsVirtualDrawTree.Expanded[Node] := True;
    { Directory }
    Node := AddChild(nil);
    Data := GetNodeData(Node);
    Data.Index := PostInc(i);
    Data.ImageIndex := DirectoryAction.ImageIndex;
    Data.Caption := DirectoryAction.Caption;
    { Tabs }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.Index := PostInc(i);
    Data.ImageIndex := DirectoryTabsAction.ImageIndex;
    Data.Caption := DirectoryTabsAction.Caption;
    Node.ChildCount := OptionsVirtualDrawTree.ChildCount[Node];
    OptionsVirtualDrawTree.Selected[Node] := True;
    OptionsVirtualDrawTree.Expanded[Node] := True;
    { Output }
    Node := AddChild(nil);
    Data := GetNodeData(Node);
    Data.Index := PostInc(i);
    Data.ImageIndex := OutputAction.ImageIndex;
    Data.Caption := OutputAction.Caption;
    { Tabs }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.Index := PostInc(i);
    Data.ImageIndex := OutputTabsAction.ImageIndex;
    Data.Caption := OutputTabsAction.Caption;
    Node.ChildCount := OptionsVirtualDrawTree.ChildCount[Node];
    OptionsVirtualDrawTree.Selected[Node] := True;
    OptionsVirtualDrawTree.Expanded[Node] := True;
    { Compare }
    Node := AddChild(nil);
    Data := GetNodeData(Node);
    Data.Index := PostInc(i);
    Data.ImageIndex := CompareAction.ImageIndex;
    Data.Caption := CompareAction.Caption;
    { Print }
    Node := AddChild(nil);
    Data := GetNodeData(Node);
    Data.Index := PostInc(i);
    Data.ImageIndex := PrintAction.ImageIndex;
    Data.Caption := PrintAction.Caption;
    { Main menu }
    Node := AddChild(nil);
    Data := GetNodeData(Node);
    Data.Index := PostInc(i);
    Data.ImageIndex := MainMenuAction.ImageIndex;
    Data.Caption := MainMenuAction.Caption;
    { Tool Bar }
    Node := AddChild(nil);
    Data := GetNodeData(Node);
    Data.Index := PostInc(i);
    Data.ImageIndex := ToolBarAction.ImageIndex;
    Data.Caption := ToolBarAction.Caption;
    { Status Bar }
    Node := AddChild(nil);
    Data := GetNodeData(Node);
    Data.Index := PostInc(i);
    Data.ImageIndex := StatusBarAction.ImageIndex;
    Data.Caption := StatusBarAction.Caption;
    { File types }
    Node := AddChild(nil);
    Data := GetNodeData(Node);
    Data.Index := PostInc(i);
    Data.ImageIndex := FileTypesAction.ImageIndex;
    Data.Caption := FileTypesAction.Caption;
    if FSQLFormatterDLLFound then
    begin
      { SQL Formatter }
      Node := AddChild(nil);
      Data := GetNodeData(Node);
      Data.Index := PostInc(i);
      Data.ImageIndex := SQLFormatterAction.ImageIndex;
      Data.Caption := SQLFormatterAction.Caption;
      { Alignments }
      ChildNode := AddChild(Node);
      Data := GetNodeData(ChildNode);
      Data.Index := PostInc(i);
      Data.ImageIndex := SQLAlignmentsAction.ImageIndex;
      Data.Caption := SQLAlignmentsAction.Caption;
      { Capitalization }
      ChildNode := AddChild(Node);
      Data := GetNodeData(ChildNode);
      Data.Index := PostInc(i);
      Data.ImageIndex := SQLCapitalizationAction.ImageIndex;
      Data.Caption := SQLCapitalizationAction.Caption;
      { Indentation }
      ChildNode := AddChild(Node);
      Data := GetNodeData(ChildNode);
      Data.Index := PostInc(i);
      Data.ImageIndex := SQLIndentationAction.ImageIndex;
      Data.Caption := SQLIndentationAction.Caption;
      { Insert }
      ChildNode := AddChild(Node);
      Data := GetNodeData(ChildNode);
      Data.Index := PostInc(i);
      Data.ImageIndex := SQLInsertAction.ImageIndex;
      Data.Caption := SQLInsertAction.Caption;
      { Select }
      ChildNode := AddChild(Node);
      Data := GetNodeData(ChildNode);
      Data.Index := PostInc(i);
      Data.ImageIndex := SQLSelectAction.ImageIndex;
      Data.Caption := SQLSelectAction.Caption;
      { Update }
      ChildNode := AddChild(Node);
      Data := GetNodeData(ChildNode);
      Data.Index := PostInc(i);
      Data.ImageIndex := SQLUpdateAction.ImageIndex;
      Data.Caption := SQLUpdateAction.Caption;
      { Whitespace }
      ChildNode := AddChild(Node);
      Data := GetNodeData(ChildNode);
      Data.Index := PostInc(i);
      Data.ImageIndex := SQLWhitespaceAction.ImageIndex;
      Data.Caption := SQLWhitespaceAction.Caption;

      Node.ChildCount := 7;
      OptionsVirtualDrawTree.Selected[Node] := True;
      OptionsVirtualDrawTree.Expanded[Node] := True;
    end;

    OptionsVirtualDrawTree.Selected[OptionsVirtualDrawTree.GetFirst] := True;
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
    SQLFormatterOptions.WriteIniFile; { this is written here because dll is reading settings from the ini file }
end;

procedure TOptionsForm.SaveSelectedTreeNode;
var
  Node: PVirtualNode;
  Data: POptionsRec;
begin
  with TIniFile.Create(GetIniFilename) do
  try
    Node := OptionsVirtualDrawTree.GetFirstSelected;
    Data := OptionsVirtualDrawTree.GetNodeData(Node);
    WriteInteger('Options', 'OptionsSelectedItemIndex', Data.Index);
  finally
    Free;
  end;
end;

procedure TOptionsForm.OptionsVirtualDrawTreeClick(Sender: TObject);
begin
  SetVisibleFrame;
end;

procedure TOptionsForm.OptionsVirtualDrawTreeDrawNode(Sender: TBaseVirtualTree; const PaintInfo: TVTPaintInfo);
var
  Data: POptionsRec;
  S: UnicodeString;
  R: TRect;
  Format: Cardinal;
  LStyles: TCustomStyleServices;
  LColor: TColor;
begin
  LStyles := StyleServices;
  with Sender as TVirtualDrawTree, PaintInfo do
  begin
    Data := Sender.GetNodeData(Node);

    if not Assigned(Data) then
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
       Canvas.Font.Color := LStyles.GetStyleFontColor(sfMenuItemTextSelected);
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
  TreeNode := OptionsVirtualDrawTree.GetFirstSelected;
  if Assigned(TreeNode) then
  begin
    Level := OptionsVirtualDrawTree.GetNodeLevel(TreeNode);
    ParentIndex := -1;
    if Level = 1 then
      ParentIndex := TreeNode.Parent.Index;
    for i := 0 to ComponentCount - 1 do
      if Components[i] is TFrame then
        (Components[i] as TFrame).Hide;
      
    { don't set the visibility value with the condition because the frame is created }
    if (Level = 0) and (TreeNode.Index = 0) then
      OptionsEditorOptionsFrame(Self).Show; 
    if (ParentIndex = 0) and (Level = 1) and (TreeNode.Index = 0) then
      OptionsEditorFontFrame(Self).Show;
    if (ParentIndex = 0) and (Level = 1) and (TreeNode.Index = 1) then
      OptionsEditorLeftMarginFrame(Self).Show;
    if (ParentIndex = 0) and (Level = 1) and (TreeNode.Index = 2) then
      OptionsEditorRightMarginFrame(Self).Show;
    if (ParentIndex = 0) and (Level = 1) and (TreeNode.Index = 3) then
      OptionsEditorTabsFrame(Self).Show;
    if (ParentIndex = 0) and (Level = 1) and (TreeNode.Index = 4) then
      OptionsEditorSearchFrame(Self).Show;
    if (ParentIndex = 0) and (Level = 1) and (TreeNode.Index = 5) then
      OptionsEditorCompletionProposalFrame(Self).Show;
    if (ParentIndex = 0) and (Level = 1) and (TreeNode.Index = 6) then
      OptionsEditorErrorCheckingFrame(Self).Show;
    if (ParentIndex = 0) and (Level = 1) and (TreeNode.Index = 7) then
      OptionsEditorOtherFrame(Self).Show;
    if (Level = 0) and (TreeNode.Index = 1) then
      OptionsDirectoryFrame(Self).Show;
    if (ParentIndex = 1) and (Level = 1) and (TreeNode.Index = 0) then
      OptionsDirectoryTabsFrame(Self).Show;
    if (Level = 0) and (TreeNode.Index = 2) then
      OptionsOutputFrame(Self).Show;
    if (ParentIndex = 2) and (Level = 1) and (TreeNode.Index = 0) then
      OptionsOutputTabsFrame(Self).Show;
    if (Level = 0) and (TreeNode.Index = 3) then
      OptionsCompareFrame(Self).Show;
    if (Level = 0) and (TreeNode.Index = 4) then
      OptionsPrintFrame(Self).Show;
    if (Level = 0) and (TreeNode.Index = 5) then
      OptionsMainMenuFrame(Self).Show;
    if (Level = 0) and (TreeNode.Index = 6) then
      OptionsToolBarFrame(Self, FActionList).Show;
    if (Level = 0) and (TreeNode.Index = 7) then
      OptionsStatusBarFrame(Self).Show;
    if (Level = 0) and (TreeNode.Index = 8) then
      OptionsFileTypesFrame(Self).Show;
    if FSQLFormatterDLLFound then
    begin
      { SQL Formatter options }
      if (Level = 0) and (TreeNode.Index = 9) then
        OptionsSQLFormatterFrame(Self).Show;
      if (ParentIndex = 9) and (Level = 1) and (TreeNode.Index = 0) then
        OptionsSQLAlignmentsFrame(Self).Show;
      if (ParentIndex = 9) and (Level = 1) and (TreeNode.Index = 1) then
        OptionsSQLCapitalizationFrame(Self).Show;
      if (ParentIndex = 9) and (Level = 1) and (TreeNode.Index = 2) then
        OptionsSQLIndentationFrame(Self).Show;
      if (ParentIndex = 9) and (Level = 1) and (TreeNode.Index = 3) then
        OptionsSQLInsertFrame(Self).Show;
      if (ParentIndex = 9) and (Level = 1) and (TreeNode.Index = 4) then
        OptionsSQLSelectFrame(Self).Show;
      if (ParentIndex = 9) and (Level = 1) and (TreeNode.Index = 5) then
        OptionsSQLUpdateFrame(Self).Show;
      if (ParentIndex = 9) and (Level = 1) and (TreeNode.Index = 6) then
        OptionsSQLWhitespaceFrame(Self).Show;
    end;
  end;
end;

procedure TOptionsForm.OptionsVirtualDrawTreeFreeNode(Sender: TBaseVirtualTree;
  Node: PVirtualNode);
var
  Data: POptionsRec;
begin
  Data := Sender.GetNodeData(Node);
  Finalize(Data^);
  inherited;
end;

procedure TOptionsForm.OptionsVirtualDrawTreeGetImageIndex(Sender: TBaseVirtualTree;
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

procedure TOptionsForm.OptionsVirtualDrawTreeGetNodeWidth(Sender: TBaseVirtualTree; HintCanvas: TCanvas;
  Node: PVirtualNode; Column: TColumnIndex; var NodeWidth: Integer);
var
  Data: POptionsRec;
begin
  Data := Sender.GetNodeData(Node);
  if Assigned(Data) then
    NodeWidth := Canvas.TextWidth(Trim(Data.Caption)) + 2;
end;

procedure TOptionsForm.OptionsVirtualDrawTreeKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
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
    OptionsVirtualDrawTree.Width := ReadInteger('OptionsSize', 'TreeWidth', OptionsVirtualDrawTree.Width);
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
    WriteInteger('OptionsSize', 'TreeWidth', OptionsVirtualDrawTree.Width);
  finally
    UpdateFile;
    Free;
  end;
end;

procedure TOptionsForm.FormCreate(Sender: TObject);
begin
  OptionsVirtualDrawTree.NodeDataSize := SizeOf(TOptionsRec);
  { IDE can lose these properties }
  ActionList.Images := ImagesDataModule.ImageList;
  OptionsVirtualDrawTree.Images := ImagesDataModule.ImageList;
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
    Data := OptionsVirtualDrawTree.GetNodeData(CurrentNode);
    while Assigned(CurrentNode) and (Data.Index <> ItemIndex) do
    begin
      CurrentNode := OptionsVirtualDrawTree.GetNext(CurrentNode);
      Data := OptionsVirtualDrawTree.GetNodeData(CurrentNode);
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
  Node := FindItem(OptionsVirtualDrawTree.GetFirst, SelectedItemIndex);
  if Assigned(Node) then
    OptionsVirtualDrawTree.Selected[Node] := True;
  SetVisibleFrame;
end;

end.
