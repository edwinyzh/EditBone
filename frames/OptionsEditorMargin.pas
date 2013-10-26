unit OptionsEditorMargin;

interface

uses
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.ExtCtrls, Vcl.StdCtrls, BCControls.CheckBox,
  BCControls.Edit, Vcl.Buttons, JvEdit;

type
  TEditorMarginFrame = class(TFrame)
    Panel: TPanel;
    VisibleLeftMarginCheckBox: TBCCheckBox;
    RightMarginLabel: TLabel;
    RightMarginEdit: TBCEdit;
    LeftMarginAutoSizeCheckBox: TBCCheckBox;
    LeftMarginWidthLabel: TLabel;
    LeftMarginWidthEdit: TBCEdit;
    VisibleRightMarginCheckBox: TBCCheckBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
