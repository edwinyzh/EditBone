unit OptionsEditorOther;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, JvExStdCtrls, JvCombobox,
  BCComboBox, Vcl.ExtCtrls;

type
  TEditorOtherFrame = class(TFrame)
    Panel: TPanel;
    CPASHighlighterLabel: TLabel;
    SQLDialectLabel: TLabel;
    CPASHighlighterComboBox: TBCComboBox;
    SQLDialectComboBox: TBCComboBox;
    CSSVersionLabel: TLabel;
    CSSVersionComboBox: TBCComboBox;
    PHPVersionLabel: TLabel;
    PHPVersionComboBox: TBCComboBox;
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
  end;

implementation

{$R *.dfm}

uses
  Lib, Language, SynHighlighterSQL, SynHighlighterWebData;

constructor TEditorOtherFrame.Create(AOwner: TComponent);
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

end.
