unit OptionsEditorGutter;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, BCCheckBox,
  JvExStdCtrls, JvEdit, BCEdit;

type
  TEditorGutterFrame = class(TFrame)
    Panel: TPanel;
    GutterVisibleCheckBox: TBCCheckBox;
    LineNumbersCheckBox: TBCCheckBox;
    EdgeColumnLabel: TLabel;
    EdgeColumnEdit: TBCEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
