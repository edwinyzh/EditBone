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
    FFindWhatOriginalText, FFindWhatSearchText: string;
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
    property FindWhatText: string read FFindWhatOriginalText;
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
  FFindWhatOriginalText := AFindWhatText;
  if ASearchCaseSensitive then
    FFindWhatSearchText :=  AFindWhatText
  else
    FFindWhatSearchText := UpperCase(AFindWhatText);
  FFileExtensions := AFileExtensions;
  FFileTypeText := AFileTypeText;
  FFolderText := AFolderText;
  FSearchCaseSensitive := ASearchCaseSensitive;
  FLookInSubfolders := ALookInSubfolders;
end;

{ Recursive method to find files. }
procedure TFindInFilesThread.FindInFiles(AFolderText: String);
var
  LFileHandle: THandle;
  LWin32FindData: TWin32FindData;
  LTextLine: string;
  FName: string;
  i: Integer;
  Found: Boolean;
  LStringList: TStringList;
  LTextPtr, LStartTextPtr, LFindWhatTextPtr, LBookmarkTextPtr: PChar;

  function IsDirectory(AWin32FindData: TWin32FindData): Boolean;
  var
    TmpAttr: DWORD;
  begin
    with AWin32FindData do
    begin
      TmpAttr := dwFileAttributes and (FILE_ATTRIBUTE_READONLY or FILE_ATTRIBUTE_HIDDEN or FILE_ATTRIBUTE_SYSTEM or FILE_ATTRIBUTE_ARCHIVE or FILE_ATTRIBUTE_NORMAL or FILE_ATTRIBUTE_DIRECTORY);

      Result := (TmpAttr and FILE_ATTRIBUTE_DIRECTORY = FILE_ATTRIBUTE_DIRECTORY);
    end;
  end;

begin
  {$WARNINGS OFF} { IncludeTrailingBackslash is specific to a platform }
  LFileHandle := FindFirstFile(PChar(IncludeTrailingBackslash(AFolderText) + '*.*'), LWin32FindData);
  {$WARNINGS ON}
  if LFileHandle <> INVALID_HANDLE_VALUE then
  try
    repeat
      if Assigned(FOnCancelSearch) and FOnCancelSearch then
      begin
        Terminate;
        Exit;
      end;
      FName := StrPas(LWin32FindData.cFileName);

      if (FName <> '.') and (FName <> '..') then
      begin
        if FLookInSubfolders and IsDirectory(LWin32FindData) then
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
            LStringList := GetStringList(IncludeTrailingBackslash(AFolderText) + FName);
            {$WARNINGS ON}
            try
              try
                if Trim(LStringList.Text) <> '' then
                for i := 0 to LStringList.Count - 1 do
                begin
                  LTextLine := LStringList.Strings[i];
                  if not FSearchCaseSensitive then
                    LTextLine := UpperCase(LTextLine);
                  LStartTextPtr := PChar(LTextLine);
                  LTextPtr := LStartTextPtr;
                  while LTextPtr^ <> #0 do
                  begin
                    if LTextPtr^ = PChar(FFindWhatSearchText)^ then { if the first character is a match }
                    begin
                      LFindWhatTextPtr := PChar(FFindWhatSearchText);
                      LBookmarkTextPtr := LTextPtr;
                      { check if the keyword found }
                      while (LTextPtr^ <> #0) and (LFindWhatTextPtr^ <> #0) and (LTextPtr^ = LFindWhatTextPtr^) do
                      begin
                        Inc(LTextPtr);
                        Inc(LFindWhatTextPtr);
                      end;
                      if LFindWhatTextPtr^ = #0 then
                      begin
                        if Assigned(FOnCancelSearch) and FOnCancelSearch then
                        begin
                          Terminate;
                          Exit;
                        end;
                        {$WARNINGS OFF} { IncludeTrailingBackslash is specific to a platform }
                        if Assigned(FOnAddTreeViewLine) then
                          FOnAddTreeViewLine(Self, IncludeTrailingBackslash(AFolderText) + FName, i, LBookmarkTextPtr - LStartTextPtr + 1,
                            LStringList.Strings[i], FFindWhatOriginalText);
                        {$WARNINGS ON}
                      end
                      else
                        LTextPtr := LBookmarkTextPtr; { not found, return pointer back }
                    end;
                    Inc(LTextPtr);
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
              LStringList.Free;
            end;
          end;
        end;
      end;
    until not Terminated and not FindNextFile(LFileHandle, LWin32FindData);
  finally
    Winapi.Windows.FindClose(LFileHandle);
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
