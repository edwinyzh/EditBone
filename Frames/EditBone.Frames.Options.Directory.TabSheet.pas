unit EditBone.Frames.Options.Directory.TabSheet;

interface

uses
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, BCControls.CheckBox, Vcl.ExtCtrls,
  BCCommon.Options.Container, BCCommon.Frames.Options.Base, sCheckBox, BCControls.Panel, sPanel, sFrameAdapter;

type
  TOptionsDirectoryTabsFrame = class(TBCOptionsBaseFrame)
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

function OptionsDirectoryTabsFrame(AOwner: TComponent): TOptionsDirectoryTabsFrame;

implementation

{$R *.dfm}

var
  FOptionsDirectoryTabsFrame: TOptionsDirectoryTabsFrame;

function OptionsDirectoryTabsFrame(AOwner: TComponent): TOptionsDirectoryTabsFrame;
begin
  if not Assigned(FOptionsDirectoryTabsFrame) then
    FOptionsDirectoryTabsFrame := TOptionsDirectoryTabsFrame.Create(AOwner);
  Result := FOptionsDirectoryTabsFrame;
end;

destructor TOptionsDirectoryTabsFrame.Destroy;
begin
  inherited;
  FOptionsDirectoryTabsFrame := nil;
end;

procedure TOptionsDirectoryTabsFrame.GetData;
begin
  CheckBoxCloseTabByDblClick.Checked := OptionsContainer.DirCloseTabByDblClick;
  CheckBoxCloseTabByMiddleClick.Checked := OptionsContainer.DirCloseTabByMiddleClick;
  CheckBoxDoubleBuffered.Checked := OptionsContainer.DirDoubleBuffered;
  CheckBoxMultiLine.Checked := OptionsContainer.DirMultiLine;
  CheckBoxSaveTabs.Checked := OptionsContainer.DirSaveTabs;
  CheckBoxShowCloseButton.Checked := OptionsContainer.DirShowCloseButton;
  CheckBoxShowImage.Checked := OptionsContainer.DirShowImage;
  CheckBoxRightClickSelect.Checked := OptionsContainer.DirRightClickSelect;
end;

procedure TOptionsDirectoryTabsFrame.PutData;
begin
  OptionsContainer.DirCloseTabByDblClick := CheckBoxCloseTabByDblClick.Checked;
  OptionsContainer.DirCloseTabByMiddleClick := CheckBoxCloseTabByMiddleClick.Checked;
  OptionsContainer.DirDoubleBuffered := CheckBoxDoubleBuffered.Checked;
  OptionsContainer.DirMultiLine := CheckBoxMultiLine.Checked;
  OptionsContainer.DirSaveTabs := CheckBoxSaveTabs.Checked;
  OptionsContainer.DirShowCloseButton := CheckBoxShowCloseButton.Checked;
  OptionsContainer.DirShowImage := CheckBoxShowImage.Checked;
  OptionsContainer.DirRightClickSelect := CheckBoxRightClickSelect.Checked;
end;

end.
