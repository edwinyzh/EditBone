unit OptionsFileTypes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, JvExStdCtrls, JvEdit, BCEdit,
  Vcl.ExtCtrls;

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
  end;

implementation

{$R *.dfm}

uses
  BCCommon.StringUtils;

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

end.
