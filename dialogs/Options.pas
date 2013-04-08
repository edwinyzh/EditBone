unit Options;

interface

uses
  Winapi.Windows, Winapi.Messages, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.ComCtrls, Winapi.CommCtrl, System.Win.Registry, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.Menus, SynEdit, SynEditHighlighter, SynEditMiscClasses, SynHighlighterWebData, SynEditKeyCmds,
  System.Classes, System.SysUtils, Vcl.ImgList, SynHighlighterWeb, Vcl.Grids, SynHighlighterSQL,
  BCCheckBox, Document, JvExStdCtrls, JvEdit, BCEdit, JvCombobox, BCComboBox, Vcl.ActnList,
  Vcl.Themes, Dlg, Vcl.CheckLst, BCPageControl, JvExComCtrls, JvComCtrls, VirtualTrees,
  OptionsEditorOptions, OptionsEditorFont, OptionsEditorGutter, OptionsEditorTabs, Lib,
  OptionsEditorErrorChecking, OptionsEditorOther, OptionsFileTypes, OptionsCompare, OptionsMainMenu,
  OptionsDirectoryTabs, OptionsOutputTabs, OptionsDirectory, Vcl.ActnMenus;

type
  POptionsRec = ^TOptionsRec;
  TOptionsRec = record
    Caption: UnicodeString;
    ImageIndex: Integer;
  end;

  TOptionsContainer = class;

  TOptionsDialog = class(TDialog)
    ActionList: TActionList;
    ButtonDividerPanel: TPanel;
    ButtonPanel: TPanel;
    CancelButton: TButton;
    CompareAction: TAction;
    DirectoryAction: TAction;
    DirectoryTabsAction: TAction;
    EditorAction: TAction;
    EditorErrorCheckingAction: TAction;
    EditorFontAction: TAction;
    EditorGutterAction: TAction;
    EditorOtherAction: TAction;
    EditorTabsAction: TAction;
    FileTypesAction: TAction;
    ImageList: TImageList;
    MainMenuAction: TAction;
    OKButton: TButton;
    OptionsPanel: TPanel;
    OptionsVirtualStringTree: TVirtualStringTree;
    OutputAction: TAction;
    OutputTabsAction: TAction;
    Splitter: TSplitter;
    TopPanel: TPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure OptionsVirtualStringTreeClick(Sender: TObject);
    procedure OptionsVirtualStringTreeFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure OptionsVirtualStringTreeGetImageIndex(Sender: TBaseVirtualTree; Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex; var Ghosted: Boolean; var ImageIndex: Integer);
    procedure OptionsVirtualStringTreeGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
  private
    FDirectoryOptionsFrame: TDirectoryOptionsFrame;
    FDirectoryTabsFrame: TDirectoryTabsFrame;
    FEditorErrorCheckingFrame: TEditorErrorCheckingFrame;
    FEditorFontFrame: TEditorFontFrame;
    FEditorGutterFrame: TEditorGutterFrame;
    FEditorOptionsFrame: TEditorOptionsFrame;
    FEditorOtherFrame: TEditorOtherFrame;
    FEditorTabsFrame: TEditorTabsFrame;
    FFileTypesFrame: TFileTypesFrame;
    FMainMenuFrame: TMainMenuFrame;
    FOptionsCompareFrame: TOptionsCompareFrame;
    FOptionsContainer: TOptionsContainer;
    FOutputTabsFrame: TOutputTabsFrame;
    procedure CreateTree;
    procedure GetData;
    procedure PutData;
    procedure ReadIniFile;
    procedure SetVisibleFrame;
    procedure WriteIniFile;
  public
    function Execute(EditOptions: TOptionsContainer) : Boolean;
  end;

  TFileType = (ftHC11, ftAWK, ftBaan, ftCS, ftCPP, ftCAC, ftCache, ftCss, ftCobol, ftIdl,
    ftCPM, ftDOT, ftADSP21xx, ftDWScript, ftEiffel, ftFortran, ftFoxpro, ftGalaxy, ftDml, ftGWScript, ftHaskell,
    ftHP48, ftHTML, ftIni, ftInno, ftJava, ftJScript, ftKix, ftLDR, ftModelica, ftM3,
    ftMsg, ftBat, ftPas, ftPerl, ftPHP, ftProgress, ftPython, ftRC, ftRuby, ftSDD,
    ftSQL, ftSML, ftST, ftTclTk, ftTeX, ftText, ftUNIXShellScript, ftVB, ftVBScript, ftVrml97,
    ftAsm, ftXML);

  TOptionsContainer = class(TComponent)
  private
    FAnimationDuration: Integer;
    FAnimationStyle: TAnimationStyle;
    FAutoIndent: Boolean;
    FColorBrightness: Integer;
    FCPASHighlighter: TCPASHighlighter;
    FCSSVersion: TSynWebCssVersion;
    FDirShowTreeLines: Boolean;
    FDirIndent: Integer;
    FDirMultiLine: Boolean;
    FDirShowCloseButton: Boolean;
    FDocMultiLine: Boolean;
    FDocShowCloseButton: Boolean;
    FEnableLineNumbers: Boolean;
    FEnableSelectionMode: Boolean;
    FEnableSpecialChars: Boolean;
    FEnableWordWrap: Boolean;
    FExtraLineSpacing: Integer;
    FFileTypes: TStrings;
    FFontName: string;
    FFontSize: Integer;
    FGutterFontName: string;
    FGutterFontSize: Integer;
    FGutterVisible: Boolean;
    FHTMLErrorChecking: Boolean;
    FHTMLVersion: TSynWebHtmlVersion;
    FIgnoreBlanks: Boolean;
    FIgnoreCase: Boolean;
    FMainMenuFontName: string;
    FMainMenuFontSize: Integer;
    FMainMenuSystemFontName: string;
    FMainMenuSystemFontSize: Integer;
    FOutputMultiLine: Boolean;
    FOutputShowCloseButton: Boolean;
    FPersistentHotKeys: Boolean;
    FPHPVersion: TSynWebPhpVersion;
    FRightMargin: Integer;
    FScrollPastEof: Boolean;
    FScrollPastEol: Boolean;
    FShadows: Boolean;
    FShowXMLTree: Boolean;
    FSQLDialect: TSQLDialect;
    FTabsToSpaces: Boolean;
    FTabWidth: Integer;
    FTrimTrailingSpaces: Boolean;
    FUseSystemFont: Boolean;
    function GetExtensions: string;
    function GetFilters: string;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function FileType(FileType: TFileType): string;
    procedure AssignTo(Dest: TPersistent); override;
  published
    property AnimationDuration: Integer read FAnimationDuration write FAnimationDuration;
    property AnimationStyle: TAnimationStyle read FAnimationStyle write FAnimationStyle;
    property AutoIndent: Boolean read FAutoIndent write FAutoIndent;
    property ColorBrightness: Integer read FColorBrightness write FColorBrightness;
    property CPASHighlighter: TCPASHighlighter read FCPASHighlighter write FCPASHighlighter;
    property CSSVersion: TSynWebCssVersion read FCSSVersion write FCSSVersion;
    property DirShowTreeLines: Boolean read FDirShowTreeLines write FDirShowTreeLines;
    property DirIndent: Integer read FDirIndent write FDirIndent;
    property DirMultiLine: Boolean read FDirMultiLine write FDirMultiLine;
    property DirShowCloseButton: Boolean read FDirShowCloseButton write FDirShowCloseButton;
    property DocMultiLine: Boolean read FDocMultiLine write FDocMultiLine;
    property DocShowCloseButton: Boolean read FDocShowCloseButton write FDocShowCloseButton;
    property EnableLineNumbers: Boolean read FEnableLineNumbers write FEnableLineNumbers;
    property EnableSelectionMode: Boolean read FEnableSelectionMode write FEnableSelectionMode;
    property EnableSpecialChars: Boolean read FEnableSpecialChars write FEnableSpecialChars;
    property EnableWordWrap: Boolean read FEnableWordWrap write FEnableWordWrap;
    property Extensions: string read GetExtensions;
    property ExtraLineSpacing: Integer read FExtraLineSpacing write FExtraLineSpacing;
    property FileTypes: TStrings read FFileTypes write FFileTypes;
    property Filters: string read GetFilters;
    property FontName: string read FFontName write FFontName;
    property FontSize: Integer read FFontSize write FFontSize;
    property GutterFontName: string read FGutterFontName write FGutterFontName;
    property GutterFontSize: Integer read FGutterFontSize write FGutterFontSize;
    property GutterVisible: Boolean read FGutterVisible write FGutterVisible;
    property HTMLErrorChecking: Boolean read FHTMLErrorChecking write FHTMLErrorChecking;
    property HTMLVersion: TSynWebHtmlVersion read FHTMLVersion write FHTMLVersion;
    property IgnoreBlanks: Boolean read FIgnoreBlanks write FIgnoreBlanks;
    property IgnoreCase: Boolean read FIgnoreCase write FIgnoreCase;
    property MainMenuFontName: string read FMainMenuFontName write FMainMenuFontName;
    property MainMenuFontSize: Integer read FMainMenuFontSize write FMainMenuFontSize;
    property MainMenuSystemFontName: string read FMainMenuSystemFontName write FMainMenuSystemFontName;
    property MainMenuSystemFontSize: Integer read FMainMenuSystemFontSize write FMainMenuSystemFontSize;
    property OutputMultiLine: Boolean read FOutputMultiLine write FOutputMultiLine;
    property OutputShowCloseButton: Boolean read FOutputShowCloseButton write FOutputShowCloseButton;
    property PersistentHotKeys: Boolean read FPersistentHotKeys write FPersistentHotKeys;
    property PHPVersion: TSynWebPhpVersion read FPHPVersion write FPHPVersion;
    property RightMargin: Integer read FRightMargin write FRightMargin;
    property ScrollPastEof: Boolean read FScrollPastEof write FScrollPastEof;
    property ScrollPastEol: Boolean read FScrollPastEol write FScrollPastEol;
    property Shadows: Boolean read FShadows write FShadows;
    property ShowXMLTree: Boolean read FShowXMLTree write FShowXMLTree;
    property SQLDialect: TSQLDialect read FSQLDialect write FSQLDialect;
    property TabsToSpaces: Boolean read FTabsToSpaces write FTabsToSpaces;
    property TabWidth: Integer read FTabWidth write FTabWidth;
    property TrimTrailingSpaces: Boolean read FTrimTrailingSpaces write FTrimTrailingSpaces;
    property UseSystemFont: Boolean read FUseSystemFont write FUseSystemFont;
  end;

function OptionsDialog(Sender: TComponent): TOptionsDialog;
function OptionsContainer: TOptionsContainer;

implementation

{$R *.dfm}

uses
  Common, StyleHooks, Language, SynHighlighterMulti, System.IniFiles, SynEditTypes;

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
    TCustomSynEdit(Dest).Gutter.Visible := FGutterVisible;
    TCustomSynEdit(Dest).Gutter.Font.Name := FGutterFontName;
    TCustomSynEdit(Dest).Gutter.Font.Size := FGutterFontSize;
    TCustomSynEdit(Dest).ExtraLineSpacing := FExtraLineSpacing;
    TCustomSynEdit(Dest).RightEdge := FRightMargin;
    TCustomSynEdit(Dest).TabWidth := FTabWidth;
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
    if FTrimTrailingSpaces then
      TCustomSynEdit(Dest).Options := TCustomSynEdit(Dest).Options + [eoTrimTrailingSpaces]
    else
      TCustomSynEdit(Dest).Options := TCustomSynEdit(Dest).Options - [eoTrimTrailingSpaces];


    TCustomSynEdit(Dest).WordWrap := FEnableWordWrap;
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
  end
  else
  if Assigned(Dest) and (Dest is TActionMainMenuBar) then
  begin
    TActionMainMenuBar(Dest).PersistentHotKeys := FPersistentHotKeys;
    TActionMainMenuBar(Dest).Shadows := FShadows;
    TActionMainMenuBar(Dest).UseSystemFont := FUseSystemFont;
    if FUseSystemFont then
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
  if FileType = ftModelica then
    Result := FFileTypes.Strings[29]
  else
  if FileType = ftM3 then
    Result := FFileTypes.Strings[30]
  else
  if FileType = ftMsg then
    Result := FFileTypes.Strings[31]
  else
  if FileType = ftBat then
    Result := FFileTypes.Strings[32]
  else
  if FileType = ftPas then
    Result := FFileTypes.Strings[33]
  else
  if FileType = ftPerl then
    Result := FFileTypes.Strings[34]
  else
  if FileType = ftPHP then
    Result := FFileTypes.Strings[35]
  else
  if FileType = ftProgress then
    Result := FFileTypes.Strings[36]
  else
  if FileType = ftPython then
    Result := FFileTypes.Strings[37]
  else
  if FileType = ftRC then
    Result := FFileTypes.Strings[38]
  else
  if FileType = ftRuby then
    Result := FFileTypes.Strings[39]
  else
  if FileType = ftSDD then
    Result := FFileTypes.Strings[40]
  else
  if FileType = ftSQL then
    Result := FFileTypes.Strings[41]
  else
  if FileType = ftSML then
    Result := FFileTypes.Strings[42]
  else
  if FileType = ftST then
    Result := FFileTypes.Strings[43]
  else
  if FileType = ftTclTk then
    Result := FFileTypes.Strings[44]
  else
  if FileType = ftTeX then
    Result := FFileTypes.Strings[45]
  else
  if FileType = ftText then
    Result := FFileTypes.Strings[46]
  else
  if FileType = ftUNIXShellScript then
    Result := FFileTypes.Strings[47]
  else
  if FileType = ftVB then
    Result := FFileTypes.Strings[48]
  else
  if FileType = ftVBScript then
    Result := FFileTypes.Strings[49]
  else
  if FileType = ftVrml97 then
    Result := FFileTypes.Strings[50]
  else
  if FileType = ftAsm then
    Result := FFileTypes.Strings[51]
  else
  if FileType = ftXML then
    Result := FFileTypes.Strings[52];

  Result := UpperCase(Common.StringBetween(Result, '(', ')'));
end;

constructor TOptionsContainer.Create(AOwner: TComponent);
var
  i: Integer;
begin
  inherited;
  FAutoIndent := True;
  FTrimTrailingSpaces := True;
  FScrollPastEof := False;
  FScrollPastEol := True;
  FTabsToSpaces := True;
  FGutterVisible := True;
  FDocMultiLine := False;
  FDocShowCloseButton := False;
  FDirMultiLine := False;
  FDirShowCloseButton := False;
  FOutputMultiLine := False;
  FOutputShowCloseButton := False;
  FIgnoreCase := True;
  FIgnoreBlanks := True;
  FHTMLErrorChecking := True;
  FFontName := 'Courier New';
  FFontSize := 10;
  FGutterFontName := 'Courier New';
  FGutterFontSize := 8;
  FExtraLineSpacing := 0;
  FRightMargin := 80;
  FTabWidth := 8;
  FHTMLVersion := shvHtml5;
  FPersistentHotKeys := False;
  FShadows := True;
  FUseSystemFont := False;
  FMainMenuFontName := 'Tahoma';
  FMainMenuFontSize := 8;
  FMainMenuSystemFontName := Screen.MenuFont.Name;
  FMainMenuSystemFontSize := Screen.MenuFont.Size;
  FAnimationStyle := asDefault;
  FAnimationDuration := 150;
  FFileTypes := TStringList.Create;

  for i := 0 to 52 do
    FFileTypes.Add(LanguageDataModule.FileTypesMultiStringHolder.MultipleStrings.Items[i].Strings.Text);
end;

destructor TOptionsContainer.Destroy;
begin
  FOptionsContainer := nil;
  inherited;
end;

function TOptionsContainer.GetFilters: string;
var
  i: Integer;
begin
  Result := Format('%s'#0'*.*'#0, [LanguageDataModule.GetConstant('AllFiles')]);
  i := 0;
  while i < FFileTypes.Count do
  begin
    Result := Format('%s%s'#0'%s', [Result, LanguageDataModule.FileTypesMultiStringHolder.MultipleStrings.Items[i].Strings.Text {FFileTypes.Strings[i]}, Common.StringBetween(FFileTypes.Strings[i], '(', ')')]);
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
    Result := Format('%s%s|', [Result, Common.StringBetween(FFileTypes.Strings[i], '(', ')')]);
end;

{ TOptionsDialog }

function OptionsDialog(Sender: TComponent): TOptionsDialog;
begin
  if FOptionsDialog = nil then
    FOptionsDialog := TOptionsDialog.Create(Sender);
  Result := FOptionsDialog;
  StyleHooks.SetStyledFormSize(Result);
end;

procedure TOptionsDialog.FormDestroy(Sender: TObject);
begin
  FEditorOptionsFrame.Destroy;
  FEditorFontFrame.Destroy;
  FEditorGutterFrame.Destroy;
  FEditorTabsFrame.Destroy;
  FEditorErrorCheckingFrame.Destroy;
  FEditorOtherFrame.Destroy;
  FFileTypesFrame.Destroy;
  FOptionsCompareFrame.Destroy;
  FMainMenuFrame.Destroy;
  FDirectoryOptionsFrame.Destroy;
  FDirectoryTabsFrame.Destroy;
  FOutputTabsFrame.Destroy;

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
    { Gutter }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.ImageIndex := EditorGutterAction.ImageIndex;
    Data.Caption := EditorGutterAction.Caption;
    { Tabs }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.ImageIndex := EditorTabsAction.ImageIndex;
    Data.Caption := EditorTabsAction.Caption;
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
    Node.ChildCount := 5;
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
    { Main menu }
    Node := AddChild(nil);
    Data := GetNodeData(Node);
    Data.ImageIndex := MainMenuAction.ImageIndex;
    Data.Caption := MainMenuAction.Caption;
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

  if EditOptions = nil then
  begin
    Result:= False;
    Exit;
  end;
  SelectedLanguage := Common.GetSelectedLanguage;
  Common.UpdateLanguage(FEditorOptionsFrame, SelectedLanguage);
  Common.UpdateLanguage(FEditorFontFrame, SelectedLanguage);
  Common.UpdateLanguage(FEditorGutterFrame, SelectedLanguage);
  Common.UpdateLanguage(FEditorTabsFrame, SelectedLanguage);
  Common.UpdateLanguage(FEditorErrorCheckingFrame, SelectedLanguage);
  Common.UpdateLanguage(FEditorOtherFrame, SelectedLanguage);
  Common.UpdateLanguage(FFileTypesFrame, SelectedLanguage);
  Common.UpdateLanguage(FOptionsCompareFrame, SelectedLanguage);
  Common.UpdateLanguage(FMainMenuFrame, SelectedLanguage);
  Common.UpdateLanguage(FDirectoryOptionsFrame, SelectedLanguage);
  Common.UpdateLanguage(FDirectoryTabsFrame, SelectedLanguage);
  Common.UpdateLanguage(FOutputTabsFrame, SelectedLanguage);

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
  FEditorOptionsFrame.TrimTrailingSpacesCheckBox.Checked := FOptionsContainer.TrimTrailingSpaces;
  FEditorOptionsFrame.ScrollPastEofCheckBox.Checked := FOptionsContainer.ScrollPastEof;
  FEditorOptionsFrame.ScrollPastEolCheckBox.Checked := FOptionsContainer.ScrollPastEol;
  FEditorOptionsFrame.TabsToSpacesCheckBox.Checked := FOptionsContainer.TabsToSpaces;
  FEditorOptionsFrame.ExtraLinesEdit.Text := IntToStr(FOptionsContainer.ExtraLineSpacing);
  FEditorOptionsFrame.TabWidthEdit.Text := IntToStr(FOptionsContainer.TabWidth);
  FEditorOptionsFrame.BrightnessTrackBar.Position := FOptionsContainer.ColorBrightness;
  { Font }
  FEditorFontFrame.FontLabel.Font.Name := FOptionsContainer.FontName;
  FEditorFontFrame.FontLabel.Font.Size := FOptionsContainer.FontSize;
  FEditorFontFrame.FontLabel.Caption := Format('%s %dpt', [FEditorFontFrame.FontLabel.Font.Name, FEditorFontFrame.FontLabel.Font.Size]);
  { Gutter }
  FEditorGutterFrame.GutterVisibleCheckBox.Checked := FOptionsContainer.GutterVisible;
  FEditorGutterFrame.RightMarginEdit.Text := IntToStr(FOptionsContainer.RightMargin);
  FEditorGutterFrame.FontLabel.Font.Name := FOptionsContainer.GutterFontName;
  FEditorGutterFrame.FontLabel.Font.Size := FOptionsContainer.GutterFontSize;
  FEditorGutterFrame.FontLabel.Caption := Format('%s %dpt', [FEditorGutterFrame.FontLabel.Font.Name, FEditorGutterFrame.FontLabel.Font.Size]);
  { Document tabs }
  FEditorTabsFrame.MultiLineCheckBox.Checked := FOptionsContainer.DocMultiLine;
  FEditorTabsFrame.ShowCloseButtonCheckBox.Checked := FOptionsContainer.DocShowCloseButton;
  { Directory }
  FDirectoryOptionsFrame.ShowTreeLinesCheckBox.Checked := FOptionsContainer.DirShowTreeLines;
  FDirectoryOptionsFrame.IndentEdit.Text := IntToStr(FOptionsContainer.DirIndent);
  { Directory tabs }
  FDirectoryTabsFrame.MultiLineCheckBox.Checked := FOptionsContainer.DirMultiLine;
  FDirectoryTabsFrame.ShowCloseButtonCheckBox.Checked := FOptionsContainer.DirShowCloseButton;
  { Output tabs }
  FOutputTabsFrame.MultiLineCheckBox.Checked := FOptionsContainer.OutputMultiLine;
  FOutputTabsFrame.ShowCloseButtonCheckBox.Checked := FOptionsContainer.OutputShowCloseButton;
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
      FileType, Common.StringBetween(FOptionsContainer.FileTypes.Strings[i], '(', ')')]));
  end;
  FFileTypesFrame.FileTypesListBox.ItemIndex := 0;
  FFileTypesFrame.FileTypesListBoxClick(nil);
  { Other }
  FEditorOtherFrame.SQLDialectComboBox.ItemIndex := Ord(FOptionsContainer.SQLDialect);
  FEditorOtherFrame.CPASHighlighterComboBox.ItemIndex := Ord(FOptionsContainer.CPASHighlighter);
  FEditorOtherFrame.CSSVersionComboBox.ItemIndex := Ord(FOptionsContainer.CSSVersion);
  FEditorOtherFrame.PHPVersionComboBox.ItemIndex := Ord(FOptionsContainer.PHPVersion);
  { Main menu }
  FMainMenuFrame.PersistentHotKeysCheckBox.Checked := FOptionsContainer.PersistentHotKeys;
  FMainMenuFrame.ShadowsCheckBox.Checked := FOptionsContainer.Shadows;
  FMainMenuFrame.UseSystemFontCheckBox.Checked := FOptionsContainer.UseSystemFont;
  FMainMenuFrame.FontLabel.Font.Name := FOptionsContainer.MainMenuFontName;
  FMainMenuFrame.FontLabel.Font.Size := FOptionsContainer.MainMenuFontSize;
  FMainMenuFrame.FontLabel.Caption := Format('%s %dpt', [FMainMenuFrame.FontLabel.Font.Name, FMainMenuFrame.FontLabel.Font.Size]);
  FMainMenuFrame.AnimationStyleComboBox.ItemIndex := Ord(FOptionsContainer.AnimationStyle);
  FMainMenuFrame.AnimationDurationEdit.Text := IntToStr(FOptionsContainer.AnimationDuration);
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
      StyleHooks.UpdateGutterAndColors(FEditorFontFrame.SynEdit);
    end;
    FEditorGutterFrame.Visible := (ParentIndex = 0) and (Level = 1) and (TreeNode.Index = 1);
    FEditorTabsFrame.Visible := (ParentIndex = 0) and (Level = 1) and (TreeNode.Index = 2);
    FEditorErrorCheckingFrame.Visible := (ParentIndex = 0) and (Level = 1) and (TreeNode.Index = 3);
    FEditorOtherFrame.Visible := (ParentIndex = 0) and (Level = 1) and (TreeNode.Index = 4);
    FDirectoryOptionsFrame.Visible := (Level = 0) and (TreeNode.Index = 1);
    FDirectoryTabsFrame.Visible := (ParentIndex = 1) and (Level = 1) and (TreeNode.Index = 0);
    FOutputTabsFrame.Visible := (ParentIndex = 2) and (Level = 1) and (TreeNode.Index = 0);

    FOptionsCompareFrame.Visible := (Level = 0) and (TreeNode.Index = 3);
    FMainMenuFrame.Visible := (Level = 0) and (TreeNode.Index = 4);
    FFileTypesFrame.Visible := (Level = 0) and (TreeNode.Index = 5);

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

procedure TOptionsDialog.PutData;
var
  i: Integer;
  FileType: string;
begin
  { Options }
  FOptionsContainer.AutoIndent := FEditorOptionsFrame.AutoIndentCheckBox.Checked;
  FOptionsContainer.TrimTrailingSpaces := FEditorOptionsFrame.TrimTrailingSpacesCheckBox.Checked;
  FOptionsContainer.ScrollPastEof := FEditorOptionsFrame.ScrollPastEofCheckBox.Checked;
  FOptionsContainer.ScrollPastEol := FEditorOptionsFrame.ScrollPastEolCheckBox.Checked;
  FOptionsContainer.TabsToSpaces := FEditorOptionsFrame.TabsToSpacesCheckBox.Checked;
  FOptionsContainer.ExtraLineSpacing := StrToIntDef(FEditorOptionsFrame.ExtraLinesEdit.Text, 0);
  FOptionsContainer.TabWidth := StrToIntDef(FEditorOptionsFrame.TabWidthEdit.Text, 8);
  FOptionsContainer.ColorBrightness := FEditorOptionsFrame.BrightnessTrackBar.Position;
  { Font }
  FOptionsContainer.FontName := FEditorFontFrame.FontLabel.Font.Name;
  FOptionsContainer.FontSize := FEditorFontFrame.FontLabel.Font.Size;
  { Gutter }
  FOptionsContainer.GutterVisible := FEditorGutterFrame.GutterVisibleCheckBox.Checked;
  FOptionsContainer.RightMargin := StrToIntDef(FEditorGutterFrame.RightMarginEdit.Text, 80);
  FOptionsContainer.GutterFontName := FEditorGutterFrame.FontLabel.Font.Name;
  FOptionsContainer.GutterFontSize := FEditorGutterFrame.FontLabel.Font.Size;
  { Document tabs }
  FOptionsContainer.DocMultiLine := FEditorTabsFrame.MultiLineCheckBox.Checked;
  FOptionsContainer.DocShowCloseButton := FEditorTabsFrame.ShowCloseButtonCheckBox.Checked;
  { Directory }
  FOptionsContainer.DirShowTreeLines := FDirectoryOptionsFrame.ShowTreeLinesCheckBox.Checked;
  FOptionsContainer.DirIndent := StrToIntDef(FDirectoryOptionsFrame.IndentEdit.Text, 20);
  { Directory tabs }
  FOptionsContainer.DirMultiLine := FDirectoryTabsFrame.MultiLineCheckBox.Checked;
  FOptionsContainer.DirShowCloseButton := FDirectoryTabsFrame.ShowCloseButtonCheckBox.Checked;
  { Output tabs }
  FOptionsContainer.OutputMultiLine := FOutputTabsFrame.MultiLineCheckBox.Checked;
  FOptionsContainer.OutputShowCloseButton := FOutputTabsFrame.ShowCloseButtonCheckBox.Checked;
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
      FileType, Common.StringBetween(FFileTypesFrame.FileTypesListBox.Items.Strings[i], '(', ')')]));
  end;
  { Other }
  FOptionsContainer.SQLDialect := TSQLDialect(FEditorOtherFrame.SQLDialectComboBox.ItemIndex);
  FOptionsContainer.CPASHighlighter := TCPASHighlighter(FEditorOtherFrame.CPASHighlighterComboBox.ItemIndex);
  FOptionsContainer.CSSVersion := TSynWebCssVersion(FEditorOtherFrame.CSSVersionComboBox.ItemIndex);
  FOptionsContainer.PHPVersion := TSynWebPhpVersion(FEditorOtherFrame.PHPVersionComboBox.ItemIndex);
  { Main menu }
  FOptionsContainer.PersistentHotKeys := FMainMenuFrame.PersistentHotKeysCheckBox.Checked;
  FOptionsContainer.Shadows := FMainMenuFrame.ShadowsCheckBox.Checked;
  FOptionsContainer.UseSystemFont := FMainMenuFrame.UseSystemFontCheckBox.Checked;
  FOptionsContainer.MainMenuFontName := FMainMenuFrame.FontLabel.Font.Name;
  FOptionsContainer.MainMenuFontSize := FMainMenuFrame.FontLabel.Font.Size;
  FOptionsContainer.AnimationStyle := TAnimationStyle(FMainMenuFrame.AnimationStyleComboBox.ItemIndex);
  FOptionsContainer.AnimationDuration := StrToIntDef(FMainMenuFrame.AnimationDurationEdit.Text, 150);
end;

procedure TOptionsDialog.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  WriteIniFile;
end;

procedure TOptionsDialog.ReadIniFile;
begin
  with TMemIniFile.Create(Common.GetINIFilename) do
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
  with TMemIniFile.Create(Common.GetINIFilename) do
  try
    { Position }
    WriteInteger('OptionsPosition', 'Left', Left);
    WriteInteger('OptionsPosition', 'Top', Top);
    { Size }
    WriteInteger('OptionsSize', 'Width', Width);
    WriteInteger('OptionsSize', 'Height', Height);
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
  FEditorOptionsFrame := TEditorOptionsFrame.Create(OptionsPanel);
  FEditorOptionsFrame.Parent := OptionsPanel;
  FEditorFontFrame := TEditorFontFrame.Create(OptionsPanel);
  FEditorFontFrame.Parent := OptionsPanel;
  FEditorGutterFrame := TEditorGutterFrame.Create(OptionsPanel);
  FEditorGutterFrame.Parent := OptionsPanel;
  FEditorTabsFrame := TEditorTabsFrame.Create(OptionsPanel);
  FEditorTabsFrame.Parent := OptionsPanel;
  FEditorErrorCheckingFrame := TEditorErrorCheckingFrame.Create(OptionsPanel);
  FEditorErrorCheckingFrame.Parent := OptionsPanel;
  FEditorOtherFrame := TEditorOtherFrame.Create(OptionsPanel);
  FEditorOtherFrame.Parent := OptionsPanel;
  FFileTypesFrame := TFileTypesFrame.Create(OptionsPanel);
  FFileTypesFrame.Parent := OptionsPanel;
  FOptionsCompareFrame := TOptionsCompareFrame.Create(OptionsPanel);
  FOptionsCompareFrame.Parent := OptionsPanel;
  FMainMenuFrame := TMainMenuFrame.Create(OptionsPanel);
  FMainMenuFrame.Parent := OptionsPanel;
  FOutputTabsFrame := TOutputTabsFrame.Create(OptionsPanel);
  FOutputTabsFrame.Parent := OptionsPanel;
  FDirectoryOptionsFrame := TDirectoryOptionsFrame.Create(OptionsPanel);
  FDirectoryOptionsFrame.Parent := OptionsPanel;
  FDirectoryTabsFrame := TDirectoryTabsFrame.Create(OptionsPanel);
  FDirectoryTabsFrame.Parent := OptionsPanel;
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
