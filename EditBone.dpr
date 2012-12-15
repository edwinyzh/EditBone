program EditBone;

uses
  Forms,
  Windows,
  System.SysUtils,
  Directory in 'frames\Directory.pas' {DirectoryFrame: TFrame},
  Output in 'frames\Output.pas' {OutputFrame: TFrame},
  Document in 'frames\Document.pas' {DocumentFrame: TFrame},
  About in 'dialogs\About.pas' {AboutDialog},
  Lib in 'units\Lib.pas',
  Preferences in 'dialogs\Preferences.pas' {PreferencesDialog},
  PrintPreview in '..\..\Common\forms\PrintPreview.pas' {PrintPreviewDialog},
  ConfirmReplace in '..\..\Common\dialogs\ConfirmReplace.pas' {ConfirmReplaceDialog},
  FindInFiles in '..\..\Common\dialogs\FindInFiles.pas' {FindInFilesDialog},
  Replace in '..\..\Common\dialogs\Replace.pas' {ReplaceDialog},
  Diff in '..\..\Common\units\Diff.pas',
  Hash in '..\..\Common\units\Hash.pas',
  Common in '..\..\Common\units\Common.pas',
  DirectoryTab in 'dialogs\DirectoryTab.pas' {DirectoryTabDialog},
  Vcl.Themes,
  Vcl.Styles,
  Main in 'forms\Main.pas' {MainForm},
  StyleHooks in '..\..\Common\units\StyleHooks.pas',
  DownloadURL in '..\..\Common\dialogs\DownloadURL.pas' {DownloadURLDialog},
  Compare in '..\..\Common\frames\Compare.pas' {CompareFrame: TFrame},
  BigIni in '..\..\Common\units\BigIni.pas',
  Dlg in '..\..\Common\dialogs\Dlg.pas' {Dialog};

{$R *.res}

var
  StyleFilename: string;
begin
  with TBigIniFile.Create(Common.GetINIFilename) do
  try
    StyleFilename := ReadString('Preferences', 'StyleFilename', STYLENAME_WINDOWS);
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
