unit OptionsEditorOptions;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, JvExStdCtrls,
  JvCombobox, BCComboBox, BCCheckBox, JvEdit, BCEdit;

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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
