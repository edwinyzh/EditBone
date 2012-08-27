unit Replace;

{$I SynEdit.inc}

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Controls,
  Vcl.Forms, Vcl.Dialogs, StdCtrls, ExtCtrls, JvExStdCtrls, JvCombobox, BCComboBox;

type
  TReplaceDialog = class(TForm)
    ReplaceWithLabel: TLabel;
    ReplaceWithComboBox: TBCComboBox;
    SearchForLabel: TLabel;
    SearchForComboBox: TBCComboBox;
    OptionsGroupBox: TGroupBox;
    CaseSensitiveCheckBox: TBCCheckBox;
    WholeWordsCheckBox: TBCCheckBox;
    ReplaceInRadioGroup: TRadioGroup;
    FindButton: TButton;
    CancelButton: TButton;
    ReplaceAllButton: TButton;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure SearchForComboBoxKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    function GetReplaceText: string;
    function GetSearchCaseSensitive: Boolean;
    function GetSearchText: string;
    function GetSearchWholeWords: Boolean;
    function GetReplaceInWholeFile: Boolean;
  public
    property SearchCaseSensitive: Boolean read GetSearchCaseSensitive;
    property SearchWholeWords: Boolean read GetSearchWholeWords;
    property SearchText: string read GetSearchText;
    property ReplaceText: string read GetReplaceText;
    property ReplaceInWholeFile: Boolean read GetReplaceInWholeFile;
  end;

function ReplaceDialog(Sender: TComponent): TReplaceDialog;

implementation

{$R *.DFM}

uses
  Common;

var
  FReplaceDialog: TReplaceDialog;

function ReplaceDialog(Sender: TComponent): TReplaceDialog;
begin
  if FReplaceDialog = nil then
    FReplaceDialog := TReplaceDialog.Create(Sender);
  Result := FReplaceDialog;
end;

procedure TReplaceDialog.FormDestroy(Sender: TObject);
begin
  FReplaceDialog := nil;
end;

function TReplaceDialog.GetReplaceText: string;
begin
  Result := ReplaceWithComboBox.Text;
end;

function TReplaceDialog.GetSearchCaseSensitive: Boolean;
begin
  Result := CaseSensitiveCheckBox.Checked;
end;

function TReplaceDialog.GetSearchText: string;
begin
  Result := SearchForComboBox.Text;
end;

function TReplaceDialog.GetSearchWholeWords: Boolean;
begin
  Result := WholeWordsCheckBox.Checked;
end;

procedure TReplaceDialog.SearchForComboBoxKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  FindButton.Enabled := (Trim(SearchForComboBox.Text) <> '');
  ReplaceAllButton.Enabled := FindButton.Enabled;
end;

function TReplaceDialog.GetReplaceInWholeFile: Boolean;
begin
  Result := ReplaceInRadioGroup.ItemIndex = 0;
end;

procedure TReplaceDialog.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
  if ModalResult = mrOK then
  begin
    InsertTextToCombo(SearchForComboBox);
    InsertTextToCombo(ReplaceWithComboBox);
  end;
end;

end.

 