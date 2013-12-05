unit Options;

interface

uses
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, BCCommon.FileUtils, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.Menus, SynEdit, SynEditMiscClasses, SynHighlighterWebData, System.Classes, System.SysUtils, Vcl.ImgList,
  SynHighlighterWeb, SynHighlighterSQL, Vcl.ActnList, Vcl.Themes, OptionsPrint, OptionsEditorSearch, VirtualTrees,
  OptionsEditorOptions, OptionsEditorFont, OptionsEditorLeftMargin, OptionsEditorTabs, Lib, OptionsEditorErrorChecking,
  OptionsEditorOther, OptionsFileTypes, OptionsCompare, OptionsMainMenu, OptionsDirectoryTabs, OptionsOutputTabs,
  OptionsDirectory, OptionsStatusBar, OptionsOutput, OptionsToolBar, Vcl.ActnMenus, System.Actions,
  OptionsEditorCompletionProposal, BCDialogs.Dlg, OptionsEditorRightMargin;

type
  POptionsRec = ^TOptionsRec;
  TOptionsRec = record
    Caption: UnicodeString;
    ImageIndex: Integer;
  end;

  TOptionsContainer = class;

  TOptionsDialog = class(TForm)
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
    ImageList: TImageList;
    MainMenuAction: TAction;
    OKButton: TButton;
    OptionsPanel: TPanel;
    OptionsVirtualStringTree: TVirtualStringTree;
    OutputAction: TAction;
    OutputTabsAction: TAction;
    PrintAction: TAction;
    Splitter: TSplitter;
    StatusBarAction: TAction;
    ToolBarAction: TAction;
    TopPanel: TPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure OptionsVirtualStringTreeClick(Sender: TObject);
    procedure OptionsVirtualStringTreeFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure OptionsVirtualStringTreeGetImageIndex(Sender: TBaseVirtualTree; Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex; var Ghosted: Boolean; var ImageIndex: Integer);
    procedure OptionsVirtualStringTreeGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
    procedure OptionsVirtualStringTreePaintText(Sender: TBaseVirtualTree; const TargetCanvas: TCanvas;
      Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType);
  private
    FDirectoryTabsFrame: TDirectoryTabsFrame;
    FEditorCompletionProposalFrame: TEditorCompletionProposalFrame;
    FEditorErrorCheckingFrame: TEditorErrorCheckingFrame;
    FEditorFontFrame: TEditorFontFrame;
    FEditorLeftMarginFrame: TEditorLeftMarginFrame;
    FEditorOptionsFrame: TEditorOptionsFrame;
    FEditorOtherFrame: TEditorOtherFrame;
    FEditorRightMarginFrame: TEditorRightMarginFrame;
    FEditorSearchFrame: TEditorSearchFrame;
    FEditorTabsFrame: TEditorTabsFrame;
    FFileTypesFrame: TFileTypesFrame;
    FMainMenuFrame: TMainMenuFrame;
    FOptionsCompareFrame: TOptionsCompareFrame;
    FOptionsContainer: TOptionsContainer;
    FOptionsDirectoryFrame: TOptionsDirectoryFrame;
    FOptionsOutputFrame: TOptionsOutputFrame;
    FOptionsPrintFrame: TOptionsPrintFrame;
    FOutputTabsFrame: TOutputTabsFrame;
    FStatusBarFrame: TStatusBarFrame;
    FToolBarFrame: TToolBarFrame;
    procedure CreateTree;
    procedure GetData;
    procedure PutData;
    procedure ReadIniFile;
    procedure SetVisibleFrame;
    procedure WriteIniFile;
  public
    function Execute(EditOptions: TOptionsContainer): Boolean;
  end;

  TOptionsContainer = class(TComponent)
  private
    FAnimationDuration: Integer;
    FAnimationStyle: TAnimationStyle;
    FAutoIndent: Boolean;
    FAutoSave: Boolean;
    FBeepIfSearchStringNotFound: Boolean;
    FColorBrightness: Integer;
    FCompletionProposalCaseSensitive: Boolean;
    FCompletionProposalEnabled: Boolean;
    FCompletionProposalShortcut: string;
    FCPASHighlighter: TCPASHighlighter;
    FCSSVersion: TSynWebCssVersion;
    FDefaultEncoding: Integer;
    FDefaultHighlighter: Integer;
    FDirCloseTabByDblClick: Boolean;
    FDirCloseTabByMiddleClick: Boolean;
    FDirDoubleBuffered: Boolean;
    FDirIndent: Integer;
    FDirMultiLine: Boolean;
    FDirRightClickSelect: Boolean;
    FDirSaveTabs: Boolean;
    FDirShowArchiveFiles: Boolean;
    FDirShowCloseButton: Boolean;
    FDirShowHiddenFiles: Boolean;
    FDirShowImage: Boolean;
    FDirShowSystemFiles: Boolean;
    FDirShowTreeLines: Boolean;
    FDocCloseTabByDblClick: Boolean;
    FDocCloseTabByMiddleClick: Boolean;
    FDocDoubleBuffered: Boolean;
    FDocMultiLine: Boolean;
    FDocRightClickSelect: Boolean;
    FDocSaveTabs: Boolean;
    FDocShowCloseButton: Boolean;
    FDocShowImage: Boolean;
    FEnableLineNumbers: Boolean;
    FEnableSelectionMode: Boolean;
    FEnableSpecialChars: Boolean;
    FEnableWordWrap: Boolean;
    FFileTypes: TStrings;
    FFontName: string;
    FFontSize: Integer;
    FHTMLErrorChecking: Boolean;
    FHTMLVersion: TSynWebHtmlVersion;
    FIgnoreBlanks: Boolean;
    FIgnoreCase: Boolean;
    FInsertCaret: TSynEditCaretType;
    FLineSpacing: Integer;
    FMainMenuFontName: string;
    FMainMenuFontSize: Integer;
    FMainMenuSystemFontName: string;
    FMainMenuSystemFontSize: Integer;
    FMainMenuUseSystemFont: Boolean;
    FMarginFontName: string;
    FMarginFontSize: Integer;
    FMarginInTens: Boolean;
    FMarginLeftMarginAutoSize: Boolean;
    FMarginLeftMarginWidth: Integer;
    FMarginLeftMarginMouseMove: Boolean;
    FMarginLineModified: Boolean;
    FMarginModifiedColor: string;
    FMarginNormalColor: string;
    FMarginRightMargin: Integer;
    FMarginShowBookmarkPanel: Boolean;
    FMarginVisibleLeftMargin: Boolean;
    FMarginVisibleRightMargin: Boolean;
    FMarginZeroStart: Boolean;
    FMinimapFontSize: Integer;
    FNonblinkingCaret: Boolean;
    FNonblinkingCaretColor: string;
    FOutputCloseTabByDblClick: Boolean;
    FOutputCloseTabByMiddleClick: Boolean;
    FOutputDoubleBuffered: Boolean;
    FOutputIndent: Integer;
    FOutputMultiLine: Boolean;
    FOutputRightClickSelect: Boolean;
    FOutputSaveTabs: Boolean;
    FOutputShowCloseButton: Boolean;
    FOutputShowImage: Boolean;
    FOutputShowTreeLines: Boolean;
    FPersistentHotKeys: Boolean;
    FPHPVersion: TSynWebPhpVersion;
    FPrintDateTime: Integer;
    FPrintDocumentName: Integer;
    FPrintPageNumber: Integer;
    FPrintPrintedBy: Integer;
    FPrintShowFooterLine: Boolean;
    FPrintShowHeaderLine: Boolean;
    FPrintShowLineNumbers: Boolean;
    FPrintWordWrapLine: Boolean;
    FScrollPastEof: Boolean;
    FScrollPastEol: Boolean;
    FShadows: Boolean;
    FShowSearchStringNotFound: Boolean;
    FShowXMLTree: Boolean;
    FSmartTabDelete: Boolean;
    FSmartTabs: Boolean;
    FSQLDialect: TSQLDialect;
    FStatusBarFontName: string;
    FStatusBarFontSize: Integer;
    FStatusBarUseSystemFont: Boolean;
    FSupportedFileExts: string;
    FTabsToSpaces: Boolean;
    FTabWidth: Integer;
    FToolBarCase: Boolean;
    FToolBarCommand: Boolean;
    FToolBarDirectory: Boolean;
    FToolBarDocument: Boolean;
    FToolBarIndent: Boolean;
    FToolBarMacro: Boolean;
    FToolBarMode: Boolean;
    FToolBarPrint: Boolean;
    FToolBarSearch: Boolean;
    FToolBarSort: Boolean;
    FToolBarStandard: Boolean;
    FToolBarTools: Boolean;
    FToolBarVisible: Boolean;
    FTrimTrailingSpaces: Boolean;
    FTripleClickRowSelect: Boolean;
    FUndoAfterSave: Boolean;
    function GetExtensions: string;
    function GetFilterCount: Cardinal;
    function GetFilters: string;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function FileType(FileType: TFileType): string;
    function GetFilterExt(FilterIndex: Cardinal): string;
    function GetFilterIndex(FileExt: string): Cardinal;
    function SupportedFileExts(Refresh: Boolean = False): string;
    procedure AssignTo(Dest: TPersistent); override;
  published
    property AnimationDuration: Integer read FAnimationDuration write FAnimationDuration default 150;
    property AnimationStyle: TAnimationStyle read FAnimationStyle write FAnimationStyle default asDefault;
    property AutoIndent: Boolean read FAutoIndent write FAutoIndent default True;
    property AutoSave: Boolean read FAutoSave write FAutoSave default False;
    property BeepIfSearchStringNotFound: Boolean read FBeepIfSearchStringNotFound write FBeepIfSearchStringNotFound default True;
    property ColorBrightness: Integer read FColorBrightness write FColorBrightness;
    property CompletionProposalCaseSensitive: Boolean read FCompletionProposalCaseSensitive write FCompletionProposalCaseSensitive default True;
    property CompletionProposalEnabled: Boolean read FCompletionProposalEnabled write FCompletionProposalEnabled default True;
    property CompletionProposalShortcut: string read FCompletionProposalShortcut write FCompletionProposalShortcut;
    property CPASHighlighter: TCPASHighlighter read FCPASHighlighter write FCPASHighlighter;
    property CSSVersion: TSynWebCssVersion read FCSSVersion write FCSSVersion;
    property DefaultEncoding: Integer read FDefaultEncoding write FDefaultEncoding;
    property DefaultHighlighter: Integer read FDefaultHighlighter write FDefaultHighlighter;
    property DirCloseTabByDblClick: Boolean read FDirCloseTabByDblClick write FDirCloseTabByDblClick default False;
    property DirCloseTabByMiddleClick: Boolean read FDirCloseTabByMiddleClick write FDirCloseTabByMiddleClick default False;
    property DirDoubleBuffered: Boolean read FDirDoubleBuffered write FDirDoubleBuffered default True;
    property DirIndent: Integer read FDirIndent write FDirIndent default 20;
    property DirMultiLine: Boolean read FDirMultiLine write FDirMultiLine default False;
    property DirRightClickSelect: Boolean read FDirRightClickSelect write FDirRightClickSelect default True;
    property DirSaveTabs: Boolean read FDirSaveTabs write FDirSaveTabs default True;
    property DirShowArchiveFiles: Boolean read FDirShowArchiveFiles write FDirShowArchiveFiles default True;
    property DirShowCloseButton: Boolean read FDirShowCloseButton write FDirShowCloseButton default False;
    property DirShowHiddenFiles: Boolean read FDirShowHiddenFiles write FDirShowHiddenFiles default False;
    property DirShowImage: Boolean read FDirShowImage write FDirShowImage default True;
    property DirShowSystemFiles: Boolean read FDirShowSystemFiles write FDirShowSystemFiles default False;
    property DirShowTreeLines: Boolean read FDirShowTreeLines write FDirShowTreeLines default False;
    property DocCloseTabByDblClick: Boolean read FDocCloseTabByDblClick write FDocCloseTabByDblClick default False;
    property DocCloseTabByMiddleClick: Boolean read FDocCloseTabByMiddleClick write FDocCloseTabByMiddleClick default False;
    property DocDoubleBuffered: Boolean read FDocDoubleBuffered write FDocDoubleBuffered default True;
    property DocMultiLine: Boolean read FDocMultiLine write FDocMultiLine;
    property DocRightClickSelect: Boolean read FDocRightClickSelect write FDocRightClickSelect;
    property DocSaveTabs: Boolean read FDocSaveTabs write FDocSaveTabs;
    property DocShowCloseButton: Boolean read FDocShowCloseButton write FDocShowCloseButton;
    property DocShowImage: Boolean read FDocShowImage write FDocShowImage;
    property EnableLineNumbers: Boolean read FEnableLineNumbers write FEnableLineNumbers;
    property EnableSelectionMode: Boolean read FEnableSelectionMode write FEnableSelectionMode;
    property EnableSpecialChars: Boolean read FEnableSpecialChars write FEnableSpecialChars;
    property EnableWordWrap: Boolean read FEnableWordWrap write FEnableWordWrap;
    property Extensions: string read GetExtensions;
    property FileTypes: TStrings read FFileTypes write FFileTypes;
    property FilterCount: Cardinal read GetFilterCount;
    property Filters: string read GetFilters;
    property FontName: string read FFontName write FFontName;
    property FontSize: Integer read FFontSize write FFontSize;
    property HTMLErrorChecking: Boolean read FHTMLErrorChecking write FHTMLErrorChecking;
    property HTMLVersion: TSynWebHtmlVersion read FHTMLVersion write FHTMLVersion;
    property IgnoreBlanks: Boolean read FIgnoreBlanks write FIgnoreBlanks;
    property IgnoreCase: Boolean read FIgnoreCase write FIgnoreCase;
    property InsertCaret: TSynEditCaretType read FInsertCaret write FInsertCaret;
    property LineSpacing: Integer read FLineSpacing write FLineSpacing;
    property MainMenuFontName: string read FMainMenuFontName write FMainMenuFontName;
    property MainMenuFontSize: Integer read FMainMenuFontSize write FMainMenuFontSize;
    property MainMenuSystemFontName: string read FMainMenuSystemFontName write FMainMenuSystemFontName;
    property MainMenuSystemFontSize: Integer read FMainMenuSystemFontSize write FMainMenuSystemFontSize;
    property MainMenuUseSystemFont: Boolean read FMainMenuUseSystemFont write FMainMenuUseSystemFont;
    property MarginFontName: string read FMarginFontName write FMarginFontName;
    property MarginFontSize: Integer read FMarginFontSize write FMarginFontSize;
    property MarginInTens: Boolean read FMarginInTens write FMarginInTens;
    property MarginLeftMarginAutoSize: Boolean read FMarginLeftMarginAutoSize write FMarginLeftMarginAutoSize;
    property MarginLeftMarginMouseMove: Boolean read FMarginLeftMarginMouseMove write FMarginLeftMarginMouseMove;
    property MarginLeftMarginWidth: Integer read FMarginLeftMarginWidth write FMarginLeftMarginWidth;
    property MarginLineModified: Boolean read FMarginLineModified write FMarginLineModified;
    property MarginModifiedColor: string read FMarginModifiedColor write FMarginModifiedColor;
    property MarginNormalColor: string read FMarginNormalColor write FMarginNormalColor;
    property MarginRightMargin: Integer read FMarginRightMargin write FMarginRightMargin;
    property MarginShowBookmarkPanel: Boolean read FMarginShowBookmarkPanel write FMarginShowBookmarkPanel default True;
    property MarginVisibleLeftMargin: Boolean read FMarginVisibleLeftMargin write FMarginVisibleLeftMargin;
    property MarginVisibleRightMargin: Boolean read FMarginVisibleRightMargin write FMarginVisibleRightMargin;
    property MarginZeroStart: Boolean read FMarginZeroStart write FMarginZeroStart;
    property MinimapFontSize: Integer read FMinimapFontSize write FMinimapFontSize;
    property NonblinkingCaret: Boolean read FNonblinkingCaret write FNonblinkingCaret default False;
    property NonblinkingCaretColor: string read FNonblinkingCaretColor write FNonblinkingCaretColor;
    property OutputCloseTabByDblClick: Boolean read FOutputCloseTabByDblClick write FOutputCloseTabByDblClick;
    property OutputCloseTabByMiddleClick: Boolean read FOutputCloseTabByMiddleClick write FOutputCloseTabByMiddleClick;
    property OutputDoubleBuffered: Boolean read FOutputDoubleBuffered write FOutputDoubleBuffered;
    property OutputIndent: Integer read FOutputIndent write FOutputIndent;
    property OutputMultiLine: Boolean read FOutputMultiLine write FOutputMultiLine;
    property OutputRightClickSelect: Boolean read FOutputRightClickSelect write FOutputRightClickSelect;
    property OutputSaveTabs: Boolean read FOutputSaveTabs write FOutputSaveTabs;
    property OutputShowCloseButton: Boolean read FOutputShowCloseButton write FOutputShowCloseButton;
    property OutputShowImage: Boolean read FOutputShowImage write FOutputShowImage;
    property OutputShowTreeLines: Boolean read FOutputShowTreeLines write FOutputShowTreeLines;
    property PersistentHotKeys: Boolean read FPersistentHotKeys write FPersistentHotKeys;
    property PHPVersion: TSynWebPhpVersion read FPHPVersion write FPHPVersion;
    property PrintDateTime: Integer read FPrintDateTime write FPrintDateTime;
    property PrintDocumentName: Integer read FPrintDocumentName write FPrintDocumentName;
    property PrintPageNumber: Integer read FPrintPageNumber write FPrintPageNumber;
    property PrintPrintedBy: Integer read FPrintPrintedBy write FPrintPrintedBy;
    property PrintShowFooterLine: Boolean read FPrintShowFooterLine write FPrintShowFooterLine;
    property PrintShowHeaderLine: Boolean read FPrintShowHeaderLine write FPrintShowHeaderLine;
    property PrintShowLineNumbers: Boolean read FPrintShowLineNumbers write FPrintShowLineNumbers;
    property PrintWordWrapLine: Boolean read FPrintWordWrapLine write FPrintWordWrapLine;
    property ScrollPastEof: Boolean read FScrollPastEof write FScrollPastEof;
    property ScrollPastEol: Boolean read FScrollPastEol write FScrollPastEol;
    property Shadows: Boolean read FShadows write FShadows;
    property ShowSearchStringNotFound: Boolean read FShowSearchStringNotFound write FShowSearchStringNotFound;
    property ShowXMLTree: Boolean read FShowXMLTree write FShowXMLTree;
    property SmartTabDelete: Boolean read FSmartTabDelete write FSmartTabDelete;
    property SmartTabs: Boolean read FSmartTabs write FSmartTabs;
    property SQLDialect: TSQLDialect read FSQLDialect write FSQLDialect;
    property StatusBarFontName: string read FStatusBarFontName write FStatusBarFontName;
    property StatusBarFontSize: Integer read FStatusBarFontSize write FStatusBarFontSize;
    property StatusBarUseSystemFont: Boolean read FStatusBarUseSystemFont write FStatusBarUseSystemFont;
    property TabsToSpaces: Boolean read FTabsToSpaces write FTabsToSpaces;
    property TabWidth: Integer read FTabWidth write FTabWidth;
    property ToolBarCase: Boolean read FToolBarCase write FToolBarCase;
    property ToolBarCommand: Boolean read FToolBarCommand write FToolBarCommand;
    property ToolBarDirectory: Boolean read FToolBarDirectory write FToolBarDirectory;
    property ToolBarDocument: Boolean read FToolBarDocument write FToolBarDocument;
    property ToolBarIndent: Boolean read FToolBarIndent write FToolBarIndent;
    property ToolBarMacro: Boolean read FToolBarMacro write FToolBarMacro;
    property ToolBarMode: Boolean read FToolBarMode write FToolBarMode;
    property ToolBarPrint: Boolean read FToolBarPrint write FToolBarPrint;
    property ToolBarSearch: Boolean read FToolBarSearch write FToolBarSearch;
    property ToolBarSort: Boolean read FToolBarSort write FToolBarSort;
    property ToolBarStandard: Boolean read FToolBarStandard write FToolBarStandard;
    property ToolBarTools: Boolean read FToolBarTools write FToolBarTools;
    property ToolBarVisible: Boolean read FToolBarVisible write FToolBarVisible;
    property TrimTrailingSpaces: Boolean read FTrimTrailingSpaces write FTrimTrailingSpaces;
    property TripleClickRowSelect: Boolean read FTripleClickRowSelect write FTripleClickRowSelect;
    property UndoAfterSave: Boolean read FUndoAfterSave write FUndoAfterSave;
  end;

function OptionsDialog: TOptionsDialog;
function OptionsContainer: TOptionsContainer;

implementation

{$R *.dfm}

uses
  BCCommon.StyleUtils, BCCommon.LanguageStrings, System.IniFiles, SynEditTypes, BCCommon.StringUtils,
  BCCommon.LanguageUtils, SynCompletionProposal;

{ TOptionsContainer }

var
  FOptionsContainer: TOptionsContainer;
  FOptionsDialog: TOptionsDialog;

function OptionsContainer: TOptionsContainer;
begin
  if FOptionsContainer = nil then
    FOptionsContainer := TOptionsContainer.Create(nil);
  Result := FOptionsContainer;
end;

procedure TOptionsContainer.AssignTo(Dest: TPersistent);
begin
  if Assigned(Dest) and (Dest is TCustomSynEdit) then
  begin
    TCustomSynEdit(Dest).Font.Name := FFontName;
    TCustomSynEdit(Dest).Font.Size := FFontSize;
    TCustomSynEdit(Dest).Gutter.Visible := FMarginVisibleLeftMargin;
    TCustomSynEdit(Dest).Gutter.Font.Name := FMarginFontName;
    TCustomSynEdit(Dest).Gutter.Font.Size := FMarginFontSize;
    TCustomSynEdit(Dest).LineSpacing := FLineSpacing;
    TCustomSynEdit(Dest).RightEdge.Visible := FMarginVisibleRightMargin;
    TCustomSynEdit(Dest).Gutter.AutoSize := FMarginLeftMarginAutoSize;
    TCustomSynEdit(Dest).Gutter.Width := FMarginLeftMarginWidth;
    TCustomSynEdit(Dest).Gutter.Intens := FMarginInTens;
    TCustomSynEdit(Dest).Gutter.ZeroStart := FMarginZeroStart;
    TCustomSynEdit(Dest).Gutter.ShowLineModified := FMarginLineModified;
    if FMarginShowBookmarkPanel then
      TCustomSynEdit(Dest).Gutter.LeftOffset := 20
    else
      TCustomSynEdit(Dest).Gutter.LeftOffset := 0;
    TCustomSynEdit(Dest).Gutter.LineModifiedColor := StringToColor(FMarginModifiedColor);
    TCustomSynEdit(Dest).Gutter.LineNormalColor := StringToColor(FMarginNormalColor);
    TCustomSynEdit(Dest).TabWidth := FTabWidth;
    TCustomSynEdit(Dest).InsertCaret := FInsertCaret;
    TCustomSynEdit(Dest).NonBlinkingCaretColor := StringToColor(FNonblinkingCaretColor);
    if FAutoIndent then
      TCustomSynEdit(Dest).Options := TCustomSynEdit(Dest).Options + [eoAutoIndent]
    else
      TCustomSynEdit(Dest).Options := TCustomSynEdit(Dest).Options - [eoAutoIndent];
    if FScrollPastEof then
      TCustomSynEdit(Dest).Options := TCustomSynEdit(Dest).Options + [eoScrollPastEof]
    else
      TCustomSynEdit(Dest).Options := TCustomSynEdit(Dest).Options - [eoScrollPastEof];
    if FScrollPastEol then
      TCustomSynEdit(Dest).Options := TCustomSynEdit(Dest).Options + [eoScrollPastEol]
    else
      TCustomSynEdit(Dest).Options := TCustomSynEdit(Dest).Options - [eoScrollPastEol];
    if FTabsToSpaces then
      TCustomSynEdit(Dest).Options := TCustomSynEdit(Dest).Options + [eoTabsToSpaces]
    else
      TCustomSynEdit(Dest).Options := TCustomSynEdit(Dest).Options - [eoTabsToSpaces];
    if FSmartTabs then
      TCustomSynEdit(Dest).Options := TCustomSynEdit(Dest).Options + [eoSmartTabs]
    else
      TCustomSynEdit(Dest).Options := TCustomSynEdit(Dest).Options - [eoSmartTabs];
    if FSmartTabDelete then
      TCustomSynEdit(Dest).Options := TCustomSynEdit(Dest).Options + [eoSmartTabDelete]
    else
      TCustomSynEdit(Dest).Options := TCustomSynEdit(Dest).Options - [eoSmartTabDelete];
    if FTrimTrailingSpaces then
      TCustomSynEdit(Dest).Options := TCustomSynEdit(Dest).Options + [eoTrimTrailingSpaces]
    else
      TCustomSynEdit(Dest).Options := TCustomSynEdit(Dest).Options - [eoTrimTrailingSpaces];
    if FTripleClickRowSelect then
      TCustomSynEdit(Dest).Options := TCustomSynEdit(Dest).Options + [eoTripleClicks]
    else
      TCustomSynEdit(Dest).Options := TCustomSynEdit(Dest).Options - [eoTripleClicks];
    if FNonblinkingCaret then
      TCustomSynEdit(Dest).Options := TCustomSynEdit(Dest).Options + [eoNonblinkingCaret]
    else
      TCustomSynEdit(Dest).Options := TCustomSynEdit(Dest).Options - [eoNonblinkingCaret];

    TCustomSynEdit(Dest).WordWrap.Enabled := FEnableWordWrap;
    TCustomSynEdit(Dest).Gutter.ShowLineNumbers := FEnableLineNumbers;

    if FEnableSpecialChars then
      TCustomSynEdit(Dest).Options := TCustomSynEdit(Dest).Options + [eoShowSpecialChars]
    else
      TCustomSynEdit(Dest).Options := TCustomSynEdit(Dest).Options - [eoShowSpecialChars];

    if FEnableSelectionMode then
      TCustomSynEdit(Dest).SelectionMode := smColumn
    else
      TCustomSynEdit(Dest).SelectionMode := smNormal;

    if TCustomSynEdit(Dest).Highlighter is TSynWebHtmlSyn then
    begin
      TSynWebHtmlSyn(TCustomSynEdit(Dest).Highlighter).Engine.Options.HtmlVersion := FHTMLVersion;
      TSynWebHtmlSyn(TCustomSynEdit(Dest).Highlighter).Engine.Options.CssVersion := FCSSVersion;
      TSynWebHtmlSyn(TCustomSynEdit(Dest).Highlighter).Engine.Options.PhpVersion := FPHPVersion;
    end;
    if TCustomSynEdit(Dest).Highlighter is TSynSQLSyn then
      TSynSQLSyn(TCustomSynEdit(Dest).Highlighter).SQLDialect := FSQLDialect;

    TCustomSynEdit(Dest).RightEdge.Visible := FMarginVisibleRightMargin;
    TCustomSynEdit(Dest).RightEdge.MouseMove := FMarginLeftMarginMouseMove;
    TCustomSynEdit(Dest).RightEdge.Position := FMarginRightMargin;
  end
  else
  if Assigned(Dest) and (Dest is TActionMainMenuBar) then
  begin
    TActionMainMenuBar(Dest).PersistentHotKeys := FPersistentHotKeys;
    TActionMainMenuBar(Dest).Shadows := FShadows;
    TActionMainMenuBar(Dest).UseSystemFont := FMainMenuUseSystemFont;
    if FMainMenuUseSystemFont then
    begin
      Screen.MenuFont.Name := FMainMenuSystemFontName;
      Screen.MenuFont.Size := FMainMenuSystemFontSize;
    end
    else
    begin
      Screen.MenuFont.Name := FMainMenuFontName;
      Screen.MenuFont.Size := FMainMenuFontSize;
    end;
    TActionMainMenuBar(Dest).AnimationStyle := FAnimationStyle;
    TActionMainMenuBar(Dest).AnimateDuration := FAnimationDuration;
  end
  else
  if Assigned(Dest) and (Dest is TStatusBar) then
  begin
    TStatusBar(Dest).UseSystemFont := FStatusBarUseSystemFont;
    if not FStatusBarUseSystemFont then
    begin
      TStatusBar(Dest).Font.Name := FStatusBarFontName;
      TStatusBar(Dest).Font.Size := FStatusBarFontSize;
      TStatusBar(Dest).Height := FStatusBarFontSize + 11;
    end;
  end
  else
  if Assigned(Dest) and (Dest is TSynCompletionProposal) then
  begin
    if not FCompletionProposalEnabled then
      TSynCompletionProposal(Dest).ShortCut := TextToShortCut('')
    else
      TSynCompletionProposal(Dest).ShortCut := TextToShortCut(FCompletionProposalShortcut);
    if FCompletionProposalCaseSensitive then
      TSynCompletionProposal(Dest).Options := TSynCompletionProposal(Dest).Options + [scoCaseSensitive]
    else
      TSynCompletionProposal(Dest).Options := TSynCompletionProposal(Dest).Options - [scoCaseSensitive];
  end
  else
    inherited;
end;

function TOptionsContainer.FileType(FileType: TFileType): string;
begin
  if FileType = ftHC11 then
    Result := FFileTypes.Strings[0]
  else
  if FileType = ftAWK then
    Result := FFileTypes.Strings[1]
  else
  if FileType = ftBaan then
    Result := FFileTypes.Strings[2]
  else
  if FileType = ftCS then
    Result := FFileTypes.Strings[3]
  else
  if FileType = ftCPP then
    Result := FFileTypes.Strings[4]
  else
  if FileType = ftCAC then
    Result := FFileTypes.Strings[5]
  else
  if FileType = ftCache then
    Result := FFileTypes.Strings[6]
  else
  if FileType = ftCss then
    Result := FFileTypes.Strings[7]
  else
  if FileType = ftCobol then
    Result := FFileTypes.Strings[8]
  else
  if FileType = ftIdl then
    Result := FFileTypes.Strings[9]
  else
  if FileType = ftCPM then
    Result := FFileTypes.Strings[10]
  else
  if FileType = ftDOT then
    Result := FFileTypes.Strings[11]
  else
  if FileType = ftADSP21xx then
    Result := FFileTypes.Strings[12]
   else
  if FileType = ftDWScript then
    Result := FFileTypes.Strings[13]
  else
  if FileType = ftEiffel then
    Result := FFileTypes.Strings[14]
  else
  if FileType = ftFortran then
    Result := FFileTypes.Strings[15]
  else
  if FileType = ftFoxpro then
    Result := FFileTypes.Strings[16]
  else
  if FileType = ftGalaxy then
    Result := FFileTypes.Strings[17]
  else
  if FileType = ftDml then
    Result := FFileTypes.Strings[18]
  else
  if FileType = ftGWScript then
    Result := FFileTypes.Strings[19]
  else
  if FileType = ftHaskell then
    Result := FFileTypes.Strings[20]
  else
  if FileType = ftHP48 then
    Result := FFileTypes.Strings[21]
  else
  if FileType = ftHTML then
    Result := FFileTypes.Strings[22]
  else
  if FileType = ftIni then
    Result := FFileTypes.Strings[23]
  else
  if FileType = ftInno then
    Result := FFileTypes.Strings[24]
  else
  if FileType = ftJava then
    Result := FFileTypes.Strings[25]
  else
  if FileType = ftJScript then
    Result := FFileTypes.Strings[26]
  else
  if FileType = ftKix then
    Result := FFileTypes.Strings[27]
  else
  if FileType = ftLDR then
    Result := FFileTypes.Strings[28]
  else
  if FileType = ftLLVM then
    Result := FFileTypes.Strings[29]
  else
  if FileType = ftModelica then
    Result := FFileTypes.Strings[30]
  else
  if FileType = ftM3 then
    Result := FFileTypes.Strings[31]
  else
  if FileType = ftMsg then
    Result := FFileTypes.Strings[32]
  else
  if FileType = ftBat then
    Result := FFileTypes.Strings[33]
  else
  if FileType = ftPas then
    Result := FFileTypes.Strings[34]
  else
  if FileType = ftPerl then
    Result := FFileTypes.Strings[35]
  else
  if FileType = ftPHP then
    Result := FFileTypes.Strings[36]
  else
  if FileType = ftProgress then
    Result := FFileTypes.Strings[37]
  else
  if FileType = ftPython then
    Result := FFileTypes.Strings[38]
  else
  if FileType = ftRC then
    Result := FFileTypes.Strings[39]
  else
  if FileType = ftRuby then
    Result := FFileTypes.Strings[40]
  else
  if FileType = ftSDD then
    Result := FFileTypes.Strings[41]
  else
  if FileType = ftSQL then
    Result := FFileTypes.Strings[42]
  else
  if FileType = ftSML then
    Result := FFileTypes.Strings[43]
  else
  if FileType = ftST then
    Result := FFileTypes.Strings[44]
  else
  if FileType = ftTclTk then
    Result := FFileTypes.Strings[45]
  else
  if FileType = ftTeX then
    Result := FFileTypes.Strings[46]
  else
  if FileType = ftText then
    Result := FFileTypes.Strings[47]
  else
  if FileType = ftUNIXShellScript then
    Result := FFileTypes.Strings[48]
  else
  if FileType = ftVB then
    Result := FFileTypes.Strings[49]
  else
  if FileType = ftVBScript then
    Result := FFileTypes.Strings[50]
  else
  if FileType = ftVrml97 then
    Result := FFileTypes.Strings[51]
  else
  if FileType = ftWebIDL then
    Result := FFileTypes.Strings[52]
  else
  if FileType = ftAsm then
    Result := FFileTypes.Strings[53]
  else
  if FileType = ftXML then
    Result := FFileTypes.Strings[54]
  else
  if FileType = ftYAML then
    Result := FFileTypes.Strings[55];

  Result := UpperCase(StringBetween(Result, '(', ')'));
end;

constructor TOptionsContainer.Create(AOwner: TComponent);
var
  i: Integer;
begin
  inherited;
  FCompletionProposalShortcut := 'Ctrl+Space';
  FDocDoubleBuffered := True;
  FDocMultiLine := False;
  FDocRightClickSelect := True;
  FDocSaveTabs := True;
  FDocShowCloseButton := False;
  FDocShowImage := True;
  FLineSpacing := 0;
  FFontName := 'Courier New';
  FFontSize := 9;
  FMarginLeftMarginAutoSize := True;
  FMarginFontName := 'Courier New';
  FMarginFontSize := 9;
  FMarginRightMargin := 80;
  FMarginLeftMarginWidth := 30;
  FMarginVisibleLeftMargin := True;
  FMarginVisibleRightMargin := True;
  FMarginInTens := True;
  FMarginZeroStart := False;
  FMarginLineModified := True;
  FMarginModifiedColor := 'clYellow';
  FMarginNormalColor := 'clGreen';
  FMinimapFontSize := 3;
  FHTMLErrorChecking := True;
  FHTMLVersion := shvHtml5;
  FIgnoreBlanks := True;
  FIgnoreCase := True;
  FInsertCaret := ctVerticalLine;
  FNonblinkingCaretColor := 'clBlack';
  FMainMenuFontName := 'Tahoma';
  FMainMenuFontSize := 8;
  FMainMenuSystemFontName := Screen.MenuFont.Name;
  FMainMenuSystemFontSize := Screen.MenuFont.Size;
  FMainMenuUseSystemFont := False;
  FOutputCloseTabByDblClick := False;
  FOutputCloseTabByMiddleClick := False;
  FOutputDoubleBuffered := True;
  FOutputIndent := 20;
  FOutputMultiLine := False;
  FOutputRightClickSelect := True;
  FOutputSaveTabs := True;
  FOutputShowCloseButton := False;
  FOutputShowImage := True;
  FOutputShowtreeLines := False;
  FPersistentHotKeys := False;
  FPrintDateTime := 1;
  FPrintDocumentName := 2;
  FPrintPageNumber := 3;
  FPrintPrintedBy := 0;
  FPrintShowFooterLine := True;
  FPrintShowHeaderLine := True;
  FPrintShowLineNumbers := False;
  FPrintWordWrapLine := False;
  FScrollPastEof := False;
  FScrollPastEol := True;
  FShadows := True;
  FShowSearchStringNotFound := True;
  FShowXMLTree := False;
  FSmartTabDelete := False;
  FSmartTabs := False;
  FStatusBarFontName := 'Tahoma';
  FStatusBarFontSize := 8;
  FStatusBarUseSystemFont := False;
  FTabsToSpaces := True;
  FTabWidth := 2;
  FToolBarCase := True;
  FToolBarCommand := True;
  FToolBarDirectory := True;
  FToolBarDocument := True;
  FToolBarIndent := True;
  FToolBarMacro := True;
  FToolBarMode := True;
  FToolBarPrint := True;
  FToolBarSearch := True;
  FToolBarSort := True;
  FToolBarStandard := True;
  FToolBarTools := True;
  FTrimTrailingSpaces := True;
  FTripleClickRowSelect := True;
  FUndoAfterSave := False;

  FFileTypes := TStringList.Create;
  for i := 0 to 55 do
    FFileTypes.Add(LanguageDataModule.FileTypesMultiStringHolder.MultipleStrings.Items[i].Strings.Text);
end;

destructor TOptionsContainer.Destroy;
begin
  FOptionsContainer := nil;
  inherited;
end;

function TOptionsContainer.GetFilterCount: Cardinal;
begin
  Result := FFileTypes.Count;
end;

function TOptionsContainer.GetFilterExt(FilterIndex: Cardinal): string;
begin
  { -2 because filter index is not 0-based and there's all files (in save dialog) first }
  Result := StringBetween(FFileTypes.Strings[FilterIndex - 2], '(', ')');
  Result := StringReplace(Result, '*', '', []);
  if Pos(';', Result) <> 0 then
    Result := Copy(Result, 1, Pos(';', Result) - 1);
end;

function TOptionsContainer.GetFilterIndex(FileExt: string): Cardinal;
var
  i: Integer;
begin
  Result := 1;
  for i := 0 to FFileTypes.Count - 1 do
    if IsExtInFileType(FileExt, FFileTypes.Strings[i]) then
    begin
      Result := i + 2;
      Break;
    end;
end;

function TOptionsContainer.GetFilters: string;
var
  i: Integer;
begin
  Result := Format('%s'#0'*.*'#0, [LanguageDataModule.GetConstant('AllFiles')]);
  i := 0;
  while i < FFileTypes.Count do
  begin
    Result := Format('%s%s'#0'%s', [Result, LanguageDataModule.FileTypesMultiStringHolder.MultipleStrings.Items[i].Strings.Text,
      StringBetween(FFileTypes.Strings[i], '(', ')')]);
    Inc(i);
    if i < FFileTypes.Count then
      Result := Format('%s'#0, [Result]);
  end;
  Result := Format('%s'#0#0, [Result]);
end;

function TOptionsContainer.GetExtensions: string;
var
  i: Integer;
begin
  Result := '*.*|';
  for i := 0 to FFileTypes.Count - 1 do
    Result := Format('%s%s|', [Result, StringBetween(FFileTypes.Strings[i], '(', ')')]);
end;

function TOptionsContainer.SupportedFileExts(Refresh: Boolean): string;
var
  i: Integer;
begin
  if (FSupportedFileExts = '') or Refresh then
    for i := 0 to FFileTypes.Count - 1 do
      FSupportedFileExts := Format('%s%s;', [FSupportedFileExts, StringBetween(FFileTypes.Strings[i], '(', ')')]);
  Result := FSupportedFileExts;
end;

{ TOptionsDialog }

function OptionsDialog: TOptionsDialog;
begin
  if not Assigned(FOptionsDialog) then
    Application.CreateForm(TOptionsDialog, FOptionsDialog);
  Result := FOptionsDialog;
end;

procedure TOptionsDialog.FormDestroy(Sender: TObject);
begin
  FDirectoryTabsFrame.Free;
  FEditorCompletionProposalFrame.Free;
  FEditorErrorCheckingFrame.Free;
  FEditorFontFrame.Free;
  FEditorLeftMarginFrame.Free;
  FEditorRightMarginFrame.Free;
  FEditorSearchFrame.Free;
  FEditorOptionsFrame.Free;
  FEditorOtherFrame.Free;
  FEditorTabsFrame.Free;
  FFileTypesFrame.Free;
  FMainMenuFrame.Free;
  FOptionsCompareFrame.Free;
  FOptionsDirectoryFrame.Free;
  FOptionsOutputFrame.Free;
  FOptionsPrintFrame.Free;
  FOutputTabsFrame.Free;
  FStatusBarFrame.Free;
  FToolBarFrame.Free;

  FOptionsDialog := nil;
end;

procedure TOptionsDialog.CreateTree;
var
  Data: POptionsRec;
  Node, ChildNode: PVirtualNode;
begin
  with OptionsVirtualStringTree do
  begin
    Clear;
    { Editor }
    Node := AddChild(nil);
    Data := GetNodeData(Node);

    Data.ImageIndex := EditorAction.ImageIndex;
    Data.Caption := EditorAction.Caption;
    { Font }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.ImageIndex := EditorFontAction.ImageIndex;
    Data.Caption := EditorFontAction.Caption;
    { Left Margin }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.ImageIndex := EditorLeftMarginAction.ImageIndex;
    Data.Caption := EditorLeftMarginAction.Caption;
    { Right Margin }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.ImageIndex := EditorRightMarginAction.ImageIndex;
    Data.Caption := EditorRightMarginAction.Caption;
    { Tabs }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.ImageIndex := EditorTabsAction.ImageIndex;
    Data.Caption := EditorTabsAction.Caption;
    { Search }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.ImageIndex := EditorSearchAction.ImageIndex;
    Data.Caption := EditorSearchAction.Caption;
    { Completion proposal }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.ImageIndex := EditorCompletionProposalAction.ImageIndex;
    Data.Caption := EditorCompletionProposalAction.Caption;
    { Error checking }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.ImageIndex := EditorErrorCheckingAction.ImageIndex;
    Data.Caption := EditorErrorCheckingAction.Caption;
    { Other }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.ImageIndex := EditorOtherAction.ImageIndex;
    Data.Caption := EditorOtherAction.Caption;
    Node.ChildCount := 8; { Remember to fix this, if child nodes are added}
    OptionsVirtualStringTree.Selected[Node] := True;
    OptionsVirtualStringTree.Expanded[Node] := True;
    { Directory }
    Node := AddChild(nil);
    Data := GetNodeData(Node);
    Data.ImageIndex := DirectoryAction.ImageIndex;
    Data.Caption := DirectoryAction.Caption;
    { Tabs }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.ImageIndex := DirectoryTabsAction.ImageIndex;
    Data.Caption := DirectoryTabsAction.Caption;
    OptionsVirtualStringTree.Selected[Node] := True;
    OptionsVirtualStringTree.Expanded[Node] := True;
    { Output }
    Node := AddChild(nil);
    Data := GetNodeData(Node);
    Data.ImageIndex := OutputAction.ImageIndex;
    Data.Caption := OutputAction.Caption;
    { Tabs }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.ImageIndex := OutputTabsAction.ImageIndex;
    Data.Caption := OutputTabsAction.Caption;
    OptionsVirtualStringTree.Selected[Node] := True;
    OptionsVirtualStringTree.Expanded[Node] := True;
    { Compare }
    Node := AddChild(nil);
    Data := GetNodeData(Node);
    Data.ImageIndex := CompareAction.ImageIndex;
    Data.Caption := CompareAction.Caption;
    { Print }
    Node := AddChild(nil);
    Data := GetNodeData(Node);
    Data.ImageIndex := PrintAction.ImageIndex;
    Data.Caption := PrintAction.Caption;
    { Main menu }
    Node := AddChild(nil);
    Data := GetNodeData(Node);
    Data.ImageIndex := MainMenuAction.ImageIndex;
    Data.Caption := MainMenuAction.Caption;
    { Tool Bar }
    Node := AddChild(nil);
    Data := GetNodeData(Node);
    Data.ImageIndex := ToolBarAction.ImageIndex;
    Data.Caption := ToolBarAction.Caption;
    { Status Bar }
    Node := AddChild(nil);
    Data := GetNodeData(Node);
    Data.ImageIndex := StatusBarAction.ImageIndex;
    Data.Caption := StatusBarAction.Caption;
    { File types }
    Node := AddChild(nil);
    Data := GetNodeData(Node);
    Data.ImageIndex := FileTypesAction.ImageIndex;
    Data.Caption := FileTypesAction.Caption;

    OptionsVirtualStringTree.Selected[OptionsVirtualStringTree.GetFirst] := True;
  end;
end;

function TOptionsDialog.Execute(EditOptions: TOptionsContainer): Boolean;
var
  SelectedLanguage: string;
begin
  ReadIniFile;

  if not Assigned(EditOptions) then
  begin
    Result:= False;
    Exit;
  end;
  SelectedLanguage := GetSelectedLanguage;

  UpdateLanguage(TForm(Self), SelectedLanguage);
  UpdateLanguage(TForm(FDirectoryTabsFrame), SelectedLanguage);
  UpdateLanguage(TForm(FEditorCompletionProposalFrame), SelectedLanguage);
  UpdateLanguage(TForm(FEditorErrorCheckingFrame), SelectedLanguage);
  UpdateLanguage(TForm(FEditorFontFrame), SelectedLanguage);
  UpdateLanguage(TForm(FEditorLeftMarginFrame), SelectedLanguage);
  UpdateLanguage(TForm(FEditorRightMarginFrame), SelectedLanguage);
  UpdateLanguage(TForm(FEditorSearchFrame), SelectedLanguage);
  UpdateLanguage(TForm(FEditorOptionsFrame), SelectedLanguage);
  UpdateLanguage(TForm(FEditorOtherFrame), SelectedLanguage);
  UpdateLanguage(TForm(FEditorTabsFrame), SelectedLanguage);
  UpdateLanguage(TForm(FFileTypesFrame), SelectedLanguage);
  UpdateLanguage(TForm(FMainMenuFrame), SelectedLanguage);
  UpdateLanguage(TForm(FOptionsCompareFrame), SelectedLanguage);
  UpdateLanguage(TForm(FOptionsDirectoryFrame), SelectedLanguage);
  UpdateLanguage(TForm(FOptionsOutputFrame), SelectedLanguage);
  UpdateLanguage(TForm(FOptionsPrintFrame), SelectedLanguage);
  UpdateLanguage(TForm(FOutputTabsFrame), SelectedLanguage);
  UpdateLanguage(TForm(FStatusBarFrame), SelectedLanguage);
  UpdateLanguage(TForm(FToolBarFrame), SelectedLanguage);

  FOptionsContainer := EditOptions;
  GetData;

  Result:= Showmodal = mrOk;
  if Result then
    PutData;
end;

procedure TOptionsDialog.GetData;
var
  i: Integer;
  FileType: string;
begin
  { Options }
  FEditorOptionsFrame.AutoIndentCheckBox.Checked := FOptionsContainer.AutoIndent;
  FEditorOptionsFrame.AutoSaveCheckBox.Checked := FOptionsContainer.AutoSave;
  FEditorOptionsFrame.NonblinkingCaretCheckBox.Checked := FOptionsContainer.NonblinkingCaret;
  FEditorOptionsFrame.UndoAfterSaveCheckBox.Checked := FOptionsContainer.UndoAfterSave;
  FEditorOptionsFrame.TrimTrailingSpacesCheckBox.Checked := FOptionsContainer.TrimTrailingSpaces;
  FEditorOptionsFrame.TripleClickRowSelectCheckBox.Checked := FOptionsContainer.TripleClickRowSelect;
  FEditorOptionsFrame.ScrollPastEofCheckBox.Checked := FOptionsContainer.ScrollPastEof;
  FEditorOptionsFrame.ScrollPastEolCheckBox.Checked := FOptionsContainer.ScrollPastEol;
  FEditorOptionsFrame.TabsToSpacesCheckBox.Checked := FOptionsContainer.TabsToSpaces;
  FEditorOptionsFrame.SmartTabsCheckBox.Checked := FOptionsContainer.SmartTabs;
  FEditorOptionsFrame.SmartTabDeleteCheckBox.Checked := FOptionsContainer.SmartTabDelete;
  FEditorOptionsFrame.LineSpacingEdit.Text := IntToStr(FOptionsContainer.LineSpacing);
  FEditorOptionsFrame.TabWidthEdit.Text := IntToStr(FOptionsContainer.TabWidth);
  FEditorOptionsFrame.BrightnessTrackBar.Position := FOptionsContainer.ColorBrightness;
  FEditorOptionsFrame.InsertCaretComboBox.ItemIndex := Ord(FOptionsContainer.InsertCaret);
  FEditorOptionsFrame.NonblinkingCaretColorBox.Selected := StringToColor(FOptionsContainer.NonblinkingCaretColor);
  { Font }
  FEditorFontFrame.EditorFontLabel.Font.Name := FOptionsContainer.FontName;
  FEditorFontFrame.EditorFontLabel.Font.Size := FOptionsContainer.FontSize;
  FEditorFontFrame.EditorFontLabel.Caption := Format('%s %dpt', [FEditorFontFrame.EditorFontLabel.Font.Name, FEditorFontFrame.EditorFontLabel.Font.Size]);
  FEditorFontFrame.SynEdit.Text := FEditorFontFrame.EditorFontLabel.Caption;
  FEditorFontFrame.MarginFontLabel.Font.Name := FOptionsContainer.MarginFontName;
  FEditorFontFrame.MarginFontLabel.Font.Size := FOptionsContainer.MarginFontSize;
  FEditorFontFrame.MarginFontLabel.Caption := Format('%s %dpt', [FEditorFontFrame.MarginFontLabel.Font.Name, FEditorFontFrame.MarginFontLabel.Font.Size]);
  FEditorFontFrame.MinimapFontSizeTrackBar.Position := FOptionsContainer.MinimapFontSize;
  { Left Margin }
  FEditorLeftMarginFrame.AutoSizeCheckBox.Checked := FOptionsContainer.MarginLeftMarginAutoSize;
  FEditorLeftMarginFrame.VisibleCheckBox.Checked := FOptionsContainer.MarginVisibleLeftMargin;
  FEditorLeftMarginFrame.InTensCheckBox.Checked := FOptionsContainer.MarginInTens;
  FEditorLeftMarginFrame.ZeroStartCheckBox.Checked := FOptionsContainer.MarginZeroStart;
  FEditorLeftMarginFrame.ShowBookmarkPanelCheckBox.Checked := FOptionsContainer.MarginShowBookmarkPanel;
  FEditorLeftMarginFrame.ShowLineModifiedCheckBox.Checked := FOptionsContainer.MarginLineModified;
  FEditorLeftMarginFrame.LineModifiedColorBox.Selected := StringToColor(FOptionsContainer.MarginModifiedColor);
  FEditorLeftMarginFrame.LineNormalColorBox.Selected := StringToColor(FOptionsContainer.MarginNormalColor);
  FEditorLeftMarginFrame.LeftMarginWidthEdit.Text := IntToStr(FOptionsContainer.MarginLeftMarginWidth);
  { Right Margin }
  FEditorRightMarginFrame.VisibleCheckBox.Checked := FOptionsContainer.MarginVisibleRightMargin;
  FEditorRightMarginFrame.PositionEdit.Text := IntToStr(FOptionsContainer.MarginRightMargin);
  FEditorRightMarginFrame.MouseMoveCheckBox.Checked := FOptionsContainer.MarginLeftMarginMouseMove;
  { Search }
  FEditorSearchFrame.ShowSearchStringNotFoundCheckBox.Checked := FOptionsContainer.ShowSearchStringNotFound;
  FEditorSearchFrame.BeepIfSearchStringNotFoundCheckBox.Checked := FOptionsContainer.BeepIfSearchStringNotFound;
  { Document tabs }
  FEditorTabsFrame.CloseTabByDblClickCheckBox.Checked := FOptionsContainer.DocCloseTabByDblClick;
  FEditorTabsFrame.CloseTabByMiddleClickCheckBox.Checked := FOptionsContainer.DocCloseTabByMiddleClick;
  FEditorTabsFrame.DoubleBufferedCheckBox.Checked := FOptionsContainer.DocDoubleBuffered;
  FEditorTabsFrame.MultiLineCheckBox.Checked := FOptionsContainer.DocMultiLine;
  FEditorTabsFrame.SaveTabsCheckBox.Checked := FOptionsContainer.DocSaveTabs;
  FEditorTabsFrame.ShowCloseButtonCheckBox.Checked := FOptionsContainer.DocShowCloseButton;
  FEditorTabsFrame.ShowImageCheckBox.Checked := FOptionsContainer.DocShowImage;
  FEditorTabsFrame.RightClickSelectCheckBox.Checked := FOptionsContainer.DocRightClickSelect;
  { Completion proposal }
  FEditorCompletionProposalFrame.EnabledCheckBox.Checked := FOptionsContainer.CompletionProposalEnabled;
  FEditorCompletionProposalFrame.CaseSensitiveCheckBox.Checked := FOptionsContainer.CompletionProposalCaseSensitive;
  FEditorCompletionProposalFrame.ShortcutComboBox.Text := FOptionsContainer.CompletionProposalShortcut;
  { Directory }
  FOptionsDirectoryFrame.ShowTreeLinesCheckBox.Checked := FOptionsContainer.DirShowTreeLines;
  FOptionsDirectoryFrame.IndentEdit.Text := IntToStr(FOptionsContainer.DirIndent);
  FOptionsDirectoryFrame.ShowHiddenFilesCheckBox.Checked := FOptionsContainer.DirShowHiddenFiles;
  FOptionsDirectoryFrame.ShowSystemFilesCheckBox.Checked := FOptionsContainer.DirShowSystemFiles;
  FOptionsDirectoryFrame.ShowArchiveFilesCheckBox.Checked := FOptionsContainer.DirShowArchiveFiles;
  { Directory tabs }
  FDirectoryTabsFrame.CloseTabByDblClickCheckBox.Checked := FOptionsContainer.DirCloseTabByDblClick;
  FDirectoryTabsFrame.CloseTabByMiddleClickCheckBox.Checked := FOptionsContainer.DirCloseTabByMiddleClick;
  FDirectoryTabsFrame.DoubleBufferedCheckBox.Checked := FOptionsContainer.DirDoubleBuffered;
  FDirectoryTabsFrame.MultiLineCheckBox.Checked := FOptionsContainer.DirMultiLine;
  FDirectoryTabsFrame.SaveTabsCheckBox.Checked := FOptionsContainer.DirSaveTabs;
  FDirectoryTabsFrame.ShowCloseButtonCheckBox.Checked := FOptionsContainer.DirShowCloseButton;
  FDirectoryTabsFrame.ShowImageCheckBox.Checked := FOptionsContainer.DirShowImage;
  FDirectoryTabsFrame.RightClickSelectCheckBox.Checked := FOptionsContainer.DirRightClickSelect;
  { Output }
  FOptionsOutputFrame.ShowTreeLinesCheckBox.Checked := FOptionsContainer.OutputShowTreeLines;
  FOptionsOutputFrame.IndentEdit.Text := IntToStr(FOptionsContainer.OutputIndent);
  { Output tabs }
  FOutputTabsFrame.CloseTabByDblClickCheckBox.Checked := FOptionsContainer.OutputCloseTabByDblClick;
  FOutputTabsFrame.CloseTabByMiddleClickCheckBox.Checked := FOptionsContainer.OutputCloseTabByMiddleClick;
  FOutputTabsFrame.DoubleBufferedCheckBox.Checked := FOptionsContainer.OutputDoubleBuffered;
  FOutputTabsFrame.MultiLineCheckBox.Checked := FOptionsContainer.OutputMultiLine;
  FOutputTabsFrame.SaveTabsCheckBox.Checked := FOptionsContainer.OutputSaveTabs;
  FOutputTabsFrame.ShowCloseButtonCheckBox.Checked := FOptionsContainer.OutputShowCloseButton;
  FOutputTabsFrame.ShowImageCheckBox.Checked := FOptionsContainer.OutputShowImage;
  FOutputTabsFrame.RightClickSelectCheckBox.Checked := FOptionsContainer.OutputRightClickSelect;
  { Error checking }
  FEditorErrorCheckingFrame.HTMLErrorCheckingCheckBox.Checked := FOptionsContainer.HTMLErrorChecking;
  FEditorErrorCheckingFrame.HTMLVersionComboBox.ItemIndex := Ord(FOptionsContainer.HTMLVersion);
  FEditorErrorCheckingFrame.HTMLVersionComboBox.Enabled := FEditorErrorCheckingFrame.HTMLErrorCheckingCheckBox.Checked;
  { Compare }
  FOptionsCompareFrame.IgnoreCaseCheckBox.Checked := FOptionsContainer.IgnoreCase;
  FOptionsCompareFrame.IgnoreBlanksCheckBox.Checked := FOptionsContainer.IgnoreBlanks;
  { File types }
  FFileTypesFrame.FileTypesListBox.Clear;
  for i := 0 to FOptionsContainer.FileTypes.Count - 1 do
  begin
    FileType := Trim(Copy(LanguageDataModule.FileTypesMultiStringHolder.MultipleStrings.Items[i].Strings.Text, 0,
      Pos('(', LanguageDataModule.FileTypesMultiStringHolder.MultipleStrings.Items[i].Strings.Text) - 1));
    FFileTypesFrame.FileTypesListBox.Items.Add(Format('%s (%s)', [
      FileType, StringBetween(FOptionsContainer.FileTypes.Strings[i], '(', ')')]));
  end;
  FFileTypesFrame.FileTypesListBox.ItemIndex := 0;
  FFileTypesFrame.FileTypesListBoxClick(nil);
  { Other }
  FEditorOtherFrame.SQLDialectComboBox.ItemIndex := Ord(FOptionsContainer.SQLDialect);
  FEditorOtherFrame.CPASHighlighterComboBox.ItemIndex := Ord(FOptionsContainer.CPASHighlighter);
  FEditorOtherFrame.CSSVersionComboBox.ItemIndex := Ord(FOptionsContainer.CSSVersion);
  FEditorOtherFrame.PHPVersionComboBox.ItemIndex := Ord(FOptionsContainer.PHPVersion);
  FEditorOtherFrame.DefaultEncodingComboBox.ItemIndex := FOptionsContainer.DefaultEncoding;
  FEditorOtherFrame.DefaultHighlighterComboBox.ItemIndex := FOptionsContainer.DefaultHighlighter;
  { Print preview }
  FOptionsPrintFrame.DocumentNameComboBox.ItemIndex := FOptionsContainer.PrintDocumentName;
  FOptionsPrintFrame.PageNumberComboBox.ItemIndex := FOptionsContainer.PrintPageNumber;
  FOptionsPrintFrame.PrintedByComboBox.ItemIndex := FOptionsContainer.PrintPrintedBy;
  FOptionsPrintFrame.DateTimeComboBox.ItemIndex := FOptionsContainer.PrintDateTime;
  FOptionsPrintFrame.ShowHeaderLineCheckBox.Checked := FOptionsContainer.PrintShowHeaderLine;
  FOptionsPrintFrame.ShowFooterLineCheckBox.Checked := FOptionsContainer.PrintShowFooterLine;
  FOptionsPrintFrame.ShowLineNumbersCheckBox.Checked := FOptionsContainer.PrintShowLineNumbers;
  FOptionsPrintFrame.WordWrapCheckBox.Checked := FOptionsContainer.PrintWordWrapLine;
  { Main menu }
  FMainMenuFrame.PersistentHotKeysCheckBox.Checked := FOptionsContainer.PersistentHotKeys;
  FMainMenuFrame.ShadowsCheckBox.Checked := FOptionsContainer.Shadows;
  FMainMenuFrame.UseSystemFontCheckBox.Checked := FOptionsContainer.MainMenuUseSystemFont;
  FMainMenuFrame.FontLabel.Font.Name := FOptionsContainer.MainMenuFontName;
  FMainMenuFrame.FontLabel.Font.Size := FOptionsContainer.MainMenuFontSize;
  FMainMenuFrame.FontLabel.Caption := Format('%s %dpt', [FMainMenuFrame.FontLabel.Font.Name, FMainMenuFrame.FontLabel.Font.Size]);
  FMainMenuFrame.AnimationStyleComboBox.ItemIndex := Ord(FOptionsContainer.AnimationStyle);
  FMainMenuFrame.AnimationDurationEdit.Text := IntToStr(FOptionsContainer.AnimationDuration);
  { Tool bar }
  FToolBarFrame.StandardCheckBox.Checked := FOptionsContainer.ToolBarStandard;
  FToolBarFrame.PrintCheckBox.Checked := FOptionsContainer.ToolBarPrint;
  FToolBarFrame.DirectoryCheckBox.Checked := FOptionsContainer.ToolBarDirectory;
  FToolBarFrame.IndentCheckBox.Checked := FOptionsContainer.ToolBarIndent;
  FToolBarFrame.SortCheckBox.Checked := FOptionsContainer.ToolBarSort;
  FToolBarFrame.CaseCheckBox.Checked := FOptionsContainer.ToolBarCase;
  FToolBarFrame.CommandCheckBox.Checked := FOptionsContainer.ToolBarCommand;
  FToolBarFrame.SearchCheckBox.Checked := FOptionsContainer.ToolBarSearch;
  FToolBarFrame.ModeCheckBox.Checked := FOptionsContainer.ToolBarMode;
  FToolBarFrame.ToolsCheckBox.Checked := FOptionsContainer.ToolBarTools;
  FToolBarFrame.MacroCheckBox.Checked := FOptionsContainer.ToolBarMacro;
  FToolBarFrame.DocumentCheckBox.Checked := FOptionsContainer.ToolBarDocument;
  { Status bar }
  FStatusBarFrame.UseSystemFontCheckBox.Checked := FOptionsContainer.StatusBarUseSystemFont;
  FStatusBarFrame.FontLabel.Font.Name := FOptionsContainer.StatusBarFontName;
  FStatusBarFrame.FontLabel.Font.Size := FOptionsContainer.StatusBarFontSize;
  FStatusBarFrame.FontLabel.Caption := Format('%s %dpt', [FStatusBarFrame.FontLabel.Font.Name, FStatusBarFrame.FontLabel.Font.Size]);
end;

procedure TOptionsDialog.OptionsVirtualStringTreeClick(Sender: TObject);
begin
  SetVisibleFrame;
end;

procedure TOptionsDialog.SetVisibleFrame;
var
  i, Level, ParentIndex: Integer;
  TreeNode: PVirtualNode;
begin
  inherited;
  TreeNode := OptionsVirtualStringTree.GetFirstSelected;
  if Assigned(TreeNode) then
  begin
    { hide all frames }
    for i := 0 to ComponentCount - 1 do
      if Components[i]  is TFrame then
        TFrame(Components[i]).Visible := False;
    Level := OptionsVirtualStringTree.GetNodeLevel(TreeNode);
    ParentIndex := -1;
    if Level = 1 then
      ParentIndex := TreeNode.Parent.Index;
    FEditorOptionsFrame.Visible := (Level = 0) and (TreeNode.Index = 0);
    FEditorFontFrame.Visible := (ParentIndex = 0) and (Level = 1) and (TreeNode.Index = 0);
    if FEditorFontFrame.Visible then
    begin
      FOptionsContainer.AssignTo(FEditorFontFrame.SynEdit);
      UpdateMarginAndColors(FEditorFontFrame.SynEdit);
    end;
    FEditorLeftMarginFrame.Visible := (ParentIndex = 0) and (Level = 1) and (TreeNode.Index = 1);
    FEditorRightMarginFrame.Visible := (ParentIndex = 0) and (Level = 1) and (TreeNode.Index = 2);
    FEditorTabsFrame.Visible := (ParentIndex = 0) and (Level = 1) and (TreeNode.Index = 3);
    FEditorSearchFrame.Visible := (ParentIndex = 0) and (Level = 1) and (TreeNode.Index = 4);
    FEditorCompletionProposalFrame.Visible := (ParentIndex = 0) and (Level = 1) and (TreeNode.Index = 5);
    FEditorErrorCheckingFrame.Visible := (ParentIndex = 0) and (Level = 1) and (TreeNode.Index = 6);
    FEditorOtherFrame.Visible := (ParentIndex = 0) and (Level = 1) and (TreeNode.Index = 7);
    FOptionsDirectoryFrame.Visible := (Level = 0) and (TreeNode.Index = 1);
    FDirectoryTabsFrame.Visible := (ParentIndex = 1) and (Level = 1) and (TreeNode.Index = 0);
    FOptionsOutputFrame.Visible := (Level = 0) and (TreeNode.Index = 2);
    FOutputTabsFrame.Visible := (ParentIndex = 2) and (Level = 1) and (TreeNode.Index = 0);
    FOptionsCompareFrame.Visible := (Level = 0) and (TreeNode.Index = 3);
    FOptionsPrintFrame.Visible := (Level = 0) and (TreeNode.Index = 4);
    FMainMenuFrame.Visible := (Level = 0) and (TreeNode.Index = 5);
    FToolBarFrame.Visible := (Level = 0) and (TreeNode.Index = 6);
    FStatusBarFrame.Visible := (Level = 0) and (TreeNode.Index = 7);
    FFileTypesFrame.Visible := (Level = 0) and (TreeNode.Index = 8);

    { style bug with long TEdit border and resize }
    if FFileTypesFrame.Visible then
      if FFileTypesFrame.ExtensionsEdit.CanFocus then
        FFileTypesFrame.ExtensionsEdit.SetFocus;
  end;
end;

procedure TOptionsDialog.OptionsVirtualStringTreeFreeNode(Sender: TBaseVirtualTree;
  Node: PVirtualNode);
var
  Data: POptionsRec;
begin
  Data := Sender.GetNodeData(Node);
  Finalize(Data^);
end;

procedure TOptionsDialog.OptionsVirtualStringTreeGetImageIndex(Sender: TBaseVirtualTree;
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

procedure TOptionsDialog.OptionsVirtualStringTreeGetText(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
var
  Data: POptionsRec;
begin
  Data := Sender.GetNodeData(Node);
  if Assigned(Data) then
    CellText := Data.Caption;
end;

procedure TOptionsDialog.OptionsVirtualStringTreePaintText(Sender: TBaseVirtualTree; const TargetCanvas: TCanvas;
  Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType);
var
  LStyles: TCustomStyleServices;
begin
  if TStyleManager.ActiveStyle.Name <> STYLENAME_WINDOWS then
    if vsSelected in Node.States then
    begin
      LStyles := StyleServices;
      if LStyles.Enabled then
        TargetCanvas.Font.Color := LStyles.GetSystemColor(clHighlightText)
    end;
end;

procedure TOptionsDialog.PutData;
var
  i: Integer;
  FileType: string;
begin
  { Options }
  FOptionsContainer.AutoIndent := FEditorOptionsFrame.AutoIndentCheckBox.Checked;
  FOptionsContainer.AutoSave := FEditorOptionsFrame.AutoSaveCheckBox.Checked;
  FOptionsContainer.NonblinkingCaret := FEditorOptionsFrame.NonblinkingCaretCheckBox.Checked;
  FOptionsContainer.UndoAfterSave := FEditorOptionsFrame.UndoAfterSaveCheckBox.Checked;
  FOptionsContainer.TrimTrailingSpaces := FEditorOptionsFrame.TrimTrailingSpacesCheckBox.Checked;
  FOptionsContainer.TripleClickRowSelect := FEditorOptionsFrame.TripleClickRowSelectCheckBox.Checked;
  FOptionsContainer.ScrollPastEof := FEditorOptionsFrame.ScrollPastEofCheckBox.Checked;
  FOptionsContainer.ScrollPastEol := FEditorOptionsFrame.ScrollPastEolCheckBox.Checked;
  FOptionsContainer.TabsToSpaces := FEditorOptionsFrame.TabsToSpacesCheckBox.Checked;
  FOptionsContainer.SmartTabs := FEditorOptionsFrame.SmartTabsCheckBox.Checked;
  FOptionsContainer.SmartTabDelete := FEditorOptionsFrame.SmartTabDeleteCheckBox.Checked;
  FOptionsContainer.LineSpacing := StrToIntDef(FEditorOptionsFrame.LineSpacingEdit.Text, 0);
  FOptionsContainer.TabWidth := StrToIntDef(FEditorOptionsFrame.TabWidthEdit.Text, 2);
  FOptionsContainer.ColorBrightness := FEditorOptionsFrame.BrightnessTrackBar.Position;
  FOptionsContainer.InsertCaret := TSynEditCaretType(FEditorOptionsFrame.InsertCaretComboBox.ItemIndex);
  FOptionsContainer.NonblinkingCaretColor := ColorToString(FEditorOptionsFrame.NonblinkingCaretColorBox.Selected);
  { Font }
  FOptionsContainer.FontName := FEditorFontFrame.EditorFontLabel.Font.Name;
  FOptionsContainer.FontSize := FEditorFontFrame.EditorFontLabel.Font.Size;
  FOptionsContainer.MarginFontName := FEditorFontFrame.MarginFontLabel.Font.Name;
  FOptionsContainer.MarginFontSize := FEditorFontFrame.MarginFontLabel.Font.Size;
  FOptionsContainer.MinimapFontSize := FEditorFontFrame.MinimapFontSizeTrackBar.Position;
  { Left Margin }
  FOptionsContainer.MarginVisibleLeftMargin := FEditorLeftMarginFrame.VisibleCheckBox.Checked;
  FOptionsContainer.MarginLeftMarginAutoSize := FEditorLeftMarginFrame.AutoSizeCheckBox.Checked;
  FOptionsContainer.MarginInTens := FEditorLeftMarginFrame.InTensCheckBox.Checked;
  FOptionsContainer.MarginZeroStart := FEditorLeftMarginFrame.ZeroStartCheckBox.Checked;
  FOptionsContainer.MarginShowBookmarkPanel := FEditorLeftMarginFrame.ShowBookmarkPanelCheckBox.Checked;
  FOptionsContainer.MarginLineModified := FEditorLeftMarginFrame.ShowLineModifiedCheckBox.Checked;
  FOptionsContainer.MarginModifiedColor := ColorToString(FEditorLeftMarginFrame.LineModifiedColorBox.Selected);
  FOptionsContainer.MarginNormalColor := ColorToString(FEditorLeftMarginFrame.LineNormalColorBox.Selected);
  FOptionsContainer.MarginLeftMarginWidth := StrToIntDef(FEditorLeftMarginFrame.LeftMarginWidthEdit.Text, 30);
  { Right Margin }
  FOptionsContainer.MarginVisibleRightMargin := FEditorRightMarginFrame.VisibleCheckBox.Checked;
  FOptionsContainer.MarginRightMargin := StrToIntDef(FEditorRightMarginFrame.PositionEdit.Text, 80);
  FOptionsContainer.MarginLeftMarginMouseMove := FEditorRightMarginFrame.MouseMoveCheckBox.Checked;
  { Search }
  FOptionsContainer.ShowSearchStringNotFound := FEditorSearchFrame.ShowSearchStringNotFoundCheckBox.Checked;
  FOptionsContainer.BeepIfSearchStringNotFound := FEditorSearchFrame.BeepIfSearchStringNotFoundCheckBox.Checked;
  { Document tabs }
  FOptionsContainer.DocCloseTabByDblClick := FEditorTabsFrame.CloseTabByDblClickCheckBox.Checked;
  FOptionsContainer.DocCloseTabByMiddleClick := FEditorTabsFrame.CloseTabByMiddleClickCheckBox.Checked;
  FOptionsContainer.DocDoubleBuffered := FEditorTabsFrame.DoubleBufferedCheckBox.Checked;
  FOptionsContainer.DocMultiLine := FEditorTabsFrame.MultiLineCheckBox.Checked;
  FOptionsContainer.DocSaveTabs := FEditorTabsFrame.SaveTabsCheckBox.Checked;
  FOptionsContainer.DocShowCloseButton := FEditorTabsFrame.ShowCloseButtonCheckBox.Checked;
  FOptionsContainer.DocShowImage := FEditorTabsFrame.ShowImageCheckBox.Checked;
  FOptionsContainer.DocRightClickSelect := FEditorTabsFrame.RightClickSelectCheckBox.Checked;
  { Completion proposal }
  FOptionsContainer.CompletionProposalEnabled := FEditorCompletionProposalFrame.EnabledCheckBox.Checked;
  FOptionsContainer.CompletionProposalCaseSensitive := FEditorCompletionProposalFrame.CaseSensitiveCheckBox.Checked;
  FOptionsContainer.CompletionProposalShortcut := FEditorCompletionProposalFrame.ShortcutComboBox.Text;
  { Directory }
  FOptionsContainer.DirShowTreeLines := FOptionsDirectoryFrame.ShowTreeLinesCheckBox.Checked;
  FOptionsContainer.DirShowHiddenFiles := FOptionsDirectoryFrame.ShowHiddenFilesCheckBox.Checked;
  FOptionsContainer.DirShowSystemFiles := FOptionsDirectoryFrame.ShowSystemFilesCheckBox.Checked;
  FOptionsContainer.DirShowArchiveFiles := FOptionsDirectoryFrame.ShowArchiveFilesCheckBox.Checked;
  FOptionsContainer.DirIndent := StrToIntDef(FOptionsDirectoryFrame.IndentEdit.Text, 20);
  { Directory tabs }
  FOptionsContainer.DirCloseTabByDblClick := FDirectoryTabsFrame.CloseTabByDblClickCheckBox.Checked;
  FOptionsContainer.DirCloseTabByMiddleClick := FDirectoryTabsFrame.CloseTabByMiddleClickCheckBox.Checked;
  FOptionsContainer.DirDoubleBuffered := FDirectoryTabsFrame.DoubleBufferedCheckBox.Checked;
  FOptionsContainer.DirMultiLine := FDirectoryTabsFrame.MultiLineCheckBox.Checked;
  FOptionsContainer.DirSaveTabs := FDirectoryTabsFrame.SaveTabsCheckBox.Checked;
  FOptionsContainer.DirShowCloseButton := FDirectoryTabsFrame.ShowCloseButtonCheckBox.Checked;
  FOptionsContainer.DirShowImage := FDirectoryTabsFrame.ShowImageCheckBox.Checked;
  FOptionsContainer.DirRightClickSelect := FDirectoryTabsFrame.RightClickSelectCheckBox.Checked;
  { Output }
  FOptionsContainer.OutputShowTreeLines := FOptionsOutputFrame.ShowTreeLinesCheckBox.Checked;
  FOptionsContainer.OutputIndent := StrToIntDef(FOptionsOutputFrame.IndentEdit.Text, 20);
  { Output tabs }
  FOptionsContainer.OutputCloseTabByDblClick := FOutputTabsFrame.CloseTabByDblClickCheckBox.Checked;
  FOptionsContainer.OutputCloseTabByMiddleClick := FOutputTabsFrame.CloseTabByMiddleClickCheckBox.Checked;
  FOptionsContainer.OutputDoubleBuffered := FOutputTabsFrame.DoubleBufferedCheckBox.Checked;
  FOptionsContainer.OutputMultiLine := FOutputTabsFrame.MultiLineCheckBox.Checked;
  FOptionsContainer.OutputSaveTabs := FOutputTabsFrame.SaveTabsCheckBox.Checked;
  FOptionsContainer.OutputShowCloseButton := FOutputTabsFrame.ShowCloseButtonCheckBox.Checked;
  FOptionsContainer.OutputShowImage := FOutputTabsFrame.ShowImageCheckBox.Checked;
  FOptionsContainer.OutputRightClickSelect := FOutputTabsFrame.RightClickSelectCheckBox.Checked;
  { Compare }
  FOptionsContainer.IgnoreCase := FOptionsCompareFrame.IgnoreCaseCheckBox.Checked;
  FOptionsContainer.IgnoreBlanks := FOptionsCompareFrame.IgnoreBlanksCheckBox.Checked;
  { Error checking }
  FOptionsContainer.HTMLErrorChecking := FEditorErrorCheckingFrame.HTMLErrorCheckingCheckBox.Checked;
  FOptionsContainer.HTMLVersion := TSynWebHtmlVersion(FEditorErrorCheckingFrame.HTMLVersionComboBox.ItemIndex);
  { File types }
  FOptionsContainer.FileTypes.Clear;
  for i := 0 to FFileTypesFrame.FileTypesListBox.Items.Count - 1 do
  begin
    FileType := Trim(Copy(LanguageDataModule.FileTypesMultiStringHolder.MultipleStrings.Items[i].Strings.Text, 0,
      Pos('(', LanguageDataModule.FileTypesMultiStringHolder.MultipleStrings.Items[i].Strings.Text) - 1));
    FOptionsContainer.FileTypes.Add(Format('%s (%s)', [
      FileType, StringBetween(FFileTypesFrame.FileTypesListBox.Items.Strings[i], '(', ')')]));
  end;
  { Other }
  FOptionsContainer.SQLDialect := TSQLDialect(FEditorOtherFrame.SQLDialectComboBox.ItemIndex);
  FOptionsContainer.CPASHighlighter := TCPASHighlighter(FEditorOtherFrame.CPASHighlighterComboBox.ItemIndex);
  FOptionsContainer.CSSVersion := TSynWebCssVersion(FEditorOtherFrame.CSSVersionComboBox.ItemIndex);
  FOptionsContainer.PHPVersion := TSynWebPhpVersion(FEditorOtherFrame.PHPVersionComboBox.ItemIndex);
  FOptionsContainer.DefaultEncoding := FEditorOtherFrame.DefaultEncodingComboBox.ItemIndex;
  FOptionsContainer.DefaultHighlighter := FEditorOtherFrame.DefaultHighlighterComboBox.ItemIndex;
  { Print preview }
  FOptionsContainer.PrintDocumentName := FOptionsPrintFrame.DocumentNameComboBox.ItemIndex;
  FOptionsContainer.PrintPageNumber := FOptionsPrintFrame.PageNumberComboBox.ItemIndex;
  FOptionsContainer.PrintPrintedBy := FOptionsPrintFrame.PrintedByComboBox.ItemIndex;
  FOptionsContainer.PrintDateTime := FOptionsPrintFrame.DateTimeComboBox.ItemIndex;
  FOptionsContainer.PrintShowHeaderLine := FOptionsPrintFrame.ShowHeaderLineCheckBox.Checked;
  FOptionsContainer.PrintShowFooterLine := FOptionsPrintFrame.ShowFooterLineCheckBox.Checked;
  FOptionsContainer.PrintShowLineNumbers := FOptionsPrintFrame.ShowLineNumbersCheckBox.Checked;
  FOptionsContainer.PrintWordWrapLine := FOptionsPrintFrame.WordWrapCheckBox.Checked;
  { Main menu }
  FOptionsContainer.PersistentHotKeys := FMainMenuFrame.PersistentHotKeysCheckBox.Checked;
  FOptionsContainer.Shadows := FMainMenuFrame.ShadowsCheckBox.Checked;
  FOptionsContainer.MainMenuUseSystemFont := FMainMenuFrame.UseSystemFontCheckBox.Checked;
  FOptionsContainer.MainMenuFontName := FMainMenuFrame.FontLabel.Font.Name;
  FOptionsContainer.MainMenuFontSize := FMainMenuFrame.FontLabel.Font.Size;
  FOptionsContainer.AnimationStyle := TAnimationStyle(FMainMenuFrame.AnimationStyleComboBox.ItemIndex);
  FOptionsContainer.AnimationDuration := StrToIntDef(FMainMenuFrame.AnimationDurationEdit.Text, 150);
  { Tool bar }
  FOptionsContainer.ToolBarStandard := FToolBarFrame.StandardCheckBox.Checked;
  FOptionsContainer.ToolBarPrint := FToolBarFrame.PrintCheckBox.Checked;
  FOptionsContainer.ToolBarDirectory :=  FToolBarFrame.DirectoryCheckBox.Checked;
  FOptionsContainer.ToolBarIndent := FToolBarFrame.IndentCheckBox.Checked;
  FOptionsContainer.ToolBarSort := FToolBarFrame.SortCheckBox.Checked;
  FOptionsContainer.ToolBarCase := FToolBarFrame.CaseCheckBox.Checked;
  FOptionsContainer.ToolBarCommand := FToolBarFrame.CommandCheckBox.Checked;
  FOptionsContainer.ToolBarSearch := FToolBarFrame.SearchCheckBox.Checked;
  FOptionsContainer.ToolBarMode := FToolBarFrame.ModeCheckBox.Checked;
  FOptionsContainer.ToolBarTools := FToolBarFrame.ToolsCheckBox.Checked;
  FOptionsContainer.ToolBarMacro := FToolBarFrame.MacroCheckBox.Checked;
  FOptionsContainer.ToolBarDocument := FToolBarFrame.DocumentCheckBox.Checked;
  { Status bar }
  FOptionsContainer.StatusBarUseSystemFont := FStatusBarFrame.UseSystemFontCheckBox.Checked;
  FOptionsContainer.StatusBarFontName := FStatusBarFrame.FontLabel.Font.Name;
  FOptionsContainer.StatusBarFontSize := FStatusBarFrame.FontLabel.Font.Size;
end;

procedure TOptionsDialog.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  OptionsContainer.SupportedFileExts(True);
  WriteIniFile;
end;

procedure TOptionsDialog.ReadIniFile;
begin
  with TMemIniFile.Create(GetIniFilename) do
  try
    { Size }
    Width := ReadInteger('OptionsSize', 'Width', Width);
    Height := ReadInteger('OptionsSize', 'Height', Height);
    { Position }
    Left := ReadInteger('OptionsPosition', 'Left', (Screen.Width - Width) div 2);
    Top := ReadInteger('OptionsPosition', 'Top', (Screen.Height - Height) div 2);
    { Tree width }
    OptionsVirtualStringTree.Width := ReadInteger('OptionsSize', 'TreeWidth', OptionsVirtualStringTree.Width);
  finally
    Free;
  end;
end;

procedure TOptionsDialog.WriteIniFile;
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
    WriteInteger('OptionsSize', 'TreeWidth', OptionsVirtualStringTree.Width);
  finally
    UpdateFile;
    Free;
  end;
end;

procedure TOptionsDialog.FormCreate(Sender: TObject);
begin
  OptionsVirtualStringTree.NodeDataSize := SizeOf(TOptionsRec);
  FDirectoryTabsFrame := TDirectoryTabsFrame.Create(OptionsPanel);
  FDirectoryTabsFrame.Parent := OptionsPanel;
  FEditorCompletionProposalFrame := TEditorCompletionProposalFrame.Create(OptionsPanel);
  FEditorCompletionProposalFrame.Parent := OptionsPanel;
  FEditorErrorCheckingFrame := TEditorErrorCheckingFrame.Create(OptionsPanel);
  FEditorErrorCheckingFrame.Parent := OptionsPanel;
  FEditorFontFrame := TEditorFontFrame.Create(OptionsPanel);
  FEditorFontFrame.Parent := OptionsPanel;
  FEditorLeftMarginFrame := TEditorLeftMarginFrame.Create(OptionsPanel);
  FEditorLeftMarginFrame.Parent := OptionsPanel;
  FEditorRightMarginFrame := TEditorRightMarginFrame.Create(OptionsPanel);
  FEditorRightMarginFrame.Parent := OptionsPanel;
  FEditorSearchFrame := TEditorSearchFrame.Create(OptionsPanel);
  FEditorSearchFrame.Parent := OptionsPanel;
  FEditorOptionsFrame := TEditorOptionsFrame.Create(OptionsPanel);
  FEditorOptionsFrame.Parent := OptionsPanel;
  FEditorOtherFrame := TEditorOtherFrame.Create(OptionsPanel);
  FEditorOtherFrame.Parent := OptionsPanel;
  FEditorTabsFrame := TEditorTabsFrame.Create(OptionsPanel);
  FEditorTabsFrame.Parent := OptionsPanel;
  FFileTypesFrame := TFileTypesFrame.Create(OptionsPanel);
  FFileTypesFrame.Parent := OptionsPanel;
  FMainMenuFrame := TMainMenuFrame.Create(OptionsPanel);
  FMainMenuFrame.Parent := OptionsPanel;
  FOptionsCompareFrame := TOptionsCompareFrame.Create(OptionsPanel);
  FOptionsCompareFrame.Parent := OptionsPanel;
  FOptionsDirectoryFrame := TOptionsDirectoryFrame.Create(OptionsPanel);
  FOptionsDirectoryFrame.Parent := OptionsPanel;
  FOptionsOutputFrame := TOptionsOutputFrame.Create(OptionsPanel);
  FOptionsOutputFrame.Parent := OptionsPanel;
  FOptionsPrintFrame := TOptionsPrintFrame.Create(OptionsPanel);
  FOptionsPrintFrame.Parent := OptionsPanel;
  FOutputTabsFrame := TOutputTabsFrame.Create(OptionsPanel);
  FOutputTabsFrame.Parent := OptionsPanel;
  FStatusBarFrame := TStatusBarFrame.Create(OptionsPanel);
  FStatusBarFrame.Parent := OptionsPanel;
  FToolBarFrame := TToolBarFrame.Create(OptionsPanel);
  FToolBarFrame.Parent := OptionsPanel;
end;

procedure TOptionsDialog.FormShow(Sender: TObject);
var
  Node: PVirtualNode;
begin
  inherited;
  Node := OptionsVirtualStringTree.GetFirstSelected;
  CreateTree;
  OptionsVirtualStringTree.Selected[Node] := True;
  SetVisibleFrame;
end;

end.
