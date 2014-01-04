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
    ShowOverlayIconsCheckBox: TBCCheckBox;
  private
    { Private declarations }
  public
    { Public declarations }
    destructor Destroy; override;
    procedure GetData; override;
    procedure PutData; override;
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
    ShowTreeLinesCheckBox.Checked := DirShowTreeLines;
    IndentEdit.Text := IntToStr(DirIndent);
    ShowHiddenFilesCheckBox.Checked := DirShowHiddenFiles;
    ShowSystemFilesCheckBox.Checked := DirShowSystemFiles;
    ShowArchiveFilesCheckBox.Checked := DirShowArchiveFiles;
    ShowOverlayIconsCheckBox.Checked := DirShowOverlayIcons;
  end;
end;

procedure TOptionsDirectoryFrame.PutData;
begin
  with OptionsContainer do
  begin
    DirShowTreeLines := ShowTreeLinesCheckBox.Checked;
    DirShowHiddenFiles := ShowHiddenFilesCheckBox.Checked;
    DirShowSystemFiles := ShowSystemFilesCheckBox.Checked;
    DirShowArchiveFiles := ShowArchiveFilesCheckBox.Checked;
    DirIndent := StrToIntDef(IndentEdit.Text, 20);
    DirShowOverlayIcons := ShowOverlayIconsCheckBox.Checked;
  end;
end;

end.
