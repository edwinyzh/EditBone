unit OptionsPrintPreview;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, BCControls.ComboBox, Vcl.ExtCtrls,
  BCControls.CheckBox;

type
  TOptionsPrintPreviewFrame = class(TFrame)
    Panel: TPanel;
    DateTimeLabel: TLabel;
    PrintedByLabel: TLabel;
    DocumentNameLabel: TLabel;
    PageNumberLabel: TLabel;
    DateTimeComboBox: TBCComboBox;
    PrintedByComboBox: TBCComboBox;
    DocumentNameComboBox: TBCComboBox;
    PageNumberComboBox: TBCComboBox;
    ShowHeaderLineCheckBox: TBCCheckBox;
    ShowFooterLineCheckBox: TBCCheckBox;
    ShowLineNumbersCheckBox: TBCCheckBox;
    WordWrapCheckBox: TBCCheckBox;
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
  end;

implementation

{$R *.dfm}

uses
  BCCommon.LanguageStrings;

constructor TOptionsPrintPreviewFrame.Create(AOwner: TComponent);
begin
  inherited;
  with DocumentNameComboBox.Items do
  begin
    Add(LanguageDatamodule.GetConstant('FooterLeft'));
    Add(LanguageDatamodule.GetConstant('FooterRight'));
    Add(LanguageDatamodule.GetConstant('HeaderLeft'));
    Add(LanguageDatamodule.GetConstant('HeaderRight'));
    Add(LanguageDatamodule.GetConstant('Hide'));
  end;
  PageNumberComboBox.Items.Text := DocumentNameComboBox.Items.Text;
  PrintedByComboBox.Items.Text := DocumentNameComboBox.Items.Text;
  DateTimeComboBox.Items.Text := DocumentNameComboBox.Items.Text;
end;

end.
