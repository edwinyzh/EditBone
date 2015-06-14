unit EditBone.Frames.Options.Editor.Defaults;

interface

uses
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, BCControls.ComboBox, Vcl.ExtCtrls,
  BCCommon.Options.Container, BCCommon.Frames.Options.Base, sComboBox, BCControls.Panel, sPanel, sFrameAdapter;

type
  TOptionsEditorDefaultsFrame = class(TBCOptionsBaseFrame)
    ComboBoxDefaultColor: TBCComboBox;
    ComboBoxDefaultEncoding: TBCComboBox;
    ComboBoxDefaultHighlighter: TBCComboBox;
    Panel: TBCPanel;
    ComboBoxDefaultSQLHighlighter: TBCComboBox;
  private
    procedure GetSQLHighlighterItems;
  protected
    procedure Init; override;
    procedure GetData; override;
    procedure PutData; override;
  public
    destructor Destroy; override;
  end;

function OptionsEditorDefaultsFrame(AOwner: TComponent): TOptionsEditorDefaultsFrame;

implementation

{$R *.dfm}

uses
  Winapi.Windows, System.SysUtils, BCCommon.Language.Strings;

var
  FOptionsEditorDefaultsFrame: TOptionsEditorDefaultsFrame;

function OptionsEditorDefaultsFrame(AOwner: TComponent): TOptionsEditorDefaultsFrame;
begin
  if not Assigned(FOptionsEditorDefaultsFrame) then
    FOptionsEditorDefaultsFrame := TOptionsEditorDefaultsFrame.Create(AOwner);
  Result := FOptionsEditorDefaultsFrame;
end;

destructor TOptionsEditorDefaultsFrame.Destroy;
begin
  inherited;
  FOptionsEditorDefaultsFrame := nil;
end;

procedure TOptionsEditorDefaultsFrame.GetSQLHighlighterItems;
var
  FindFileHandle: THandle;
  Win32FindData: TWin32FindData;
  FileName: string;
begin
  ComboBoxDefaultSQLHighlighter.Items.Clear;
{$WARNINGS OFF}
  FindFileHandle := FindFirstFile(PChar(IncludeTrailingBackSlash(ExtractFilePath(Application.ExeName)) +
    'Highlighters\*.json'), Win32FindData);
{$WARNINGS ON}
  if FindFileHandle <> INVALID_HANDLE_VALUE then
  try
    repeat
      FileName := ExtractFileName(StrPas(Win32FindData.cFileName));
      FileName := Copy(FileName, 1, Pos('.', FileName) - 1);
      if Pos('SQL', FileName) <> 0 then
        ComboBoxDefaultSQLHighlighter.Items.Add(FileName);
    until not FindNextFile(FindFileHandle, Win32FindData);
  finally
    Winapi.Windows.FindClose(FindFileHandle);
  end;
end;

procedure TOptionsEditorDefaultsFrame.Init;
begin
  ComboBoxDefaultColor.Items := OptionsContainer.ColorStrings;
  ComboBoxDefaultEncoding.Items := OptionsContainer.EncodingStrings;
  ComboBoxDefaultHighlighter.Items := OptionsContainer.HighlighterStrings;
  GetSQLHighlighterItems;
end;

procedure TOptionsEditorDefaultsFrame.GetData;
begin
  ComboBoxDefaultColor.ItemIndex := ComboBoxDefaultColor.IndexOf(OptionsContainer.DefaultColor);
  ComboBoxDefaultEncoding.ItemIndex := OptionsContainer.DefaultEncoding;
  ComboBoxDefaultHighlighter.ItemIndex := ComboBoxDefaultHighlighter.IndexOf(OptionsContainer.DefaultHighlighter);
  ComboBoxDefaultSQLHighlighter.ItemIndex := ComboBoxDefaultSQLHighlighter.IndexOf(OptionsContainer.DefaultSQLHighlighter);
end;

procedure TOptionsEditorDefaultsFrame.PutData;
begin
  OptionsContainer.DefaultColor := ComboBoxDefaultColor.Text;
  OptionsContainer.DefaultEncoding := ComboBoxDefaultEncoding.ItemIndex;
  OptionsContainer.DefaultHighlighter := ComboBoxDefaultHighlighter.Text;
  OptionsContainer.DefaultSQLHighlighter := ComboBoxDefaultSQLHighlighter.Text;
end;

end.
