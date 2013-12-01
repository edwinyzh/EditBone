unit OptionsEditorLeftMargin;

interface

uses
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.ExtCtrls, Vcl.StdCtrls, BCControls.CheckBox,
  BCControls.Edit, Vcl.Buttons, JvEdit;

type
  TEditorLeftMarginFrame = class(TFrame)
    Panel: TPanel;
    VisibleCheckBox: TBCCheckBox;
    AutoSizeCheckBox: TBCCheckBox;
    WidthLabel: TLabel;
    LeftMarginWidthEdit: TBCEdit;
    ShowLineModifiedCheckBox: TBCCheckBox;
    LineModifiedColorBox: TColorBox;
    LineModifiedColorLabel: TLabel;
    LineNormalColorLabel: TLabel;
    LineNormalColorBox: TColorBox;
    InTensCheckBox: TBCCheckBox;
    ZeroStartCheckBox: TBCCheckBox;
    ShowBookmarksCheckBox: TBCCheckBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
