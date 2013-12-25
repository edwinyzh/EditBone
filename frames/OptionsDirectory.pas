unit OptionsDirectory;

interface

uses
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, BCControls.Edit,
  BCControls.CheckBox, Vcl.ExtCtrls, BCCommon.OptionsContainer, BCFrames.OptionsFrame;

type
  TOptionsDirectoryFrame = class(TOptionsFrame)
    Panel: TPanel;
    IndentLabel: TLabel;
    ShowTreeLinesCheckBox: TBCCheckBox;
    IndentEdit: TBCEdit;
    ShowHiddenFilesCheckBox: TBCCheckBox;
    ShowSystemFilesCheckBox: TBCCheckBox;
    ShowArchiveFilesCheckBox: TBCCheckBox;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GetData(OptionsContainer: TOptionsContainer); override;
    procedure PutData(OptionsContainer: TOptionsContainer); override;
  end;

implementation

{$R *.dfm}

uses
  System.SysUtils;

procedure TOptionsDirectoryFrame.GetData(OptionsContainer: TOptionsContainer);
begin
  with OptionsContainer as TEditBoneOptionsContainer do
  begin
    ShowTreeLinesCheckBox.Checked := DirShowTreeLines;
    IndentEdit.Text := IntToStr(DirIndent);
    ShowHiddenFilesCheckBox.Checked := DirShowHiddenFiles;
    ShowSystemFilesCheckBox.Checked := DirShowSystemFiles;
    ShowArchiveFilesCheckBox.Checked := DirShowArchiveFiles;
  end;
end;

procedure TOptionsDirectoryFrame.PutData(OptionsContainer: TOptionsContainer);
begin
  with OptionsContainer as TEditBoneOptionsContainer do
  begin
    DirShowTreeLines := ShowTreeLinesCheckBox.Checked;
    DirShowHiddenFiles := ShowHiddenFilesCheckBox.Checked;
    DirShowSystemFiles := ShowSystemFilesCheckBox.Checked;
    DirShowArchiveFiles := ShowArchiveFilesCheckBox.Checked;
    DirIndent := StrToIntDef(IndentEdit.Text, 20);
  end;
end;

end.
