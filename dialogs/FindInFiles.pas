unit FindInFiles;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs, StdCtrls, ExtCtrls, Mask, JvExMask, JvToolEdit, JvExStdCtrls, JvCombobox, BCComboBox;

type
  TFindInFilesDialog = class(TForm)
    FindWhatLabel: TLabel;
    FindWhatComboBox: TBCComboBox;
    FileTypeLabel: TLabel;
    FileTypeComboBox: TBCComboBox;
    FolderLabel: TLabel;
    CaseSensitiveCheckBox: TBCCheckBox;
    LookInSubfoldersCheckBox: TBCCheckBox;
    FindButton: TButton;
    CancelButton: TButton;
    FolderDirectoryEdit: TJvDirectoryEdit;
    procedure FormDestroy(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FindWhatComboBoxKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    function GetFindWhatText: string;
    function GetFileTypeText: string;
    function GetFolderText: string;
    procedure SetFolderText(Value: string);
    function GetSearchCaseSensitive: Boolean;
    function GetLookInSubfolders: Boolean;
    procedure SetExtensions(Value: string);
  public
    { Public declarations }
    property FindWhatText: string read GetFindWhatText;
    property FileTypeText: string read GetFileTypeText;
    property FolderText: string read GetFolderText write SetFolderText;
    property SearchCaseSensitive: Boolean read GetSearchCaseSensitive;
    property LookInSubfolders: Boolean read GetLookInSubfolders;
    property Extensions: string write SetExtensions;
  end;

function FindInFilesDialog(Sender: TComponent): TFindInFilesDialog;

implementation

{$R *.dfm}

uses
  Common;

var
  FFindInFilesDialog: TFindInFilesDialog;

function FindInFilesDialog(Sender: TComponent): TFindInFilesDialog;
begin
  if FFindInFilesDialog = nil then
    FFindInFilesDialog:= TFindInFilesDialog.Create(Sender);
  Result := FFindInFilesDialog;
end;

procedure TFindInFilesDialog.FormDestroy(Sender: TObject);
begin
  FFindInFilesDialog := nil;
end;

function TFindInFilesDialog.GetFindWhatText: string;
begin
  Result := FindWhatComboBox.Text;
end;

function TFindInFilesDialog.GetFileTypeText: string;
begin
  Result := FileTypeComboBox.Text;
end;

function TFindInFilesDialog.GetFolderText: string;
begin
  Result := AddSlash(FolderDirectoryEdit.Text);
end;

procedure TFindInFilesDialog.SetFolderText(Value: string);
begin
  FolderDirectoryEdit.Text := Value;
end;

function TFindInFilesDialog.GetSearchCaseSensitive: Boolean;
begin
  Result := CaseSensitiveCheckBox.Checked;
end;

function TFindInFilesDialog.GetLookInSubfolders: Boolean;
begin
  Result := LookInSubfoldersCheckBox.Checked;
end;

procedure TFindInFilesDialog.FindWhatComboBoxKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  FindButton.Enabled := Trim(FindWhatComboBox.Text) <> '';
end;

procedure TFindInFilesDialog.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if ModalResult = mrOK then
    InsertTextToCombo(FindWhatComboBox);
end;

procedure TFindInFilesDialog.SetExtensions(Value: string);
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
