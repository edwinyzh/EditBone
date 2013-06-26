unit DuplicateCheckerOptions;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Dlg, Vcl.Dialogs, Vcl.ActnList, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, JvExStdCtrls,
  JvEdit, BCEdit, Vcl.Mask, JvExMask, JvSpin, System.Actions;

type
  TDuplicateCheckerOptionsDialog = class(TDialog)
    ButtonPanel: TPanel;
    OKButton: TButton;
    CancelButton: TButton;
    Panel1: TPanel;
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
    FolderLabel: TLabel;
    InputRightPanel: TPanel;
    FolderEdit: TBCEdit;
    FolderBitBtn: TBitBtn;
    OutputLeftPanel: TPanel;
    FileLabel: TLabel;
    OutputRightPanel: TPanel;
    LaunchAfterCreationCheckBox: TCheckBox;
    Panel2: TPanel;
    OptionsLeftPanel: TPanel;
    MinBlockSizeLabel: TLabel;
    MinCharsLabel: TLabel;
    OptionsRightPanel: TPanel;
    MinBlockSizeSpinEdit: TJvSpinEdit;
    MinCharsSpinEdit: TJvSpinEdit;
    RemoveCommentsCheckBox: TCheckBox;
    Panel3: TPanel;
    FileEdit: TBCEdit;
    FileBitBtn: TBitBtn;
    Panel4: TPanel;
    Panel5: TPanel;
    FolderButtonClickAction: TAction;
    FileButtonClickAction: TAction;
    procedure OKActionExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FolderButtonClickActionExecute(Sender: TObject);
    procedure FileButtonClickActionExecute(Sender: TObject);
  private
    { Private declarations }
    function CheckFields: Boolean;
    function GetFolderName: string;
    function GetFileName: string;
    function GetLaunchAfterCreation: Boolean;
    function GetMinBlockSize: Byte;
    function GetMinChars: Byte;
    function GetRemoveComments: Boolean;
  public
    { Public declarations }
    function Open: Boolean;
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
  Common, StyleHooks, CommonDialogs,
{$WARNINGS OFF}
  Vcl.FileCtrl, { warning: FileCtrl is specific to a platform }
{$WARNINGS ON}
  Language, Math;

var
  FDuplicateCheckerOptionsDialog: TDuplicateCheckerOptionsDialog;

function DuplicateCheckerOptionsDialog: TDuplicateCheckerOptionsDialog;
begin
  if FDuplicateCheckerOptionsDialog = nil then
    Application.CreateForm(TDuplicateCheckerOptionsDialog, FDuplicateCheckerOptionsDialog);
  Result := FDuplicateCheckerOptionsDialog;
  StyleHooks.SetStyledFormSize(Result);
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
    Common.ShowErrorMessage(LanguageDataModule.GetErrorMessage('EnterFolderName'));
    FolderEdit.SetFocus;
    Exit;
  end;
  if not System.SysUtils.DirectoryExists(FolderEdit.Text) then
  begin
    Common.ShowErrorMessage(LanguageDataModule.GetErrorMessage('FolderDirectoryNotExist'));
    FolderEdit.SetFocus;
    Exit;
  end;
  { Output }
  if Trim(FileEdit.Text) = '' then
  begin
    Common.ShowErrorMessage(LanguageDataModule.GetErrorMessage('EnterFileName'));
    FileEdit.SetFocus;
    Exit;
  end;
  if not System.SysUtils.DirectoryExists(ExtractFilePath(FileEdit.Text)) then
  begin
    Common.ShowErrorMessage(LanguageDataModule.GetErrorMessage('FileDirectoryNotExist'));
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
  if CommonDialogs.SaveFile(Handle, '', Format('%s'#0'*.*'#0#0, [LanguageDataModule.GetConstant('AllFiles')]),
    LanguageDataModule.GetConstant('SaveAs'), FilterIndex) then
  begin
    Application.ProcessMessages; { style fix }
    FileEdit.Text := CommonDialogs.Files[0];
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

end.
