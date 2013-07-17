unit OptionsEditorFont;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, Vcl.StdCtrls,
  Vcl.ActnList, BCControls.SynEdit, System.Actions, SynEdit;

type
  TEditorFontFrame = class(TFrame)
    Panel: TPanel;
    FontDialog: TFontDialog;
    ActionList: TActionList;
    SelectFontAction: TAction;
    TopPanel: TPanel;
    SelectFontSpeedButton: TSpeedButton;
    FontLabel: TLabel;
    BottomPanel: TPanel;
    SynEdit: TBCSynEdit;
    procedure SelectFontActionExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
  end;

implementation

{$R *.dfm}

constructor TEditorFontFrame.Create(AOwner: TComponent);
begin
  inherited;
  SynEdit.Text := FontLabel.Caption;
end;

procedure TEditorFontFrame.SelectFontActionExecute(Sender: TObject);
begin
  FontDialog.Font.Name := FontLabel.Font.Name;
  FontDialog.Font.Size := FontLabel.Font.Size;
  if FontDialog.Execute then
  begin
    FontLabel.Font.Assign(FontDialog.Font);
    FontLabel.Caption := Format('%s %dpt', [FontLabel.Font.Name, FontLabel.Font.Size]);
    SynEdit.Text := FontLabel.Caption;
    SynEdit.Font.Assign(FontDialog.Font);
  end;
end;

end.
