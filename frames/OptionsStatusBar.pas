unit OptionsStatusBar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, BCControls.CheckBox, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.ActnList, System.Actions;

type
  TStatusBarFrame = class(TFrame)
    Panel: TPanel;
    SelectFontSpeedButton: TSpeedButton;
    FontLabel: TLabel;
    UseSystemFontCheckBox: TBCCheckBox;
    ActionList: TActionList;
    SelectFontAction: TAction;
    FontDialog: TFontDialog;
    procedure SelectFontActionExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TStatusBarFrame.SelectFontActionExecute(Sender: TObject);
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
