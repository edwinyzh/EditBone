unit Options;

interface

uses
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, BCCommon.FileUtils, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.Menus, SynEdit, SynEditMiscClasses, System.Classes, System.SysUtils, Vcl.ImgList,
  Vcl.ActnList, Vcl.Themes, BCFrames.OptionsPrint, BCFrames.OptionsEditorSearch, BCCommon.Images,
  VirtualTrees, BCFrames.OptionsEditorOptions, BCFrames.OptionsEditorFont, BCFrames.OptionsEditorLeftMargin,
  OptionsEditorTabs, Lib, OptionsEditorErrorChecking, OptionsEditorOther, OptionsFileTypes, BCFrames.OptionsCompare,
  BCFrames.OptionsMainMenu, OptionsDirectoryTabs, OptionsOutputTabs, OptionsDirectory, BCFrames.OptionsStatusBar,
  BCFrames.OptionsOutput, BCFrames.OptionsToolBar, Vcl.ActnMenus, System.Actions, BCFrames.OptionsEditorCompletionProposal,
  BCFrames.OptionsEditorRightMargin, BCCommon.OptionsContainer, System.Generics.Collections;

type
  POptionsRec = ^TOptionsRec;
  TOptionsRec = record
    Index: Integer;
    Caption: UnicodeString;
    ImageIndex: Integer;
  end;

  TOptionsForm = class(TForm)
    ActionList: TActionList;
    ButtonDividerPanel: TPanel;
    ButtonPanel: TPanel;
    CancelButton: TButton;
    CompareAction: TAction;
    DirectoryAction: TAction;
    DirectoryTabsAction: TAction;
    EditorAction: TAction;
    EditorCompletionProposalAction: TAction;
    EditorErrorCheckingAction: TAction;
    EditorFontAction: TAction;
    EditorLeftMarginAction: TAction;
    EditorOtherAction: TAction;
    EditorRightMarginAction: TAction;
    EditorSearchAction: TAction;
    EditorTabsAction: TAction;
    FileTypesAction: TAction;
    MainMenuAction: TAction;
    OKButton: TButton;
    OptionsPanel: TPanel;
    OptionsVirtualStringTree: TVirtualStringTree;
    OutputAction: TAction;
    OutputTabsAction: TAction;
    PrintAction: TAction;
    Splitter: TSplitter;
    StatusBarAction: TAction;
    ToolBarAction: TAction;
    TopPanel: TPanel;
    ScrollBox: TScrollBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure OptionsVirtualStringTreeClick(Sender: TObject);
    procedure OptionsVirtualStringTreeFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure OptionsVirtualStringTreeGetImageIndex(Sender: TBaseVirtualTree; Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex; var Ghosted: Boolean; var ImageIndex: Integer);
    procedure OptionsVirtualStringTreeGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
    procedure OptionsVirtualStringTreePaintText(Sender: TBaseVirtualTree; const TargetCanvas: TCanvas;
      Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType);
  private
    FActionList: TObjectList<TAction>;
    procedure CreateTree;
    procedure ReadIniFile;
    procedure SaveSelectedTreeNode;
    procedure SetVisibleFrame;
    procedure WriteIniFile;
  public
    function Execute(ActionList: TObjectList<TAction>): Boolean;
  end;

function OptionsForm: TOptionsForm;

implementation

{$R *.dfm}

uses
  BCCommon.StyleUtils, BCCommon.LanguageStrings, System.IniFiles,  BCCommon.LanguageUtils, BCCommon.Lib, Winapi.Windows;

var
  FOptionsForm: TOptionsForm;

{ TOptionsDialog }

function OptionsForm: TOptionsForm;
begin
  if not Assigned(FOptionsForm) then
    Application.CreateForm(TOptionsForm, FOptionsForm);
  Result := FOptionsForm;
end;

procedure TOptionsForm.FormDestroy(Sender: TObject);
begin
  FOptionsForm := nil;
end;

procedure TOptionsForm.CreateTree;
var
  i: Integer;
  Data: POptionsRec;
  Node, ChildNode: PVirtualNode;
begin
  with OptionsVirtualStringTree do
  begin
    Clear;
    i := 0;
    { Editor }
    Node := AddChild(nil);
    Data := GetNodeData(Node);
    Data.Index := PostInc(i);
    Data.ImageIndex := EditorAction.ImageIndex;
    Data.Caption := EditorAction.Caption;
    { Font }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.Index := PostInc(i);
    Data.ImageIndex := EditorFontAction.ImageIndex;
    Data.Caption := EditorFontAction.Caption;
    { Left Margin }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.Index := PostInc(i);
    Data.ImageIndex := EditorLeftMarginAction.ImageIndex;
    Data.Caption := EditorLeftMarginAction.Caption;
    { Right Margin }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.Index := PostInc(i);
    Data.ImageIndex := EditorRightMarginAction.ImageIndex;
    Data.Caption := EditorRightMarginAction.Caption;
    { Tabs }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.Index := PostInc(i);
    Data.ImageIndex := EditorTabsAction.ImageIndex;
    Data.Caption := EditorTabsAction.Caption;
    { Search }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.Index := PostInc(i);
    Data.ImageIndex := EditorSearchAction.ImageIndex;
    Data.Caption := EditorSearchAction.Caption;
    { Completion proposal }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.Index := PostInc(i);
    Data.ImageIndex := EditorCompletionProposalAction.ImageIndex;
    Data.Caption := EditorCompletionProposalAction.Caption;
    { Error checking }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.Index := PostInc(i);
    Data.ImageIndex := EditorErrorCheckingAction.ImageIndex;
    Data.Caption := EditorErrorCheckingAction.Caption;
    { Other }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.Index := PostInc(i);
    Data.ImageIndex := EditorOtherAction.ImageIndex;
    Data.Caption := EditorOtherAction.Caption;
    Node.ChildCount := OptionsVirtualStringTree.ChildCount[Node];
    OptionsVirtualStringTree.Selected[Node] := True;
    OptionsVirtualStringTree.Expanded[Node] := True;
    { Directory }
    Node := AddChild(nil);
    Data := GetNodeData(Node);
    Data.Index := PostInc(i);
    Data.ImageIndex := DirectoryAction.ImageIndex;
    Data.Caption := DirectoryAction.Caption;
    { Tabs }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.Index := PostInc(i);
    Data.ImageIndex := DirectoryTabsAction.ImageIndex;
    Data.Caption := DirectoryTabsAction.Caption;
    Node.ChildCount := OptionsVirtualStringTree.ChildCount[Node];
    OptionsVirtualStringTree.Selected[Node] := True;
    OptionsVirtualStringTree.Expanded[Node] := True;
    { Output }
    Node := AddChild(nil);
    Data := GetNodeData(Node);
    Data.Index := PostInc(i);
    Data.ImageIndex := OutputAction.ImageIndex;
    Data.Caption := OutputAction.Caption;
    { Tabs }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.Index := PostInc(i);
    Data.ImageIndex := OutputTabsAction.ImageIndex;
    Data.Caption := OutputTabsAction.Caption;
    Node.ChildCount := OptionsVirtualStringTree.ChildCount[Node];
    OptionsVirtualStringTree.Selected[Node] := True;
    OptionsVirtualStringTree.Expanded[Node] := True;
    { Compare }
    Node := AddChild(nil);
    Data := GetNodeData(Node);
    Data.Index := PostInc(i);
    Data.ImageIndex := CompareAction.ImageIndex;
    Data.Caption := CompareAction.Caption;
    { Print }
    Node := AddChild(nil);
    Data := GetNodeData(Node);
    Data.Index := PostInc(i);
    Data.ImageIndex := PrintAction.ImageIndex;
    Data.Caption := PrintAction.Caption;
    { Main menu }
    Node := AddChild(nil);
    Data := GetNodeData(Node);
    Data.Index := PostInc(i);
    Data.ImageIndex := MainMenuAction.ImageIndex;
    Data.Caption := MainMenuAction.Caption;
    { Tool Bar }
    Node := AddChild(nil);
    Data := GetNodeData(Node);
    Data.Index := PostInc(i);
    Data.ImageIndex := ToolBarAction.ImageIndex;
    Data.Caption := ToolBarAction.Caption;
    { Status Bar }
    Node := AddChild(nil);
    Data := GetNodeData(Node);
    Data.Index := PostInc(i);
    Data.ImageIndex := StatusBarAction.ImageIndex;
    Data.Caption := StatusBarAction.Caption;
    { File types }
    Node := AddChild(nil);
    Data := GetNodeData(Node);
    Data.Index := PostInc(i);
    Data.ImageIndex := FileTypesAction.ImageIndex;
    Data.Caption := FileTypesAction.Caption;

    OptionsVirtualStringTree.Selected[OptionsVirtualStringTree.GetFirst] := True;
  end;
end;

function TOptionsForm.Execute(ActionList: TObjectList<TAction>): Boolean;
begin
  FActionList := ActionList;
  try
    ReadIniFile;
    UpdateLanguage(Self, GetSelectedLanguage);
    Result := Showmodal = mrOk;
    WriteIniFile;
    SaveSelectedTreeNode;
  finally
    Free;
  end;
end;

procedure TOptionsForm.SaveSelectedTreeNode;
var
  Node: PVirtualNode;
  Data: POptionsRec;
begin
  with TIniFile.Create(GetIniFilename) do
  try
    Node := OptionsVirtualStringTree.GetFirstSelected;
    Data := OptionsVirtualStringTree.GetNodeData(Node);
    WriteInteger('Options', 'OptionsSelectedItemIndex', Data.Index);
  finally
    Free;
  end;
end;

procedure TOptionsForm.OptionsVirtualStringTreeClick(Sender: TObject);
begin
  SetVisibleFrame;
end;

procedure TOptionsForm.SetVisibleFrame;
var
  i, Level, ParentIndex: Integer;
  TreeNode: PVirtualNode;
begin
  inherited;
  TreeNode := OptionsVirtualStringTree.GetFirstSelected;
  if Assigned(TreeNode) then
  begin
    Level := OptionsVirtualStringTree.GetNodeLevel(TreeNode);
    ParentIndex := -1;
    if Level = 1 then
      ParentIndex := TreeNode.Parent.Index;
    for i := 0 to ComponentCount - 1 do
      if Components[i] is TFrame then
        (Components[i] as TFrame).Hide;
      
    { don't set the visibility value with the condition because the frame is created }
    if (Level = 0) and (TreeNode.Index = 0) then
      OptionsEditorOptionsFrame(Self).Show; 
    if (ParentIndex = 0) and (Level = 1) and (TreeNode.Index = 0) then
      OptionsEditorFontFrame(Self).Show;
    if (ParentIndex = 0) and (Level = 1) and (TreeNode.Index = 1) then
      OptionsEditorLeftMarginFrame(Self).Show;
    if (ParentIndex = 0) and (Level = 1) and (TreeNode.Index = 2) then
      OptionsEditorRightMarginFrame(Self).Show;
    if (ParentIndex = 0) and (Level = 1) and (TreeNode.Index = 3) then
      OptionsEditorTabsFrame(Self).Show;
    if (ParentIndex = 0) and (Level = 1) and (TreeNode.Index = 4) then
      OptionsEditorSearchFrame(Self).Show;
    if (ParentIndex = 0) and (Level = 1) and (TreeNode.Index = 5) then
      OptionsEditorCompletionProposalFrame(Self).Show;
    if (ParentIndex = 0) and (Level = 1) and (TreeNode.Index = 6) then
      OptionsEditorErrorCheckingFrame(Self).Show;
    if (ParentIndex = 0) and (Level = 1) and (TreeNode.Index = 7) then
      OptionsEditorOtherFrame(Self).Show;
    if (Level = 0) and (TreeNode.Index = 1) then
      OptionsDirectoryFrame(Self).Show;
    if (ParentIndex = 1) and (Level = 1) and (TreeNode.Index = 0) then
      OptionsDirectoryTabsFrame(Self).Show;
    if (Level = 0) and (TreeNode.Index = 2) then
      OptionsOutputFrame(Self).Show;
    if (ParentIndex = 2) and (Level = 1) and (TreeNode.Index = 0) then
      OptionsOutputTabsFrame(Self).Show;
    if (Level = 0) and (TreeNode.Index = 3) then
      OptionsCompareFrame(Self).Show;
    if (Level = 0) and (TreeNode.Index = 4) then
      OptionsPrintFrame(Self).Show;
    if (Level = 0) and (TreeNode.Index = 5) then
      OptionsMainMenuFrame(Self).Show;
    if (Level = 0) and (TreeNode.Index = 6) then
      OptionsToolBarFrame(Self, FActionList).Show;
    if (Level = 0) and (TreeNode.Index = 7) then
      OptionsStatusBarFrame(Self).Show;
    if (Level = 0) and (TreeNode.Index = 8) then
      OptionsFileTypesFrame(Self).Show;
  end;
end;

procedure TOptionsForm.OptionsVirtualStringTreeFreeNode(Sender: TBaseVirtualTree;
  Node: PVirtualNode);
var
  Data: POptionsRec;
begin
  Data := Sender.GetNodeData(Node);
  Finalize(Data^);
  inherited;
end;

procedure TOptionsForm.OptionsVirtualStringTreeGetImageIndex(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex; var Ghosted: Boolean;
  var ImageIndex: Integer);
var
  Data: POptionsRec;
begin
  inherited;
  if not (Kind in [ikNormal, ikSelected]) then
    Exit;
  Data := Sender.GetNodeData(Node);
  if Assigned(Data) then
    ImageIndex := Data.ImageIndex;
end;

procedure TOptionsForm.OptionsVirtualStringTreeGetText(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
var
  Data: POptionsRec;
begin
  Data := Sender.GetNodeData(Node);
  if Assigned(Data) then
    CellText := Data.Caption;
end;

procedure TOptionsForm.OptionsVirtualStringTreePaintText(Sender: TBaseVirtualTree; const TargetCanvas: TCanvas;
  Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType);
var
  LStyles: TCustomStyleServices;
begin
  if TStyleManager.ActiveStyle.Name <> STYLENAME_WINDOWS then
    if vsSelected in Node.States then
    begin
      LStyles := StyleServices;
      if LStyles.Enabled then
        TargetCanvas.Font.Color := LStyles.GetStyleFontColor(sfMenuItemTextSelected); //clHighlightText)
    end;
end;

procedure TOptionsForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  OptionsContainer.SupportedFileExts(True);
end;

procedure TOptionsForm.ReadIniFile;
begin
  with TMemIniFile.Create(GetIniFilename) do
  try
    { Size }
    Width := ReadInteger('OptionsSize', 'Width', Width);
    Height := ReadInteger('OptionsSize', 'Height', Height);
    { Position }
    Left := ReadInteger('OptionsPosition', 'Left', (Screen.Width - Width) div 2);
    Top := ReadInteger('OptionsPosition', 'Top', (Screen.Height - Height) div 2);
    { Check if the form is outside the workarea }
    Left := SetFormInsideWorkArea(Left, Width);
    { Tree width }
    OptionsVirtualStringTree.Width := ReadInteger('OptionsSize', 'TreeWidth', OptionsVirtualStringTree.Width);
  finally
    Free;
  end;
end;

procedure TOptionsForm.WriteIniFile;
begin
  if Windowstate = wsNormal then
  with TMemIniFile.Create(GetIniFilename) do
  try
    { Size }
    WriteInteger('OptionsSize', 'Width', Width);
    WriteInteger('OptionsSize', 'Height', Height);
    { Position }
    WriteInteger('OptionsPosition', 'Left', Left);
    WriteInteger('OptionsPosition', 'Top', Top);
    { Tree width }
    WriteInteger('OptionsSize', 'TreeWidth', OptionsVirtualStringTree.Width);
  finally
    UpdateFile;
    Free;
  end;
end;

procedure TOptionsForm.FormCreate(Sender: TObject);
begin
  OptionsVirtualStringTree.NodeDataSize := SizeOf(TOptionsRec);
  { IDE can lose these properties }
  ActionList.Images := ImagesDataModule.ImageList;
  OptionsVirtualStringTree.Images := ImagesDataModule.ImageList;
end;

procedure TOptionsForm.FormShow(Sender: TObject);
var
  SelectedItemIndex: Integer;
  Node: PVirtualNode;

  function FindItem(CurrentNode: PVirtualNode; ItemIndex: Integer): PVirtualNode;
  var
    Data: POptionsRec;
  begin
    Data := OptionsVirtualStringTree.GetNodeData(CurrentNode);
    while Assigned(CurrentNode) and (Data.Index <> ItemIndex) do
    begin
      CurrentNode := OptionsVirtualStringTree.GetNext(CurrentNode);
      Data := OptionsVirtualStringTree.GetNodeData(CurrentNode);
    end;
    Result := CurrentNode;
  end;

begin
  inherited;
  CreateTree;

  with TIniFile.Create(GetIniFilename) do
  try
    SelectedItemIndex := ReadInteger('Options', 'OptionsSelectedItemIndex', 0);
  finally
    Free;
  end;
  Node := FindItem(OptionsVirtualStringTree.GetFirst, SelectedItemIndex);
  if Assigned(Node) then
    OptionsVirtualStringTree.Selected[Node] := True;
  SetVisibleFrame;
end;

end.
