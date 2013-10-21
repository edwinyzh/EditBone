unit OptionsEditorCompletionProposal;

interface

uses
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, BCControls.CheckBox, Vcl.ExtCtrls,
  BCControls.ComboBox;

type
  TEditorCompletionProposalFrame = class(TFrame)
    Panel: TPanel;
    EnabledCheckBox: TBCCheckBox;
    CaseSensitiveCheckBox: TBCCheckBox;
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
  Vcl.Menus, BCCommon.Lib;

constructor TEditorCompletionProposalFrame.Create(AOwner: TComponent);
var
  i: Integer;
begin
  inherited;
  for i := 1 to High(ShortCuts) do
    ShortcutComboBox.Items.Add(ShortCutToText(ShortCuts[i]));
end;

end.
