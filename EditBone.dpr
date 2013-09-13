program EditBone;

uses
  {$ifdef debug}
  {$endif }
  Forms,
  Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Themes,
  Vcl.ComCtrls,
  Vcl.Styles,
  BCCommon.LanguageStrings in '..\..\Common\units\BCCommon.LanguageStrings.pas' {LanguageDataModule: TDataModule},
  Directory in 'frames\Directory.pas' {DirectoryFrame: TFrame},
  Output in 'frames\Output.pas' {OutputFrame: TFrame},
  Document in 'frames\Document.pas' {DocumentFrame: TFrame},
  About in 'dialogs\About.pas' {AboutDialog},
  Lib in 'units\Lib.pas',
  Options in 'forms\Options.pas' {OptionsDialog},
  BCForms.PrintPreview in '..\..\Common\forms\BCForms.PrintPreview.pas' {PrintPreviewDialog},
  BCDialogs.ConfirmReplace in '..\..\Common\dialogs\BCDialogs.ConfirmReplace.pas' {ConfirmReplaceDialog},
  BCDialogs.FindInFiles in '..\..\Common\dialogs\BCDialogs.FindInFiles.pas' {FindInFilesDialog},
  BCDialogs.Replace in '..\..\Common\dialogs\BCDialogs.Replace.pas' {ReplaceDialog},
  Diff in '..\..\Common\units\Diff.pas',
  BCCommon.Hash in '..\..\Common\units\BCCommon.Hash.pas',
  DirectoryTab in 'dialogs\DirectoryTab.pas' {DirectoryTabDialog},
  Main in 'forms\Main.pas' {MainForm},
  BCCommon.StyleUtils in '..\..\Common\units\BCCommon.StyleUtils.pas',
  BCDialogs.DownloadURL in '..\..\Common\dialogs\BCDialogs.DownloadURL.pas' {DownloadURLDialog},
  BCFrames.Compare in '..\..\Common\frames\BCFrames.Compare.pas' {CompareFrame: TFrame},
  BigIni in '..\..\Common\units\BigIni.pas',
  BCDialogs.Dlg in '..\..\Common\dialogs\BCDialogs.Dlg.pas' {Dialog},
  BCCommon.Dialogs in '..\..\Common\units\BCCommon.Dialogs.pas',
  LanguageEditor in 'forms\LanguageEditor.pas' {LanguageEditorForm},
  DocumentTabSheet in 'frames\DocumentTabSheet.pas' {DocTabSheetFrame: TFrame},
  BCCommon.Encoding in '..\..\Common\units\BCCommon.Encoding.pas',
  DirectoryTabSheet in 'frames\DirectoryTabSheet.pas' {DirTabSheetFrame: TFrame},
  OutputTabSheet in 'frames\OutputTabSheet.pas' {OutputTabSheetFrame: TFrame},
  OptionsEditorOptions in 'frames\OptionsEditorOptions.pas' {EditorOptionsFrame: TFrame},
  OptionsEditorErrorChecking in 'frames\OptionsEditorErrorChecking.pas' {EditorErrorCheckingFrame: TFrame},
  OptionsEditorOther in 'frames\OptionsEditorOther.pas' {EditorOtherFrame: TFrame},
  OptionsEditorFont in 'frames\OptionsEditorFont.pas' {EditorFontFrame: TFrame},
  OptionsEditorMargin in 'frames\OptionsEditorMargin.pas' {EditorMarginFrame: TFrame},
  OptionsEditorTabs in 'frames\OptionsEditorTabs.pas' {EditorTabsFrame: TFrame},
  OptionsFileTypes in 'frames\OptionsFileTypes.pas' {FileTypesFrame: TFrame},
  OptionsMainMenu in 'frames\OptionsMainMenu.pas' {MainMenuFrame: TFrame},
  OptionsCompare in 'frames\OptionsCompare.pas' {OptionsCompareFrame: TFrame},
  OptionsDirectoryTabs in 'frames\OptionsDirectoryTabs.pas' {DirectoryTabsFrame: TFrame},
  OptionsOutputTabs in 'frames\OptionsOutputTabs.pas' {OutputTabsFrame: TFrame},
  Vcl.PlatformVclStylesActnCtrls in '..\..\Common\units\Vcl.PlatformVclStylesActnCtrls.pas',
  OptionsDirectory in 'frames\OptionsDirectory.pas' {OptionsDirectoryFrame: TFrame},
  OptionsStatusBar in 'frames\OptionsStatusBar.pas' {StatusBarFrame: TFrame},
  OptionsOutput in 'frames\OptionsOutput.pas' {OptionsOutputFrame: TFrame},
  InsertTag in 'dialogs\InsertTag.pas' {InsertTagDialog},
  OptionsToolBar in 'frames\OptionsToolBar.pas' {ToolBarFrame: TFrame},
  UnicodeCharacterMap in 'forms\UnicodeCharacterMap.pas' {UnicodeCharacterMapForm},
  BCCommon.DuplicateChecker in '..\..\Common\units\BCCommon.DuplicateChecker.pas',
  DuplicateCheckerOptions in 'dialogs\DuplicateCheckerOptions.pas' {DuplicateCheckerOptionsDialog},
  BCCommon.FileUtils in '..\..\Common\units\BCCommon.FileUtils.pas',
  BCCommon.StringUtils in '..\..\Common\units\BCCommon.StringUtils.pas',
  BCCommon.LanguageUtils in '..\..\Common\units\BCCommon.LanguageUtils.pas',
  BCCommon.Messages in '..\..\Common\units\BCCommon.Messages.pas',
  BCForms.Convert in '..\..\Common\forms\BCForms.Convert.pas' {ConvertForm},
  OptionsEditorCompletionProposal in 'frames\OptionsEditorCompletionProposal.pas' {EditorCompletionProposalFrame: TFrame},
  OptionsPrint in 'frames\OptionsPrint.pas' {OptionsPrintFrame: TFrame},
  BCCommon.Lib in '..\..\Common\units\BCCommon.Lib.pas',
  BCCommon.MacroRecorder in '..\..\Common\units\BCCommon.MacroRecorder.pas',
  OptionsEditorSearch in 'frames\OptionsEditorSearch.pas' {EditorSearchFrame: TFrame};

{$R *.res}

var
  StyleFilename: string;
begin
  with TBigIniFile.Create(GetIniFilename) do
  try
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
