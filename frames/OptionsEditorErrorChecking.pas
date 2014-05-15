unit OptionsEditorErrorChecking;

interface

uses
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, BCControls.ComboBox,
  BCControls.CheckBox, Vcl.ExtCtrls, BCCommon.OptionsContainer, BCFrames.OptionsFrame, JvExStdCtrls, JvCheckBox;

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
    destructor Destroy; override;
    procedure Init; override;
    procedure GetData; override;
    procedure PutData; override;
  end;

function OptionsEditorErrorCheckingFrame(AOwner: TComponent): TOptionsEditorErrorCheckingFrame;

implementation

{$R *.dfm}

uses
  SynHighlighterWebData;

var
  FOptionsEditorErrorCheckingFrame: TOptionsEditorErrorCheckingFrame;

function OptionsEditorErrorCheckingFrame(AOwner: TComponent): TOptionsEditorErrorCheckingFrame;
begin
  if not Assigned(FOptionsEditorErrorCheckingFrame) then
    FOptionsEditorErrorCheckingFrame := TOptionsEditorErrorCheckingFrame.Create(AOwner);
  Result := FOptionsEditorErrorCheckingFrame;
end;

destructor TOptionsEditorErrorCheckingFrame.Destroy;
begin
  inherited;
  FOptionsEditorErrorCheckingFrame := nil;
end;

procedure TOptionsEditorErrorCheckingFrame.Init;
var
  i: TSynWebHtmlVersion;
begin
  for i := Low(TSynWebHtmlVersion) to High(TSynWebHtmlVersion) do
    HTMLVersionComboBox.Items.Add(TSynWebHtmlVersionStr[TSynWebHtmlVersion(i)]);
end;

procedure TOptionsEditorErrorCheckingFrame.HTMLErrorCheckingCheckBoxClick(Sender: TObject);
begin
  HTMLVersionComboBox.Enabled := HTMLErrorCheckingCheckBox.Checked;
end;

procedure TOptionsEditorErrorCheckingFrame.GetData;
begin
  HTMLErrorCheckingCheckBox.Checked := OptionsContainer.HTMLErrorChecking;
  HTMLVersionComboBox.ItemIndex := OptionsContainer.HTMLVersion;
  HTMLVersionComboBox.Enabled := HTMLErrorCheckingCheckBox.Checked;
end;

procedure TOptionsEditorErrorCheckingFrame.PutData;
begin
  OptionsContainer.HTMLErrorChecking := HTMLErrorCheckingCheckBox.Checked;
  OptionsContainer.HTMLVersion := HTMLVersionComboBox.ItemIndex;
end;

end.
