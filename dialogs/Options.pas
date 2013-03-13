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
  OptionsEditorErrorChecking, OptionsEditorOther, OptionsFileTypes, OptionsCompare, OptionsMenu;

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
    OKButton: TButton;
    TopPanel: TPanel;
    OptionsVirtualStringTree: TVirtualStringTree;
    EditorAction: TAction;
    ImageList: TImageList;
    CompareAction: TAction;
    FileTypesAction: TAction;
    MenuAction: TAction;
    EditorFontAction: TAction;
    EditorGutterAction: TAction;
    EditorTabsAction: TAction;
    EditorErrorCheckingAction: TAction;
    EditorOthersAction: TAction;
    Splitter1: TSplitter;
    OptionsPanel: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure OptionsVirtualStringTreeGetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
    procedure OptionsVirtualStringTreeFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure OptionsVirtualStringTreeInitNode(Sender: TBaseVirtualTree; ParentNode,
      Node: PVirtualNode; var InitialStates: TVirtualNodeInitStates);
    procedure OptionsVirtualStringTreeGetImageIndex(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Kind: TVTImageKind; Column: TColumnIndex; var Ghosted: Boolean; var ImageIndex: Integer);
    procedure OptionsVirtualStringTreeClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FOptionsContainer: TOptionsContainer;
    FEditorOptionsFrame: TEditorOptionsFrame;
    FEditorFontFrame: TEditorFontFrame;
    FEditorGutterFrame: TEditorGutterFrame;
    FEditorTabsFrame: TEditorTabsFrame;
    FEditorErrorCheckingFrame: TEditorErrorCheckingFrame;
    FEditorOtherFrame: TEditorOtherFrame;
    FFileTypesFrame: TFileTypesFrame;
    FMenuFrame: TMenuFrame;
    FOptionsCompareFrame: TOptionsCompareFrame;
    procedure GetData;
    procedure PutData;
    procedure ReadIniFile;
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
    FExtraLineSpacing: Integer;
    FTabWidth: Integer;
    FRightEdge: Integer;
    FFontName: string;
    FFontSize: Integer;
    FColorBrightness: Integer;
    FGutterVisible: Boolean;
    FGutterLineNumbers: Boolean;
    FMultiLine: Boolean;
    FShowCloseButton: Boolean;
    FHTMLVersion: TSynWebHtmlVersion;
    FFileTypes: TStrings;
    FHTMLErrorChecking: Boolean;
    FSQLDialect: TSQLDialect;
    FCPASHighlighter: TCPASHighlighter;
    FAutoIndent: Boolean;
    FTrimTrailingSpaces: Boolean;
    FScrollPastEof: Boolean;
    FScrollPastEol: Boolean;
    FIgnoreCase: Boolean;
    FIgnoreBlanks: Boolean;
    function GetFilters: string;
    function GetExtensions: string;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure AssignTo(Dest: TPersistent); override;
    function FileType(FileType: TFileType): string;
  published
    property FontName: string read FFontName write FFontName;
    property FontSize: Integer read FFontSize write FFontSize;
    property ColorBrightness: Integer read FColorBrightness write FColorBrightness;
    property AutoIndent: Boolean read FAutoIndent write FAutoIndent;
    property TrimTrailingSpaces: Boolean read FTrimTrailingSpaces write FTrimTrailingSpaces;
    property ScrollPastEof: Boolean read FScrollPastEof write FScrollPastEof;
    property ScrollPastEol: Boolean read FScrollPastEol write FScrollPastEol;
    property ExtraLineSpacing: Integer read FExtraLineSpacing write FExtraLineSpacing;
    property GutterVisible: Boolean read FGutterVisible write FGutterVisible;
    property GutterLineNumbers: Boolean read FGutterVisible write FGutterLineNumbers;
    property MultiLine: Boolean read FMultiLine write FMultiLine;
    property ShowCloseButton: Boolean read FShowCloseButton write FShowCloseButton;
    property IgnoreCase: Boolean read FIgnoreCase write FIgnoreCase;
    property IgnoreBlanks: Boolean read FIgnoreBlanks write FIgnoreBlanks;
    property RightEdge: Integer read FRightEdge write FRightEdge;
    property TabWidth: Integer read FTabWidth write FTabWidth;
    property HTMLVersion: TSynWebHtmlVersion read FHTMLVersion write FHTMLVersion;
    property FileTypes: TStrings read FFileTypes write FFileTypes;
    property Filters: string read GetFilters;
    property Extensions: string read GetExtensions;
    property HTMLErrorChecking: Boolean read FHTMLErrorChecking write FHTMLErrorChecking;
    property SQLDialect: TSQLDialect read FSQLDialect write FSQLDialect;
    property CPASHighlighter: TCPASHighlighter read FCPASHighlighter write FCPASHighlighter;
  end;

function OptionsDialog(Sender: TComponent): TOptionsDialog;
function OptionsContainer: TOptionsContainer;

implementation

{$R *.dfm}

uses
  Common, StyleHooks, Language, SynHighlighterMulti, System.IniFiles;

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
    TCustomSynEdit(Dest).Gutter.ShowLineNumbers := FGutterLineNumbers;
    TCustomSynEdit(Dest).ExtraLineSpacing := FExtraLineSpacing;
    TCustomSynEdit(Dest).RightEdge := FRightEdge;
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
    if FTrimTrailingSpaces then
      TCustomSynEdit(Dest).Options := TCustomSynEdit(Dest).Options + [eoTrimTrailingSpaces]
    else
      TCustomSynEdit(Dest).Options := TCustomSynEdit(Dest).Options - [eoTrimTrailingSpaces];
    if TCustomSynEdit(Dest).Highlighter is TSynWebHtmlSyn then
      TSynWebHtmlSyn(TCustomSynEdit(Dest).Highlighter).Engine.Options.HtmlVersion := FHTMLVersion;
    if TCustomSynEdit(Dest).Highlighter is TSynSQLSyn then
      TSynSQLSyn(TCustomSynEdit(Dest).Highlighter).SQLDialect := FSQLDialect;
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
  FGutterVisible := True;
  FGutterLineNumbers := True;
  FMultiLine := False;
  FShowCloseButton := False;
  FIgnoreCase := True;
  FIgnoreBlanks := True;
  FHTMLErrorChecking := True;
  FFontName := 'Courier New';
  FFontSize := 10;
  FExtraLineSpacing := 0;
  FRightEdge := 80;
  FTabWidth := 8;
  FHTMLVersion := shvHtml5;
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
  FMenuFrame.Destroy;

  FOptionsDialog := nil;
end;

function TOptionsDialog.Execute(EditOptions: TOptionsContainer): Boolean;
begin
  ReadIniFile;

  if EditOptions = nil then
  begin
    Result:= False;
    Exit;
  end;

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
  FEditorOptionsFrame.ExtraLinesEdit.Text := IntToStr(FOptionsContainer.ExtraLineSpacing);
  FEditorOptionsFrame.TabWidthEdit.Text := IntToStr(FOptionsContainer.TabWidth);
  FEditorOptionsFrame.BrightnessTrackBar.Position := FOptionsContainer.ColorBrightness;
  { Font }
  FEditorFontFrame.FontLabel.Font.Name := FOptionsContainer.FontName;
  FEditorFontFrame.FontLabel.Font.Size := FOptionsContainer.FontSize;
  FEditorFontFrame.FontLabel.Caption := Format('%s %dpt', [FEditorFontFrame.FontLabel.Font.Name, FEditorFontFrame.FontLabel.Font.Size]);
  { Gutter }
  FEditorGutterFrame.GutterVisibleCheckBox.Checked := FOptionsContainer.GutterVisible;
  FEditorGutterFrame.LineNumbersCheckBox.Checked := FOptionsContainer.GutterLineNumbers;
  FEditorGutterFrame.EdgeColumnEdit.Text := IntToStr(FOptionsContainer.RightEdge);
  { Tabs }
  FEditorTabsFrame.MultiLineCheckBox.Checked := FOptionsContainer.MultiLine;
  FEditorTabsFrame.ShowCloseButtonCheckBox.Checked := FOptionsContainer.ShowCloseButton;
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
end;

procedure TOptionsDialog.OptionsVirtualStringTreeClick(Sender: TObject);
var
  i, Level: Integer;
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
    FEditorOptionsFrame.Visible := (Level = 0) and (TreeNode.Index = 0);
    FEditorFontFrame.Visible := (Level = 1) and (TreeNode.Index = 0);
    if FEditorFontFrame.Visible then
    begin
      FOptionsContainer.AssignTo(FEditorFontFrame.SynEdit);
      StyleHooks.UpdateGutterAndColors(FEditorFontFrame.SynEdit);
    end;
    FEditorGutterFrame.Visible := (Level = 1) and (TreeNode.Index = 1);
    FEditorTabsFrame.Visible := (Level = 1) and (TreeNode.Index = 2);
    FEditorErrorCheckingFrame.Visible := (Level = 1) and (TreeNode.Index = 3);
    FEditorOtherFrame.Visible := (Level = 1) and (TreeNode.Index = 4);
    FOptionsCompareFrame.Visible := (Level = 0) and (TreeNode.Index = 1);
    FMenuFrame.Visible := (Level = 0) and (TreeNode.Index = 2);
    FFileTypesFrame.Visible := (Level = 0) and (TreeNode.Index = 3);

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

procedure TOptionsDialog.OptionsVirtualStringTreeInitNode(Sender: TBaseVirtualTree; ParentNode,
  Node: PVirtualNode; var InitialStates: TVirtualNodeInitStates);
var
  Data: POptionsRec;
  ChildNode: PVirtualNode;
begin
  with Sender do
  begin
    Data := GetNodeData(Node);
    if GetNodeLevel(Node) = 0 then
    case Node.Index of
      0:
      begin
        Data.ImageIndex := EditorAction.ImageIndex;
        Data.Caption := EditorAction.Caption;
        { Font }
        ChildNode := OptionsVirtualStringTree.AddChild(Node);
        Data := GetNodeData(ChildNode);
        Data.ImageIndex := EditorFontAction.ImageIndex;
        Data.Caption := EditorFontAction.Caption;
        { Gutter }
        ChildNode := OptionsVirtualStringTree.AddChild(Node);
        Data := GetNodeData(ChildNode);
        Data.ImageIndex := EditorGutterAction.ImageIndex;
        Data.Caption := EditorGutterAction.Caption;
        { Tabs }
        ChildNode := OptionsVirtualStringTree.AddChild(Node);
        Data := GetNodeData(ChildNode);
        Data.ImageIndex := EditorTabsAction.ImageIndex;
        Data.Caption := EditorTabsAction.Caption;
        { Error checking }
        ChildNode := OptionsVirtualStringTree.AddChild(Node);
        Data := GetNodeData(ChildNode);
        Data.ImageIndex := EditorErrorCheckingAction.ImageIndex;
        Data.Caption := EditorErrorCheckingAction.Caption;
        { Other }
        ChildNode := OptionsVirtualStringTree.AddChild(Node);
        Data := GetNodeData(ChildNode);
        Data.ImageIndex := EditorOthersAction.ImageIndex;
        Data.Caption := EditorOthersAction.Caption;
        Node.ChildCount := 5;
        OptionsVirtualStringTree.Selected[Node] := True;
        OptionsVirtualStringTree.Expanded[Node] := True;
      end;
      1:
      begin
        Data.ImageIndex := CompareAction.ImageIndex;
        Data.Caption := CompareAction.Caption;
      end;
      2:
      begin
        Data.ImageIndex := MenuAction.ImageIndex;
        Data.Caption := MenuAction.Caption;
      end;
      3:
      begin
        Data.ImageIndex := FileTypesAction.ImageIndex;
        Data.Caption := FileTypesAction.Caption;
      end;
    end;
  end;
end;

procedure TOptionsDialog.PutData;
var
  i: Integer;
  FileType: string;
  vOptions: TSynEditorOptions;

  procedure SetFlag(aOption: TSynEditorOption; aValue: Boolean);
  begin
    if aValue then
      Include(vOptions, aOption)
    else
      Exclude(vOptions, aOption);
  end;

begin
  { Options }
  FOptionsContainer.AutoIndent := FEditorOptionsFrame.AutoIndentCheckBox.Checked;
  FOptionsContainer.TrimTrailingSpaces := FEditorOptionsFrame.TrimTrailingSpacesCheckBox.Checked;
  FOptionsContainer.ScrollPastEof := FEditorOptionsFrame.ScrollPastEofCheckBox.Checked;
  FOptionsContainer.ScrollPastEol := FEditorOptionsFrame.ScrollPastEolCheckBox.Checked;
  FOptionsContainer.ExtraLineSpacing := StrToIntDef(FEditorOptionsFrame.ExtraLinesEdit.Text, 0);
  FOptionsContainer.TabWidth := StrToIntDef(FEditorOptionsFrame.TabWidthEdit.Text, 8);
  FOptionsContainer.ColorBrightness := FEditorOptionsFrame.BrightnessTrackBar.Position;
  { Font }
  FOptionsContainer.FontName := FEditorFontFrame.FontLabel.Font.Name;
  FOptionsContainer.FontSize := FEditorFontFrame.FontLabel.Font.Size;
  { Gutter }
  FOptionsContainer.GutterVisible := FEditorGutterFrame.GutterVisibleCheckBox.Checked;
  FOptionsContainer.GutterLineNumbers := FEditorGutterFrame.LineNumbersCheckBox.Checked;
  FOptionsContainer.RightEdge := StrToIntDef(FEditorGutterFrame.EdgeColumnEdit.Text, 80);
  { Tabs }
  FOptionsContainer.MultiLine := FEditorTabsFrame.MultiLineCheckBox.Checked;
  FOptionsContainer.ShowCloseButton := FEditorTabsFrame.ShowCloseButtonCheckBox.Checked;
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
  FOptionsContainer.FSQLDialect := TSQLDialect(FEditorOtherFrame.SQLDialectComboBox.ItemIndex);
  FOptionsContainer.FCPASHighlighter := TCPASHighlighter(FEditorOtherFrame.CPASHighlighterComboBox.ItemIndex);
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
  FMenuFrame := TMenuFrame.Create(OptionsPanel);
  FMenuFrame.Parent := OptionsPanel;
end;

end.
