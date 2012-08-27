unit Common;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  StdCtrls, Winapi.Windows, Winapi.Messages, ComCtrls, jvStringGrid, BCComboBox;

const
  CAPTION_ERRORS = 'Errors';

type
  {TOutputObject = class
    Filename: string;
    Ln, Ch: Integer;
    Text: string;
  end; }

  POutputRec = ^TOutputRec;
  TOutputRec = packed record
    Level: Byte;
    Filename: string;
    Ln: LongWord;
    Ch: LongWord;
    TextCh: LongWord;
    Text: ShortString;
    SearchString: ShortString;
  end;

function BrowseURL(const URL: string): Boolean;
function GetOSInfo: string;
procedure InsertTextToCombo(ComboBox: TBCComboBox);
function AddSlash(Path: string): string;
function StringBetween(Str: string; SubStr1: string; SunStr2: string): string;
function IsAsciiFile(Filename: string): Boolean;
function SaveChanges(IncludeCancel: Boolean = True): Integer;
function WideUpperCase(const S: WideString): WideString;
procedure AutoSizeCol(Grid: TJvStringGrid);
procedure ShowMessage(Msg: string);
procedure ShowErrorMessage(Msg: string);
procedure ShowWarningMessage(Msg: string);
function AskYesOrNo(Msg: string): Boolean;

implementation

uses
  Registry, ShellAPI, System.SysUtils, Dialogs, Main, Controls;

function StringBetween(Str: string; SubStr1: string; SunStr2: string): string;
begin
  Result := Str;
  Result := Copy(Result, Pos(SubStr1, Result) + 1, Length(Result));
  Result := Copy(Result, 1, Pos(SunStr2, Result) - 1);
end;

procedure RunCommand(const Cmd, Params: String);
var
  SI: TStartupInfo;
  PI: TProcessInformation;
  CmdLine: String;
begin
  //Fill record with zero byte values
  FillChar(SI, SizeOf(SI), 0);
  //Set mandatory record field
  SI.cb := SizeOf(SI);
  //Ensure Windows mouse cursor reflects launch progress
  SI.dwFlags := StartF_ForceOnFeedback;
  //Set up command line
  CmdLine := Cmd;
  if Length(Params) > 0 then
    CmdLine := CmdLine + #32 + Params;
  //Try and launch child process. Raise exception on failure
  Win32Check(CreateProcess(nil, PChar(CmdLine), nil, nil, False, 0, nil, nil, SI, PI));
  //Wait until process has started its main message loop
  WaitForInputIdle(PI.hProcess, Infinite);
  //Close process and thread handles
  CloseHandle(PI.hThread);
  CloseHandle(PI.hProcess);
end;

function BrowseURL(const URL: string): Boolean;
var
  Browser: string;
begin
  Result := True;
  Browser := '';
  with TRegistry.Create do
  try
    RootKey := HKEY_CLASSES_ROOT;
    Access := KEY_QUERY_VALUE;
    if OpenKey('\htmlfile\shell\open\command', False) then
      Browser := ReadString('');
    CloseKey;
  finally
    Free;
  end;
  if Browser = '' then
  begin
    Result := False;
    Exit;
  end;
  Browser := Copy(Browser, Pos('"', Browser) + 1, Length(Browser));
  Browser := Copy(Browser, 1, Pos('"', Browser) - 1);
  //ShellExecute(0, 'open', PChar(Browser), PChar(URL), nil, SW_SHOW);
  RunCommand(Browser, URL);
end;

function GetOSInfo: string;
var
  OS: TOSVersionInfo;
begin
  OS.dwOSVersionInfoSize := SizeOf(OS);
  GetVersionEx(OS);
  case OS.dwPlatformID of
    VER_PLATFORM_WIN32_WINDOWS:
      if (OS.dwMajorVersion = 4) and (OS.dwMinorVersion = 0) then
        Result := Format('Windows 95 (Build %d.%d.%d) %s', [OS.dwMajorVersion, OS.dwMinorVersion,
          LoWord(OS.dwBuildNumber), OS.szCSDVersion])
      else if (OS.dwMajorVersion = 4) and (OS.dwMinorVersion = 10) then
        Result := Format('Windows 98 (Build %d.%d.%d) %s', [OS.dwMajorVersion, OS.dwMinorVersion,
          LoWord(OS.dwBuildNumber), OS.szCSDVersion]);
    VER_PLATFORM_WIN32_NT:
      if (OS.dwMajorVersion = 5) and (OS.dwMinorVersion = 0) then
        Result := Format('Windows 2000 (Build %d) %s', [OS.dwBuildNumber, OS.szCSDVersion])
      else if (OS.dwMajorVersion = 5) and (OS.dwMinorVersion = 1) then
        Result := Format('Windows XP (Build %d) %s', [OS.dwBuildNumber, OS.szCSDVersion])
      else
        Result := Format('Windows NT %d.%d (Build %d) %s', [OS.dwMajorVersion, OS.dwMinorVersion,
          OS.dwBuildNumber, OS.szCSDVersion])
    else
      Result := Format('Windows %d.%d %s', [OS.dwMajorVersion, OS.dwMinorVersion, OS.szCSDVersion]);
  end;
end;

procedure InsertTextToCombo(ComboBox: TBCComboBox);
var
  s: string;
  i: Integer;
begin
  with ComboBox do
  begin
    s := Text;
    if s <> '' then
    begin
      i := Items.IndexOf(s);
      if i > -1 then
      begin
        Items.Delete(i);
        Items.Insert(0, s);
        Text := s;
      end
      else
        Items.Insert(0, s);
    end;
  end;
end;

function AddSlash(Path: string): string;
begin
  if Path = '' then
    exit;
  if Path[Length(Path)] <> '\' then
    Result := Path + '\'
  else
    Result := Path;
end;

function IsAsciiFile(Filename: string): Boolean;
const
  Sett = 2048;
var
  i: Integer;
  F: file;
  TotalSize, IncSize, ReadSize: Integer;
  c: array[0..Sett] of Byte;
begin
  {$I-}
  try
    AssignFile(F, Filename);
    Reset(F, 1);
    TotalSize := FileSize(F);

    IncSize := 0;
    Result := true;

    while (IncSize < TotalSize) and Result do
    begin
      ReadSize := Sett;
      if IncSize + ReadSize > TotalSize then
        ReadSize := TotalSize - IncSize;
      IncSize := IncSize + ReadSize;
      BlockRead(F, c, ReadSize);
      for i := 0 to ReadSize - 1 do
        if (c[i]<32) and (not (c[i] in [9, 10, 13, 26])) then
        begin
          Result := False;
          Exit;
        end;
    end;
  finally
    CloseFile(F);
    {$I+}
    if IOResult <> 0 then
      Result := False
  end;
end;

function SaveChanges(IncludeCancel: Boolean): Integer;
var
  Buttons: TMsgDlgButtons;
begin
  Buttons := [mbYes, mbNO];
  if IncludeCancel then
    Buttons := Buttons + [mbCancel];
  //Result := MessageDlg('Save changes?', mtConfirmation, Buttons, 0);
  with CreateMessageDialog('Save changes?', mtConfirmation, Buttons) do
  try
    Left := MainForm.Left + (MainForm.Width - Width) div 2;
    Top := MainForm.Top + (MainForm.Height - Height) div 2;
    Result := ShowModal;
  finally
    Free;
  end
end;

function WideUpperCase(const S: WideString): WideString;
var
  I, Len: Integer;
  DstP, SrcP: PChar;
  Ch: Char;
begin
  Len := Length(S);
  SetLength(Result, Len);
  if Len > 0 then
  begin
    DstP := PChar(Pointer(Result));
    SrcP := PChar(Pointer(S));
    for I := Len downto 1 do
    begin
      Ch := SrcP^;
      case Ch of
        'a'..'z':
          Ch := Char(Word(Ch) xor $0020);
      end;
      DstP^ := Ch;
      Inc(DstP);
      Inc(SrcP);
    end;
  end;
end;

procedure AutoSizeCol(Grid: TJvStringGrid);
var
  i, W, WMax, Column: Integer;
begin
  for Column := 0 to 1 do
  begin
    WMax := 0;
    for i := 0 to (Grid.RowCount - 1) do
    begin
      W := Grid.Canvas.TextWidth(Grid.Cells[Column, i]);
      if W > WMax then
        WMax := W;
    end;
    Grid.ColWidths[Column] := WMax + 7;
  end;

  Grid.Width := Grid.ColWidths[0] + Grid.ColWidths[1] + 2;
// xxx  Grid.Height := Grid.RowCount * Grid.DefaultRowHeight + 5;
  Grid.Visible := True;
end;

procedure ShowMessage(Msg: string);
begin
  //MessageDlg(Msg, mtInformation, [mbOK], 0);

  with CreateMessageDialog(Msg, mtInformation, [mbOK]) do
  try
    Left := MainForm.Left + (MainForm.Width - Width) div 2;
    Top := MainForm.Top + (MainForm.Height - Height) div 2;
    ShowModal;
  finally
    Free;
  end
end;

procedure ShowErrorMessage(Msg: string);
begin
  //MessageDlg(Msg, mtError, [mbOK], 0);
  with CreateMessageDialog(Msg, mtError, [mbOK]) do
  try
    Left := MainForm.Left + (MainForm.Width - Width) div 2;
    Top := MainForm.Top + (MainForm.Height - Height) div 2;
    ShowModal;
  finally
    Free;
  end
end;

function AskYesOrNo(Msg: string): Boolean;
begin
  //Result := MessageDlg(Msg, mtConfirmation, [mbYes, mbNo], 0) = mrYes;
  with CreateMessageDialog(Msg, mtConfirmation, [mbYes, mbNo]) do
  try
    Left := MainForm.Left + (MainForm.Width - Width) div 2;
    Top := MainForm.Top + (MainForm.Height - Height) div 2;
    Result := ShowModal = mrYes;
  finally
    Free;
  end
end;

procedure ShowWarningMessage(Msg: string);
begin
 // MessageDlg(Msg, mtWarning, [mbOK], 0);
  with CreateMessageDialog(Msg, mtWarning, [mbOK]) do
  try
    Left := MainForm.Left + (MainForm.Width - Width) div 2;
    Top := MainForm.Top + (MainForm.Height - Height) div 2;
    ShowModal;
  finally
    Free;
  end
end;

end.
