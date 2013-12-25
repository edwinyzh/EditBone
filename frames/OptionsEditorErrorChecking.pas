unit OptionsEditorErrorChecking;

interface

uses
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, BCControls.ComboBox,
  BCControls.CheckBox, Vcl.ExtCtrls, BCCommon.OptionsContainer, BCFrames.OptionsFrame;

type
  TOptionsEditorErrorCheckingFrame = class(TOptionsFrame)
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
    procedure GetData(OptionsContainer: TOptionsContainer); override;
    procedure PutData(OptionsContainer: TOptionsContainer); override;
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

procedure TOptionsEditorErrorCheckingFrame.GetData(OptionsContainer: TOptionsContainer);
begin
  HTMLErrorCheckingCheckBox.Checked := (OptionsContainer as TEditBoneOptionsContainer).HTMLErrorChecking;
  HTMLVersionComboBox.ItemIndex := Ord((OptionsContainer as TEditBoneOptionsContainer).HTMLVersion);
  HTMLVersionComboBox.Enabled := HTMLErrorCheckingCheckBox.Checked;
end;

procedure TOptionsEditorErrorCheckingFrame.PutData(OptionsContainer: TOptionsContainer);
begin
  (OptionsContainer as TEditBoneOptionsContainer).HTMLErrorChecking := HTMLErrorCheckingCheckBox.Checked;
  (OptionsContainer as TEditBoneOptionsContainer).HTMLVersion := HTMLVersionComboBox.ItemIndex;
end;

end.
