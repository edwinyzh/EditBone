unit OptionsPrint;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, BCControls.ComboBox, Vcl.ExtCtrls,
  BCControls.CheckBox;

type
  TOptionsPrintFrame = class(TFrame)
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
    ShowLinenumbersCheckBox: TBCCheckBox;
    WordWrapCheckBox: TBCCheckBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
