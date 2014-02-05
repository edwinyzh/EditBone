unit DirectoryTab;

interface

uses
  System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, BCDialogs.Dlg, Vcl.StdCtrls, BCControls.Edit,
  Vcl.ActnList, Vcl.ExtCtrls, BCControls.CheckBox, Vcl.Buttons, System.Actions, BCControls.ComboBox, JvExControls,
  JvSpeedButton;

type
  TDirectoryTabDialog = class(TDialog)
    ActionList: TActionList;
    ButtonDividerPanel: TPanel;
    ButtonPanel: TPanel;
    CancelButton: TButton;
    ExcludeOtherBranchesAction: TAction;
    ExcludeOtherBranchesCheckBox: TBCCheckBox;
    OKAction: TAction;
    OKButton: TButton;
    RootDirectoryClickAction: TAction;
    RootDirectoryEdit: TBCEdit;
    RootDirectoryLabel: TLabel;
    RootDirectoryPanel: TPanel;
    RootDrectoryBitBtn: TJvSpeedButton;
    ShowDrivesComboBox: TBCComboBox;
    ShowDrivesLabel: TLabel;
    ShowDrivesPanel: TPanel;
    ShowFileTypeComboBox: TBCComboBox;
    ShowFileTypeLabel: TLabel;
    ShowFileTypePanel: TPanel;
    TabNameEdit: TBCEdit;
    TabNameLabel: TLabel;
    TabNamePanel: TPanel;
    TopPanel: TPanel;
    procedure ExcludeOtherBranchesActionExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure OKActionExecute(Sender: TObject);
    procedure RootDirectoryClickActionExecute(Sender: TObject);
  private
    { Private declarations }
    function CheckFields: Boolean;
    function GetExcludeOtherBranches: Boolean;
    function GetRootDirectory: string;
    function GetShowDrives: Byte;
    function GetShowFileType: Byte;
    function GetTabName: string;
    procedure SetExcludeOtherBranches(Value: Boolean);
    procedure SetRootDirectory(Value: string);
    procedure SetShowDrives(Value: Byte);
    procedure SetShowFileType(Value: Byte);
    procedure SetTabName(Value: string);
  public
    { Public declarations }
    function Open(DialogType: TDialogType): Boolean;
    property ExcludeOtherBranches: Boolean read GetExcludeOtherBranches write SetExcludeOtherBranches;
    property RootDirectory: string read GetRootDirectory write SetRootDirectory;
    property ShowDrives: Byte read GetShowDrives write SetShowDrives;
    property ShowFileType: Byte read GetShowFileType write SetShowFileType;
    property TabName: string read GetTabName write SetTabName;
  end;

function DirectoryTabDialog: TDirectoryTabDialog;

implementation

{$R *.dfm}

uses
  BCCommon.StyleUtils, Math,
{$WARNINGS OFF}
  Vcl.FileCtrl, { warning: FileCtrl is specific to a platform }
{$WARNINGS ON}
  BCCommon.LanguageStrings, BCCommon.Messages;

var
  FDirectoryTabDialog: TDirectoryTabDialog;

function DirectoryTabDialog: TDirectoryTabDialog;
begin
  if not Assigned(FDirectoryTabDialog) then
    Application.CreateForm(TDirectoryTabDialog, FDirectoryTabDialog);
  Result := FDirectoryTabDialog;
  SetStyledFormSize(Result);
end;

procedure TDirectoryTabDialog.OKActionExecute(Sender: TObject);
begin
  if not CheckFields then
    Exit;
  ModalResult := mrOk;
end;

function TDirectoryTabDialog.Open(DialogType: TDialogType): Boolean;

  procedure AddConstants(ComboBox: TBCComboBox);
  var
    Index: Integer;
  begin
    with ComboBox do
    begin
      Index := ItemIndex;
      Clear;
      Items.Add(LanguageDataModule.GetConstant('Hide'));
      Items.Add(LanguageDataModule.GetConstant('Bottom'));
      Items.Add(LanguageDataModule.GetConstant('Top'));
      ItemIndex := Index;
    end;
  end;

begin
  if DialogType = dtOpen then
    Caption := LanguageDataModule.GetConstant('OpenDirectory')
  else
    Caption := LanguageDataModule.GetConstant('EditDirectory');

  AddConstants(ShowDrivesComboBox);
  AddConstants(ShowFileTypeComboBox);

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
    ShowDrivesComboBox.ItemIndex := 0;
  ShowDrivesComboBox.ReadOnly := ExcludeOtherBranchesCheckBox.Checked;
end;

procedure TDirectoryTabDialog.FormShow(Sender: TObject);
var
  LeftMaxWidth: Integer;
begin
  inherited;
  LeftMaxWidth := Max(Max(Max(TabNameLabel.Width, RootDirectoryLabel.Width), ShowDrivesLabel.Width), ShowFileTypeLabel.Width) + 10;

  TabNameEdit.Left := LeftMaxWidth;
  TabNameEdit.Width := TabNamePanel.Width - TabNameEdit.Left;
  RootDirectoryEdit.Left := LeftMaxWidth;
  RootDirectoryEdit.Width := TabNamePanel.Width - RootDirectoryEdit.Left - RootDrectoryBitBtn.Width - 4;
  ShowDrivesComboBox.Left := LeftMaxWidth;
  ShowFileTypeComboBox.Left := LeftMaxWidth;
  ExcludeOtherBranchesCheckBox.Left := LeftMaxWidth + ShowDrivesComboBox.Width + 4;
end;

function TDirectoryTabDialog.GetRootDirectory: string;
begin
  Result := RootDirectoryEdit.Text;
end;

procedure TDirectoryTabDialog.SetRootDirectory(Value: string);
begin
  RootDirectoryEdit.Text := Value;
end;

function TDirectoryTabDialog.GetShowDrives: Byte;
begin
  Result := ShowDrivesComboBox.ItemIndex;
end;

procedure TDirectoryTabDialog.SetShowDrives(Value: Byte);
begin
  ShowDrivesComboBox.ItemIndex := Value;
end;

function TDirectoryTabDialog.GetShowFileType: Byte;
begin
  Result := ShowFileTypeComboBox.ItemIndex;
end;

procedure TDirectoryTabDialog.SetShowFileType(Value: Byte);
begin
  ShowFileTypeComboBox.ItemIndex := Value;
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
    ShowErrorMessage(LanguageDataModule.GetErrorMessage('EnterTabName'));
    TabNameEdit.SetFocus;
    Exit;
  end;
  if not System.SysUtils.DirectoryExists(RootDirectoryEdit.Text) then
  begin
    ShowErrorMessage(LanguageDataModule.GetErrorMessage('RootDirectoryNotExist'));
    RootDirectoryEdit.SetFocus;
    Exit;
  end;
  Result := True;
end;

end.
