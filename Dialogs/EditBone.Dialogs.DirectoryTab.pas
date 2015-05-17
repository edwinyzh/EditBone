unit EditBone.Dialogs.DirectoryTab;

interface

uses
  System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, BCCommon.Dialogs.Base, Vcl.StdCtrls, BCControls.Edit,
  Vcl.ActnList, Vcl.ExtCtrls, Vcl.Buttons, System.Actions, BCControls.ComboBox,
  sComboBox, sEdit, sSpeedButton, BCControls.SpeedButton, BCControls.Panel,
  sPanel, sGroupBox, BCControls.GroupBox, sLabel, acSlider;

type
  TDirectoryTabDialog = class(TBCBaseDialog)
    ActionExcludeOtherBranches: TAction;
    ActionList: TActionList;
    ActionOK: TAction;
    ActionRootDirectoryClick: TAction;
    BitBtnRootDrectory: TBCSpeedButton;
    ButtonCancel: TButton;
    ButtonOK: TButton;
    ButtonPanel: TBCPanel;
    ComboBoxDrives: TBCComboBox;
    ComboBoxFileMask: TBCComboBox;
    EditRootDirectory: TBCEdit;
    EditTabName: TBCEdit;
    GroupBoxOptions: TBCGroupBox;
    PanelRootDirectoryAndButton: TBCPanel;
    SliderExcludeOtherBranches: TsSlider;
    StickyLabelExcludeOtherBranches: TsStickyLabel;
    procedure ActionExcludeOtherBranchesExecute(Sender: TObject);
    procedure ActionOKExecute(Sender: TObject);
    procedure ActionRootDirectoryClickExecute(Sender: TObject);
  private
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
    function Open(DialogType: TDialogType): Boolean;
    property ExcludeOtherBranches: Boolean read GetExcludeOtherBranches write SetExcludeOtherBranches;
    property RootDirectory: string read GetRootDirectory write SetRootDirectory;
    property ShowDrives: Byte read GetShowDrives write SetShowDrives;
    property ShowFileType: Byte read GetShowFileType write SetShowFileType;
    property TabName: string read GetTabName write SetTabName;
  end;

implementation

{$R *.dfm}

uses
  Math,
{$WARNINGS OFF}
  Vcl.FileCtrl, { FileCtrl is specific to a platform }
{$WARNINGS ON}
  BCCommon.Language.Strings, BCCommon.Messages;

procedure TDirectoryTabDialog.ActionOKExecute(Sender: TObject);
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

  AddConstants(ComboBoxDrives);
  AddConstants(ComboBoxFileMask);

  Result := ShowModal = mrOk;
end;

procedure TDirectoryTabDialog.ActionRootDirectoryClickExecute(Sender: TObject);
var
  Dir: string;
begin
  Dir := EditRootDirectory.Text;
  if Vcl.FileCtrl.SelectDirectory(LanguageDataModule.GetConstant('SelectRootDirectory'), '', Dir, [sdNewFolder, sdShowShares,
    sdNewUI, sdValidateDir], Self) then
    EditRootDirectory.Text := Dir;
end;

function TDirectoryTabDialog.GetTabName: string;
begin
  Result := EditTabName.Text;
end;

procedure TDirectoryTabDialog.SetTabName(Value: string);
begin
  EditTabName.Text := Value;
end;

procedure TDirectoryTabDialog.ActionExcludeOtherBranchesExecute(Sender: TObject);
begin
  if SliderExcludeOtherBranches.SliderOn then
    ComboBoxDrives.ItemIndex := 0;
  ComboBoxDrives.ReadOnly := SliderExcludeOtherBranches.SliderOn;
end;

function TDirectoryTabDialog.GetRootDirectory: string;
begin
  Result := EditRootDirectory.Text;
end;

procedure TDirectoryTabDialog.SetRootDirectory(Value: string);
begin
  EditRootDirectory.Text := Value;
end;

function TDirectoryTabDialog.GetShowDrives: Byte;
begin
  Result := ComboBoxDrives.ItemIndex;
end;

procedure TDirectoryTabDialog.SetShowDrives(Value: Byte);
begin
  ComboBoxDrives.ItemIndex := Value;
end;

function TDirectoryTabDialog.GetShowFileType: Byte;
begin
  Result := ComboBoxFileMask.ItemIndex;
end;

procedure TDirectoryTabDialog.SetShowFileType(Value: Byte);
begin
  ComboBoxFileMask.ItemIndex := Value;
end;

function TDirectoryTabDialog.GetExcludeOtherBranches: Boolean;
begin
  Result := SliderExcludeOtherBranches.SliderOn;
end;

procedure TDirectoryTabDialog.SetExcludeOtherBranches(Value: Boolean);
begin
  SliderExcludeOtherBranches.SliderOn := Value;
end;

function TDirectoryTabDialog.CheckFields: Boolean;
begin
  Result := False;
  if Trim(EditTabName.Text) = '' then
  begin
    ShowErrorMessage(LanguageDataModule.GetErrorMessage('EnterTabName'));
    EditTabName.SetFocus;
    Exit;
  end;
  if not System.SysUtils.DirectoryExists(EditRootDirectory.Text) then
  begin
    ShowErrorMessage(LanguageDataModule.GetErrorMessage('RootDirectoryNotExist'));
    EditRootDirectory.SetFocus;
    Exit;
  end;
  Result := True;
end;

end.
