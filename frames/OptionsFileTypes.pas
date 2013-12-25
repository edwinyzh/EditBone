unit OptionsFileTypes;

interface

uses
  System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, BCControls.Edit,
  Vcl.ExtCtrls, BCCommon.OptionsContainer, BCFrames.OptionsFrame;

type
  TOptionsFileTypesFrame = class(TOptionsFrame)
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
    destructor Destroy; override;
    procedure GetData; override;
    procedure PutData; override;
  end;

function OptionsFileTypesFrame(AOwner: TComponent): TOptionsFileTypesFrame;

implementation

{$R *.dfm}

uses
  BCCommon.StringUtils, BCCommon.LanguageStrings;

var
  FOptionsFileTypesFrame: TOptionsFileTypesFrame;

function OptionsFileTypesFrame(AOwner: TComponent): TOptionsFileTypesFrame;
begin
  if not Assigned(FOptionsFileTypesFrame) then
    FOptionsFileTypesFrame := TOptionsFileTypesFrame.Create(AOwner);
  Result := FOptionsFileTypesFrame;
end;

destructor TOptionsFileTypesFrame.Destroy;
begin
  inherited;
  FOptionsFileTypesFrame := nil;
end;

procedure TOptionsFileTypesFrame.ExtensionsEditChange(Sender: TObject);
var
  Extensions: string;
begin
  if FileTypesListBox.ItemIndex = -1 then
    Exit;
  Extensions := FileTypesListBox.Items.Strings[FileTypesListBox.ItemIndex];
  Extensions := Copy(Extensions, 1, Pos('(', Extensions));
  FileTypesListBox.Items.Strings[FileTypesListBox.ItemIndex] := Format('%s%s)', [Extensions, ExtensionsEdit.Text]);
end;

procedure TOptionsFileTypesFrame.FileTypesListBoxClick(Sender: TObject);
begin
  if FileTypesListBox.ItemIndex = -1 then
    Exit;
  ExtensionsEdit.Text := StringBetween(FileTypesListBox.Items.Strings[FileTypesListBox.ItemIndex], '(', ')');
end;

procedure TOptionsFileTypesFrame.GetData;
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

procedure TOptionsFileTypesFrame.PutData;
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
