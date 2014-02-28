program EditBone;

uses
  {$ifdef DEBUG}
  {$endif }
  Forms,
  Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Themes,
  Vcl.ComCtrls,
  Vcl.Styles,
  Main in 'forms\Main.pas' {MainForm},
  BCCommon.LanguageStrings in '..\..\Common\units\BCCommon.LanguageStrings.pas' {LanguageDataModule: TDataModule},
  Directory in 'frames\Directory.pas' {DirectoryFrame: TFrame},
  Output in 'frames\Output.pas' {OutputFrame: TFrame},
  Document in 'frames\Document.pas' {DocumentFrame: TFrame},
  About in 'dialogs\About.pas' {AboutDialog},
  Lib in 'units\Lib.pas',
  Options in 'forms\Options.pas' {OptionsForm},
  BCForms.PrintPreview in '..\..\Common\forms\BCForms.PrintPreview.pas' {PrintPreviewDialog},
  BCDialogs.ConfirmReplace in '..\..\Common\dialogs\BCDialogs.ConfirmReplace.pas' {ConfirmReplaceDialog},
  BCDialogs.FindInFiles in '..\..\Common\dialogs\BCDialogs.FindInFiles.pas' {FindInFilesDialog},
  BCDialogs.Replace in '..\..\Common\dialogs\BCDialogs.Replace.pas' {ReplaceDialog},
  Diff in '..\..\Common\units\Diff.pas',
  BCCommon.Hash in '..\..\Common\units\BCCommon.Hash.pas',
  DirectoryTab in 'dialogs\DirectoryTab.pas' {DirectoryTabDialog},
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
  OptionsEditorErrorChecking in 'frames\OptionsEditorErrorChecking.pas' {OptionsEditorErrorCheckingFrame: TFrame},
  OptionsEditorOther in 'frames\OptionsEditorOther.pas' {OptionsEditorOtherFrame: TFrame},
  BCFrames.OptionsEditorFont in '..\..\Common\frames\BCFrames.OptionsEditorFont.pas' {OptionsEditorFontFrame: TFrame},
  OptionsFileTypes in 'frames\OptionsFileTypes.pas' {OptionsFileTypesFrame: TFrame},
  BCFrames.OptionsCompare in '..\..\Common\frames\BCFrames.OptionsCompare.pas' {OptionsCompareFrame: TFrame},
  OptionsDirectoryTabs in 'frames\OptionsDirectoryTabs.pas' {OptionsDirectoryTabsFrame: TFrame},
  OptionsOutputTabs in 'frames\OptionsOutputTabs.pas' {OptionsOutputTabsFrame: TFrame},
  Vcl.PlatformVclStylesActnCtrls in '..\..\Common\units\Vcl.PlatformVclStylesActnCtrls.pas',
  OptionsDirectory in 'frames\OptionsDirectory.pas' {OptionsDirectoryFrame: TFrame},
  BCFrames.OptionsStatusBar in '..\..\Common\frames\BCFrames.OptionsStatusBar.pas' {OptionsStatusBarFrame: TFrame},
  InsertTag in 'dialogs\InsertTag.pas' {InsertTagDialog},
  UnicodeCharacterMap in 'forms\UnicodeCharacterMap.pas' {UnicodeCharacterMapForm},
  BCCommon.DuplicateChecker in '..\..\Common\units\BCCommon.DuplicateChecker.pas',
  DuplicateCheckerOptions in 'dialogs\DuplicateCheckerOptions.pas' {DuplicateCheckerOptionsDialog},
  BCCommon.FileUtils in '..\..\Common\units\BCCommon.FileUtils.pas',
  BCCommon.StringUtils in '..\..\Common\units\BCCommon.StringUtils.pas',
  BCCommon.LanguageUtils in '..\..\Common\units\BCCommon.LanguageUtils.pas',
  BCCommon.Messages in '..\..\Common\units\BCCommon.Messages.pas',
  BCForms.Convert in '..\..\Common\forms\BCForms.Convert.pas' {ConvertForm},
  BCFrames.OptionsEditorCompletionProposal in '..\..\Common\frames\BCFrames.OptionsEditorCompletionProposal.pas' {OptionsEditorCompletionProposalFrame: TFrame},
  BCCommon.Lib in '..\..\Common\units\BCCommon.Lib.pas',
  BCCommon.MacroRecorder in '..\..\Common\units\BCCommon.MacroRecorder.pas',
  BCForms.SearchForFiles in '..\..\Common\forms\BCForms.SearchForFiles.pas' {SearchForFilesForm},
  BCCommon.Math in '..\..\Common\units\BCCommon.Math.pas',
  BCFrames.OptionsEditorRightMargin in '..\..\Common\frames\BCFrames.OptionsEditorRightMargin.pas' {OptionsEditorRightMarginFrame: TFrame},
  BCFrames.OptionsEditorLeftMargin in '..\..\Common\frames\BCFrames.OptionsEditorLeftMargin.pas' {OptionsEditorLeftMarginFrame: TFrame},
  BCFrames.OptionsEditorOptions in '..\..\Common\frames\BCFrames.OptionsEditorOptions.pas' {OptionsEditorOptionsFrame: TFrame},
  BCFrames.OptionsEditorSearch in '..\..\Common\frames\BCFrames.OptionsEditorSearch.pas' {OptionsEditorSearchFrame: TFrame},
  OptionsEditorTabs in 'frames\OptionsEditorTabs.pas' {OptionsEditorTabsFrame: TFrame},
  BCFrames.OptionsMainMenu in '..\..\Common\frames\BCFrames.OptionsMainMenu.pas' {OptionsMainMenuFrame: TFrame},
  BCFrames.OptionsOutput in '..\..\Common\frames\BCFrames.OptionsOutput.pas' {OptionsOutputFrame: TFrame},
  BCFrames.OptionsPrint in '..\..\Common\frames\BCFrames.OptionsPrint.pas' {OptionsPrintFrame: TFrame},
  BCCommon.OptionsContainer in '..\..\Common\units\BCCommon.OptionsContainer.pas',
  IniPersist in '..\..\Common\units\IniPersist.pas',
  BCFrames.OptionsFrame in '..\..\Common\frames\BCFrames.OptionsFrame.pas' {OptionsFrame: TFrame},
  BCDialogs.OptionsToolBarItems in '..\..\Common\dialogs\BCDialogs.OptionsToolBarItems.pas' {OptionsToolBarItemsDialog},
  BCFrames.OptionsToolBar in '..\..\Common\frames\BCFrames.OptionsToolBar.pas' {OptionsToolBarFrame: TFrame},
  MapVirtualDrives in 'forms\MapVirtualDrives.pas' {MapVirtualDrivesForm},
  VirtualDrive in 'dialogs\VirtualDrive.pas' {VirtualDriveDialog},
  BCCommon.Images in '..\..\Common\units\BCCommon.Images.pas' {ImagesDataModule: TDataModule};

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
  Application.CreateForm(TImagesDataModule, ImagesDataModule);
  Application.Run;
end.
