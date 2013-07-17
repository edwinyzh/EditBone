unit DuplicateCheckerOptions;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, BCDialogs.Dlg, Vcl.Dialogs, Vcl.ActnList, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, JvExStdCtrls,
  JvEdit, BCControls.Edit, Vcl.Mask, JvExMask, JvSpin, System.Actions, BCControls.ComboBox;

type
  TDuplicateCheckerOptionsDialog = class(TDialog)
    ButtonPanel: TPanel;
    OKButton: TButton;
    CancelButton: TButton;
    ButtonDividerPanel: TPanel;
    ActionList: TActionList;
    OKAction: TAction;
    ExcludeOtherBranchesAction: TAction;
    RootDirectoryClickAction: TAction;
    ContentPanel: TPanel;
    Content1Panel: TPanel;
    InputGroupBox: TGroupBox;
    Content3Panel: TPanel;
    OptionsGroupBox: TGroupBox;
    Content2Panel: TPanel;
    OutputGroupBox: TGroupBox;
    InputLeftPanel: TPanel;
    InputRightPanel: TPanel;
    OutputLeftPanel: TPanel;
    FileLabel: TLabel;
    OutputRightPanel: TPanel;
    LaunchAfterCreationCheckBox: TCheckBox;
    OptionsPanel: TPanel;
    OptionsLeftPanel: TPanel;
    MinBlockSizeLabel: TLabel;
    MinCharsLabel: TLabel;
    OptionsRightPanel: TPanel;
    MinBlockSizeSpinEdit: TJvSpinEdit;
    MinCharsSpinEdit: TJvSpinEdit;
    RemoveCommentsCheckBox: TCheckBox;
    FileEditPanel: TPanel;
    FileEdit: TBCEdit;
    FileBitBtn: TBitBtn;
    FileEditDividerPanel: TPanel;
    FolderButtonClickAction: TAction;
    FileButtonClickAction: TAction;
    FilderEditPanel: TPanel;
    FolderEdit: TBCEdit;
    FolderBitBtn: TBitBtn;
    FolderEditDividerPanel: TPanel;
    FolderPanel: TPanel;
    FolderLabel: TLabel;
    FileTypePanel: TPanel;
    FileTypeLabel: TLabel;
    FileTypeComboPanel: TPanel;
    FileTypeComboBox: TBCComboBox;
    procedure OKActionExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FolderButtonClickActionExecute(Sender: TObject);
    procedure FileButtonClickActionExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    function CheckFields: Boolean;
    function GetFileTypeText: string;
    function GetFolderName: string;
    function GetFileName: string;
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
  BCCommon.StyleHooks, BCCommon.Dialogs, BCCommon.Messages,
{$WARNINGS OFF}
  Vcl.FileCtrl, { warning: FileCtrl is specific to a platform }
{$WARNINGS ON}
  BCCommon.LanguageStrings, System.Math;

var
  FDuplicateCheckerOptionsDialog: TDuplicateCheckerOptionsDialog;

function DuplicateCheckerOptionsDialog: TDuplicateCheckerOptionsDialog;
begin
  if FDuplicateCheckerOptionsDialog = nil then
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
