program EditBone;

uses
  Forms,
  Windows,
  System.SysUtils,
  System.Classes,
  Language in '..\..\Common\units\Language.pas' {LanguageDataModule: TDataModule},
  Directory in 'frames\Directory.pas' {DirectoryFrame: TFrame},
  Output in 'frames\Output.pas' {OutputFrame: TFrame},
  Document in 'frames\Document.pas' {DocumentFrame: TFrame},
  About in 'dialogs\About.pas' {AboutDialog},
  Lib in 'units\Lib.pas',
  Options in 'dialogs\Options.pas' {OptionsDialog},
  PrintPreview in '..\..\Common\forms\PrintPreview.pas' {PrintPreviewDialog},
  ConfirmReplace in '..\..\Common\dialogs\ConfirmReplace.pas' {ConfirmReplaceDialog},
  FindInFiles in '..\..\Common\dialogs\FindInFiles.pas' {FindInFilesDialog},
  Replace in '..\..\Common\dialogs\Replace.pas' {ReplaceDialog},
  Diff in '..\..\Common\units\Diff.pas',
  Hash in '..\..\Common\units\Hash.pas',
  DirectoryTab in 'dialogs\DirectoryTab.pas' {DirectoryTabDialog},
  Vcl.Themes,
  Vcl.Styles,
  Main in 'forms\Main.pas' {MainForm},
  StyleHooks in '..\..\Common\units\StyleHooks.pas',
  DownloadURL in '..\..\Common\dialogs\DownloadURL.pas' {DownloadURLDialog},
  Compare in '..\..\Common\frames\Compare.pas' {CompareFrame: TFrame},
  BigIni in '..\..\Common\units\BigIni.pas',
  Dlg in '..\..\Common\dialogs\Dlg.pas' {Dialog},
  Common in '..\..\Common\units\Common.pas';

{$R *.res}

var
  i: Integer;
  StyleFilename, IniValue: string;
  StringList: TStringList;

begin
  with TBigIniFile.Create(Common.GetINIFilename) do
  try
    { move preferences to options - version 4.4.0 }
    if SectionExists('Preferences') then
    begin
      StringList := TStringList.Create;
      try
        ReadSection('Preferences', StringList);
        for i := 0 to StringList.Count - 1 do
        begin
          IniValue := ReadString('Preferences', StringList[i], '');
          WriteString('Options', StringList[i], IniValue);
          DeleteKey('Preferences', StringList[i]);
        end;
        EraseSection('Preferences');
      finally
        StringList.Free;
      end;
    end;
    StyleFilename := ReadString('Options', 'StyleFilename', STYLENAME_WINDOWS);
  finally
    Free;
  end;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  if StyleFilename <> STYLENAME_WINDOWS then
    TStyleManager.SetStyle(TStyleManager.LoadFromFile(Format('%sStyles\%s', [ExtractFilePath(ParamStr(0)), StyleFilename])));
  Application.Title := 'EditBone';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
