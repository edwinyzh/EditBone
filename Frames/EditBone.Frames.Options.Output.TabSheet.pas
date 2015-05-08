unit EditBone.Frames.Options.Output.TabSheet;

interface

uses
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, BCControls.CheckBox, Vcl.ExtCtrls,
  BCCommon.Options.Container, BCCommon.Frames.Options.Base, sCheckBox, BCControls.Panel, sPanel, sFrameAdapter;

type
  TOptionsOutputTabsFrame = class(TBCOptionsBaseFrame)
    CheckBoxCloseTabByDblClick: TBCCheckBox;
    CheckBoxCloseTabByMiddleClick: TBCCheckBox;
    CheckBoxDoubleBuffered: TBCCheckBox;
    CheckBoxMultiline: TBCCheckBox;
    CheckBoxRightClickSelect: TBCCheckBox;
    CheckBoxSaveTabs: TBCCheckBox;
    CheckBoxShowCloseButton: TBCCheckBox;
    CheckBoxShowImage: TBCCheckBox;
    Panel: TBCPanel;
  protected
    procedure GetData; override;
    procedure PutData; override;
  public
    destructor Destroy; override;
  end;

function OptionsOutputTabsFrame(AOwner: TComponent): TOptionsOutputTabsFrame;

implementation

{$R *.dfm}

var
  FOptionsOutputTabsFrame: TOptionsOutputTabsFrame;

function OptionsOutputTabsFrame(AOwner: TComponent): TOptionsOutputTabsFrame;
begin
  if not Assigned(FOptionsOutputTabsFrame) then
    FOptionsOutputTabsFrame := TOptionsOutputTabsFrame.Create(AOwner);
  Result := FOptionsOutputTabsFrame;
end;

destructor TOptionsOutputTabsFrame.Destroy;
begin
  inherited;
  FOptionsOutputTabsFrame := nil;
end;


procedure TOptionsOutputTabsFrame.GetData;
begin
  CheckBoxCloseTabByDblClick.Checked := OptionsContainer.OutputCloseTabByDblClick;
  CheckBoxCloseTabByMiddleClick.Checked := OptionsContainer.OutputCloseTabByMiddleClick;
  CheckBoxDoubleBuffered.Checked := OptionsContainer.OutputDoubleBuffered;
  CheckBoxMultiLine.Checked := OptionsContainer.OutputMultiLine;
  CheckBoxSaveTabs.Checked := OptionsContainer.OutputSaveTabs;
  CheckBoxShowCloseButton.Checked := OptionsContainer.OutputShowCloseButton;
  CheckBoxShowImage.Checked := OptionsContainer.OutputShowImage;
  CheckBoxRightClickSelect.Checked := OptionsContainer.OutputRightClickSelect;
end;

procedure TOptionsOutputTabsFrame.PutData;
begin
  OptionsContainer.OutputCloseTabByDblClick := CheckBoxCloseTabByDblClick.Checked;
  OptionsContainer.OutputCloseTabByMiddleClick := CheckBoxCloseTabByMiddleClick.Checked;
  OptionsContainer.OutputDoubleBuffered := CheckBoxDoubleBuffered.Checked;
  OptionsContainer.OutputMultiLine := CheckBoxMultiLine.Checked;
  OptionsContainer.OutputSaveTabs := CheckBoxSaveTabs.Checked;
  OptionsContainer.OutputShowCloseButton := CheckBoxShowCloseButton.Checked;
  OptionsContainer.OutputShowImage := CheckBoxShowImage.Checked;
  OptionsContainer.OutputRightClickSelect := CheckBoxRightClickSelect.Checked;
end;

end.
