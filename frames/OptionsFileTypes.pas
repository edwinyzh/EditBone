unit OptionsFileTypes;

interface

uses
  System.SysUtils, System.Classes, System.Types, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  BCControls.Edit, Vcl.ExtCtrls, BCCommon.OptionsContainer, BCFrames.OptionsFrame, VirtualTrees;

type
  TOptionsFileTypesFrame = class(TOptionsFrame)
    FileTypesBottomPanel: TPanel;
    ExtensionsEdit: TBCEdit;
    FileTypesTopPanel: TPanel;
    ExtensionsLabel: TLabel;
    VirtualDrawTree: TVirtualDrawTree;
    procedure ExtensionsEditChange(Sender: TObject);
    procedure VirtualDrawTreeDrawNode(Sender: TBaseVirtualTree; const PaintInfo: TVTPaintInfo);
    procedure VirtualDrawTreeClick(Sender: TObject);
    procedure VirtualDrawTreeGetNodeWidth(Sender: TBaseVirtualTree; HintCanvas: TCanvas; Node: PVirtualNode;
      Column: TColumnIndex; var NodeWidth: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
    destructor Destroy; override;
    procedure GetFileTypes;
    procedure PutData; override;
  end;

  PTreeData = ^TTreeData;
  TTreeData = record
    FileType: string;
  end;

function OptionsFileTypesFrame(AOwner: TComponent): TOptionsFileTypesFrame;

implementation

{$R *.dfm}

uses
  Winapi.Windows, BCCommon.StringUtils, BCCommon.LanguageStrings, Vcl.Themes;

var
  FOptionsFileTypesFrame: TOptionsFileTypesFrame;

function OptionsFileTypesFrame(AOwner: TComponent): TOptionsFileTypesFrame;
begin
  if not Assigned(FOptionsFileTypesFrame) then
    FOptionsFileTypesFrame := TOptionsFileTypesFrame.Create(AOwner);
  FOptionsFileTypesFrame.VirtualDrawTree.NodeDataSize := SizeOf(TTreeData);
  FOptionsFileTypesFrame.GetFileTypes;
  Result := FOptionsFileTypesFrame;
end;

destructor TOptionsFileTypesFrame.Destroy;
begin
  inherited;
  FOptionsFileTypesFrame := nil;
end;

procedure TOptionsFileTypesFrame.GetFileTypes;
var
  i: Integer;
  FileType: string;
  Node: PVirtualNode;
  Data: PTreeData;
begin
  VirtualDrawTree.BeginUpdate;
  VirtualDrawTree.Clear;
  for i := 0 to OptionsContainer.FileTypes.Count - 1 do
  begin
    Node := VirtualDrawTree.AddChild(nil);
    Data := VirtualDrawTree.GetNodeData(Node);
    FileType := Trim(Copy(LanguageDataModule.FileTypesMultiStringHolder.MultipleStrings.Items[i].Strings.Text, 0,
      Pos('(', LanguageDataModule.FileTypesMultiStringHolder.MultipleStrings.Items[i].Strings.Text) - 1));
    Data^.FileType := Format('%s (%s)', [
      FileType, StringBetween(OptionsContainer.FileTypes.Strings[i], '(', ')')]);
  end;
  Node := VirtualDrawTree.GetFirst;
  if Assigned(Node) then
  begin
    VirtualDrawTree.Selected[Node] := True;
    VirtualDrawTree.OnClick(nil);
  end;
  VirtualDrawTree.EndUpdate;
end;

procedure TOptionsFileTypesFrame.ExtensionsEditChange(Sender: TObject);
var
  Extensions: string;
  Node: PVirtualNode;
  Data: PTreeData;
begin
  Node := VirtualDrawTree.GetFirstSelected;
  if Assigned(Node) then
  begin
    Data := VirtualDrawTree.GetNodeData(Node);
    Extensions := Data^.FileType;
    Extensions := Copy(Extensions, 1, Pos('(', Extensions));
    Data^.FileType := Format('%s%s)', [Extensions, ExtensionsEdit.Text]);
    VirtualDrawTree.Invalidate;
  end;
end;

procedure TOptionsFileTypesFrame.PutData;
var
  i: Integer;
  FileType: string;
  Node: PVirtualNode;
  Data: PTreeData;
begin
  OptionsContainer.FileTypes.Clear;
  Node := VirtualDrawTree.GetFirst;
  i := 0;
  while Assigned(Node) do
  begin
    Data := VirtualDrawTree.GetNodeData(Node);
    FileType := Trim(Copy(LanguageDataModule.FileTypesMultiStringHolder.MultipleStrings.Items[i].Strings.Text, 0,
      Pos('(', LanguageDataModule.FileTypesMultiStringHolder.MultipleStrings.Items[i].Strings.Text) - 1));
    OptionsContainer.FileTypes.Add(Format('%s (%s)', [
      FileType, StringBetween(Data^.FileType, '(', ')')]));
    Node := VirtualDrawTree.GetNext(Node);
    Inc(i);
  end;
end;

procedure TOptionsFileTypesFrame.VirtualDrawTreeClick(Sender: TObject);
var
  Node: PVirtualNode;
  Data: PTreeData;
begin
  inherited;
  Node := VirtualDrawTree.GetFirstSelected;
  if Assigned(Node) then
  begin
    Data := VirtualDrawTree.GetNodeData(Node);
    ExtensionsEdit.Text := StringBetween(Data^.FileType, '(', ')');
  end;
end;

procedure TOptionsFileTypesFrame.VirtualDrawTreeDrawNode(Sender: TBaseVirtualTree; const PaintInfo: TVTPaintInfo);
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
    S := Data^.FileType;
    if Length(S) > 0 then
    begin
      Format := DT_TOP or DT_LEFT or DT_VCENTER or DT_SINGLELINE;
      DrawTextW(Canvas.Handle, PWideChar(S), Length(S), R, Format)
    end;
  end;
end;

procedure TOptionsFileTypesFrame.VirtualDrawTreeGetNodeWidth(Sender: TBaseVirtualTree; HintCanvas: TCanvas;
  Node: PVirtualNode; Column: TColumnIndex; var NodeWidth: Integer);
begin
  inherited;
  NodeWidth := VirtualDrawTree.Width
end;

end.
