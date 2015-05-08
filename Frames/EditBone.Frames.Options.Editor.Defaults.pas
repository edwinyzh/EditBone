unit EditBone.Frames.Options.Editor.Defaults;

interface

uses
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, BCControls.ComboBox, Vcl.ExtCtrls,
  BCCommon.Options.Container, BCCommon.Frames.Options.Base, sComboBox, BCControls.Panel, sPanel, sFrameAdapter;

type
  TOptionsEditorDefaultsFrame = class(TBCOptionsBaseFrame)
    ComboBoxDefaultColor: TBCComboBox;
    ComboBoxDefaultEncoding: TBCComboBox;
    ComboBoxDefaultHighlighter: TBCComboBox;
    Panel: TBCPanel;
  protected
    procedure Init; override;
    procedure GetData; override;
    procedure PutData; override;
  public
    destructor Destroy; override;
  end;

function OptionsEditorDefaultsFrame(AOwner: TComponent): TOptionsEditorDefaultsFrame;

implementation

{$R *.dfm}

uses
  BCCommon.Language.Strings;

var
  FOptionsEditorDefaultsFrame: TOptionsEditorDefaultsFrame;

function OptionsEditorDefaultsFrame(AOwner: TComponent): TOptionsEditorDefaultsFrame;
begin
  if not Assigned(FOptionsEditorDefaultsFrame) then
    FOptionsEditorDefaultsFrame := TOptionsEditorDefaultsFrame.Create(AOwner);
  Result := FOptionsEditorDefaultsFrame;
end;

destructor TOptionsEditorDefaultsFrame.Destroy;
begin
  inherited;
  FOptionsEditorDefaultsFrame := nil;
end;

procedure TOptionsEditorDefaultsFrame.Init;
begin
  ComboBoxDefaultColor.Items := OptionsContainer.ColorStrings;
  ComboBoxDefaultEncoding.Items := OptionsContainer.EncodingStrings;
  ComboBoxDefaultHighlighter.Items := OptionsContainer.HighlighterStrings;
end;

procedure TOptionsEditorDefaultsFrame.GetData;
begin
  ComboBoxDefaultColor.ItemIndex := ComboBoxDefaultColor.IndexOf(OptionsContainer.DefaultColor);
  ComboBoxDefaultEncoding.ItemIndex := OptionsContainer.DefaultEncoding;
  ComboBoxDefaultHighlighter.ItemIndex := ComboBoxDefaultHighlighter.IndexOf(OptionsContainer.DefaultHighlighter);
end;

procedure TOptionsEditorDefaultsFrame.PutData;
begin
  OptionsContainer.DefaultColor := ComboBoxDefaultColor.Text;
  OptionsContainer.DefaultEncoding := ComboBoxDefaultEncoding.ItemIndex;
  OptionsContainer.DefaultHighlighter := ComboBoxDefaultHighlighter.Text;
end;

end.
