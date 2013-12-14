unit OptionsEditorOther;

interface

uses
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, BCControls.ComboBox, Vcl.ExtCtrls,
  BCCommon.OptionsContainer;

type
  TOptionsEditorOtherFrame = class(TFrame)
    Panel: TPanel;
    CPASHighlighterLabel: TLabel;
    SQLDialectLabel: TLabel;
    CPASHighlighterComboBox: TBCComboBox;
    SQLDialectComboBox: TBCComboBox;
    CSSVersionLabel: TLabel;
    CSSVersionComboBox: TBCComboBox;
    PHPVersionLabel: TLabel;
    PHPVersionComboBox: TBCComboBox;
    DefaultEncodingLabel: TLabel;
    DefaultEncodingComboBox: TBCComboBox;
    DefaultHighlighterLabel: TLabel;
    DefaultHighlighterComboBox: TBCComboBox;
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    procedure GetData(OptionsContainer: TEditBoneOptionsContainer);
    procedure PutData(OptionsContainer: TEditBoneOptionsContainer);
  end;

implementation

{$R *.dfm}

uses
  Lib, BCCommon.LanguageStrings, SynHighlighterSQL, SynHighlighterWebData;

constructor TOptionsEditorOtherFrame.Create(AOwner: TComponent);
var
  i: TSQLDialect;
  k: TSynWebCssVersion;
  l: TSynWebPhpVersion;
begin
  inherited;
  for i := Low(TSQLDialect) to High(TSQLDialect) do
    SQLDialectComboBox.Items.Add(TSQLDialectStr[TSQLDialect(i)]);
  with CPASHighlighterComboBox.Items do
  begin
    Add(LanguageDatamodule.GetConstant('Classic'));
    Add(LanguageDatamodule.GetConstant('Default'));
    Add(LanguageDatamodule.GetConstant('Twilight'));
  end;
  for k := Low(TSynWebCssVersion) to High(TSynWebCssVersion) do
    CSSVersionComboBox.Items.Add(TSynWebCssVersionStr[TSynWebCssVersion(k)]);
  for l := Low(TSynWebPhpVersion) to High(TSynWebPhpVersion) do
    PHPVersionComboBox.Items.Add(TSynWebPhpVersionStr[TSynWebPhpVersion(l)]);
end;

procedure TOptionsEditorOtherFrame.GetData(OptionsContainer: TEditBoneOptionsContainer);
begin
  SQLDialectComboBox.ItemIndex := Ord(OptionsContainer.SQLDialect);
  CPASHighlighterComboBox.ItemIndex := Ord(OptionsContainer.CPASHighlighter);
  CSSVersionComboBox.ItemIndex := Ord(OptionsContainer.CSSVersion);
  PHPVersionComboBox.ItemIndex := Ord(OptionsContainer.PHPVersion);
  DefaultEncodingComboBox.ItemIndex := OptionsContainer.DefaultEncoding;
  DefaultHighlighterComboBox.ItemIndex := OptionsContainer.DefaultHighlighter;
end;

procedure TOptionsEditorOtherFrame.PutData(OptionsContainer: TEditBoneOptionsContainer);
begin
  OptionsContainer.SQLDialect := TSQLDialect(SQLDialectComboBox.ItemIndex);
  OptionsContainer.CPASHighlighter := TCPASHighlighter(CPASHighlighterComboBox.ItemIndex);
  OptionsContainer.CSSVersion := TSynWebCssVersion(CSSVersionComboBox.ItemIndex);
  OptionsContainer.PHPVersion := TSynWebPhpVersion(PHPVersionComboBox.ItemIndex);
  OptionsContainer.DefaultEncoding := DefaultEncodingComboBox.ItemIndex;
  OptionsContainer.DefaultHighlighter := DefaultHighlighterComboBox.ItemIndex;
end;

end.
