unit DocumentTabSheet;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, VirtualTrees, SynEdit, BCControls.SynEdit,
  Xml.XMLIntf, Xml.xmldom, Xml.Win.msxmldom, Xml.XMLDoc, Vcl.ImgList, BCControls.ImageList, Vcl.Menus,
  Vcl.ActnList, SynEditHighlighter, SynHighlighterMulti, SynURIOpener, SynHighlighterURI,
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
    SplitSynEditSplitter: TSplitter;
    SynEdit: TBCSynEdit;
    SynCompletionProposal: TSynCompletionProposal;
    SplitSynCompletionProposal: TSynCompletionProposal;
    SynEditMiniMap: TBCSynEdit;
    SplitSynEditMinimap: TBCSynEdit;
    procedure RefreshActionExecute(Sender: TObject);
    procedure VirtualDrawTreeDrawNode(Sender: TBaseVirtualTree; const PaintInfo: TVTPaintInfo);
    procedure VirtualDrawTreeFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure VirtualDrawTreeGetImageIndex(Sender: TBaseVirtualTree; Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex; var Ghosted: Boolean; var ImageIndex: Integer);
    procedure VirtualDrawTreeGetNodeWidth(Sender: TBaseVirtualTree; HintCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex; var NodeWidth: Integer);
    procedure VirtualDrawTreeInitChildren(Sender: TBaseVirtualTree; Node: PVirtualNode; var ChildCount: Cardinal);
    procedure VirtualDrawTreeInitNode(Sender: TBaseVirtualTree; ParentNode, Node: PVirtualNode; var InitialStates: TVirtualNodeInitStates);
    procedure SynCompletionProposalExecute(Kind: SynCompletionType; Sender: TObject; var CurrentInput: string; var x,
      y: Integer; var CanExecute: Boolean);
    procedure SplitSynCompletionProposalExecute(Kind: SynCompletionType; Sender: TObject; var CurrentInput: string;
      var x, y: Integer; var CanExecute: Boolean);
    procedure SynEditMiniMapPaint(Sender: TObject; ACanvas: TCanvas);
    procedure SynEditMiniMapScroll(Sender: TObject; ScrollBar: TScrollBarKind);
    procedure SynEditMiniMapClick(Sender: TObject);
    procedure SynEditMiniMapMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure SynEditMiniMapMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure SynEditMiniMapKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SynEditMiniMapKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SplitSynEditMinimapClick(Sender: TObject);
    procedure SplitSynEditMinimapKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SplitSynEditMinimapKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SplitSynEditMinimapMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure SplitSynEditMinimapMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure SplitSynEditMinimapScroll(Sender: TObject; ScrollBar: TScrollBarKind);
    procedure SplitSynEditMinimapPaint(Sender: TObject; ACanvas: TCanvas);
    procedure SynEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SynEditKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SynEditMiniMapMouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint;
      var Handled: Boolean);
    procedure SynEditMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure SynEditMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure SynEditMouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint;
      var Handled: Boolean);
    procedure SplitSynEditMinimapMouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint;
      var Handled: Boolean);
    procedure SplitSynEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SplitSynEditKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SplitSynEditMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure SplitSynEditMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure SplitSynEditMouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint;
      var Handled: Boolean);
  private
    { Private declarations }
    OldSynEditProc, OldSynEditMinimapProc, OldSplitSynEditProc, OldSplitSynEditMinimapProc: TWndMethod;
    function GetSplitVisible: Boolean;
    function GetMinimapVisible: Boolean;
    function GetXMLTreeVisible: Boolean;
    procedure SynEditGotoLine(SynEdit, SynEditMiniMap: TBCSynEdit);
    procedure SynEditMinimapGotoLine(SynEdit, SynEditMiniMap: TBCSynEdit);
    procedure Paint(ACanvas: TCanvas; SynEdit, SynEditMiniMap: TBCSynEdit);
    procedure ProcessNode(Node: IXMLNode; TreeNode: PVirtualNode);
    procedure SetSplitVisible(Value: Boolean);
    procedure SetMinimapVisible(Value: Boolean);
    procedure SetXMLTreeVisible(Value: Boolean);
    procedure SynEditWindowProc(var Message: TMessage);
    procedure SynEditMinimapWindowProc(var Message: TMessage);
    procedure SplitSynEditWindowProc(var Message: TMessage);
    procedure SplitSynEditMinimapWindowProc(var Message: TMessage);
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    procedure LoadFromXML(XML: string);
    procedure UpdateOptionsAndStyles(Right: Integer);
    property SplitVisible: Boolean read GetSplitVisible write SetSplitVisible;
    property MinimapVisible: Boolean read GetMinimapVisible write SetMinimapVisible;
    property XMLTreeVisible: Boolean read GetXMLTreeVisible write SetXMLTreeVisible;
  end;

implementation

{$R *.dfm}

uses
  Vcl.Themes, Options, BCCommon.StyleUtils, BCCommon.StringUtils, System.Math, BCCommon.Math;

constructor TDocTabSheetFrame.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Panel.Padding.Right := GetRightPadding;
  VerticalSplitter.Width := GetSplitterSize;
  HorizontalSplitter.Height := VerticalSplitter.Width;
  SynEditSplitter.Width := VerticalSplitter.Width;
  UpdateOptionsAndStyles(Panel.Padding.Right);

  OldSynEditProc := SynEdit.WindowProc;
  OldSynEditMinimapProc := SynEditMinimap.WindowProc;
  SynEdit.WindowProc := SynEditWindowProc;
  SynEditMinimap.WindowProc := SynEditMinimapWindowProc;

  OldSplitSynEditProc := SplitSynEdit.WindowProc;
  OldSplitSynEditMinimapProc := SplitSynEditMinimap.WindowProc;
  SplitSynEdit.WindowProc := SplitSynEditWindowProc;
  SplitSynEditMinimap.WindowProc := SplitSynEditMinimapWindowProc;
end;

procedure TDocTabSheetFrame.SynEditWindowProc(var Message: TMessage);
begin
  OldSynEditProc(Message);
  if (Message.Msg = WM_VSCROLL) or (Message.msg = WM_Mousewheel) then
    OldSynEditMinimapProc(Message);
end;

procedure TDocTabSheetFrame.SynEditMinimapWindowProc(var Message: TMessage);
begin
  OldSynEditMinimapProc(Message);
  if (Message.Msg = WM_VSCROLL) or (Message.msg = WM_Mousewheel) then
    OldSynEditProc(Message);
end;

procedure TDocTabSheetFrame.SynEditMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  SynEditMinimapGotoLine(SynEdit, SynEditMiniMap);
end;

procedure TDocTabSheetFrame.SynEditMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  if Shift = [ssLeft] then
    SynEditMinimapGotoLine(SynEdit, SynEditMiniMap);
end;

procedure TDocTabSheetFrame.SynEditMouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta: Integer;
  MousePos: TPoint; var Handled: Boolean);
begin
  SynEditMinimapGotoLine(SynEditMiniMap, SynEdit);
end;

procedure TDocTabSheetFrame.SplitSynEditWindowProc(var Message: TMessage);
begin
  OldSplitSynEditProc(Message);
  if (Message.Msg = WM_VSCROLL) or (Message.msg = WM_Mousewheel) then
    OldSplitSynEditMinimapProc(Message);
end;

procedure TDocTabSheetFrame.SplitSynEditMinimapWindowProc(var Message: TMessage);
begin
  OldSplitSynEditMinimapProc(Message);
  if (Message.Msg = WM_VSCROLL) or (Message.msg = WM_Mousewheel) then
    OldSplitSynEditProc(Message);
end;

procedure TDocTabSheetFrame.SplitSynEditMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  SynEditMinimapGotoLine(SplitSynEdit, SplitSynEditMiniMap);
end;

procedure TDocTabSheetFrame.SplitSynEditMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  SynEditMinimapGotoLine(SplitSynEdit, SplitSynEditMiniMap);
end;

procedure TDocTabSheetFrame.SplitSynEditMouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta: Integer;
  MousePos: TPoint; var Handled: Boolean);
begin
  SynEditMinimapGotoLine(SplitSynEdit, SplitSynEditMiniMap);
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

procedure TDocTabSheetFrame.SynEditGotoLine(SynEdit, SynEditMiniMap: TBCSynEdit);
begin
  if not SynEditMiniMap.Visible then
    Exit;
  SynEdit.GotoLineAndCenter(SynEditMiniMap.CaretY);
  SynEditMiniMap.Invalidate
end;

procedure TDocTabSheetFrame.SynEditMinimapGotoLine(SynEdit, SynEditMiniMap: TBCSynEdit);
begin
  if not SynEditMiniMap.Visible then
    Exit;
  SynEditMiniMap.Text := SynEdit.Text;
  SynEditMiniMap.GotoLineAndCenter(SynEdit.CaretY);
  SynEditMiniMap.Invalidate
end;

procedure TDocTabSheetFrame.SynEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  SynEditMinimapGotoLine(SynEdit, SynEditMiniMap);
end;

procedure TDocTabSheetFrame.SynEditKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  SynEditMinimapGotoLine(SynEdit, SynEditMiniMap);
end;

procedure TDocTabSheetFrame.SynEditMiniMapClick(Sender: TObject);
begin
  SynEditGotoLine(SynEdit, SynEditMiniMap);
end;

procedure TDocTabSheetFrame.SynEditMiniMapKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  SynEditGotoLine(SynEdit, SynEditMiniMap);
end;

procedure TDocTabSheetFrame.SynEditMiniMapKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  SynEditGotoLine(SynEdit, SynEditMiniMap);
end;

procedure TDocTabSheetFrame.SynEditMiniMapMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  SynEditGotoLine(SynEdit, SynEditMiniMap);
end;

procedure TDocTabSheetFrame.SynEditMiniMapMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  if Shift = [ssLeft] then
    SynEditGotoLine(SynEdit, SynEditMiniMap);
end;

procedure TDocTabSheetFrame.SynEditMiniMapMouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta: Integer;
  MousePos: TPoint; var Handled: Boolean);
begin
  SynEditGotoLine(SynEdit, SynEditMiniMap);
end;

procedure TDocTabSheetFrame.SynEditMiniMapPaint(Sender: TObject; ACanvas: TCanvas);
begin
  Paint(ACanvas, SynEdit, SynEditMiniMap);
end;

procedure TDocTabSheetFrame.Paint(ACanvas: TCanvas; SynEdit, SynEditMiniMap: TBCSynEdit);
var
  Bitmap: TBitmap;
  ARect: TRect;
  LStyles: TCustomStyleServices;
begin
  ARect := ACanvas.ClipRect;
  LStyles := StyleServices;
  Bitmap := TBitmap.Create;
  try
    if LStyles.Enabled then
      Bitmap.Canvas.Brush.Color := LStyles.GetStyleFontColor(sfMenuItemTextDisabled)
    else
      Bitmap.Canvas.Brush.Color := clBtnFace;
    { Top }
    if SynEdit.TopLine > SynEditMiniMap.TopLine then
    begin
      Bitmap.Width := ARect.Right - ARect.Left;
      Bitmap.Height := Min((SynEdit.TopLine - SynEditMiniMap.TopLine) * SynEditMiniMap.LineHeight, SynEditMiniMap.LinesInWindow * SynEditMiniMap.LineHeight);  //ARect.Bottom - ARect.Top;
      Bitmap.Canvas.FillRect(Rect(0, 0, Bitmap.Width, Bitmap.Height));
      ACanvas.Draw(ARect.Left, ARect.Top, Bitmap, 50);
    end;
    { Bottom }
    if SynEdit.TopLine + SynEdit.LinesInWindow < SynEditMiniMap.TopLine + SynEditMiniMap.LinesInWindow then
    begin
      Bitmap.Width := ARect.Right - ARect.Left;
      Bitmap.Height := ARect.Bottom - ARect.Top;
      Bitmap.Canvas.FillRect(Rect(0, 0, Bitmap.Width, Bitmap.Height));
      ACanvas.Draw(ARect.Left, ARect.Top + Max(SynEdit.TopLine - SynEditMiniMap.TopLine + SynEdit.LinesInWindow + 1, 0) * SynEditMiniMap.LineHeight,
        Bitmap, 50);
    end;
  finally
    FreeAndNil(Bitmap);
  end;
end;

procedure TDocTabSheetFrame.SynEditMiniMapScroll(Sender: TObject; ScrollBar: TScrollBarKind);
begin
  SynEditMiniMap.Invalidate;
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

procedure TDocTabSheetFrame.SplitSynEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  SynEditMinimapGotoLine(SplitSynEdit, SplitSynEditMiniMap);
end;

procedure TDocTabSheetFrame.SplitSynEditKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  SynEditMinimapGotoLine(SplitSynEdit, SplitSynEditMiniMap);
end;

procedure TDocTabSheetFrame.SplitSynEditMinimapClick(Sender: TObject);
begin
  SynEditGotoLine(SplitSynEdit, SplitSynEditMiniMap);
end;

procedure TDocTabSheetFrame.SplitSynEditMinimapKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  SynEditGotoLine(SplitSynEdit, SplitSynEditMiniMap);
end;

procedure TDocTabSheetFrame.SplitSynEditMinimapKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  SynEditGotoLine(SplitSynEdit, SplitSynEditMiniMap);
end;

procedure TDocTabSheetFrame.SplitSynEditMinimapMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  SynEditGotoLine(SplitSynEdit, SplitSynEditMiniMap);
end;

procedure TDocTabSheetFrame.SplitSynEditMinimapMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  SynEditGotoLine(SplitSynEdit, SplitSynEditMiniMap);
end;

procedure TDocTabSheetFrame.SplitSynEditMinimapMouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta: Integer;
  MousePos: TPoint; var Handled: Boolean);
begin
  SynEditGotoLine(SplitSynEdit, SplitSynEditMiniMap);
end;

procedure TDocTabSheetFrame.SplitSynEditMinimapPaint(Sender: TObject; ACanvas: TCanvas);
begin
  Paint(ACanvas, SplitSynEdit, SplitSynEditMiniMap);
end;

procedure TDocTabSheetFrame.SplitSynEditMinimapScroll(Sender: TObject; ScrollBar: TScrollBarKind);
begin
  SplitSynEditMiniMap.Invalidate;
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
    if Assigned(TreeNode.Data) then
    begin
      if IsNameNodeType(TreeNode.Data.NodeType) then
        NodeWidth := Canvas.TextWidth(TreeNode.Data.NodeName) + 2 * AMargin
      else
        NodeWidth := Canvas.TextWidth(TreeNode.Data.NodeValue) + 2 * AMargin
    end;
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
  if Assigned(TreeNode.Data) then
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
  SynEditMinimapGotoLine(SynEdit, SynEditMiniMap);
end;

function TDocTabSheetFrame.GetMinimapVisible: Boolean;
begin
  Result := SynEditMiniMap.Visible;
end;

procedure TDocTabSheetFrame.SetMinimapVisible(Value: Boolean);
begin
  SynEditMinimap.Visible := Value;
  SynEditSplitter.Visible := Value;
  SplitSynEditMinimap.Visible := Value;
  SplitSynEditSplitter.Visible := Value;
  UpdateOptionsAndStyles(GetRightPadding);
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

  procedure SetMinimapProperties(SynEditMinimap: TBCSynEdit);
  begin
    SynEditMinimap.Font.Size := OptionsContainer.MinimapFontSize;
    SynEditMinimap.Color := SynEdit.Color;
    SynEditMinimap.Font.Color := SynEdit.Font.Color;
    SynEditMinimap.Highlighter := SynEdit.Highlighter;
    SynEditMinimap.Text := SynEdit.Text;
    SynEditMinimap.ActiveLineColor := SynEdit.ActiveLineColor;
    SynEditMinimap.RightEdge := SynEdit.RightEdge;
    SynEditMinimap.SelectedColor.Background := SynEdit.SelectedColor.Background;
    SynEditMinimap.SelectedColor.Foreground := SynEdit.SelectedColor.Foreground;
  end;

begin
  Panel.Padding.Right := Right;
  { SynEditMinimap }
  SetMinimapProperties(SynEditMinimap);
  { SynEditMinimap }
  SetMinimapProperties(SplitSynEditMinimap);
  { SynCompletionProposal }
  LStyles := StyleServices;
  SetFontAndColors(SynCompletionProposal);
  SetFontAndColors(SplitSynCompletionProposal);
  OptionsContainer.AssignTo(SynCompletionProposal);
  OptionsContainer.AssignTo(SplitSynCompletionProposal);
end;

end.
