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
    procedure GetData(OptionsContainer: TOptionsContainer); override;
    procedure PutData(OptionsContainer: TOptionsContainer); override;
  end;

implementation

{$R *.dfm}

procedure TOptionsOutputTabsFrame.GetData(OptionsContainer: TOptionsContainer);
begin
  CloseTabByDblClickCheckBox.Checked := (OptionsContainer as TEditBoneOptionsContainer).OutputCloseTabByDblClick;
  CloseTabByMiddleClickCheckBox.Checked := (OptionsContainer as TEditBoneOptionsContainer).OutputCloseTabByMiddleClick;
  DoubleBufferedCheckBox.Checked := (OptionsContainer as TEditBoneOptionsContainer).OutputDoubleBuffered;
  MultiLineCheckBox.Checked := (OptionsContainer as TEditBoneOptionsContainer).OutputMultiLine;
  SaveTabsCheckBox.Checked := (OptionsContainer as TEditBoneOptionsContainer).OutputSaveTabs;
  ShowCloseButtonCheckBox.Checked := (OptionsContainer as TEditBoneOptionsContainer).OutputShowCloseButton;
  ShowImageCheckBox.Checked := (OptionsContainer as TEditBoneOptionsContainer).OutputShowImage;
  RightClickSelectCheckBox.Checked := (OptionsContainer as TEditBoneOptionsContainer).OutputRightClickSelect;
end;

procedure TOptionsOutputTabsFrame.PutData(OptionsContainer: TOptionsContainer);
begin
  (OptionsContainer as TEditBoneOptionsContainer).OutputCloseTabByDblClick := CloseTabByDblClickCheckBox.Checked;
  (OptionsContainer as TEditBoneOptionsContainer).OutputCloseTabByMiddleClick := CloseTabByMiddleClickCheckBox.Checked;
  (OptionsContainer as TEditBoneOptionsContainer).OutputDoubleBuffered := DoubleBufferedCheckBox.Checked;
  (OptionsContainer as TEditBoneOptionsContainer).OutputMultiLine := MultiLineCheckBox.Checked;
  (OptionsContainer as TEditBoneOptionsContainer).OutputSaveTabs := SaveTabsCheckBox.Checked;
  (OptionsContainer as TEditBoneOptionsContainer).OutputShowCloseButton := ShowCloseButtonCheckBox.Checked;
  (OptionsContainer as TEditBoneOptionsContainer).OutputShowImage := ShowImageCheckBox.Checked;
  (OptionsContainer as TEditBoneOptionsContainer).OutputRightClickSelect := RightClickSelectCheckBox.Checked;
end;

end.
