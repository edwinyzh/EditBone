unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ActnCtrls, Vcl.ActnList, Vcl.ActnMan, Vcl.ActnMenus,
  Vcl.ToolWin, Vcl.ComCtrls, Vcl.ImgList, Vcl.ExtCtrls, SynEdit, Directory, BCFileControl,
  Vcl.StdCtrls, Vcl.Menus, Vcl.AppEvnts, Document, Output, Preferences, Lib, JvAppInst,
  JvDragDrop, BCPopupMenu, Vcl.PlatformDefaultStyleActnCtrls, JvComponentBase, Vcl.ActnPopup,
  BCImageList, JvExStdCtrls, JvCombobox, BCComboBox, Vcl.Themes;

const
  WM_AFTER_SHOW = WM_USER + 300; // custom message

type
  TMainForm = class(TForm)
    ActionManager: TActionManager;
    FileNewAction: TAction;
    FileOpenAction: TAction;
    ImageList: TBCImageList;
    FileCloseAction: TAction;
    FileCloseAllAction: TAction;
    FileSaveAction: TAction;
    FileSaveAsAction: TAction;
    FileSaveAllAction: TAction;
    FilePrintAction: TAction;
    FilePrintPreviewAction: TAction;
    FileExitAction: TAction;
    StatusBar: TStatusBar;
    ActionMainMenuBar: TActionMainMenuBar;
    EditUndoAction: TAction;
    EditRedoAction: TAction;
    EditCutAction: TAction;
    EditCopyAction: TAction;
    EditPasteAction: TAction;
    ApplicationEvents: TApplicationEvents;
    SearchAction: TAction;
    SearchReplaceAction: TAction;
    SearchFindNextAction: TAction;
    SearchFindPreviousAction: TAction;
    SearchFindInFilesAction: TAction;
    ViewToolbarAction: TAction;
    ViewDirectoryAction: TAction;
    ViewOutputAction: TAction;
    ViewWordWrapAction: TAction;
    ViewLineNumbersAction: TAction;
    ToolsPreferencesAction: TAction;
    HelpAboutAction: TAction;
    HelpHomeAction: TAction;
    DocumentPopupMenu: TBCPopupMenu;
    FileCloseMenuItem: TMenuItem;
    FileCloseAllMenuItem: TMenuItem;
    Separator1MenuItem: TMenuItem;
    SaveMenuItem: TMenuItem;
    SaveAsMenuItem: TMenuItem;
    Separator2MenuItem: TMenuItem;
    PrintMenuItem: TMenuItem;
    PrintPreviewMenuItem: TMenuItem;
    ViewSpecialCharsAction: TAction;
    OutputDblClickAction: TAction;
    FileTreeViewDblClickAction: TAction;
    ViewInBrowserAction: TAction;
    ViewSelectionModeAction: TAction;
    AppInstances: TJvAppInstances;
    DragDrop: TJvDragDrop;
    HTMLErrorTimer: TTimer;
    ToggleBookmarkAction: TAction;
    ViewNextPageAction: TAction;
    CompareFilesAction: TAction;
    N1: TMenuItem;
    FileCloseAllOtherPagesAction: TAction;
    CloseAllOtherPages1: TMenuItem;
    ContentPanel: TPanel;
    OutputPanel: TPanel;
    HorizontalSplitter: TSplitter;
    DirectoryPanel: TPanel;
    VerticalSplitter: TSplitter;
    ViewOpenDirectoryAction: TAction;
    ViewCloseDirectoryAction: TAction;
    ViewPreviousPageAction: TAction;
    EditIncreaseIndentAction: TAction;
    EditDecreaseIndentAction: TAction;
    EditSortAscAction: TAction;
    EditSortDescAction: TAction;
    EditToggleCaseAction: TAction;
    EditSelectAllAction: TAction;
    ClearBookmarksAction: TAction;
    EditInsertLineAction: TAction;
    EditDeleteWordAction: TAction;
    EditDeleteLineAction: TAction;
    EditDeleteEOLAction: TAction;
    ToolsWordCountAction: TAction;
    MacroRecordPauseAction: TAction;
    MacroStopAction: TAction;
    MacroPlaybackAction: TAction;
    MacroSaveAsAction: TAction;
    MacroOpenAction: TAction;
    DocumentPanel: TPanel;
    ViewEditDirectoryAction: TAction;
    ToolbarPopupMenu: TBCPopupMenu;
    NewOpen1: TMenuItem;
    Print1: TMenuItem;
    Directory1: TMenuItem;
    Indent1: TMenuItem;
    Sort1: TMenuItem;
    Case1: TMenuItem;
    UndoandRedo1: TMenuItem;
    Search1: TMenuItem;
    Mode1: TMenuItem;
    ools1: TMenuItem;
    Macro1: TMenuItem;
    PopupMenuStandardAction: TAction;
    PopupMenuPrintAction: TAction;
    PopupMenuDirectoryAction: TAction;
    PopupMenuIndentAction: TAction;
    PopupMenuSortAction: TAction;
    PopupMenuCaseAction: TAction;
    PopupMenuCommandAction: TAction;
    PopupMenuSearchAction: TAction;
    PopupMenuModeAction: TAction;
    PopupMenuToolsAction: TAction;
    PopupMenuMacroAction: TAction;
    N2: TMenuItem;
    ToolsSelectForCompareAction: TAction;
    SelectforCompareMenuItem: TMenuItem;
    HelpCheckForUpdatesMenuAction: TAction;
    MainMenuPanel: TPanel;
    ViewHighlighterSelectionAction: TAction;
    StyleWindowsAction: TAction;
    StyleAmakritsAction: TAction;
    StyleAmethystKamriAction: TAction;
    StyleAquaGraphiteAction: TAction;
    StyleAquaLightSlateAction: TAction;
    StyleCarbonAction: TAction;
    StyleCobaltXEMediaAction: TAction;
    StyleEmeraldLightSlateAction: TAction;
    StyleGoldenGraphiteAction: TAction;
    StyleIcebergClassicoAction: TAction;
    StyleLavenderClassicoAction: TAction;
    StyleRubyGraphiteAction: TAction;
    StyleSaphireKamriAction: TAction;
    StyleSlateClassicoAction: TAction;
    StyleSmokeyQuartzKamriAction: TAction;
    PopupMenuDocumentAction: TAction;
    Document1: TMenuItem;
    StyleAuricAction: TAction;
    StyleCharcoalDarkSlateAction: TAction;
    StyleCyanDuskAction: TAction;
    StyleCyanNightAction: TAction;
    StyleMetroBlackAction: TAction;
    StyleMetroBlueAction: TAction;
    StyleMetroGreenAction: TAction;
    StyleTurquoiseGrayAction: TAction;
    ToolBarPanel: TPanel;
    ViewSplitAction: TAction;
    ActionToolBar: TActionToolBar;
    HighlighterComboBox: TBCComboBox;
    EncodingComboBox: TBCComboBox;
    ViewEncodingSelectionAction: TAction;
    procedure FileNewActionExecute(Sender: TObject);
    procedure ApplicationEventsHint(Sender: TObject);
//    procedure ApplicationEventsMessage(var Msg: tagMSG; var Handled: Boolean);
    procedure ViewOutputActionExecute(Sender: TObject);
    procedure ViewDirectoryActionExecute(Sender: TObject);
    procedure ViewToolbarActionExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FileOpenActionExecute(Sender: TObject);
    procedure FileCloseActionExecute(Sender: TObject);
    procedure FileCloseAllActionExecute(Sender: TObject);
    procedure FileSaveActionExecute(Sender: TObject);
    procedure FileSaveAllActionExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FileSaveAsActionExecute(Sender: TObject);
    procedure FileExitActionExecute(Sender: TObject);
    procedure EditUndoActionExecute(Sender: TObject);
    procedure EditRedoActionExecute(Sender: TObject);
    procedure EditCutActionExecute(Sender: TObject);
    procedure EditCopyActionExecute(Sender: TObject);
    procedure EditPasteActionExecute(Sender: TObject);
    procedure ToolsPreferencesActionExecute(Sender: TObject);
    procedure FilePrintActionExecute(Sender: TObject);
    procedure FilePrintPreviewActionExecute(Sender: TObject);
    procedure ViewWordWrapActionExecute(Sender: TObject);
    procedure ViewLineNumbersActionExecute(Sender: TObject);
    procedure SearchActionExecute(Sender: TObject);
    procedure SearchReplaceActionExecute(Sender: TObject);
    procedure SearchFindNextActionExecute(Sender: TObject);
    procedure SearchFindPreviousActionExecute(Sender: TObject);
    procedure SearchFindInFilesActionExecute(Sender: TObject);
    procedure HelpHomeActionExecute(Sender: TObject);
    procedure HelpAboutActionExecute(Sender: TObject);
    procedure ViewSpecialCharsActionExecute(Sender: TObject);
    procedure OutputDblClickActionExecute(Sender: TObject);
    procedure FileTreeViewDblClickActionExecute(Sender: TObject);
    procedure ViewInBrowserActionExecute(Sender: TObject);
    procedure ViewSelectionModeActionExecute(Sender: TObject);
    procedure AppInstancesCmdLineReceived(Sender: TObject; CmdLine: TStrings);
    procedure DragDropDrop(Sender: TObject; Pos: TPoint; Value: TStrings);
    procedure HTMLErrorTimerTimer(Sender: TObject);
    procedure ToggleBookmarkActionExecute(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ViewNextPageActionExecute(Sender: TObject);
    procedure ApplicationEventsActivate(Sender: TObject);
    procedure CompareFilesActionExecute(Sender: TObject);
    procedure FileCloseAllOtherPagesActionExecute(Sender: TObject);
    procedure ViewOpenDirectoryActionExecute(Sender: TObject);
    procedure ApplicationEventsMessage(var Msg: tagMSG; var Handled: Boolean);
    procedure ViewCloseDirectoryActionExecute(Sender: TObject);
    procedure ViewPreviousPageActionExecute(Sender: TObject);
    procedure EditIncreaseIndentActionExecute(Sender: TObject);
    procedure EditDecreaseIndentActionExecute(Sender: TObject);
    procedure EditSortAscActionExecute(Sender: TObject);
    procedure EditSortDescActionExecute(Sender: TObject);
    procedure EditToggleCaseActionExecute(Sender: TObject);
    procedure EditSelectAllActionExecute(Sender: TObject);
    procedure ClearBookmarksActionExecute(Sender: TObject);
    procedure EditInsertLineActionExecute(Sender: TObject);
    procedure EditDeleteWordActionExecute(Sender: TObject);
    procedure EditDeleteLineActionExecute(Sender: TObject);
    procedure EditDeleteEOLActionExecute(Sender: TObject);
    procedure ToolsWordCountActionExecute(Sender: TObject);
    procedure MacroRecordPauseActionExecute(Sender: TObject);
    procedure MacroStopActionExecute(Sender: TObject);
    procedure MacroPlaybackActionExecute(Sender: TObject);
    procedure MacroOpenActionExecute(Sender: TObject);
    procedure MacroSaveAsActionExecute(Sender: TObject);
    procedure ViewEditDirectoryActionExecute(Sender: TObject);
    procedure PopupMenuStandardActionExecute(Sender: TObject);
    procedure PopupMenuPrintActionExecute(Sender: TObject);
    procedure PopupMenuDirectoryActionExecute(Sender: TObject);
    procedure PopupMenuIndentActionExecute(Sender: TObject);
    procedure PopupMenuSortActionExecute(Sender: TObject);
    procedure PopupMenuCaseActionExecute(Sender: TObject);
    procedure PopupMenuCommandActionExecute(Sender: TObject);
    procedure PopupMenuSearchActionExecute(Sender: TObject);
    procedure PopupMenuModeActionExecute(Sender: TObject);
    procedure PopupMenuToolsActionExecute(Sender: TObject);
    procedure PopupMenuMacroActionExecute(Sender: TObject);
    procedure ToolsSelectForCompareActionExecute(Sender: TObject);
    procedure HelpCheckForUpdatesMenuActionExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ViewHighlighterSelectionActionExecute(Sender: TObject);
    procedure HighlighterComboBoxChange(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure StyleWindowsActionExecute(Sender: TObject);
    procedure StyleAmakritsActionExecute(Sender: TObject);
    procedure StyleAmethystKamriActionExecute(Sender: TObject);
    procedure StyleAquaGraphiteActionExecute(Sender: TObject);
    procedure StyleAquaLightSlateActionExecute(Sender: TObject);
    procedure StyleCarbonActionExecute(Sender: TObject);
    procedure StyleCobaltXEMediaActionExecute(Sender: TObject);
    procedure StyleEmeraldLightSlateActionExecute(Sender: TObject);
    procedure StyleGoldenGraphiteActionExecute(Sender: TObject);
    procedure StyleIcebergClassicoActionExecute(Sender: TObject);
    procedure StyleLavenderClassicoActionExecute(Sender: TObject);
    procedure StyleRubyGraphiteActionExecute(Sender: TObject);
    procedure StyleSaphireKamriActionExecute(Sender: TObject);
    procedure StyleSlateClassicoActionExecute(Sender: TObject);
    procedure StyleSmokeyQuartzKamriActionExecute(Sender: TObject);
    procedure PopupMenuDocumentActionExecute(Sender: TObject);
    procedure StyleAuricActionExecute(Sender: TObject);
    procedure StyleCharcoalDarkSlateActionExecute(Sender: TObject);
    procedure StyleCyanDuskActionExecute(Sender: TObject);
    procedure StyleCyanNightActionExecute(Sender: TObject);
    procedure StyleMetroBlackActionExecute(Sender: TObject);
    procedure StyleMetroBlueActionExecute(Sender: TObject);
    procedure StyleMetroGreenActionExecute(Sender: TObject);
    procedure StyleTurquoiseGrayActionExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ViewSplitActionExecute(Sender: TObject);
    procedure ViewEncodingSelectionActionExecute(Sender: TObject);
    procedure EncodingComboBoxChange(Sender: TObject);
  private
    { Private declarations }
    FOnStartUp: Boolean;
    FDirectoryFrame: TDirectoryFrame;
    FDocumentFrame: TDocumentFrame;
    FOutputFrame: TOutputFrame;
    //FStyleName: string;
    procedure SetFields;
    function SupportedFileExt(FileExt: string): Boolean;
    procedure FindInFiles(FindWhatText, FileTypeText, FolderText: string; SearchCaseSensitive, LookInSubfolders: Boolean);
    procedure ReadIniFile;
    procedure WriteIniFile;
    procedure SetHighlighterComboIndex(Value: Integer);
    procedure SetEncodingComboIndex(Value: Integer);
    procedure WMAfterShow(var Msg: TMessage); message WM_AFTER_SHOW;
    procedure SetStyleName(Value: string);
    procedure RecreateStatusBar;
  public
    { Public declarations }
    property HighlighterComboIndex: Integer write SetHighlighterComboIndex;
    property EncodingComboIndex: Integer write SetEncodingComboIndex;
    property StyleName: string write SetStyleName;
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

uses
  About, FindInFiles, Vcl.ClipBrd, Common, VirtualTrees, DownloadURL, BigIni, StyleHooks;

const
  MAIN_CAPTION = 'EditBone';
  MAIN_CAPTION_DOCUMENT = ' - [%s]';

{var
  FMainForm: TMainForm;

function EditBoneMainForm: TEditBoneMainForm;
begin
  if not Assigned(FMainForm) then
    Application.CreateForm(TEditBoneMainForm, FMainForm);
  Result := FMainForm;
end;  }

procedure TMainForm.SetStyleName(Value: string);
begin
  //FStyleName := Value;
  StyleAmakritsAction.Checked := Value = STYLENAME_AMAKRITS;
  StyleAmethystKamriAction.Checked := Value = STYLENAME_AMETHYST_KAMRI;
  StyleAquaGraphiteAction.Checked := Value = STYLENAME_AQUA_GRAPHITE;
  StyleAquaLightSlateAction.Checked := Value = STYLENAME_AQUA_LIGHT_SLATE;
  StyleAuricAction.Checked := Value = STYLENAME_AURIC;
  StyleCarbonAction.Checked := Value = STYLENAME_CARBON;
  StyleCharcoalDarkSlateAction.Checked := Value = STYLENAME_CHARCOAL_DARK_SLATE;
  StyleCobaltXEMediaAction.Checked := Value = STYLENAME_COBALT_XEMEDIA;
  StyleCyanDuskAction.Checked := Value = STYLENAME_CYAN_DUSK;
  StyleCyanNightAction.Checked := Value = STYLENAME_CYAN_NIGHT;
  StyleEmeraldLightSlateAction.Checked := Value = STYLENAME_EMERALD_LIGHT_SLATE;
  StyleGoldenGraphiteAction.Checked := Value = STYLENAME_GOLDEN_GRAPHITE;
  StyleIcebergClassicoAction.Checked := Value = STYLENAME_ICEBERG_CLASSICO;
  StyleLavenderClassicoAction.Checked := Value = STYLENAME_LAVENDER_CLASSICO;
  StyleMetroBlackAction.Checked := Value = STYLENAME_METRO_BLACK;
  StyleMetroBlueAction.Checked := Value = STYLENAME_METRO_BLUE;
  StyleMetroGreenAction.Checked := Value = STYLENAME_METRO_GREEN;
  StyleRubyGraphiteAction.Checked := Value = STYLENAME_RUBY_GRAPHITE;
  StyleSaphireKamriAction.Checked := Value = STYLENAME_SAPPHIRE_KAMRI;
  StyleSlateClassicoAction.Checked := Value = STYLENAME_SLATE_CLASSICO;
  StyleSmokeyQuartzKamriAction.Checked := Value = STYLENAME_SMOKEY_QUARTZ_KAMRI;
  StyleTurquoiseGrayAction.Checked := Value = STYLENAME_TURUOISE_GRAY;
  StyleWindowsAction.Checked := Value = STYLENAME_WINDOWS;
  if Assigned(TStyleManager.ActiveStyle) then
  begin
    if Value <> TStyleManager.ActiveStyle.Name then
      TStyleManager.TrySetStyle(Value);
    FDirectoryFrame.UpdateControls;
    FDocumentFrame.UpdateGutterAndControls;
    FOutputFrame.UpdateControls;
    RecreateStatusBar; { style change will lose the handle }
  end;
end;

procedure TMainForm.RecreateStatusBar;
var
  StatusPanel: TStatusPanel;
begin
  if Assigned(StatusBar) then
  begin
    StatusBar.Free;
    StatusBar := nil;
  end;
  StatusBar := TStatusBar.Create(Self);
  with StatusBar do
  begin
    Parent := Self;
    { 1st panel }
    StatusPanel := Panels.Add;
    StatusPanel.Width := 86;
    StatusPanel.Alignment := taCenter;
    { 2nd panel }
    StatusPanel := Panels.Add;
    StatusPanel.Width := 86;
    { 3rd panel }
    StatusPanel := Panels.Add;
    StatusPanel.Width := 86;
    { 4th panel }
    StatusPanel := Panels.Add;
    StatusPanel.Width := 50;
  end;
end;

procedure TMainForm.WMAfterShow(var Msg: TMessage);
var
  i: Integer;
begin
  //if Assigned(TStyleManager.ActiveStyle) then
  //  TStyleManager.TrySetStyle(TStyleManager.ActiveStyle.Name);
  { Style change will call the FormShow }
  if FOnStartUp then
  begin
    Repaint;
    Application.ProcessMessages;
    { paint problem with styles if this is done before OnShow... }

    if not FDocumentFrame.ReadIniOpenFiles then
      FDocumentFrame.New;
    if ParamCount > 0 then
      for i := 1 to ParamCount do
        FDocumentFrame.Open(ParamStr(i));
    FDirectoryFrame.UpdateControls;
    FDocumentFrame.UpdateGutterAndControls;
    FOutputFrame.UpdateControls;

    FOnStartUp := False;
    Repaint;
  end;
end;

procedure TMainForm.ToggleBookmarkActionExecute(Sender: TObject);
begin
  FDocumentFrame.ToggleBookMark;
end;

procedure TMainForm.ViewOpenDirectoryActionExecute(Sender: TObject);
begin
  FDirectoryFrame.OpenDirectory;
  if not DirectoryPanel.Visible then
    DirectoryPanel.Visible := True;
end;

procedure TMainForm.ReadIniFile;
var
  i: Integer;
  ActionToolBarStrings: TStrings;
begin
  ActionToolBarStrings := TStringList.Create;
  with TBigIniFile.Create(ChangeFileExt(Application.EXEName, '.ini')) do
  try
    { Style }
    //FStyleName := ReadString('Preferences', 'StyleName', STYLENAME_SLATE_CLASSICO);
    { Size }
    Width := ReadInteger('Size', 'Width', Round(Screen.Width * 0.8));
    Height := ReadInteger('Size', 'Height', Round(Screen.Height * 0.8));
    { Position }
    Left := ReadInteger('Position', 'Left', (Screen.Width - Width) div 2);
    Top := ReadInteger('Position', 'Top', (Screen.Height - Height) div 2);
    Application.ProcessMessages;
    { Preferences }
    ActionToolBar.Visible := ReadBool('Preferences', 'ShowToolBar', True);
    DirectoryPanel.Visible := ReadBool('Preferences', 'ShowDirectory', True);
    HighlighterComboBox.Visible := ReadBool('Preferences', 'ShowHighlighterSelection', True);
    EncodingComboBox.Visible := ReadBool('Preferences', 'ShowEncodingSelection', False);
    VerticalSplitter.Visible := DirectoryPanel.Visible;
    ViewWordWrapAction.Checked := ReadBool('Preferences', 'EnableWordWrap', False);
    if ViewWordWrapAction.Checked then
      ViewWordWrapAction.Execute;
    ViewLineNumbersAction.Checked := ReadBool('Preferences', 'EnableLineNumbers', True);
    if not ViewLineNumbersAction.Checked then
      ViewLineNumbersAction.Execute;
    ViewSpecialCharsAction.Checked := ReadBool('Preferences', 'EnableSpecialChars', False);
    if ViewSpecialCharsAction.Checked then
      ViewSpecialCharsAction.Execute;
    ViewSelectionModeAction.Checked := ReadBool('Preferences', 'EnableSelectionMode', False);
    if ViewSelectionModeAction.Checked then
      ViewSelectionModeAction.Execute;
    { Toolbar action visibility }
    ReadSectionValues('ActionToolBar', ActionToolBarStrings);
    for i := 0 to ActionToolBarStrings.Count - 1 do
      if not StrToBool(System.Copy(ActionToolBarStrings.Strings[i],
        Pos('=', ActionToolBarStrings.Strings[i]) + 1, Length(ActionToolBarStrings.Strings[i]))) then
           ToolbarPopupMenu.Items[i].Action.Execute;
  finally
    ActionToolBarStrings.Free;
    Free;
  end;
end;

procedure TMainForm.WriteIniFile;
var
  i: Integer;
begin
  if WindowState = wsNormal then
  with TBigIniFile.Create(ChangeFileExt(Application.EXEName, '.ini')) do
  try
    WriteString('EditBone', 'Version', AboutDialog.Version);
    { Position }
    WriteInteger('Position', 'Left', Left);
    WriteInteger('Position', 'Top', Top);
    { Size }
    WriteInteger('Size', 'Width', Width);
    WriteInteger('Size', 'Height', Height);
    { Preferences }
    WriteBool('Preferences', 'ShowToolBar', ActionToolBar.Visible);
    WriteBool('Preferences', 'ShowDirectory', DirectoryPanel.Visible);
    WriteBool('Preferences', 'ShowHighlighterSelection', HighlighterComboBox.Visible);
    WriteBool('Preferences', 'ShowEncodingSelection', EncodingComboBox.Visible);
    WriteBool('Preferences', 'EnableWordWrap', ViewWordWrapAction.Checked);
    WriteBool('Preferences', 'EnableLineNumbers', ViewLineNumbersAction.Checked);
    WriteBool('Preferences', 'EnableSpecialChars', ViewSpecialCharsAction.Checked);
    WriteBool('Preferences', 'EnableSelectionMode', ViewSelectionModeAction.Checked);
    if Assigned(TStyleManager.ActiveStyle) then
      WriteString('Preferences', 'StyleName', TStyleManager.ActiveStyle.Name);
    { Toolbar action visibility }
    EraseSection('ActionToolBar');
    for i := 0 to ToolbarPopupMenu.Items.Count - 1 do
      WriteBool('ActionToolBar', ToolbarPopupMenu.Items[i].Caption, ToolbarPopupMenu.Items[i].Checked);
  finally
    Free;
  end;
end;

procedure TMainForm.ViewEncodingSelectionActionExecute(Sender: TObject);
begin
  EncodingComboBox.Visible := not EncodingComboBox.Visible;
end;

procedure TMainForm.AppInstancesCmdLineReceived(Sender: TObject;
  CmdLine: TStrings);
var
  i: Integer;
begin
  for i := 0 to CmdLine.Count - 1 do
    FDocumentFrame.Open(CmdLine.Strings[i]);
end;

procedure TMainForm.ApplicationEventsActivate(Sender: TObject);
begin
  FDocumentFrame.CheckFileDateTimes;
end;

procedure TMainForm.ApplicationEventsHint(Sender: TObject);
begin
  StatusBar.Panels[3].Text := Application.Hint;
end;

procedure TMainForm.ApplicationEventsMessage(var Msg: tagMSG; var Handled: Boolean);
begin
  if not Assigned(FDocumentFrame) then
    Exit;

  SetFields;
end;

procedure TMainForm.SetFields;
var
  ActiveDocumentFound: Boolean;
  InfoText: string;
  KeyState: TKeyboardState;
  SelectionFound: Boolean;
begin
  ActiveDocumentFound := FDocumentFrame.ActiveDocumentFound;
  SelectionFound := FDocumentFrame.SelectionFound;
  ViewToolbarAction.Checked := ActionToolBar.Visible;
  ViewOutputAction.Checked := OutputPanel.Visible;
  ViewDirectoryAction.Checked := DirectoryPanel.Visible;
  HorizontalSplitter.Visible := OutputPanel.Visible;

  //HighlighterComboBox.Visible := ViewHighlighterSelectionAction.Visible and ActiveDocumentFound;
  //EncodingComboBox.Visible := ViewEncodingSelectionAction.Visible and ActiveDocumentFound;
  ViewHighlighterSelectionAction.Checked := HighlighterComboBox.Visible;
  ViewEncodingSelectionAction.Checked := EncodingComboBox.Visible;

  if FDocumentFrame.ActiveDocumentName <> '' then
    Caption := Format(MAIN_CAPTION + MAIN_CAPTION_DOCUMENT, [FDocumentFrame.ActiveDocumentName])
  else
  if FDocumentFrame.ActiveTabSheetCaption <> '' then
    Caption := Format(MAIN_CAPTION + MAIN_CAPTION_DOCUMENT, [FDocumentFrame.ActiveTabSheetCaption])
  else
    Caption := MAIN_CAPTION;
  FileCloseAction.Enabled := FDocumentFrame.OpenTabSheets;
  FileCloseAllAction.Enabled := FileCloseAction.Enabled;
  FileCloseAllOtherPagesAction.Enabled := FileCloseAction.Enabled;
  //ViewNextPageAction.Enabled := FileCloseAction.Enabled;
  ViewNextPageAction.Enabled := FDocumentFrame.OpenTabSheetCount > 1; //FileCloseAction.Enabled or DatabaseEndConnectionMenuAction.Enabled;
  ViewPreviousPageAction.Enabled := ViewNextPageAction.Enabled;
  ToolsPreferencesAction.Enabled := FileCloseAction.Enabled;
  FileSaveAsAction.Enabled := FileCloseAction.Enabled and ActiveDocumentFound;
  FileSaveAction.Enabled := FDocumentFrame.ModifiedDocuments and ActiveDocumentFound;
  FileSaveAllAction.Enabled := FileSaveAction.Enabled and ActiveDocumentFound;
  FilePrintAction.Enabled := FileCloseAction.Enabled and ActiveDocumentFound;
  FilePrintPreviewAction.Enabled := FileCloseAction.Enabled and ActiveDocumentFound;
  EditUndoAction.Enabled := FileCloseAction.Enabled and FDocumentFrame.CanUndo and ActiveDocumentFound;
  EditRedoAction.Enabled := FileCloseAction.Enabled and FDocumentFrame.CanRedo and ActiveDocumentFound;
  EditCutAction.Enabled := SelectionFound and ActiveDocumentFound;
  EditCopyAction.Enabled := EditCutAction.Enabled and ActiveDocumentFound;
  EditSelectAllAction.Enabled := ActiveDocumentFound;
  EditIncreaseIndentAction.Enabled := SelectionFound;
  EditDecreaseIndentAction.Enabled := SelectionFound;
  EditSortAscAction.Enabled := SelectionFound;
  EditSortDescAction.Enabled := SelectionFound;
  EditToggleCaseAction.Enabled := SelectionFound;
  EditInsertLineAction.Enabled := ActiveDocumentFound;
  EditDeleteWordAction.Enabled := ActiveDocumentFound;
  EditDeleteLineAction.Enabled := ActiveDocumentFound;
  EditDeleteEOLAction.Enabled := ActiveDocumentFound;
  //if Clipboard.HasFormat(CF_TEXT) then
  try
    EditPasteAction.Enabled := Clipboard.HasFormat(CF_TEXT) and ActiveDocumentFound; //ClipBoard.AsText <> '';
  except
    // silent
  end;
  ViewSelectionModeAction.Enabled := ActiveDocumentFound;
  ViewSelectionModeAction.Checked := FDocumentFrame.SelectionModeChecked;
  ViewSplitAction.Enabled := ActiveDocumentFound;
  ViewSplitAction.Checked := FDocumentFrame.SplitChecked;
  SearchAction.Enabled := ActiveDocumentFound;
  SearchReplaceAction.Enabled := ActiveDocumentFound;
  SearchFindNextAction.Enabled := ActiveDocumentFound;
  SearchFindPreviousAction.Enabled := ActiveDocumentFound;
  ToggleBookmarkAction.Enabled := ActiveDocumentFound;
  ViewWordWrapAction.Enabled := ActiveDocumentFound;
  ViewLineNumbersAction.Enabled := ActiveDocumentFound;
  ViewSpecialCharsAction.Enabled := ActiveDocumentFound;
  ToolsWordCountAction.Enabled := ActiveDocumentFound;
  ToolsSelectForCompareAction.Enabled := not FDocumentFrame.ActiveDocumentModified;

  if OutputPanel.Visible then
  begin
    DirectoryPanel.Padding.Bottom := 0;
    DocumentPanel.Padding.Bottom := 0;
  end
  else
  begin
    DirectoryPanel.Padding.Bottom := 2;
    DocumentPanel.Padding.Bottom := 2;
  end;

  ViewOutputAction.Enabled := FOutputFrame.IsAnyOutput;
  if not ViewOutputAction.Enabled then { if there's no output then hide panel }
    OutputPanel.Visible := False;

  if not FDirectoryFrame.IsAnyDirectory then
  begin
    VerticalSplitter.Visible := False;
    DirectoryPanel.Visible := False;
  end;

  ViewCloseDirectoryAction.Enabled := DirectoryPanel.Visible;

  if DirectoryPanel.Visible then
    DocumentPanel.Padding.Left := 0
  else
    DocumentPanel.Padding.Left := 3;

  if ActiveDocumentFound then
  begin
    InfoText := FDocumentFrame.GetCaretInfo;
    if StatusBar.Panels[0].Text <> InfoText then
      StatusBar.Panels[0].Text := InfoText;
    InfoText := FDocumentFrame.GetModifiedInfo;
    if StatusBar.Panels[2].Text <> InfoText then
      StatusBar.Panels[2].Text := InfoText;
  end
  else
  begin
    StatusBar.Panels[0].Text := '';
    StatusBar.Panels[2].Text := '';
  end;
  GetKeyboardState(KeyState);
  if KeyState[VK_INSERT] = 0 then
    if StatusBar.Panels[1].Text <> 'Insert' then
      StatusBar.Panels[1].Text := 'Insert';
  if KeyState[VK_INSERT] = 1 then
    if StatusBar.Panels[1].Text <> 'Overwrite' then
      StatusBar.Panels[1].Text := 'Overwrite';
  { Macro }
  MacroRecordPauseAction.Enabled := ActiveDocumentFound;
  MacroRecordPauseAction.ImageIndex := FDocumentFrame.GetMacroRecordPauseImageIndex;
  MacroStopAction.Enabled := ActiveDocumentFound and FDocumentFrame.IsRecordingMacro;
  MacroPlaybackAction.Enabled := ActiveDocumentFound and FDocumentFrame.IsMacroStopped;
  MacroOpenAction.Enabled := ActiveDocumentFound;
  MacroSaveAsAction.Enabled := MacroPlaybackAction.Enabled;
end;

procedure TMainForm.ViewCloseDirectoryActionExecute(Sender: TObject);
begin
  FDirectoryFrame.CloseDirectory;
end;

procedure TMainForm.ClearBookmarksActionExecute(Sender: TObject);
begin
  FDocumentFrame.ClearBookmarks;
end;

procedure TMainForm.CompareFilesActionExecute(Sender: TObject);
begin
  FDocumentFrame.CompareFiles;
end;

procedure TMainForm.ViewSelectionModeActionExecute(Sender: TObject);
begin
  FDocumentFrame.ToggleSelectionMode;
end;

procedure TMainForm.FileNewActionExecute(Sender: TObject);
begin
  FDocumentFrame.New;
end;

procedure TMainForm.FileOpenActionExecute(Sender: TObject);
begin
  if Assigned(FDirectoryFrame) then
    FDocumentFrame.DefaultPath := FDirectoryFrame.SelectedPath;
  FDocumentFrame.Open;
end;

procedure TMainForm.FileCloseActionExecute(Sender: TObject);
begin
  FDocumentFrame.Close;
end;

procedure TMainForm.FileCloseAllActionExecute(Sender: TObject);
begin
  FDocumentFrame.CloseAll;
end;

procedure TMainForm.FileCloseAllOtherPagesActionExecute(Sender: TObject);
begin
  FDocumentFrame.CloseAllOtherPages;
end;

procedure TMainForm.FileSaveActionExecute(Sender: TObject);
begin
  if Assigned(FDirectoryFrame) then
    FDocumentFrame.DefaultPath := FDirectoryFrame.SelectedPath;
  FDocumentFrame.Save;
  Repaint;
end;

procedure TMainForm.FileSaveAsActionExecute(Sender: TObject);
var
  RootDirectory: string;
  Filename: string;
begin
  try
    RootDirectory := '';
    if Assigned(FDirectoryFrame) then
    begin
      RootDirectory := FDirectoryFrame.RootDirectory;
      FDocumentFrame.DefaultPath := FDirectoryFrame.SelectedPath;
    end;
    Filename := FDocumentFrame.SaveAs;
    if Filename <> '' then
      if Assigned(FDirectoryFrame) then
        if FDirectoryFrame.IsAnyDirectory then
          FDirectoryFrame.OpenPath(RootDirectory, ExtractFilePath(Filename), FDirectoryFrame.ExcludeOtherBranches);
    Repaint;
  except
    on E: Exception do
      Common.ShowErrorMessage(E.Message);
  end;
end;

procedure TMainForm.FileTreeViewDblClickActionExecute(Sender: TObject);
var
  Filename: string;
begin
  Filename := '';
  if Assigned(FDirectoryFrame) then
    Filename := FDirectoryFrame.SelectedFile;
  if Filename <> '' then
    FDocumentFrame.Open(Filename);
end;

procedure TMainForm.FileSaveAllActionExecute(Sender: TObject);
begin
  if Assigned(FDirectoryFrame) then
    FDocumentFrame.DefaultPath := FDirectoryFrame.SelectedPath;
  FDocumentFrame.SaveAll;
end;

procedure TMainForm.FilePrintActionExecute(Sender: TObject);
begin
  FDocumentFrame.Print;
end;

procedure TMainForm.FilePrintPreviewActionExecute(Sender: TObject);
begin
  FDocumentFrame.PrintPreview;
end;

procedure TMainForm.FileExitActionExecute(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.FormActivate(Sender: TObject);
begin
  Repaint;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FDocumentFrame.CloseAll(False);
  FDocumentFrame.WriteIniFile;
  FDirectoryFrame.WriteIniFile;
  WriteIniFile;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  FOnStartUp := True;
  { IDE is losing these for some reason... }
  ActionMainMenuBar.Font.Name := 'Tahoma';
  ActionMainMenuBar.Font.Size := 8;
  StatusBar.Font.Name := 'Tahoma';
  StatusBar.Font.Size := 8;

  FOutputFrame := TOutputFrame.Create(OutputPanel);
  FOutputFrame.Parent := OutputPanel;
  FOutputFrame.OnTabsheetDblClick := OutputDblClickActionExecute;

  FDirectoryFrame := TDirectoryFrame.Create(DirectoryPanel);
  FDirectoryFrame.Parent := DirectoryPanel;
  FDirectoryFrame.OnTabsheetDblClick := FileTreeViewDblClickActionExecute;

  FDocumentFrame := TDocumentFrame.Create(DocumentPanel);
  FDocumentFrame.Parent := DocumentPanel;
  FDocumentFrame.PopupMenu := DocumentPopupMenu;
  FDocumentFrame.ReadIniFile;

  ReadIniFile;
  StyleName := TStyleManager.ActiveStyle.Name;
end;

procedure TMainForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = 9) then
    FDocumentFrame.NextPage;
end;

procedure TMainForm.FormResize(Sender: TObject);
begin
  ActionMainMenuBar.Width := Width;
end;

procedure TMainForm.FormShow(Sender: TObject);
var
  SynEdit: TBCSynEdit;
begin
  if HighlighterComboBox.Visible then
    if HighlighterComboBox.CanFocus then
      HighlighterComboBox.SetFocus; { get the combo unselected }
  SynEdit := FDocumentFrame.ActiveSynEdit;
  if Assigned(SynEdit) then
    SynEdit.SetFocus;
  { Post the custom message WM_AFTER_SHOW to our form }
  if FOnStartUp then
    PostMessage(Self.Handle, WM_AFTER_SHOW, 0, 0);
  Repaint;
end;

procedure TMainForm.HelpAboutActionExecute(Sender: TObject);
begin
  AboutDialog.Open;
end;

procedure TMainForm.HelpCheckForUpdatesMenuActionExecute(Sender: TObject);
var
  Check: string;
begin
  try
    try
      Screen.Cursor := crHourGlass;
      Check := GetAppVersion('http://www.bonecode.com/check.php?a=editbone&v=' + AboutDialog.Version);
    finally
      Screen.Cursor := crDefault;
    end;
    if Trim(Check) <> '' then
    begin
      if System.Pos('A new version', Check) <> 0 then
      begin
        if Common.AskYesOrNo(Check + CHR_ENTER + CHR_ENTER + 'Would you like to download it from the Internet?') then
          DownloadURLDialog.Open('EditBone.zip', 'http://www.bonecode.com/downloads/EditBone.zip');
      end
      else
        Common.ShowMessage(Check);
    end;
  except
    on E: Exception do
      Common.ShowErrorMessage(E.Message);
  end;
end;

procedure TMainForm.HelpHomeActionExecute(Sender: TObject);
begin
  Common.BrowseURL('http://www.bonecode.com');
end;

procedure TMainForm.HighlighterComboBoxChange(Sender: TObject);
begin
  if HighlighterComboBox.ItemIndex <> -1 then
  begin
    FDocumentFrame.SetActiveHighlighter(HighlighterComboBox.ItemIndex);
    FDocumentFrame.UpdateGutterAndControls;
  end;
end;

procedure TMainForm.HTMLErrorTimerTimer(Sender: TObject);
var
  i: Integer;
  ErrorList: TList;
  OutputObject: POutputRec;
  Root: PVirtualNode;
begin
  if not OptionsContainer.HTMLErrorChecking then
    Exit;
  if not Assigned(FOutputFrame) then
    Exit;
  ErrorList := FDocumentFrame.GetHTMLErrors;
  if Assigned(ErrorList) then
  begin
    FOutputFrame.AddTreeView(CAPTION_ERRORS, True);
    FOutputFrame.ProcessingTabSheet := True;
    FOutputFrame.Clear;
    if ErrorList.Count > 0 then
    begin
      Root := nil;
      for i := 0 to ErrorList.Count - 1 do
      begin
        OutputObject := ErrorList.Items[i];
        FOutputFrame.AddTreeViewLine(Root, String(OutputObject.FileName), OutputObject.Ln, OutputObject.Ch,
          String(OutputObject.Text));
      end;
      OutputPanel.Visible := True;
    end
    else
      FOutputFrame.CloseTabSheet;
    FOutputFrame.ProcessingTabSheet := False;
  end;
end;

procedure TMainForm.MacroOpenActionExecute(Sender: TObject);
begin
  FDocumentFrame.LoadMacro;
end;

procedure TMainForm.MacroPlaybackActionExecute(Sender: TObject);
begin
  FDocumentFrame.PlaybackMacro;
end;

procedure TMainForm.MacroRecordPauseActionExecute(Sender: TObject);
begin
  FDocumentFrame.RecordMacro;
end;

procedure TMainForm.MacroSaveAsActionExecute(Sender: TObject);
begin
  FDocumentFrame.SaveMacro;
end;

procedure TMainForm.MacroStopActionExecute(Sender: TObject);
begin
  FDocumentFrame.StopMacro;
end;

procedure TMainForm.DragDropDrop(Sender: TObject; Pos: TPoint;
  Value: TStrings);
var
  i: Integer;
begin
  for i := 0 to Value.Count - 1 do
    FDocumentFrame.Open(Value.Strings[i]);
end;

procedure TMainForm.OutputDblClickActionExecute(Sender: TObject);
var
  Filename: string;
  Ln, Ch: LongWord;
begin
  if FOutputFrame.SelectedLine(Filename, Ln, Ch) then
    FDocumentFrame.Open(Filename, nil, Ln, Ch);
end;

procedure TMainForm.PopupMenuCaseActionExecute(Sender: TObject);
var
  i: Integer;
begin
  PopupMenuCaseAction.Checked := not PopupMenuCaseAction.Checked;

  for i := 22 to 23 do
    ActionToolBar.ActionControls[i].Visible := PopupMenuCaseAction.Checked
end;

procedure TMainForm.PopupMenuCommandActionExecute(Sender: TObject);
var
  i: Integer;
begin
  PopupMenuCommandAction.Checked := not PopupMenuCommandAction.Checked;

  for i := 24 to 26 do
    ActionToolBar.ActionControls[i].Visible := PopupMenuCommandAction.Checked
end;

procedure TMainForm.PopupMenuDirectoryActionExecute(Sender: TObject);
var
  i: Integer;
begin
  PopupMenuDirectoryAction.Checked := not PopupMenuDirectoryAction.Checked;

  for i := 12 to 15 do
    ActionToolBar.ActionControls[i].Visible := PopupMenuDirectoryAction.Checked
end;

procedure TMainForm.PopupMenuDocumentActionExecute(Sender: TObject);
var
  i: Integer;
begin
  PopupMenuDocumentAction.Checked := not PopupMenuDocumentAction.Checked;

  for i := 43 to 45 do
    ActionToolBar.ActionControls[i].Visible := PopupMenuDocumentAction.Checked
end;

procedure TMainForm.PopupMenuIndentActionExecute(Sender: TObject);
var
  i: Integer;
begin
  PopupMenuIndentAction.Checked := not PopupMenuIndentAction.Checked;

  for i := 16 to 18 do
    ActionToolBar.ActionControls[i].Visible := PopupMenuIndentAction.Checked
end;

procedure TMainForm.PopupMenuMacroActionExecute(Sender: TObject);
var
  i: Integer;
begin
  PopupMenuMacroAction.Checked := not PopupMenuMacroAction.Checked;

  for i := 38 to 43 do
    ActionToolBar.ActionControls[i].Visible := PopupMenuMacroAction.Checked
end;

procedure TMainForm.PopupMenuModeActionExecute(Sender: TObject);
var
  i: Integer;
begin
  PopupMenuModeAction.Checked := not PopupMenuModeAction.Checked;

  for i := 31 to 35 do
    ActionToolBar.ActionControls[i].Visible := PopupMenuModeAction.Checked
end;

procedure TMainForm.PopupMenuPrintActionExecute(Sender: TObject);
var
  i: Integer;
begin
  PopupMenuPrintAction.Checked := not PopupMenuPrintAction.Checked;

  for i := 9 to 11 do
    ActionToolBar.ActionControls[i].Visible := PopupMenuPrintAction.Checked
end;

procedure TMainForm.PopupMenuSearchActionExecute(Sender: TObject);
var
  i: Integer;
begin
  PopupMenuSearchAction.Checked := not PopupMenuSearchAction.Checked;

  for i := 27 to 30 do
    ActionToolBar.ActionControls[i].Visible := PopupMenuSearchAction.Checked
end;

procedure TMainForm.PopupMenuSortActionExecute(Sender: TObject);
var
  i: Integer;
begin
  PopupMenuSortAction.Checked := not PopupMenuSortAction.Checked;

  for i := 19 to 21 do
    ActionToolBar.ActionControls[i].Visible := PopupMenuSortAction.Checked
end;

procedure TMainForm.PopupMenuStandardActionExecute(Sender: TObject);
var
  i: Integer;
begin
  PopupMenuStandardAction.Checked := not PopupMenuStandardAction.Checked;

  for i := 0 to 8 do
    ActionToolBar.ActionControls[i].Visible := PopupMenuStandardAction.Checked
end;

procedure TMainForm.PopupMenuToolsActionExecute(Sender: TObject);
var
  i: Integer;
begin
  PopupMenuToolsAction.Checked := not PopupMenuToolsAction.Checked;

  for i := 36 to 37 do
    ActionToolBar.ActionControls[i].Visible := PopupMenuToolsAction.Checked
end;

procedure TMainForm.ViewPreviousPageActionExecute(Sender: TObject);
begin
  FDocumentFrame.PreviousPage;
end;

procedure TMainForm.SearchActionExecute(Sender: TObject);
begin
  FDocumentFrame.Search;
end;

procedure TMainForm.SearchFindNextActionExecute(Sender: TObject);
begin
  FDocumentFrame.FindNext;
end;

procedure TMainForm.SearchFindPreviousActionExecute(Sender: TObject);
begin
  FDocumentFrame.FindPrevious;
end;

procedure TMainForm.SearchReplaceActionExecute(Sender: TObject);
begin
  FDocumentFrame.Replace;
end;

procedure TMainForm.ViewSpecialCharsActionExecute(Sender: TObject);
begin
  ViewSpecialCharsAction.Checked := FDocumentFrame.ToggleSpecialChars;
end;

procedure TMainForm.ViewSplitActionExecute(Sender: TObject);
begin
  FDocumentFrame.ToggleSplit;
end;

procedure TMainForm.SearchFindInFilesActionExecute(Sender: TObject);
var
  T1, T2: TTime;
  SynEdit: TBCSynEdit;
  Min, Secs: Integer;
  TimeDifference: string;
begin
  with FindInFilesDialog do
  begin
    if FolderText = '' then
      if Assigned(FDirectoryFrame) then
        FolderText := FDirectoryFrame.SelectedPath;
    Extensions := OptionsContainer.Extensions;
    SynEdit := FDocumentFrame.ActiveSynEdit;
    if Assigned(SynEdit) then
      if SynEdit.SelAvail then
        FindWhatComboBox.Text := SynEdit.SelText;
    if ShowModal = mrOk then
    begin
      T1 := Now;
      Screen.Cursor := crHourGlass;
      try
        OutputPanel.Visible := True;
        FOutputFrame.AddTreeView(Format('Search for ''%s''', [FindWhatText]));
        FOutputFrame.ProcessingTabSheet := True;
        Application.ProcessMessages;
        FindInFiles(FindWhatText, FileTypeText, FolderText, SearchCaseSensitive, LookInSubfolders);
      finally
        T2 := Now;
        if not FOutputFrame.IsEmpty then
        begin
          Min := StrToInt(FormatDateTime('n', T2 - T1));
          Secs := Min * 60 + StrToInt(FormatDateTime('s', T2 - T1));
          if Secs < 60 then
            TimeDifference := FormatDateTime('s.zzz "s"', T2 - T1)
          else
            TimeDifference := FormatDateTime('n "min" s.zzz "s"', T2 - T1);
          StatusBar.Panels[3].Text := Format('%d occurence(s) have been found in %s', [FOutputFrame.Count, TimeDifference])
        end
        else
        begin
          Common.ShowMessage(Format('Cannot find the string ''%s''', [FindWhatText]));
          FOutputFrame.CloseTabSheet;
          StatusBar.Panels[3].Text := '';
        end;
        FOutputFrame.ProcessingTabSheet := False;
        Screen.Cursor := crDefault;
      end;
    end;
  end;
end;

procedure TMainForm.EditRedoActionExecute(Sender: TObject);
begin
  FDocumentFrame.Redo;
end;

procedure TMainForm.EditSelectAllActionExecute(Sender: TObject);
begin
  FDocumentFrame.SelectAll;
end;

procedure TMainForm.EditSortAscActionExecute(Sender: TObject);
begin
  FDocumentFrame.SortAsc;
end;

procedure TMainForm.EditSortDescActionExecute(Sender: TObject);
begin
  FDocumentFrame.SortDesc;
end;

procedure TMainForm.EditToggleCaseActionExecute(Sender: TObject);
begin
  FDocumentFrame.ToggleCase;
end;

procedure TMainForm.EditUndoActionExecute(Sender: TObject);
begin
  FDocumentFrame.Undo;
end;

procedure TMainForm.EncodingComboBoxChange(Sender: TObject);
begin
  if EncodingComboBox.ItemIndex <> -1 then
    FDocumentFrame.SetActiveEncoding(EncodingComboBox.ItemIndex);
end;

procedure TMainForm.EditCutActionExecute(Sender: TObject);
begin
  FDocumentFrame.Cut;
end;

procedure TMainForm.EditDecreaseIndentActionExecute(Sender: TObject);
begin
  FDocumentFrame.DecreaseIndent;
end;

procedure TMainForm.EditDeleteEOLActionExecute(Sender: TObject);
begin
  FDocumentFrame.DeleteEOL;
end;

procedure TMainForm.EditDeleteLineActionExecute(Sender: TObject);
begin
  FDocumentFrame.DeleteLine;
end;

procedure TMainForm.EditDeleteWordActionExecute(Sender: TObject);
begin
  FDocumentFrame.DeleteWord;
end;

procedure TMainForm.EditIncreaseIndentActionExecute(Sender: TObject);
begin
  FDocumentFrame.IncreaseIndent;
end;

procedure TMainForm.EditInsertLineActionExecute(Sender: TObject);
begin
  FDocumentFrame.InsertLine;
end;

procedure TMainForm.EditCopyActionExecute(Sender: TObject);
begin
  FDocumentFrame.Copy;
end;

procedure TMainForm.EditPasteActionExecute(Sender: TObject);
begin
  FDocumentFrame.Paste;
end;

procedure TMainForm.ToolsPreferencesActionExecute(Sender: TObject);
begin
  if FDocumentFrame.Preferences then
  begin
    if Assigned(FOutputFrame) then
      FOutputFrame.PageControl.MultiLine := OptionsContainer.MultiLine;
    if Assigned(FDirectoryFrame) then
      FDirectoryFrame.PageControl.MultiLine := OptionsContainer.MultiLine;
  end;
end;

procedure TMainForm.ToolsSelectForCompareActionExecute(Sender: TObject);
begin
  FDocumentFrame.SelectForCompare;
end;

procedure TMainForm.ToolsWordCountActionExecute(Sender: TObject);
begin
  FDocumentFrame.ShowWordCount;
end;

procedure TMainForm.ViewDirectoryActionExecute(Sender: TObject);
begin
  with DirectoryPanel do
  begin
    if not Visible then
      VerticalSplitter.Show { vertical splitter must be shown at first or the order goes wrong! }
    else
      VerticalSplitter.Hide;
    Visible := not Visible;
  end;
end;

procedure TMainForm.ViewEditDirectoryActionExecute(Sender: TObject);
begin
  FDirectoryFrame.EditDirectory;
end;

procedure TMainForm.ViewHighlighterSelectionActionExecute(Sender: TObject);
begin
  HighlighterComboBox.Visible := not HighlighterComboBox.Visible;
end;

procedure TMainForm.ViewInBrowserActionExecute(Sender: TObject);
begin
  BrowseURL(FDocumentFrame.ActiveDocumentName);
end;

procedure TMainForm.ViewLineNumbersActionExecute(Sender: TObject);
begin
  ViewLineNumbersAction.Checked := FDocumentFrame.ToggleLineNumbers;
end;

procedure TMainForm.ViewNextPageActionExecute(Sender: TObject);
begin
  FDocumentFrame.NextPage;
end;

procedure TMainForm.ViewOutputActionExecute(Sender: TObject);
begin
  OutputPanel.Visible := not OutputPanel.Visible;
end;

procedure TMainForm.ViewToolbarActionExecute(Sender: TObject);
begin
  with ActionToolBar do
  Visible := not Visible;
end;

procedure TMainForm.ViewWordWrapActionExecute(Sender: TObject);
begin
  ViewWordWrapAction.Checked := FDocumentFrame.ToggleWordWrap;
end;

function TMainForm.SupportedFileExt(FileExt: string): Boolean;
begin
  Result := Pos(FileExt, UpperCase(OptionsContainer.FileTypes.Text)) <> 0
end;

{ Recursive method to find files. }
procedure TMainForm.FindInFiles(FindWhatText, FileTypeText, FolderText: String; SearchCaseSensitive, LookInSubfolders: Boolean);
var
  shFindFile: THandle;
  sWin32FD: TWin32FindData;
  S, Line: WideString;
  FName: string;
  Ln, Ch, ChPos: LongWord;
  Found: Boolean;
  SynEdit: TBCSynEdit;
  Root: PVirtualNode;

  function IsDirectory(dWin32FD: TWin32FindData): Boolean;
  var
    TmpAttr: DWORD;
  begin
    with dWin32FD do
    begin
      TmpAttr := dwFileAttributes and (FILE_ATTRIBUTE_READONLY or FILE_ATTRIBUTE_HIDDEN or FILE_ATTRIBUTE_SYSTEM or FILE_ATTRIBUTE_ARCHIVE or FILE_ATTRIBUTE_NORMAL or FILE_ATTRIBUTE_DIRECTORY);

      Result := (TmpAttr and FILE_ATTRIBUTE_DIRECTORY = FILE_ATTRIBUTE_DIRECTORY);
    end;
  end;
begin
  shFindFile := FindFirstFile(PChar(AddSlash(FolderText) + '*.*'), sWin32FD);
  if shFindFile <> INVALID_HANDLE_VALUE then
  try
    repeat
      StatusBar.Panels[3].Text := 'Search in progress...';
      Application.ProcessMessages;
      FName := StrPas(sWin32FD.cFileName);
      if (FName <> '.') and (FName <> '..') then
      begin
        if LookInSubfolders and IsDirectory(sWin32FD) then
          FindInFiles(FindWhatText, FileTypeText, AddSlash(FolderText) + FName, SearchCaseSensitive, LookInSubfolders)
        else
        begin
          // if IsAsciiFile(AddSlash(FolderText) + FName) then // too slow...
          if SupportedFileExt(UpperCase(ExtractFileExt(FName))) then
            if (FileTypeText = '*.*') or (Pos(UpperCase(ExtractFileExt(FName)), UpperCase(FileTypeText)) <> 0) then
            try
              SynEdit := TBCSynEdit.Create(nil);
              SynEdit.LoadFromFile(AddSlash(String(FolderText)) + FName);
              try
                Root := nil;
                for Ln := 0 to SynEdit.Lines.Count - 1 do
                begin
                  Found := True;
                  Line := SynEdit.Lines[Ln];
                  S := Line;
                  ChPos := 0;
                  while Found do
                  begin
                    if SearchCaseSensitive then
                      Ch := Pos(WideString(FindWhatText), S)
                    else
                      Ch := Pos(WideUpperCase(WideString(FindWhatText)), WideUpperCase(S));
                    if Ch <> 0 then
                    begin
                      Found := True;
                      ChPos := ChPos + Ch;
                      FOutputFrame.AddTreeViewLine(Root, AddSlash(FolderText) + FName, Ln + 1, ChPos, Line, ShortString(FindWhatText));
                      S := Copy(S, Ch + LongWord(Length(FindWhatText)), Length(S));
                      ChPos := ChPos + LongWord(Length(FindWhatText)) - 1;
                    end
                    else
                      Found := False;
                  end;
                end
              finally
                SynEdit.Free;
              end;
            except
              Common.ShowWarningMessage(Format('File %s access error.', [AddSlash(FolderText) + FName]));
            end;
        end;
      end;
    until not FindNextFile(shFindFile, sWin32FD);
  finally
    Winapi.Windows.FindClose(shFindFile);
  end;
end;

procedure TMainForm.SetHighlighterComboIndex(Value: Integer);
var
  SynEdit: TBCSynEdit;
begin
  HighlighterComboBox.ItemIndex := Value;
  if HighlighterComboBox.CanFocus then
    HighlighterComboBox.SetFocus; { get the combo unselected }
  SynEdit := FDocumentFrame.ActiveSynEdit;
  if Assigned(SynEdit) then
    if SynEdit.CanFocus then
      SynEdit.SetFocus
end;

procedure TMainForm.SetEncodingComboIndex(Value: Integer);
begin
  EncodingComboBox.ItemIndex := Value;
  EncodingComboBox.Repaint;
end;

procedure TMainForm.StyleAuricActionExecute(Sender: TObject);
begin
  StyleName := STYLENAME_AURIC;
end;

procedure TMainForm.StyleAmakritsActionExecute(Sender: TObject);
begin
  StyleName := STYLENAME_AMAKRITS;
end;

procedure TMainForm.StyleAmethystKamriActionExecute(Sender: TObject);
begin
  StyleName := STYLENAME_AMETHYST_KAMRI;
end;

procedure TMainForm.StyleAquaGraphiteActionExecute(Sender: TObject);
begin
  StyleName := STYLENAME_AQUA_GRAPHITE;
end;

procedure TMainForm.StyleAquaLightSlateActionExecute(Sender: TObject);
begin
  StyleName := STYLENAME_AQUA_LIGHT_SLATE;
end;

procedure TMainForm.StyleCarbonActionExecute(Sender: TObject);
begin
  StyleName := STYLENAME_CARBON;
end;

procedure TMainForm.StyleCharcoalDarkSlateActionExecute(Sender: TObject);
begin
  StyleName := STYLENAME_CHARCOAL_DARK_SLATE;
end;

procedure TMainForm.StyleCobaltXEMediaActionExecute(Sender: TObject);
begin
  StyleName := STYLENAME_COBALT_XEMEDIA;
end;

procedure TMainForm.StyleCyanDuskActionExecute(Sender: TObject);
begin
  StyleName := STYLENAME_CYAN_DUSK;
end;

procedure TMainForm.StyleCyanNightActionExecute(Sender: TObject);
begin
  StyleName := STYLENAME_CYAN_NIGHT;
end;

procedure TMainForm.StyleEmeraldLightSlateActionExecute(Sender: TObject);
begin
  StyleName := STYLENAME_EMERALD_LIGHT_SLATE;
end;

procedure TMainForm.StyleGoldenGraphiteActionExecute(Sender: TObject);
begin
  StyleName := STYLENAME_GOLDEN_GRAPHITE;
end;

procedure TMainForm.StyleIcebergClassicoActionExecute(Sender: TObject);
begin
  StyleName := STYLENAME_ICEBERG_CLASSICO;
end;

procedure TMainForm.StyleLavenderClassicoActionExecute(Sender: TObject);
begin
  StyleName := STYLENAME_LAVENDER_CLASSICO;
end;

procedure TMainForm.StyleMetroBlackActionExecute(Sender: TObject);
begin
  StyleName := STYLENAME_METRO_BLACK;
end;

procedure TMainForm.StyleMetroBlueActionExecute(Sender: TObject);
begin
  StyleName := STYLENAME_METRO_BLUE;
end;

procedure TMainForm.StyleMetroGreenActionExecute(Sender: TObject);
begin
  StyleName := STYLENAME_METRO_GREEN;
end;

procedure TMainForm.StyleRubyGraphiteActionExecute(Sender: TObject);
begin
  StyleName := STYLENAME_RUBY_GRAPHITE;
end;

procedure TMainForm.StyleSaphireKamriActionExecute(Sender: TObject);
begin
  StyleName := STYLENAME_SAPPHIRE_KAMRI;
end;

procedure TMainForm.StyleSlateClassicoActionExecute(Sender: TObject);
begin
  StyleName := STYLENAME_SLATE_CLASSICO;
end;

procedure TMainForm.StyleSmokeyQuartzKamriActionExecute(Sender: TObject);
begin
  StyleName := STYLENAME_SMOKEY_QUARTZ_KAMRI;
end;

procedure TMainForm.StyleTurquoiseGrayActionExecute(Sender: TObject);
begin
  StyleName := STYLENAME_TURUOISE_GRAY;
end;

procedure TMainForm.StyleWindowsActionExecute(Sender: TObject);
begin
  StyleName := STYLENAME_WINDOWS;
end;

end.
