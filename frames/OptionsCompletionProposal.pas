unit OptionsCompletionProposal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, BCControls.Edit, BCControls.CheckBox, Vcl.ExtCtrls,
  BCControls.ComboBox;

type
  TOptionsCompletionProposalFrame = class(TFrame)
    Panel: TPanel;
    EnabledCheckBox: TBCCheckBox;
    CaseSensitiveCheckBox: TBCCheckBox;
    ResizeableCheckBox: TBCCheckBox;
    ShortcutLabel: TLabel;
    ShortcutComboBox: TBCComboBox;
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
  end;

implementation

{$R *.dfm}

uses
  Vcl.Menus, BCCommon;

constructor TOptionsCompletionProposalFrame.Create(AOwner: TComponent);
var
  i: Integer;
begin
  inherited;
  for i := 1 to High(ShortCuts) do
    ShortcutComboBox.Items.Add(ShortCutToText(ShortCuts[i]));
end;

end.
