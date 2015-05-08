unit EditBone.Dialogs.InsertTag;

interface

uses
  System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Controls, BCCommon.Dialogs.Base, Vcl.StdCtrls, BCControls.Edit,
  Vcl.ExtCtrls, sEdit, BCControls.Panel, sPanel;

type
  TInsertTagDialog = class(TBCBaseDialog)
    ButtonCancel: TButton;
    ButtonOK: TButton;
    EditInsertTag: TBCEdit;
    PanelButton: TBCPanel;
    PanelTop: TBCPanel;
  public
    class function ClassShowModal(AOwner: TComponent; var ATagName: string): Integer;
  end;

implementation

{$R *.dfm}

class function TInsertTagDialog.ClassShowModal(AOwner: TComponent; var ATagName: string): Integer;
begin
  with TInsertTagDialog.Create(AOwner) do
  try
    Result := ShowModal;
    ATagName := EditInsertTag.Text;
  finally
    Free;
  end;
end;

end.
