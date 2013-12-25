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
    destructor Destroy; override;
    procedure GetData; override;
    procedure PutData; override;
  end;

function OptionsToolBarFrame(AOwner: TComponent): TOptionsToolBarFrame;

implementation

{$R *.dfm}

var
  FOptionsToolBarFrame: TOptionsToolBarFrame;

function OptionsToolBarFrame(AOwner: TComponent): TOptionsToolBarFrame;
begin
  if not Assigned(FOptionsToolBarFrame) then
    FOptionsToolBarFrame := TOptionsToolBarFrame.Create(AOwner);
  Result := FOptionsToolBarFrame;
end;

destructor TOptionsToolBarFrame.Destroy;
begin
  inherited;
  FOptionsToolBarFrame := nil;
end;

procedure TOptionsToolBarFrame.GetData;
begin
  with OptionsContainer do
  begin
    StandardCheckBox.Checked := ToolBarStandard;
    PrintCheckBox.Checked := ToolBarPrint;
    IndentCheckBox.Checked := ToolBarIndent;
    SortCheckBox.Checked := ToolBarSort;
    CaseCheckBox.Checked := ToolBarCase;
    CommandCheckBox.Checked := ToolBarCommand;
    SearchCheckBox.Checked := ToolBarSearch;
    ModeCheckBox.Checked := ToolBarMode;
    ToolsCheckBox.Checked := ToolBarTools;
    DirectoryCheckBox.Checked := ToolBarDirectory;
    MacroCheckBox.Checked := ToolBarMacro;
    DocumentCheckBox.Checked := ToolBarDocument;
  end;
end;

procedure TOptionsToolBarFrame.PutData;
begin
  with OptionsContainer do
  begin
    ToolBarStandard := StandardCheckBox.Checked;
    ToolBarPrint := PrintCheckBox.Checked;
    ToolBarIndent := IndentCheckBox.Checked;
    ToolBarSort := SortCheckBox.Checked;
    ToolBarCase := CaseCheckBox.Checked;
    ToolBarCommand := CommandCheckBox.Checked;
    ToolBarSearch := SearchCheckBox.Checked;
    ToolBarMode := ModeCheckBox.Checked;
    ToolBarTools := ToolsCheckBox.Checked;
    ToolBarDirectory :=  DirectoryCheckBox.Checked;
    ToolBarMacro := MacroCheckBox.Checked;
    ToolBarDocument := DocumentCheckBox.Checked;
  end;
end;

end.
