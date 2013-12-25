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
    destructor Destroy; override;
    procedure Init; override;
    procedure GetData; override;
    procedure PutData; override;
  end;

function OptionsEditorOtherFrame(AOwner: TComponent): TOptionsEditorOtherFrame;

implementation

{$R *.dfm}

uses
  Lib, BCCommon.LanguageStrings, SynHighlighterSQL, SynHighlighterWebData;

var
  FOptionsEditorOtherFrame: TOptionsEditorOtherFrame;

function OptionsEditorOtherFrame(AOwner: TComponent): TOptionsEditorOtherFrame;
begin
  if not Assigned(FOptionsEditorOtherFrame) then
    FOptionsEditorOtherFrame := TOptionsEditorOtherFrame.Create(AOwner);
  Result := FOptionsEditorOtherFrame;
end;

destructor TOptionsEditorOtherFrame.Destroy;
begin
  inherited;
  FOptionsEditorOtherFrame := nil;
end;

procedure TOptionsEditorOtherFrame.Init;
var
  i: TSQLDialect;
  k: TSynWebCssVersion;
  l: TSynWebPhpVersion;
begin
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

procedure TOptionsEditorOtherFrame.GetData;
begin
  SQLDialectComboBox.ItemIndex := OptionsContainer.SQLDialect;
  CPASHighlighterComboBox.ItemIndex := OptionsContainer.CPASHighlighter;
  CSSVersionComboBox.ItemIndex := OptionsContainer.CSSVersion;
  PHPVersionComboBox.ItemIndex := OptionsContainer.PHPVersion;
  DefaultEncodingComboBox.ItemIndex := OptionsContainer.DefaultEncoding;
  DefaultHighlighterComboBox.ItemIndex := OptionsContainer.DefaultHighlighter;
end;

procedure TOptionsEditorOtherFrame.PutData;
begin
  OptionsContainer.SQLDialect := SQLDialectComboBox.ItemIndex;
  OptionsContainer.CPASHighlighter := CPASHighlighterComboBox.ItemIndex;
  OptionsContainer.CSSVersion := CSSVersionComboBox.ItemIndex;
  OptionsContainer.PHPVersion := PHPVersionComboBox.ItemIndex;
  OptionsContainer.DefaultEncoding := DefaultEncodingComboBox.ItemIndex;
  OptionsContainer.DefaultHighlighter := DefaultHighlighterComboBox.ItemIndex;
end;

end.
