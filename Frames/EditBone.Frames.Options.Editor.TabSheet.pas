unit EditBone.Frames.Options.Editor.TabSheet;

interface

uses
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, BCControls.CheckBox,
  BCCommon.Options.Container, BCCommon.Frames.Options.Base, sCheckBox, BCControls.Panel, sPanel, sFrameAdapter;

type
  TOptionsEditorTabsFrame = class(TBCOptionsBaseFrame)
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

function OptionsEditorTabsFrame(AOwner: TComponent): TOptionsEditorTabsFrame;

implementation

{$R *.dfm}

var
  FOptionsEditorTabsFrame: TOptionsEditorTabsFrame;

function OptionsEditorTabsFrame(AOwner: TComponent): TOptionsEditorTabsFrame;
begin
  if not Assigned(FOptionsEditorTabsFrame) then
    FOptionsEditorTabsFrame := TOptionsEditorTabsFrame.Create(AOwner);
  Result := FOptionsEditorTabsFrame;
end;

destructor TOptionsEditorTabsFrame.Destroy;
begin
  inherited;
  FOptionsEditorTabsFrame := nil;
end;

procedure TOptionsEditorTabsFrame.GetData;
begin
  with OptionsContainer do
  begin
    CheckBoxCloseTabByDblClick.Checked := DocCloseTabByDblClick;
    CheckBoxCloseTabByMiddleClick.Checked := DocCloseTabByMiddleClick;
    CheckBoxDoubleBuffered.Checked := DocDoubleBuffered;
    CheckBoxMultiLine.Checked := DocMultiLine;
    CheckBoxSaveTabs.Checked := DocSaveTabs;
    CheckBoxShowCloseButton.Checked := DocShowCloseButton;
    CheckBoxShowImage.Checked := DocShowImage;
    CheckBoxRightClickSelect.Checked := DocRightClickSelect;
  end;
end;

procedure TOptionsEditorTabsFrame.PutData;
begin
  with OptionsContainer do
  begin
    DocCloseTabByDblClick := CheckBoxCloseTabByDblClick.Checked;
    DocCloseTabByMiddleClick := CheckBoxCloseTabByMiddleClick.Checked;
    DocDoubleBuffered := CheckBoxDoubleBuffered.Checked;
    DocMultiLine := CheckBoxMultiLine.Checked;
    DocSaveTabs := CheckBoxSaveTabs.Checked;
    DocShowCloseButton := CheckBoxShowCloseButton.Checked;
    DocShowImage := CheckBoxShowImage.Checked;
    DocRightClickSelect := CheckBoxRightClickSelect.Checked;
  end;
end;

end.
