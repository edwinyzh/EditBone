unit Output;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls, JvExControls,
  JvLabel, Vcl.ActnList, Vcl.ImgList, Vcl.ToolWin, Vcl.StdCtrls, JvSpeedButton, JvExComCtrls,
  JvComCtrls, Vcl.Menus, BCPopupMenu, VirtualTrees, Vcl.PlatformDefaultStyleActnCtrls,
  Vcl.ActnPopup, BCImageList, Vcl.Themes;

type
  TOutputFrame = class(TFrame)
    OutputActionList: TActionList;
    OutputCloseAction: TAction;
    ImageList: TBCImageList;
    PageControl: TJvPageControl;
    PopupMenu: TBCPopupMenu;
    CloseMenuItem: TMenuItem;
    CloseAllMenuItem: TMenuItem;
    CloseAllOtherPagesMenuItem: TMenuItem;
    N1: TMenuItem;
    OutputCloseAllAction: TAction;
    CloseAllOtherPagesAction: TAction;
    procedure OutputCloseActionExecute(Sender: TObject);
   // procedure OutputTreeViewCustomDrawItem(Sender: TCustomTreeView; Node: TTreeNode;
   //   State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure TabsheetDblClick(Sender: TObject);
    procedure VirtualDrawTreeDrawNode(Sender: TBaseVirtualTree; const PaintInfo: TVTPaintInfo);
    procedure VirtualDrawTreeFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure VirtualDrawTreeGetNodeWidth(Sender: TBaseVirtualTree;
      HintCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex; var NodeWidth: Integer);
    procedure OutputCloseAllActionExecute(Sender: TObject);
    procedure CloseAllOtherPagesActionExecute(Sender: TObject);
  private
    { Private declarations }
    FTabsheetDblClick: TNotifyEvent;
    FProcessingTabSheet: Boolean;
    function GetIsEmpty: Boolean;
    function GetCount: Integer;
    function GetIsAnyOutput: Boolean;
//    procedure DrawImage(Sender: TCustomTreeView; NodeRect: TRect; ImageIndex: Integer);
    //function TreeView: TJvTreeView;
    function VirtualDrawTree: TVirtualDrawTree;
    procedure SetProcessingTabSheet(Value: Boolean);
    function TabFound(TabCaption: string): Boolean;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    procedure AddTreeView(TabCaption: string; AutoExpand: Boolean = False);
    procedure AddTreeViewLine(Text: string); overload;
    procedure AddTreeViewLine(var Root: PVirtualNode; Filename: WideString; Ln, Ch: LongWord; Text: WideString; SearchString: ShortString = '');  overload;
    procedure CloseTabSheet;
    procedure CloseAllTabSheets;
    procedure CloseAllOtherTabSheets;
    procedure Clear;
    function SelectedLine(var Filename: string; var Ln: LongWord; var Ch: LongWord): Boolean;
    property IsEmpty: Boolean read GetIsEmpty;
    property Count: Integer read GetCount;
    property IsAnyOutput: Boolean read GetIsAnyOutput;
    property OnTabsheetDblClick: TNotifyEvent read FTabsheetDblClick write FTabsheetDblClick;
    property ProcessingTabSheet: Boolean read FProcessingTabSheet write SetProcessingTabSheet;
    procedure UpdateControls;
  end;

implementation

{$R *.dfm}

uses
  Common, Lib, Preferences, StyleHooks;

constructor TOutputFrame.Create(AOwner: TComponent);
begin
  inherited;
  PageControl.MultiLine := OptionsContainer.MultiLine;
end;

procedure TOutputFrame.OutputCloseActionExecute(Sender: TObject);
begin
  CloseTabSheet;
end;

procedure TOutputFrame.OutputCloseAllActionExecute(Sender: TObject);
begin
  CloseAllTabSheets;
end;

procedure TOutputFrame.TabsheetDblClick(Sender: TObject);
begin
  if Assigned(FTabsheetDblClick) then
    FTabsheetDblClick(Sender);
end;

function TOutputFrame.TabFound(TabCaption: string): Boolean;
var
  i: Integer;
begin
  Result := False;
  { check if there already is a tab with same name }
  for i := 0 to PageControl.PageCount - 1 do
    if PageControl.Pages[i].Caption = TabCaption then
    begin
      PageControl.ActivePageIndex := i;
      Result := True;
      Break;
    end;
end;

procedure TOutputFrame.AddTreeView(TabCaption: string; AutoExpand: Boolean);
var
  TabSheet: TTabSheet;
  TreeViewPanel: TPanel;
  OutputTreeView: TVirtualDrawTree;
  LStyles: TCustomStyleServices;
begin
  LStyles := StyleServices;
  { check if there already is a tab with same name }
  if TabFound(TabCaption) then
  begin
    Self.Clear;
    Exit;
  end;

  TabSheet := TTabSheet.Create(PageControl);
  TabSheet.TabVisible := False;
  TabSheet.PageControl := PageControl;
  if TabCaption = Lib.CAPTION_ERRORS then
    TabSheet.ImageIndex := 1 { errors }
  else
    TabSheet.ImageIndex := 0; { find in files }
  TabSheet.Caption := TabCaption; //Format('Search: ''%s''', [TabCaption]);
  PageControl.ActivePage := TabSheet;

  TreeViewPanel := TPanel.Create(PageControl);
  with TreeViewPanel do
  begin
    Parent := TabSheet;
    Align := alClient;
    BevelOuter := bvNone;
    Padding.Top := 1;
    Padding.Left := 1;
    if TStyleManager.ActiveStyle.Name = STYLENAME_WINDOWS then
      Padding.Right := 3
    else
      Padding.Right := 1;
    Padding.Bottom := 2;
    ParentBackground := True;
    //DoubleBuffered := False;
    ParentColor := True;
    //ParentDoubleBuffered := False;
  end;

  OutputTreeView := TVirtualDrawTree.Create(TabSheet);
  with OutputTreeView do
  begin
    Parent := TreeViewPanel;
    Align := alClient;
    DragOperations := [];
    Header.Options := [];
    ParentCtl3D := False;
    Indent := 20; //16;
    TreeOptions.AutoOptions := [toAutoDropExpand, toAutoScroll, toAutoChangeScale, toAutoScrollOnExpand, toAutoTristateTracking, toAutoDeleteMovedNodes];
    TreeOptions.MiscOptions := [toFullRepaintOnResize, toInitOnSave, toToggleOnDblClick, toWheelPanning];
    TreeOptions.PaintOptions := [toShowButtons, toShowRoot, toUseBlendedSelection, toThemeAware];
    if AutoExpand then
      TreeOptions.AutoOptions := TreeOptions.AutoOptions + [toAutoExpand];
    //TreeOptions.SelectionOptions := [toFullRowSelect];
    OnDrawNode := VirtualDrawTreeDrawNode;
    OnFreeNode := VirtualDrawTreeFreeNode;
    OnGetNodeWidth := VirtualDrawTreeGetNodeWidth;
    OnDblClick := TabsheetDblClick;
    Colors.GridLineColor := clScrollBar;
    NodeDataSize := SizeOf(TOutputRec);
    if LStyles.Enabled then
      Color := LStyles.GetStyleColor(scEdit);
  end;
  TabSheet.TabVisible := True;
  Self.Clear;
end;

//function TOutputFrame.TreeView: TJvTreeView;
function TOutputFrame.VirtualDrawTree: TVirtualDrawTree;
var
  i: Integer;
begin
  Result := nil;
  for i := 0 to PageControl.ActivePage.ComponentCount - 1 do
    if PageControl.ActivePage.Components[i] is TVirtualDrawTree then
    begin
      Result := TVirtualDrawTree(PageControl.ActivePage.Components[i]);
      Break;
    end;
end;

procedure TOutputFrame.AddTreeViewLine(Text: string);
var
  Root: PVirtualNode;
begin
  AddTreeViewLine(Root, '', 0, 0, Text);
end;

procedure TOutputFrame.VirtualDrawTreeDrawNode(Sender: TBaseVirtualTree;
  const PaintInfo: TVTPaintInfo);
var
  Data: POutputRec;
  S: UnicodeString;
  R: TRect;
  Format: Cardinal;
  //StartPos: LongWord;
  LStyles: TCustomStyleServices;
  LDetails: TThemedElementDetails;
  LColor: TColor;
begin
  LStyles := StyleServices;
  with Sender as TVirtualDrawTree, PaintInfo do
  begin
    Data := Sender.GetNodeData(Node);

    if not Assigned(Data) then
      Exit;

    if LStyles.Enabled then
      Color := LStyles.GetStyleColor(scEdit);

    if LStyles.Enabled and (vsSelected in PaintInfo.Node.States) then
    begin
      R := ContentRect;
      R.Right := R.Left + NodeWidth;

      LDetails := LStyles.GetElementDetails(tgCellSelected);
      LStyles.DrawElement(Canvas.Handle, LDetails, R);
    end;

    if not LStyles.GetElementColor(LStyles.GetElementDetails(tgCellNormal), ecTextColor, LColor) or  (LColor = clNone) then
      LColor := LStyles.GetSystemColor(clWindowText);
    //get and set the background color
    Canvas.Brush.Color := LStyles.GetStyleColor(scEdit);
    Canvas.Font.Color := LColor;

    if LStyles.Enabled and (vsSelected in PaintInfo.Node.States) then
    begin
       Canvas.Brush.Color := LStyles.GetSystemColor(clHighlight);
       Canvas.Font.Color := LStyles.GetStyleFontColor(sfMenuItemTextSelected);// GetSystemColor(clHighlightText);
    end
    else
    if not LStyles.Enabled and (vsSelected in PaintInfo.Node.States) then
    begin
      Canvas.Brush.Color := clHighlight;
      Canvas.Font.Color := clHighlightText;
    end;

    if Data.Level = 0 then
      Canvas.Font.Style := Canvas.Font.Style + [fsBold]
    else
      Canvas.Font.Style := Canvas.Font.Style - [fsBold];

    {Canvas.Font.Color := clWindowText;

    if (Column = FocusedColumn) and (not Sender.Focused) then
    begin
      Canvas.Brush.Color := clBtnFace;
      Canvas.Font.Color := clBlack;
    end; }

    SetBKMode(Canvas.Handle, TRANSPARENT);

    R := ContentRect;
    InflateRect(R, -TextMargin, 0);
    Dec(R.Right);
    Dec(R.Bottom);

    if Data.Level = 0 then
      S := Data.Filename
    else
      S := String(Data.Text);

    if Length(S) > 0 then
    begin
      Format := DT_TOP or DT_LEFT or DT_VCENTER or DT_SINGLELINE;
      if (Data.Level = 0) or (Data.SearchString = '') then
      begin
        if Data.Level = 1 then
          S := System.SysUtils.Format('%s (%d, %d): ', [ExtractFilename(String(Data.Filename)), Data.Ln, Data.Ch]) + S;
        DrawTextW(Canvas.Handle, PWideChar(S), Length(S), R, Format)
      end
      else
      begin
        S := String(Data.Text);
        S := System.Copy(S, 0, Data.TextCh - 1);

        S := System.SysUtils.Format('%s (%d, %d): ', [ExtractFilename(String(Data.Filename)), Data.Ln, Data.Ch]) + S;

        DrawTextW(Canvas.Handle, PWideChar(S), Length(S), R, Format);
        S := StringReplace(S, Chr(9), '', [rfReplaceAll]); { replace tabs }
        R.Left := R.Left + Canvas.TextWidth(S);
        Canvas.Font.Color := clRed;
        S := Copy(String(Data.Text), Data.TextCh, Length(Data.SearchString));
        Canvas.Font.Style := Canvas.Font.Style + [fsBold];
        DrawTextW(Canvas.Handle, PWideChar(S), Length(S), R, Format);
        Canvas.Font.Color := LColor;
        R.Left := R.Left + Canvas.TextWidth(S);
        Canvas.Font.Style := Canvas.Font.Style - [fsBold];
        S := Copy(String(Data.Text), Data.TextCh + Length(Data.SearchString), Length(String(Data.Text)));
        DrawTextW(Canvas.Handle, PWideChar(S), Length(S), R, Format);
      end;
    end;
  end;
end;

procedure TOutputFrame.VirtualDrawTreeGetNodeWidth(Sender: TBaseVirtualTree;
  HintCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex; var NodeWidth: Integer);
var
  Data: POutputRec;
  AMargin, BoldWidth: Integer;
  S: string;
begin
  with Sender as TVirtualDrawTree do
  begin
    AMargin := TextMargin;
    Data := Sender.GetNodeData(Node);

    case Data.Level of
      0: begin
           Canvas.Font.Style := Canvas.Font.Style + [fsBold];
           NodeWidth := Canvas.TextWidth(Trim(String(Data.FileName))) + 2 * AMargin;
         end;
      1: begin
           S := System.SysUtils.Format('%s (%d, %d): ', [ExtractFilename(String(Data.Filename)), Data.Ln, Data.Ch]);
           Canvas.Font.Style := Canvas.Font.Style + [fsBold];
           BoldWidth := Canvas.TextWidth(String(Data.SearchString));
           Canvas.Font.Style := Canvas.Font.Style - [fsBold];
           BoldWidth := BoldWidth - Canvas.TextWidth(string(Data.SearchString));
           NodeWidth := Canvas.TextWidth(Trim(S + String(Data.Text))) + 2 * AMargin + BoldWidth;
         end;
    end;
  end;
end;

procedure TOutputFrame.VirtualDrawTreeFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
var
  Data: POutputRec;

begin
  Data := Sender.GetNodeData(Node);

  if Assigned(Data) then
  begin
    Data^.Level := 0;
    Data^.Filename := '';
    Data^.Ln := 0;
    Data^.Ch := 0;
    Data^.TextCh := 0;
    Data^.Text := '';
    Data^.SearchString := '';
  end;
  //Finalize(Data^);
end;

procedure TOutputFrame.AddTreeViewLine(var Root: PVirtualNode; Filename: WideString; Ln, Ch: LongWord; Text: WideString; SearchString: ShortString);
var
  Node: PVirtualNode;
  NodeData: POutputRec;
  OutputTreeView: TVirtualDrawTree;
  S: WideString;
begin
  OutputTreeView := VirtualDrawTree;
  if not Assigned(OutputTreeView) then
    Exit;

  if not Assigned(Root) then
  begin
    Root := OutputTreeView.GetFirst;
    while Assigned(Root) do
    begin
      NodeData := VirtualDrawTree.GetNodeData(Root);
      if String(NodeData.Filename) = FileName then
        Break;
      Root := OutputTreeView.GetNext(Root);
    end;
  end;

  if not Assigned(Root) then
  begin
    Root := OutputTreeView.AddChild(nil);
    NodeData := VirtualDrawTree.GetNodeData(Root);
    NodeData.Level := 0;
    NodeData.Filename := Filename;

  end;

  Node := OutputTreeView.AddChild(Root);
  NodeData := VirtualDrawTree.GetNodeData(Node);
  NodeData.Level := 1;
  NodeData.Ln := Ln;
  NodeData.Ch := Ch;
  NodeData.SearchString := SearchString;
  NodeData.Filename := Filename;

  S := Text;

  if NodeData.SearchString <> '' then
  begin
    if Ch > 255 then
    begin
      NodeData.TextCh := 11;
      s := System.Copy(s, Ch - 10, System.Length(s));
    end
    else
      NodeData.TextCh := Ch;
    if System.Length(s) > 255 then
      s := Format('%s...', [System.Copy(s, 0, 251)]);
  end;

  if toAutoExpand in OutputTreeView.TreeOptions.AutoOptions then
    if not OutputTreeView.Expanded[Root] then
      OutputTreeView.FullExpand(Root);

  NodeData.Text := ShortString(S);
  OutputTreeView.Tag := OutputTreeView.Tag + 1;
  Application.ProcessMessages;
end;

procedure TOutputFrame.Clear;
var
  OutputTreeView: TVirtualDrawTree;
begin
  OutputTreeView := VirtualDrawTree;
  if Assigned(OutputTreeView) then
  begin
    OutputTreeView.Clear;
    OutputTreeView.Tag := 0;
  end;
end;

function TOutputFrame.SelectedLine(var Filename: string; var Ln: LongWord; var Ch: LongWord): Boolean;
var
  Node: PVirtualNode;
  NodeData: POutputRec;
  OutputTreeView: TVirtualDrawTree;
begin
  Result := False;
  OutputTreeView := VirtualDrawTree;
  if not Assigned(OutputTreeView) then
    Exit;

  Node := OutputTreeView.GetFirstSelected;
  NodeData := OutputTreeView.GetNodeData(Node);
  {NodeData := nil;
  while Assigned(Node) do
  begin
    NodeData := OutputTreeView.GetNodeData(Node);
    if OutputTreeView.Selected[Node] then
      Break;
    Node := OutputTreeView.GetNext(Node);
  end;}

  Result := Assigned(NodeData) and (NodeData.Text <> '');
  if Result then
  begin
    Filename := String(NodeData.Filename);
    Ln := NodeData.Ln;
    Ch := NodeData.Ch;
  end;
end;

function TOutputFrame.GetIsEmpty: Boolean;
var
  OutputTreeView: TVirtualDrawTree;
begin
  Result := False;
  OutputTreeView := VirtualDrawTree;
  if not Assigned(OutputTreeView) then
    Exit;
  Result := OutputTreeView.GetFirst = nil;
end;

function TOutputFrame.GetCount: Integer;
var
  OutputTreeView: TVirtualDrawTree;
begin
  Result := 0;
  OutputTreeView := VirtualDrawTree;
  if not Assigned(OutputTreeView) then
    Exit;
  Result := OutputTreeView.Tag;
end;

function TOutputFrame.GetIsAnyOutput: Boolean;
begin
  Result := False;
  if Assigned(PageControl) then
    Result := PageControl.PageCount <> 0;
end;

procedure TOutputFrame.CloseTabSheet;
begin
  if PageControl.PageCount > 0 then
  begin
    Self.Clear;
    PageControl.ActivePage.Destroy;
    if PageControl.PageCount > 0 then
      PageControl.ActivePageIndex := PageControl.PageCount - 1;
  end;
end;

procedure TOutputFrame.CloseAllTabSheets;
begin
  while PageControl.PageCount > 0 do
  begin
    Self.Clear;
    PageControl.ActivePage.Destroy;
    if PageControl.PageCount > 0 then
      PageControl.ActivePageIndex := PageControl.PageCount - 1;
  end;
end;

procedure TOutputFrame.CloseAllOtherPagesActionExecute(Sender: TObject);
begin
  CloseAllOtherTabSheets;
end;

procedure TOutputFrame.CloseAllOtherTabSheets;
var
  i: Integer;
begin
  PageControl.ActivePage.Tag := 1; { not destroyed }

  for i := PageControl.PageCount - 1 downto 0 do
  begin
    PageControl.ActivePageIndex := i;
    if PageControl.ActivePage.Tag = 0 then
    begin
      Self.Clear;
      PageControl.ActivePage.Destroy;
    end;
  end;

  PageControl.ActivePage.Tag := 0;
end;

procedure TOutputFrame.SetProcessingTabSheet(Value: Boolean);
begin
  FProcessingTabSheet := Value;
  OutputCloseAction.Enabled := not Value;
end;

procedure TOutputFrame.UpdateControls;
var
  i, j: Integer;
begin
  PageControl.DoubleBuffered := TStyleManager.ActiveStyle.Name = STYLENAME_WINDOWS;

  for i := 0 to PageControl.PageCount - 1 do
    for j := 0 to PageControl.Pages[i].ComponentCount - 1 do
      if PageControl.Pages[i].Components[j] is TPanel then
      begin
        if TStyleManager.ActiveStyle.Name = STYLENAME_WINDOWS then
          TPanel(PageControl.Pages[i].Components[j]).Padding.Right := 3
        else
          TPanel(PageControl.Pages[i].Components[j]).Padding.Right := 1;
      end;
end;

end.
