unit OptionsMainMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, BCCheckBox,
  Vcl.Buttons, JvExStdCtrls, JvCombobox, BCComboBox, JvEdit, BCEdit, Vcl.ActnList, System.Actions;

type
  TMainMenuFrame = class(TFrame)
    Panel: TPanel;
    PersistentHotKeysCheckBox: TBCCheckBox;
    ShadowsCheckBox: TBCCheckBox;
    UseSystemFontCheckBox: TBCCheckBox;
    SelectFontSpeedButton: TSpeedButton;
    FontLabel: TLabel;
    AnimationStyleLabel: TLabel;
    AnimationStyleComboBox: TBCComboBox;
    AnimationDurationLabel: TLabel;
    AnimationDurationEdit: TBCEdit;
    FontDialog: TFontDialog;
    ActionList: TActionList;
    SelectFontAction: TAction;
    procedure SelectFontActionExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
  end;

implementation

{$R *.dfm}

uses
  Common, Vcl.ActnMenus;

constructor TMainMenuFrame.Create(AOwner: TComponent);
var
  i: TAnimationStyle;
begin
  inherited;
  for i := Low(TAnimationStyle) to High(TAnimationStyle) do
    AnimationStyleComboBox.Items.Add(TAnimationStyleStr[TAnimationStyle(i)]);
end;

procedure TMainMenuFrame.SelectFontActionExecute(Sender: TObject);
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
