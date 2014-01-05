unit OptionsToolBarItems;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VirtualTrees, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ActnList,
  System.Generics.Collections;

type
  TOptionsToolBarItemsDialog = class(TForm)
    ButtonPanel: TPanel;
    OKButton: TButton;
    CancelButton: TButton;
    ButtonDividerPanel: TPanel;
    AddItemsVirtualDrawTree: TVirtualDrawTree;
    procedure AddItemsVirtualDrawTreeDrawNode(Sender: TBaseVirtualTree; const PaintInfo: TVTPaintInfo);
    procedure AddItemsVirtualDrawTreeGetImageIndex(Sender: TBaseVirtualTree; Node: PVirtualNode; Kind: TVTImageKind;
      Column: TColumnIndex; var Ghosted: Boolean; var ImageIndex: Integer);
    procedure AddItemsVirtualDrawTreeGetNodeWidth(Sender: TBaseVirtualTree; HintCanvas: TCanvas; Node: PVirtualNode;
      Column: TColumnIndex; var NodeWidth: Integer);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    FActionList: TObjectList<TAction>;
  public
    { Public declarations }
    function Open: Boolean;
    procedure GetToolBarItems;
    property ActionList: TObjectList<TAction> read FActionList write FActionList;
  end;

  PTreeData = ^TTreeData;
  TTreeData = record
    Action: TAction;
  end;

function OptionsToolBarItemsDialog(ActionList: TObjectList<TAction>): TOptionsToolBarItemsDialog;

implementation

{$R *.dfm}

uses
  Vcl.Themes, BCCommon.Images;

var
  FOptionsToolBarItemsDialog: TOptionsToolBarItemsDialog;

function OptionsToolBarItemsDialog(ActionList: TObjectList<TAction>): TOptionsToolBarItemsDialog;
begin
  if not Assigned(FOptionsToolBarItemsDialog) then
    Application.CreateForm(TOptionsToolBarItemsDialog, FOptionsToolBarItemsDialog);

  FOptionsToolBarItemsDialog.AddItemsVirtualDrawTree.NodeDataSize := SizeOf(TAction);
  FOptionsToolBarItemsDialog.AddItemsVirtualDrawTree.Images := ImagesDataModule.ImageList; { IDE can lose this }
  FOptionsToolBarItemsDialog.ActionList := ActionList;
  FOptionsToolBarItemsDialog.GetToolBarItems;

  Result := FOptionsToolBarItemsDialog;
end;

function TOptionsToolBarItemsDialog.Open: Boolean;
begin
  Result := ShowModal = mrOk;
end;

procedure TOptionsToolBarItemsDialog.FormDestroy(Sender: TObject);
begin
  FOptionsToolBarItemsDialog := nil;
end;

procedure TOptionsToolBarItemsDialog.AddItemsVirtualDrawTreeDrawNode(Sender: TBaseVirtualTree; const PaintInfo: TVTPaintInfo);
var
  Data: PTreeData;
  S: UnicodeString;
  R: TRect;
  Format: Cardinal;
  LStyles: TCustomStyleServices;
  LColor: TColor;
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

    if Length(S) > 0 then
    begin
      Format := DT_TOP or DT_LEFT or DT_VCENTER or DT_SINGLELINE;
      DrawTextW(Canvas.Handle, PWideChar(S), Length(S), R, Format)
    end;
  end;
end;

procedure TOptionsToolBarItemsDialog.AddItemsVirtualDrawTreeGetImageIndex(Sender: TBaseVirtualTree; Node: PVirtualNode;
  Kind: TVTImageKind; Column: TColumnIndex; var Ghosted: Boolean; var ImageIndex: Integer);
var
  Data: PTreeData;
begin
  if Kind in [ikNormal, ikSelected] then
  begin
    Data := AddItemsVirtualDrawTree.GetNodeData(Node);
    if Assigned(Data) then
      ImageIndex := Data^.Action.ImageIndex;
  end;
end;

procedure TOptionsToolBarItemsDialog.AddItemsVirtualDrawTreeGetNodeWidth(Sender: TBaseVirtualTree; HintCanvas: TCanvas;
  Node: PVirtualNode; Column: TColumnIndex; var NodeWidth: Integer);
begin
  NodeWidth := AddItemsVirtualDrawTree.Width
end;

procedure TOptionsToolBarItemsDialog.GetToolBarItems;
var
  Action: TAction;
  Node: PVirtualNode;
  Data: PTreeData;
begin
  AddItemsVirtualDrawTree.BeginUpdate;
  AddItemsVirtualDrawTree.Clear;
  for Action in FActionList do
  begin
    Node := AddItemsVirtualDrawTree.AddChild(nil);
    Node.CheckType := ctCheckBox;
    Data := AddItemsVirtualDrawTree.GetNodeData(Node);
    Data^.Action := Action;
  end;
  AddItemsVirtualDrawTree.EndUpdate;
end;

end.
