unit OptionsFileTypes;

interface

uses
  System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, BCControls.Edit,
  Vcl.ExtCtrls, BCCommon.OptionsContainer;

type
  TFileTypesFrame = class(TFrame)
    FileTypesBottomPanel: TPanel;
    ExtensionsEdit: TBCEdit;
    FileTypesTopPanel: TPanel;
    FileTypesListBox: TListBox;
    ExtensionsLabel: TLabel;
    procedure FileTypesListBoxClick(Sender: TObject);
    procedure ExtensionsEditChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GetData(OptionsContainer: TEditBoneOptionsContainer);
    procedure PutData(OptionsContainer: TEditBoneOptionsContainer);
  end;

implementation

{$R *.dfm}

uses
  BCCommon.StringUtils, BCCommon.LanguageStrings;

procedure TFileTypesFrame.ExtensionsEditChange(Sender: TObject);
var
  Extensions: string;
begin
  if FileTypesListBox.ItemIndex = -1 then
    Exit;
  Extensions := FileTypesListBox.Items.Strings[FileTypesListBox.ItemIndex];
  Extensions := Copy(Extensions, 1, Pos('(', Extensions));
  FileTypesListBox.Items.Strings[FileTypesListBox.ItemIndex] := Format('%s%s)', [Extensions, ExtensionsEdit.Text]);
end;

procedure TFileTypesFrame.FileTypesListBoxClick(Sender: TObject);
begin
  if FileTypesListBox.ItemIndex = -1 then
    Exit;
  ExtensionsEdit.Text := StringBetween(FileTypesListBox.Items.Strings[FileTypesListBox.ItemIndex], '(', ')');
end;

procedure TFileTypesFrame.GetData(OptionsContainer: TEditBoneOptionsContainer);
var
  i: Integer;
  FileType: string;
begin
  FileTypesListBox.Clear;
  for i := 0 to OptionsContainer.FileTypes.Count - 1 do
  begin
    FileType := Trim(Copy(LanguageDataModule.FileTypesMultiStringHolder.MultipleStrings.Items[i].Strings.Text, 0,
      Pos('(', LanguageDataModule.FileTypesMultiStringHolder.MultipleStrings.Items[i].Strings.Text) - 1));
    FileTypesListBox.Items.Add(Format('%s (%s)', [
      FileType, StringBetween(OptionsContainer.FileTypes.Strings[i], '(', ')')]));
  end;
  FileTypesListBox.ItemIndex := 0;
  FileTypesListBoxClick(nil);
end;

procedure TFileTypesFrame.PutData(OptionsContainer: TEditBoneOptionsContainer);
var
  i: Integer;
  FileType: string;
begin
  OptionsContainer.FileTypes.Clear;
  for i := 0 to FileTypesListBox.Items.Count - 1 do
  begin
    FileType := Trim(Copy(LanguageDataModule.FileTypesMultiStringHolder.MultipleStrings.Items[i].Strings.Text, 0,
      Pos('(', LanguageDataModule.FileTypesMultiStringHolder.MultipleStrings.Items[i].Strings.Text) - 1));
    OptionsContainer.FileTypes.Add(Format('%s (%s)', [
      FileType, StringBetween(FileTypesListBox.Items.Strings[i], '(', ')')]));
  end;
end;

end.
