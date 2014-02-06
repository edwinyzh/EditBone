unit MapVirtualDrives;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, BCCommon.Images,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VirtualTrees, Vcl.ComCtrls, Vcl.ToolWin, BCControls.ToolBar, Vcl.ExtCtrls,
  System.Actions, Vcl.ActnList, Vcl.AppEvnts;

type
  PVirtualDriveRec = ^TVirtualDriveRec;
  TVirtualDriveRec = record
    Drive: Char;
    Path: string;
  end;

  TMapVirtualDrivesForm = class(TForm)
    StatusBar: TStatusBar;
    ButtonPanel: TPanel;
    ToolbarSeparator2Bevel: TBevel;
    StandardToolBar: TBCToolBar;
    NewToolButton: TToolButton;
    OpenToolButton: TToolButton;
    CloseToolBar: TBCToolBar;
    CloseToolButton: TToolButton;
    VirtualTreePanel: TPanel;
    VirtualDrawTree: TVirtualDrawTree;
    ActionList: TActionList;
    AddAction: TAction;
    DeleteAction: TAction;
    EditAction: TAction;
    CloseAction: TAction;
    ToolButton1: TToolButton;
    ApplicationEvents: TApplicationEvents;
    procedure VirtualDrawTreeDblClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CloseActionExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure VirtualDrawTreeCompareNodes(Sender: TBaseVirtualTree; Node1, Node2: PVirtualNode; Column: TColumnIndex;
      var Result: Integer);
    procedure VirtualDrawTreeDrawNode(Sender: TBaseVirtualTree; const PaintInfo: TVTPaintInfo);
    procedure VirtualDrawTreeFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure VirtualDrawTreeGetImageIndex(Sender: TBaseVirtualTree; Node: PVirtualNode; Kind: TVTImageKind;
      Column: TColumnIndex; var Ghosted: Boolean; var ImageIndex: Integer);
    procedure VirtualDrawTreeGetNodeWidth(Sender: TBaseVirtualTree; HintCanvas: TCanvas; Node: PVirtualNode;
      Column: TColumnIndex; var NodeWidth: Integer);
    procedure EditActionExecute(Sender: TObject);
    procedure ApplicationEventsMessage(var Msg: tagMSG; var Handled: Boolean);
    procedure AddActionExecute(Sender: TObject);
  private
    { Private declarations }
    procedure AddTreeNode(Drive: Char; Path: string);
    procedure GetVirtualDrives;
    procedure ReadIniFile;
    procedure WriteIniFile;
  public
    { Public declarations }
    procedure Open;
  end;

function MapVirtualDrivesForm: TMapVirtualDrivesForm;

implementation

{$R *.dfm}

uses
  System.IniFiles, BCCommon.FileUtils, BCCommon.Lib, Vcl.Themes, BCCommon.LanguageUtils, System.Types, VirtualDrive,
  BCDialogs.Dlg, ShellApi;

var
  FMapVirtualDrivesForm: TMapVirtualDrivesForm;

function MapVirtualDrivesForm: TMapVirtualDrivesForm;
begin
  if not Assigned(FMapVirtualDrivesForm) then
    Application.CreateForm(TMapVirtualDrivesForm, FMapVirtualDrivesForm);
  Result := FMapVirtualDrivesForm;
end;

procedure TMapVirtualDrivesForm.ApplicationEventsMessage(var Msg: tagMSG; var Handled: Boolean);
begin
  DeleteAction.Enabled := VirtualDrawTree.SelectedCount > 0;
  EditAction.Enabled := DeleteAction.Enabled;
end;

procedure TMapVirtualDrivesForm.CloseActionExecute(Sender: TObject);
begin
  Close;
end;

procedure TMapVirtualDrivesForm.EditActionExecute(Sender: TObject);
var
  Node: PVirtualNode;
  Data: PVirtualDriveRec;
begin
  Node := VirtualDrawTree.GetFirstSelected;
  if not Assigned(Node) then
    Exit;
  Data := VirtualDrawTree.GetNodeData(Node);
  with VirtualDriveDialog do
  begin
    Drive := Data.Drive;
    Path := Data.Path;
    if Open(dtEdit) then
    begin
      Data.Drive := Drive;
      Data.Path := Path;
    end;
  end;
end;

procedure TMapVirtualDrivesForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  WriteIniFile;

  Action := caFree;
end;

procedure TMapVirtualDrivesForm.FormCreate(Sender: TObject);
begin
  StatusBar.Font.Name := 'Tahoma';
  StatusBar.Font.Size := 8;
  VirtualDrawTree.NodeDataSize := SizeOf(TVirtualDriveRec);
  { IDE can lose these properties }
  StandardToolBar.Images := ImagesDataModule.ImageList;
  CloseToolBar.Images := ImagesDataModule.ImageList;
  ActionList.Images := ImagesDataModule.ImageList;
  VirtualDrawTree.Images := ImagesDataModule.ImageList;
end;

procedure TMapVirtualDrivesForm.FormDestroy(Sender: TObject);
begin
  FMapVirtualDrivesForm := nil;
end;

procedure TMapVirtualDrivesForm.VirtualDrawTreeCompareNodes(Sender: TBaseVirtualTree; Node1, Node2: PVirtualNode;
  Column: TColumnIndex; var Result: Integer);
var
  Data1, Data2: PVirtualDriveRec;
begin
  if Result = 0 then
  begin
    Data1 := VirtualDrawTree.GetNodeData(Node1);
    Data2 := VirtualDrawTree.GetNodeData(Node2);

    Result := -1;

    if not Assigned(Data1) or not Assigned(Data2) then
      Exit;

    Result := AnsiCompareText(string(Data1.Drive), string(Data2.Drive));
  end;
end;

procedure TMapVirtualDrivesForm.VirtualDrawTreeDblClick(Sender: TObject);
begin
  EditAction.Execute
end;

procedure TMapVirtualDrivesForm.VirtualDrawTreeDrawNode(Sender: TBaseVirtualTree; const PaintInfo: TVTPaintInfo);
var
  Data: PVirtualDriveRec;
  S: string;
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

    case Column of
      0: S := Data.Drive + ':';
      1: S := Data.Path;
    end;

    if Length(S) > 0 then
    begin
      Format := DT_TOP or DT_LEFT or DT_VCENTER or DT_SINGLELINE;
      DrawText(Canvas.Handle, S, Length(S), R, Format);
    end;
  end;
end;

procedure TMapVirtualDrivesForm.VirtualDrawTreeFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
var
  Data: PVirtualDriveRec;
begin
  Data := VirtualDrawTree.GetNodeData(Node);
  Finalize(Data^);
  inherited;
end;

procedure TMapVirtualDrivesForm.VirtualDrawTreeGetImageIndex(Sender: TBaseVirtualTree; Node: PVirtualNode;
  Kind: TVTImageKind; Column: TColumnIndex; var Ghosted: Boolean; var ImageIndex: Integer);
begin
  if Kind in [ikNormal, ikSelected] then
    if Column = 0 then
      ImageIndex := IMG_IDX_DRIVE;
end;

procedure TMapVirtualDrivesForm.VirtualDrawTreeGetNodeWidth(Sender: TBaseVirtualTree; HintCanvas: TCanvas;
  Node: PVirtualNode; Column: TColumnIndex; var NodeWidth: Integer);
begin
  NodeWidth := VirtualDrawTree.Width
end;

procedure TMapVirtualDrivesForm.ReadIniFile;
begin
  with TMemIniFile.Create(GetIniFilename) do
  try
    { Size }
    Width := ReadInteger('MapVirtualDrivesSize', 'Width', Round(Screen.Width * 0.25));
    Height := ReadInteger('MapVirtualDrivesSize', 'Height', Round(Screen.Height * 0.5));
    { Position }
    Left := ReadInteger('MapVirtualDrivesPosition', 'Left', (Screen.Width - Width) div 2);
    Top := ReadInteger('MapVirtualDrivesPosition', 'Top', (Screen.Height - Height) div 2);
    { Check if the form is outside the workarea }
    Left := SetFormInsideWorkArea(Left, Width);
  finally
    Free;
  end;
end;

procedure TMapVirtualDrivesForm.WriteIniFile;
begin
  if Windowstate = wsNormal then
  with TMemIniFile.Create(GetIniFilename) do
  try
    { Position }
    WriteInteger('MapVirtualDrivesPosition', 'Left', Left);
    WriteInteger('MapVirtualDrivesPosition', 'Top', Top);
    { Size }
    WriteInteger('MapVirtualDrivesSize', 'Width', Width);
    WriteInteger('MapVirtualDrivesSize', 'Height', Height);
  finally
    UpdateFile;
    Free;
  end;
end;

procedure TMapVirtualDrivesForm.AddActionExecute(Sender: TObject);
var
  Node: PVirtualNode;
  Data: PVirtualDriveRec;
begin
  with VirtualDriveDialog do
  begin
    Drive := #0;
    Path := '';
    if Open(dtOpen) then
    begin
      AddTreeNode(Drive, Path);
      ShellExecute(0, nil, 'subst.exe', PWideChar(Format(' %s: %s', [Drive, Path])), nil, SW_HIDE);
    end;
  end;
  // permanent
  // HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\DOS Devices
  // name: x: value \??\c:\temp
end;

procedure TMapVirtualDrivesForm.AddTreeNode(Drive: Char; Path: string);
var
  RootNode: PVirtualNode;
  Data: PVirtualDriveRec;
begin
  RootNode := VirtualDrawTree.AddChild(nil);
  Data := VirtualDrawTree.GetNodeData(RootNode);
  Data.Drive := Drive;
  Data.Path := Path;
end;

procedure TMapVirtualDrivesForm.GetVirtualDrives;
var
  i: Integer;
  Drives: array [0..255] of Char;
  DriveCount: Integer;
begin
  VirtualDrawTree.Clear;
  DriveCount := GetLogicalDriveStrings(255, Drives);
  for i := 0 to DriveCount - 1 do
    if IsVirtualDrive(Drives[i]) then
      AddTreeNode(Drives[i], VirtualDrivePath(Drives[i]));
end;

procedure TMapVirtualDrivesForm.Open;
begin
  ReadIniFile;

  UpdateLanguage(Self, GetSelectedLanguage);

  GetVirtualDrives;
  ShowModal;
end;

end.
