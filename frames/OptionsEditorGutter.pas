unit OptionsEditorGutter;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, BCControls.CheckBox,
  BCControls.Edit, Vcl.ActnList, Vcl.Buttons, System.Actions, JvExStdCtrls, JvEdit;

type
  TEditorGutterFrame = class(TFrame)
    Panel: TPanel;
    GutterVisibleCheckBox: TBCCheckBox;
    RightMarginLabel: TLabel;
    RightMarginEdit: TBCEdit;
    FontDialog: TFontDialog;
    ActionList: TActionList;
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
