unit OptionsDirectoryTabs;

interface

uses
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, BCControls.CheckBox, Vcl.ExtCtrls,
  BCCommon.OptionsContainer, BCFrames.OptionsFrame;

type
  TOptionsDirectoryTabsFrame = class(TOptionsFrame)
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

procedure TOptionsDirectoryTabsFrame.GetData(OptionsContainer: TOptionsContainer);
begin
  CloseTabByDblClickCheckBox.Checked := (OptionsContainer as TEditBoneOptionsContainer).DirCloseTabByDblClick;
  CloseTabByMiddleClickCheckBox.Checked := (OptionsContainer as TEditBoneOptionsContainer).DirCloseTabByMiddleClick;
  DoubleBufferedCheckBox.Checked := (OptionsContainer as TEditBoneOptionsContainer).DirDoubleBuffered;
  MultiLineCheckBox.Checked := (OptionsContainer as TEditBoneOptionsContainer).DirMultiLine;
  SaveTabsCheckBox.Checked := (OptionsContainer as TEditBoneOptionsContainer).DirSaveTabs;
  ShowCloseButtonCheckBox.Checked := (OptionsContainer as TEditBoneOptionsContainer).DirShowCloseButton;
  ShowImageCheckBox.Checked := (OptionsContainer as TEditBoneOptionsContainer).DirShowImage;
  RightClickSelectCheckBox.Checked := (OptionsContainer as TEditBoneOptionsContainer).DirRightClickSelect;
end;

procedure TOptionsDirectoryTabsFrame.PutData(OptionsContainer: TOptionsContainer);
begin
  (OptionsContainer as TEditBoneOptionsContainer).DirCloseTabByDblClick := CloseTabByDblClickCheckBox.Checked;
  (OptionsContainer as TEditBoneOptionsContainer).DirCloseTabByMiddleClick := CloseTabByMiddleClickCheckBox.Checked;
  (OptionsContainer as TEditBoneOptionsContainer).DirDoubleBuffered := DoubleBufferedCheckBox.Checked;
  (OptionsContainer as TEditBoneOptionsContainer).DirMultiLine := MultiLineCheckBox.Checked;
  (OptionsContainer as TEditBoneOptionsContainer).DirSaveTabs := SaveTabsCheckBox.Checked;
  (OptionsContainer as TEditBoneOptionsContainer).DirShowCloseButton := ShowCloseButtonCheckBox.Checked;
  (OptionsContainer as TEditBoneOptionsContainer).DirShowImage := ShowImageCheckBox.Checked;
  (OptionsContainer as TEditBoneOptionsContainer).DirRightClickSelect := RightClickSelectCheckBox.Checked;
end;

end.
