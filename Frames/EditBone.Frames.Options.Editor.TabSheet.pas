unit EditBone.Frames.Options.Editor.TabSheet;

interface

uses
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  BCCommon.Options.Container, BCCommon.Frames.Options.Base, BCControls.Panel, sPanel, sFrameAdapter,
  acSlider, sLabel;

type
  TOptionsEditorTabsFrame = class(TBCOptionsBaseFrame)
    Panel: TBCPanel;
    StickyLabelCloseTabByDblClick: TsStickyLabel;
    SliderCloseTabByDblClick: TsSlider;
    SliderCloseTabByMiddleClick: TsSlider;
    StickyLabelCloseTabByMiddleClick: TsStickyLabel;
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
    StickyLabelShowNewDocumentButton: TsStickyLabel;
    SliderShowNewDocumentButton: TsSlider;
  protected
    procedure GetData; override;
    procedure PutData; override;
  public
    destructor Destroy; override;
  end;

function OptionsEditorTabsFrame(AOwner: TComponent): TOptionsEditorTabsFrame;

implementation

{$R *.dfm}

uses
  BCCommon.Utils;

var
  FOptionsEditorTabsFrame: TOptionsEditorTabsFrame;

function OptionsEditorTabsFrame(AOwner: TComponent): TOptionsEditorTabsFrame;
begin
  if not Assigned(FOptionsEditorTabsFrame) then
    FOptionsEditorTabsFrame := TOptionsEditorTabsFrame.Create(AOwner);
  Result := FOptionsEditorTabsFrame;
  AlignSliders(Result.Panel);
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
    SliderCloseTabByDblClick.SliderOn := DocCloseTabByDblClick;
    SliderCloseTabByMiddleClick.SliderOn := DocCloseTabByMiddleClick;
    SliderMultiLine.SliderOn := DocMultiLine;
    SliderRightClickSelect.SliderOn := DocRightClickSelect;
    SliderSaveTabs.SliderOn := DocSaveTabs;
    SliderShowCloseButton.SliderOn := DocShowCloseButton;
    SliderShowNewDocumentButton.SliderOn := DocShowNewDocumentButton;
    SliderShowImage.SliderOn := DocShowImage;
  end;
end;

procedure TOptionsEditorTabsFrame.PutData;
begin
  with OptionsContainer do
  begin
    DocCloseTabByDblClick := SliderCloseTabByDblClick.SliderOn;
    DocCloseTabByMiddleClick := SliderCloseTabByMiddleClick.SliderOn;
    DocMultiLine := SliderMultiLine.SliderOn;
    DocRightClickSelect := SliderRightClickSelect.SliderOn;
    DocSaveTabs := SliderSaveTabs.SliderOn;
    DocShowCloseButton := SliderShowCloseButton.SliderOn;
    DocShowNewDocumentButton := SliderShowNewDocumentButton.SliderOn;
    DocShowImage := SliderShowImage.SliderOn;
  end;
end;

end.
