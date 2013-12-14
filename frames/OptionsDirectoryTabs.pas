unit OptionsDirectoryTabs;

interface

uses
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, BCControls.CheckBox, Vcl.ExtCtrls,
  BCCommon.OptionsContainer;

type
  TOptionsDirectoryTabsFrame = class(TFrame)
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

procedure TOptionsDirectoryTabsFrame.GetData(OptionsContainer: TEditBoneOptionsContainer);
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

procedure TOptionsDirectoryTabsFrame.PutData(OptionsContainer: TEditBoneOptionsContainer);
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
