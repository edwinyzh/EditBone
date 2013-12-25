unit OptionsEditorOther;

interface

uses
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, BCControls.ComboBox, Vcl.ExtCtrls,
  BCCommon.OptionsContainer, BCFrames.OptionsFrame;

type
  TOptionsEditorOtherFrame = class(TOptionsFrame)
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
    procedure GetData(OptionsContainer: TOptionsContainer); override;
    procedure PutData(OptionsContainer: TOptionsContainer); override;
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

procedure TOptionsEditorOtherFrame.GetData(OptionsContainer: TOptionsContainer);
begin
  SQLDialectComboBox.ItemIndex := (OptionsContainer as TEditBoneOptionsContainer).SQLDialect;
  CPASHighlighterComboBox.ItemIndex := (OptionsContainer as TEditBoneOptionsContainer).CPASHighlighter;
  CSSVersionComboBox.ItemIndex := (OptionsContainer as TEditBoneOptionsContainer).CSSVersion;
  PHPVersionComboBox.ItemIndex := (OptionsContainer as TEditBoneOptionsContainer).PHPVersion;
  DefaultEncodingComboBox.ItemIndex := (OptionsContainer as TEditBoneOptionsContainer).DefaultEncoding;
  DefaultHighlighterComboBox.ItemIndex := (OptionsContainer as TEditBoneOptionsContainer).DefaultHighlighter;
end;

procedure TOptionsEditorOtherFrame.PutData(OptionsContainer: TOptionsContainer);
begin
  (OptionsContainer as TEditBoneOptionsContainer).SQLDialect := SQLDialectComboBox.ItemIndex;
  (OptionsContainer as TEditBoneOptionsContainer).CPASHighlighter := CPASHighlighterComboBox.ItemIndex;
  (OptionsContainer as TEditBoneOptionsContainer).CSSVersion := CSSVersionComboBox.ItemIndex;
  (OptionsContainer as TEditBoneOptionsContainer).PHPVersion := PHPVersionComboBox.ItemIndex;
  (OptionsContainer as TEditBoneOptionsContainer).DefaultEncoding := DefaultEncodingComboBox.ItemIndex;
  (OptionsContainer as TEditBoneOptionsContainer).DefaultHighlighter := DefaultHighlighterComboBox.ItemIndex;
end;

end.
