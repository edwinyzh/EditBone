unit OptionsEditorGutter;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, BCCheckBox,
  JvExStdCtrls, JvEdit, BCEdit, Vcl.ActnList, Vcl.Buttons;

type
  TEditorGutterFrame = class(TFrame)
    Panel: TPanel;
    GutterVisibleCheckBox: TBCCheckBox;
    RightMarginLabel: TLabel;
    RightMarginEdit: TBCEdit;
    FontDialog: TFontDialog;
    SelectFontSpeedButton: TSpeedButton;
    FontLabel: TLabel;
    ActionList: TActionList;
    SelectFontAction: TAction;
    AutoSizeCheckBox: TBCCheckBox;
    WidthLabel: TLabel;
    WidthEdit: TBCEdit;
    VisibleRightMarginCheckBox: TBCCheckBox;
    procedure SelectFontActionExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TEditorGutterFrame.SelectFontActionExecute(Sender: TObject);
begin
  FontDialog.Font.Name := FontLabel.Font.Name;
  FontDialog.Font.Size := FontLabel.Font.Size;
  if FontDialog.Execute then
  begin
    FontLabel.Font.Assign(FontDialog.Font);
    FontLabel.Caption := Format('%s %dpt', [FontLabel.Font.Name, FontLabel.Font.Size]);
  end;
end;

end.
