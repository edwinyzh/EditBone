unit OptionsEditorFont;

interface

uses
  System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.StdCtrls, Vcl.ActnList, BCControls.SynEdit, System.Actions, SynEdit, Vcl.ComCtrls, Vcl.ImgList,
  BCControls.ImageList, SynEditHighlighter, SynHighlighterURI, SynURIOpener;

type
  TEditorFontFrame = class(TFrame)
    Panel: TPanel;
    FontDialog: TFontDialog;
    ActionList: TActionList;
    SelectEditorFontAction: TAction;
    TopPanel: TPanel;
    SelectEditorFontSpeedButton: TSpeedButton;
    EditorFontLabel: TLabel;
    BottomPanel: TPanel;
    SynEdit: TBCSynEdit;
    MarginFontLabel: TLabel;
    SelecMarginFontSpeedButton: TSpeedButton;
    EditorLabel: TLabel;
    MarginLabel: TLabel;
    SelectMarginFontAction: TAction;
    MinimapLabel: TLabel;
    SelecMinimapFontSpeedButton: TSpeedButton;
    MinimapFontLabel: TLabel;
    SelectMinimapFontAction: TAction;
    BookmarkImagesList: TBCImageList;
    SynURIOpener: TSynURIOpener;
    SynURISyn: TSynURISyn;
    procedure SelectEditorFontActionExecute(Sender: TObject);
    procedure SelectMarginFontActionExecute(Sender: TObject);
    procedure SelectMinimapFontActionExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TEditorFontFrame.SelectEditorFontActionExecute(Sender: TObject);
begin
  FontDialog.Font.Name := EditorFontLabel.Font.Name;
  FontDialog.Font.Size := EditorFontLabel.Font.Size;
  if FontDialog.Execute then
  begin
    EditorFontLabel.Font.Assign(FontDialog.Font);
    EditorFontLabel.Caption := Format('%s %dpt', [EditorFontLabel.Font.Name, EditorFontLabel.Font.Size]);
    SynEdit.Text := EditorFontLabel.Caption;
    SynEdit.Font.Assign(FontDialog.Font);
  end;
end;

procedure TEditorFontFrame.SelectMarginFontActionExecute(Sender: TObject);
begin
  FontDialog.Font.Name := MarginFontLabel.Font.Name;
  FontDialog.Font.Size := MarginFontLabel.Font.Size;
  if FontDialog.Execute then
  begin
    MarginFontLabel.Font.Assign(FontDialog.Font);
    MarginFontLabel.Caption := Format('%s %dpt', [MarginFontLabel.Font.Name, MarginFontLabel.Font.Size]);
    SynEdit.Gutter.Font.Assign(FontDialog.Font);
  end;
end;

procedure TEditorFontFrame.SelectMinimapFontActionExecute(Sender: TObject);
begin
  FontDialog.Font.Name := MinimapFontLabel.Font.Name;
  FontDialog.Font.Size := MinimapFontLabel.Font.Size;
  if FontDialog.Execute then
  begin
    MinimapFontLabel.Font.Assign(FontDialog.Font);
    MinimapFontLabel.Caption := Format('%s %dpt', [MinimapFontLabel.Font.Name, MinimapFontLabel.Font.Size]);
    SynEdit.Minimap.Font.Assign(FontDialog.Font);
    SynEdit.Invalidate;
  end;
end;

end.
