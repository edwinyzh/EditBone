program EditBone;

uses
  {$ifdef DEBUG}
  FastMM4,
  {$endif }
  Vcl.Forms,
  EditBone.Forms.Main in 'Forms\EditBone.Forms.Main.pas' {MainForm},
  EditBone.Consts in 'Units\EditBone.Consts.pas',
  EditBone.Frames.Directory in 'Frames\EditBone.Frames.Directory.pas',
  EditBone.Frames.Directory.TabSheet in 'Frames\EditBone.Frames.Directory.TabSheet.pas' {DirTabSheetFrame: TFrame},
  EditBone.Dialogs.DirectoryTab in 'Dialogs\EditBone.Dialogs.DirectoryTab.pas' {DirectoryTabDialog},
  EditBone.Forms.Options in 'Forms\EditBone.Forms.Options.pas' {OptionsForm},
  EditBone.Frames.Options.Editor.TabSheet in 'Frames\EditBone.Frames.Options.Editor.TabSheet.pas' {OptionsEditorTabsFrame: TFrame},
  EditBone.Frames.Options.Editor.Defaults in 'Frames\EditBone.Frames.Options.Editor.Defaults.pas' {OptionsEditorDefaultsFrame: TFrame},
  EditBone.Frames.Options.FileTypes in 'Frames\EditBone.Frames.Options.FileTypes.pas' {OptionsFileTypesFrame: TFrame},
  EditBone.Frames.Options.Directory in 'Frames\EditBone.Frames.Options.Directory.pas' {OptionsDirectoryFrame: TFrame},
  EditBone.Frames.Options.Directory.TabSheet in 'Frames\EditBone.Frames.Options.Directory.TabSheet.pas' {OptionsDirectoryTabsFrame: TFrame},
  EditBone.Frames.Options.Output.TabSheet in 'Frames\EditBone.Frames.Options.Output.TabSheet.pas' {OptionsOutputTabsFrame: TFrame},
  EditBone.Frames.Output in 'Frames\EditBone.Frames.Output.pas' {OutputFrame: TFrame},
  EditBone.Frames.Output.TabSheet in 'Frames\EditBone.Frames.Output.TabSheet.pas' {OutputTabSheetFrame: TFrame},
  EditBone.Types in 'Units\EditBone.Types.pas',
  EditBone.Forms.UnicodeCharacterMap in 'Forms\EditBone.Forms.UnicodeCharacterMap.pas' {UnicodeCharacterMapForm},
  EditBone.Dialogs.About in 'Dialogs\EditBone.Dialogs.About.pas' {AboutDialog},
  EditBone.Forms.LanguageEditor in 'Forms\EditBone.Forms.LanguageEditor.pas' {LanguageEditorForm},
  EditBone.FindInFiles in 'Units\EditBone.FindInFiles.pas',
  EditBone.Images in 'Units\EditBone.Images.pas' {DataModuleImages: TDataModule},
  EditBone.Document in 'Units\EditBone.Document.pas',
  EditBone.XMLTree in 'Units\EditBone.XMLTree.pas';

{$R *.res}

begin
  {$ifdef DEBUG}
  ReportMemoryLeaksOnShutdown := True;
  {$endif}
  Application.Initialize;
  Application.Title := 'EditBone';
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TDataModuleImages, DataModuleImages);
  Application.Run;
end.
