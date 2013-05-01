unit UnicodeCharacterMap;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Grids, Vcl.StdCtrls;

type
  TUnicodeCharacterMapForm = class(TForm)
    StatusBar: TStatusBar;
    Panel: TPanel;
    StringGridCharacter: TStringGrid;
    ImagePanel: TPanel;
    Image1: TImage;
    LabelFont: TLabel;
    ComboBoxFonts: TComboBox;
    Button1: TButton;
    Button2: TButton;
    procedure StringGridCharacterDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect;
      State: TGridDrawState);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure StringGridCharacterClick(Sender: TObject);
  private
    { Private declarations }
    procedure UpdateFields;
  public
    { Public declarations }
    procedure Open;
  end;

function UnicodeCharacterMapForm: TUnicodeCharacterMapForm;

implementation

{$R *.dfm}

var
  FUnicodeCharacterMapForm: TUnicodeCharacterMapForm;

function UnicodeCharacterMapForm: TUnicodeCharacterMapForm;
begin
  if FUnicodeCharacterMapForm = nil then
    Application.CreateForm(TUnicodeCharacterMapForm, FUnicodeCharacterMapForm);
  Result := FUnicodeCharacterMapForm;
end;

procedure TUnicodeCharacterMapForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TUnicodeCharacterMapForm.FormDestroy(Sender: TObject);
begin
  FUnicodeCharacterMapForm := nil;
end;

procedure TUnicodeCharacterMapForm.Open;
begin
  UpdateFields;
  Show;
end;

procedure TUnicodeCharacterMapForm.StringGridCharacterClick(Sender: TObject);
begin
  UpdateFields;
end;

procedure TUnicodeCharacterMapForm.StringGridCharacterDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect;
  State: TGridDrawState);
var
  WC: WideChar;
  Size: TSize;
begin
  if 20 * ARow + ACol > 65535 then
    Exit;

  WC :=  WideChar(20 * ARow + ACol);

  StringGridCharacter.Canvas.Font.Name := 'Arial';
  StringGridCharacter.Canvas.Font.Height := StringGridCharacter.DefaultRowHeight;

  GetTextExtentPoint32W(StringGridCharacter.Canvas.Handle, @WC, 1, Size);

  TextOutW(StringGridCharacter.Canvas.Handle, (Rect.Left + Rect.Right - Size.cx) div 2,
    Rect.Top, @WC, 1)
end;

procedure TUnicodeCharacterMapForm.UpdateFields;
var
  i: Integer;
  s: string;
begin
  s := '';
  i := 20 * StringGridCharacter.Row + StringGridCharacter.Col;
  if i <= 65535 then
  begin
    s := IntToHex(i, 1);
    for i := 0 to 3 - Length(s) do
      s := '0' + s;
    s := 'U+' + s;
  end;
  StatusBar.SimpleText := s;
end;

end.
