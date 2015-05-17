unit EditBone.Frames.Options.Directory;

interface

uses
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, BCControls.Edit,
  Vcl.ExtCtrls, BCCommon.Options.Container,  BCCommon.Frames.Options.Base,
  sEdit, BCControls.Panel, sPanel, sFrameAdapter, acSlider, sLabel;

type
  TOptionsDirectoryFrame = class(TBCOptionsBaseFrame)
    StickyLabelShowArchiveFiles: TsStickyLabel;
    StickyLabelShowHiddenFiles: TsStickyLabel;
    StickyLabelShowOverlayIcons: TsStickyLabel;
    StickyLabelShowSystemFiles: TsStickyLabel;
    StickyLabelShowTreeLines: TsStickyLabel;
    SliderShowTreeLines: TsSlider;
    SliderShowHiddenFiles: TsSlider;
    SliderShowSystemFiles: TsSlider;
    SliderShowArchiveFiles: TsSlider;
    SliderShowOverlayIcons: TsSlider;
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
  System.SysUtils, BCCommon.Utils;

var
  FOptionsDirectoryFrame: TOptionsDirectoryFrame;

function OptionsDirectoryFrame(AOwner: TComponent): TOptionsDirectoryFrame;
begin
  if not Assigned(FOptionsDirectoryFrame) then
    FOptionsDirectoryFrame := TOptionsDirectoryFrame.Create(AOwner);
  Result := FOptionsDirectoryFrame;
  AlignSliders(Result.Panel);
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
    SliderShowTreeLines.SliderOn := DirShowTreeLines;
    EditIndent.Text := IntToStr(DirIndent);
    SliderShowHiddenFiles.SliderOn := DirShowHiddenFiles;
    SliderShowSystemFiles.SliderOn := DirShowSystemFiles;
    SliderShowArchiveFiles.SliderOn := DirShowArchiveFiles;
    SliderShowOverlayIcons.SliderOn := DirShowOverlayIcons;
  end;
end;

procedure TOptionsDirectoryFrame.PutData;
begin
  with OptionsContainer do
  begin
    DirShowTreeLines := SliderShowTreeLines.SliderOn;
    DirShowHiddenFiles := SliderShowHiddenFiles.SliderOn;
    DirShowSystemFiles := SliderShowSystemFiles.SliderOn;
    DirShowArchiveFiles := SliderShowArchiveFiles.SliderOn;
    DirIndent := StrToIntDef(EditIndent.Text, 20);
    DirShowOverlayIcons := SliderShowOverlayIcons.SliderOn;
  end;
end;

end.
