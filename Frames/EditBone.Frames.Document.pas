unit EditBone.Frames.Document;

interface

uses
  Winapi.Windows, Winapi.CommDlg, System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms,
  BCEditor.Editor, Vcl.ComCtrls, Vcl.ImgList, Vcl.Menus, BCControls.PageControl, Vcl.Buttons,
  Vcl.StdCtrls, Vcl.ActnList, System.Actions, BCControls.ProgressBar, BCControls.ImageList,
  Vcl.ActnMan, acAlphaImageList, sPageControl, BCEditor.Types,
  BCEditor.MacroRecorder, BCEditor.Print, Vcl.PlatformDefaultStyleActnCtrls, EditBone.Frames.Document.TabSheet,
  BCEditor.Editor.Bookmarks, BCCommon.Frames.Compare, BCCommon.Frames.Search, sFrameAdapter, BCCommon.Frames.Base,
  Vcl.Dialogs, sDialogs;

type
  TDocumentFrame = class(TFrame)
    ActionList: TActionList;
    ActionListXMLTreePopup: TActionList;
    ActionSelectionBoxDown: TAction;
    ActionSelectionBoxLeft: TAction;
    ActionSelectionBoxRight: TAction;
    ActionSelectionBoxUp: TAction;
    ActionXMLTreeRefresh: TAction;
    EditorMacroRecorder: TBCEditorMacroRecorder;
    FrameAdapter: TsFrameAdapter;
    ImageList16: TBCImageList;
    ImageList20: TBCImageList;
    ImageList24: TBCImageList;
    ImageListXMLTree: TBCImageList;
    MenuItemXMLRefresh: TMenuItem;
    OpenDialog: TsOpenDialog;
    PageControl: TBCPageControl;
    PopupMenuXMLTree: TPopupMenu;
    PrintDialog: TPrintDialog;
    SaveDialog: TsSaveDialog;
    EditorPrint: TBCEditorPrint;
    procedure PageControlChange(Sender: TObject);
    procedure EditorOnChange(Sender: TObject);
    procedure EditorEnter(Sender: TObject);
    procedure EditorReplaceText(Sender: TObject; const ASearch, AReplace: string; Line, Column: Integer; DeleteLine: Boolean; var Action: TBCEditorReplaceAction);
    procedure EditorSplitOnChange(Sender: TObject);
    procedure ActionXMLTreeRefreshExecute(Sender: TObject);
    procedure PageControlDblClick(Sender: TObject);
    procedure PageControlMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ActionSelectionBoxDownExecute(Sender: TObject);
    procedure ActionSelectionBoxLeftExecute(Sender: TObject);
    procedure ActionSelectionBoxRightExecute(Sender: TObject);
    procedure ActionSelectionBoxUpExecute(Sender: TObject);
    procedure PageControlCloseBtnClick(Sender: TComponent; TabIndex: Integer; var CanClose: Boolean;
      var Action: TacCloseAction);
  private
    FCaseCycle: Byte;
    FCompareImageIndex, FNewImageIndex: Integer;
    //FHTMLDocumentChanged: Boolean;
    //FHTMLErrorList: TList;
    FNumberOfNewDocument: Integer;
    FSelectedText: string;
    FImages: TBCImageList;
    FProcessing: Boolean;
    FProgressBar: TBCProgressBar;
    FModifiedDocuments: Boolean;
    //FFoundSearchItems: TObjectList;
    //function CanFindNextPrevious: Boolean;
    function CreateNewTabSheet(FileName: string = ''; ShowMinimap: Boolean = False): TBCEditor;
    //function FindHtmlVersion(Lines: TStrings): TSynWebHtmlVersion;
    function FindOpenFile(FileName: string): TBCEditor;
    function GetActiveDocumentFound: Boolean;
    function GetActiveDocumentModified: Boolean;
    function GetActiveDocumentName: string;
    function GetActivePageCaption: string;
    function GetActiveTabSheetCaption: string;
    function GetCanRedo: Boolean;
    function GetCanUndo: Boolean;
    function GetCompareFrame(TabSheet: TTabSheet): TCompareFrame;
    function GetDocTabSheetFrame(TabSheet: TTabSheet): TDocTabSheetFrame;
    function GetModifiedDocuments(CheckActive: Boolean = True): Boolean;
    function GetOpenTabSheetCount: Integer;
    //function GetOpenTabSheets: Boolean;
    function GetSelectionFound: Boolean;
    function GetSelectionModeChecked: Boolean;
    function GetSplitChecked: Boolean;
    function GetMinimapChecked: Boolean;
    function GetSplitEditor(TabSheet: TsTabSheet): TBCEditor;
    function GetEditor(TabSheet: TTabSheet): TBCEditor;
    function GetXMLTreeVisible: Boolean;
    function Save(TabSheet: TTabSheet; ShowDialog: Boolean = False): string; overload;
    //function SearchOptions(IncludeBackwards: Boolean): TSynSearchOptions;
    procedure AddToReopenFiles(FileName: string);
    //procedure CheckHTMLErrors;
    procedure CheckModifiedDocuments;
    //procedure DestroyHTMLErrorListItems;
    //procedure DoSearch(Editor: TBCEditor; SearchOnly: Boolean = False);
    //procedure DoSearch2(Editor: TBCEditor);
    procedure InitializeEditorPrint(EditorPrint: TBCEditorPrint);
    procedure SelectHighlighter(FileName: string);
    procedure SetActivePageCaptionModified;
    procedure SetBookmarks(Editor: TBCEditor; Bookmarks: TStrings);
//    procedure SetMainEncodingCombo(Editor: TBCEditor);
   // procedure SetMainHighlighterCombo(Editor: TBCEditor);
//    procedure SetSearchMapVisible(Value: Boolean);
    procedure SetSkinColors(Editor: TBCEditor);
    //procedure EditorHTMLOnChange(Sender: TObject);
    //procedure EditorHTMLPaintTransient(Sender: TObject; Canvas: TCanvas; TransientType: TTransientType);
    //procedure EditorPASPaintTransient(Sender: TObject; Canvas: TCanvas; TransientType: TTransientType);
    //procedure UpdateMarginAndColors(DocTabSheetFrame: TDocTabSheetFrame);
    //procedure UpdateHighlighterColors;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function GetActiveSplitEditor: TBCEditor;
    function GetActiveEditor: TBCEditor;
    function GetCaretInfo: string;
    //function GetHTMLErrors: TList;
    function GetMacroRecordPauseImageIndex: Integer;
    function GetModifiedInfo: string;
    function GetActiveBookmarkList: TBCEditorBookmarkList;
    function IsCompareFilesActivePage: Boolean;
    procedure InsertTag;
    function IsMacroStopped: Boolean;
    function IsRecordingMacro: Boolean;
    function IsSQLDocument: Boolean;
    function IsXMLDocument: Boolean;
    function Options(AActionList: TActionList): Boolean;
    function ReadIniOpenFiles: Boolean;
    function SaveAs: string;
    function ToggleLineNumbers: Boolean;
    function ToggleSpecialChars: Boolean;
    function ToggleWordWrap: Boolean;
    function ToggleXMLTree: Boolean;
    procedure CheckFileDateTimes;
    procedure ClearBookmarks;
    procedure Close(AFreePage: Boolean = True);
    procedure CloseAll;
    procedure CloseAllOtherPages;
    procedure CompareFiles(FileName: string = ''; AFileDragDrop: Boolean = False);
    procedure Copy;
    procedure Cut;
    procedure DecreaseIndent;
    procedure DeleteEndOfLine;
    procedure DeleteLine;
    procedure DeleteWhiteSpace;
    procedure DeleteWord;
    procedure FileProperties;
    procedure FindNext;
    procedure FindPrevious;
    procedure FormatXML;
    procedure FormatSQL;
    procedure GotoBookmarks(ItemIndex: Integer);
    procedure GotoLine;
    procedure IncreaseIndent;
    procedure InsertLine;
    procedure InsertDateAndTime;
    procedure LoadMacro;
    procedure New;
    procedure NextPage;
    procedure Open(FileName: string = ''; Bookmarks: TStrings = nil; Ln: Integer = 0; Ch: Integer = 0;
      StartUp: Boolean = False; ShowMinimap: Boolean = False);
    procedure Paste;
    procedure PlaybackMacro;
    procedure PreviousPage;
    procedure Print;
    procedure PrintPreview;
    procedure RecordMacro;
    procedure Redo;
    procedure Refresh(Page: Integer);
    procedure Replace;
    procedure Save; overload;
    procedure SaveAll;
    procedure SaveMacro;
    procedure Search;
    procedure SelectAll;
    procedure SelectForCompare;
    procedure SetActiveEncoding(Value: Integer);
    procedure SetHighlighter(AHighlighterName: string);
    procedure SetHighlighterColor(AColorName: string);
    procedure SetOptions;
    procedure ShowInfo;
    procedure SortAsc;
    procedure SortDesc;
    procedure StopMacro;
    procedure ToggleBookmarks(ItemIndex: Integer);
    procedure ToggleCase;
    procedure ToggleMiniMap;
    procedure ToggleSelectionMode;
    procedure ToggleSplit;
    procedure Undo;
    procedure UpdateHighlighterColors;
    procedure UpdateLanguage(SelectedLanguage: string);
    procedure WriteIniFile;
    property ActiveDocumentFound: Boolean read GetActiveDocumentFound;
    property ActiveDocumentModified: Boolean read GetActiveDocumentModified;
    property ActiveDocumentName: string read GetActiveDocumentName;
    property ActiveTabSheetCaption: string read GetActiveTabSheetCaption;
    property CanRedo: Boolean read GetCanRedo;
    property CanUndo: Boolean read GetCanUndo;
    property MinimapChecked: Boolean read GetMinimapChecked;
    property ModifiedDocuments: Boolean Read FModifiedDocuments write FModifiedDocuments;
    property OpenTabSheetCount: Integer read GetOpenTabSheetCount;
    //property OpenTabSheets: Boolean read GetOpenTabSheets;
    property Processing: Boolean read FProcessing;
    property ProgressBar: TBCProgressBar read FProgressBar write FProgressBar;
    property SelectionFound: Boolean read GetSelectionFound;
    property SelectionModeChecked: Boolean read GetSelectionModeChecked;
    property SplitChecked: Boolean read GetSplitChecked;
    property XMLTreeVisible: Boolean read GetXMLTreeVisible;
  end;

implementation

{$R *.dfm}

uses
  BCCommon.Forms.Print.Preview, BCCommon.Options.Container, BCCommon.Dialogs.ConfirmReplace, BCEditor.Print.Types,
  Vcl.ActnMenus, System.Types, System.WideStrings, System.Math, BigIni, Vcl.GraphUtil,
  BCCommon.Language.Strings, BCCommon.Dialogs.InputQuery, BCCommon.Language.Utils, BCCommon.Dialogs.Replace,
  BCCommon.FileUtils, BCCommon.Messages, BCCommon.StringUtils, Winapi.CommCtrl, EditBone.Forms.Options,
  BCCommon.Images, System.Generics.Collections, BCCommon.SQL.Formatter, BCEditor.Editor.KeyCommands, EditBone.Forms.Main,
  BCControls.Utils, BCEditor.Editor.Utils, BCCommon.Consts, BCEditor.Encoding,
  Vcl.Clipbrd, BCEditor.Highlighter.Colors;

{ TDocumentFrame }

constructor TDocumentFrame.Create(AOwner: TComponent);
var
  SysImageList: THandle;
  Icon: TIcon;
begin
  inherited;
  FNumberOfNewDocument := 0;
  FCaseCycle := 0;
  FSelectedText := '';
  FProcessing := False;
  FModifiedDocuments := False;

  FImages := TBCImageList.Create(Self);
  PageControl.Images := FImages;
  SysImageList := GetSysImageList;
  if SysImageList <> 0 then
  begin
    PageControl.Images.Handle := SysImageList;
    PageControl.Images.BkColor := clNone;
    PageControl.Images.ShareImages := True;
  end;

  { compare and new image index }
  Icon := TIcon.Create;
  try
    { Windows font size causing a problem: Icon size will be smaller than PageControl.Images size }
    case PageControl.Images.Height of
      16:
      begin
        { smaller }
        ImageList16.GetIcon(0, Icon);
        FCompareImageIndex := ImageList_AddIcon(PageControl.Images.Handle, Icon.Handle); //PageControl.Images.AddIcon(Icon);
        ImageList16.GetIcon(1, Icon);
        FNewImageIndex := ImageList_AddIcon(PageControl.Images.Handle, Icon.Handle); //PageControl.Images.AddIcon(Icon);
      end;
      20:
      begin
        { medium }
        ImageList20.GetIcon(0, Icon);
        FCompareImageIndex := ImageList_AddIcon(PageControl.Images.Handle, Icon.Handle); //PageControl.Images.AddIcon(Icon);
        ImageList20.GetIcon(1, Icon);
        FNewImageIndex := ImageList_AddIcon(PageControl.Images.Handle, Icon.Handle); //PageControl.Images.AddIcon(Icon);
      end;
      24:
      begin
        { larger }
        ImageList24.GetIcon(0, Icon);
        FCompareImageIndex := ImageList_AddIcon(PageControl.Images.Handle, Icon.Handle); //PageControl.Images.AddIcon(Icon);
        ImageList24.GetIcon(1, Icon);
        FNewImageIndex := ImageList_AddIcon(PageControl.Images.Handle, Icon.Handle); //PageControl.Images.AddIcon(Icon);
      end;
    end;
  finally
    Icon.Free;
  end;
  SetOptions;
end;

destructor TDocumentFrame.Destroy;
begin
  if Assigned(FImages) then
    FImages.Free;

  inherited Destroy;
end;

function TDocumentFrame.ToggleXMLTree: Boolean;
var
  i: Integer;
  DocTabSheetFrame: TDocTabSheetFrame;
begin
  Result := False;
  for i := 0 to PageControl.PageCount - 1 do
  begin
    DocTabSheetFrame := GetDocTabSheetFrame(PageControl.Pages[i]);
    if Assigned(DocTabSheetFrame) then
      if Pos('XML', DocTabSheetFrame.Editor.Highlighter.FileName) <> 0 then
      begin
        DocTabSheetFrame.XMLTreeVisible := not DocTabSheetFrame.XMLTreeVisible;
        if DocTabSheetFrame.XMLTreeVisible then
          DocTabSheetFrame.LoadFromXML(DocTabSheetFrame.Editor.Text);
        Result := DocTabSheetFrame.XMLTreeVisible;
      end;
  end;
end;

function TDocumentFrame.GetXMLTreeVisible: Boolean;
var
  DocTabSheetFrame: TDocTabSheetFrame;
begin
  Result := False;
  DocTabSheetFrame := GetDocTabSheetFrame(PageControl.ActivePage);
  if Assigned(DocTabSheetFrame) then
    Result := DocTabSheetFrame.XMLTreeVisible;
end;

function TDocumentFrame.CreateNewTabSheet(FileName: string = ''; ShowMinimap: Boolean = False): TBCEditor;
var
  TabSheet: TsTabSheet;
  DocTabSheetFrame: TDocTabSheetFrame;
begin
  { create a TabSheet }
  TabSheet := TsTabSheet.Create(PageControl);
  TabSheet.PageControl := PageControl;
  TabSheet.SkinData.SkinSection := 'CHECKBOX';

  if FileName <> '' then
    TabSheet.ImageIndex := GetIconIndex(FileName)
  else
    TabSheet.ImageIndex := FNewImageIndex;

  PageControl.ActivePage := TabSheet;

  //SetSearchMapVisible(SearchFrame.Visible);
 // if SearchFrame.Visible then
 //   if OptionsContainer.DocumentSpecificSearch then
 //     SearchFrame.ComboBoxSearchText.Text := '';

  { set the Caption property }
  if FileName = '' then
    PageControl.ActivePageCaption := LanguageDataModule.GetConstant('Document') + IntToStr(FNumberOfNewDocument)
  else
    PageControl.ActivePageCaption := ExtractFileName(FileName);

  DocTabSheetFrame := TDocTabSheetFrame.Create(TabSheet);
  with DocTabSheetFrame do
  begin
    Editor.Visible := False;
    Parent := TabSheet;
    DocTabSheetFrame.ProgressBar := FProgressBar;
    { Editor }
    with Editor do
    begin
      DocumentName := FileName;
      SearchString := '';
      FileDateTime := GetFileDateTime(FileName);
      OnChange := EditorOnChange;
      OnEnter := EditorEnter;
      OnReplaceText := EditorReplaceText;
      PopupMenu := MainForm.PopupMenuEditor;
      Minimap.Visible := ShowMinimap;
    end;
    { VirtualDrawTree }
    DocTabSheetFrame.ImageListXMLTree := Self.ImageListXMLTree;
    DocTabSheetFrame.PopupMenuXMLTree := Self.PopupMenuXMLTree;

    OptionsContainer.AssignTo(Editor);

    if Filename <> '' then
    begin
      SelectHighlighter(FileName);
      SetHighlighterColor(MainForm.HighlighterColor);
      Editor.LoadFromFile(FileName);
    end
    else
    begin
      SetActiveEncoding(OptionsContainer.DefaultEncoding);
      SetHighlighter(OptionsContainer.DefaultHighlighter);
      SetHighlighterColor(MainForm.HighlighterColor);
    end;
    MainForm.SetTitleBarMenus;

    { XML Tree }
    XMLTreeVisible := OptionsContainer.ShowXMLTree and IsXMLDocument;
    if XMLTreeVisible then
      LoadFromXML(Editor.Text);

    { reduce flickering by setting width & height }
    Editor.Width := 0;
    Editor.Height := 0;

   // SetMainHighlighterCombo(Editor);
   // SetMainEncodingCombo(Editor);

    Editor.Visible := True;

    if Visible and Editor.CanFocus then
      Editor.SetFocus;

    Result := Editor;
  end;
end;

procedure TDocumentFrame.EditorEnter(Sender: TObject);
begin
  CheckFileDateTimes;
end;

procedure TDocumentFrame.CompareFiles(FileName: string; AFileDragDrop: Boolean);
var
  i: Integer;
  TabSheet: TsTabSheet;
  Frame: TCompareFrame;
  TempList: TStringList;
  Editor: TBCEditor;
begin
  { create list of open documents }
  TempList := TStringList.Create;
  for i := 0 to PageControl.PageCount - 1 do
  begin
    Editor := GetEditor(PageControl.Pages[i]);
    if Assigned(Editor) then
      TempList.Add(Editor.DocumentName);
  end;
  if Filename <> '' then
  begin
    { find compare tab }
    for i := 0 to PageControl.PageCount - 1 do
      if PageControl.Pages[i].ImageIndex = FCompareImageIndex then
      begin
        Frame := GetCompareFrame(PageControl.Pages[i]);
        { if there already are two files to compare then continue }
        if Frame.ComparedFilesSet then
          Continue
        else
        begin
          { else set file and exit}
          PageControl.ActivePageIndex := i;
          Frame.SetCompareFile(Filename, AFileDragDrop);
          Exit;
        end;
      end;
  end;
  { create a TabSheet }
  TabSheet := TsTabSheet.Create(PageControl);
  TabSheet.PageControl := PageControl;
  TabSheet.SkinData.SkinSection := 'CHECKBOX';
  TabSheet.ImageIndex := FCompareImageIndex;
  TabSheet.Caption := LanguageDataModule.GetConstant('CompareFiles');
  //PageControl.UpdatePageCaption(TabSheet);
  PageControl.ActivePage := TabSheet;
  { create a compare frame }
  Frame := TCompareFrame.Create(TabSheet);
  with Frame do
  begin
    Parent := TabSheet;
    Align := alClient;
    OpenDocumentsList := TempList;
    SetCompareFile(Filename);
    SpecialChars := OptionsContainer.EnableSpecialChars;
    LineNumbers := OptionsContainer.EnableLineNumbers;
    UpdateLanguage(GetSelectedLanguage);
  end;
end;

procedure TDocumentFrame.SelectForCompare;
var
  Editor: TBCEditor;
begin
  Editor := GetActiveEditor;
  if Assigned(Editor) then
    CompareFiles(Editor.DocumentName);
end;

function TDocumentFrame.FindOpenFile(FileName: string): TBCEditor;
var
  i: Integer;
  Editor: TBCEditor;
begin
  Result := nil;
  for i := 0 to PageControl.PageCount - 1 do
  begin
    Editor := GetEditor(PageControl.Pages[i]);
    if Assigned(Editor) then
      if CompareText(UpperCase(Editor.DocumentName), UpperCase(FileName)) = 0 then
      begin
        PageControl.ActivePage := PageControl.Pages[i] as TsTabSheet;
        Result := Editor;
        Break;
      end;
  end;
end;

procedure TDocumentFrame.New;
begin
  Inc(FNumberOfNewDocument);
  CreateNewTabSheet;
end;

procedure TDocumentFrame.SetBookmarks(Editor: TBCEditor; Bookmarks: TStrings);
var
  i: Integer;
  Temp: string;
  BookmarkNumber, Ln, Ch: Integer;
begin
  if Assigned(Bookmarks) then
  begin
    for i := 0 to Bookmarks.Count - 1 do
    begin
      Temp := Bookmarks.Strings[i];
      if Pos(Editor.DocumentName, Temp) <> 0 then
      begin
        Temp := System.Copy(Temp, Pos('=', Temp) + 1, Length(Temp));
        BookmarkNumber := StrToInt(System.Copy(Temp, 1, Pos(';', Temp) - 1));
        Temp := System.Copy(Temp, Pos(';', Temp) + 1, Length(Temp));
        Ln := StrToInt(System.Copy(Temp, 1, Pos(';', Temp) - 1));
        Temp := System.Copy(Temp, Pos(';', Temp) + 1, Length(Temp));
        Ch := StrToInt(Temp);

        Editor.SetBookMark(BookmarkNumber, Ch, Ln);
      end;
    end;
  end;
end;

procedure TDocumentFrame.AddToReopenFiles(FileName: string);
var
  i: Integer;
  Files: TStrings;
  IniFile: string;
begin
  IniFile := GetIniFilename;
  Files := TStringList.Create;
  { Read section }
  with TBigIniFile.Create(IniFile) do
  try
    ReadSectionValues('FileReopenFiles', Files);
  finally
    Free;
  end;
  { Insert filename }
  for i := 0 to Files.Count - 1 do
    Files[i] := System.Copy(Files[i], Pos('=', Files[i]) + 1, Length(Files[i]));
  for i := Files.Count - 1 downto 0 do
    if Files[i] = FileName then
      Files.Delete(i);
  Files.Insert(0, FileName);
  while Files.Count > 10 do
    Files.Delete(Files.Count - 1);
  { write section }
  with TBigIniFile.Create(IniFile) do
  try
    EraseSection('FileReopenFiles');
    for i := 0 to Files.Count - 1 do
      WriteString('FileReopenFiles', IntToStr(i), Files.Strings[i]);
  finally
    Free;
  end;
  { if ini file is open in editor reload it because time has changed }
  for i := 0 to PageControl.PageCount - 1 do
    if PageControl.Pages[i].Caption = ExtractFileName(IniFile) then
      Refresh(i);
end;

procedure TDocumentFrame.Open(FileName: string = ''; Bookmarks: TStrings = nil;
  Ln: Integer = 0; Ch: Integer = 0; StartUp: Boolean = False; ShowMinimap: Boolean = False);
var
  i: Integer;
  Editor: TBCEditor;
begin
  FProcessing := True;
  try
    if FileName = '' then
    begin
      OpenDialog.Filter := OptionsContainer.Filters;
      OpenDialog.Title := LanguageDataModule.GetConstant('Open');
      //if BCCommon.Dialogs.OpenFiles(Handle, '', OptionsContainer.Filters, LanguageDataModule.GetConstant('Open')) then
      if OpenDialog.Execute(Handle) then
      begin
        //Application.ProcessMessages; { style fix }
       // for i := 0 to BCCommon.Dialogs.Files.Count - 1 do
        //  Open(BCCommon.Dialogs.Files[i])
        for i := 0 to OpenDialog.Files.Count - 1 do
          Open(OpenDialog.Files[i])
      end;
    end
    else
    begin
      if FileExists(FileName) then
      begin
        Editor := FindOpenFile(FileName);
        if not Assigned(Editor) then
          Editor := CreateNewTabSheet(FileName, ShowMinimap);
        SetBookmarks(Editor, Bookmarks);
        //try
          //SetMainHighlighterCombo(Editor);
          //SetMainEncodingCombo(Editor);
          //DoSearch2(Editor);
        Editor.GotoLineAndCenter(Ln);
        Editor.CaretPosition := GetTextPosition(Ch, Ln);
        if not StartUp then
        begin
          AddToReopenFiles(FileName);
          MainForm.CreateFileReopenList;
        end;
        //except
          { It is not always possible to focus... }
        //end;
      end
      else
      if ExtractFileName(FileName) <> '' then
        ShowErrorMessage(Format(LanguageDataModule.GetErrorMessage('FileNotFound'), [Filename]))
    end;
  finally
    FProcessing := False;
  end;
end;

procedure TDocumentFrame.Close(AFreePage: Boolean = True);
var
  ActivePageIndex: Integer;
  Rslt: Integer;
  Editor: TBCEditor;
begin
  Rslt := mrNone;

  Editor := GetActiveEditor;
  if Assigned(Editor) and Editor.Modified then
  begin
    Rslt := SaveChanges;
    if Rslt = mrYes then
      Save;
  end;

  if Rslt <> mrCancel then
  begin
    PageControl.TabClosed := True;
    ActivePageIndex := PageControl.ActivePageIndex;
    { Fixed Delphi Bug: http://qc.embarcadero.com/wc/qcmain.aspx?d=5473 }
    if (ActivePageIndex = PageControl.PageCount - 1) and (PageControl.PageCount > 1) then
    begin
      Dec(ActivePageIndex);
      PageControl.ActivePage.PageIndex := ActivePageIndex;
    end;
    if AFreePage and (PageControl.PageCount > 0) then
      PageControl.Pages[ActivePageIndex].Free;
    if PageControl.PageCount = 0 then
      FNumberOfNewDocument := 0;
  end;
  {Editor := GetActiveEditor;
  if Assigned(Editor) then
  begin
    SetMainHighlighterCombo(Editor);
    SetMainEncodingCombo(Editor);
    //DoSearch2(Editor);
  end; }
  MainForm.SetTitleBarMenus;
  CheckModifiedDocuments;
  PageControl.Repaint; { Icon paint bug fix }
end;

procedure TDocumentFrame.CloseAll;
var
  Rslt, i: Integer;
begin
  Application.ProcessMessages;
  FProcessing := True;
  Rslt := mrNone;

  if FModifiedDocuments then
  begin
    Rslt := SaveChanges;
    if Rslt = mrYes then
      SaveAll;
  end;
  if Rslt <> mrCancel then
  begin
    Screen.Cursor := crHourGlass;
    try
      FProgressBar.Count := PageControl.PageCount;
      FProgressBar.Show;
      for i := PageControl.PageCount - 1 downto 0 do
      begin
        ProgressBar.StepIt;
        Application.ProcessMessages;
        PageControl.Pages[i].Free;
      end;
    finally
      Screen.Cursor := crDefault;
      FProgressBar.Hide;
    end;
    FNumberOfNewDocument := 0;
  end;
  Application.ProcessMessages;
  CheckModifiedDocuments;
  PageControl.Repaint; { Icon paint bug fix }
  FProcessing := False;
end;

procedure TDocumentFrame.CloseAllOtherPages;
var
  i: Integer;
  Rslt: Integer;
  ActiveEditor, Editor: TBCEditor;
begin
  Application.ProcessMessages;
  FProcessing := True;

  Rslt := mrNone;

  ActiveEditor := GetActiveEditor;

  if GetModifiedDocuments(False) then
  begin
    Rslt := SaveChanges(True);

    if Rslt = mrYes then
      for i := 0 to PageControl.PageCount - 1 do
      begin
        Editor := GetEditor(PageControl.Pages[i]);
        if Assigned(Editor) and Editor.Modified and (Editor <> ActiveEditor) then
          Save(PageControl.Pages[i]);
      end;
  end;

  if Rslt <> mrCancel then
  begin
    PageControl.ActivePage.PageIndex := 0; { move the page first }
    Screen.Cursor := crHourGlass;
    try
      FProgressBar.Count := PageControl.PageCount;
      FProgressBar.Show;
      for i := PageControl.PageCount - 1 downto 1 do
      begin
        ProgressBar.StepIt;
        Application.ProcessMessages;
        PageControl.Pages[i].Free;
      end;
      FProgressBar.Hide;
    finally
      Screen.Cursor := crDefault;
    end;
    Editor := GetActiveEditor;
    if Assigned(Editor) and (Editor.DocumentName = '') then
      FNumberOfNewDocument := 1
    else
      FNumberOfNewDocument := 0
  end;
  //if Assigned(ActiveEditor) then
  //  DoSearch2(ActiveEditor);
  Application.ProcessMessages;
  CheckModifiedDocuments;
  PageControl.Repaint; { Icon paint bug fix }
  FProcessing := False;
end;

procedure TDocumentFrame.CheckModifiedDocuments;
begin
  FModifiedDocuments := GetModifiedDocuments;
end;

function TDocumentFrame.Save(TabSheet: TTabSheet; ShowDialog: Boolean): string;
var
  DocTabSheetFrame: TDocTabSheetFrame;
  AFileName, FilePath: string;
  FilterIndex: Cardinal;
begin
  Result := '';
  DocTabSheetFrame := GetDocTabSheetFrame(TabSheet);
  if Assigned(DocTabSheetFrame) then
  begin
    if (DocTabSheetFrame.Editor.DocumentName = '') or ShowDialog then
    begin
      if DocTabSheetFrame.Editor.DocumentName = '' then
      begin
        AFileName := Trim(TabSheet.Caption);
        AFileName := FormatFileName(AFileName);
      end
      else
        AFileName := ExtractFileName(DocTabSheetFrame.Editor.DocumentName);

      FilePath := ExtractFilePath(DocTabSheetFrame.Editor.DocumentName);
      FilterIndex := OptionsContainer.GetFilterIndex(ExtractFileExt(AFileName));
      SaveDialog.InitialDir := FilePath;
      SaveDialog.Filter := OptionsContainer.Filters;
      SaveDialog.Title := LanguageDataModule.GetConstant('SaveAs');
      SaveDialog.FilterIndex := FilterIndex;
      SaveDialog.FileName := AFileName;
      //if BCCommon.Dialogs.SaveFile(Handle, FilePath, OptionsContainer.Filters, LanguageDataModule.GetConstant('SaveAs'), FilterIndex, AFileName) then
      if SaveDialog.Execute(Handle) then
      begin
        //Application.ProcessMessages; { style fix }
        Result := SaveDialog.Files[0];
        if ExtractFileExt(Result) = '' then
          if (FilterIndex > 1) and (FilterIndex < OptionsContainer.FilterCount) then
            Result := Format('%s%s', [Result, OptionsContainer.GetFilterExt(FilterIndex)]);
        TabSheet.Caption := ExtractFileName(Result);
        DocTabSheetFrame.Editor.DocumentName := Result;
      end
      else
      begin
        if DocTabSheetFrame.Editor.CanFocus then
          DocTabSheetFrame.Editor.SetFocus;
        Exit;
      end;
    end;
    with DocTabSheetFrame.Editor do
    begin
      SaveToFile(DocumentName);
      if not OptionsContainer.UndoAfterSave then
        UndoList.Clear;
      FileDateTime := GetFileDateTime(DocumentName);
      Modified := False;
      TabSheet.ImageIndex := GetIconIndex(DocumentName);
      TabSheet.Caption := FormatFileName(TabSheet.Caption);
      //PageControl.UpdatePageCaption(TabSheet);
      //SelectHighlighter(DocumentName);
      //SetMainHighlighterCombo(DocTabSheetFrame.Editor);
    end;
    CheckModifiedDocuments;
  end;
end;

procedure TDocumentFrame.Save;
begin
  if Assigned(PageControl.ActivePage) then
    Save(PageControl.ActivePage);
end;

function TDocumentFrame.SaveAs: string;
begin
  Result := '';
  if Assigned(PageControl.ActivePage) then
    Result := Save(PageControl.ActivePage, True);
end;

procedure TDocumentFrame.SaveAll;
var
  i: Integer;
  Editor: TBCEditor;
begin
  FProcessing := True;
  Application.ProcessMessages;
  Screen.Cursor := crHourGlass;
  try
    FProgressBar.Count := PageControl.PageCount;
    FProgressBar.Show;
    for i := 0 to PageControl.PageCount - 1 do
    begin
      ProgressBar.StepIt;
      Application.ProcessMessages;
      Editor := GetEditor(PageControl.Pages[i]);
      if Assigned(Editor) and Editor.Modified then
        Save(PageControl.Pages[i]);
    end;
    FProgressBar.Hide;
  finally
    Screen.Cursor := crDefault;
  end;
  FProcessing := False;
end;

function TDocumentFrame.GetActivePageCaption: string;
begin
  Result := FormatFileName(PageControl.ActivePageCaption);
end;

procedure TDocumentFrame.Undo;

  procedure Undo(AEditor: TBCEditor);
  begin
    if Assigned(AEditor) then
      if AEditor.Focused then
      begin
        AEditor.DoUndo;
        if AEditor.UndoList.ItemCount = 0 then
          PageControl.ActivePageCaption := GetActivePageCaption;
      end;
  end;

begin
  Undo(GetActiveEditor);
  Undo(GetActiveSplitEditor);
  CheckModifiedDocuments;
end;

procedure TDocumentFrame.Redo;

  procedure Redo(Editor: TBCEditor);
  begin
    if Assigned(Editor) then
      if Editor.Focused then
        Editor.DoRedo;
  end;

begin
  Redo(GetActiveEditor);
  Redo(GetActiveSplitEditor);
  CheckModifiedDocuments;
end;

procedure TDocumentFrame.Cut;

  procedure Cut(Editor: TBCEditor);
  begin
    if Assigned(Editor) then
      if Editor.Focused then
        Editor.CutToClipboard;
  end;

begin
  Cut(GetActiveEditor);
  Cut(GetActiveSplitEditor);
end;

procedure TDocumentFrame.Copy;

  procedure Copy(Editor: TBCEditor);
  begin
    if Assigned(Editor) then
      if Editor.Focused then
        Editor.CopyToClipboard;
  end;

begin
  Copy(GetActiveEditor);
  Copy(GetActiveSplitEditor);
end;

procedure TDocumentFrame.PageControlChange(Sender: TObject);
begin
  if FProcessing then
    Exit;

  MainForm.SetTitleBarMenus;
  CheckFileDateTimes; { compare can change file datetime }
end;

procedure TDocumentFrame.PageControlCloseBtnClick(Sender: TComponent; TabIndex: Integer; var CanClose: Boolean;
  var Action: TacCloseAction);
begin
  Close(False);
  Action := acaFree;
end;

procedure TDocumentFrame.PageControlDblClick(Sender: TObject);
begin
  if OptionsContainer.DocCloseTabByDblClick then
    Close;
end;

procedure TDocumentFrame.PageControlMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if (Button = mbMiddle) and OptionsContainer.DocCloseTabByMiddleClick then
    Close;
end;

procedure TDocumentFrame.Paste;
var
  Editor, SplitEditor: TBCEditor;
  DocTabSheetFrame: TDocTabSheetFrame;
begin
  Editor := GetActiveEditor;
  SplitEditor := GetActiveSplitEditor;
  if Assigned(Editor) and Editor.Focused then
    Editor.PasteFromClipboard
  else
  if Assigned(SplitEditor) and SplitEditor.Focused then
    SplitEditor.PasteFromClipboard
  else
  begin
    DocTabSheetFrame := GetDocTabSheetFrame(PageControl.ActivePage);
    if Assigned(DocTabSheetFrame) then
      DocTabSheetFrame.PasteToSearch(Clipboard.AsText);
  end;
end;

procedure TDocumentFrame.InitializeEditorPrint(EditorPrint: TBCEditorPrint);
var
  Editor: TBCEditor;
  Alignment: TAlignment;

  procedure SetHeaderFooter(Option: Integer; Value: string);
  begin
    case Option of
      0, 1:
        with EditorPrint.Footer do
        begin
          case Option of
            0:
              Alignment := taLeftJustify;
            1:
              Alignment := taRightJustify;
          end;
          Add(Value, nil, Alignment, 1);
        end;
      2, 3:
        with EditorPrint.Header do
        begin
          case Option of
            2:
              Alignment := taLeftJustify;
            3:
              Alignment := taRightJustify;
          end;
          Add(Value, nil, Alignment, 1);
        end;
    end;
  end;

begin
  Editor := GetActiveEditor;
  if not Assigned(Editor) then
    Exit;

  EditorPrint.Header.Clear;
  EditorPrint.Footer.Clear;

  SetHeaderFooter(0, Format(LanguageDataModule.GetConstant('PrintedBy'),
    [Application.Title]));
  SetHeaderFooter(1, LanguageDataModule.GetConstant('PreviewDocumentPage'));
  SetHeaderFooter(2, Editor.DocumentName);
  SetHeaderFooter(3, '$DATE$ $TIME$');

  EditorPrint.Header.FrameTypes := [ftLine];
  EditorPrint.Footer.FrameTypes := [ftLine];
  EditorPrint.LineNumbersInMargin := True;
  EditorPrint.LineNumbers := True;
  EditorPrint.Wrap := False;
  EditorPrint.Colors := True;

  EditorPrint.Editor := Editor;
  EditorPrint.Title := Editor.DocumentName;
end;

procedure TDocumentFrame.Print;
var
  PrintDlgRec: TPrintDlg;
begin
  if PrintDialog.Execute(Handle) then
  begin
    EditorPrint.Copies := PrintDlgRec.nCopies;
    EditorPrint.SelectedOnly := PrintDlgRec.Flags and PD_SELECTION <> 0;
    if PrintDlgRec.Flags and PD_PAGENUMS <> 0 then
      EditorPrint.PrintRange(PrintDlgRec.nFromPage, PrintDlgRec.nToPage);
    InitializeEditorPrint(EditorPrint);
    EditorPrint.Print;
  end;
end;

procedure TDocumentFrame.PrintPreview;
begin
  with PrintPreviewDialog do
  begin
    InitializeEditorPrint(PrintPreview.EditorPrint);
    ShowModal;
  end;
end;

procedure TDocumentFrame.Search;
var
  DocTabSheetFrame: TDocTabSheetFrame;
begin
  DocTabSheetFrame := GetDocTabSheetFrame(PageControl.ActivePage);
  if Assigned(DocTabSheetFrame) then
    DocTabSheetFrame.ShowSearch;
end;

{procedure TDocumentFrame.SetSearchMapVisible(Value: Boolean);
var
  i: Integer;
  Editor: TBCEditor;
begin
  for i := 0 to PageControl.PageCount - 1 do
  begin
    Editor := GetEditor(PageControl.Pages[i]);
    if Assigned(Editor) then
      Editor.Search.Map.Visible := OptionsContainer.ShowSearchMap and Value;
  end;
end;   }

procedure TDocumentFrame.FindNext;
var
  Editor: TBCEditor;
begin
  Editor := GetActiveEditor;
  if not Assigned(Editor) then
    Exit;
  Editor.FindNext;
end;

procedure TDocumentFrame.FindPrevious;
var
  Editor: TBCEditor;
begin
  Editor := GetActiveEditor;
  if not Assigned(Editor) then
    Exit;
  Editor.FindPrevious;
end;

procedure TDocumentFrame.Replace;
var
  i: Integer;
  LEditor: TBCEditor;
  LResult: Integer;
begin
  FProcessing := True;

  with ReplaceDialog do
  begin
    LEditor := GetActiveEditor;
    if not Assigned(LEditor) then
      Exit;
    if LEditor.SelectionAvailable then
      ComboBoxSearchFor.Text := LEditor.SelectedText;
    LResult := ShowModal;
    if (LResult = mrOK) or (LResult = mrYes) then
    begin
      if ReplaceInWholeFile then
      begin
        GetOptions(LEditor);
        LEditor.CaretZero;
        LEditor.ReplaceText(ComboBoxSearchFor.Text, ComboBoxReplaceWith.Text);
      end
      else
      begin
        Screen.Cursor := crHourGlass;
        try
          FProgressBar.Count := PageControl.PageCount;
          FProgressBar.Show;
          for i := 0 to PageControl.PageCount - 1 do
          begin
            ProgressBar.StepIt;
            Application.ProcessMessages;
            LEditor := GetEditor(PageControl.Pages[i]);
            if Assigned(LEditor) then
            begin
              GetOptions(LEditor);
              LEditor.CaretZero;
              LEditor.ReplaceText(ComboBoxSearchFor.Text, ComboBoxReplaceWith.Text);
              PageControl.Pages[i].Caption := FormatFileName(PageControl.Pages[i].Caption, LEditor.Modified);
            end;
          end;
        finally
          Screen.Cursor := crDefault;
          FProgressBar.Hide;
        end;
      end;
    end;
  end;
  FProcessing := False;
end;

procedure TDocumentFrame.ToggleBookmarks(ItemIndex: Integer);
var
  Editor: TBCEditor;
  EditorCommand: TBCEditorCommand;
begin
  EditorCommand := ecNone;
  case ItemIndex of
    1: EditorCommand := ecSetBookmark1;
    2: EditorCommand := ecSetBookmark2;
    3: EditorCommand := ecSetBookmark3;
    4: EditorCommand := ecSetBookmark4;
    5: EditorCommand := ecSetBookmark5;
    6: EditorCommand := ecSetBookmark6;
    7: EditorCommand := ecSetBookmark7;
    8: EditorCommand := ecSetBookmark8;
    9: EditorCommand := ecSetBookmark9;
  end;
  Editor := GetActiveEditor;
  if Assigned(Editor) then
    Editor.ExecuteCommand(EditorCommand, Char(ItemIndex), nil);
end;

procedure TDocumentFrame.ActionSelectionBoxDownExecute(Sender: TObject);

  procedure BoxDown(Editor: TBCEditor);
  begin
    if Assigned(Editor) then
      if Editor.Focused then
      begin
        OptionsContainer.EnableSelectionMode := True;
        Editor.Selection.Options := Editor.Selection.Options + [soALTSetsColumnMode];
        Editor.Selection.Mode := smColumn;
        Keybd_Event(VK_SHIFT, MapVirtualKey(VK_SHIFT, 0), 0, 0);
        Keybd_Event(VK_DOWN, MapVirtualKey(VK_DOWN, 0), 0, 0);
        Keybd_Event(VK_DOWN, MapVirtualKey(VK_DOWN, 0), KEYEVENTF_KEYUP, 0);
        Keybd_Event(VK_MENU, MapVirtualKey(VK_MENU, 0), KEYEVENTF_KEYUP, 0);
      end;
  end;

begin
  BoxDown(GetActiveEditor);
  BoxDown(GetActiveSplitEditor);
end;

procedure TDocumentFrame.ActionSelectionBoxLeftExecute(Sender: TObject);

  procedure BoxLeft(Editor: TBCEditor);
  begin
    if Assigned(Editor) then
      if Editor.Focused then
      begin
        OptionsContainer.EnableSelectionMode := True;
        Editor.Selection.Options := Editor.Selection.Options + [soALTSetsColumnMode];
        Editor.Selection.Mode := smColumn;
        Keybd_Event(VK_SHIFT, MapVirtualKey(VK_SHIFT, 0), 0, 0);
        Keybd_Event(VK_LEFT, MapVirtualKey(VK_LEFT, 0), 0, 0);
        Keybd_Event(VK_LEFT, MapVirtualKey(VK_LEFT, 0), KEYEVENTF_KEYUP, 0);
        Keybd_Event(VK_MENU, MapVirtualKey(VK_MENU, 0), KEYEVENTF_KEYUP, 0);
    end;
  end;

begin
  BoxLeft(GetActiveEditor);
  BoxLeft(GetActiveSplitEditor);
end;

procedure TDocumentFrame.ActionSelectionBoxRightExecute(Sender: TObject);

  procedure BoxRight(Editor: TBCEditor);
  begin
    if Assigned(Editor) then
      if Editor.Focused then
      begin
        OptionsContainer.EnableSelectionMode := True;
        Editor.Selection.Options := Editor.Selection.Options + [soALTSetsColumnMode];
        Editor.Selection.Mode := smColumn;
        Keybd_Event(VK_SHIFT, MapVirtualKey(VK_SHIFT, 0), 0, 0);
        Keybd_Event(VK_RIGHT, MapVirtualKey(VK_RIGHT, 0), 0, 0);
        Keybd_Event(VK_RIGHT, MapVirtualKey(VK_RIGHT, 0), KEYEVENTF_KEYUP, 0);
        Keybd_Event(VK_MENU, MapVirtualKey(VK_MENU, 0), KEYEVENTF_KEYUP, 0);
      end;
  end;

begin
  BoxRight(GetActiveEditor);
  BoxRight(GetActiveSplitEditor);
end;

procedure TDocumentFrame.ActionSelectionBoxUpExecute(Sender: TObject);

  procedure BoxUp(Editor: TBCEditor);
  begin
    if Assigned(Editor) then
      if Editor.Focused then
      begin
        OptionsContainer.EnableSelectionMode := True;
        Editor.Selection.Options := Editor.Selection.Options + [soALTSetsColumnMode];
        Editor.Selection.Mode := smColumn;
        Keybd_Event(VK_SHIFT, MapVirtualKey(VK_SHIFT, 0), 0, 0);
        Keybd_Event(VK_UP, MapVirtualKey(VK_UP, 0), 0, 0);
        Keybd_Event(VK_UP, MapVirtualKey(VK_UP, 0), KEYEVENTF_KEYUP, 0);
        Keybd_Event(VK_MENU ,MapVirtualKey(VK_MENU ,0), KEYEVENTF_KEYUP, 0);
      end;
  end;

begin
  BoxUp(GetActiveEditor);
  BoxUp(GetActiveSplitEditor);
end;


{function TDocumentFrame.CanFindNextPrevious: Boolean;
begin
  Result := SearchFrame.ComboBoxSearchText.Text <> '';
end;}

function TDocumentFrame.ToggleWordWrap: Boolean;
var
  i: Integer;
  Editor: TBCEditor;
begin
  OptionsContainer.EnableWordWrap := not OptionsContainer.EnableWordWrap;
  Result := OptionsContainer.EnableWordWrap;
  for i := 0 to PageControl.PageCount - 1 do
  begin
    Editor := GetEditor(PageControl.Pages[i]);
    if Assigned(Editor) then
      Editor.WordWrap.Enabled := Result;
   // TODO Editor := GetSplitEditor(PageControl.Pages[i]);
   // if Assigned(Editor) then
   //   Editor.WordWrap.Enabled := Result;
  end;
end;

function TDocumentFrame.ToggleSpecialChars: Boolean;
var
  i: Integer;
  Editor: TBCEditor;
begin
  OptionsContainer.EnableSpecialChars := not OptionsContainer.EnableSpecialChars;
  Result := OptionsContainer.EnableSpecialChars;
  for i := 0 to PageControl.PageCount - 1 do
  begin
    Editor := GetEditor(PageControl.Pages[i]);
    if Assigned(Editor) then
    begin
      Editor.SpecialChars.Visible := Result;
      Editor.SpecialChars.EndOfLine.Visible := Result;
    end;
   { Editor := GetSplitEditor(PageControl.Pages[i]);
    if Assigned(Editor) then
    begin
      if Result then
        Editor.Options := Editor.Options + [eoShowSpecialChars]
      else
        Editor.Options := Editor.Options - [eoShowSpecialChars]
    end;  }
    if PageControl.Pages[i].Components[0] is TCompareFrame then
      Result := TCompareFrame(PageControl.Pages[i].Components[0]).ToggleSpecialChars
  end;
end;

function TDocumentFrame.GetSelectionModeChecked: Boolean;
var
  Editor: TBCEditor;
begin
  Result := False;
  Editor := GetActiveEditor;
  if Assigned(Editor) then
    Result := Editor.Selection.Mode = smColumn;
end;

procedure TDocumentFrame.ToggleSelectionMode;
var
  i: Integer;

  procedure ToggleSelectionMode(Editor: TBCEditor);
  begin
    if Assigned(Editor) then
      if Editor.Focused then
      begin
        if OptionsContainer.EnableSelectionMode then
        begin
          Editor.Selection.Options := Editor.Selection.Options - [soALTSetsColumnMode];
          Editor.Selection.Mode := smColumn;
        end
        else
        begin
          Editor.Selection.Options := Editor.Selection.Options + [soALTSetsColumnMode];
          Editor.Selection.Mode := smNormal
        end;
      end;
  end;

begin
  OptionsContainer.EnableSelectionMode := not OptionsContainer.EnableSelectionMode;
  for i := 0 to PageControl.PageCount - 1 do
  begin
    ToggleSelectionMode(GetEditor(PageControl.Pages[i]));
   // ToggleSelectionMode(GetSplitEditor(PageControl.Pages[i]));
  end;
end;

function TDocumentFrame.ToggleLineNumbers: Boolean;
var
  i: Integer;
  Editor: TBCEditor;
begin
  OptionsContainer.EnableLineNumbers := not OptionsContainer.EnableLineNumbers;
  Result := OptionsContainer.EnableLineNumbers;
  for i := 0 to PageControl.PageCount - 1 do
  begin
    Editor := GetEditor(PageControl.Pages[i]);
    if Assigned(Editor) then
      Editor.LeftMargin.LineNumbers.Visible := Result;
  {  Editor := GetSplitEditor(PageControl.Pages[i]);
    if Assigned(Editor) then
      Editor.LeftMargin.LineNumbers.Enabled := Result;  }
    if PageControl.Pages[i].Components[0] is TCompareFrame then
      Result := TCompareFrame(PageControl.Pages[i].Components[0]).ToggleLineNumbers
  end;
end;

function TDocumentFrame.ReadIniOpenFiles: Boolean;
var
  i: Integer;
  FName: string;
  FileNames, Bookmarks: TStrings;
//  Editor: TBCEditor;
begin
  FileNames := TStringList.Create;
  Bookmarks := TStringList.Create;
  with TBigIniFile.Create(GetIniFilename) do
  try
    PageControl.Visible := False;
    { Open Files }
    ReadSectionValues('OpenFiles', FileNames);
    ReadSectionValues('Bookmarks', Bookmarks);
    for i := 0 to FileNames.Count - 1 do
    begin
      FName := System.Copy(FileNames.Strings[i], Pos('=', FileNames.Strings[i]) + 1, Length(FileNames.Strings[i]));
      if FileExists(FName) then
        Open(FName, Bookmarks, ReadInteger('CaretY', IntToStr(i), 0), ReadInteger('CaretX', IntToStr(i), 0), True,
        ReadBool('Minimaps', IntToStr(i), False));
    end;

    i := ReadInteger('Options', 'ActivePageIndex', 0);
    if i < PageControl.PageCount then
    begin
      PageControl.ActivePageIndex := i;
      MainForm.SetTitleBarMenus;
      {Editor := GetActiveEditor;
      if Assigned(Editor) then
      begin
        SetMainHighlighterCombo(Editor);
        SetMainEncodingCombo(Editor);
      end;}
    end;

    Result := FileNames.Count > 0;
  finally
    FileNames.Free;
    Bookmarks.Free;
    //Minimaps.Free;
    Free;
    PageControl.Visible := True;
  end;
end;

procedure TDocumentFrame.WriteIniFile;
var
  i, j: Integer;
  FileType: string;
  Editor: TBCEditor;
  DocTabSheetFrame: TDocTabSheetFrame;
begin
  with TBigIniFile.Create(GetIniFilename) do
  try
    EraseSection('OpenFiles');
    EraseSection('Bookmarks');
    { Open documents and bookmarks }
    if OptionsContainer.DocSaveTabs then
    for i := 0 to PageControl.PageCount - 1 do
    begin
      Editor := GetEditor(PageControl.Pages[i]);
      if Assigned(Editor) then
      begin
        if Trim(Editor.DocumentName) <> '' then
          WriteString('OpenFiles', IntToStr(i), Editor.DocumentName);
        for j := 0 to Editor.Marks.Count - 1 do
          WriteString('Bookmarks', Format('%s:%s', [Editor.DocumentName, IntToStr(j)]),
            Format('%s;%s;%s', [IntToStr(Editor.Marks.Items[j].BookmarkNumber),
            IntToStr(Editor.Marks.Items[j].Line), IntToStr(Editor.Marks.Items[j].Char)]));
      end;
    end;
    { Minimaps & TopRows }
    EraseSection('Minimaps');
    EraseSection('CaretY');
    if OptionsContainer.DocSaveTabs then
    for i := 0 to PageControl.PageCount - 1 do
    begin
      DocTabSheetFrame := GetDocTabSheetFrame(PageControl.Pages[i]);
      if Assigned(DocTabSheetFrame) then
      begin
        WriteBool('Minimaps', IntToStr(i), DocTabSheetFrame.MinimapVisible);
        WriteInteger('CaretY', IntToStr(i), DocTabSheetFrame.CaretY);
        WriteInteger('CaretX', IntToStr(i), DocTabSheetFrame.CaretX);
      end;
    end;
    { Active document }
    WriteInteger('Options', 'ActivePageIndex', PageControl.ActivePageIndex);
    EraseSection('FileTypes');
    { FileTypes }
    for i := 0 to OptionsContainer.FileTypes.Count - 1 do
    begin
      FileType := Trim(System.Copy(LanguageDataModule.MultiStringHolderFileTypes.MultipleStrings.Items[i].Strings.Text, 0,
        Pos('(', LanguageDataModule.MultiStringHolderFileTypes.MultipleStrings.Items[i].Strings.Text) - 1));
      WriteString('FileTypes', IntToStr(i), Format('%s (%s)', [
        FileType, StringBetween(OptionsContainer.FileTypes.Strings[i], '(', ')')]));
    end;
  finally
    Free;
  end;
end;

procedure TDocumentFrame.InsertTag;
var
  LEditor: TBCEditor;
  LTagName: string;
begin
  if TInputQueryDialog.ClassShowModal(Self, LanguageDataModule.GetConstant('InsertTags'), LTagName) = mrOk then
  begin
    LEditor := GetActiveEditor;
    if Assigned(LEditor) then
    begin
      LEditor.ExecuteCommand(ecImeStr, #0, PWideChar(Format('<%s></%s>', [LTagName, LTagName])));
      LEditor.CaretX := LEditor.CaretX - Length(LTagName) - 3; { -3 from </> }
    end;
  end;
end;

procedure TDocumentFrame.InsertDateAndTime;
var
  Editor: TBCEditor;
begin
  Editor := GetActiveEditor;
  if Assigned(Editor) then
    Editor.ExecuteCommand(ecImeStr, #0, PWideChar(DateTimeToStr(Now)));
end;

function TDocumentFrame.Options(AActionList: TActionList): Boolean;
var
  ActionList: TObjectList<TAction>;

  function GetActionList: TObjectList<TAction>;
  var
    i: Integer;
    Action: TAction;
  begin
    Result := TObjectList<TAction>.Create;
    for i := 0 to MainForm.ActionList.ActionCount - 1 do
      if (MainForm.ActionList.Actions[i].ImageIndex <> -1) and
        (MainForm.ActionList.Actions[i].Hint <> '') then
      begin
        Action := TAction.Create(nil);
        Action.Name := MainForm.ActionList.Actions[i].Name;
        Action.Caption := StringReplace(MainForm.ActionList.Actions[i].Caption, '&', '', []);
        Action.ImageIndex := MainForm.ActionList.Actions[i].ImageIndex;
        Result.Add(Action);
      end;
  end;

begin
  FProcessing := True;
  ActionList := GetActionList;
  try
    Result := OptionsForm.Execute(ActionList);
    if Result then
    begin
      SetOptions;
      UpdateHighlighterColors;
      WriteIniFile;
    end;
  finally
    if Assigned(ActionList) then
      ActionList.Free;
    FProcessing := False;
  end;
end;

procedure TDocumentFrame.SetOptions;
var
  i: Integer;
  DocTabSheetFrame: TDocTabSheetFrame;
begin
  PageControl.DoubleBuffered := OptionsContainer.DocDoubleBuffered;
  PageControl.MultiLine := OptionsContainer.DocMultiLine;
  PageControl.ShowCloseBtns := OptionsContainer.DocShowCloseButton;
  PageControl.RightClickSelect := OptionsContainer.DocRightClickSelect;
  if OptionsContainer.DocShowImage then
    PageControl.Images := FImages
  else
    PageControl.Images := nil;
  { assign to every Editor }
  for i := 0 to PageControl.PageCount - 1 do
  begin
    DocTabSheetFrame := GetDocTabSheetFrame(PageControl.Pages[i]);
    if Assigned(DocTabSheetFrame) then
      OptionsContainer.AssignTo(DocTabSheetFrame.Editor);
  end;
end;

function TDocumentFrame.GetDocTabSheetFrame(TabSheet: TTabSheet): TDocTabSheetFrame;
begin
  Result := nil;
  if Assigned(TabSheet) then
    if TabSheet.ComponentCount <> 0 then
      if TabSheet.Components[0] is TDocTabSheetFrame then
        Result := TDocTabSheetFrame(TabSheet.Components[0]);
end;

function TDocumentFrame.GetCompareFrame(TabSheet: TTabSheet): TCompareFrame;
begin
  Result := nil;
  if Assigned(TabSheet) then
    if TabSheet.ComponentCount <> 0 then
      if TabSheet.Components[0] is TCompareFrame then
        Result := TCompareFrame(TabSheet.Components[0]);
end;

function TDocumentFrame.GetSplitEditor(TabSheet: TsTabSheet): TBCEditor;
//var
//  DocTabSheetFrame: TDocTabSheetFrame;
begin
  Result := nil;
  {TODO DocTabSheetFrame := GetDocTabSheetFrame(TabSheet);
  if Assigned(DocTabSheetFrame) then
    if DocTabSheetFrame.SplitVisible then
      Result := DocTabSheetFrame.SplitEditor; }
end;

function TDocumentFrame.GetEditor(TabSheet: TTabSheet): TBCEditor;
var
  DocTabSheetFrame: TDocTabSheetFrame;
begin
  Result := nil;
  DocTabSheetFrame := GetDocTabSheetFrame(TabSheet);
  if Assigned(DocTabSheetFrame) then
    Result := DocTabSheetFrame.Editor;
end;

procedure TDocumentFrame.GotoBookmarks(ItemIndex: Integer);
var
  Editor: TBCEditor;
  EditorCommand: TBCEditorCommand;
begin
  EditorCommand := ecNone;
  case ItemIndex of
    1: EditorCommand := ecGotoBookmark1;
    2: EditorCommand := ecGotoBookmark2;
    3: EditorCommand := ecGotoBookmark3;
    4: EditorCommand := ecGotoBookmark4;
    5: EditorCommand := ecGotoBookmark5;
    6: EditorCommand := ecGotoBookmark6;
    7: EditorCommand := ecGotoBookmark7;
    8: EditorCommand := ecGotoBookmark8;
    9: EditorCommand := ecGotoBookmark9;
  end;
  Editor := GetActiveEditor;
  if Assigned(Editor) then
    Editor.ExecuteCommand(EditorCommand, Char(ItemIndex), nil);
end;

procedure TDocumentFrame.GotoLine;
var
  LEditor: TBCEditor;
  LRow: Integer;
begin
  if TInputQueryDialog.ClassShowModal(Self, LanguageDataModule.GetConstant('GoToLine'), LRow) = mrOk then
  begin
    LEditor := GetActiveEditor;
    if Assigned(LEditor) then
      LEditor.GotoLineAndCenter(LRow);
  end;
end;

function TDocumentFrame.GetActiveSplitEditor: TBCEditor;
begin
  if Assigned(PageControl.ActivePage) then
    Result := GetSplitEditor(PageControl.ActivePage)
  else
    Result := nil;
end;

function TDocumentFrame.GetActiveEditor: TBCEditor;
begin
  if Assigned(PageControl.ActivePage) then
    Result := GetEditor(PageControl.ActivePage)
  else
    Result := nil;
end;

procedure TDocumentFrame.SetActivePageCaptionModified;
begin
  PageControl.ActivePageCaption := FormatFileName(PageControl.ActivePageCaption, True);
end;

procedure TDocumentFrame.EditorOnChange(Sender: TObject);
var
  ActiveEditor: TBCEditor;
  DocTabSheetFrame: TDocTabSheetFrame;

  procedure LinesChange(Editor: TBCEditor);
  var
    i: Integer;
  begin
    if Assigned(Editor) then
    begin
      Editor.BeginUpdate;

      while Editor.Lines.Count > ActiveEditor.Lines.Count do
        Editor.Lines.Delete(Editor.Lines.Count);
      while Editor.Lines.Count < ActiveEditor.Lines.Count do
        Editor.Lines.Add('');
      for i := 0 to Editor.Lines.Count - 1 do
        if ActiveEditor.Lines[i] <> Editor.Lines[i] then
          Editor.Lines[i] := ActiveEditor.Lines[i];
      Editor.EndUpdate;
      Editor.Repaint;
    end;
  end;

begin
  inherited;
  FModifiedDocuments := True;

  if OptionsContainer.AutoSave then
    Save
  else
  if not FProcessing then
    SetActivePageCaptionModified;

  if Assigned(PageControl.ActivePage) then
  begin
    DocTabSheetFrame := GetDocTabSheetFrame(PageControl.ActivePage);
    if Assigned(DocTabSheetFrame) then
    begin
      ActiveEditor := DocTabSheetFrame.Editor;
      {if DocTabSheetFrame.SplitVisible then
        LinesChange(DocTabSheetFrame.SplitEditor);
      DoSearch(ActiveEditor, True); }
    end;
  end;
end;

procedure TDocumentFrame.EditorSplitOnChange(Sender: TObject);
{var
  i: Integer;
  Editor, SplitEditor: TBCEditor;
begin
  inherited;
  Editor := GetActiveEditor;

  if OptionsContainer.AutoSave then
    Save
  else
    SetActivePageCaptionModified;

  SplitEditor := GetActiveSplitEditor;
  if Assigned(SplitEditor) then
  begin
    Editor.BeginUpdate;
    while Editor.Lines.Count > SplitEditor.Lines.Count do
      Editor.Lines.Delete(Editor.Lines.Count);
    while Editor.Lines.Count < SplitEditor.Lines.Count do
      Editor.Lines.Add('');
    for i := 0 to SplitEditor.Lines.Count - 1 do
      if Editor.Lines[i] <> SplitEditor.Lines[i] then
        Editor.Lines[i] := SplitEditor.Lines[i];
    Editor.EndUpdate;
  end;
  Editor.Repaint;
end; }
var
  ActiveEditor: TBCEditor;
//  DocTabSheetFrame: TDocTabSheetFrame;

  procedure LinesChange(Editor: TBCEditor);
  var
    i: Integer;
  begin
    if Assigned(Editor) then
    begin
      Editor.BeginUpdate;
      Editor.Modified := True;
      while Editor.Lines.Count > ActiveEditor.Lines.Count do
        Editor.Lines.Delete(Editor.Lines.Count);
      while Editor.Lines.Count < ActiveEditor.Lines.Count do
        Editor.Lines.Add('');
      for i := 0 to Editor.Lines.Count - 1 do
        if ActiveEditor.Lines[i] <> Editor.Lines[i] then
          Editor.Lines[i] := ActiveEditor.Lines[i];
      Editor.EndUpdate;
      Editor.Repaint;
    end;
  end;

begin
  inherited;
  FModifiedDocuments := True;

  if OptionsContainer.AutoSave then
    Save
  else
  if not FProcessing then
    SetActivePageCaptionModified;

  {if Assigned(PageControl.ActivePage) then
  begin
    DocTabSheetFrame := GetDocTabSheetFrame(PageControl.ActivePage);
    if Assigned(DocTabSheetFrame) then
    begin
      ActiveEditor := DocTabSheetFrame.SplitEditor;
      if DocTabSheetFrame.SplitVisible then
        LinesChange(DocTabSheetFrame.Editor);
      DoSearch(ActiveEditor, True);
    end;
  end; }
end;

function TDocumentFrame.GetActiveTabSheetCaption: string;
begin
  Result := '';
  
  if Assigned(PageControl.ActivePage) then
    Result := PageControl.ActivePageCaption;
end;

function TDocumentFrame.GetActiveDocumentFound: Boolean;
var
  Editor: TBCEditor;
begin
  Result := False;

  if Assigned(PageControl.ActivePage) then
  begin
    Editor := GetActiveEditor;
    if Assigned(Editor) then
      Result := True;
  end;
end;

function TDocumentFrame.GetActiveDocumentName: string;
var
  Editor: TBCEditor;
begin
  Result := '';
  if Assigned(PageControl.ActivePage) then
  begin
    Editor := GetActiveEditor;
    if Assigned(Editor) then
      if Editor.DocumentName <> '' then
        Result := FormatFileName(Editor.DocumentName, Editor.Modified);
  end;
end;

function TDocumentFrame.GetOpenTabSheetCount: Integer;
begin
  Result := PageControl.PageCount;
end;

function TDocumentFrame.GetModifiedDocuments(CheckActive: Boolean): Boolean;
var
  i: Integer;
  Editor: TBCEditor;
begin
  Result := True;

  for i := 0 to PageControl.PageCount - 1 do
  begin
    if CheckActive or ((PageControl.ActivePageIndex <> i) and not CheckActive) then
    begin
      Editor := GetEditor(PageControl.Pages[i]);
      if Assigned(Editor) then
        if Editor.Modified then
          Exit;
    end;
  end;
  Result := False;
end;

function TDocumentFrame.GetSelectionFound: Boolean;
var
  Editor: TBCEditor;
begin
  Result := False;
  Editor := GetActiveEditor;
  if Assigned(Editor) then
    Result := Editor.SelectionAvailable;

  Editor := GetActiveSplitEditor;
  if Assigned(Editor) then
    Result := Result or Editor.SelectionAvailable;
end;

function TDocumentFrame.GetCanUndo: Boolean;
var
  Editor: TBCEditor;
begin
  Result := False;
  Editor := GetActiveEditor;
  if Assigned(Editor) then
    Result := Editor.UndoList.ItemCount > 0;

  Editor := GetActiveSplitEditor;
  if Assigned(Editor) then
    Result := Result or (Editor.UndoList.ItemCount > 0);
end;

function TDocumentFrame.GetCanRedo: Boolean;
var
  Editor: TBCEditor;
begin
  Result := False;
  Editor := GetActiveEditor;
  if Assigned(Editor) then
    Result := Editor.RedoList.ItemCount > 0;

  Editor := GetActiveSplitEditor;
  if Assigned(Editor) then
    Result := Result or (Editor.RedoList.ItemCount > 0);
end;

procedure TDocumentFrame.EditorReplaceText(Sender: TObject; const ASearch, AReplace: string; Line, Column: Integer;
  DeleteLine: Boolean; var Action: TBCEditorReplaceAction);
var
  ConfirmText: string;
begin
  if ASearch = AReplace then
    Action := raSkip
  else
  begin
    if DeleteLine then
      ConfirmText := LanguageDataModule.GetYesOrNoMessage('DeleteLine')
    else
      ConfirmText := Format(LanguageDataModule.GetYesOrNoMessage('ReplaceOccurence'), [ASearch, AReplace]);

    case TConfirmReplaceDialog.ClassShowModal(Self, ConfirmText) of
      mrYes:
        Action := raReplace;
      mrYesToAll:
        Action := raReplaceAll;
      mrNo:
        Action := raSkip;
    else
      Action := raCancel;
    end;
  end;
end;

function TDocumentFrame.GetCaretInfo: string;
var
  Editor: TBCEditor;
begin
  Result := '';
  Editor := GetActiveEditor;
  if Assigned(Editor) then
    Result := Format('%d: %d', [Editor.CaretY, Editor.CaretX]);
end;

function TDocumentFrame.GetModifiedInfo: string;
var
  Editor: TBCEditor;
begin
  Result := '';
  if OptionsContainer.AutoSave then
    Result := LanguageDataModule.GetConstant('AutoSave')
  else
  begin
    Editor := GetActiveEditor;
    if Assigned(Editor) and Editor.Modified then
      Result := LanguageDataModule.GetConstant('Modified');
  end;
end;

function TDocumentFrame.GetActiveDocumentModified: Boolean;
var
  Editor: TBCEditor;
begin
  Editor := GetActiveEditor;
  Result := Assigned(Editor) and Editor.Modified;
end;

procedure TDocumentFrame.NextPage;
var
  i: Integer;
begin
  if Assigned(PageControl) then
  begin
    i := PageControl.ActivePageIndex + 1;
    if i >= PageControl.PageCount then
      i := 0;
    PageControl.ActivePage := PageControl.Pages[i] as TsTabSheet;
  end;
end;

procedure TDocumentFrame.PreviousPage;
var
  i: Integer;
begin
  if Assigned(PageControl) then
  begin
    i := PageControl.ActivePageIndex - 1;
    if i < 0 then
      i := PageControl.PageCount - 1;
    PageControl.ActivePage := PageControl.Pages[i] as TsTabSheet;;
  end;
end;

procedure TDocumentFrame.CheckFileDateTimes;
var
  i: Integer;
  Editor: TBCEditor;
  FileDateTime: TDateTime;
  DialogResult: Integer;
begin
  DialogResult := mrNo;
  if FProcessing then
    Exit;
  for i := 0 to PageControl.PageCount - 1 do
  begin
    Editor := GetEditor(PageControl.Pages[i]);
    if Assigned(Editor) then
      if Editor.DocumentName <> '' then
      begin
        FileDateTime := GetFileDateTime(Editor.DocumentName);
        if (FileDateTime <> 0) and (FileDateTime <> Editor.FileDateTime) then
        begin
          if FileExists(Editor.DocumentName) then
          begin
            PageControl.TabClosed := True; { just to avoid begin drag }
            FProcessing := True;
            if not (DialogResult in [mrYesToAll, mrNoToAll]) then
              DialogResult := AskYesOrNoAll(Format(LanguageDataModule.GetYesOrNoMessage('DocumentTimeChanged'), [Editor.DocumentName]));
            if DialogResult in [mrYes, mrYesToAll] then
              Refresh(i);
            FProcessing := False;
          end
          else
          begin
            if OptionsContainer.AutoSave then
              Save
            else
            begin
              Editor.Modified := True;
              PageControl.Pages[i].Caption := FormatFileName(PageControl.Pages[i].Caption, Editor.Modified);
              PageControl.Invalidate;
            end;
          end;
        end;
      end;
  end;
end;

procedure TDocumentFrame.Refresh(Page: Integer);
var
  Editor: TBCEditor;
begin
  Editor := GetEditor(PageControl.Pages[Page]);
  if Assigned(Editor) then
  begin
    Editor.LoadFromFile(Editor.DocumentName);
    Editor.FileDateTime := GetFileDateTime(Editor.DocumentName);
  end;
end;

procedure TDocumentFrame.ActionXMLTreeRefreshExecute(Sender: TObject);
var
  DocTabSheetFrame: TDocTabSheetFrame;
begin
  DocTabSheetFrame := GetDocTabSheetFrame(PageControl.ActivePage);
  if Assigned(DocTabSheetFrame) then
    DocTabSheetFrame.LoadFromXML(DocTabSheetFrame.Editor.Text);
end;

procedure TDocumentFrame.DecreaseIndent;
var
  Editor: TBCEditor;
begin
  Editor := GetActiveEditor;
  if Assigned(Editor) then
    Editor.ExecuteCommand(ecBlockUnindent, 'U', nil);
end;

procedure TDocumentFrame.IncreaseIndent;
var
  Editor: TBCEditor;
begin
  Editor := GetActiveEditor;
  if Assigned(Editor) then
    Editor.ExecuteCommand(ecBlockIndent, 'I', nil);
end;

procedure TDocumentFrame.SelectAll;
var
  DocTabSheetFrame: TDocTabSheetFrame;

  procedure SelectAll(Editor: TBCEditor);
  begin
    if Assigned(Editor) then
      if Editor.Focused then
        Editor.SelectAll;
  end;

begin
  DocTabSheetFrame := GetDocTabSheetFrame(PageControl.ActivePage);
  if Assigned(DocTabSheetFrame) and DocTabSheetFrame.IsSearchFocused then
    DocTabSheetFrame.SearchSelectAll
  else
  begin
    SelectAll(GetActiveEditor);
    SelectAll(GetActiveSplitEditor);
  end;
end;

procedure TDocumentFrame.ToggleCase;

  function Toggle(const aStr: string): string;
  var
    i: Integer;
    sLower: string;
  begin
    Result := UpperCase(aStr);
    sLower := LowerCase(aStr);
    for i := 1 to Length(aStr) do
    begin
      if Result[i] = aStr[i] then
        Result[i] := sLower[i];
    end;
  end;

  procedure ToggleCase(Editor: TBCEditor);
  var
    SelStart, SelEnd: TBCEditorTextPosition;
  begin
    if Assigned(Editor) then
      if Editor.Focused then
      begin
        if UpperCase(Editor.SelectedText) <> UpperCase(FSelectedText) then
        begin
          FCaseCycle := 0;
          FSelectedText := Editor.SelectedText;
        end;

        Editor.BeginUpdate;
        SelStart := Editor.SelectionBeginPosition;
        SelEnd := Editor.SelectionEndPosition;
        case FCaseCycle of
          0: Editor.SelectedText := UpperCase(FSelectedText); { UPPERCASE }
          1: Editor.SelectedText := LowerCase(FSelectedText); { lowercase }
          2: Editor.SelectedText := Toggle(FSelectedText); { aLtErNaTiNg cAsE }
          3: Editor.SelectedText := UpperCase(FSelectedText[1]) + LowerCase(System.Copy(FSelectedText, 2, Length(FSelectedText))); { Sentence case }
          // TODO: Title Case
          4: Editor.SelectedText := FSelectedText; { Original text }
        end;
        Editor.SelectionBeginPosition := SelStart;
        Editor.SelectionEndPosition := SelEnd;

        Editor.EndUpdate;
        Inc(FCaseCycle);
        if FCaseCycle > 4 then
          FCaseCycle := 0;
      end;
  end;

begin
  ToggleCase(GetActiveEditor);
  ToggleCase(GetActiveSplitEditor);
end;

procedure TDocumentFrame.DeleteWhiteSpace;

  procedure DeleteWhiteSpace(Editor: TBCEditor);
  var
    Strings: TWideStringList;
  begin
    if Assigned(Editor) then
      if Editor.Focused then
      begin
        Strings := TWideStringList.Create;
        Strings.Text := Editor.SelectedText;
        Editor.SelectedText := BCCommon.StringUtils.DeleteWhiteSpace(Strings.Text);
        Strings.Free;
      end;
  end;

begin
  DeleteWhiteSpace(GetActiveEditor);
  DeleteWhiteSpace(GetActiveSplitEditor);
end;

procedure TDocumentFrame.SortAsc;

  procedure SortAsc(Editor: TBCEditor);
  var
    Strings: TWideStringList;
  begin
    if Assigned(Editor) then
      if Editor.Focused then
      begin
        Strings := TWideStringList.Create;
        Strings.Text := Editor.SelectedText;
        Strings.Sort;
        Editor.SelectedText := TrimRight(Strings.Text);
        Strings.Free;
      end;
  end;

begin
  SortAsc(GetActiveEditor);
  SortAsc(GetActiveSplitEditor);
end;

procedure TDocumentFrame.SortDesc;

  procedure SortDesc(Editor: TBCEditor);
  var
    i: Integer;
    s: WideString;
    Strings: TWideStringList;
  begin
    if Assigned(Editor) then
      if Editor.Focused then
      begin
        Strings := TWideStringList.Create;
        Strings.Text := Editor.SelectedText;
        Strings.Sort;
        for i := Strings.Count - 1 downto 0 do
          s := s + Strings.Strings[i] + Chr(13) + Chr(10);
        Editor.SelectedText := TrimRight(s);
        Strings.Free;
      end;
  end;

begin
  SortDesc(GetActiveEditor);
  SortDesc(GetActiveSplitEditor);
end;

procedure TDocumentFrame.ClearBookmarks;

  procedure ClearBookmarks(Editor: TBCEditor);
  var
    i: Integer;
  begin
    if Assigned(Editor) then
      if Editor.Focused then
      for i := 0 to 9 do
        Editor.ClearBookMark(i);
  end;

begin
  ClearBookmarks(GetActiveEditor);
  ClearBookmarks(GetActiveSplitEditor);
end;

procedure TDocumentFrame.InsertLine;

  procedure InsertLine(Editor: TBCEditor);
  begin
    if Assigned(Editor) then
      if Editor.Focused then
        Editor.ExecuteCommand(ecInsertLine, 'N', nil);
  end;

begin
  InsertLine(GetActiveEditor);
  InsertLine(GetActiveSplitEditor);
end;

procedure TDocumentFrame.DeleteWord;

  procedure DeleteWord(Editor: TBCEditor);
  begin
    if Assigned(Editor) then
      if Editor.Focused then
        Editor.ExecuteCommand(ecDeleteWord, 'T', nil);
  end;

begin
  DeleteWord(GetActiveEditor);
  DeleteWord(GetActiveSplitEditor);
end;

procedure TDocumentFrame.DeleteLine;

  procedure DeleteLine(Editor: TBCEditor);
  begin
    if Assigned(Editor) then
      if Editor.Focused then
        Editor.ExecuteCommand(ecDeleteLine, 'Y', nil);
  end;

begin
  DeleteLine(GetActiveEditor);
  DeleteLine(GetActiveSplitEditor);
end;

procedure TDocumentFrame.DeleteEndOfLine;

  procedure DeleteEndOfLine(Editor: TBCEditor);
  begin
    if Assigned(Editor) then
      if Editor.Focused then
        Editor.ExecuteCommand(ecDeleteEndOfLine, 'Y', nil);
  end;

begin
  DeleteEndOfLine(GetActiveEditor);
  // TODO: DeleteEndOfLine(GetActiveSplitEditor);
end;

function LengthWithoutWhiteSpaces(Str: string): Integer;
var
  i: Integer;
begin
  Result := 0;
  for i := 1 to Length(Str) do
    if Trim(Str[i]) <> '' then
      Inc(Result);
end;

procedure TDocumentFrame.ShowInfo;
var
  Editor: TBCEditor;
begin
  Editor := GetActiveEditor;
  if Assigned(Editor) then
    ShowMessage(Format(LanguageDataModule.GetMessage('DocumentStatistics'), [Editor.Lines.Count, CHR_ENTER, WordCount(Editor.Text), CHR_ENTER, LengthWithoutWhiteSpaces(Editor.Text)]));
end;

function TDocumentFrame.GetMacroRecordPauseImageIndex: Integer;
var
  Editor: TBCEditor;
begin
  Result := IMAGE_INDEX_RECORD;
  Editor := GetActiveEditor;
  if Assigned(Editor) then
    if Assigned(Editor.MacroRecorder) then
       if Editor.MacroRecorder.State = msRecording then
         Result := IMAGE_INDEX_PAUSE
end;

function TDocumentFrame.IsRecordingMacro: Boolean;
var
  Editor: TBCEditor;
begin
  Result := False;
  Editor := GetActiveEditor;
  if Assigned(Editor) then
    if Assigned(Editor.MacroRecorder) then
      Result := Editor.MacroRecorder.State = msRecording
end;

procedure TDocumentFrame.SetHighlighter(AHighlighterName: string);
var
  Editor: TBCEditor;
begin
  Editor := GetActiveEditor;
  if Assigned(Editor) then
  with Editor do
  begin
    Highlighter.LoadFromFile(Format('%sHighlighters\%s.json', [ExtractFilePath(Application.ExeName), AHighlighterName]));
    ClearCodeFolding;
    InitCodeFolding;
    if Highlighter.CodeFoldingRegions.Count > 0 then
      CodeFolding.Visible := OptionsContainer.ShowCodeFolding;
    Invalidate;
  end;
end;

procedure TDocumentFrame.UpdateHighlighterColors;
var
  i: Integer;
  Editor: TBCEditor;
begin
  for i := 0 to PageControl.PageCount - 1 do
  begin
    Editor := GetEditor(PageControl.Pages[i]);
    if Assigned(Editor) then
    begin
      Editor.Highlighter.LoadColorsFromFile(Editor.Highlighter.Colors.FileName);
      SetSkinColors(Editor);
    end;
  end;
  Invalidate;
end;

procedure TDocumentFrame.SetSkinColors(Editor: TBCEditor);
var
  i: Integer;
  LColor: TColor;
begin
  LColor := FrameAdapter.SkinData.SkinManager.GetActiveEditColor;
  if OptionsContainer.SkinActiveLineBackground then
    Editor.ActiveLine.Color := FrameAdapter.SkinData.SkinManager.GetHighLightColor(False);
  if OptionsContainer.SkinBackground then
    Editor.BackgroundColor := LColor;
  if OptionsContainer.SkinCodeFoldingBackground then
    Editor.CodeFolding.Colors.Background := LColor;
  if OptionsContainer.SkinCodeFoldingHintBackground then
    Editor.CodeFolding.Hint.Colors.Background := LColor;
  if OptionsContainer.SkinCompletionProposalBackground then
    Editor.CompletionProposal.Colors.Background := LColor;
  if OptionsContainer.SkinCompletionProposalSelectionBackground then
    Editor.CompletionProposal.Colors.SelectedBackground := LColor;
  if OptionsContainer.SkinLeftMarginBackground then
    Editor.LeftMargin.Color := LColor;
  if OptionsContainer.SkinBookmarkPanelBackground then
    Editor.LeftMargin.Bookmarks.Panel.Color := LColor;
  if OptionsContainer.SkinSelectionForeground then
    Editor.Selection.Colors.Foreground := FrameAdapter.SkinData.SkinManager.GetHighLightFontColor;
  if OptionsContainer.SkinSelectionBackground then
    Editor.Selection.Colors.Background := FrameAdapter.SkinData.SkinManager.GetHighLightColor;
  for i := 0 to Editor.Highlighter.Colors.Styles.Count - 1 do
  if PBCEditorHighlighterElement(Editor.Highlighter.Colors.Styles.Items[i])^.Name = 'Editor' then
  begin
    if OptionsContainer.SkinForeground then
      PBCEditorHighlighterElement(Editor.Highlighter.Colors.Styles.Items[i])^.ForeGround := FrameAdapter.SkinData.SkinManager.GetActiveEditFontColor;
    if OptionsContainer.SkinBackground then
      PBCEditorHighlighterElement(Editor.Highlighter.Colors.Styles.Items[i])^.Background := LColor;
    Break;
  end;
  Editor.Highlighter.UpdateColors;
end;

procedure TDocumentFrame.SetHighlighterColor(AColorName: string);
var
  Editor: TBCEditor;
begin
  Editor := GetActiveEditor;
  if Assigned(Editor) then
  with Editor do
  begin
    Highlighter.LoadColorsFromFile(Format('%sColors\%s.json', [ExtractFilePath(Application.ExeName), AColorName]));
    SetSkinColors(Editor);
    Invalidate;
  end;
end;

function TDocumentFrame.IsMacroStopped: Boolean;
var
  Editor: TBCEditor;
begin
  Result := False;
  Editor := GetActiveEditor;
  if Assigned(Editor) then
    if Assigned(Editor.MacroRecorder) then
      Result := Editor.MacroRecorder.State = msStopped
end;

procedure TDocumentFrame.RecordMacro;
var
  Editor: TBCEditor;
begin
  Editor := GetActiveEditor;
  if Assigned(Editor) then
  begin
    if not Assigned(Editor.MacroRecorder) then
    begin
      Editor.MacroRecorder := TBCEditorMacroRecorder.Create(Editor);
      Editor.MacroRecorder.RecordMacro(Editor);
    end
    else
    if Editor.MacroRecorder.State = msStopped then
    begin
      if AskYesOrNo(LanguageDataModule.GetYesOrNoMessage('RecordMacro')) then
      begin
        Editor.MacroRecorder.Clear;
        Editor.MacroRecorder.RecordMacro(Editor);
      end;
    end
    else
    if Editor.MacroRecorder.State = msRecording then
      Editor.MacroRecorder.Pause
    else
    if Editor.MacroRecorder.State = msPaused then
      Editor.MacroRecorder.Resume
  end;
end;

procedure TDocumentFrame.StopMacro;
var
  Editor: TBCEditor;
begin
  Editor := GetActiveEditor;
  if Assigned(Editor) then
  begin
    if Assigned(Editor.MacroRecorder) then
      Editor.MacroRecorder.Stop;
  end;
end;

procedure TDocumentFrame.PlaybackMacro;
var
  Editor: TBCEditor;
begin
  Editor := GetActiveEditor;
  if Assigned(Editor) then
  begin
    if Assigned(Editor.MacroRecorder) then
      Editor.MacroRecorder.PlaybackMacro(Editor);
  end;
end;

procedure TDocumentFrame.SaveMacro;
var
  Editor: TBCEditor;
begin
  Editor := GetActiveEditor;
  if Assigned(Editor) then
    if Assigned(Editor.MacroRecorder) then
    begin
      SaveDialog.InitialDir := '';
      SaveDialog.Filter := Trim(StringReplace(LanguageDataModule.GetFileTypes('Macro')
        , '|', #0, [rfReplaceAll])) + #0#0;
      SaveDialog.Title := LanguageDataModule.GetConstant('SaveAs');
      SaveDialog.FileName := '';
      SaveDialog.DefaultExt := 'mcr';
      if SaveDialog.Execute(Handle) then
        Editor.MacroRecorder.SaveToFile(SaveDialog.Files[0]);
    end;
end;

procedure TDocumentFrame.LoadMacro;
var
  Editor: TBCEditor;
begin
  Editor := GetActiveEditor;
  if Assigned(Editor) then
  begin
    OpenDialog.Filter := Trim(StringReplace(LanguageDataModule.GetFileTypes('Macro'), '|', #0, [rfReplaceAll])) + #0#0;
    OpenDialog.Title := LanguageDataModule.GetConstant('Open');
    OpenDialog.DefaultExt := 'mcr';
    {if BCCommon.Dialogs.OpenFile(Handle, '', Trim(StringReplace(LanguageDataModule.GetFileTypes('Macro')
      , '|', #0, [rfReplaceAll])) + #0#0,
      LanguageDataModule.GetConstant('Open'), 'mcr') then  }
    if OpenDialog.Execute(Handle) then
    begin
      //Application.ProcessMessages; { style fix }
      if not Assigned(Editor.MacroRecorder) then
        Editor.MacroRecorder := TBCEditorMacroRecorder.Create(Editor);
      Editor.MacroRecorder.LoadFromFile(OpenDialog.Files[0]);
    end;
  end;
end;

procedure TDocumentFrame.FileProperties;
var
  Editor: TBCEditor;
begin
  Editor := GetActiveEditor;
  if Assigned(Editor) then
    FilePropertiesDialog(Editor.DocumentName);
end;

procedure TDocumentFrame.SetActiveEncoding(Value: Integer);
var
  Editor: TBCEditor;
begin
  Editor := GetActiveEditor;
  if Assigned(Editor) then
  with Editor do
  begin
    case Value of
      0: Encoding := TEncoding.ASCII;
      1: Encoding := TEncoding.ANSI;
      2: Encoding := TEncoding.BigEndianUnicode;
      3: Encoding := TEncoding.Unicode;
      4: Encoding := TEncoding.UTF7;
      5: Encoding := TEncoding.UTF8;
      6: Encoding := TEncoding.UTF8WithoutBOM;
    end;
  end;
end;

function TDocumentFrame.GetSplitChecked: Boolean;
var
  DocTabSheetFrame: TDocTabSheetFrame;
begin
  Result := False;
  DocTabSheetFrame := GetDocTabSheetFrame(PageControl.ActivePage);
  if Assigned(DocTabSheetFrame) then
    Result := DocTabSheetFrame.SplitVisible;
end;

function TDocumentFrame.GetMinimapChecked: Boolean;
var
  DocTabSheetFrame: TDocTabSheetFrame;
begin
  Result := False;
  DocTabSheetFrame := GetDocTabSheetFrame(PageControl.ActivePage);
  if Assigned(DocTabSheetFrame) then
    Result := DocTabSheetFrame.MinimapVisible;
end;

procedure TDocumentFrame.ToggleSplit;
var
//  i: Integer;
  FileName: string;
  AEditor: TBCEditor;
  DocTabSheetFrame: TDocTabSheetFrame;
  SplitVisible: Boolean;
begin
  AEditor := GetActiveEditor;
  FileName := AEditor.DocumentName;
  DocTabSheetFrame := GetDocTabSheetFrame(PageControl.ActivePage);
  if Assigned(DocTabSheetFrame) then
  begin
    SplitVisible := not DocTabSheetFrame.SplitVisible;

  { TODO if SplitVisible then
    begin
      with DocTabSheetFrame.SplitEditor do
      begin
        DocumentName := FileName;
        FileDateTime := GetFileDateTime(FileName);
        Font.Color := AEditor.Font.Color;
        Gutter.Font.Color := AEditor.Gutter.Font.Color;
        Gutter.ShowLineNumbers := AEditor.Gutter.ShowLineNumbers;
        OnChange := EditorSplitOnChange;
        OnEnter := EditorEnter;
        OnReplaceText := EditorReplaceText;
        SearchEngine := EditorSearch;
        PopupMenu := EditorPopupActionBar;
        BookMarkOptions.BookmarkImages := BookmarkImagesList;
        Height := DocTabSheetFrame.DocumentPanel.Height div 2;
        Width := 0; // reduce flickering
      end;
      OptionsContainer.AssignTo(DocTabSheetFrame.SplitEditor);
      if Filename <> '' then
      begin
        DocTabSheetFrame.SplitEditor.Text := AEditor.Text;
        for i := 0 to DocTabSheetFrame.SplitEditor.ExpandLines.Count - 1 do
          DocTabSheetFrame.SplitEditor.ExpandLines.Attributes[i].aLineState := DocTabSheetFrame.Editor.ExpandLines.Attributes[i].aLineState;
        SelectHighlighter(DocTabSheetFrame, FileName);
      end;  }
   // end;
    DocTabSheetFrame.SplitVisible := SplitVisible;
  end;
end;

procedure TDocumentFrame.ToggleMiniMap;
var
  DocTabSheetFrame: TDocTabSheetFrame;
begin
  DocTabSheetFrame := GetDocTabSheetFrame(PageControl.ActivePage);
  if Assigned(DocTabSheetFrame) then
    DocTabSheetFrame.MinimapVisible := not DocTabSheetFrame.MinimapVisible;
end;

function TDocumentFrame.IsCompareFilesActivePage: Boolean;
begin
  Result := Assigned(PageControl.ActivePage) and (PageControl.ActivePage.ImageIndex = FCompareImageIndex);
end;

procedure TDocumentFrame.UpdateLanguage(SelectedLanguage: string);
var
  i: Integer;
  CompareFrame: TCompareFrame;
begin
  BCCommon.Language.Utils.UpdateLanguage(TForm(Self), SelectedLanguage);

  { compare frames }
  for i := 0 to PageControl.PageCount - 1 do
  begin
    if PageControl.Pages[i].ImageIndex = FCompareImageIndex then
    begin
      CompareFrame := GetCompareFrame(PageControl.Pages[i]);
      if Assigned(CompareFrame) then
        CompareFrame.UpdateLanguage(SelectedLanguage);
    end;
  end;
end;

procedure TDocumentFrame.FormatXML;
var
  Editor: TBCEditor;
begin
  Editor := GetActiveEditor;
  if Assigned(Editor) then
  begin
    Editor.BeginUndoBlock;
    try
      Editor.SelectAll;
      Editor.SelectedText := BCCommon.StringUtils.FormatXML(Editor.Text);
    finally
      Editor.EndUndoBlock;
      Editor.SetFocus;
    end;
  end;
end;

procedure TDocumentFrame.FormatSQL;
var
  Editor: TBCEditor;
begin
  Editor := GetActiveEditor;
  if Assigned(Editor) then
    if Trim(Editor.Text) <> '' then
      Editor.Text := BCCommon.SQL.Formatter.FormatSQL(Editor.Text, TSQLDatabase(SQLFormatterOptionsContainer.SQLDatabase));
end;

function TDocumentFrame.IsXMLDocument: Boolean;
var
  DocTabSheetFrame: TDocTabSheetFrame;
begin
  Result := False;
  DocTabSheetFrame := GetDocTabSheetFrame(PageControl.ActivePage);
  if Assigned(DocTabSheetFrame) then
    Result := Assigned(DocTabSheetFrame.Editor.Highlighter) and (Pos('XML', DocTabSheetFrame.Editor.Highlighter.FileName) <> 0)
end;

function TDocumentFrame.IsSQLDocument: Boolean;
var
  DocTabSheetFrame: TDocTabSheetFrame;
begin
  Result := False;
  DocTabSheetFrame := GetDocTabSheetFrame(PageControl.ActivePage);
  if Assigned(DocTabSheetFrame) then
    Result := Assigned(DocTabSheetFrame.Editor.Highlighter) and (Pos('SQL', DocTabSheetFrame.Editor.Highlighter.FileName) <> 0)
end;

procedure TDocumentFrame.SelectHighlighter(FileName: string);
var
  Ext, ItemString, Token: string;
  i: Integer;
begin
  Ext := '*' + LowerCase(ExtractFileExt(FileName));

  for i := 0 to OptionsContainer.FileTypes.Count - 1 do
  begin
    ItemString := StringBetween(OptionsContainer.FileTypes.Values[OptionsContainer.FileTypes.Names[i]], '(', ')');
    while ItemString <> '' do
    begin
      Token := GetNextToken(';', ItemString);
      ItemString := RemoveTokenFromStart(';', ItemString);
      if Ext = Token then
      begin
        SetHighlighter(OptionsContainer.FileTypes.Names[i]);
        Exit;
      end;
    end;
  end;
  SetHighlighter(OptionsContainer.DefaultHighlighter);
end;

function TDocumentFrame.GetActiveBookmarkList: TBCEditorBookmarkList;
var
  Editor: TBCEditor;
begin
  Result := nil;
  Editor := GetActiveEditor;
  if Assigned(Editor) then
    Result := Editor.Marks;
end;

end.
