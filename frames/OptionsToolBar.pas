unit OptionsToolBar;

interface

uses
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, BCControls.CheckBox,
  BCCommon.OptionsContainer, BCFrames.OptionsFrame, Vcl.ComCtrls, BCCommon.Images, Vcl.ImgList, BCControls.ImageList,
  Vcl.ToolWin, BCControls.ToolBar, System.Actions, Vcl.ActnList, System.Generics.Collections, System.Types, VirtualTrees,
  ActiveX, Vcl.Menus;

type
  TOptionsToolBarFrame = class(TOptionsFrame)
    Panel: TPanel;
    ImageList: TBCImageList;
    ButtonActionList: TActionList;
    AddItemAction: TAction;
    DeleteItemAction: TAction;
    AddDividerAction: TAction;
    VirtualDrawTree: TVirtualDrawTree;
    PopupMenu: TPopupMenu;
    Additem1: TMenuItem;
    DeleteItem1: TMenuItem;
    AddDivider1: TMenuItem;
    procedure VirtualDrawTreeDrawNode(Sender: TBaseVirtualTree; const PaintInfo: TVTPaintInfo);
    procedure VirtualDrawTreeGetImageIndex(Sender: TBaseVirtualTree; Node: PVirtualNode; Kind: TVTImageKind;
      Column: TColumnIndex; var Ghosted: Boolean; var ImageIndex: Integer);
    procedure VirtualDrawTreeGetNodeWidth(Sender: TBaseVirtualTree; HintCanvas: TCanvas; Node: PVirtualNode;
      Column: TColumnIndex; var NodeWidth: Integer);
    procedure VirtualDrawTreeFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure VirtualDrawTreeDragAllowed(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex;
      var Allowed: Boolean);
    procedure VirtualDrawTreeDragOver(Sender: TBaseVirtualTree; Source: TObject; Shift: TShiftState; State: TDragState;
      Pt: TPoint; Mode: TDropMode; var Effect: Integer; var Accept: Boolean);
    procedure VirtualDrawTreeDragDrop(Sender: TBaseVirtualTree; Source: TObject; DataObject: IDataObject;
      Formats: TFormatArray; Shift: TShiftState; Pt: TPoint; var Effect: Integer; Mode: TDropMode);
  private
    { Private declarations }
    FActionList: TObjectList<TAction>;
    FIsChanged: Boolean;
    function FindItemByName(ItemName: string): TAction;
  public
    { Public declarations }
    destructor Destroy; override;
    procedure GetToolBarItems;
    procedure PutData; override;
    property ActionList: TObjectList<TAction> read FActionList write FActionList;
  end;

  PTreeData = ^TTreeData;
  TTreeData = record
    Action: TAction;
  end;

function OptionsToolBarFrame(AOwner: TComponent; ActionList: TObjectList<TAction>): TOptionsToolBarFrame;

implementation

{$R *.dfm}

uses
  Winapi.Windows, CommCtrl, BigIni, BCCommon.FileUtils, Vcl.Themes;

var
  FOptionsToolBarFrame: TOptionsToolBarFrame;

function OptionsToolBarFrame(AOwner: TComponent; ActionList: TObjectList<TAction>): TOptionsToolBarFrame;
begin
  if not Assigned(FOptionsToolBarFrame) then
    FOptionsToolBarFrame := TOptionsToolBarFrame.Create(AOwner);
  FOptionsToolBarFrame.VirtualDrawTree.NodeDataSize := SizeOf(TAction);
  FOptionsToolBarFrame.VirtualDrawTree.Images := ImagesDataModule.ImageList; { IDE can lose this }
  FOptionsToolBarFrame.ActionList := ActionList;
  FOptionsToolBarFrame.GetToolBarItems;

  Result := FOptionsToolBarFrame;
end;

destructor TOptionsToolBarFrame.Destroy;
begin
  inherited;
  FOptionsToolBarFrame := nil;
end;

function TOptionsToolBarFrame.FindItemByName(ItemName: string): TAction;
begin
  Result := nil;
  if Assigned(FActionList) then
  for Result in FActionList do
    if Result.Name = ItemName then
      Exit;
end;

procedure TOptionsToolBarFrame.GetToolBarItems;
var
  i: Integer;
  s: string;
  ToolBarItems: TStrings;
  Action: TAction;
  Node: PVirtualNode;
  Data: PTreeData;
begin
  { read from ini }
  ToolBarItems := TStringList.Create;
  with TBigIniFile.Create(GetIniFilename) do
  try
    { read items from ini }
    ReadSectionValues('ToolBarItems', ToolBarItems);
    { add items to action bar }
    VirtualDrawTree.BeginUpdate;
    VirtualDrawTree.Clear;
    for i := 0 to ToolBarItems.Count - 1 do
    begin
      Node := VirtualDrawTree.AddChild(nil);
      Data := VirtualDrawTree.GetNodeData(Node);

      s := System.Copy(ToolBarItems.Strings[i], Pos('=', ToolBarItems.Strings[i]) + 1, Length(ToolBarItems.Strings[i]));
      if s <> '-' then
      begin
        Action := FindItemByName(s);
        if Assigned(Action) then
          Action.Tag := 1;
      end
      else
      begin
        Action := TAction.Create(nil);
        Action.Caption := '-';
      end;
      Data^.Action := Action;
    end;
    VirtualDrawTree.EndUpdate;
  finally
    Free;
    ToolBarItems.Free;
  end;
end;

procedure TOptionsToolBarFrame.PutData;
begin
  { write to ini }
  if FIsChanged then
  begin
    with TBigIniFile.Create(GetIniFilename) do
    try
      WriteBool('ToolBarItemsChanged', 'Changed', True);
    finally
      Free;
    end;


  end;
end;

procedure TOptionsToolBarFrame.VirtualDrawTreeDragAllowed(Sender: TBaseVirtualTree; Node: PVirtualNode;
  Column: TColumnIndex; var Allowed: Boolean);
begin
  inherited;
  Allowed := True;
end;

procedure TOptionsToolBarFrame.VirtualDrawTreeDragDrop(Sender: TBaseVirtualTree; Source: TObject;
  DataObject: IDataObject; Formats: TFormatArray; Shift: TShiftState; Pt: TPoint; var Effect: Integer; Mode: TDropMode);
var
  pSource, pTarget: PVirtualNode;
  attMode: TVTNodeAttachMode;
begin
  pSource := TVirtualStringTree(Source).FocusedNode;
  pTarget := Sender.DropTargetNode;

  attMode := amNoWhere;
  case Mode of
    dmNowhere: attMode := amNoWhere;
    dmAbove: attMode := amInsertBefore;
    dmOnNode, dmBelow: attMode := amInsertAfter;
  end;

  Sender.MoveTo(pSource, pTarget, attMode, False);
  FIsChanged := True;
end;

procedure TOptionsToolBarFrame.VirtualDrawTreeDragOver(Sender: TBaseVirtualTree; Source: TObject; Shift: TShiftState;
  State: TDragState; Pt: TPoint; Mode: TDropMode; var Effect: Integer; var Accept: Boolean);
begin
  inherited;
  Accept := (Source = Sender);
end;

procedure TOptionsToolBarFrame.VirtualDrawTreeDrawNode(Sender: TBaseVirtualTree; const PaintInfo: TVTPaintInfo);
var
  Data: PTreeData;
  S: UnicodeString;
  R: TRect;
  Format: Cardinal;
  LStyles: TCustomStyleServices;
  LColor: TColor;
  i, HyphenCount: Integer;
begin
  LStyles := StyleServices;
  with Sender as TVirtualDrawTree, PaintInfo do
  begin
    Data := Sender.GetNodeData(Node);

    if not Assigned(Data) then
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
       Canvas.Font.Color := LStyles.GetStyleFontColor(sfMenuItemTextSelected);
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
    S := Data^.Action.Caption;
    if S = '-' then
    begin
      with R do
        HyphenCount := (Right - Left) div Canvas.TextWidth(S);
      for i := 0 to HyphenCount  do
        S := S + '-';
    end;

    if Length(S) > 0 then
    begin
      Format := DT_TOP or DT_LEFT or DT_VCENTER or DT_SINGLELINE;
      DrawTextW(Canvas.Handle, PWideChar(S), Length(S), R, Format)
    end;
  end;
end;

procedure TOptionsToolBarFrame.VirtualDrawTreeFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
var
  Data: PTreeData;
begin
  inherited;
  Data := VirtualDrawTree.GetNodeData(Node);
  if Assigned(Data) then
    if Data^.Action.Caption = '-' then
      Data^.Action.Free;
end;

procedure TOptionsToolBarFrame.VirtualDrawTreeGetImageIndex(Sender: TBaseVirtualTree; Node: PVirtualNode;
  Kind: TVTImageKind; Column: TColumnIndex; var Ghosted: Boolean; var ImageIndex: Integer);
var
  Data: PTreeData;
begin
  if Kind in [ikNormal, ikSelected] then
  begin
    Data := VirtualDrawTree.GetNodeData(Node);
    if Assigned(Data) then
      ImageIndex := Data^.Action.ImageIndex;
  end;
end;

procedure TOptionsToolBarFrame.VirtualDrawTreeGetNodeWidth(Sender: TBaseVirtualTree; HintCanvas: TCanvas;
  Node: PVirtualNode; Column: TColumnIndex; var NodeWidth: Integer);
begin
  NodeWidth := VirtualDrawTree.Width
end;

end.
