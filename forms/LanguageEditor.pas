unit LanguageEditor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ActnList, Vcl.ComCtrls, Vcl.ToolWin, BCToolBar,
  Vcl.ExtCtrls, Vcl.ImgList, BCImageList, VirtualTrees, Vcl.AppEvnts;

type
  PObjectNodeRec = ^TObjectNodeRec;
  TObjectNodeRec = record
    Level: Byte;
    NodeKey: string;
    NodeValue: string;
    Hint: string;
    ShortCut: string;
    ImageIndex: Byte;
  end;

  TLanguageEditorForm = class(TForm)
    ImageList: TBCImageList;
    ActionList: TActionList;
    FileOpenAction: TAction;
    FileSaveAction: TAction;
    FileSaveAsAction: TAction;
    StatusBar: TStatusBar;
    VirtualTreePanel: TPanel;
    VirtualDrawTree: TVirtualDrawTree;
    FileNewAction: TAction;
    ButtonPanel: TPanel;
    Bevel1: TBevel;
    SaveToolBar: TBCToolBar;
    ZoomToolButton: TToolButton;
    ToolButton2: TToolButton;
    PrintToolBar: TBCToolBar;
    ToolButton1: TToolButton;
    ToolButton3: TToolButton;
    BCToolBar1: TBCToolBar;
    BCToolBar2: TBCToolBar;
    BCToolBar3: TBCToolBar;
    BCToolBar4: TBCToolBar;
    ApplicationEvents: TApplicationEvents;
    procedure FormDestroy(Sender: TObject);
    procedure ApplicationEventsHint(Sender: TObject);
    procedure ApplicationEventsMessage(var Msg: tagMSG; var Handled: Boolean);
    procedure FileSaveActionExecute(Sender: TObject);
    procedure FileSaveAsActionExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure VirtualDrawTreeCompareNodes(Sender: TBaseVirtualTree; Node1, Node2: PVirtualNode;
      Column: TColumnIndex; var Result: Integer);
    procedure VirtualDrawTreeDrawNode(Sender: TBaseVirtualTree; const PaintInfo: TVTPaintInfo);
    procedure VirtualDrawTreeFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure VirtualDrawTreeGetImageIndex(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Kind: TVTImageKind; Column: TColumnIndex; var Ghosted: Boolean; var ImageIndex: Integer);
    procedure VirtualDrawTreeGetNodeWidth(Sender: TBaseVirtualTree; HintCanvas: TCanvas;
      Node: PVirtualNode; Column: TColumnIndex; var NodeWidth: Integer);
    procedure VirtualDrawTreeInitChildren(Sender: TBaseVirtualTree; Node: PVirtualNode;
      var ChildCount: Cardinal);
    procedure VirtualDrawTreeInitNode(Sender: TBaseVirtualTree; ParentNode, Node: PVirtualNode;
      var InitialStates: TVirtualNodeInitStates);
  private
    { Private declarations }
    FModified: Boolean;
    FLanguageFileName: string;
    procedure ReadIniFile;
    procedure WriteIniFile;
    procedure Save(ShowDialog: Boolean);
    procedure AddTreeNode(NodeText: string);
    procedure LoadLanguageFile(FileName: string);
    function GetModifiedInfo: string;
    procedure SaveToFile(FileName: string);
    function GetCaption: string;
  public
    { Public declarations }
    procedure Open;
  end;

function LanguageEditorForm: TLanguageEditorForm;

implementation

{$R *.dfm}

uses
  BigINI, Common, Language, CommonDialogs, Vcl.Themes;

const
  FORM_CAPTION = 'Language Editor - [%s]';

var
  FLanguageEditorForm: TLanguageEditorForm;

function LanguageEditorForm: TLanguageEditorForm;
begin
  if FLanguageEditorForm = nil then
    Application.CreateForm(TLanguageEditorForm, FLanguageEditorForm);
  Result := FLanguageEditorForm;
end;

procedure TLanguageEditorForm.ApplicationEventsHint(Sender: TObject);
begin
  StatusBar.Panels[2].Text := Application.Hint;
end;

procedure TLanguageEditorForm.ApplicationEventsMessage(var Msg: tagMSG; var Handled: Boolean);
var
  InfoText: string;
  KeyState: TKeyboardState;
begin
  FileSaveAction.Enabled := FModified;

  InfoText := GetModifiedInfo;
  if StatusBar.Panels[1].Text <> InfoText then
    StatusBar.Panels[1].Text := InfoText;

  GetKeyboardState(KeyState);
  if KeyState[VK_INSERT] = 0 then
    if StatusBar.Panels[0].Text <> LanguageDataModule.GetConstant('Insert') then
      StatusBar.Panels[0].Text := ' ' + LanguageDataModule.GetConstant('Insert');
  if KeyState[VK_INSERT] = 1 then
    if StatusBar.Panels[0].Text <> LanguageDataModule.GetConstant('Overwrite') then
      StatusBar.Panels[0].Text := ' ' + LanguageDataModule.GetConstant('Overwrite');
end;

procedure TLanguageEditorForm.FileSaveActionExecute(Sender: TObject);
begin
  Save(False);
end;

procedure TLanguageEditorForm.FileSaveAsActionExecute(Sender: TObject);
begin
  Save(True);
  Repaint;
end;

procedure TLanguageEditorForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  WriteIniFile;
  Action := caFree;
end;

procedure TLanguageEditorForm.FormCreate(Sender: TObject);
begin
  StatusBar.Font.Name := 'Tahoma';
  StatusBar.Font.Size := 8;
  VirtualDrawTree.NodeDataSize := SizeOf(TObjectNodeRec);
end;

procedure TLanguageEditorForm.FormDestroy(Sender: TObject);
begin
  FLanguageEditorForm := nil;
end;

procedure TLanguageEditorForm.ReadIniFile;
begin
  with TBigIniFile.Create(Common.GetINIFilename) do
  try
    { Size }
    Width := ReadInteger('LanguageEditorSize', 'Width', Round(Screen.Width * 0.5));
    Height := ReadInteger('LanguageEditorSize', 'Height', Round(Screen.Height * 0.5));
    { Position }
    Left := ReadInteger('LanguageEditorPosition', 'Left', (Screen.Width - Width) div 2);
    Top := ReadInteger('LanguageEditorPosition', 'Top', (Screen.Height - Height) div 2);
  finally
    Free;
  end;
end;

procedure TLanguageEditorForm.WriteIniFile;
begin
  if Windowstate = wsNormal then
  with TBigIniFile.Create(Common.GetINIFilename) do
  try
    { Position }
    WriteInteger('LanguageEditorPosition', 'Left', Left);
    WriteInteger('LanguageEditorPosition', 'Top', Top);
    { Size }
    WriteInteger('LanguageEditorSize', 'Width', Width);
    WriteInteger('LanguageEditorSize', 'Height', Height);
  finally
    Free;
  end;
end;

procedure TLanguageEditorForm.SaveToFile(FileName: string);
begin
  //
end;

procedure TLanguageEditorForm.Save(ShowDialog: Boolean);
var
  AFileName: string;
begin
  AFileName := FLanguageFileName;
  if Pos('~', FLanguageFileName) = Length(FLanguageFileName) then
    AFileName := System.Copy(AFileName, 0, Length(AFileName) - 1);
  if ShowDialog then
  begin
   if CommonDialogs.SaveFile(ExtractFilePath(AFileName),
       Trim(StringReplace(LanguageDataModule.GetFileTypes('Language')
        , '|', #0, [rfReplaceAll])) + #0#0, LanguageDataModule.GetConstant('SaveAs'), ExtractFileName(AFileName)) then
      AFileName := CommonDialogs.Files[0]
    else
      Exit;
  end;
  SaveToFile(AFileName);
  FModified := False;
  FLanguageFileName := AFileName;
  Caption := GetCaption;
end;

procedure TLanguageEditorForm.VirtualDrawTreeCompareNodes(Sender: TBaseVirtualTree; Node1,
  Node2: PVirtualNode; Column: TColumnIndex; var Result: Integer);
var
  Data1, Data2: PObjectNodeRec;
begin
  if Result = 0 then
  begin
    Data1 := VirtualDrawTree.GetNodeData(Node1);
    Data2 := VirtualDrawTree.GetNodeData(Node2);

    Result := -1;

    if not Assigned(Data1) or not Assigned(Data2) then
      Exit;

    Result := AnsiCompareText(string(Data1.NodeKey), string(Data2.NodeKey));
  end;
end;

procedure TLanguageEditorForm.VirtualDrawTreeDrawNode(Sender: TBaseVirtualTree;
  const PaintInfo: TVTPaintInfo);
var
  Data: PObjectNodeRec;
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

    if LStyles.Enabled then
      VirtualDrawTree.Color := LStyles.GetStyleColor(scEdit);

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
    S := '';
    case Column of
      0: S := Data.NodeKey;
      1: S := Data.NodeValue;
      2: S := Data.Hint;
      3: S := Data.ShortCut;
    end;

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

procedure TLanguageEditorForm.VirtualDrawTreeFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
var
  Data: PObjectNodeRec;
begin
  inherited;
  Data := VirtualDrawTree.GetNodeData(Node);
  if Assigned(Data) then
  begin
    Data^.Level := 0;
    Data^.NodeKey := '';
    Data^.NodeValue := '';
    Data^.Hint := '';
    Data^.ShortCut := '';
    Data^.ImageIndex := 0;
  end;
end;

procedure TLanguageEditorForm.VirtualDrawTreeGetImageIndex(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex; var Ghosted: Boolean;
  var ImageIndex: Integer);
var
  Data: PObjectNodeRec;
begin
  if Kind in [ikNormal, ikSelected] then
  begin
    Data := VirtualDrawTree.GetNodeData(Node);
    if (Column = 0) and (Data.Level = 0) then
      ImageIndex := Data.ImageIndex;
  end;
end;

procedure TLanguageEditorForm.VirtualDrawTreeGetNodeWidth(Sender: TBaseVirtualTree;
  HintCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex; var NodeWidth: Integer);
var
  Data: PObjectNodeRec;
  AMargin: Integer;
begin
  with Sender as TVirtualDrawTree do
  begin
    AMargin := TextMargin;
    Data := Sender.GetNodeData(Node);
    case Column of
      0: NodeWidth := Canvas.TextWidth(Data.NodeKey) + 2 * AMargin;
      1: NodeWidth := Canvas.TextWidth(Data.NodeValue) + 2 * AMargin;
      2: NodeWidth := Canvas.TextWidth(Data.Hint) + 2 * AMargin;
      3: NodeWidth := Canvas.TextWidth(Data.ShortCut) + 2 * AMargin;
    end;
  end;
end;

procedure TLanguageEditorForm.VirtualDrawTreeInitNode(Sender: TBaseVirtualTree; ParentNode,
  Node: PVirtualNode; var InitialStates: TVirtualNodeInitStates);
var
  Data: PObjectNodeRec;
begin
  inherited;
  Data := VirtualDrawTree.GetNodeData(Node);

  if Data.Level = 0 then
    Include(InitialStates, ivsHasChildren);
end;

procedure TLanguageEditorForm.AddTreeNode(NodeText: string);
var
  RootNode: PVirtualNode;
  Data: PObjectNodeRec;
begin
  RootNode := VirtualDrawTree.AddChild(nil);
  Data := VirtualDrawTree.GetNodeData(RootNode);
  Data.NodeKey := Trim(NodeText);
  if Pos('Dialog', NodeText) <> 0 then
    Data.ImageIndex := 5
  else
  if Pos('Frame', NodeText) <> 0 then
    Data.ImageIndex := 6
  else
  if Pos('Form', NodeText) <> 0 then
    Data.ImageIndex := 7
  else
    Data.ImageIndex := 4;
  Data.Level := 0;
end;

procedure TLanguageEditorForm.LoadLanguageFile(FileName: string);
var
  i: Integer;
  SectionStringList: TStringList;
begin
  if not FileExists(FileName) then
    Exit;
  FLanguageFileName := FileName;
  Caption := GetCaption;
  VirtualDrawTree.BeginUpdate;
  VirtualDrawTree.Clear;
  SectionStringList := TStringList.Create;
  with TBigIniFile.Create(FileName) do
  try
    ReadSections(SectionStringList);
    for i := 0 to SectionStringList.Count - 1 do
      AddTreeNode(SectionStringList.Strings[i]);
  finally
    SectionStringList.Free;
    Free;
  end;
  VirtualDrawTree.Sort(nil, 0, sdAscending, False);
  VirtualDrawTree.EndUpdate;
end;

procedure TLanguageEditorForm.VirtualDrawTreeInitChildren(Sender: TBaseVirtualTree;
  Node: PVirtualNode; var ChildCount: Cardinal);
var
  i: Integer;
  Data: PObjectNodeRec;
  StringList: TStringList;

  procedure AddChildNode(NodeText: string);
  var
    NodeKey, NodeValue: string;
    ChildData: PObjectNodeRec;
    ChildNode: PVirtualNode;

    function GetNodeKey(Text: string): string;
    begin
      Result := Copy(Text, 1, Pos('=', Text) - 1);
      { remove hint }
      Result := StringReplace(Result, ':h', '', []);
      { remove shortcut }
      Result := StringReplace(Result, ':s', '', []);
    end;

  begin
    NodeKey := GetNodeKey(NodeText);

    { check if node already exists }
    ChildNode := Node.FirstChild;
    Data := VirtualDrawTree.GetNodeData(ChildNode);
    while Assigned(ChildNode) and (AnsiCompareText(NodeKey, Data.NodeKey) <> 0) do
    begin
      ChildNode := ChildNode.NextSibling;
      Data := VirtualDrawTree.GetNodeData(ChildNode);
    end;
    if not Assigned(ChildNode) then
      ChildNode := VirtualDrawTree.AddChild(Node);
    ChildData := VirtualDrawTree.GetNodeData(ChildNode);
    ChildData.Level := 1;
    ChildData.NodeKey := NodeKey;
    NodeKey := Copy(NodeText, 1, Pos('=', NodeText) - 1);
    NodeValue := Copy(NodeText, Pos('=', NodeText) + 1, Length(NodeText));
    if (Pos(':h', NodeKey) = 0) and (Pos(':s', NodeKey) = 0) then
      ChildData.NodeValue := NodeValue
    else
    if Pos(':h', NodeKey) <> 0 then
      ChildData.Hint := NodeValue
    else
    if Pos(':s', NodeKey) <> 0 then
      ChildData.ShortCut := NodeValue;
  end;

begin
  if Assigned(Node) then
  begin
    Data := VirtualDrawTree.GetNodeData(Node);

    StringList := TStringList.Create;
    with TBigIniFile.Create(FLanguageFileName) do
    try
      ReadSectionValues(String(Data.NodeKey), StringList);
      for i := 0 to StringList.Count - 1 do
        AddChildNode(StringList.Strings[i]);
    finally
      StringList.Free;
      Free;
    end;
    ChildCount := VirtualDrawTree.ChildCount[Node];
  end;
end;

procedure TLanguageEditorForm.Open;
var
  SelectedLanguage, LanguagePath: string;
begin
  ReadIniFile;

  SelectedLanguage := Common.GetSelectedLanguage('English');
  LanguagePath := IncludeTrailingPathDelimiter(Format('%s%s', [ExtractFilePath(ParamStr(0)), 'Languages']));
  if not DirectoryExists(LanguagePath) then
    Exit;
  FLanguageFileName := Format('%s%s.%s', [LanguagePath, SelectedLanguage, 'lng']);
  if not FileExists(FLanguageFileName) then
    Exit;

  LoadLanguageFile(FLanguageFileName);
  Show;
end;

function TLanguageEditorForm.GetModifiedInfo: string;
begin
  Result := '';
  if FModified then
    Result := 'Modified';
end;

function TLanguageEditorForm.GetCaption: string;
begin
  Result := Format(FORM_CAPTION, [FLanguageFileName]);
end;

end.
