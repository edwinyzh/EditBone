unit OptionsOutputTabs;

interface

uses
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, BCControls.CheckBox, Vcl.ExtCtrls,
  BCCommon.OptionsContainer, BCFrames.OptionsFrame;

type
  TOptionsOutputTabsFrame = class(TOptionsFrame)
    Panel: TPanel;
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
  CloseTabByDblClickCheckBox.Checked := OptionsContainer.OutputCloseTabByDblClick;
  CloseTabByMiddleClickCheckBox.Checked := OptionsContainer.OutputCloseTabByMiddleClick;
  DoubleBufferedCheckBox.Checked := OptionsContainer.OutputDoubleBuffered;
  MultiLineCheckBox.Checked := OptionsContainer.OutputMultiLine;
  SaveTabsCheckBox.Checked := OptionsContainer.OutputSaveTabs;
  ShowCloseButtonCheckBox.Checked := OptionsContainer.OutputShowCloseButton;
  ShowImageCheckBox.Checked := OptionsContainer.OutputShowImage;
  RightClickSelectCheckBox.Checked := OptionsContainer.OutputRightClickSelect;
end;

procedure TOptionsOutputTabsFrame.PutData;
begin
  OptionsContainer.OutputCloseTabByDblClick := CloseTabByDblClickCheckBox.Checked;
  OptionsContainer.OutputCloseTabByMiddleClick := CloseTabByMiddleClickCheckBox.Checked;
  OptionsContainer.OutputDoubleBuffered := DoubleBufferedCheckBox.Checked;
  OptionsContainer.OutputMultiLine := MultiLineCheckBox.Checked;
  OptionsContainer.OutputSaveTabs := SaveTabsCheckBox.Checked;
  OptionsContainer.OutputShowCloseButton := ShowCloseButtonCheckBox.Checked;
  OptionsContainer.OutputShowImage := ShowImageCheckBox.Checked;
  OptionsContainer.OutputRightClickSelect := RightClickSelectCheckBox.Checked;
end;

end.
