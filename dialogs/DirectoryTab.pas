unit DirectoryTab;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Dlg, Vcl.Mask, JvExMask, JvToolEdit, Vcl.StdCtrls, JvExStdCtrls,
  JvEdit, BCEdit, Vcl.ActnList, Vcl.ExtCtrls, Vcl.Themes, BCCheckBox, Vcl.Buttons;

type
  TDirectoryTabDialogType = (dtOpen, dtEdit);

  TDirectoryTabDialog = class(TDialog)
    ActionList: TActionList;
    ButtonPanel: TPanel;
    CancelButton: TButton;
    CheckBoxPanel: TPanel;
    ExcludeOtherBranchesAction: TAction;
    ExcludeOtherBranchesCheckBox: TBCCheckBox;
    OKAction: TAction;
    OKButton: TButton;
    Panel1: TPanel;
    RootDirectoryClickAction: TAction;
    RootDirectoryEdit: TBCEdit;
    RootDirectoryLabel: TLabel;
    RootDirectoryPanel: TPanel;
    RootDrectoryBitBtn: TBitBtn;
    ShowDrivesCheckBox: TBCCheckBox;
    ShowDrivesLabel: TLabel;
    TabNameEdit: TBCEdit;
    TabNameLabel: TLabel;
    TabNamePanel: TPanel;
    TopPanel: TPanel;
    Divider1Panel: TPanel;
    ExcludeOtherBranchesLabel: TLabel;
    procedure ExcludeOtherBranchesActionExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure OKActionExecute(Sender: TObject);
    procedure RootDirectoryClickActionExecute(Sender: TObject);
  private
    { Private declarations }
    function CheckFields: Boolean;
    function GetExcludeOtherBranches: Boolean;
    function GetRootDirectory: string;
    function GetShowDrives: Boolean;
    function GetTabName: string;
    procedure SetExcludeOtherBranches(Value: Boolean);
    procedure SetRootDirectory(Value: string);
    procedure SetShowDrives(Value: Boolean);
    procedure SetTabName(Value: string);
  public
    { Public declarations }
    function Open(DialogType: TDirectoryTabDialogType): Boolean;
    property ExcludeOtherBranches: Boolean read GetExcludeOtherBranches write SetExcludeOtherBranches;
    property RootDirectory: string read GetRootDirectory write SetRootDirectory;
    property ShowDrives: Boolean read GetShowDrives write SetShowDrives;
    property TabName: string read GetTabName write SetTabName;
  end;

function DirectoryTabDialog: TDirectoryTabDialog;

implementation

{$R *.dfm}

uses
  Common, StyleHooks,
{$WARNINGS OFF}
  Vcl.FileCtrl, Language; { warning: FileCtrl is specific to a platform }
{$WARNINGS ON}

var
  FDirectoryTabDialog: TDirectoryTabDialog;

function DirectoryTabDialog: TDirectoryTabDialog;
begin
  if FDirectoryTabDialog = nil then
    Application.CreateForm(TDirectoryTabDialog, FDirectoryTabDialog);
  Result := FDirectoryTabDialog;
  StyleHooks.SetStyledFormSize(Result);
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
    Caption := LanguageDataModule.GetConstant('OpenDirectory')
  else
    Caption := LanguageDataModule.GetConstant('EditDirectory');

  Result := ShowModal = mrOk;
end;

procedure TDirectoryTabDialog.RootDirectoryClickActionExecute(Sender: TObject);
var
  Dir: string;
begin
  Dir := RootDirectoryEdit.Text;
  if Vcl.FileCtrl.SelectDirectory(LanguageDataModule.GetConstant('SelectRootDirectory'), '', Dir, [sdNewFolder, sdShowShares,
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

procedure TDirectoryTabDialog.FormShow(Sender: TObject);
begin
  inherited;
  TabNameEdit.Left := ExcludeOtherBranchesCheckBox.Left;
  TabNameEdit.Width := TabNamePanel.Width - TabNameEdit.Left;
  RootDirectoryEdit.Left := ExcludeOtherBranchesCheckBox.Left;
  RootDirectoryEdit.Width := TabNamePanel.Width - RootDirectoryEdit.Left - RootDrectoryBitBtn.Width - 4;
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
    Common.ShowErrorMessage(LanguageDataModule.GetErrorMessage('EnterTabName'));
    TabNameEdit.SetFocus;
    Exit;
  end;
  if not System.SysUtils.DirectoryExists(RootDirectoryEdit.Text) then
  begin
    Common.ShowErrorMessage(LanguageDataModule.GetErrorMessage('RootDirectoryNotExist'));
    RootDirectoryEdit.SetFocus;
    Exit;
  end;
  Result := True;
end;

end.
