unit OptionsDirectory;

interface

uses
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, BCControls.Edit,
  BCControls.CheckBox, Vcl.ExtCtrls, BCCommon.OptionsContainer;

type
  TOptionsDirectoryFrame = class(TFrame)
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
    procedure GetData(OptionsContainer: TEditBoneOptionsContainer);
    procedure PutData(OptionsContainer: TEditBoneOptionsContainer);
  end;

implementation

{$R *.dfm}

uses
  System.SysUtils;

procedure TOptionsDirectoryFrame.GetData(OptionsContainer: TEditBoneOptionsContainer);
begin
  ShowTreeLinesCheckBox.Checked := OptionsContainer.DirShowTreeLines;
  IndentEdit.Text := IntToStr(OptionsContainer.DirIndent);
  ShowHiddenFilesCheckBox.Checked := OptionsContainer.DirShowHiddenFiles;
  ShowSystemFilesCheckBox.Checked := OptionsContainer.DirShowSystemFiles;
  ShowArchiveFilesCheckBox.Checked := OptionsContainer.DirShowArchiveFiles;
end;

procedure TOptionsDirectoryFrame.PutData(OptionsContainer: TEditBoneOptionsContainer);
begin
  OptionsContainer.DirShowTreeLines := ShowTreeLinesCheckBox.Checked;
  OptionsContainer.DirShowHiddenFiles := ShowHiddenFilesCheckBox.Checked;
  OptionsContainer.DirShowSystemFiles := ShowSystemFilesCheckBox.Checked;
  OptionsContainer.DirShowArchiveFiles := ShowArchiveFilesCheckBox.Checked;
  OptionsContainer.DirIndent := StrToIntDef(IndentEdit.Text, 20);
end;

end.
