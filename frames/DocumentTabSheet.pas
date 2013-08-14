unit DocumentTabSheet;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, VirtualTrees, SynEdit, BCControls.SynEdit,
  Xml.XMLIntf, Xml.xmldom, Xml.Win.msxmldom, Xml.XMLDoc, Vcl.ImgList, BCControls.ImageList, Vcl.Menus,
  Vcl.ActnList, SynEditHighlighter, SynHighlighterMulti, SynURIOpener, SynHighlighterURI, SynMinimap,
  SynCompletionProposal;

type
  PXMLTreeRec = ^TXMLTreeRec;
  TXMLTreeRec = record
    Data: IXMLNode;
  end;

  TDocTabSheetFrame = class(TFrame)
    DocumentPanel: TPanel;
    HorizontalSplitter: TSplitter;
    Panel: TPanel;
    SplitSynEdit: TBCSynEdit;
    SynURIOpener: TSynURIOpener;
    SynURISyn: TSynURISyn;
    VerticalSplitter: TSplitter;
    VirtualDrawTree: TVirtualDrawTree;
    XMLDocument: TXMLDocument;
    SynEditSplitter: TSplitter;
    SplitSynEditPanel: TPanel;
    SplitSynEditMinimap: TSynMinimap;
    SplitSynEditSplitter: TSplitter;
    SynEditMinimap: TSynMinimap;
    SynEdit: TBCSynEdit;
    SynCompletionProposal: TSynCompletionProposal;
    SplitSynCompletionProposal: TSynCompletionProposal;
    procedure RefreshActionExecute(Sender: TObject);
    procedure VirtualDrawTreeDrawNode(Sender: TBaseVirtualTree; const PaintInfo: TVTPaintInfo);
    procedure VirtualDrawTreeFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure VirtualDrawTreeGetImageIndex(Sender: TBaseVirtualTree; Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex; var Ghosted: Boolean; var ImageIndex: Integer);
    procedure VirtualDrawTreeGetNodeWidth(Sender: TBaseVirtualTree; HintCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex; var NodeWidth: Integer);
    procedure VirtualDrawTreeInitChildren(Sender: TBaseVirtualTree; Node: PVirtualNode; var ChildCount: Cardinal);
    procedure VirtualDrawTreeInitNode(Sender: TBaseVirtualTree; ParentNode, Node: PVirtualNode; var InitialStates: TVirtualNodeInitStates);
    procedure SynEditMinimapClick(Sender: TObject; Data: PSynMinimapEventData);
    procedure SplitSynEditMinimapClick(Sender: TObject; Data: PSynMinimapEventData);
    procedure SynCompletionProposalExecute(Kind: SynCompletionType; Sender: TObject; var CurrentInput: string; var x,
      y: Integer; var CanExecute: Boolean);
    procedure SplitSynCompletionProposalExecute(Kind: SynCompletionType; Sender: TObject; var CurrentInput: string;
      var x, y: Integer; var CanExecute: Boolean);
  private
    { Private declarations }
    function GetSplitVisible: Boolean;
    function GetMinimapVisible: Boolean;
    function GetXMLTreeVisible: Boolean;
    procedure ProcessNode(Node: IXMLNode; TreeNode: PVirtualNode);
    procedure SetSplitVisible(Value: Boolean);
    procedure SetMinimapVisible(Value: Boolean);
    procedure SetXMLTreeVisible(Value: Boolean);
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    procedure LoadFromXML(XML: string);
    procedure UpdateMinimapAndStyles(Right: Integer);
    property SplitVisible: Boolean read GetSplitVisible write SetSplitVisible;
    property MinimapVisible: Boolean read GetMinimapVisible write SetMinimapVisible;
    property XMLTreeVisible: Boolean read GetXMLTreeVisible write SetXMLTreeVisible;
  end;

implementation

{$R *.dfm}

uses
  Vcl.Themes, Options, BCCommon.StyleUtils;

constructor TDocTabSheetFrame.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Panel.Padding.Right := GetRightPadding;
  VerticalSplitter.Width := GetSplitterSize;
  HorizontalSplitter.Height := VerticalSplitter.Width;
  SynEditSplitter.Width := VerticalSplitter.Width;
end;

function TDocTabSheetFrame.GetXMLTreeVisible: Boolean;
begin
  Result := VirtualDrawTree.Visible;
end;

procedure TDocTabSheetFrame.SetXMLTreeVisible(Value: Boolean);
begin
  VerticalSplitter.Visible := Value;
  VirtualDrawTree.Visible := Value;
end;

procedure GotoLine(SynEdit: TSynEdit; Data: PSynMinimapEventData);
begin
  if Assigned(SynEdit) then
  begin
    SynEdit.GotoLineAndCenter(Data.Coord.Line);
    SynEdit.CaretX := Data.Coord.Char;
  end;
end;

function SplitTextIntoWords(SynCompletionProposal: TSynCompletionProposal; SynEdit: TBCSynEdit): string;
var
  i: Integer;
  S, Word: string;
  StringList: TStringList;
  startpos, endpos: Integer;
  KeywordStringList: TStrings;
begin
  Result := '';
  S := SynEdit.Text;
  SynCompletionProposal.ItemList.Clear;
  startpos := 1;
  KeywordStringList := TStringList.Create;
  StringList := TStringList.Create;
  try
    { add document words }
    while startpos <= Length(S) do
    begin
      while (startpos <= Length(S)) and not IsCharAlpha(S[startpos]) do
        Inc(startpos);
      if startpos <= Length(S) then
      begin
        endpos := startpos + 1;
        while (endpos <= Length(S)) and IsCharAlpha(S[endpos]) do
          Inc(endpos);
        Word := Copy(S, startpos, endpos - startpos);
        if endpos - startpos > Length(Result) then
          Result := Word;
        if StringList.IndexOf(Word) = -1 then { no duplicates }
          StringList.Add(Word);
        startpos := endpos + 1;
      end;
    end;
    { add highlighter keywords }
    SynEdit.Highlighter.AddKeywords(KeywordStringList);
    for i := 0 to KeywordStringList.Count - 1 do
    begin
      Word := KeywordStringList.Strings[i];
      if Length(Word) > Length(Result) then
        Result := Word;
      if StringList.IndexOf(Word) = -1 then { no duplicates }
        StringList.Add(Word);
    end;
  finally
    StringList.Sort;
    SynCompletionProposal.ItemList.Assign(StringList);
    StringList.Free;
    if Assigned(KeywordStringList) then
      KeywordStringList.Free;
  end;
end;

procedure TDocTabSheetFrame.SynCompletionProposalExecute(Kind: SynCompletionType; Sender: TObject;
  var CurrentInput: string; var x, y: Integer; var CanExecute: Boolean);
var
  MaxLengthWord: string;
begin
  SynCompletionProposal.NbLinesInWindow := 8; { Bug fix }
  MaxLengthWord := SplitTextIntoWords(SynCompletionProposal, SynEdit);
  SynCompletionProposal.Width := SynEdit.Canvas.TextWidth(MaxLengthWord) + 40;
  CanExecute := SynCompletionProposal.ItemList.Count > 0;
end;

procedure TDocTabSheetFrame.SynEditMinimapClick(Sender: TObject; Data: PSynMinimapEventData);
begin
  GotoLine(SynEditMinimap.Editor, Data);
end;

procedure TDocTabSheetFrame.SplitSynCompletionProposalExecute(Kind: SynCompletionType; Sender: TObject;
  var CurrentInput: string; var x, y: Integer; var CanExecute: Boolean);
var
  MaxLengthWord: string;
begin
  SplitSynCompletionProposal.NbLinesInWindow := 8; { Bug fix }
  MaxLengthWord := SplitTextIntoWords(SplitSynCompletionProposal, SplitSynEdit);
  SynCompletionProposal.Width := SplitSynEdit.Canvas.TextWidth(MaxLengthWord);
  CanExecute := SplitSynCompletionProposal.ItemList.Count > 0;
end;

procedure TDocTabSheetFrame.SplitSynEditMinimapClick(Sender: TObject; Data: PSynMinimapEventData);
begin
  GotoLine(SplitSynEditMinimap.Editor, Data);
end;

function IsNameNodeType(NodeType: TNodeType): Boolean;
begin
  Result := (Ord(NodeType) <> 3) and (Ord(NodeType) <> 4) and (Ord(NodeType) <> 8);
end;

procedure TDocTabSheetFrame.VirtualDrawTreeDrawNode(Sender: TBaseVirtualTree;
  const PaintInfo: TVTPaintInfo);
var
  TreeNode: PXMLTreeRec;
  S: UnicodeString;
  R: TRect;
  Format: Cardinal;
  LStyles: TCustomStyleServices;
  LColor: TColor;
begin
  LStyles := StyleServices;
  with Sender as TVirtualDrawTree, PaintInfo do
  begin
    TreeNode := Sender.GetNodeData(Node);

    if not Assigned(TreeNode) then
      Exit;

    if not LStyles.GetElementColor(LStyles.GetElementDetails(tgCellNormal), ecTextColor, LColor) or  (LColor = clNone) then
      LColor := LStyles.GetSystemColor(clWindowText);
    //get and set the background color
    Canvas.Brush.Color := LStyles.GetStyleColor(scEdit);
    Canvas.Font.Color := LColor;

    if LStyles.Enabled and (vsSelected in PaintInfo.Node.States) then
    begin
       Colors.FocusedSelectionColor := LStyles.GetSystemColor(clHighlight);
       Colors.FocusedSelectionBorderColor := LStyles.GetSystemColor(clHighlight);
       Colors.UnfocusedSelectionColor := LStyles.GetSystemColor(clHighlight);
       Colors.UnfocusedSelectionBorderColor := LStyles.GetSystemColor(clHighlight);
       Canvas.Brush.Color := LStyles.GetSystemColor(clHighlight);
       Canvas.Font.Color := LStyles.GetStyleFontColor(sfMenuItemTextSelected);// GetSystemColor(clHighlightText);
    end
    else
    if not LStyles.Enabled and (vsSelected in PaintInfo.Node.States) then
    begin
      Canvas.Brush.Color := clHighlight;
      Canvas.Font.Color := clHighlightText;
    end;

    SetBKMode(Canvas.Handle, TRANSPARENT);

    R := ContentRect;
    InflateRect(R, -TextMargin, 0);
    Dec(R.Right);
    Dec(R.Bottom);
    if IsNameNodeType(TreeNode.Data.NodeType) then
      S := TreeNode.Data.NodeName
    else
      S := TreeNode.Data.NodeValue;

    if Length(S) > 0 then
    begin
      with R do
      begin
        if (NodeWidth - 2 * Margin) > (Right - Left) then
          S := ShortenString(Canvas.Handle, S, Right - Left);
      end;
      Format := DT_TOP or DT_LEFT or DT_VCENTER or DT_SINGLELINE;
      DrawTextW(Canvas.Handle, PWideChar(S), Length(S), R, Format);
    end;

  end;
end;

procedure TDocTabSheetFrame.VirtualDrawTreeFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
var
  Data: PXMLTreeRec;
begin
  Data := Sender.GetNodeData(Node);
  Finalize(Data^);
end;

procedure TDocTabSheetFrame.VirtualDrawTreeGetImageIndex(Sender: TBaseVirtualTree; Node: PVirtualNode;
  Kind: TVTImageKind; Column: TColumnIndex; var Ghosted: Boolean; var ImageIndex: Integer);
var
  TreeNode: PXMLTreeRec;
begin
  if Kind in [ikNormal, ikSelected] then
  begin
    TreeNode := VirtualDrawTree.GetNodeData(Node);
    ImageIndex := Ord(TreeNode.Data.NodeType);
  end;
end;

procedure TDocTabSheetFrame.VirtualDrawTreeGetNodeWidth(Sender: TBaseVirtualTree; HintCanvas: TCanvas;
  Node: PVirtualNode; Column: TColumnIndex; var NodeWidth: Integer);
var
  TreeNode: PXMLTreeRec;
  AMargin: Integer;
begin
  with Sender as TVirtualDrawTree do
  begin
    AMargin := TextMargin;
    TreeNode := Sender.GetNodeData(Node);
    if IsNameNodeType(TreeNode.Data.NodeType) then
      NodeWidth := Canvas.TextWidth(TreeNode.Data.NodeName) + 2 * AMargin
    else
      NodeWidth := Canvas.TextWidth(TreeNode.Data.NodeValue) + 2 * AMargin
  end;
end;

procedure TDocTabSheetFrame.ProcessNode(Node: IXMLNode; TreeNode: PVirtualNode);
var
  VirtualNode: PVirtualNode;
  NodeData: PXMLTreeRec;
begin
  if not Assigned(Node) then
    Exit;
  Application.ProcessMessages;

  VirtualNode := VirtualDrawTree.AddChild(TreeNode);
  NodeData := VirtualDrawTree.GetNodeData(VirtualNode);
  NodeData.Data := Node;
end;

procedure TDocTabSheetFrame.RefreshActionExecute(Sender: TObject);
begin
  LoadFromXML(SynEdit.Text);
end;

procedure TDocTabSheetFrame.VirtualDrawTreeInitChildren(Sender: TBaseVirtualTree; Node: PVirtualNode;
  var ChildCount: Cardinal);
var
  i: Integer;
  TreeNode: PXMLTreeRec;
  XMLNode: IXMLNode;
begin
  TreeNode := VirtualDrawTree.GetNodeData(Node);
  XMLNode := TreeNode.Data;
  { attributes }
  for i := 0 to XMLNode.AttributeNodes.Count - 1 do
    ProcessNode(XMLNode.AttributeNodes.Get(i), Node);
  { childnodes }
  XMLNode := TreeNode.Data.ChildNodes.First;
  while Assigned(XMLNode) do
  begin
    ProcessNode(XMLNode, Node);
    XMLNode := XMLNode.NextSibling;
  end;
  ChildCount := VirtualDrawTree.ChildCount[Node];
end;

procedure TDocTabSheetFrame.VirtualDrawTreeInitNode(Sender: TBaseVirtualTree; ParentNode,
  Node: PVirtualNode; var InitialStates: TVirtualNodeInitStates);
var
  TreeNode: PXMLTreeRec;
begin
  inherited;
  TreeNode := VirtualDrawTree.GetNodeData(Node);
  if TreeNode.Data.HasChildNodes or (UpperCase(TreeNode.Data.NodeName) = 'XML') then
    Include(InitialStates, ivsHasChildren);
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
  Result := SynEditMinimap.Visible;
end;

procedure TDocTabSheetFrame.SetMinimapVisible(Value: Boolean);
begin
  SynEditMinimap.Visible := Value;
  SynEditSplitter.Visible := Value;
  SplitSynEditMinimap.Visible := Value;
  SplitSynEditSplitter.Visible := Value;
end;

procedure TDocTabSheetFrame.LoadFromXML(XML: string);
var
  XMLNode: IXMLNode;
begin
  try
    XMLDocument.LoadFromXML(XML);

    VirtualDrawTree.Clear;
    VirtualDrawTree.NodeDataSize := SizeOf(TXMLTreeRec);
    VirtualDrawTree.BeginUpdate;

    XMLNode := XMLDocument.ChildNodes.First;
    while Assigned(XMLNode) do
    begin
      ProcessNode(XMLNode, nil);
      XMLNode := XMLNode.NextSibling;
    end;
  finally
    VirtualDrawTree.EndUpdate;
  end;
end;

procedure TDocTabSheetFrame.UpdateMinimapAndStyles(Right: Integer);
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
      end;
    end;
  end;

begin
  Panel.Padding.Right := Right;
  {  SynEditMinimap }
  SynEditMinimap.FontFactor := OptionsContainer.MinimapFontFactor;
  SynEditMinimap.Invalidate;
  SplitSynEditMinimap.FontFactor := OptionsContainer.MinimapFontFactor;
  SplitSynEditMinimap.Invalidate;
  { SynCompletionProposal }
  LStyles := StyleServices;
  SetFontAndColors(SynCompletionProposal);
  SetFontAndColors(SplitSynCompletionProposal);
end;

end.
