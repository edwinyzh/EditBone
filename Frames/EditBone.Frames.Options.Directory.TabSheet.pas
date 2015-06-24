unit EditBone.Frames.Options.Directory.TabSheet;

interface

uses
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  BCCommon.Options.Container, BCCommon.Frames.Options.Base, BCControls.Panel, sPanel, sFrameAdapter,
  acSlider, sLabel;

type
  TOptionsDirectoryTabsFrame = class(TBCOptionsBaseFrame)
    Panel: TBCPanel;
    StickyLabelCloseTabByDblClick: TsStickyLabel;
    SliderCloseTabByDblClick: TsSlider;
    SliderCloseTabByMiddleClick: TsSlider;
    StickyLabelCloseTabByMiddleClick: TsStickyLabel;
    StickyLabelDoubleBuffered: TsStickyLabel;
    SliderDoubleBuffered: TsSlider;
    SliderMultiline: TsSlider;
    StickyLabelMultiline: TsStickyLabel;
    StickyLabelRightClickSelect: TsStickyLabel;
    SliderRightClickSelect: TsSlider;
    SliderSaveTabs: TsSlider;
    StickyLabelSaveTabs: TsStickyLabel;
    StickyLabelShowCloseButton: TsStickyLabel;
    SliderShowCloseButton: TsSlider;
    SliderShowImage: TsSlider;
    ShowImageStickyLabelShowImage: TsStickyLabel;
    SliderShowOpenDirectoryButton: TsSlider;
    StickyLabelShowOpenDirectoryButton: TsStickyLabel;
  protected
    procedure GetData; override;
    procedure PutData; override;
  public
    destructor Destroy; override;
  end;

function OptionsDirectoryTabsFrame(AOwner: TComponent): TOptionsDirectoryTabsFrame;

implementation

{$R *.dfm}

uses
  BCCommon.Utils;

var
  FOptionsDirectoryTabsFrame: TOptionsDirectoryTabsFrame;

function OptionsDirectoryTabsFrame(AOwner: TComponent): TOptionsDirectoryTabsFrame;
begin
  if not Assigned(FOptionsDirectoryTabsFrame) then
    FOptionsDirectoryTabsFrame := TOptionsDirectoryTabsFrame.Create(AOwner);
  Result := FOptionsDirectoryTabsFrame;
  AlignSliders(Result.Panel);
end;

destructor TOptionsDirectoryTabsFrame.Destroy;
begin
  inherited;
  FOptionsDirectoryTabsFrame := nil;
end;

procedure TOptionsDirectoryTabsFrame.GetData;
begin
  SliderCloseTabByDblClick.SliderOn := OptionsContainer.DirCloseTabByDblClick;
  SliderCloseTabByMiddleClick.SliderOn := OptionsContainer.DirCloseTabByMiddleClick;
  SliderDoubleBuffered.SliderOn := OptionsContainer.DirDoubleBuffered;
  SliderMultiLine.SliderOn := OptionsContainer.DirMultiLine;
  SliderSaveTabs.SliderOn := OptionsContainer.DirSaveTabs;
  SliderShowCloseButton.SliderOn := OptionsContainer.DirShowCloseButton;
  SliderShowImage.SliderOn := OptionsContainer.DirShowImage;
  SliderShowOpenDirectoryButton.SliderOn := OptionsContainer.DirShowOpenDirectoryButton;
  SliderRightClickSelect.SliderOn := OptionsContainer.DirRightClickSelect;
end;

procedure TOptionsDirectoryTabsFrame.PutData;
begin
  OptionsContainer.DirCloseTabByDblClick := SliderCloseTabByDblClick.SliderOn;
  OptionsContainer.DirCloseTabByMiddleClick := SliderCloseTabByMiddleClick.SliderOn;
  OptionsContainer.DirDoubleBuffered := SliderDoubleBuffered.SliderOn;
  OptionsContainer.DirMultiLine := SliderMultiLine.SliderOn;
  OptionsContainer.DirSaveTabs := SliderSaveTabs.SliderOn;
  OptionsContainer.DirShowCloseButton := SliderShowCloseButton.SliderOn;
  OptionsContainer.DirShowImage := SliderShowImage.SliderOn;
  OptionsContainer.DirShowOpenDirectoryButton := SliderShowOpenDirectoryButton.SliderOn;
  OptionsContainer.DirRightClickSelect := SliderRightClickSelect.SliderOn;
end;

end.
