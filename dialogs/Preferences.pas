unit Preferences;

interface

uses
  Winapi.Windows, Winapi.Messages, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.ComCtrls, Winapi.CommCtrl, System.Win.Registry, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.Menus, SynEdit, SynEditHighlighter, SynEditMiscClasses, SynHighlighterWebData, SynEditKeyCmds,
  System.Classes, System.SysUtils, Vcl.ImgList, SynHighlighterWeb, Vcl.Grids, SynHighlighterSQL,
  BCCheckBox, Document, JvExStdCtrls, JvEdit, BCEdit, JvCombobox, BCComboBox, Vcl.ActnList,
  Vcl.Themes, Dlg;

type
  TCPASHighlighter = (hClassic, hDefault, hTwilight);

const
  TSQLDialectStr: array[Low(TSQLDialect)..High(TSQLDialect)] of String =
    ('Standard', 'Interbase 6', 'MSSQL 7', 'MySQL', 'Oracle', 'Sybase', 'Ingres', 'MSSQL 2K', 'Postgres', 'Nexus');
  TCPASHighlighterStr: array[Low(TCPASHighlighter)..High(TCPASHighlighter)] of String =
    ('Classic', 'Default', 'Twilight');

type
  TOptionsContainer = class;

  TPreferencesDialog = class(TDialog)
    FontDialog: TFontDialog;
    ActionList: TActionList;
    SelectFontAction: TAction;
    Panel1: TPanel;
    PageControl: TPageControl;
    TabSheet1: TTabSheet;
    EditorFontGroupBox: TGroupBox;
    SpeedButton1: TSpeedButton;
    Panel3: TPanel;
    FontLabel: TLabel;
    LineSpacingGroupBox: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    ExtraLinesEdit: TBCEdit;
    TabWidthEdit: TBCEdit;
    RightEdgeGroupBox: TGroupBox;
    Label10: TLabel;
    EdgeColumnEdit: TBCEdit;
    TabsGroupBox: TGroupBox;
    MultilineCheckBox: TBCCheckBox;
    GutterGroupBox: TGroupBox;
    LineNumbersCheckBox: TBCCheckBox;
    GutterVisibleCheckBox: TBCCheckBox;
    HTMLVersionGroupBox: TGroupBox;
    HTMLVersionLabel: TLabel;
    HTMLVersionComboBox: TBCComboBox;
    HTMLErrorCheckingCheckBox: TBCCheckBox;
    SQLDialectGroupBox: TGroupBox;
    SQLDialectComboBox: TBCComboBox;
    CPASHighlighterGroupBox: TGroupBox;
    CPASHighlighterComboBox: TBCComboBox;
    FileTypesTabSheet: TTabSheet;
    Label1: TLabel;
    ExtensionsEdit: TBCEdit;
    FileTypesListBox: TListBox;
    Panel2: TPanel;
    btnOk: TButton;
    btnCancel: TButton;
    Panel4: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FileTypesListBoxClick(Sender: TObject);
    procedure ExtensionsEditChange(Sender: TObject);
    procedure HTMLErrorCheckingCheckBoxClick(Sender: TObject);
    procedure SelectFontActionExecute(Sender: TObject);
  private
    FOptionsContainer: TOptionsContainer;
    InChanging: Boolean;
    procedure GetData;
    procedure PutData;
  public
    function Execute(EditOptions: TOptionsContainer) : Boolean;
  end;

  TFileTypes = (ftHC11, ftAWK, ftBaan, ftCS, ftCPP, ftCAC, ftCache, ftCss, ftCobol, ftIdl,
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
    FGutterVisible: Boolean;
    FGutterLineNumbers: Boolean;
    FMultiLine: Boolean;
    FHTMLVersion: TSynWebHtmlVersion;
    FFileTypes: TStrings;
    FHTMLErrorChecking: Boolean;
    FSQLDialect: TSQLDialect;
    FCPASHighlighter: TCPASHighlighter;
    function GetFilters: string;
    function GetExtensions: string;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    //procedure Assign(Source: TPersistent); override;
    procedure AssignTo(Dest: TPersistent); override;
    function FileType(FileType: TFileTypes): string;
  published
    property FontName: string read FFontName write FFontName;
    property FontSize: Integer read FFontSize write FFontSize;
    property ExtraLineSpacing: Integer read FExtraLineSpacing write FExtraLineSpacing;
    property GutterVisible: Boolean read FGutterVisible write FGutterVisible;
    property GutterLineNumbers: Boolean read FGutterVisible write FGutterLineNumbers;
    property MultiLine: Boolean read FMultiLine write FMultiLine;
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

function PreferencesDialog(Sender: TComponent): TPreferencesDialog;
function OptionsContainer: TOptionsContainer;

implementation

{$R *.dfm}

uses
  Common, Lib;

{ TOptionsContainer }

var
  FOptionsContainer: TOptionsContainer;
  FPreferencesDialog: TPreferencesDialog;

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
    if TCustomSynEdit(Dest).Highlighter is TSynWebHtmlSyn then
      TSynWebHtmlSyn(TCustomSynEdit(Dest).Highlighter).Engine.Options.HtmlVersion := FHTMLVersion;
    if TCustomSynEdit(Dest).Highlighter is TSynSQLSyn then
      TSynSQLSyn(TCustomSynEdit(Dest).Highlighter).SQLDialect := FSQLDialect;
  end
    else
    inherited;
end;

function TOptionsContainer.FileType(FileType: TFileTypes): string;
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
begin
  inherited;
  FGutterVisible := True;
  FGutterLineNumbers := True;
  FMultiLine := False;
  FHTMLErrorChecking := True;
  FFontName := 'Courier New';
  FFontSize := 10;
  FExtraLineSpacing := 0;
  FRightEdge := 80;
  FTabWidth := 8;
  FHTMLVersion := shvHtml5;
  FFileTypes := TStringList.Create;

  FFileTypes.Add('68HC11 Assembler Files (*.hc11;*.asc)');
  FFileTypes.Add('AWK Scripts (*.awk)');
  FFileTypes.Add('Baan 4GL Files (*.cln)');
  FFileTypes.Add('C# Files (*.cs)');
  FFileTypes.Add('C/C++ Files (*.c;*.cpp;*.h;*.hpp)');
  FFileTypes.Add('CA-Clipper Files (*.prg;*.ch;*.inc)');
  FFileTypes.Add('Cache Files (*.mac;*.inc;*.int)');
  FFileTypes.Add('Cascading Stylesheets (*.css)');
  FFileTypes.Add('COBOL Files (*.cbl;*.cob)');
  FFileTypes.Add('CORBA IDL Files (*.idl)');
  FFileTypes.Add('CPM Reports (*.rdf;*.rif;*.rmf;*.rxf)');
  FFileTypes.Add('DOT Graph Drawing Description (*.dot)');
  FFileTypes.Add('DSP Files (*.dsp;*.inc)');
  FFileTypes.Add('DWScript Files (*.dws;*.pas;*.inc)');
  FFileTypes.Add('Eiffel (*.e;*.ace)');
  FFileTypes.Add('Fortran Files (*.for)');
  FFileTypes.Add('Foxpro Files (*.prg)');
  FFileTypes.Add('Galaxy Files (*.gtv;*.galrep)');
  FFileTypes.Add('GEMBASE Files (*.dml;*.gem)');
  FFileTypes.Add('GW-TEL Scripts (*.gws)');
  FFileTypes.Add('Haskell Files (*.hs;*.lhs)');
  FFileTypes.Add('HP48 Files (*.s;*.sou;*.a;*.hp)');
  FFileTypes.Add('HTML Files (*.html;*.htm)');
  FFileTypes.Add('INI Files (*.ini)');
  FFileTypes.Add('Inno Setup Scripts (*.iss)');
  FFileTypes.Add('Java Files (*.java)');
  FFileTypes.Add('Javascript Files (*.js)');
  FFileTypes.Add('KiXtart Scripts (*.kix)');
  FFileTypes.Add('LEGO LDraw Files (*.ldr)');
  FFileTypes.Add('Modelica Files (*.mo)');
  FFileTypes.Add('Modula-3 Files (*.m3)');
  FFileTypes.Add('Msg Files (*.msg)');
  FFileTypes.Add('MS-DOS Batch Files (*.bat;*.cmd)');
  FFileTypes.Add('Pascal Files (*.pas;*.dfm;*.dpr;*.dproj)');
  FFileTypes.Add('Perl Files (*.pl;*.pm;*.cgi)');
  FFileTypes.Add('PHP Files (*.php;*.class;*.inc)');
  FFileTypes.Add('Progress Files (*.w;*.p;*.i)');
  FFileTypes.Add('Python Files (*.py)');
  FFileTypes.Add('Resource Files (*.rc)');
  FFileTypes.Add('Ruby Files (*.rb;*.rbw)');
  FFileTypes.Add('Semanta DD Files (*.sdd)');
  FFileTypes.Add('SQL Files (*.sql)');
  FFileTypes.Add('Standard ML Files (*.sml)');
  FFileTypes.Add('Structured Text Files (*.st)');
  FFileTypes.Add('Tcl/Tk Files (*.tcl)');
  FFileTypes.Add('TeX Files (*.tex)');
  FFileTypes.Add('Text Files (*.txt)');
  FFileTypes.Add('UNIX Shell Scripts (*.sh)');
  FFileTypes.Add('Visual Basic Files (*.vb;*.bas)');
  FFileTypes.Add('VBScript Files (*.vbs)');
  FFileTypes.Add('Vrml97/X3D World (*.wrl;*.wrml;*.vrl;*.vrml;*.x3d)');
  FFileTypes.Add('x86 Assembly Files (*.asm)');
  FFileTypes.Add('XML Files (*.xml;*.xsd;*.xsl;*.xslt;*.dtd)');
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
  Result := 'Any file (*.*)|*.*|';
  i := 0;
  while i < FFileTypes.Count do
  begin
    Result := Result + FFileTypes.Strings[i] + '|' + Common.StringBetween(FFileTypes.Strings[i], '(', ')');
    Inc(i);
    if i < FFileTypes.Count then
      Result := Result + '|';
  end;
end;

function TOptionsContainer.GetExtensions: string;
var
  i: Integer;
begin
  Result := '*.*|';
  for i := 0 to FFileTypes.Count - 1 do
    Result := Result + Common.StringBetween(FFileTypes.Strings[i], '(', ')') + '|';
end;

{ TPreferencesDialog }

function PreferencesDialog(Sender: TComponent): TPreferencesDialog;
begin
  if FPreferencesDialog = nil then
    FPreferencesDialog := TPreferencesDialog.Create(Sender);
  Result := FPreferencesDialog;
  Common.SetStyledFormSize(Result);
  if Assigned(TStyleManager.ActiveStyle) then
    Result.PageControl.DoubleBuffered := TStyleManager.ActiveStyle.Name = 'Windows';
end;

procedure TPreferencesDialog.FormDestroy(Sender: TObject);
begin
  FPreferencesDialog := nil;
end;

function TPreferencesDialog.Execute(EditOptions: TOptionsContainer): Boolean;
begin
  if (EditOptions = nil) then
  begin
    Result:= False;
    Exit;
  end;
  //Assign the Containers
  FOptionsContainer := EditOptions;
  //Get Data
  GetData;
  //Show the form
  Result:= Showmodal = mrOk;
  //PutData
  if Result then
    PutData;
end;

procedure TPreferencesDialog.GetData;
var
  i: Integer;
begin
  MultiLineCheckBox.Checked := FOptionsContainer.MultiLine;
  HTMLErrorCheckingCheckBox.Checked := FOptionsContainer.HTMLErrorChecking;
  //Gutter
  GutterVisibleCheckBox.Checked := FOptionsContainer.GutterVisible;
  LineNumbersCheckBox.Checked := FOptionsContainer.GutterLineNumbers;
   //Right Edge
  EdgeColumnEdit.Text := IntToStr(FOptionsContainer.RightEdge);
  //Line Spacing
  ExtraLinesEdit.Text := IntToStr(FOptionsContainer.ExtraLineSpacing);
  TabWidthEdit.Text := IntToStr(FOptionsContainer.TabWidth);
  //Font
  FontLabel.Font.Name := FOptionsContainer.FontName;
  FontLabel.Font.Size := FOptionsContainer.FontSize;
  FontLabel.Caption := FontLabel.Font.Name + ' ' + IntToStr(FontLabel.Font.Size) + 'pt';
  HTMLVersionComboBox.ItemIndex := Ord(FOptionsContainer.HTMLVersion);
  HTMLVersionComboBox.Enabled := HTMLErrorCheckingCheckBox.Checked;
  FileTypesListBox.Clear;
  for i := 0 to FOptionsContainer.FileTypes.Count - 1 do
    FileTypesListBox.Items.Add(FOptionsContainer.FileTypes.Strings[i]);
  FileTypesListBox.ItemIndex := 0;
  FileTypesListBoxClick(nil);
  SQLDialectComboBox.ItemIndex := Ord(FOptionsContainer.SQLDialect);
  CPASHighlighterComboBox.ItemIndex := Ord(FOptionsContainer.CPASHighlighter);
end;

procedure TPreferencesDialog.HTMLErrorCheckingCheckBoxClick(Sender: TObject);
begin
  HTMLVersionComboBox.Enabled := HTMLErrorCheckingCheckBox.Checked;
end;

procedure TPreferencesDialog.PutData;
var
  i: Integer;
  vOptions: TSynEditorOptions;

  procedure SetFlag(aOption: TSynEditorOption; aValue: Boolean);
  begin
    if aValue then
      Include(vOptions, aOption)
    else
      Exclude(vOptions, aOption);
  end;

begin
  FOptionsContainer.MultiLine := MultiLineCheckBox.Checked;
  FOptionsContainer.HTMLErrorChecking := HTMLErrorCheckingCheckBox.Checked;
  //Gutter
  FOptionsContainer.GutterVisible := GutterVisibleCheckBox.Checked;
  FOptionsContainer.GutterLineNumbers := LineNumbersCheckBox.Checked;
  //Right Edge
  FOptionsContainer.RightEdge := StrToIntDef(EdgeColumnEdit.Text, 80);
  //Line Spacing
  FOptionsContainer.ExtraLineSpacing := StrToIntDef(ExtraLinesEdit.Text, 0);
  FOptionsContainer.TabWidth := StrToIntDef(TabWidthEdit.Text, 8);
  //Font
  FOptionsContainer.FontName := FontLabel.Font.Name;
  FOptionsContainer.FontSize := FontLabel.Font.Size;
  FOptionsContainer.FHTMLVersion := TSynWebHtmlVersion(HTMLVersionComboBox.ItemIndex);
  FOptionsContainer.FileTypes.Clear;
  for i := 0 to FileTypesListBox.Items.Count - 1 do
    FOptionsContainer.FileTypes.Add(FileTypesListBox.Items.Strings[i]);
  FOptionsContainer.FSQLDialect := TSQLDialect(SQLDialectComboBox.ItemIndex);
  FOptionsContainer.FCPASHighlighter := TCPASHighlighter(CPASHighlighterComboBox.ItemIndex);
end;

procedure TPreferencesDialog.SelectFontActionExecute(Sender: TObject);
begin
  FontDialog.Font.Name := FontLabel.Font.Name;
  FontDialog.Font.Size := FontLabel.Font.Size;
  if FontDialog.Execute then
  begin
    FontLabel.Font.Assign(FontDialog.Font);
    FontLabel.Caption := FontLabel.Font.Name + ' ' + IntToStr(FontLabel.Font.Size) + 'pt';
  end;
end;

procedure TPreferencesDialog.FileTypesListBoxClick(Sender: TObject);
begin
  if FileTypesListBox.ItemIndex = -1 then
    Exit;
  ExtensionsEdit.Text := StringBetween(FileTypesListBox.Items.Strings[FileTypesListBox.ItemIndex], '(', ')');
end;

procedure TPreferencesDialog.ExtensionsEditChange(Sender: TObject);
var
  Extensions: string;
begin
  if FileTypesListBox.ItemIndex = -1 then
    Exit;
  Extensions := FileTypesListBox.Items.Strings[FileTypesListBox.ItemIndex];
  Extensions := Copy(Extensions, 1, Pos('(', Extensions));
  FileTypesListBox.Items.Strings[FileTypesListBox.ItemIndex] := Extensions + ExtensionsEdit.Text + ')';
end;

procedure TPreferencesDialog.FormCreate(Sender: TObject);
var
  i: TSynWebHtmlVersion;
  j: TSQLDialect;
  k: TCPASHighlighter;
begin
  InChanging := False;
  for i := Low(TSynWebHtmlVersion) to High(TSynWebHtmlVersion) do
    HTMLVersionComboBox.Items.Add(TSynWebHtmlVersionStr[TSynWebHtmlVersion(i)]);
  for j := Low(TSQLDialect) to High(TSQLDialect) do
    SQLDialectComboBox.Items.Add(TSQLDialectStr[TSQLDialect(j)]);
  for k := Low(TCPASHighlighter) to High(TCPASHighlighter) do
    CPASHighlighterComboBox.Items.Add(TCPASHighlighterStr[TCPASHighlighter(k)]);
end;

end.
