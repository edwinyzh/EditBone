unit EditBone.Frames.Options.Directory;

interface

uses
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, BCControls.Edit,
  BCControls.CheckBox, Vcl.ExtCtrls, BCCommon.Options.Container,  BCCommon.Frames.Options.Base,
  sEdit, sCheckBox, BCControls.Panel, sPanel, sFrameAdapter;

type
  TOptionsDirectoryFrame = class(TBCOptionsBaseFrame)
    CheckBoxShowArchiveFiles: TBCCheckBox;
    CheckBoxShowHiddenFiles: TBCCheckBox;
    CheckBoxShowOverlayIcons: TBCCheckBox;
    CheckBoxShowSystemFiles: TBCCheckBox;
    CheckBoxShowTreeLines: TBCCheckBox;
    EditIndent: TBCEdit;
    Panel: TBCPanel;
  protected
    procedure GetData; override;
    procedure PutData; override;
  public
    destructor Destroy; override;
  end;

function OptionsDirectoryFrame(AOwner: TComponent): TOptionsDirectoryFrame;

implementation

{$R *.dfm}

uses
  System.SysUtils;

var
  FOptionsDirectoryFrame: TOptionsDirectoryFrame;

function OptionsDirectoryFrame(AOwner: TComponent): TOptionsDirectoryFrame;
begin
  if not Assigned(FOptionsDirectoryFrame) then
    FOptionsDirectoryFrame := TOptionsDirectoryFrame.Create(AOwner);
  Result := FOptionsDirectoryFrame;
end;

destructor TOptionsDirectoryFrame.Destroy;
begin
  inherited;
  FOptionsDirectoryFrame := nil;
end;

procedure TOptionsDirectoryFrame.GetData;
begin
  with OptionsContainer do
  begin
    CheckBoxShowTreeLines.Checked := DirShowTreeLines;
    EditIndent.Text := IntToStr(DirIndent);
    CheckBoxShowHiddenFiles.Checked := DirShowHiddenFiles;
    CheckBoxShowSystemFiles.Checked := DirShowSystemFiles;
    CheckBoxShowArchiveFiles.Checked := DirShowArchiveFiles;
    CheckBoxShowOverlayIcons.Checked := DirShowOverlayIcons;
  end;
end;

procedure TOptionsDirectoryFrame.PutData;
begin
  with OptionsContainer do
  begin
    DirShowTreeLines := CheckBoxShowTreeLines.Checked;
    DirShowHiddenFiles := CheckBoxShowHiddenFiles.Checked;
    DirShowSystemFiles := CheckBoxShowSystemFiles.Checked;
    DirShowArchiveFiles := CheckBoxShowArchiveFiles.Checked;
    DirIndent := StrToIntDef(EditIndent.Text, 20);
    DirShowOverlayIcons := CheckBoxShowOverlayIcons.Checked;
  end;
end;

end.
