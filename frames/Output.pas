unit Output;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls, JvExControls,
  JvLabel, Vcl.ActnList, Vcl.ImgList, Vcl.ToolWin, Vcl.StdCtrls, JvSpeedButton, JvExComCtrls,
  JvComCtrls, Vcl.Menus, BCPopupMenu, VirtualTrees, Vcl.PlatformDefaultStyleActnCtrls,
  Vcl.ActnPopup, BCImageList, Vcl.Themes, OutputTabSheet, BCPageControl;

type
  TOutputFrame = class(TFrame)
    CloseAllMenuItem: TMenuItem;
    CloseAllOtherPagesAction: TAction;
    CloseAllOtherPagesMenuItem: TMenuItem;
    CloseMenuItem: TMenuItem;
    ImageList: TBCImageList;
    OutputActionList: TActionList;
    OutputCloseAction: TAction;
    OutputCloseAllAction: TAction;
    PageControl: TBCPageControl;
    PopupMenu: TBCPopupMenu;
    SeparatorMenuItem: TMenuItem;
    procedure CloseAllOtherPagesActionExecute(Sender: TObject);
    procedure OutputCloseActionExecute(Sender: TObject);
    procedure OutputCloseAllActionExecute(Sender: TObject);
    procedure TabsheetDblClick(Sender: TObject);
    procedure VirtualDrawTreeDrawNode(Sender: TBaseVirtualTree; const PaintInfo: TVTPaintInfo);
    procedure VirtualDrawTreeFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure VirtualDrawTreeGetNodeWidth(Sender: TBaseVirtualTree; HintCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex; var NodeWidth: Integer);
    procedure PageControlCloseButtonClick(Sender: TObject);
  private
    { Private declarations }
    FProcessingTabSheet: Boolean;
    FTabsheetDblClick: TNotifyEvent;
    function GetCount: Integer;
    function GetIsAnyOutput: Boolean;
    function GetIsEmpty: Boolean;
    function GetOutputTabSheetFrame(TabSheet: TTabSheet): TOutputTabSheetFrame;
    function TabFound(TabCaption: string): Boolean;
    procedure SetProcessingTabSheet(Value: Boolean);
  public
    { Public declarations }
    function SelectedLine(var Filename: string; var Ln: LongWord; var Ch: LongWord): Boolean;
    procedure AddTreeView(TabCaption: string; AutoExpand: Boolean = False);
    procedure AddTreeViewLine(Text: WideString); overload;
    procedure AddTreeViewLine(var Root: PVirtualNode; Filename: WideString; Ln, Ch: LongWord; Text: WideString; SearchString: WideString = '');  overload;
    procedure Clear;
    procedure CloseAllOtherTabSheets;
    procedure CloseAllTabSheets;
    procedure CloseTabSheet;
    procedure UpdateControls;
    property Count: Integer read GetCount;
    property IsAnyOutput: Boolean read GetIsAnyOutput;
    property IsEmpty: Boolean read GetIsEmpty;
    property OnTabsheetDblClick: TNotifyEvent read FTabsheetDblClick write FTabsheetDblClick;
    property ProcessingTabSheet: Boolean read FProcessingTabSheet write SetProcessingTabSheet;
  end;

implementation

{$R *.dfm}

uses
  Common, Lib, Options, StyleHooks, Math;

procedure TOutputFrame.OutputCloseActionExecute(Sender: TObject);
begin
  CloseTabSheet;
end;

procedure TOutputFrame.OutputCloseAllActionExecute(Sender: TObject);
begin
  CloseAllTabSheets;
end;

procedure TOutputFrame.PageControlCloseButtonClick(Sender: TObject);
begin
  OutputCloseAction.Execute;
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
    if Trim(PageControl.Pages[i].Caption) = TabCaption then
    begin
      PageControl.ActivePageIndex := i;
      Result := True;
      Break;
    end;
end;

procedure TOutputFrame.AddTreeView(TabCaption: string; AutoExpand: Boolean);
var
  TabSheet: TTabSheet;
  OutputTabSheetFrame: TOutputTabSheetFrame;
begin
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
  TabSheet.Caption := TabCaption;
  PageControl.ActivePage := TabSheet;

  OutputTabSheetFrame := TOutputTabSheetFrame.Create(TabSheet);
  with OutputTabSheetFrame do
  begin
    Parent := TabSheet;
    if AutoExpand then
      VirtualDrawTree.TreeOptions.AutoOptions := VirtualDrawTree.TreeOptions.AutoOptions + [toAutoExpand];
    VirtualDrawTree.OnDrawNode := VirtualDrawTreeDrawNode;
    VirtualDrawTree.OnFreeNode := VirtualDrawTreeFreeNode;
    VirtualDrawTree.OnGetNodeWidth := VirtualDrawTreeGetNodeWidth;
    VirtualDrawTree.OnDblClick := TabsheetDblClick;
    VirtualDrawTree.NodeDataSize := SizeOf(TOutputRec);
  end;
  UpdateControls;
  TabSheet.TabVisible := True;
  Self.Clear;
end;

procedure TOutputFrame.AddTreeViewLine(Text: WideString);
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
        S := System.Copy(Data.Text, Integer(Data.TextCh) + Integer(System.Length(Data.SearchString)), Length(Data.Text));
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
end;

procedure TOutputFrame.AddTreeViewLine(var Root: PVirtualNode; Filename: WideString; Ln, Ch: LongWord; Text: WideString; SearchString: WideString);
var
  Node: PVirtualNode;
  NodeData: POutputRec;
  OutputTreeView: TVirtualDrawTree;
  s: WideString;
begin
  OutputTreeView := GetOutputTabSheetFrame(PageControl.ActivePage).VirtualDrawTree;
  if not Assigned(OutputTreeView) then
    Exit;

  if not Assigned(Root) then
  begin
    Root := OutputTreeView.GetFirst;
    while Assigned(Root) do
    begin
      NodeData := OutputTreeView.GetNodeData(Root);
      if String(NodeData.Filename) = FileName then
        Break;
      Root := OutputTreeView.GetNext(Root);
    end;
  end;

  if not Assigned(Root) then
  begin
    Root := OutputTreeView.AddChild(nil);
    NodeData := OutputTreeView.GetNodeData(Root);
    NodeData.Level := 0;
    NodeData.Filename := Filename;

  end;

  Node := OutputTreeView.AddChild(Root);
  NodeData := OutputTreeView.GetNodeData(Node);
  NodeData.Level := 1;
  NodeData.Ln := Ln;
  NodeData.Ch := Ch;
  NodeData.SearchString := SearchString;
  NodeData.Filename := Filename;

  s := Text;

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

  NodeData.Text := s;
  OutputTreeView.Tag := OutputTreeView.Tag + 1;
  Application.ProcessMessages;
end;

procedure TOutputFrame.Clear;
var
  OutputTreeView: TVirtualDrawTree;
begin
  OutputTreeView := GetOutputTabSheetFrame(PageControl.ActivePage).VirtualDrawTree;
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
  OutputTreeView := GetOutputTabSheetFrame(PageControl.ActivePage).VirtualDrawTree;
  if not Assigned(OutputTreeView) then
    Exit;

  Node := OutputTreeView.GetFirstSelected;
  NodeData := OutputTreeView.GetNodeData(Node);

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
  OutputTreeView := GetOutputTabSheetFrame(PageControl.ActivePage).VirtualDrawTree;
  if not Assigned(OutputTreeView) then
    Exit;
  Result := OutputTreeView.GetFirst = nil;
end;

function TOutputFrame.GetCount: Integer;
var
  OutputTreeView: TVirtualDrawTree;
begin
  Result := 0;
  OutputTreeView := GetOutputTabSheetFrame(PageControl.ActivePage).VirtualDrawTree;
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
var
  ActivePageIndex: Integer;
begin
  if PageControl.PageCount > 0 then
  begin
    Self.Clear;
    ActivePageIndex := PageControl.ActivePageIndex;
    PageControl.ActivePage.Destroy;
    if PageControl.PageCount > 0 then
      PageControl.ActivePageIndex := Max(ActivePageIndex - 1, 0);
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

function TOutputFrame.GetOutputTabSheetFrame(TabSheet: TTabSheet): TOutputTabSheetFrame;
begin
  Result := nil;
  if Assigned(TabSheet) then
    if TabSheet.ComponentCount <> 0 then
      if TabSheet.Components[0] is TOutputTabSheetFrame then
        Result := TOutputTabSheetFrame(TabSheet.Components[0]);
end;

procedure TOutputFrame.UpdateControls;
var
  i, Right: Integer;
  LStyles: TCustomStyleServices;
  PanelColor: TColor;
  OutputTabSheetFrame: TOutputTabSheetFrame;
begin
  PageControl.DoubleBuffered := TStyleManager.ActiveStyle.Name = STYLENAME_WINDOWS;
  PageControl.MultiLine := OptionsContainer.OutputMultiLine;
  PageControl.ShowCloseButton := OptionsContainer.OutputShowCloseButton;

  LStyles := StyleServices;
  PanelColor := clNone;
  if LStyles.Enabled then
    PanelColor := LStyles.GetStyleColor(scPanel);

  if TStyleManager.ActiveStyle.Name = STYLENAME_WINDOWS then
    Right := 3
  else
  if LStyles.Enabled and
    (GetRValue(PanelColor) + GetGValue(PanelColor) + GetBValue(PanelColor) > 500) then
    Right := 2
  else
    Right := 1;

  for i := 0 to PageControl.PageCount - 1 do
  begin
    OutputTabSheetFrame := GetOutputTabSheetFrame(PageControl.Pages[i]);
    if Assigned(OutputTabSheetFrame) then
      OutputTabSheetFrame.Panel.Padding.Right := Right
  end;
end;

end.
