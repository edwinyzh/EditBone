unit VirtualDrive;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, BCDialogs.Dlg,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, BCControls.ComboBox, BCControls.Edit, JvExControls, JvSpeedButton,
  Vcl.ExtCtrls, System.Actions, Vcl.ActnList;

type
  TVirtualDriveDialog = class(TDialog)
    ButtonPanel: TPanel;
    OKButton: TButton;
    CancelButton: TButton;
    ButtonDividerPanel: TPanel;
    TopPanel: TPanel;
    PathPanel: TPanel;
    PathLabel: TLabel;
    PathBitBtn: TJvSpeedButton;
    PathEdit: TBCEdit;
    DrivePanel: TPanel;
    DriveLabel: TLabel;
    DriveComboBox: TBCComboBox;
    ActionList: TActionList;
    FolderButtonClickAction: TAction;
    OKAction: TAction;
    procedure OKActionExecute(Sender: TObject);
    procedure FolderButtonClickActionExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FDrive: Char;
    FPath: string;
    function CheckFields: Boolean;
    function GetDrive: Char;
    function GetPath: string;
    procedure AddDrives;
  public
    { Public declarations }
    function Open(DialogType: TDialogType): Boolean;
    property Drive: Char read GetDrive write FDrive;
    property Path: string read GetPath write FPath;
  end;

function VirtualDriveDialog: TVirtualDriveDialog;

implementation

{$R *.dfm}

uses
  BCCommon.StyleUtils, BCCommon.LanguageStrings, Math, BCCommon.Messages,
  {$WARNINGS OFF}
  Vcl.FileCtrl { warning: FileCtrl is specific to a platform }
  {$WARNINGS ON};

var
  FVirtualDriveDialog: TVirtualDriveDialog;

function VirtualDriveDialog: TVirtualDriveDialog;
begin
  if not Assigned(FVirtualDriveDialog) then
    Application.CreateForm(TVirtualDriveDialog, FVirtualDriveDialog);
  Result := FVirtualDriveDialog;
  SetStyledFormSize(Result);
end;

procedure TVirtualDriveDialog.FolderButtonClickActionExecute(Sender: TObject);
var
  Dir: string;
begin
  Dir := PathEdit.Text;
  if Vcl.FileCtrl.SelectDirectory(LanguageDataModule.GetConstant('SelectRootDirectory'), '', Dir, [sdNewFolder, sdShowShares,
    sdNewUI, sdValidateDir], Self) then
    PathEdit.Text := Dir;
end;

procedure TVirtualDriveDialog.FormShow(Sender: TObject);
var
  LeftMaxWidth: Integer;
begin
  inherited;
  LeftMaxWidth := Max(DriveLabel.Width, PathLabel.Width) + 10;

  PathEdit.Left := LeftMaxWidth;
  PathEdit.Width := PathPanel.Width - PathEdit.Left - PathBitBtn.Width - 4;
  DriveComboBox.Left := LeftMaxWidth;
end;

procedure TVirtualDriveDialog.OKActionExecute(Sender: TObject);
begin
  inherited;
  if not CheckFields then
    Exit;
  ModalResult := mrOk;
end;

function TVirtualDriveDialog.Open(DialogType: TDialogType): Boolean;
begin
  if DialogType = dtOpen then
    Caption := LanguageDataModule.GetConstant('AddVirtualDrive')
  else
    Caption := LanguageDataModule.GetConstant('EditVirtualDrive');

  AddDrives;
  DriveComboBox.ItemIndex := DriveComboBox.Items.IndexOf(FDrive + ':');
  PathEdit.Text := FPath;

  Result := ShowModal = mrOk;
end;

function TVirtualDriveDialog.CheckFields: Boolean;
begin
  Result := False;
  if Trim(PathEdit.Text) = '' then
  begin
    ShowErrorMessage(LanguageDataModule.GetErrorMessage('EnterPath'));
    PathEdit.SetFocus;
    Exit;
  end;
  if not System.SysUtils.DirectoryExists(PathEdit.Text) then
  begin
    ShowErrorMessage(LanguageDataModule.GetErrorMessage('PathNotExist'));
    PathEdit.SetFocus;
    Exit;
  end;
  Result := True;
end;

procedure TVirtualDriveDialog.AddDrives;
var
  DriveBits: set of 0..25;
  DriveIndex: Integer;
  DriveLetter: Char;
begin
  DriveComboBox.Clear;
  Integer(DriveBits) := GetLogicalDrives;
  for  DriveIndex := 0 TO 25 DO
  begin
    DriveLetter := Chr(Ord('A') + DriveIndex);
    if not (DriveIndex in DriveBits) or (DriveLetter = FDrive) then
      DriveComboBox.Items.Add(DriveLetter + ':');
  end;
end;

function TVirtualDriveDialog.GetDrive: Char;
begin
  if Length(DriveComboBox.Text) > 0 then
    Result := DriveComboBox.Text[1]
  else
    Result := #0;
end;

function TVirtualDriveDialog.GetPath: string;
begin
  Result := PathEdit.Text;
end;

end.
