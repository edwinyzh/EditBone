unit OptionsEditorMargin;

interface

uses
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.ExtCtrls, Vcl.StdCtrls, BCControls.CheckBox,
  BCControls.Edit, Vcl.Buttons, JvEdit;

type
  TEditorMarginFrame = class(TFrame)
    Panel: TPanel;
    MarginVisibleCheckBox: TBCCheckBox;
    RightMarginLabel: TLabel;
    RightMarginEdit: TBCEdit;
    AutoSizeCheckBox: TBCCheckBox;
    WidthLabel: TLabel;
    WidthEdit: TBCEdit;
    VisibleRightMarginCheckBox: TBCCheckBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
