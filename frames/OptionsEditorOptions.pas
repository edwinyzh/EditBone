unit OptionsEditorOptions;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, JvExStdCtrls,
  JvCombobox, BCComboBox, BCCheckBox, JvEdit, BCEdit, Vcl.ComCtrls;

type
  TEditorOptionsFrame = class(TFrame)
    Panel: TPanel;
    AutoIndentCheckBox: TBCCheckBox;
    TrimTrailingSpacesCheckBox: TBCCheckBox;
    ScrollPastEofCheckBox: TBCCheckBox;
    ScrollPastEolCheckBox: TBCCheckBox;
    ExtraLinesLabel: TLabel;
    ExtraLinesEdit: TBCEdit;
    TabWidthLabel: TLabel;
    TabWidthEdit: TBCEdit;
    BrightnessTrackBar: TTrackBar;
    ActiveLineColorBrightnessLabel: TLabel;
    TabsToSpacesCheckBox: TBCCheckBox;
    AutoSaveCheckBox: TBCCheckBox;
    InsertCaretLabel: TLabel;
    InsertCaretComboBox: TBCComboBox;
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
  end;

implementation

{$R *.dfm}

uses
  Language;

constructor TEditorOptionsFrame.Create(AOwner: TComponent);
begin
  inherited;
  with InsertCaretComboBox.Items do
  begin
    Add(LanguageDatamodule.GetConstant('VerticalLine'));
    Add(LanguageDatamodule.GetConstant('HorizontalLine'));
    Add(LanguageDatamodule.GetConstant('HalfBlock'));
    Add(LanguageDatamodule.GetConstant('Block'));
  end;
end;

end.
