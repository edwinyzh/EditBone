unit EditBone.Frame.Options.Editor.Other;

interface

uses
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, BCControls.ComboBox, Vcl.ExtCtrls,
  BCCommon.Options.Container, BCCommon.Frames.Options.Base, sComboBox, BCControls.Panel, sPanel, sFrameAdapter;

type
  TOptionsEditorOtherFrame = class(TBCOptionsBaseFrame)
    Panel: TBCPanel;
    LabelDefaultColor: TLabel;
    ComboBoxDefaultColor: TBCComboBox;
    LabelDefaultEncoding: TLabel;
    ComboBoxDefaultEncoding: TBCComboBox;
    LabelDefaultHighlighter: TLabel;
    ComboBoxDefaultHighlighter: TBCComboBox;
  protected
    procedure Init; override;
    procedure GetData; override;
    procedure PutData; override;
  public
    destructor Destroy; override;
  end;

function OptionsEditorOtherFrame(AOwner: TComponent): TOptionsEditorOtherFrame;

implementation

{$R *.dfm}

uses
  BCCommon.Language.Strings;

var
  FOptionsEditorOtherFrame: TOptionsEditorOtherFrame;

function OptionsEditorOtherFrame(AOwner: TComponent): TOptionsEditorOtherFrame;
begin
  if not Assigned(FOptionsEditorOtherFrame) then
    FOptionsEditorOtherFrame := TOptionsEditorOtherFrame.Create(AOwner);
  Result := FOptionsEditorOtherFrame;
end;

destructor TOptionsEditorOtherFrame.Destroy;
begin
  inherited;
  FOptionsEditorOtherFrame := nil;
end;

procedure TOptionsEditorOtherFrame.Init;
begin
  ComboBoxDefaultColor.Items := OptionsContainer.ColorStrings;
  ComboBoxDefaultEncoding.Items := OptionsContainer.EncodingStrings;
  ComboBoxDefaultHighlighter.Items := OptionsContainer.HighlighterStrings;
end;

procedure TOptionsEditorOtherFrame.GetData;
begin
  ComboBoxDefaultColor.ItemIndex := ComboBoxDefaultColor.IndexOf(OptionsContainer.DefaultColor);
  ComboBoxDefaultEncoding.ItemIndex := OptionsContainer.DefaultEncoding;
  ComboBoxDefaultHighlighter.ItemIndex := ComboBoxDefaultHighlighter.IndexOf(OptionsContainer.DefaultHighlighter);
end;

procedure TOptionsEditorOtherFrame.PutData;
begin
  OptionsContainer.DefaultColor := ComboBoxDefaultColor.Text;
  OptionsContainer.DefaultEncoding := ComboBoxDefaultEncoding.ItemIndex;
  OptionsContainer.DefaultHighlighter := ComboBoxDefaultHighlighter.Text;
end;

end.
