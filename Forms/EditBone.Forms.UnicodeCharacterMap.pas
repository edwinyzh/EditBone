unit EditBone.Forms.UnicodeCharacterMap;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Grids, Vcl.StdCtrls, Vcl.ActnList, EditBone.Frames.Document, System.Actions,
  BCControls.ComboBox, sComboBox, sFontCtrls, BCControls.Panel, sPanel, BCControls.Statusbar, sStatusBar;

const
  WM_AFTER_SHOW = WM_USER + 301; // custom message

type
  TUnicodeCharacterMapForm = class(TForm)
    ActionInsert: TAction;
    ActionList: TActionList;
    ComboBoxFont: TBCFontComboBox;
    Image: TImage;
    ImagePanelShape: TShape;
    PanelImage: TBCPanel;
    StatusBar: TBCStatusBar;
    StringGridCharacter: TStringGrid;
    procedure StringGridCharacterDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure StringGridCharacterClick(Sender: TObject);
    procedure ComboBoxFontChange(Sender: TObject);
    procedure StringGridCharacterMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure StringGridCharacterMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure FormResize(Sender: TObject);
    procedure ActionInsertExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FDocumentFrame: TDocumentFrame;
    FOnStartUp: Boolean;
    procedure ReadIniFile;
    procedure ReadSizePosIniFile;
    procedure UpdateFields;
    procedure WriteIniFile;
    procedure WMAfterShow(var Msg: TMessage); message WM_AFTER_SHOW;
  public
    procedure Open(DocumentFrame: TDocumentFrame);
  end;

function UnicodeCharacterMapForm: TUnicodeCharacterMapForm;

implementation

{$R *.dfm}

uses
  IniFiles, BCEditor.Editor, BCEditor.Editor.KeyCommands, BCCommon.FileUtils, BCCommon.Utils, BCCommon.Language.Utils;

var
  FUnicodeCharacterMapForm: TUnicodeCharacterMapForm;

function UnicodeCharacterMapForm: TUnicodeCharacterMapForm;
begin
  if not Assigned(FUnicodeCharacterMapForm) then
    Application.CreateForm(TUnicodeCharacterMapForm, FUnicodeCharacterMapForm);
  Result := FUnicodeCharacterMapForm;
end;

procedure TUnicodeCharacterMapForm.ComboBoxFontChange(Sender: TObject);
begin
  StringGridCharacter.Invalidate;
end;

procedure TUnicodeCharacterMapForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  WriteIniFile;
  Action := caFree;
end;

procedure TUnicodeCharacterMapForm.FormDestroy(Sender: TObject);
begin
  FUnicodeCharacterMapForm := nil;
end;

procedure TUnicodeCharacterMapForm.FormResize(Sender: TObject);
var
  ACharPos: Integer;
begin
  ACharPos := -1;
  with StringGridCharacter do
  begin
    if not FOnStartUp then
      ACharPos := Row * ColCount + Col;
    UpdateFields;
    if not FOnStartUp then
    begin
      Row := ACharPos div ColCount;
      Col := ACharPos - ColCount * Row;
    end;
  end;
end;

procedure TUnicodeCharacterMapForm.WMAfterShow(var Msg: TMessage);
begin
  ReadIniFile;
  UpdateFields;
  FOnStartUp := False;
end;

procedure TUnicodeCharacterMapForm.FormShow(Sender: TObject);
begin
  { Post the custom message WM_AFTER_SHOW to our form }
  if FOnStartUp then
    PostMessage(Self.Handle, WM_AFTER_SHOW, 0, 0);
end;

procedure TUnicodeCharacterMapForm.ActionInsertExecute(Sender: TObject);
var
  LEditor: TBCEditor;
  PC: PWideChar;
begin
  LEditor := FDocumentFrame.GetActiveEditor;
  if Assigned(LEditor) then
  begin
    New(PC);
    StringToWideChar(Chr(StringGridCharacter.ColCount * StringGridCharacter.Row + StringGridCharacter.Col), PC, 2);
    LEditor.ExecuteCommand(ecImeStr, #0, PC);
    Dispose(PC);
  end;
end;

procedure TUnicodeCharacterMapForm.Open(DocumentFrame: TDocumentFrame);
begin
  FOnStartUp := True;
  ComboBoxFont.DropDownCount := 16;
  FDocumentFrame := DocumentFrame;
  UpdateLanguage(Self, GetSelectedLanguage);
  ReadSizePosIniFile;
  Show;
end;

procedure TUnicodeCharacterMapForm.StringGridCharacterClick(Sender: TObject);
begin
  UpdateFields;
end;

function GetUnicodeBitmap(const UnicodeFont: string; const w: WideChar; const BitmapSize: Integer; var Size: TSize): TBitmap;
var
  MaxLogPalette: TMaxLogPalette;
begin
  MaxLogPalette.palVersion := $300;
  MaxLogPalette.palNumEntries := 2;
  with MaxLogPalette.palPalEntry[0] do
  begin
    peRed   := 0;
    peGreen := 0;
    peBlue  := 0;
    peFlags := 0
  end;

  with MaxLogPalette.palPalEntry[1] do
  begin
    peRed   := 255;
    peGreen := 255;
    peBlue  := 255;
    peFlags := 0
  end;

  Result := TBitmap.Create;

  Result.Height := BitmapSize;
  Result.Width  := BitmapSize;

  Result.Palette := CreatePalette(pLogPalette(@MaxLogPalette)^);

  Result.Canvas.Brush.Color := clWhite;
  Result.Canvas.FillRect(Result.Canvas.ClipRect);

  Result.Canvas.Font.Name := UnicodeFont;
  Result.Canvas.Font.Height := BitmapSize;

  GetTextExtentPoint32W(RESULT.Canvas.Handle, @w, 1, Size);

  TextOutW(Result.Canvas.Handle, (Result.Width - size.cx) DIV 2, 0, @w, 1)
end;

procedure TUnicodeCharacterMapForm.StringGridCharacterDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect;
  State: TGridDrawState);
var
  PC: PWideChar;
  Size: TSize;
begin
  if StringGridCharacter.ColCount * ARow + ACol > 65535 then
    Exit;

  New(PC);
  StringToWideChar(Chr(StringGridCharacter.ColCount * ARow + ACol), PC, 2);

  StringGridCharacter.Canvas.Font.Name := ComboBoxFont.Text;
  StringGridCharacter.Canvas.Font.Height := StringGridCharacter.DefaultRowHeight;

  GetTextExtentPoint32W(StringGridCharacter.Canvas.Handle, PC, 1, Size);

  TextOutW(StringGridCharacter.Canvas.Handle, (Rect.Left + Rect.Right - Size.cx) div 2,
    Rect.Top, PC, 1);
  Dispose(PC);
end;

procedure TUnicodeCharacterMapForm.StringGridCharacterMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  WC: WideChar;
  Size: TSize;
  Bitmap: TBitmap;
begin
  WC := WideChar(StringGridCharacter.ColCount * StringGridCharacter.Row + StringGridCharacter.Col);
  Bitmap := GetUnicodeBitmap(ComboBoxFont.Text, WC, Image.Height, Size);
  try
    Image.Picture.Graphic := Bitmap
  finally
    Bitmap.Free
  end;

  PanelImage.Left := X;
  PanelImage.Top := Y;
  { Adjust image panel inside string grid }
  if PanelImage.Left < StringGridCharacter.Left then
    PanelImage.Left := StringGridCharacter.Left + 10;
  if PanelImage.Left + PanelImage.Width > StringGridCharacter.Width then
    PanelImage.Left := StringGridCharacter.Width - PanelImage.Width - 20;
  if PanelImage.Top < StringGridCharacter.Top then
    PanelImage.Top := StringGridCharacter.Top + 10;
  if PanelImage.Top + PanelImage.Height > StringGridCharacter.Top + StringGridCharacter.Height then
    PanelImage.Top := StringGridCharacter.Top + StringGridCharacter.Height - PanelImage.Height - 10;

   PanelImage.Visible := True;
end;

procedure TUnicodeCharacterMapForm.StringGridCharacterMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  PanelImage.Visible := False;
end;

procedure TUnicodeCharacterMapForm.UpdateFields;
var
  i: Integer;
  s: string;
begin
  with StringGridCharacter do
  begin
    ColCount := (Width - 40) div DefaultColWidth;
    RowCount := (65535 div ColCount) + 1;
    Invalidate;
    s := '';
    i := ColCount * Row + Col;
  end;
  if i <= 65535 then
  begin
    s := IntToHex(i, 1);
    for i := 0 to 3 - Length(s) do
      s := '0' + s;
    s := 'U+' + s;
  end;
  StatusBar.SimpleText := s;
end;

procedure TUnicodeCharacterMapForm.ReadSizePosIniFile;
begin
  with TMemIniFile.Create(GetIniFilename) do
  try
    { Size }
    Width := ReadInteger('CharacterMapSize', 'Width', Width);
    Height := ReadInteger('CharacterMapSize', 'Height', Height);
    { Position }
    Left := ReadInteger('CharacterMapPosition', 'Left', (Screen.Width - Width) div 2);
    Top := ReadInteger('CharacterMapPosition', 'Top', (Screen.Height - Height) div 2);
    { Check if the form is outside the workarea }
    Left := SetFormInsideWorkArea(Left, Width);
  finally
    Free;
  end;
end;

procedure TUnicodeCharacterMapForm.ReadIniFile;
begin
  with TMemIniFile.Create(GetIniFilename) do
  try
    StringGridCharacter.Row := ReadInteger('CharacterMapPosition', 'Row', 0);
    StringGridCharacter.Col := ReadInteger('CharacterMapPosition', 'Col', 0);
    ComboBoxFont.Text := ReadString('CharacterMapPosition', 'FontName', 'Tahoma');
  finally
    Free;
  end;
end;

procedure TUnicodeCharacterMapForm.WriteIniFile;
begin
  if Windowstate = wsNormal then
  with TMemIniFile.Create(GetIniFilename) do
  try
    { Position }
    WriteInteger('CharacterMapPosition', 'Left', Left);
    WriteInteger('CharacterMapPosition', 'Top', Top);
    WriteInteger('CharacterMapPosition', 'Row', StringGridCharacter.Row);
    WriteInteger('CharacterMapPosition', 'Col', StringGridCharacter.Col);
    { Font name }
    WriteString('CharacterMapPosition', 'FontName', ComboBoxFont.Text);
    { Size }
    WriteInteger('CharacterMapSize', 'Width', Width);
    WriteInteger('CharacterMapSize', 'Height', Height);
  finally
    UpdateFile;
    Free;
  end;
end;

end.
