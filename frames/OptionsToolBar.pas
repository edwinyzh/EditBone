unit OptionsToolBar;

interface

uses
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, BCControls.CheckBox,
  BCCommon.OptionsContainer;

type
  TToolBarFrame = class(TFrame)
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
    procedure GetData(OptionsContainer: TEditBoneOptionsContainer);
    procedure PutData(OptionsContainer: TEditBoneOptionsContainer);
  end;

implementation

{$R *.dfm}

procedure TToolBarFrame.GetData(OptionsContainer: TEditBoneOptionsContainer);
begin
  StandardCheckBox.Checked := OptionsContainer.ToolBarStandard;
  PrintCheckBox.Checked := OptionsContainer.ToolBarPrint;
  DirectoryCheckBox.Checked := OptionsContainer.ToolBarDirectory;
  IndentCheckBox.Checked := OptionsContainer.ToolBarIndent;
  SortCheckBox.Checked := OptionsContainer.ToolBarSort;
  CaseCheckBox.Checked := OptionsContainer.ToolBarCase;
  CommandCheckBox.Checked := OptionsContainer.ToolBarCommand;
  SearchCheckBox.Checked := OptionsContainer.ToolBarSearch;
  ModeCheckBox.Checked := OptionsContainer.ToolBarMode;
  ToolsCheckBox.Checked := OptionsContainer.ToolBarTools;
  MacroCheckBox.Checked := OptionsContainer.ToolBarMacro;
  DocumentCheckBox.Checked := OptionsContainer.ToolBarDocument;
end;

procedure TToolBarFrame.PutData(OptionsContainer: TEditBoneOptionsContainer);
begin
  OptionsContainer.ToolBarStandard := StandardCheckBox.Checked;
  OptionsContainer.ToolBarPrint := PrintCheckBox.Checked;
  OptionsContainer.ToolBarDirectory :=  DirectoryCheckBox.Checked;
  OptionsContainer.ToolBarIndent := IndentCheckBox.Checked;
  OptionsContainer.ToolBarSort := SortCheckBox.Checked;
  OptionsContainer.ToolBarCase := CaseCheckBox.Checked;
  OptionsContainer.ToolBarCommand := CommandCheckBox.Checked;
  OptionsContainer.ToolBarSearch := SearchCheckBox.Checked;
  OptionsContainer.ToolBarMode := ModeCheckBox.Checked;
  OptionsContainer.ToolBarTools := ToolsCheckBox.Checked;
  OptionsContainer.ToolBarMacro := MacroCheckBox.Checked;
  OptionsContainer.ToolBarDocument := DocumentCheckBox.Checked;
end;

end.
