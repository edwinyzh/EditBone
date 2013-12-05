unit OptionsEditorRightMargin;

interface

uses
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.ExtCtrls, Vcl.StdCtrls, BCControls.CheckBox,
  BCControls.Edit, Vcl.Buttons, JvEdit;

type
  TEditorRightMarginFrame = class(TFrame)
    Panel: TPanel;
    PositionLabel: TLabel;
    PositionEdit: TBCEdit;
    VisibleCheckBox: TBCCheckBox;
    MouseMoveCheckBox: TBCCheckBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
