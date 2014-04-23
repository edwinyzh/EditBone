unit DocumentTabSheet;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls,
  Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, VirtualTrees, SynEdit, BCControls.SynEdit, Vcl.ActnList, SynEditHighlighter,
  SynURIOpener, SynHighlighterURI, SynCompletionProposal, DocumentXMLTree, BCControls.ProgressBar, Vcl.Menus;

type
  TDocTabSheetFrame = class(TFrame)
    DocumentPanel: TPanel;
    HorizontalSplitter: TSplitter;
    Panel: TPanel;
    SplitSynEdit: TBCSynEdit;
    SynURIOpener: TSynURIOpener;
    SynURISyn: TSynURISyn;
    VerticalSplitter: TSplitter;
    SplitSynEditPanel: TPanel;
    SynEdit: TBCSynEdit;
    SynCompletionProposal: TSynCompletionProposal;
    SplitSynCompletionProposal: TSynCompletionProposal;
    XMLTreePanel: TPanel;
    procedure RefreshActionExecute(Sender: TObject);
    procedure SynCompletionProposalExecute(Kind: SynCompletionType; Sender: TObject; var CurrentInput: string; var x,
      y: Integer; var CanExecute: Boolean);
    procedure SplitSynCompletionProposalExecute(Kind: SynCompletionType; Sender: TObject; var CurrentInput: string;
      var x, y: Integer; var CanExecute: Boolean);
    procedure SynEditRightEdgeMouseUp(Sender: TObject);
    procedure SplitSynEditRightEdgeMouseUp(Sender: TObject);
    procedure SynEditMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure SplitSynEditMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    FModified: Boolean;
    FImageList: TImageList;
    FPopupMenu: TPopupMenu;
    FProgressBar: TBCProgressBar;
    FDocumentXMLTreeFrame: TDocumentXMLTreeFrame;
    function GetSplitVisible: Boolean;
    function GetMinimapVisible: Boolean;
    function GetXMLTreeVisible: Boolean;
    function GetCaretX: Integer;
    function GetCaretY: Integer;
    procedure NormalSelectionMode(SynEdit: TBCSynEdit);
    procedure SetSplitVisible(Value: Boolean);
    procedure SetMinimapVisible(Value: Boolean);
    procedure SetXMLTreeVisible(Value: Boolean);
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    procedure LoadFromXML(XML: string);
    procedure UpdateOptionsAndStyles(Right: Integer);
    property ImageList: TImageList read FImageList write FImageList;
    property PopupMenu: TPopupMenu read FPopupMenu write FPopupMenu;
    property SplitVisible: Boolean read GetSplitVisible write SetSplitVisible;
    property MinimapVisible: Boolean read GetMinimapVisible write SetMinimapVisible;
    property XMLTreeVisible: Boolean read GetXMLTreeVisible write SetXMLTreeVisible;
    property ProgressBar: TBCProgressBar read FProgressBar write FProgressBar;
    property CaretX: Integer read GetCaretX;
    property CaretY: Integer read GetCaretY;
  end;

implementation

{$R *.dfm}

uses
  Vcl.Themes, BCCommon.OptionsContainer, BCCommon.StyleUtils, BCCommon.StringUtils, System.Math, BCCommon.Math,
  SynEditTypes;

constructor TDocTabSheetFrame.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FModified := False;

  Panel.Padding.Right := GetRightPadding;
  UpdateOptionsAndStyles(Panel.Padding.Right);

  VerticalSplitter.Width := GetSplitterSize;
  HorizontalSplitter.Height := VerticalSplitter.Width;
  UpdateOptionsAndStyles(Panel.Padding.Right);
end;

procedure TDocTabSheetFrame.NormalSelectionMode(SynEdit: TBCSynEdit);
begin
  if OptionsContainer.EnableSelectionMode and (eoAltSetsColumnMode in SynEdit.Options) then
  begin
    OptionsContainer.EnableSelectionMode := False;
    SynEdit.Options := SynEdit.Options - [eoAltSetsColumnMode];
    SynEdit.Selectionmode := smNormal;
  end;
end;

procedure TDocTabSheetFrame.SynEditMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  NormalSelectionMode(SynEdit);
end;

procedure TDocTabSheetFrame.SynEditRightEdgeMouseUp(Sender: TObject);
begin
  OptionsContainer.MarginRightMargin := SynEdit.RightEdge.Position;
  SplitSynEdit.RightEdge.Position := SynEdit.RightEdge.Position;
end;

function TDocTabSheetFrame.GetXMLTreeVisible: Boolean;
begin
  Result := XMLTreePanel.Visible;
  Application.ProcessMessages;
end;

procedure TDocTabSheetFrame.SetXMLTreeVisible(Value: Boolean);
begin
  VerticalSplitter.Visible := Value;
  if not Assigned(FDocumentXMLTreeFrame) then
  begin
    FDocumentXMLTreeFrame := TDocumentXMLTreeFrame.Create(XMLTreePanel);
    FDocumentXMLTreeFrame.ProgressBar := ProgressBar;
    FDocumentXMLTreeFrame.SynEdit := SynEdit;
    FDocumentXMLTreeFrame.VirtualDrawTree.Images := ImageList;
    FDocumentXMLTreeFrame.VirtualDrawTree.PopupMenu := PopupMenu;
    FDocumentXMLTreeFrame.Parent := XMLTreePanel;
  end;
  XMLTreePanel.Visible := Value;
end;

procedure TDocTabSheetFrame.SynCompletionProposalExecute(Kind: SynCompletionType; Sender: TObject;
  var CurrentInput: string; var x, y: Integer; var CanExecute: Boolean);
var
  MaxLengthWord: string;
begin
  SynCompletionProposal.NbLinesInWindow := 8; { Bug fix }
  MaxLengthWord := SplitTextIntoWords(SynCompletionProposal, SynEdit, OptionsContainer.CompletionProposalCaseSensitive);
  SynCompletionProposal.Width := SynEdit.Canvas.TextWidth(MaxLengthWord) + 40;
  CanExecute := SynCompletionProposal.ItemList.Count > 0;
end;

procedure TDocTabSheetFrame.SplitSynCompletionProposalExecute(Kind: SynCompletionType; Sender: TObject;
  var CurrentInput: string; var x, y: Integer; var CanExecute: Boolean);
var
  MaxLengthWord: string;
begin
  SplitSynCompletionProposal.NbLinesInWindow := 8; { Bug fix }
  MaxLengthWord := SplitTextIntoWords(SplitSynCompletionProposal, SplitSynEdit, OptionsContainer.CompletionProposalCaseSensitive);
  SynCompletionProposal.Width := SplitSynEdit.Canvas.TextWidth(MaxLengthWord);
  CanExecute := SplitSynCompletionProposal.ItemList.Count > 0;
end;

procedure TDocTabSheetFrame.SplitSynEditMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  NormalSelectionMode(SplitSynEdit);
end;

procedure TDocTabSheetFrame.SplitSynEditRightEdgeMouseUp(Sender: TObject);
begin
  OptionsContainer.MarginRightMargin := SplitSynEdit.RightEdge.Position;
  SynEdit.RightEdge.Position := SplitSynEdit.RightEdge.Position;
end;

procedure TDocTabSheetFrame.RefreshActionExecute(Sender: TObject);
begin
  LoadFromXML(SynEdit.Text);
end;

procedure TDocTabSheetFrame.LoadFromXML(XML: string);
begin
  if Assigned(FDocumentXMLTreeFrame) then
    FDocumentXMLTreeFrame.LoadFromXML(XML);
end;

function TDocTabSheetFrame.GetSplitVisible: Boolean;
begin
  Result := SplitSynEditPanel.Visible;
end;

procedure TDocTabSheetFrame.SetSplitVisible(Value: Boolean);
begin
  SplitSynEditPanel.Visible := Value;
  HorizontalSplitter.Visible := Value;
end;

function TDocTabSheetFrame.GetMinimapVisible: Boolean;
begin
  Result := SynEdit.MiniMap.Visible;
end;

procedure TDocTabSheetFrame.SetMinimapVisible(Value: Boolean);
begin
  SynEdit.Minimap.Visible := Value;
  SplitSynEdit.Minimap.Visible := Value;
  UpdateOptionsAndStyles(GetRightPadding);
end;

function TDocTabSheetFrame.GetCaretY: Integer;
begin
  Result := SynEdit.CaretY;
end;

function TDocTabSheetFrame.GetCaretX: Integer;
begin
  Result := SynEdit.CaretX;
end;

procedure TDocTabSheetFrame.UpdateOptionsAndStyles(Right: Integer);
var
  LStyles: TCustomStyleServices;

  procedure SetFontAndColors(SynCompletionProposal: TSynCompletionProposal);
  begin
    SynCompletionProposal.Font.Name := SynEdit.Font.Name;
    SynCompletionProposal.Font.Color := LStyles.GetStyleFontColor(sfEditBoxTextNormal);
    SynCompletionProposal.Font.Size := SynEdit.Font.Size;
    if LStyles.Enabled then
    begin
      with SynCompletionProposal do
      begin
        ClBackground := LStyles.GetStyleColor(scEdit);
        ClSelect := LStyles.GetSystemColor(clHighlight);
        ClSelectedText := LStyles.GetSystemColor(clHighlightText);
        ClTitleBackground := LStyles.GetStyleColor(scEdit);
        ClBorder := LStyles.GetStyleColor(scPanel);
      end;
    end
    else
    begin
      with SynCompletionProposal do
      begin
        ClBackground := clWindow;
        ClSelect := clHighlight;
        ClSelectedText := clHighlightText;
        ClTitleBackground := clBtnFace;
        ClBorder := clBtnFace;
      end;
    end;
  end;

begin
  Panel.Padding.Right := Right;

  { SynCompletionProposal }
  LStyles := StyleServices;
  SetFontAndColors(SynCompletionProposal);
  SetFontAndColors(SplitSynCompletionProposal);
  OptionsContainer.AssignTo(SynCompletionProposal);
  OptionsContainer.AssignTo(SplitSynCompletionProposal);
end;

end.
