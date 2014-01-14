unit Main;

interface

uses
  Winapi.Windows, System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.ActnCtrls, Vcl.ActnList,
  Vcl.ActnMan, Vcl.ActnMenus, Vcl.ToolWin, Vcl.ComCtrls, Vcl.ImgList, Vcl.ExtCtrls, SynEdit, Directory, Vcl.StdCtrls,
  Vcl.Menus, Vcl.AppEvnts, Document, Output, Options, Lib, JvAppInst, VirtualTrees, JvDragDrop, BCControls.PopupMenu,
  Vcl.PlatformDefaultStyleActnCtrls, JvComponentBase, Vcl.ActnPopup, BCControls.ImageList, BCControls.ComboBox,
  Vcl.Themes, System.Actions, BCControls.ProgressBar, Vcl.PlatformVclStylesActnCtrls, BCCommon.Images;

const
  { Main menu item indexes }
  FILE_MENU_ITEMINDEX = 0;
  FILE_REOPEN_MENU_ITEMINDEX = 2;
  VIEW_MENU_ITEMINDEX = 3;
  VIEW_LANGUAGE_MENU_ITEMINDEX = 15;
  VIEW_STYLE_MENU_ITEMINDEX = 16;

type
  TStatusBar = class(Vcl.ComCtrls.TStatusBar)
  public
    constructor Create(AOwner: TComponent); override;
  end;

  TMainForm = class(TForm)
    ActionMainMenuBar: TActionMainMenuBar;
    ActionManager: TActionManager;
    ActionToolBar: TActionToolBar;
    AppInstances: TJvAppInstances;
    ApplicationEvents: TApplicationEvents;
    SearchClearBookmarksAction: TAction;
    CloseAllOtherPages1: TMenuItem;
    CompareFilesAction: TAction;
    ContentPanel: TPanel;
    DirectoryPanel: TPanel;
    DocumentMenuAction: TAction;
    DocumentPanel: TPanel;
    DocumentPopupMenu: TBCPopupMenu;
    DragDrop: TJvDragDrop;
    EditCopyAction: TAction;
    EditCutAction: TAction;
    EditDecreaseIndentAction: TAction;
    EditDeleteAction: TAction;
    EditDeleteEOLAction: TAction;
    EditDeleteLineAction: TAction;
    EditDeleteWordAction: TAction;
    EditIncreaseIndentAction: TAction;
    EditIndentAction: TAction;
    EditInsertAction: TAction;
    EditInsertDateTimeAction: TAction;
    EditInsertLineAction: TAction;
    EditInsertTagAction: TAction;
    EditMenuAction: TAction;
    EditPasteAction: TAction;
    EditRedoAction: TAction;
    EditRemoveWhiteSpaceAction: TAction;
    EditSelectAllAction: TAction;
    EditSortAction: TAction;
    EditSortAscAction: TAction;
    EditSortDescAction: TAction;
    EditToggleCaseAction: TAction;
    EditUndoAction: TAction;
    EncodingComboBox: TBCComboBox;
    FileCloseAction: TAction;
    FileCloseAllAction: TAction;
    FileCloseAllMenuItem: TMenuItem;
    FileCloseAllOtherPagesAction: TAction;
    FileCloseMenuItem: TMenuItem;
    FileExitAction: TAction;
    FileMenuAction: TAction;
    FileNewAction: TAction;
    FileOpenAction: TAction;
    FilePrintAction: TAction;
    FilePrintPreviewAction: TAction;
    FilePropertiesAction: TAction;
    FileReopenAction: TAction;
    FileReopenClearAction: TAction;
    FileSaveAction: TAction;
    FileSaveAllAction: TAction;
    FileSaveAsAction: TAction;
    FileTreeViewDblClickAction: TAction;
    FormatXMLAction: TAction;
    GotoBookmarks1Action: TAction;
    GotoBookmarks2Action: TAction;
    GotoBookmarks3Action: TAction;
    GotoBookmarks4Action: TAction;
    GotoBookmarks5Action: TAction;
    GotoBookmarks6Action: TAction;
    GotoBookmarks7Action: TAction;
    GotoBookmarks8Action: TAction;
    GotoBookmarks9Action: TAction;
    SearchGotoBookmarksAction: TAction;
    HelpAboutAction: TAction;
    HelpCheckForUpdatesMenuAction: TAction;
    HelpHomeAction: TAction;
    HelpMenuAction: TAction;
    HighlighterComboBox: TBCComboBox;
    HighlighterPanel: TPanel;
    HorizontalSplitter: TSplitter;
    HTMLErrorTimer: TTimer;
    MacroMenuAction: TAction;
    MacroOpenAction: TAction;
    MacroPlaybackAction: TAction;
    MacroRecordPauseAction: TAction;
    MacroSaveAsAction: TAction;
    MacroStopAction: TAction;
    MainMenuPanel: TPanel;
    OutputDblClickAction: TAction;
    OutputPanel: TPanel;
    PrintMenuItem: TMenuItem;
    PrintPreviewMenuItem: TMenuItem;
    PropertiesMenuItem: TMenuItem;
    SaveAsMenuItem: TMenuItem;
    SaveMenuItem: TMenuItem;
    SearchAction: TAction;
    SearchFindInFilesAction: TAction;
    SearchFindNextAction: TAction;
    SearchFindPreviousAction: TAction;
    SearchGotoLineAction: TAction;
    SearchMenuAction: TAction;
    SearchReplaceAction: TAction;
    SelectforCompareMenuItem: TMenuItem;
    SelectLanguageAction: TAction;
    SelectReopenFileAction: TAction;
    SelectStyleAction: TAction;
    Separator1MenuItem: TMenuItem;
    Separator2MenuItem: TMenuItem;
    Separator3MenuItem: TMenuItem;
    Separator4MenuItem: TMenuItem;
    Separator5MenuItem: TMenuItem;
    StatusBar: TStatusBar;
    SearchToggleBookmarkAction: TAction;
    ToggleBookmarks1Action: TAction;
    ToggleBookmarks2Action: TAction;
    ToggleBookmarks3Action: TAction;
    ToggleBookmarks4Action: TAction;
    ToggleBookmarks5Action: TAction;
    ToggleBookmarks6Action: TAction;
    ToggleBookmarks7Action: TAction;
    ToggleBookmarks8Action: TAction;
    ToggleBookmarks9Action: TAction;
    SearchToggleBookmarksAction: TAction;
    ToolBarPanel: TPanel;
    ToolsConvertAction: TAction;
    ToolsDuplicateCheckerAction: TAction;
    ToolsLanguageEditorAction: TAction;
    ToolsMenuAction: TAction;
    ToolsOptionsAction: TAction;
    ToolsSelectForCompareAction: TAction;
    ToolsUnicodeCharacterMapAction: TAction;
    ToolsWordCountAction: TAction;
    VerticalSplitter: TSplitter;
    ViewCloseDirectoryAction: TAction;
    ViewDirectoryAction: TAction;
    ViewEditDirectoryAction: TAction;
    ViewEncodingSelectionAction: TAction;
    ViewHighlighterSelectionAction: TAction;
    ViewInBrowserAction: TAction;
    ViewLanguageAction: TAction;
    ViewLineNumbersAction: TAction;
    ViewMenuAction: TAction;
    ViewMiniMapAction: TAction;
    ViewNextPageAction: TAction;
    ViewOpenDirectoryAction: TAction;
    ViewOutputAction: TAction;
    ViewPreviousPageAction: TAction;
    ViewSelectionModeAction: TAction;
    ViewSpecialCharsAction: TAction;
    ViewSplitAction: TAction;
    ViewStatusBarAction: TAction;
    ViewStyleAction: TAction;
    ViewToolbarAction: TAction;
    ViewWordWrapAction: TAction;
    ViewXMLTreeAction: TAction;
    ViewSearchForFilesAction: TAction;
    FileSelectFromDirectoryAction: TAction;
    SelectfromDirectory1: TMenuItem;
    DirectorySearchFindInFilesAction: TAction;
    procedure AppInstancesCmdLineReceived(Sender: TObject; CmdLine: TStrings);
    procedure ApplicationEventsActivate(Sender: TObject);
    procedure ApplicationEventsHint(Sender: TObject);
    procedure ApplicationEventsMessage(var Msg: tagMSG; var Handled: Boolean);
    procedure SearchClearBookmarksActionExecute(Sender: TObject);
    procedure CompareFilesActionExecute(Sender: TObject);
    procedure DragDropDrop(Sender: TObject; Pos: TPoint; Value: TStrings);
    procedure DummyActionExecute(Sender: TObject);
    procedure EditCopyActionExecute(Sender: TObject);
    procedure EditCutActionExecute(Sender: TObject);
    procedure EditDecreaseIndentActionExecute(Sender: TObject);
    procedure EditDeleteEOLActionExecute(Sender: TObject);
    procedure EditDeleteLineActionExecute(Sender: TObject);
    procedure EditDeleteWordActionExecute(Sender: TObject);
    procedure EditIncreaseIndentActionExecute(Sender: TObject);
    procedure EditInsertDateTimeActionExecute(Sender: TObject);
    procedure EditInsertLineActionExecute(Sender: TObject);
    procedure EditInsertTagActionExecute(Sender: TObject);
    procedure EditPasteActionExecute(Sender: TObject);
    procedure EditRedoActionExecute(Sender: TObject);
    procedure EditRemoveWhiteSpaceActionExecute(Sender: TObject);
    procedure EditSelectAllActionExecute(Sender: TObject);
    procedure EditSortAscActionExecute(Sender: TObject);
    procedure EditSortDescActionExecute(Sender: TObject);
    procedure EditToggleCaseActionExecute(Sender: TObject);
    procedure EditUndoActionExecute(Sender: TObject);
    procedure EncodingComboBoxChange(Sender: TObject);
    procedure FileCloseActionExecute(Sender: TObject);
    procedure FileCloseAllActionExecute(Sender: TObject);
    procedure FileCloseAllOtherPagesActionExecute(Sender: TObject);
    procedure FileExitActionExecute(Sender: TObject);
    procedure FileNewActionExecute(Sender: TObject);
    procedure FileOpenActionExecute(Sender: TObject);
    procedure FilePrintActionExecute(Sender: TObject);
    procedure FilePrintPreviewActionExecute(Sender: TObject);
    procedure FilePropertiesActionExecute(Sender: TObject);
    procedure FileReopenActionExecute(Sender: TObject);
    procedure FileReopenClearActionExecute(Sender: TObject);
    procedure FileSaveActionExecute(Sender: TObject);
    procedure FileSaveAllActionExecute(Sender: TObject);
    procedure FileSaveAsActionExecute(Sender: TObject);
    procedure FileTreeViewDblClickActionExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormatXMLActionExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GotoBookmarksActionExecute(Sender: TObject);
    procedure HelpAboutActionExecute(Sender: TObject);
    procedure HelpCheckForUpdatesMenuActionExecute(Sender: TObject);
    procedure HelpHomeActionExecute(Sender: TObject);
    procedure HighlighterComboBoxChange(Sender: TObject);
    procedure HTMLErrorTimerTimer(Sender: TObject);
    procedure MacroOpenActionExecute(Sender: TObject);
    procedure MacroPlaybackActionExecute(Sender: TObject);
    procedure MacroRecordPauseActionExecute(Sender: TObject);
    procedure MacroSaveAsActionExecute(Sender: TObject);
    procedure MacroStopActionExecute(Sender: TObject);
    procedure OutputDblClickActionExecute(Sender: TObject);
    procedure SearchActionExecute(Sender: TObject);
    procedure SearchFindInFilesActionExecute(Sender: TObject);
    procedure SearchFindNextActionExecute(Sender: TObject);
    procedure SearchFindPreviousActionExecute(Sender: TObject);
    procedure SearchGotoLineActionExecute(Sender: TObject);
    procedure SearchReplaceActionExecute(Sender: TObject);
    procedure SelectLanguageActionExecute(Sender: TObject);
    procedure SelectReopenFileActionExecute(Sender: TObject);
    procedure SelectStyleActionExecute(Sender: TObject);
    procedure SearchToggleBookmarkActionExecute(Sender: TObject);
    procedure ToggleBookmarksActionExecute(Sender: TObject);
    procedure ToolsConvertActionExecute(Sender: TObject);
    procedure ToolsDuplicateCheckerActionExecute(Sender: TObject);
    procedure ToolsLanguageEditorActionExecute(Sender: TObject);
    procedure ToolsOptionsActionExecute(Sender: TObject);
    procedure ToolsSelectForCompareActionExecute(Sender: TObject);
    procedure ToolsUnicodeCharacterMapActionExecute(Sender: TObject);
    procedure ToolsWordCountActionExecute(Sender: TObject);
    procedure ViewCloseDirectoryActionExecute(Sender: TObject);
    procedure ViewDirectoryActionExecute(Sender: TObject);
    procedure ViewEditDirectoryActionExecute(Sender: TObject);
    procedure ViewEncodingSelectionActionExecute(Sender: TObject);
    procedure ViewHighlighterSelectionActionExecute(Sender: TObject);
    procedure ViewInBrowserActionExecute(Sender: TObject);
    procedure ViewLineNumbersActionExecute(Sender: TObject);
    procedure ViewMiniMapActionExecute(Sender: TObject);
    procedure ViewNextPageActionExecute(Sender: TObject);
    procedure ViewOpenDirectoryActionExecute(Sender: TObject);
    procedure ViewOutputActionExecute(Sender: TObject);
    procedure ViewPreviousPageActionExecute(Sender: TObject);
    procedure ViewSelectionModeActionExecute(Sender: TObject);
    procedure ViewSpecialCharsActionExecute(Sender: TObject);
    procedure ViewSplitActionExecute(Sender: TObject);
    procedure ViewStatusBarActionExecute(Sender: TObject);
    procedure ViewToolbarActionExecute(Sender: TObject);
    procedure ViewWordWrapActionExecute(Sender: TObject);
    procedure ViewXMLTreeActionExecute(Sender: TObject);
    procedure ViewSearchForFilesActionExecute(Sender: TObject);
    procedure FileSelectFromDirectoryActionExecute(Sender: TObject);
    procedure DirectorySearchFindInFilesActionExecute(Sender: TObject);
  private
    { Private declarations }
    FNoIni: Boolean;
    FDirectoryFrame: TDirectoryFrame;
    FDocumentFrame: TDocumentFrame;
    FImageListCount: Integer;
    FOnStartUp: Boolean;
    FOutputFrame: TOutputFrame;
    FProcessingEventHandler: Boolean;
    FProgressBar: TBCProgressBar;
    FEncoding: TEncoding;
    function GetStringList(Filename: string): TStringList;
    function GetActionClientItem(MenuItemIndex, SubMenuItemIndex: Integer): TActionClientItem;
    procedure CreateActionToolBar(CreateToolBar: Boolean = False);
    procedure CreateFrames;
    procedure CreateLanguageMenu;
    procedure CreateProgressBar;
    procedure CreateStyleMenu;
    procedure FindInFiles(OutputTreeView: TVirtualDrawTree; FindWhatText, FileTypeText, FolderText: string; SearchCaseSensitive, LookInSubfolders: Boolean);
    procedure MainMenuTitleBarActions(Enabled: Boolean);
    procedure ReadIniSizePositionAndState;
    procedure ReadIniOptions;
    procedure ReadLanguageFile(SelectedLanguage: string);
    procedure RecreateDragDrop;
    procedure ResizeProgressBar;
    procedure SearchFindInFiles(Folder: string = '');
    procedure SetEncodingComboIndex(Value: Integer);
    procedure SetFields;
    procedure SetHighlighterComboIndex(Value: Integer);
    procedure UpdateControls;
    procedure UpdateMainMenuBar;
    procedure UpdateStatusBar;
//    procedure UpdateToolBar;
    procedure WriteIniFile;
  public
    { Public declarations }
    procedure CreateFileReopenList;
    property EncodingComboIndex: Integer write SetEncodingComboIndex;
    property HighlighterComboIndex: Integer write SetHighlighterComboIndex;
    property ProgressBar: TBCProgressBar read FProgressBar write FProgressBar;
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

uses
  About, BCDialogs.FindInFiles, Vcl.ClipBrd, BigIni, BCCommon.StyleUtils, BCCommon.FileUtils, BCCommon.OptionsContainer,
  System.IOUtils, BCCommon.LanguageStrings, LanguageEditor, BCControls.SynEdit, SynUnicode, BCCommon.Encoding,
  BCCommon.LanguageUtils, BCCommon.DuplicateChecker, UnicodeCharacterMap, DuplicateCheckerOptions, Winapi.ShellAPI,
  System.Types, BCCommon.Messages, BCCommon.Lib, BCCommon.StringUtils, Winapi.CommCtrl, BCForms.Convert,
  BCForms.SearchForFiles;

const
  MAIN_CAPTION_DOCUMENT = ' - [%s]';

{ TStatusBar }

constructor TStatusBar.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle + [csAcceptsControls]; { allow progress bar }
end;

{ TMainForm }

procedure TMainForm.UpdateStatusBar;
var
  PanelWidth: Integer;
begin
  StatusBar.Panels[2].Width := 86;
  PanelWidth := StatusBar.Canvas.TextWidth(StatusBar.Panels[2].Text) + 10;
  if PanelWidth > 86 then
    StatusBar.Panels[2].Width := PanelWidth;

  OptionsContainer.AssignTo(StatusBar);
end;

procedure TMainForm.RecreateDragDrop;
begin
  if Assigned(DragDrop) then
  begin
    DragDrop.Free;
    DragDrop := nil
  end;
  DragDrop := TJvDragDrop.Create(MainForm);
  DragDrop.DropTarget := MainForm;
  DragDrop.OnDrop := DragDropDrop;
  DragDrop.AcceptDrag := True;
end;

procedure TMainForm.CreateFileReopenList;
var
  i, j, ImageIndex: Integer;
  s: string;
  ReopenActionClientItem, ActionClientItem: TActionClientItem;
  Files: TStrings;
  Action: TAction;
  SystemImageList: TBCImageList;
  SysImageList: THandle;
  SHFileInfo: TSHFileInfo;
  PathInfo: String;
  Icon: TIcon;
begin
  FileIconInit(True);
  SystemImageList := TBCImageList.Create(nil);
  try
    SysImageList := SHGetFileInfo(PChar(PathInfo), 0, SHFileInfo, SizeOf(SHFileInfo), SHGFI_SYSICONINDEX or SHGFI_SMALLICON);
    if SysImageList <> 0 then
      SystemImageList.Handle := SysImageList;
    { Remove added images from imagelist }
    while FImageListCount < ImagesDataModule.ImageList.Count do
      ImageList_Remove(ImagesDataModule.ImageList.Handle, FImageListCount);

    ReopenActionClientItem := GetActionClientItem(FILE_MENU_ITEMINDEX, FILE_REOPEN_MENU_ITEMINDEX);
    { Destroy actions }
    for i := ReopenActionClientItem.Items.Count - 1 downto 0 do
      if Assigned(ReopenActionClientItem.Items[i].Action) then
        if ReopenActionClientItem.Items[i].Action.Tag = 1 then
          ReopenActionClientItem.Items[i].Action.Free;
    ReopenActionClientItem.Items.Clear;

    Files := TStringList.Create;
    with TBigIniFile.Create(GetIniFilename) do
    try
      ReadSectionValues('FileReopenFiles', Files);
      { Files }
      j := 0;
      for i := 0 to Files.Count - 1 do
      begin
        s := System.Copy(Files.Strings[i], Pos('=', Files.Strings[i]) + 1, Length(Files.Strings[i]));
        if FileExists(s) then
        begin
          ActionClientItem := ReopenActionClientItem.Items.Add;
          Action := TAction.Create(ActionManager);
          Action.Name := Format('ReopenFile%dSelectAction', [j]);
          Action.Caption := Format('%d %s', [j, s]);
          Action.OnExecute := SelectReopenFileActionExecute;
          Action.Tag := 1;
          { Add image to imagelist }
          Icon := TIcon.Create;
          try
            ImageIndex := GetIconIndex(s);
            SystemImageList.GetIcon(ImageIndex, Icon);
            ImageIndex := ImageList_AddIcon(ImagesDataModule.ImageList.Handle, Icon.Handle);
          finally
            Icon.Free;
          end;
          Action.ImageIndex := ImageIndex;
          ActionClientItem.Action := Action;
          Inc(j);
        end;
      end;
      { Divider }
      if Files.Count > 0 then
      begin
        ActionClientItem := ReopenActionClientItem.Items.Add;
        ActionClientItem.Caption := '-';
        { Clear }
        ActionClientItem := ReopenActionClientItem.Items.Add;
        ActionClientItem.Action := FileReopenClearAction;
      end;
    finally
      Free;
      Files.Free;
    end;
  finally
    SystemImageList.Free;
  end;
end;

procedure TMainForm.FileReopenClearActionExecute(Sender: TObject);
begin
  with TBigIniFile.Create(GetIniFilename) do
  try
    EraseSection('FileReopenFiles');
  finally
    Free;
  end;
  CreateFileReopenList;
end;

function TMainForm.GetActionClientItem(MenuItemIndex, SubMenuItemIndex: Integer): TActionClientItem;
begin
  Result := ActionMainMenuBar.ActionClient.Items[MenuItemIndex];
  Result := Result.Items[SubMenuItemIndex];
end;

procedure TMainForm.SelectLanguageActionExecute(Sender: TObject);
var
  i: Integer;
  ActionCaption: string;
  Action: TAction;
  ActionClientItem: TActionClientItem;
begin
  Action := Sender as TAction;
  ActionCaption := StringReplace(Action.Caption, '&', '', [rfReplaceAll]);

  with TBigIniFile.Create(GetIniFilename) do
  try
    WriteString('Options', 'Language', ActionCaption);
  finally
    Free;
  end;

  ActionClientItem := GetActionClientItem(VIEW_MENU_ITEMINDEX, VIEW_LANGUAGE_MENU_ITEMINDEX);
  for i := 0 to ActionClientItem.Items.Count - 1 do
    TAction(ActionClientItem.Items[i].Action).Checked := False;
  Action.Checked := True;

  ReadLanguageFile(ActionCaption);
  Application.ProcessMessages;
  UpdateStatusBar;
end;

procedure TMainForm.SelectReopenFileActionExecute(Sender: TObject);
var
  FileName: string;
  Action: TAction;
begin
  Action := Sender as TAction;
  FileName := System.Copy(Action.Caption, Pos(' ', Action.Caption) + 1, Length(Action.Caption));
  FDocumentFrame.Open(FileName);
end;

procedure TMainForm.MainMenuTitleBarActions(Enabled: Boolean);
var
  i: Integer;
begin
  { Bug? If the title bar action client has an action, its hint is shown always after menu item hint.
    So, the menu item hints are then never shown. We need the dummy actions here only to update the language. }
  if Enabled then
  with ActionMainMenuBar.ActionClient do
  begin
    Items[0].Action := FileMenuAction;
    Items[1].Action := EditMenuAction;
    Items[2].Action := SearchMenuAction;
    Items[3].Action := ViewMenuAction;
    Items[4].Action := DocumentMenuAction;
    Items[5].Action := ToolsMenuAction;
    Items[6].Action := HelpMenuAction;
  end
  else
  with ActionMainMenuBar.ActionClient do
    for i := 0 to 6 do
      Items[i].Action := nil;
end;

procedure TMainForm.ReadLanguageFile(SelectedLanguage: string);
begin
  if SelectedLanguage = '' then
    Exit;
  { update language constants }
  BCCommon.LanguageStrings.ReadLanguageFile(SelectedLanguage);
  { update mainform }
  MainMenuTitleBarActions(True);
  UpdateLanguage(Self, SelectedLanguage);
  MainMenuTitleBarActions(False);
  { update frames }
  UpdateLanguage(TForm(FDirectoryFrame), SelectedLanguage);
  FDocumentFrame.UpdateLanguage(SelectedLanguage);
  UpdateLanguage(TForm(FOutputFrame), SelectedLanguage);
end;

procedure TMainForm.SelectStyleActionExecute(Sender: TObject);
var
  i, j: Integer;
  ActionCaption: string;
  Action: TAction;
  ActionClientItem: TActionClientItem;
  StyleInfo: TStyleInfo;
begin
  Action := Sender as TAction;
  ActionCaption := StringReplace(Action.Caption, '&', '', [rfReplaceAll]);

  if Action.Caption = STYLENAME_WINDOWS then
    TStyleManager.TrySetStyle(ActionCaption)
  else
  if TStyleManager.IsValidStyle(ActionCaption, StyleInfo) then
  begin
    if Assigned(TStyleManager.Style[StyleInfo.Name]) then
      TStyleManager.TrySetStyle(StyleInfo.Name)
    else
      TStyleManager.SetStyle(TStyleManager.LoadFromFile(ActionCaption));
  end;

  with TBigIniFile.Create(GetIniFilename) do
  try
    WriteString('Options', 'StyleFilename', ExtractFilename(ActionCaption));
  finally
    Free;
  end;

  ActionClientItem := GetActionClientItem(VIEW_MENU_ITEMINDEX, VIEW_STYLE_MENU_ITEMINDEX);
  for i := 0 to ActionClientItem.Items.Count - 1 do
    for j := 0 to ActionClientItem.Items[i].Items.Count - 1 do
      TAction(ActionClientItem.Items[i].Items[j].Action).Checked := False;
  Action.Checked := True;
  UpdateControls;
end;

procedure TMainForm.UpdateControls;
begin
  FDirectoryFrame.UpdateControls;
  FDocumentFrame.UpdateMarginAndControls;
  FOutputFrame.UpdateControls;
  //UpdateToolBar;
  UpdateStatusBar;
  RecreateDragDrop;
  if TStyleManager.ActiveStyle.Name = STYLENAME_WINDOWS then
    HighlighterPanel.Padding.Left := 4
  else
    HighlighterPanel.Padding.Left := 0;
end;

procedure TMainForm.ToggleBookmarksActionExecute(Sender: TObject);
var
  Action: TAction;
begin
  Action := Sender as TAction;
  FDocumentFrame.ToggleBookMarks(Action.Tag);
end;

procedure TMainForm.GotoBookmarksActionExecute(Sender: TObject);
var
  Action: TAction;
begin
  Action := Sender as TAction;
  FDocumentFrame.GotoBookMarks(Action.Tag);
end;

procedure TMainForm.CreateLanguageMenu;
var
  i: Integer;
  LanguagePath, FileName, ExtractedFileName, LanguageName: string;
  ActionClientItem: TActionClientItem;
  Action: TAction;
begin
  ViewLanguageAction.Enabled := False;
  LanguagePath := IncludeTrailingPathDelimiter(Format('%s%s', [ExtractFilePath(ParamStr(0)), 'Languages']));
  if not DirectoryExists(LanguagePath) then
    Exit;

  LanguageName := GetSelectedLanguage('English');
  i := 1;
  for FileName in TDirectory.GetFiles(LanguagePath, '*.lng') do
  begin
    ActionClientItem := GetActionClientItem(VIEW_MENU_ITEMINDEX, VIEW_LANGUAGE_MENU_ITEMINDEX);
    ActionClientItem := ActionClientItem.Items.Add;

    Action := TAction.Create(ActionManager);
    ExtractedFileName := ExtractFilename(ChangeFileExt(FileName, ''));
    Action.Caption := ExtractedFileName;
    Action.Name := Format('%s%d%s', [RemoveNonAlpha(ExtractedFileName), i, 'LanguageSelectAction']);
    Action.OnExecute := SelectLanguageActionExecute;
    Action.Checked := LanguageName = ExtractedFileName;
    ActionClientItem.Action := Action;
    Inc(i);
  end;
  ActionClientItem := GetActionClientItem(VIEW_MENU_ITEMINDEX, VIEW_LANGUAGE_MENU_ITEMINDEX);
  ViewLanguageAction.Enabled := ActionClientItem.Items.Count > 0;
end;

procedure TMainForm.CreateStyleMenu;
var
  FilePath, FileName, StyleName, ActionCaption: string;
  StyleInfo: TStyleInfo;
  ActionClientItem: TActionClientItem;
  Action: TAction;

  procedure SetMenuItem;
  var
    i: Integer;
  begin
    ActionClientItem := GetActionClientItem(VIEW_MENU_ITEMINDEX, VIEW_STYLE_MENU_ITEMINDEX);
    { alphabet submenu }
    for i := 0 to ActionClientItem.Items.Count - 1 do
    begin
      ActionCaption := StringReplace(ActionClientItem.Items[i].Caption, '&', '', [rfReplaceAll]);
      if ActionCaption = StyleName[1] then
      begin
        ActionClientItem := ActionClientItem.Items[i];
        Break;
      end;
    end;
    ActionCaption := StringReplace(ActionClientItem.Caption, '&', '', [rfReplaceAll]);
    if ActionCaption <> StyleName[1] then
    begin
      ActionClientItem := ActionClientItem.Items.Add;
      ActionClientItem.Caption := StyleName[1];
    end;
    ActionClientItem := ActionClientItem.Items.Add;
  end;

begin
  ViewStyleAction.Enabled := False;
  FilePath := IncludeTrailingPathDelimiter(Format('%s%s', [ExtractFilePath(ParamStr(0)), 'Styles']));
  if not DirectoryExists(FilePath) then
    Exit;

  for FileName in TDirectory.GetFiles(FilePath, '*.vsf') do
  begin
    if TStyleManager.IsValidStyle(FileName, StyleInfo) then
    begin
      StyleName := ExtractFileName(FileName);
      { Style menu item }
      SetMenuItem;
      Action := TAction.Create(ActionManager);
      Action.Name := StringReplace(StyleInfo.Name, ' ', '', [rfReplaceAll]) + 'StyleSelectAction';
      Action.Caption := FileName;
      Action.OnExecute := SelectStyleActionExecute;
      Action.Checked :=  TStyleManager.ActiveStyle.Name = StyleInfo.Name;
      ActionClientItem.Action := Action;
      ActionClientItem.Caption := StyleInfo.Name;
    end;
  end;
  { Windows }
  StyleName := 'Windows.vsf';
  SetMenuItem;
  Action := TAction.Create(ActionManager);
  Action.Name := 'WindowsStyleSelectAction';
  Action.Caption := STYLENAME_WINDOWS;
  Action.OnExecute := SelectStyleActionExecute;
  Action.Checked :=  TStyleManager.ActiveStyle.Name = STYLENAME_WINDOWS;
  ActionClientItem.Action := Action;
  ViewStyleAction.Enabled := True;
end;

procedure TMainForm.SearchToggleBookmarkActionExecute(Sender: TObject);
var
  SynEdit: TBCSynEdit;
begin
  SynEdit := FDocumentFrame.GetActiveSynEdit;
  if Assigned(SynEdit) then
    SynEdit.ToggleBookMark
  else
  begin
    SynEdit := FDocumentFrame.GetActiveSplitSynEdit;
    if Assigned(SynEdit) then
      SynEdit.ToggleBookMark
  end;
end;

procedure TMainForm.ViewOpenDirectoryActionExecute(Sender: TObject);
begin
  FDirectoryFrame.OpenDirectory;
  if not DirectoryPanel.Visible then
  begin
    DirectoryPanel.Visible := True;
    VerticalSplitter.Visible := True;
  end;
end;

procedure TMainForm.ReadIniSizePositionAndState;
var
  State: Integer;
begin
  with TBigIniFile.Create(GetIniFilename) do
  try
    { Size }
    Width := ReadInteger('Size', 'Width', Round(Screen.Width * 0.8));
    Height := ReadInteger('Size', 'Height', Round(Screen.Height * 0.8));
    { Position }
    Left := ReadInteger('Position', 'Left', (Screen.Width - Width) div 2);
    Top := ReadInteger('Position', 'Top', (Screen.Height - Height) div 2);
    { Check if the form is outside the workarea }
    Left := SetFormInsideWorkArea(Left, Width);
    { Directory }
    DirectoryPanel.Width := ReadInteger('Options', 'DirectoryWidth', 257);
    Application.ProcessMessages;
    { State }
    State := ReadInteger('Size', 'State', 0);
    case State of
      0: WindowState := wsNormal;
      1: WindowState := wsMinimized;
      2: WindowState := wsMaximized;
    end;
  finally
    Free;
  end;
end;

procedure TMainForm.ReadIniOptions;
begin
  OptionsContainer.ReadIniFile;

  with TBigIniFile.Create(GetIniFilename) do
  try
    { Options }
    StatusBar.Visible := ReadBool('Options', 'ShowStatusbar', True);
    DirectoryPanel.Visible := ReadBool('Options', 'ShowDirectory', True);
    HighlighterComboBox.Visible := ReadBool('Options', 'ShowHighlighterSelection', True);
    EncodingComboBox.Visible := ReadBool('Options', 'ShowEncodingSelection', False);
    VerticalSplitter.Visible := DirectoryPanel.Visible;

    ViewXMLTreeAction.Checked := OptionsContainer.ShowXMLTree;
    ViewWordWrapAction.Checked := OptionsContainer.EnableWordWrap;
    ViewLineNumbersAction.Checked := OptionsContainer.EnableLineNumbers;
    ViewSpecialCharsAction.Checked := OptionsContainer.EnableSpecialChars;
    ViewSelectionModeAction.Checked := OptionsContainer.EnableSelectionMode;
  finally
    Free;
  end;
end;

procedure TMainForm.ToolsUnicodeCharacterMapActionExecute(Sender: TObject);
begin
  UnicodeCharacterMapForm.Open(FDocumentFrame);
end;

procedure TMainForm.WriteIniFile;
var
  State: Integer;
begin
  with TBigIniFile.Create(GetIniFilename) do
  try
    WriteString(Application.Title, 'Version', AboutDialog.Version);
    if WindowState = wsNormal  then
    begin
      { Position }
      WriteInteger('Position', 'Left', Left);
      WriteInteger('Position', 'Top', Top);
      { Size }
      WriteInteger('Size', 'Width', Width);
      WriteInteger('Size', 'Height', Height);
    end;
    State := 0; { just for warning... }
    case WindowState of
      wsNormal: State := 0;
      wsMinimized: State := 1;
      wsMaximized: State := 2;
    end;
    WriteInteger('Size', 'State', State);
    { Options }
    WriteInteger('Options', 'DirectoryWidth', DirectoryPanel.Width);
    WriteBool('Options', 'ShowToolBar', ToolBarPanel.Visible);
    WriteBool('Options', 'ShowStatusbar', StatusBar.Visible);
    WriteBool('Options', 'ShowDirectory', DirectoryPanel.Visible);
    WriteBool('Options', 'ShowHighlighterSelection', HighlighterComboBox.Visible);
    WriteBool('Options', 'ShowEncodingSelection', EncodingComboBox.Visible);
    WriteBool('Options', 'ShowXMLTree', ViewXMLTreeAction.Checked);
    { Toolbar }
    EraseSection('ActionToolBar'); { deprecated }
  finally
    Free;
  end;
end;

procedure TMainForm.ViewEncodingSelectionActionExecute(Sender: TObject);
begin
  EncodingComboBox.Visible := not EncodingComboBox.Visible;
end;

procedure TMainForm.SearchGotoLineActionExecute(Sender: TObject);
begin
  FDocumentFrame.GotoLine;
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

procedure TMainForm.ApplicationEventsMessage(var Msg: tagMSG;
  var Handled: Boolean);
begin
  if FProcessingEventHandler then
    Exit;
  if not Assigned(FDocumentFrame) then
    Exit;
  if FDocumentFrame.Processing then
    Exit;
  SetFields;
end;

procedure TMainForm.SetFields;
var
  i: Integer;
  ActiveDocumentName: string;
  ActiveDocumentFound: Boolean;
  InfoText: string;
  KeyState: TKeyboardState;
  SelectionFound: Boolean;
  IsXMLDocument: Boolean;
  ReopenActionClientItem: TActionClientItem;
  BookmarkList: TSynEditMarkList;
  GotoBookmarksAction, ToggleBookmarksAction: TAction;
begin
  FProcessingEventHandler := True;
  ActiveDocumentFound := FDocumentFrame.ActiveDocumentFound;
  SelectionFound := FDocumentFrame.SelectionFound;
  IsXMLDocument := FDocumentFrame.IsXMLDocument;
  BookmarkList := FDocumentFrame.GetActiveBookmarkList;

  ViewToolbarAction.Checked := ToolBarPanel.Visible;
  ViewStatusbarAction.Checked := StatusBar.Visible;
  ViewOutputAction.Checked := OutputPanel.Visible;
  ViewDirectoryAction.Enabled := FDirectoryFrame.IsAnyDirectory;
  ViewDirectoryAction.Checked := DirectoryPanel.Visible;
  HorizontalSplitter.Visible := OutputPanel.Visible;
  { fix for rare splitter bug - set output panel under splitter }
  if OutputPanel.Visible then
    OutputPanel.Top := HorizontalSplitter.Top + HorizontalSplitter.Height;

  ViewHighlighterSelectionAction.Checked := HighlighterComboBox.Visible;
  ViewEncodingSelectionAction.Checked := EncodingComboBox.Visible;

  ViewXMLTreeAction.Visible := ActiveDocumentFound and IsXMLDocument;
  if ViewXMLTreeAction.Visible then
    ViewXMLTreeAction.Checked := FDocumentFrame.XMLTreeVisible;

  ActiveDocumentName := FDocumentFrame.ActiveDocumentName;
  if ActiveDocumentName = '' then
    ActiveDocumentName := FDocumentFrame.ActiveTabSheetCaption;

  if ActiveDocumentName = '' then
    Caption := Application.Title
  else
    Caption := Format(Application.Title + MAIN_CAPTION_DOCUMENT, [ActiveDocumentName]);
  FilePropertiesAction.Enabled := ActiveDocumentFound and (ActiveDocumentName <> '');

  ReopenActionClientItem := GetActionClientItem(FILE_MENU_ITEMINDEX, FILE_REOPEN_MENU_ITEMINDEX);
  FileReopenAction.Enabled := ReopenActionClientItem.Items.Count > 0;
  FileCloseAction.Enabled := FDocumentFrame.OpenTabSheets;
  FileCloseAllAction.Enabled := FileCloseAction.Enabled;
  FileCloseAllOtherPagesAction.Enabled := FileCloseAction.Enabled;
  ViewNextPageAction.Enabled := FDocumentFrame.OpenTabSheetCount > 1;
  ViewPreviousPageAction.Enabled := ViewNextPageAction.Enabled;
  FileSaveAsAction.Enabled := FileCloseAction.Enabled and ActiveDocumentFound;
  FileSaveAction.Enabled := FDocumentFrame.ActiveDocumentModified and ActiveDocumentFound;
  FileSaveAllAction.Enabled := FDocumentFrame.ModifiedDocuments and ActiveDocumentFound;
  FilePrintAction.Enabled := FileCloseAction.Enabled and ActiveDocumentFound;
  FilePrintPreviewAction.Enabled := FileCloseAction.Enabled and ActiveDocumentFound;
  FileSelectFromDirectoryAction.Enabled := DirectoryPanel.Visible and ActiveDocumentFound and FDirectoryFrame.IsAnyDirectory;
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
  EditInsertTagAction.Enabled := ActiveDocumentFound;
  EditInsertDateTimeAction.Enabled := ActiveDocumentFound;
  EditRemoveWhiteSpaceAction.Enabled := SelectionFound;
  EditInsertLineAction.Enabled := ActiveDocumentFound;
  EditDeleteWordAction.Enabled := ActiveDocumentFound;
  EditDeleteLineAction.Enabled := ActiveDocumentFound;
  EditDeleteEOLAction.Enabled := ActiveDocumentFound;
  try
    EditPasteAction.Enabled := Clipboard.HasFormat(CF_TEXT) and ActiveDocumentFound;
  except
    { silent }
  end;
  ViewSelectionModeAction.Enabled := ActiveDocumentFound;
  ViewSelectionModeAction.Checked := ActiveDocumentFound and FDocumentFrame.SelectionModeChecked;
  ViewSplitAction.Enabled := ActiveDocumentFound;
  ViewSplitAction.Checked := ActiveDocumentFound and FDocumentFrame.SplitChecked;
  ViewMinimapAction.Enabled := ActiveDocumentFound;
  ViewMinimapAction.Checked := ActiveDocumentFound and FDocumentFrame.MinimapChecked;

  SearchAction.Enabled := ActiveDocumentFound;
  SearchGotoLineAction.Enabled := ActiveDocumentFound;
  SearchReplaceAction.Enabled := ActiveDocumentFound;
  SearchFindInFilesAction.Enabled := Assigned(FOutputFrame) and not FOutputFrame.ProcessingTabSheet;
  SearchFindNextAction.Enabled := ActiveDocumentFound;
  SearchFindPreviousAction.Enabled := ActiveDocumentFound;
  SearchToggleBookmarkAction.Enabled := OptionsContainer.MarginShowBookmarks and ActiveDocumentFound;
  SearchToggleBookmarksAction.Enabled := SearchToggleBookmarkAction.Enabled;
  SearchGotoBookmarksAction.Enabled := SearchToggleBookmarkAction.Enabled;
  SearchClearBookmarksAction.Enabled := SearchToggleBookmarkAction.Enabled;

  ViewWordWrapAction.Enabled := ActiveDocumentFound;
  ViewLineNumbersAction.Enabled := Assigned(FDocumentFrame) and (FDocumentFrame.OpenTabSheetCount > 0);
  ViewSpecialCharsAction.Enabled := ViewLineNumbersAction.Enabled;
  ToolsWordCountAction.Enabled := ActiveDocumentFound;
  ToolsSelectForCompareAction.Enabled := ActiveDocumentFound and not FDocumentFrame.ActiveDocumentModified;
  FormatXMLAction.Visible := ActiveDocumentFound and IsXMLDocument;

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

  ViewEditDirectoryAction.Enabled := DirectoryPanel.Visible;
  ViewCloseDirectoryAction.Enabled := DirectoryPanel.Visible;
  ViewSearchForFilesAction.Enabled := FDirectoryFrame.IsAnyDirectory and (FDirectoryFrame.SelectedPath <> '');

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
    if StatusBar.Panels[1].Text <> LanguageDataModule.GetConstant('Insert') then
      StatusBar.Panels[1].Text := LanguageDataModule.GetConstant('Insert');
  if KeyState[VK_INSERT] = 1 then
    if StatusBar.Panels[1].Text <> LanguageDataModule.GetConstant('Overwrite') then
      StatusBar.Panels[1].Text := LanguageDataModule.GetConstant('Overwrite');
  { Macro }
  MacroRecordPauseAction.Enabled := ActiveDocumentFound;
  MacroRecordPauseAction.ImageIndex := FDocumentFrame.GetMacroRecordPauseImageIndex;
  MacroStopAction.Enabled := ActiveDocumentFound and FDocumentFrame.IsRecordingMacro;
  MacroPlaybackAction.Enabled := ActiveDocumentFound and FDocumentFrame.IsMacroStopped;
  MacroOpenAction.Enabled := ActiveDocumentFound;
  MacroSaveAsAction.Enabled := MacroPlaybackAction.Enabled;
  if OptionsContainer.MarginShowBookmarks then
  begin
    { Bookmarks }
    for i := 1 to 9 do
    begin
      GotoBookmarksAction := TAction(FindComponent(Format('GotoBookmarks%dAction', [i])));
      GotoBookmarksAction.Enabled := False;
      GotoBookmarksAction.Caption := Format('%s &%d', [LanguageDataModule.GetConstant('Bookmark'), i]);
      ToggleBookmarksAction := TAction(FindComponent(Format('ToggleBookmarks%dAction', [i])));
      ToggleBookmarksAction.Caption := Format('%s &%d', [LanguageDataModule.GetConstant('Bookmark'), i]);
    end;
    if Assigned(BookmarkList) then
    for i := 0 to BookmarkList.Count - 1 do
    begin
      GotoBookmarksAction := TAction(FindComponent(Format('GotoBookmarks%dAction', [BookmarkList.Items[i].BookmarkNumber])));
      GotoBookmarksAction.Enabled := True;
      GotoBookmarksAction.Caption := Format('%s &%d: %s %d', [LanguageDataModule.GetConstant('Bookmark'),
        BookmarkList.Items[i].BookmarkNumber, LanguageDataModule.GetConstant('Line'), BookmarkList.Items[i].Line]);
      ToggleBookmarksAction := TAction(FindComponent(Format('ToggleBookmarks%dAction', [BookmarkList.Items[i].BookmarkNumber])));
      ToggleBookmarksAction.Caption := Format('%s &%d: %s %d', [LanguageDataModule.GetConstant('Bookmark'),
        BookmarkList.Items[i].BookmarkNumber, LanguageDataModule.GetConstant('Line'), BookmarkList.Items[i].Line]);
    end;
  end;
  FProcessingEventHandler := False;
end;

procedure TMainForm.ViewCloseDirectoryActionExecute(Sender: TObject);
begin
  FDirectoryFrame.CloseDirectory;
end;

procedure TMainForm.SearchClearBookmarksActionExecute(Sender: TObject);
begin
  FDocumentFrame.ClearBookmarks;
end;

procedure TMainForm.CompareFilesActionExecute(Sender: TObject);
begin
  FDocumentFrame.CompareFiles;
end;

procedure DoSearchForFilesOpenFile(var FileName: string);
begin
  MainForm.FDocumentFrame.Open(FileName);
end;

procedure TMainForm.ViewSearchForFilesActionExecute(Sender: TObject);
begin
  with SearchForFilesForm do
  begin
    OnOpenFile := DoSearchForFilesOpenFile;
    Open(FDirectoryFrame.SelectedPath);
  end;
end;

procedure TMainForm.ViewSelectionModeActionExecute(Sender: TObject);
begin
  FDocumentFrame.ToggleSelectionMode;
end;

procedure TMainForm.FileNewActionExecute(Sender: TObject);
begin
  FDocumentFrame.New;
  Repaint;
end;

procedure TMainForm.FileOpenActionExecute(Sender: TObject);
begin
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
  FDocumentFrame.Save;
  Repaint;
end;

procedure TMainForm.FileSaveAsActionExecute(Sender: TObject);
begin
  FDocumentFrame.SaveAs;
  Repaint;
end;

procedure TMainForm.FileSelectFromDirectoryActionExecute(Sender: TObject);
begin
  if FDocumentFrame.ActiveDocumentName <> '' then
    if Assigned(FDirectoryFrame) then
      if FDirectoryFrame.IsAnyDirectory then
        FDirectoryFrame.OpenPath(ExtractFileDrive(FDocumentFrame.ActiveDocumentName), FDocumentFrame.ActiveDocumentName,
          FDirectoryFrame.ExcludeOtherBranches);
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

procedure TMainForm.FilePropertiesActionExecute(Sender: TObject);
begin
  FDocumentFrame.FileProperties;
end;

procedure TMainForm.FileReopenActionExecute(Sender: TObject);
begin
  { dummy action }
end;

procedure TMainForm.FileExitActionExecute(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.UpdateMainMenuBar;
begin
  OptionsContainer.AssignTo(ActionMainMenuBar);
end;

procedure TMainForm.FormActivate(Sender: TObject);
begin
  UpdateMainMenuBar;
  if Assigned(FDirectoryFrame) then
    FDirectoryFrame.Repaint;
  if Assigned(FDocumentFrame) then
    FDocumentFrame.Repaint;
  if Assigned(FOutputFrame) then
    FOutputFrame.Repaint;
  Repaint;
end;

procedure TMainForm.FormatXMLActionExecute(Sender: TObject);
begin
  FDocumentFrame.FormatXML;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FOutputFrame.ProcessingTabSheet then
    FOutputFrame.CloseTabSheet;
  FDocumentFrame.CloseAll(False);
  if FNoIni then
    Exit;
  OptionsContainer.WriteIniFile;
  FDocumentFrame.WriteIniFile;
  FDirectoryFrame.WriteIniFile;
  FOutputFrame.WriteOutputFile;
  WriteIniFile;
  OptionsContainer.Free;
end;

procedure OutputOpenAllEvent(var FileNames: TStrings);
var
  i, j: Integer;
begin
  Screen.Cursor := crHourGlass;
  try
    j := FileNames.Count;
    MainForm.ProgressBar.Count := j;
    MainForm.ProgressBar.Show;
    for i := 0 to j - 1 do
    begin
      MainForm.ProgressBar.StepIt;
      MainForm.FDocumentFrame.Open(FileNames.Strings[i]);
    end;
    MainForm.ProgressBar.Hide;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TMainForm.CreateActionToolBar(CreateToolBar: Boolean);
var
  i: Integer;
  s: string;
  ToolBarItems: TStrings;
  ActionClientItem: TActionClientItem;
  ActionBarItem: TActionBarItem;
  IsChanged: Boolean;

  function FindItemByName(ItemName: string): TContainedAction;
  var
    j: Integer;
  begin
    Result := nil;
    for j := 0 to ActionManager.ActionCount - 1 do
      if ActionManager.Actions[j].Name = ItemName then
        Exit(ActionManager.Actions[j]);
  end;

begin
  ActionBarItem := ActionManager.ActionBars[1];
  ToolBarItems := TStringList.Create;
  with TBigIniFile.Create(GetIniFilename) do
  try
    { update if changed }
    IsChanged := ReadBool('ToolBarItemsChanged', 'Changed', False);
    EraseSection('ToolBarItemsChanged');
    if IsChanged or CreateToolBar then
    begin
      ActionToolBar.Visible := False;
      { read items from ini }
      ReadSectionValues('ToolBarItems', ToolBarItems);
      if ToolBarItems.Count > 0 then
      begin
        { add items to action bar }
        ActionBarItem.Items.Clear;
        for i := 0 to ToolBarItems.Count - 1 do
        begin
          Application.ProcessMessages;
          ActionClientItem := ActionBarItem.Items.Add;
          s := System.Copy(ToolBarItems.Strings[i], Pos('=', ToolBarItems.Strings[i]) + 1, Length(ToolBarItems.Strings[i]));
          if s <> '-' then
          begin
            ActionClientItem.Action := FindItemByName(s);
            ActionClientItem.ShowCaption := False;
          end
          else
          begin
            ActionClientItem.Caption := '-';
            ActionClientItem.CommandStyle := csSeparator;
          end;
        end;
      end;
      ActionToolBar.Visible := True;
    end
    else
    begin
      { if items doesn't exist in ini, create them }
      for i := 0 to ActionBarItem.Items.Count - 1 do
      begin
        ActionClientItem := ActionBarItem.Items[i];
        if Assigned(ActionClientItem.Action) then
          WriteString('ToolBarItems', IntToStr(i), ActionClientItem.Action.Name)
        else
          WriteString('ToolBarItems', IntToStr(i), '-')
      end;
    end;
  finally
    Free;
    ToolBarItems.Free;
  end;
end;

procedure TMainForm.CreateFrames;
begin
  { TOutputFrame }
  FOutputFrame := TOutputFrame.Create(OutputPanel);
  FOutputFrame.Parent := OutputPanel;
  FOutputFrame.OnTabsheetDblClick := OutputDblClickActionExecute;
  FOutputFrame.OnOpenAll := OutputOpenAllEvent;
  FOutputFrame.ReadOutputFile;
  OutputPanel.Visible := FOutputFrame.IsAnyOutput;
  { TDocumentFrame }
  FDocumentFrame := TDocumentFrame.Create(DocumentPanel);
  FDocumentFrame.Parent := DocumentPanel;
  FDocumentFrame.PopupMenu := DocumentPopupMenu;
  { TDirectoryFrame }
  FDirectoryFrame := TDirectoryFrame.Create(DirectoryPanel);
  FDirectoryFrame.Parent := DirectoryPanel;
  FDirectoryFrame.OnTabsheetDblClick := FileTreeViewDblClickActionExecute;
  FDirectoryFrame.OnSearchForFilesOpenFile := DoSearchForFilesOpenFile;
  FDirectoryFrame.SearchForFilesAction := SearchFindInFilesAction;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  FOnStartUp := True;
  ActionManager.ActionBars[0].Items.AutoHotKeys := False;
  ActionManager.Style := PlatformVclStylesStyle;
  ActionManager.Images := ImagesDataModule.ImageList; { IDE can lose this }
  BCCommon.LanguageStrings.ReadLanguageFile(GetSelectedLanguage('English'));
  FImageListCount := ImagesDataModule.ImageList.Count; { System images are appended after menu icons }
  ReadIniOptions;
  CreateActionToolBar(True);
  CreateFrames;
  UpdateStatusBar;
  ReadIniSizePositionAndState;
  ToolBarPanel.Visible := OptionsContainer.ToolBarVisible;
  {$IFDEF RELEASE}
  ToolsDuplicateCheckerAction.Visible := False;
  {$ENDIF}
  { IDE can lose these properties }
  ActionManager.Images := ImagesDataModule.ImageList;
  DocumentPopupMenu.Images := ImagesDataModule.ImageList;
end;

procedure TMainForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = 9) then
    FDocumentFrame.NextPage;
end;

procedure TMainForm.FormResize(Sender: TObject);
begin
  ResizeProgressBar;
  ActionMainMenuBar.Width := Width;
  ActionMainMenuBar.Refresh;
  Repaint;
end;

procedure TMainForm.FormShow(Sender: TObject);
var
  i: Integer;
  SynEdit: TBCSynEdit;
begin
  { Style change will call the FormShow }
  if FOnStartUp then
  begin
    if not FDocumentFrame.ReadIniOpenFiles and (ParamCount = 0) or
      (ParamCount = 1) and (ParamStr(1) = PARAM_NO_INI) then
      FDocumentFrame.New;
    FNoIni := False;
    if ParamCount > 0 then
      for i := 1 to ParamCount do
      begin
        if ParamStr(i) = PARAM_NO_INI then
          FNoIni := True
        else
          FDocumentFrame.Open(ParamStr(i), nil, 0, 0, True);
      end;
    ReadLanguageFile(GetSelectedLanguage);
    CreateLanguageMenu;
    CreateStyleMenu;
    CreateFileReopenList;
    CreateProgressBar;

    UpdateControls;

    FOnStartUp := False;

    SynEdit := FDocumentFrame.GetActiveSynEdit;
    if Assigned(SynEdit) then
      if SynEdit.CanFocus then
        SynEdit.SetFocus;
  end;
end;

procedure TMainForm.ResizeProgressBar;
var
  R: TRect;
begin
  if Assigned(FProgressBar) then
  begin
    Statusbar.Perform(SB_GETRECT, 3, Integer(@R));
    FProgressBar.Top    := R.Top;
    FProgressBar.Left   := R.Left;
    FProgressBar.Width  := R.Right - R.Left;
    FProgressBar.Height := R.Bottom - R.Top;
  end;
end;

procedure TMainForm.CreateProgressBar;
begin
  FProgressBar := TBCProgressBar.Create(StatusBar);
  FProgressBar.Hide;
  ResizeProgressBar;
  FProgressBar.Parent := Statusbar;
  FDocumentFrame.ProgressBar := FProgressBar;
end;

procedure TMainForm.HelpAboutActionExecute(Sender: TObject);
begin
  AboutDialog.Open;
end;

procedure TMainForm.HelpCheckForUpdatesMenuActionExecute(Sender: TObject);
begin
  CheckForUpdates(Application.Title, AboutDialog.Version);
end;

procedure TMainForm.HelpHomeActionExecute(Sender: TObject);
begin
  BrowseURL(BONECODE_URL);
end;

procedure TMainForm.HighlighterComboBoxChange(Sender: TObject);
begin
  if HighlighterComboBox.ItemIndex <> -1 then
  begin
    FDocumentFrame.SetActiveHighlighter(HighlighterComboBox.ItemIndex);
    FDocumentFrame.UpdateMarginAndControls;
  end;
end;

procedure TMainForm.HTMLErrorTimerTimer(Sender: TObject);
var
  i: Integer;
  ErrorList: TList;
  OutputObject: POutputRec;
  Root: PVirtualNode;
  OutputTreeView: TVirtualDrawTree;
begin
  if not OptionsContainer.HTMLErrorChecking then
    Exit;
  if not Assigned(FOutputFrame) then
    Exit;
  if FOutputFrame.ProcessingTabSheet then
    Exit;

  ErrorList := FDocumentFrame.GetHTMLErrors;
  if Assigned(ErrorList) then
  begin
    OutputTreeView := FOutputFrame.AddErrorTreeView;
    FOutputFrame.ProcessingTabSheet := True;
    if ErrorList.Count > 0 then
    begin
      Root := nil;
      for i := 0 to ErrorList.Count - 1 do
      begin
        OutputObject := ErrorList.Items[i];
        FOutputFrame.AddTreeViewLine(OutputTreeView, Root, OutputObject.FileName, OutputObject.Ln, OutputObject.Ch,
          String(OutputObject.Text));
      end;
    end
    else
    begin
      FOutputFrame.ProcessingTabSheet := False;
      FOutputFrame.CloseErrorTabSheet;
    end;
    FOutputFrame.ShowErrorTabSheet;
    OutputPanel.Visible := True;
    FOutputFrame.ProcessingTabSheet := False;
  end
end;

procedure TMainForm.DummyActionExecute(Sender: TObject);
begin
  { dummy action for language algorithm }
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

procedure TMainForm.DirectorySearchFindInFilesActionExecute(Sender: TObject);
begin
  SearchFindInFiles(FDirectoryFrame.SelectedPath);
end;

procedure TMainForm.DragDropDrop(Sender: TObject; Pos: TPoint;
  Value: TStrings);
var
  i: Integer;
begin
  if FDocumentFrame.IsCompareFilesActivePage then
  begin
    if Value.Count > 1 then
      for i := 0 to Value.Count - 1 do
        FDocumentFrame.CompareFiles(Value.Strings[i])
    else
      FDocumentFrame.CompareFiles(Value.Strings[0], True)
  end
  else
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

procedure TMainForm.ViewStatusBarActionExecute(Sender: TObject);
begin
  with StatusBar do
  Visible := not Visible;
end;

procedure TMainForm.SearchFindInFilesActionExecute(Sender: TObject);
begin
  if TControl(Sender).Name = 'DirectoryFindInFilesAction' then
    SearchFindInFiles(FDirectoryFrame.SelectedPath)
  else
    SearchFindInFiles;
end;

procedure TMainForm.SearchFindInFiles(Folder: string = '');
var
  T1, T2: TTime;
  SynEdit: TBCSynEdit;
  Min, Secs: Integer;
  TimeDifference: string;
  OutputTreeView: TVirtualDrawTree;
  Root: PVirtualNode;
begin
  OutputTreeView := nil;
  with FindInFilesDialog do
  begin
    if Folder <> '' then
      FolderText := Folder
    else
    if FolderText = '' then
      if Assigned(FDirectoryFrame) then
        FolderText := FDirectoryFrame.SelectedPath;
    Extensions := OptionsContainer.Extensions;
    SynEdit := FDocumentFrame.GetActiveSynEdit;
    if Assigned(SynEdit) then
      if SynEdit.SelAvail then
        FindWhatComboBox.Text := SynEdit.SelText;
    if ShowModal = mrOk then
    begin
      FProgressBar.Count := CountFilesInFolder(FolderText);
      FProgressBar.Show;
      T1 := Now;
      try
        OutputPanel.Visible := True;
        OutputTreeView := FOutputFrame.AddTreeView(Format(LanguageDataModule.GetConstant('SearchFor'), [FindWhatText]));
        FOutputFrame.ProcessingTabSheet := True;
        Application.ProcessMessages;
        OutputTreeView.ScrollBarOptions.ScrollBars := System.UITypes.TScrollStyle.ssNone;
        FindInFiles(OutputTreeView, FindWhatText, FileTypeText, FolderText, SearchCaseSensitive, LookInSubfolders);
        OutputTreeView.ScrollBarOptions.ScrollBars := System.UITypes.TScrollStyle.ssBoth;
      finally
        FProgressBar.Hide;
        T2 := Now;
        if not FOutputFrame.CancelSearch then
        begin
          if FOutputFrame.IsEmpty then
          begin
            Root := nil;
            FOutputFrame.AddTreeViewLine(OutputTreeView, Root, '', -1, 0,
              Format(LanguageDataModule.GetMessage('CannotFindString'), [FindWhatText]));
            StatusBar.Panels[3].Text := '';
          end;
          Min := StrToInt(FormatDateTime('n', T2 - T1));
          Secs := Min * 60 + StrToInt(FormatDateTime('s', T2 - T1));
          if Secs < 60 then
            TimeDifference := FormatDateTime(Format('s.zzz "%s"', [LanguageDataModule.GetConstant('Second')]), T2 - T1)
          else
            TimeDifference := FormatDateTime(Format('n "%s" s.zzz "%s"', [LanguageDataModule.GetConstant('Minute'), LanguageDataModule.GetConstant('Second')]), T2 - T1);
          StatusBar.Panels[3].Text := Format(LanguageDataModule.GetConstant('OccurencesFound'), [FOutputFrame.Count, TimeDifference])
        end;
        FOutputFrame.PageControl.EndDrag(False); { if close button pressed and search canceled, dragging will stay... }
        FOutputFrame.ProcessingTabSheet := False;
      end;
    end;
  end;
end;

procedure TMainForm.EditRedoActionExecute(Sender: TObject);
begin
  FDocumentFrame.Redo;
end;

procedure TMainForm.EditRemoveWhiteSpaceActionExecute(Sender: TObject);
begin
  FDocumentFrame.RemoveWhiteSpace;
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

procedure TMainForm.EditInsertDateTimeActionExecute(Sender: TObject);
begin
  FDocumentFrame.InsertDateAndTime;
end;

procedure TMainForm.EditInsertLineActionExecute(Sender: TObject);
begin
  FDocumentFrame.InsertLine;
end;

procedure TMainForm.EditInsertTagActionExecute(Sender: TObject);
begin
  FDocumentFrame.InsertTag;
end;

procedure TMainForm.EditCopyActionExecute(Sender: TObject);
begin
  FDocumentFrame.Copy;
end;

procedure TMainForm.EditPasteActionExecute(Sender: TObject);
begin
  FDocumentFrame.Paste;
end;

procedure TMainForm.ToolsConvertActionExecute(Sender: TObject);
begin
  ConvertForm.Open;
end;

procedure TMainForm.ToolsDuplicateCheckerActionExecute(Sender: TObject);
var
  DuplicateChecker: TDuplicateChecker;
begin
  with DuplicateCheckerOptionsDialog do
  try
    Extensions := OptionsContainer.Extensions;
    if Open then
    begin
      DuplicateChecker := TDuplicateChecker.Create(InputFolderName, FileTypeText, OutputFileName, MinBlockSize, MinChars, RemoveComments);
      try
        DuplicateChecker.Run;
        if LaunchAfterCreation then
          FDocumentFrame.Open(OutputFileName);
      finally
        DuplicateChecker.Free;
      end;
    end;
  finally
    Free;
  end;
end;

procedure TMainForm.ToolsLanguageEditorActionExecute(Sender: TObject);
begin
  LanguageEditorForm.Open;
  ReadLanguageFile(GetSelectedLanguage('English'));
end;

procedure TMainForm.ToolsOptionsActionExecute(Sender: TObject);
begin
  if FDocumentFrame.Options(ActionManager) then
  begin
    UpdateMainMenuBar;
    CreateActionToolBar;
    UpdateStatusBar;
    if Assigned(FOutputFrame) then
      FOutputFrame.SetOptions;
    if Assigned(FDirectoryFrame) then
    begin
      FDirectoryFrame.SetOptions;
      FDirectoryFrame.DirectoryRefreshAction.Execute;
    end;
    Repaint;
  end;
end;

procedure TMainForm.ToolsSelectForCompareActionExecute(Sender: TObject);
begin
  FDocumentFrame.SelectForCompare;
  Repaint;
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
  BrowseURL(FormatFileName(FDocumentFrame.ActiveDocumentName));
end;

procedure TMainForm.ViewLineNumbersActionExecute(Sender: TObject);
begin
  ViewLineNumbersAction.Checked := FDocumentFrame.ToggleLineNumbers;
end;

procedure TMainForm.ViewMiniMapActionExecute(Sender: TObject);
begin
  FDocumentFrame.ToggleMiniMap;
end;

procedure TMainForm.ViewNextPageActionExecute(Sender: TObject);
begin
  FDocumentFrame.NextPage;
end;

procedure TMainForm.ViewOutputActionExecute(Sender: TObject);
begin
  OutputPanel.Visible := not OutputPanel.Visible;
  Repaint;
end;

procedure TMainForm.ViewToolbarActionExecute(Sender: TObject);
begin
  OptionsContainer.ToolBarVisible := not OptionsContainer.ToolBarVisible;
  ToolBarPanel.Visible := OptionsContainer.ToolBarVisible;
end;

procedure TMainForm.ViewWordWrapActionExecute(Sender: TObject);
begin
  ViewWordWrapAction.Checked := FDocumentFrame.ToggleWordWrap;
  Repaint;
end;

procedure TMainForm.ViewXMLTreeActionExecute(Sender: TObject);
begin
  ViewXMLTreeAction.Checked := FDocumentFrame.ToggleXMLTree;
  Repaint;
end;

function TMainForm.GetStringList(Filename: string): TStringList;
var
  LFileStream: TFileStream;
  LBuffer: TBytes;
  WithBom: Boolean;
begin
  Result := TStringList.Create;
  FEncoding := nil;
  LFileStream := TFileStream.Create(FileName, fmOpenRead);
  try
    // Identify encoding
    if SynUnicode.IsUTF8(LFileStream, WithBom) then
    begin
      if WithBom then
        FEncoding := TEncoding.UTF8
      else
        FEncoding := TEncoding.UTF8WithoutBOM;
    end
    else
    begin
      // Read file into buffer
      SetLength(LBuffer, LFileStream.Size);
      LFileStream.ReadBuffer(Pointer(LBuffer)^, Length(LBuffer));
      TEncoding.GetBufferEncoding(LBuffer, FEncoding);
    end;
  finally
    LFileStream.Free;
  end;
  Result.LoadFromFile(FileName, FEncoding);
end;

{ Recursive method to find files. }
procedure TMainForm.FindInFiles(OutputTreeView: TVirtualDrawTree; FindWhatText, FileTypeText, FolderText: String; SearchCaseSensitive, LookInSubfolders: Boolean);
var
  shFindFile: THandle;
  sWin32FD: TWin32FindData;
  S, Line: WideString;
  FName: string;
  Ln, Ch, ChPos: LongWord;
  Found: Boolean;
  StringList: TStringList;
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
  {$WARNINGS OFF} { IncludeTrailingBackslash is specific to a platform }
  shFindFile := FindFirstFile(PChar(IncludeTrailingBackslash(FolderText) + '*.*'), sWin32FD);
  {$WARNINGS ON}
  if shFindFile <> INVALID_HANDLE_VALUE then
  try
    repeat
      if FOutputFrame.CancelSearch then
        Exit;
      FName := StrPas(sWin32FD.cFileName);

      if (FName <> '.') and (FName <> '..') then
      begin
        if LookInSubfolders and IsDirectory(sWin32FD) then
          {$WARNINGS OFF} { IncludeTrailingBackslash is specific to a platform }
          FindInFiles(OutputTreeView, FindWhatText, FileTypeText, IncludeTrailingBackslash(FolderText) + FName, SearchCaseSensitive, LookInSubfolders)
          {$WARNINGS ON}
        else
        begin
          ProgressBar.StepIt;
          Application.ProcessMessages;

          if IsExtInFileType(ExtractFileExt(FName), OptionsContainer.SupportedFileExts) then
            if (FileTypeText = '*.*') or IsExtInFileType(ExtractFileExt(FName), FileTypeText) then
            try
              {$WARNINGS OFF} { IncludeTrailingBackslash is specific to a platform }
              StringList := GetStringList(IncludeTrailingBackslash(String(FolderText)) + FName);
              {$WARNINGS ON}
              try
                Root := nil;
                if Trim(StringList.Text) <> '' then
                for Ln := 0 to StringList.Count - 1 do
                begin
                  Found := True;
                  Line := StringList.Strings[Ln];
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
                      if FOutputFrame.CancelSearch then
                        Break;
                      {$WARNINGS OFF} { IncludeTrailingBackslash is specific to a platform }
                      FOutputFrame.AddTreeViewLine(OutputTreeView, Root, IncludeTrailingBackslash(FolderText) + FName, Ln + 1, ChPos, Line, FindWhatText);
                      {$WARNINGS ON}
                      S := Copy(S, Ch + LongWord(Length(FindWhatText)), Length(S));
                      ChPos := ChPos + LongWord(Length(FindWhatText)) - 1;
                    end
                    else
                      Found := False;
                  end;
                end
              finally
                StringList.Free;
              end;
            except
              {$WARNINGS OFF}
              { IncludeTrailingBackslash is specific to a platform }
              FOutputFrame.AddTreeViewLine(OutputTreeView, Root, '', -1, 0,
                Format(LanguageDataModule.GetWarningMessage('FileAccessError'), [IncludeTrailingBackslash(FolderText) + FName]), '');
              {$WARNINGS ON}
            end;
        end;
      end;
    until not FindNextFile(shFindFile, sWin32FD);
  finally
    Winapi.Windows.FindClose(shFindFile);
  end;
end;

procedure TMainForm.SetHighlighterComboIndex(Value: Integer);
begin
  HighlighterComboBox.ItemIndex := Value;
end;

procedure TMainForm.SetEncodingComboIndex(Value: Integer);
begin
  EncodingComboBox.ItemIndex := Value;
  EncodingComboBox.Repaint;
end;

end.
