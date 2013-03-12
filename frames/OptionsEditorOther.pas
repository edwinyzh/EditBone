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
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
  end;

implementation

{$R *.dfm}

uses
  Lib, SynHighlighterSQL;

constructor TEditorOtherFrame.Create(AOwner: TComponent);
var
  i: TSQLDialect;
  j: TCPASHighlighter;
begin
  inherited;
  for i := Low(TSQLDialect) to High(TSQLDialect) do
    SQLDialectComboBox.Items.Add(TSQLDialectStr[TSQLDialect(i)]);
  for j := Low(TCPASHighlighter) to High(TCPASHighlighter) do
    CPASHighlighterComboBox.Items.Add(TCPASHighlighterStr[TCPASHighlighter(j)]);
end;

end.
