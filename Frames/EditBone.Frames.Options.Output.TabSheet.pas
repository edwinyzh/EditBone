unit EditBone.Frames.Options.Output.TabSheet;

interface

uses
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  BCCommon.Options.Container, BCCommon.Frames.Options.Base, BCControls.Panel, sPanel, sFrameAdapter,
  acSlider, sLabel;

type
  TOptionsOutputTabsFrame = class(TBCOptionsBaseFrame)
    Panel: TBCPanel;
    ShowImageStickyLabelShowImage: TsStickyLabel;
    SliderCloseTabByDblClick: TsSlider;
    SliderCloseTabByMiddleClick: TsSlider;
    SliderMultiline: TsSlider;
    SliderRightClickSelect: TsSlider;
    SliderSaveTabs: TsSlider;
    SliderShowCloseButton: TsSlider;
    SliderShowImage: TsSlider;
    StickyLabelCloseTabByDblClick: TsStickyLabel;
    StickyLabelCloseTabByMiddleClick: TsStickyLabel;
    StickyLabelMultiline: TsStickyLabel;
    StickyLabelRightClickSelect: TsStickyLabel;
    StickyLabelSaveTabs: TsStickyLabel;
    StickyLabelShowCloseButton: TsStickyLabel;
  protected
    procedure GetData; override;
    procedure PutData; override;
  public
    destructor Destroy; override;
  end;

function OptionsOutputTabsFrame(AOwner: TComponent): TOptionsOutputTabsFrame;

implementation

{$R *.dfm}

uses
  BCCommon.Utils;

var
  FOptionsOutputTabsFrame: TOptionsOutputTabsFrame;

function OptionsOutputTabsFrame(AOwner: TComponent): TOptionsOutputTabsFrame;
begin
  if not Assigned(FOptionsOutputTabsFrame) then
    FOptionsOutputTabsFrame := TOptionsOutputTabsFrame.Create(AOwner);
  Result := FOptionsOutputTabsFrame;
  AlignSliders(Result.Panel);
end;

destructor TOptionsOutputTabsFrame.Destroy;
begin
  inherited;
  FOptionsOutputTabsFrame := nil;
end;

procedure TOptionsOutputTabsFrame.GetData;
begin
  SliderCloseTabByDblClick.SliderOn := OptionsContainer.OutputCloseTabByDblClick;
  SliderCloseTabByMiddleClick.SliderOn := OptionsContainer.OutputCloseTabByMiddleClick;
  SliderMultiLine.SliderOn := OptionsContainer.OutputMultiLine;
  SliderSaveTabs.SliderOn := OptionsContainer.OutputSaveTabs;
  SliderShowCloseButton.SliderOn := OptionsContainer.OutputShowCloseButton;
  SliderShowImage.SliderOn := OptionsContainer.OutputShowImage;
  SliderRightClickSelect.SliderOn := OptionsContainer.OutputRightClickSelect;
end;

procedure TOptionsOutputTabsFrame.PutData;
begin
  OptionsContainer.OutputCloseTabByDblClick := SliderCloseTabByDblClick.SliderOn;
  OptionsContainer.OutputCloseTabByMiddleClick := SliderCloseTabByMiddleClick.SliderOn;
  OptionsContainer.OutputMultiLine := SliderMultiLine.SliderOn;
  OptionsContainer.OutputSaveTabs := SliderSaveTabs.SliderOn;
  OptionsContainer.OutputShowCloseButton := SliderShowCloseButton.SliderOn;
  OptionsContainer.OutputShowImage := SliderShowImage.SliderOn;
  OptionsContainer.OutputRightClickSelect := SliderRightClickSelect.SliderOn;
end;

end.
