unit OptionsEditorErrorChecking;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, JvExStdCtrls, JvCombobox,
  BCControls.ComboBox, BCControls.CheckBox, Vcl.ExtCtrls;

type
  TEditorErrorCheckingFrame = class(TFrame)
    Panel: TPanel;
    HTMLVersionLabel: TLabel;
    HTMLErrorCheckingCheckBox: TBCCheckBox;
    HTMLVersionComboBox: TBCComboBox;
    procedure HTMLErrorCheckingCheckBoxClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
  end;

implementation

{$R *.dfm}

uses
  SynHighlighterWebData;

constructor TEditorErrorCheckingFrame.Create(AOwner: TComponent);
var
  i: TSynWebHtmlVersion;
begin
  inherited;
  for i := Low(TSynWebHtmlVersion) to High(TSynWebHtmlVersion) do
    HTMLVersionComboBox.Items.Add(TSynWebHtmlVersionStr[TSynWebHtmlVersion(i)]);
end;

procedure TEditorErrorCheckingFrame.HTMLErrorCheckingCheckBoxClick(Sender: TObject);
begin
  HTMLVersionComboBox.Enabled := HTMLErrorCheckingCheckBox.Checked;
end;

end.
