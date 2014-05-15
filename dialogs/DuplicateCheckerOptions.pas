unit DuplicateCheckerOptions;

interface

uses
  System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, BCDialogs.Dlg, Vcl.Dialogs, Vcl.ActnList,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, BCControls.Edit, Vcl.Mask, JvExMask, JvSpin, System.Actions,
  BCControls.ComboBox, JvExControls, JvSpeedButton, BCControls.CheckBox, JvExStdCtrls, JvCheckBox;

type
  TDuplicateCheckerOptionsDialog = class(TDialog)
    ActionList: TActionList;
    ButtonDividerPanel: TPanel;
    ButtonPanel: TPanel;
    CancelButton: TButton;
    Content1Panel: TPanel;
    Content2Panel: TPanel;
    Content3Panel: TPanel;
    ContentPanel: TPanel;
    ExcludeOtherBranchesAction: TAction;
    FilderEditPanel: TPanel;
    FileButtonClickAction: TAction;
    FileEdit: TBCEdit;
    FileEditDividerPanel: TPanel;
    FileEditPanel: TPanel;
    FileLabel: TLabel;
    FileSpeedButton: TJvSpeedButton;
    FileTypeComboBox: TBCComboBox;
    FileTypeComboPanel: TPanel;
    FileTypeLabel: TLabel;
    FileTypePanel: TPanel;
    FolderBitBtn: TJvSpeedButton;
    FolderButtonClickAction: TAction;
    FolderEdit: TBCEdit;
    FolderEditDividerPanel: TPanel;
    FolderLabel: TLabel;
    FolderPanel: TPanel;
    InputGroupBox: TGroupBox;
    InputLeftPanel: TPanel;
    InputRightPanel: TPanel;
    LaunchAfterCreationCheckBox: TBCCheckBox;
    MinBlockSizeLabel: TLabel;
    MinBlockSizeSpinEdit: TJvSpinEdit;
    MinCharsLabel: TLabel;
    MinCharsSpinEdit: TJvSpinEdit;
    OKAction: TAction;
    OKButton: TButton;
    OptionsGroupBox: TGroupBox;
    OptionsLeftPanel: TPanel;
    OptionsPanel: TPanel;
    OptionsRightPanel: TPanel;
    OutputGroupBox: TGroupBox;
    OutputLeftPanel: TPanel;
    OutputRightPanel: TPanel;
    RemoveCommentsCheckBox: TBCCheckBox;
    RootDirectoryClickAction: TAction;
    procedure FileButtonClickActionExecute(Sender: TObject);
    procedure FolderButtonClickActionExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure OKActionExecute(Sender: TObject);
  private
    { Private declarations }
    function CheckFields: Boolean;
    function GetFileName: string;
    function GetFileTypeText: string;
    function GetFolderName: string;
    function GetLaunchAfterCreation: Boolean;
    function GetMinBlockSize: Byte;
    function GetMinChars: Byte;
    function GetRemoveComments: Boolean;
    procedure SetExtensions(Value: string);
  public
    { Public declarations }
    function Open: Boolean;
    property Extensions: string write SetExtensions;
    property FileTypeText: string read GetFileTypeText;
    property InputFolderName: string read GetFolderName;
    property OutputFileName: string read GetFileName;
    property LaunchAfterCreation: Boolean read GetLaunchAfterCreation;
    property MinBlockSize: Byte read GetMinBlockSize;
    property MinChars: Byte read GetMinChars;
    property RemoveComments: Boolean read GetRemoveComments;
  end;

function DuplicateCheckerOptionsDialog: TDuplicateCheckerOptionsDialog;

implementation

{$R *.dfm}

uses
  BCCommon.StyleUtils, BCCommon.Dialogs, BCCommon.Messages,
{$WARNINGS OFF}
  Vcl.FileCtrl, { warning: FileCtrl is specific to a platform }
{$WARNINGS ON}
  BCCommon.LanguageStrings, System.Math;

var
  FDuplicateCheckerOptionsDialog: TDuplicateCheckerOptionsDialog;

function DuplicateCheckerOptionsDialog: TDuplicateCheckerOptionsDialog;
begin
  if not Assigned(FDuplicateCheckerOptionsDialog) then
    Application.CreateForm(TDuplicateCheckerOptionsDialog, FDuplicateCheckerOptionsDialog);
  Result := FDuplicateCheckerOptionsDialog;
  SetStyledFormSize(Result);
end;

procedure TDuplicateCheckerOptionsDialog.OKActionExecute(Sender: TObject);
begin
  if not CheckFields then
    Exit;
  ModalResult := mrOk;
end;

function TDuplicateCheckerOptionsDialog.CheckFields: Boolean;
begin
  Result := False;
  { Input }
  if Trim(FolderEdit.Text) = '' then
  begin
    ShowErrorMessage(LanguageDataModule.GetErrorMessage('EnterFolderName'));
    FolderEdit.SetFocus;
    Exit;
  end;
  if not System.SysUtils.DirectoryExists(FolderEdit.Text) then
  begin
    ShowErrorMessage(LanguageDataModule.GetErrorMessage('FolderDirectoryNotExist'));
    FolderEdit.SetFocus;
    Exit;
  end;
  { Output }
  if Trim(FileEdit.Text) = '' then
  begin
    ShowErrorMessage(LanguageDataModule.GetErrorMessage('EnterFileName'));
    FileEdit.SetFocus;
    Exit;
  end;
  if not System.SysUtils.DirectoryExists(ExtractFilePath(FileEdit.Text)) then
  begin
    ShowErrorMessage(LanguageDataModule.GetErrorMessage('FileDirectoryNotExist'));
    FileEdit.SetFocus;
    Exit;
  end;
  Result := True;
end;

function TDuplicateCheckerOptionsDialog.Open: Boolean;
begin
  Result := ShowModal = mrOk;
end;

procedure TDuplicateCheckerOptionsDialog.FileButtonClickActionExecute(Sender: TObject);
var
  FilterIndex: Cardinal;
begin
  if BCCommon.Dialogs.SaveFile(Handle, '', Format('%s'#0'*.*'#0#0, [LanguageDataModule.GetConstant('AllFiles')]),
    LanguageDataModule.GetConstant('SaveAs'), FilterIndex) then
  begin
    Application.ProcessMessages; { style fix }
    FileEdit.Text := BCCommon.Dialogs.Files[0];
  end;
end;

procedure TDuplicateCheckerOptionsDialog.FolderButtonClickActionExecute(Sender: TObject);
var
  Dir: string;
begin
  Dir := FolderEdit.Text;
  if Vcl.FileCtrl.SelectDirectory(LanguageDataModule.GetConstant('SelectRootDirectory'), '', Dir, [sdNewFolder, sdShowShares,
    sdNewUI, sdValidateDir], Self) then
    FolderEdit.Text := Dir;
end;

function TDuplicateCheckerOptionsDialog.GetFolderName: string;
begin
  Result := FolderEdit.Text;
end;

procedure TDuplicateCheckerOptionsDialog.FormDestroy(Sender: TObject);
begin
  inherited;
  FDuplicateCheckerOptionsDialog := nil;
end;

procedure TDuplicateCheckerOptionsDialog.FormShow(Sender: TObject);
var
  MaxWidth: Integer;
begin
  { Width fix for languages }
  InputLeftPanel.AutoSize := True;
  OutputLeftPanel.AutoSize := True;
  OptionsLeftPanel.AutoSize := True;
  InputLeftPanel.AutoSize := False;
  OutputLeftPanel.AutoSize := False;
  OptionsLeftPanel.AutoSize := False;
  MaxWidth := Max(Max(InputLeftPanel.Width, OutputLeftPanel.Width), OptionsLeftPanel.Width);
  InputLeftPanel.Width := MaxWidth;
  OutputLeftPanel.Width := MaxWidth;
  OptionsLeftPanel.Width := MaxWidth;
end;

function TDuplicateCheckerOptionsDialog.GetFileName: string;
begin
  Result := FileEdit.Text;
end;

function TDuplicateCheckerOptionsDialog.GetLaunchAfterCreation: Boolean;
begin
  Result := LaunchAfterCreationCheckBox.Checked;
end;

function TDuplicateCheckerOptionsDialog.GetMinBlockSize: Byte;
begin
  Result := StrToInt(MinBlockSizeSpinEdit.Text);
end;

function TDuplicateCheckerOptionsDialog.GetMinChars: Byte;
begin
  Result := StrToInt(MinCharsSpinEdit.Text);
end;

function TDuplicateCheckerOptionsDialog.GetRemoveComments: Boolean;
begin
  Result := RemoveCommentsCheckBox.Checked;
end;

function TDuplicateCheckerOptionsDialog.GetFileTypeText: string;
begin
  Result := FileTypeComboBox.Text;
end;

procedure TDuplicateCheckerOptionsDialog.SetExtensions(Value: string);
var
  Temp: string;
begin
  Temp := Value;
  with FileTypeComboBox.Items do
  begin
    Clear;
    while Pos('|', Temp) <> 0 do
    begin
      Add(Copy(Temp, 1, Pos('|', Temp) - 1));
      Temp := Copy(Temp, Pos('|', Temp) + 1, Length(Temp));
    end;
  end;
end;

end.
