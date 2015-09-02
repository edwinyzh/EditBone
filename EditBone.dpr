program EditBone;
								  
uses
  {$ifdef DEBUG}
  FastMM4,
  {$endif }
  Vcl.Forms,
  EditBone.Form.Main in 'Forms\EditBone.Form.Main.pas' {MainForm},
  EditBone.Consts in 'Units\EditBone.Consts.pas',
  EditBone.Frame.Directory in 'Frames\EditBone.Frame.Directory.pas',
  EditBone.Frame.Directory.TabSheet in 'Frames\EditBone.Frame.Directory.TabSheet.pas' {DirTabSheetFrame: TFrame},
  EditBone.Dialog.DirectoryTab in 'Dialogs\EditBone.Dialog.DirectoryTab.pas' {DirectoryTabDialog},
  EditBone.Form.Options in 'Forms\EditBone.Form.Options.pas' {OptionsForm},
  EditBone.Frame.Options.Editor.TabSheet in 'Frames\EditBone.Frame.Options.Editor.TabSheet.pas' {OptionsEditorTabsFrame: TFrame},
  EditBone.Frame.Options.Editor.Defaults in 'Frames\EditBone.Frame.Options.Editor.Defaults.pas' {OptionsEditorDefaultsFrame: TFrame},
  EditBone.Frame.Options.FileTypes in 'Frames\EditBone.Frame.Options.FileTypes.pas' {OptionsFileTypesFrame: TFrame},
  EditBone.Frame.Options.Directory in 'Frames\EditBone.Frame.Options.Directory.pas' {OptionsDirectoryFrame: TFrame},
  EditBone.Frame.Options.Directory.TabSheet in 'Frames\EditBone.Frame.Options.Directory.TabSheet.pas' {OptionsDirectoryTabsFrame: TFrame},
  EditBone.Frame.Options.Output.TabSheet in 'Frames\EditBone.Frame.Options.Output.TabSheet.pas' {OptionsOutputTabsFrame: TFrame},
  EditBone.Frame.Output in 'Frames\EditBone.Frame.Output.pas' {OutputFrame: TFrame},
  EditBone.Frame.Output.TabSheet in 'Frames\EditBone.Frame.Output.TabSheet.pas' {OutputTabSheetFrame: TFrame},
  EditBone.Types in 'Units\EditBone.Types.pas',
  EditBone.Form.UnicodeCharacterMap in 'Forms\EditBone.Form.UnicodeCharacterMap.pas' {UnicodeCharacterMapForm},
  EditBone.Dialog.About in 'Dialogs\EditBone.Dialog.About.pas' {AboutDialog},
  EditBone.Form.LanguageEditor in 'Forms\EditBone.Form.LanguageEditor.pas' {LanguageEditorForm},
  EditBone.FindInFiles in 'Units\EditBone.FindInFiles.pas',
  EditBone.Document in 'Units\EditBone.Document.pas',
  EditBone.XMLTree in 'Units\EditBone.XMLTree.pas',
  EditBone.DataModule.Images in 'DataModules\EditBone.DataModule.Images.pas' {EBDataModuleImages: TDataModule},
  EditBone.Directory in 'Units\EditBone.Directory.pas',
  EditBone.Output in 'Units\EditBone.Output.pas';

{$R *.res}

begin
  {$ifdef DEBUG}
  ReportMemoryLeaksOnShutdown := True;
  {$endif}
  Application.Initialize;
  Application.Title := 'EditBone';
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
