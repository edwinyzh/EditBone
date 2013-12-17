unit OptionsEditorErrorChecking;

interface

uses
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, BCControls.ComboBox,
  BCControls.CheckBox, Vcl.ExtCtrls, BCCommon.OptionsContainer;

type
  TOptionsEditorErrorCheckingFrame = class(TFrame)
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
    procedure GetData(OptionsContainer: TEditBoneOptionsContainer);
    procedure PutData(OptionsContainer: TEditBoneOptionsContainer);
  end;

implementation

{$R *.dfm}

uses
  SynHighlighterWebData;

constructor TOptionsEditorErrorCheckingFrame.Create(AOwner: TComponent);
var
  i: TSynWebHtmlVersion;
begin
  inherited;
  for i := Low(TSynWebHtmlVersion) to High(TSynWebHtmlVersion) do
    HTMLVersionComboBox.Items.Add(TSynWebHtmlVersionStr[TSynWebHtmlVersion(i)]);
end;

procedure TOptionsEditorErrorCheckingFrame.HTMLErrorCheckingCheckBoxClick(Sender: TObject);
begin
  HTMLVersionComboBox.Enabled := HTMLErrorCheckingCheckBox.Checked;
end;

procedure TOptionsEditorErrorCheckingFrame.GetData(OptionsContainer: TEditBoneOptionsContainer);
begin
  HTMLErrorCheckingCheckBox.Checked := OptionsContainer.HTMLErrorChecking;
  HTMLVersionComboBox.ItemIndex := Ord(OptionsContainer.HTMLVersion);
  HTMLVersionComboBox.Enabled := HTMLErrorCheckingCheckBox.Checked;
end;

procedure TOptionsEditorErrorCheckingFrame.PutData(OptionsContainer: TEditBoneOptionsContainer);
begin
  OptionsContainer.HTMLErrorChecking := HTMLErrorCheckingCheckBox.Checked;
  OptionsContainer.HTMLVersion := HTMLVersionComboBox.ItemIndex;
end;

end.
