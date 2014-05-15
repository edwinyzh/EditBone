unit OptionsEditorTabs;

interface

uses
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, BCControls.CheckBox,
  BCCommon.OptionsContainer, BCFrames.OptionsFrame, JvExStdCtrls, JvCheckBox;

type
  TOptionsEditorTabsFrame = class(TOptionsFrame)
    Panel: TPanel;
    MultilineCheckBox: TBCCheckBox;
    ShowCloseButtonCheckBox: TBCCheckBox;
    ShowImageCheckBox: TBCCheckBox;
    CloseTabByDblClickCheckBox: TBCCheckBox;
    CloseTabByMiddleClickCheckBox: TBCCheckBox;
    DoubleBufferedCheckBox: TBCCheckBox;
    SaveTabsCheckBox: TBCCheckBox;
    RightClickSelectCheckBox: TBCCheckBox;
  private
    { Private declarations }
  public
    { Public declarations }
    destructor Destroy; override;
    procedure GetData; override;
    procedure PutData; override;
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
    CloseTabByDblClickCheckBox.Checked := DocCloseTabByDblClick;
    CloseTabByMiddleClickCheckBox.Checked := DocCloseTabByMiddleClick;
    DoubleBufferedCheckBox.Checked := DocDoubleBuffered;
    MultiLineCheckBox.Checked := DocMultiLine;
    SaveTabsCheckBox.Checked := DocSaveTabs;
    ShowCloseButtonCheckBox.Checked := DocShowCloseButton;
    ShowImageCheckBox.Checked := DocShowImage;
    RightClickSelectCheckBox.Checked := DocRightClickSelect;
  end;
end;

procedure TOptionsEditorTabsFrame.PutData;
begin
  with OptionsContainer do
  begin
    DocCloseTabByDblClick := CloseTabByDblClickCheckBox.Checked;
    DocCloseTabByMiddleClick := CloseTabByMiddleClickCheckBox.Checked;
    DocDoubleBuffered := DoubleBufferedCheckBox.Checked;
    DocMultiLine := MultiLineCheckBox.Checked;
    DocSaveTabs := SaveTabsCheckBox.Checked;
    DocShowCloseButton := ShowCloseButtonCheckBox.Checked;
    DocShowImage := ShowImageCheckBox.Checked;
    DocRightClickSelect := RightClickSelectCheckBox.Checked;
  end;
end;

end.
