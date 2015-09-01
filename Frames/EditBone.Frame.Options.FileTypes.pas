unit EditBone.Frame.Options.FileTypes;

interface

uses
  System.SysUtils, System.Classes, System.Types, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  BCControls.Edit, BCCommon.Options.Container, BCCommon.Frames.Options.Base, VirtualTrees, BCControls.Panel, sEdit,
  Vcl.ExtCtrls, sPanel, sFrameAdapter;

type
  TOptionsFileTypesFrame = class(TBCOptionsBaseFrame)
    EditExtensions: TBCEdit;
    FileTypesTopPanel: TBCPanel;
    PanelFileTypesBottom: TBCPanel;
    VirtualDrawTree: TVirtualDrawTree;
    procedure EditExtensionsChange(Sender: TObject);
    procedure VirtualDrawTreeDrawNode(Sender: TBaseVirtualTree; const PaintInfo: TVTPaintInfo);
    procedure VirtualDrawTreeClick(Sender: TObject);
    procedure VirtualDrawTreeGetNodeWidth(Sender: TBaseVirtualTree; HintCanvas: TCanvas; Node: PVirtualNode;
      Column: TColumnIndex; var NodeWidth: Integer);
    procedure VirtualDrawTreeFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
  protected
    procedure PutData; override;
  public
    destructor Destroy; override;
    procedure GetFileTypes;
  end;

  PTreeData = ^TTreeData;
  TTreeData = record
    FileType: string;
  end;

function OptionsFileTypesFrame(AOwner: TComponent): TOptionsFileTypesFrame;

implementation

{$R *.dfm}

uses
  Winapi.Windows, BCCommon.StringUtils, BCCommon.Language.Strings;

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
    FileType := Trim(Copy(LanguageDataModule.MultiStringHolderFileTypes.MultipleStrings.Items[i].Strings.Text, 0,
      Pos('(', LanguageDataModule.MultiStringHolderFileTypes.MultipleStrings.Items[i].Strings.Text) - 1));
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

procedure TOptionsFileTypesFrame.EditExtensionsChange(Sender: TObject);
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
    Data^.FileType := Format('%s%s)', [Extensions, EditExtensions.Text]);
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
    FileType := Trim(Copy(LanguageDataModule.MultiStringHolderFileTypes.MultipleStrings.Items[i].Strings.Text, 0,
      Pos('(', LanguageDataModule.MultiStringHolderFileTypes.MultipleStrings.Items[i].Strings.Text) - 1));
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
    EditExtensions.Text := StringBetween(Data^.FileType, '(', ')');
  end;
end;

procedure TOptionsFileTypesFrame.VirtualDrawTreeDrawNode(Sender: TBaseVirtualTree; const PaintInfo: TVTPaintInfo);
var
  Data: PTreeData;
  S: string;
  R: TRect;
  Format: Cardinal;
begin
  with Sender as TVirtualDrawTree, PaintInfo do
  begin
    Data := Sender.GetNodeData(Node);

    if not Assigned(Data) then
      Exit;

    if Assigned(FrameAdapter.SkinData) and Assigned(FrameAdapter.SkinData.SkinManager) then
      Canvas.Font.Color := FrameAdapter.SkinData.SkinManager.GetActiveEditFontColor
    else
      Canvas.Font.Color := clWindowText;

    if vsSelected in PaintInfo.Node.States then
    begin
      if Assigned(FrameAdapter.SkinData) and Assigned(FrameAdapter.SkinData.SkinManager) then
      begin
        Canvas.Brush.Color := FrameAdapter.SkinData.SkinManager.GetHighLightColor;
        Canvas.Font.Color := FrameAdapter.SkinData.SkinManager.GetHighLightFontColor
      end
      else
      begin
        Canvas.Brush.Color := clHighlight;
        Canvas.Font.Color := clHighlightText;
      end;
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
      DrawText(Canvas.Handle, S, Length(S), R, Format)
    end;
  end;
end;

procedure TOptionsFileTypesFrame.VirtualDrawTreeFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
var
  Data: PTreeData;
begin
  Data := Sender.GetNodeData(Node);
  Finalize(Data^);
  inherited;
end;

procedure TOptionsFileTypesFrame.VirtualDrawTreeGetNodeWidth(Sender: TBaseVirtualTree; HintCanvas: TCanvas;
  Node: PVirtualNode; Column: TColumnIndex; var NodeWidth: Integer);
begin
  inherited;
  NodeWidth := VirtualDrawTree.Width
end;

end.
