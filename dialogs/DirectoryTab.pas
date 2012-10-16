unit DirectoryTab;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Dlg, Vcl.Dialogs, Vcl.Mask, JvExMask, JvToolEdit, Vcl.StdCtrls, JvExStdCtrls,
  JvEdit, BCEdit, Vcl.ActnList, Vcl.ExtCtrls, Vcl.Themes, BCCheckBox, Vcl.Buttons;

type
  TDirectoryTabDialogType = (dtOpen, dtEdit);

  TDirectoryTabDialog = class(TDialog)
    ActionList: TActionList;
    OKAction: TAction;
    ExcludeOtherBranchesAction: TAction;
    TopPanel: TPanel;
    TabNameLabel: TLabel;
    RootDirectoryLabel: TLabel;
    ShowDrivesCheckBox: TBCCheckBox;
    ExcludeOtherBranchesCheckBox: TBCCheckBox;
    TabNameEdit: TBCEdit;
    ButtonPanel: TPanel;
    OKButton: TButton;
    CancelButton: TButton;
    RootDirectoryEdit: TBCEdit;
    RootDrectoryBitBtn: TBitBtn;
    RootDirectoryClickAction: TAction;
    Panel1: TPanel;
    procedure OKActionExecute(Sender: TObject);
    procedure ExcludeOtherBranchesActionExecute(Sender: TObject);
    procedure RootDirectoryClickActionExecute(Sender: TObject);
  private
    { Private declarations }
    function GetTabName: string;
    procedure SetTabName(Value: string);
    function GetRootDirectory: string;
    procedure SetRootDirectory(Value: string);
    function GetShowDrives: Boolean;
    procedure SetShowDrives(Value: Boolean);
    function GetExcludeOtherBranches: Boolean;
    procedure SetExcludeOtherBranches(Value: Boolean);
    function CheckFields: Boolean;
  public
    { Public declarations }
    function Open(DialogType: TDirectoryTabDialogType): Boolean;
    property TabName: string read GetTabName write SetTabName;
    property RootDirectory: string read GetRootDirectory write SetRootDirectory;
    property ShowDrives: Boolean read GetShowDrives write SetShowDrives;
    property ExcludeOtherBranches: Boolean read GetExcludeOtherBranches write SetExcludeOtherBranches;
  end;

function DirectoryTabDialog: TDirectoryTabDialog;

implementation

{$R *.dfm}

uses
  Common,
{$WARNINGS OFF}
  Vcl.FileCtrl; { warning: FileCtrl is specific to a platform }
{$WARNINGS ON}

var
  FDirectoryTabDialog: TDirectoryTabDialog;

function DirectoryTabDialog: TDirectoryTabDialog;
begin
  if FDirectoryTabDialog = nil then
    Application.CreateForm(TDirectoryTabDialog, FDirectoryTabDialog);
  Result := FDirectoryTabDialog;
  Common.SetStyledFormSize(Result);
end;

procedure TDirectoryTabDialog.OKActionExecute(Sender: TObject);
begin
  if not CheckFields then
    Exit;
  ModalResult := mrOk;
end;

function TDirectoryTabDialog.Open(DialogType: TDirectoryTabDialogType): Boolean;
begin
  if DialogType = dtOpen then
    Caption := 'Open Directory'
  else
    Caption := 'Edit Directory';

  Result := ShowModal = mrOk;
end;

procedure TDirectoryTabDialog.RootDirectoryClickActionExecute(Sender: TObject);
var
  Dir: string;
begin
  //TStyleManager.Engine.RegisterStyleHook(TSelectDirDlg, TFormStyleHook);
  Dir := RootDirectoryEdit.Text;
  if Vcl.FileCtrl.SelectDirectory('Select root directory', '', Dir, [sdNewFolder, sdShowShares,
    sdNewUI, sdValidateDir], Self) then
    RootDirectoryEdit.Text := Dir;
end;

function TDirectoryTabDialog.GetTabName: string;
begin
  Result := TabNameEdit.Text;
end;

procedure TDirectoryTabDialog.SetTabName(Value: string);
begin
  TabNameEdit.Text := Value;
end;

procedure TDirectoryTabDialog.ExcludeOtherBranchesActionExecute(Sender: TObject);
begin
  if ExcludeOtherBranchesCheckBox.Checked then
    ShowDrivesCheckBox.Checked := False;
  ShowDrivesCheckBox.ReadOnly := ExcludeOtherBranchesCheckBox.Checked;
end;

function TDirectoryTabDialog.GetRootDirectory: string;
begin
  Result := RootDirectoryEdit.Text;
end;

procedure TDirectoryTabDialog.SetRootDirectory(Value: string);
begin
  RootDirectoryEdit.Text := Value;
end;

function TDirectoryTabDialog.GetShowDrives: Boolean;
begin
  Result := ShowDrivesCheckBox.Checked;
end;

procedure TDirectoryTabDialog.SetShowDrives(Value: Boolean);
begin
  ShowDrivesCheckBox.Checked := Value;
end;

function TDirectoryTabDialog.GetExcludeOtherBranches: Boolean;
begin
  Result := ExcludeOtherBranchesCheckBox.Checked;
end;

procedure TDirectoryTabDialog.SetExcludeOtherBranches(Value: Boolean);
begin
  ExcludeOtherBranchesCheckBox.Checked := Value;
end;

function TDirectoryTabDialog.CheckFields: Boolean;
begin
  Result := False;
  if Trim(TabNameEdit.Text) = '' then
  begin
    Common.ShowErrorMessage('Enter Tab Name.');
    TabNameEdit.SetFocus;
    Exit;
  end;
  if not System.SysUtils.DirectoryExists(RootDirectoryEdit.Text) then
  begin
    Common.ShowErrorMessage('Root Directory does not exist.');
    RootDirectoryEdit.SetFocus;
    Exit;
  end;
  Result := True;
end;

end.
