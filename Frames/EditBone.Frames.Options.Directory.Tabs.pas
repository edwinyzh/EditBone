unit EditBone.Frames.Options.Directory.Tabs;

interface

uses
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, BCControls.CheckBox, Vcl.ExtCtrls,
  BCCommon.OptionsContainer,  BCCommon.Frames.Options.Base, sCheckBox;

type
  TOptionsDirectoryTabsFrame = class(TBCOptionsBaseFrame)
    Panel: TBCPanel;
    MultilineCheckBox: TBCCheckBox;
    ShowCloseButtonCheckBox: TBCCheckBox;
    ShowImageCheckBox: TBCCheckBox;
    CloseTabByDblClickCheckBox: TBCCheckBox;
    CloseTabByMiddleClickCheckBox: TBCCheckBox;
    DoubleBufferedCheckBox: TBCCheckBox;
    RightClickSelectCheckBox: TBCCheckBox;
    SaveTabsCheckBox: TBCCheckBox;
  private
    { Private declarations }
  public
    { Public declarations }
    destructor Destroy; override;
    procedure GetData; override;
    procedure PutData; override;
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
  CloseTabByDblClickCheckBox.Checked := OptionsContainer.DirCloseTabByDblClick;
  CloseTabByMiddleClickCheckBox.Checked := OptionsContainer.DirCloseTabByMiddleClick;
  DoubleBufferedCheckBox.Checked := OptionsContainer.DirDoubleBuffered;
  MultiLineCheckBox.Checked := OptionsContainer.DirMultiLine;
  SaveTabsCheckBox.Checked := OptionsContainer.DirSaveTabs;
  ShowCloseButtonCheckBox.Checked := OptionsContainer.DirShowCloseButton;
  ShowImageCheckBox.Checked := OptionsContainer.DirShowImage;
  RightClickSelectCheckBox.Checked := OptionsContainer.DirRightClickSelect;
end;

procedure TOptionsDirectoryTabsFrame.PutData;
begin
  OptionsContainer.DirCloseTabByDblClick := CloseTabByDblClickCheckBox.Checked;
  OptionsContainer.DirCloseTabByMiddleClick := CloseTabByMiddleClickCheckBox.Checked;
  OptionsContainer.DirDoubleBuffered := DoubleBufferedCheckBox.Checked;
  OptionsContainer.DirMultiLine := MultiLineCheckBox.Checked;
  OptionsContainer.DirSaveTabs := SaveTabsCheckBox.Checked;
  OptionsContainer.DirShowCloseButton := ShowCloseButtonCheckBox.Checked;
  OptionsContainer.DirShowImage := ShowImageCheckBox.Checked;
  OptionsContainer.DirRightClickSelect := RightClickSelectCheckBox.Checked;
end;

end.
