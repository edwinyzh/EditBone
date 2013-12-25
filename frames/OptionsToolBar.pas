unit OptionsToolBar;

interface

uses
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, BCControls.CheckBox,
  BCCommon.OptionsContainer, BCFrames.OptionsFrame;

type
  TOptionsToolBarFrame = class(TOptionsFrame)
    Panel: TPanel;
    StandardCheckBox: TBCCheckBox;
    PrintCheckBox: TBCCheckBox;
    DirectoryCheckBox: TBCCheckBox;
    IndentCheckBox: TBCCheckBox;
    SortCheckBox: TBCCheckBox;
    CaseCheckBox: TBCCheckBox;
    DocumentCheckBox: TBCCheckBox;
    MacroCheckBox: TBCCheckBox;
    ToolsCheckBox: TBCCheckBox;
    ModeCheckBox: TBCCheckBox;
    SearchCheckBox: TBCCheckBox;
    CommandCheckBox: TBCCheckBox;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GetData(OptionsContainer: TOptionsContainer); override;
    procedure PutData(OptionsContainer: TOptionsContainer); override;
  end;

implementation

{$R *.dfm}

procedure TOptionsToolBarFrame.GetData(OptionsContainer: TOptionsContainer);
begin
  StandardCheckBox.Checked := OptionsContainer.ToolBarStandard;
  PrintCheckBox.Checked := OptionsContainer.ToolBarPrint;
  DirectoryCheckBox.Checked := (OptionsContainer as TEditBoneOptionsContainer).ToolBarDirectory;
  IndentCheckBox.Checked := OptionsContainer.ToolBarIndent;
  SortCheckBox.Checked := OptionsContainer.ToolBarSort;
  CaseCheckBox.Checked := OptionsContainer.ToolBarCase;
  CommandCheckBox.Checked := OptionsContainer.ToolBarCommand;
  SearchCheckBox.Checked := OptionsContainer.ToolBarSearch;
  ModeCheckBox.Checked := OptionsContainer.ToolBarMode;
  ToolsCheckBox.Checked := OptionsContainer.ToolBarTools;
  MacroCheckBox.Checked := (OptionsContainer as TEditBoneOptionsContainer).ToolBarMacro;
  DocumentCheckBox.Checked := (OptionsContainer as TEditBoneOptionsContainer).ToolBarDocument;
end;

procedure TOptionsToolBarFrame.PutData(OptionsContainer: TOptionsContainer);
begin
  OptionsContainer.ToolBarStandard := StandardCheckBox.Checked;
  OptionsContainer.ToolBarPrint := PrintCheckBox.Checked;
  (OptionsContainer as TEditBoneOptionsContainer).ToolBarDirectory :=  DirectoryCheckBox.Checked;
  OptionsContainer.ToolBarIndent := IndentCheckBox.Checked;
  OptionsContainer.ToolBarSort := SortCheckBox.Checked;
  OptionsContainer.ToolBarCase := CaseCheckBox.Checked;
  OptionsContainer.ToolBarCommand := CommandCheckBox.Checked;
  OptionsContainer.ToolBarSearch := SearchCheckBox.Checked;
  OptionsContainer.ToolBarMode := ModeCheckBox.Checked;
  OptionsContainer.ToolBarTools := ToolsCheckBox.Checked;
  (OptionsContainer as TEditBoneOptionsContainer).ToolBarMacro := MacroCheckBox.Checked;
  (OptionsContainer as TEditBoneOptionsContainer).ToolBarDocument := DocumentCheckBox.Checked;
end;

end.
