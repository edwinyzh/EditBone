unit OptionsOutputTabs;

interface

uses
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, BCControls.CheckBox, Vcl.ExtCtrls,
  BCCommon.OptionsContainer;

type
  TOptionsOutputTabsFrame = class(TFrame)
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
    procedure GetData(OptionsContainer: TEditBoneOptionsContainer);
    procedure PutData(OptionsContainer: TEditBoneOptionsContainer);
  end;

implementation

{$R *.dfm}

procedure TOptionsOutputTabsFrame.GetData(OptionsContainer: TEditBoneOptionsContainer);
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

procedure TOptionsOutputTabsFrame.PutData(OptionsContainer: TEditBoneOptionsContainer);
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
