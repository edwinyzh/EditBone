unit EditBone.FindInFiles;

interface

uses
  System.Classes;

type
  TOnCancelSearch = function: Boolean of object;
  TOnAddTreeViewLine = procedure(Sender: TObject; Filename: WideString; Ln, Ch: LongInt; Text: WideString; SearchString: WideString) of object;

  TFindInFilesThread = class(TThread)
  private
    FOnCancelSearch: TOnCancelSearch;
    FOnProgressBarStep: TNotifyEvent;
    FOnAddTreeViewLine: TOnAddTreeViewLine;
    FFindWhatText: string;
    FFileExtensions: string;
    FFileTypeText: string;
    FFolderText: string;
    FSearchCaseSensitive: Boolean;
    FLookInSubfolders: Boolean;
    function GetStringList(AFilename: string): TStringList;
    procedure FindInFiles(AFolderText: String);
  public
    constructor Create(AFindWhatText, AFileTypeText, AFolderText: String; ASearchCaseSensitive, ALookInSubfolders: Boolean;
      AFileExtensions: string); overload;
    procedure Execute; override;
    property FindWhatText: string read FFindWhatText;
    property OnCancelSearch: TOnCancelSearch read FOnCancelSearch write FOnCancelSearch;
    property OnProgressBarStep: TNotifyEvent read FOnProgressBarStep write FOnProgressBarStep;
    property OnAddTreeViewLine: TOnAddTreeViewLine read FOnAddTreeViewLine write FOnAddTreeViewLine;
  end;

implementation

uses
  Winapi.Windows, System.SysUtils, BCControls.Utils, BCCommon.Language.Strings,
  BCEditor.Encoding, BCEditor.Editor.Utils;

procedure TFindInFilesThread.Execute;
begin
  Synchronize(procedure begin FindInFiles(FFolderText) end);
end;

constructor TFindInFilesThread.Create(AFindWhatText, AFileTypeText, AFolderText: String; ASearchCaseSensitive,
  ALookInSubfolders: Boolean; AFileExtensions: string);
begin
  inherited Create(True);
  FreeOnTerminate := True;
  FFindWhatText := AFindWhatText;
  FFileExtensions := AFileExtensions;
  FFileTypeText := AFileTypeText;
  FFolderText := AFolderText;
  FSearchCaseSensitive := ASearchCaseSensitive;
  FLookInSubfolders := ALookInSubfolders;
end;

{ Recursive method to find files. }
procedure TFindInFilesThread.FindInFiles(AFolderText: String);
var
  shFindFile: THandle;
  sWin32FD: TWin32FindData;
  S, Line: WideString;
  FName: string;
  Ln, Ch, ChPos: LongWord;
  Found: Boolean;
  StringList: TStringList;

  function IsDirectory(dWin32FD: TWin32FindData): Boolean;
  var
    TmpAttr: DWORD;
  begin
    with dWin32FD do
    begin
      TmpAttr := dwFileAttributes and (FILE_ATTRIBUTE_READONLY or FILE_ATTRIBUTE_HIDDEN or FILE_ATTRIBUTE_SYSTEM or FILE_ATTRIBUTE_ARCHIVE or FILE_ATTRIBUTE_NORMAL or FILE_ATTRIBUTE_DIRECTORY);

      Result := (TmpAttr and FILE_ATTRIBUTE_DIRECTORY = FILE_ATTRIBUTE_DIRECTORY);
    end;
  end;
begin
  {$WARNINGS OFF} { IncludeTrailingBackslash is specific to a platform }
  shFindFile := FindFirstFile(PChar(IncludeTrailingBackslash(AFolderText) + '*.*'), sWin32FD);
  {$WARNINGS ON}
  if shFindFile <> INVALID_HANDLE_VALUE then
  try
    repeat
      if Assigned(FOnCancelSearch) and FOnCancelSearch then
      begin
        Terminate;
        Exit;
      end;
      FName := StrPas(sWin32FD.cFileName);

      if (FName <> '.') and (FName <> '..') then
      begin
        if FLookInSubfolders and IsDirectory(sWin32FD) then
          {$WARNINGS OFF} { IncludeTrailingBackslash is specific to a platform }
          FindInFiles(IncludeTrailingBackslash(AFolderText) + FName)
          {$WARNINGS ON}
        else
        begin
          if Assigned(FOnProgressBarStep) then
            FOnProgressBarStep(Self);

          if (FFileTypeText = '*.*') and IsExtInFileType(ExtractFileExt(FName), FFileExtensions) or
            IsExtInFileType(ExtractFileExt(FName), FFileTypeText) then
          begin
            {$WARNINGS OFF} { IncludeTrailingBackslash is specific to a platform }
            StringList := GetStringList(IncludeTrailingBackslash(AFolderText) + FName);
            {$WARNINGS ON}
            try
              try
                // TODO: Use pointer and UpCase
                if Trim(StringList.Text) <> '' then
                for Ln := 0 to StringList.Count - 1 do
                begin
                  Found := True;
                  Line := StringList.Strings[Ln];
                  S := Line;
                  ChPos := 0;
                  while Found do
                  begin
                    if FSearchCaseSensitive then
                      Ch := Pos(WideString(FFindWhatText), S)
                    else
                      Ch := Pos(WideUpperCase(WideString(FFindWhatText)), WideUpperCase(S));
                    if Ch <> 0 then
                    begin
                      Found := True;
                      ChPos := ChPos + Ch;
                      if Assigned(FOnCancelSearch) and FOnCancelSearch then
                      begin
                        Terminate;
                        Exit;
                      end;
                      {$WARNINGS OFF} { IncludeTrailingBackslash is specific to a platform }
                      if Assigned(FOnAddTreeViewLine) then
                        FOnAddTreeViewLine(Self, IncludeTrailingBackslash(AFolderText) + FName, Ln, ChPos, Line, FFindWhatText);
                      {$WARNINGS ON}
                      S := Copy(S, Ch + LongWord(Length(FFindWhatText)), Length(S));
                      ChPos := ChPos + LongWord(Length(FFindWhatText)) - 1;
                    end
                    else
                      Found := False;
                  end;
                end
              except
                {$WARNINGS OFF}
                { IncludeTrailingBackslash is specific to a platform }
                if Assigned(FOnAddTreeViewLine) then
                  FOnAddTreeViewLine(Self, '', -1, 0, Format(LanguageDataModule.GetWarningMessage('FileAccessError'),
                    [IncludeTrailingBackslash(AFolderText) + FName]), '');
                {$WARNINGS ON}
              end;
            finally
              StringList.Free;
            end;
          end;
        end;
      end;
    until not Terminated and not FindNextFile(shFindFile, sWin32FD);
  finally
    Winapi.Windows.FindClose(shFindFile);
  end;
end;

function TFindInFilesThread.GetStringList(AFilename: string): TStringList;
var
  LFileStream: TFileStream;
  LBuffer: TBytes;
  WithBom: Boolean;
  LEncoding: System.SysUtils.TEncoding;
begin
  Result := TStringList.Create;
  LEncoding := nil;
  LFileStream := TFileStream.Create(AFileName, fmOpenRead);
  try
    // Identify encoding
    if IsUTF8(LFileStream, WithBom) then
    begin
      if WithBom then
        LEncoding := TEncoding.UTF8
      else
        LEncoding := BCEditor.Encoding.TEncoding.UTF8WithoutBOM;
    end
    else
    begin
      // Read file into buffer
      SetLength(LBuffer, LFileStream.Size);
      LFileStream.ReadBuffer(Pointer(LBuffer)^, Length(LBuffer));
      TEncoding.GetBufferEncoding(LBuffer, LEncoding);
    end;
  finally
    LFileStream.Free;
  end;
  Result.LoadFromFile(AFileName, LEncoding);
end;

end.
