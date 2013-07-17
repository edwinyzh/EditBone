unit InsertTag;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, BCDialogs.Dlg, Vcl.StdCtrls, JvExStdCtrls, JvEdit, BCControls.Edit, Vcl.ExtCtrls;

type
  TInsertTagDialog = class(TDialog)
    ButtonPanel: TPanel;
    OKButton: TButton;
    CancelButton: TButton;
    ButtonDividerPanel: TPanel;
    TopPanel: TPanel;
    InsertTagEdit: TBCEdit;
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    function GetTagName: string;
  public
    { Public declarations }
    function Execute: Boolean;
    property TagName: string read GetTagName;
  end;

function InsertTagDialog(Sender: TComponent): TInsertTagDialog;

implementation

{$R *.dfm}

uses
  BCCommon.StyleHooks;

var
  FInsertTagDialog: TInsertTagDialog;

function InsertTagDialog(Sender: TComponent): TInsertTagDialog;
begin
  if FInsertTagDialog = nil then
    FInsertTagDialog := TInsertTagDialog.Create(Sender);
  Result := FInsertTagDialog;
  SetStyledFormSize(Result);
end;

procedure TInsertTagDialog.FormDestroy(Sender: TObject);
begin
  FInsertTagDialog := nil;
end;

function TInsertTagDialog.Execute: Boolean;
begin
  Result:= Showmodal = mrOk;
end;

function TInsertTagDialog.GetTagName: string;
begin
  Result := InsertTagEdit.Text;
end;

end.
