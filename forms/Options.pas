unit Options;

interface

uses
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, BCCommon.FileUtils, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.Menus, SynEdit, SynEditMiscClasses, System.Classes, System.SysUtils, Vcl.ImgList,
  Vcl.ActnList, Vcl.Themes, BCFrames.OptionsPrint, BCFrames.OptionsEditorSearch,
  VirtualTrees, BCFrames.OptionsEditorOptions, BCFrames.OptionsEditorFont, BCFrames.OptionsEditorLeftMargin,
  OptionsEditorTabs, Lib, OptionsEditorErrorChecking, OptionsEditorOther, OptionsFileTypes, BCFrames.OptionsCompare,
  BCFrames.OptionsMainMenu, OptionsDirectoryTabs, OptionsOutputTabs, OptionsDirectory, BCFrames.OptionsStatusBar,
  BCFrames.OptionsOutput, OptionsToolBar, Vcl.ActnMenus, System.Actions, BCFrames.OptionsEditorCompletionProposal,
  BCDialogs.Dlg, BCFrames.OptionsEditorRightMargin, BCCommon.OptionsContainer;

type
  POptionsRec = ^TOptionsRec;
  TOptionsRec = record
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
    ImageList: TImageList;
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
    FDirectoryTabsFrame: TDirectoryTabsFrame;
    FEditorCompletionProposalFrame: TEditorCompletionProposalFrame;
    FEditorErrorCheckingFrame: TEditorErrorCheckingFrame;
    FEditorFontFrame: TEditorFontFrame;
    FEditorLeftMarginFrame: TEditorLeftMarginFrame;
    FEditorOptionsFrame: TEditorOptionsFrame;
    FEditorOtherFrame: TEditorOtherFrame;
    FEditorRightMarginFrame: TEditorRightMarginFrame;
    FEditorSearchFrame: TEditorSearchFrame;
    FEditorTabsFrame: TEditorTabsFrame;
    FFileTypesFrame: TFileTypesFrame;
    FMainMenuFrame: TMainMenuFrame;
    FOptionsCompareFrame: TOptionsCompareFrame;
    FOptionsContainer: TEditBoneOptionsContainer;
    FOptionsDirectoryFrame: TOptionsDirectoryFrame;
    FOptionsOutputFrame: TOptionsOutputFrame;
    FOptionsPrintFrame: TOptionsPrintFrame;
    FOptionsOutputTabsFrame: TOptionsOutputTabsFrame;
    FStatusBarFrame: TStatusBarFrame;
    FToolBarFrame: TToolBarFrame;
    procedure CreateTree;
    procedure GetData;
    procedure PutData;
    procedure ReadIniFile;
    procedure SetVisibleFrame;
    procedure WriteIniFile;
  public
    function Execute(EditOptions: TEditBoneOptionsContainer): Boolean;
  end;

function OptionsForm: TOptionsForm;

implementation

{$R *.dfm}

uses
  BCCommon.StyleUtils, BCCommon.LanguageStrings, System.IniFiles, SynEditTypes, SynCompletionProposal,
  BCCommon.LanguageUtils;

{ TOptionsContainer }

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
  FDirectoryTabsFrame.Free;
  FEditorCompletionProposalFrame.Free;
  FEditorErrorCheckingFrame.Free;
  FEditorFontFrame.Free;
  FEditorLeftMarginFrame.Free;
  FEditorRightMarginFrame.Free;
  FEditorSearchFrame.Free;
  FEditorOptionsFrame.Free;
  FEditorOtherFrame.Free;
  FEditorTabsFrame.Free;
  FFileTypesFrame.Free;
  FMainMenuFrame.Free;
  FOptionsCompareFrame.Free;
  FOptionsDirectoryFrame.Free;
  FOptionsOutputFrame.Free;
  FOptionsPrintFrame.Free;
  FOptionsOutputTabsFrame.Free;
  FStatusBarFrame.Free;
  FToolBarFrame.Free;

  FOptionsForm := nil;
end;

procedure TOptionsForm.CreateTree;
var
  Data: POptionsRec;
  Node, ChildNode: PVirtualNode;
begin
  with OptionsVirtualStringTree do
  begin
    Clear;
    { Editor }
    Node := AddChild(nil);
    Data := GetNodeData(Node);

    Data.ImageIndex := EditorAction.ImageIndex;
    Data.Caption := EditorAction.Caption;
    { Font }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.ImageIndex := EditorFontAction.ImageIndex;
    Data.Caption := EditorFontAction.Caption;
    { Left Margin }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.ImageIndex := EditorLeftMarginAction.ImageIndex;
    Data.Caption := EditorLeftMarginAction.Caption;
    { Right Margin }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.ImageIndex := EditorRightMarginAction.ImageIndex;
    Data.Caption := EditorRightMarginAction.Caption;
    { Tabs }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.ImageIndex := EditorTabsAction.ImageIndex;
    Data.Caption := EditorTabsAction.Caption;
    { Search }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.ImageIndex := EditorSearchAction.ImageIndex;
    Data.Caption := EditorSearchAction.Caption;
    { Completion proposal }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.ImageIndex := EditorCompletionProposalAction.ImageIndex;
    Data.Caption := EditorCompletionProposalAction.Caption;
    { Error checking }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.ImageIndex := EditorErrorCheckingAction.ImageIndex;
    Data.Caption := EditorErrorCheckingAction.Caption;
    { Other }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.ImageIndex := EditorOtherAction.ImageIndex;
    Data.Caption := EditorOtherAction.Caption;
    Node.ChildCount := 8; { Remember to fix this, if child nodes are added}
    OptionsVirtualStringTree.Selected[Node] := True;
    OptionsVirtualStringTree.Expanded[Node] := True;
    { Directory }
    Node := AddChild(nil);
    Data := GetNodeData(Node);
    Data.ImageIndex := DirectoryAction.ImageIndex;
    Data.Caption := DirectoryAction.Caption;
    { Tabs }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.ImageIndex := DirectoryTabsAction.ImageIndex;
    Data.Caption := DirectoryTabsAction.Caption;
    OptionsVirtualStringTree.Selected[Node] := True;
    OptionsVirtualStringTree.Expanded[Node] := True;
    { Output }
    Node := AddChild(nil);
    Data := GetNodeData(Node);
    Data.ImageIndex := OutputAction.ImageIndex;
    Data.Caption := OutputAction.Caption;
    { Tabs }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.ImageIndex := OutputTabsAction.ImageIndex;
    Data.Caption := OutputTabsAction.Caption;
    OptionsVirtualStringTree.Selected[Node] := True;
    OptionsVirtualStringTree.Expanded[Node] := True;
    { Compare }
    Node := AddChild(nil);
    Data := GetNodeData(Node);
    Data.ImageIndex := CompareAction.ImageIndex;
    Data.Caption := CompareAction.Caption;
    { Print }
    Node := AddChild(nil);
    Data := GetNodeData(Node);
    Data.ImageIndex := PrintAction.ImageIndex;
    Data.Caption := PrintAction.Caption;
    { Main menu }
    Node := AddChild(nil);
    Data := GetNodeData(Node);
    Data.ImageIndex := MainMenuAction.ImageIndex;
    Data.Caption := MainMenuAction.Caption;
    { Tool Bar }
    Node := AddChild(nil);
    Data := GetNodeData(Node);
    Data.ImageIndex := ToolBarAction.ImageIndex;
    Data.Caption := ToolBarAction.Caption;
    { Status Bar }
    Node := AddChild(nil);
    Data := GetNodeData(Node);
    Data.ImageIndex := StatusBarAction.ImageIndex;
    Data.Caption := StatusBarAction.Caption;
    { File types }
    Node := AddChild(nil);
    Data := GetNodeData(Node);
    Data.ImageIndex := FileTypesAction.ImageIndex;
    Data.Caption := FileTypesAction.Caption;

    OptionsVirtualStringTree.Selected[OptionsVirtualStringTree.GetFirst] := True;
  end;
end;

function TOptionsForm.Execute(EditOptions: TEditBoneOptionsContainer): Boolean;
var
  SelectedLanguage: string;
begin
  ReadIniFile;

  if not Assigned(EditOptions) then
  begin
    Result:= False;
    Exit;
  end;
  SelectedLanguage := GetSelectedLanguage;

  UpdateLanguage(TForm(Self), SelectedLanguage);
  UpdateLanguage(TForm(FDirectoryTabsFrame), SelectedLanguage);
  UpdateLanguage(TForm(FEditorCompletionProposalFrame), SelectedLanguage);
  UpdateLanguage(TForm(FEditorErrorCheckingFrame), SelectedLanguage);
  UpdateLanguage(TForm(FEditorFontFrame), SelectedLanguage);
  UpdateLanguage(TForm(FEditorLeftMarginFrame), SelectedLanguage);
  UpdateLanguage(TForm(FEditorRightMarginFrame), SelectedLanguage);
  UpdateLanguage(TForm(FEditorSearchFrame), SelectedLanguage);
  UpdateLanguage(TForm(FEditorOptionsFrame), SelectedLanguage);
  UpdateLanguage(TForm(FEditorOtherFrame), SelectedLanguage);
  UpdateLanguage(TForm(FEditorTabsFrame), SelectedLanguage);
  UpdateLanguage(TForm(FFileTypesFrame), SelectedLanguage);
  UpdateLanguage(TForm(FMainMenuFrame), SelectedLanguage);
  UpdateLanguage(TForm(FOptionsCompareFrame), SelectedLanguage);
  UpdateLanguage(TForm(FOptionsDirectoryFrame), SelectedLanguage);
  UpdateLanguage(TForm(FOptionsOutputFrame), SelectedLanguage);
  UpdateLanguage(TForm(FOptionsPrintFrame), SelectedLanguage);
  UpdateLanguage(TForm(FOptionsOutputTabsFrame), SelectedLanguage);
  UpdateLanguage(TForm(FStatusBarFrame), SelectedLanguage);
  UpdateLanguage(TForm(FToolBarFrame), SelectedLanguage);

  FOptionsContainer := EditOptions;
  GetData;

  Result:= Showmodal = mrOk;
  if Result then
    PutData;
end;

procedure TOptionsForm.GetData;
begin
  FEditorOptionsFrame.GetData(FOptionsContainer);
  FEditorFontFrame.GetData(FOptionsContainer);
  FEditorLeftMarginFrame.GetData(FOptionsContainer);
  FEditorRightMarginFrame.GetData(FOptionsContainer);
  FEditorSearchFrame.GetData(FOptionsContainer);
  FEditorTabsFrame.GetData(FOptionsContainer);
  FEditorCompletionProposalFrame.GetData(FOptionsContainer);
  FOptionsDirectoryFrame.GetData(FOptionsContainer);
  FDirectoryTabsFrame.GetData(FOptionsContainer);
  FOptionsOutputFrame.GetData(FOptionsContainer);
  FOptionsOutputTabsFrame.GetData(FOptionsContainer);
  FEditorErrorCheckingFrame.GetData(FOptionsContainer);
  FOptionsCompareFrame.GetData(FOptionsContainer);
  FFileTypesFrame.GetData(FOptionsContainer);
  FEditorOtherFrame.GetData(FOptionsContainer);
  FOptionsPrintFrame.GetData(FOptionsContainer);
  FMainMenuFrame.GetData(FOptionsContainer);
  FToolBarFrame.GetData(FOptionsContainer);
  FStatusBarFrame.GetData(FOptionsContainer);
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
    { hide all frames }
    for i := 0 to ComponentCount - 1 do
      if Components[i]  is TFrame then
        TFrame(Components[i]).Visible := False;
    Level := OptionsVirtualStringTree.GetNodeLevel(TreeNode);
    ParentIndex := -1;
    if Level = 1 then
      ParentIndex := TreeNode.Parent.Index;
    FEditorOptionsFrame.Visible := (Level = 0) and (TreeNode.Index = 0);
    FEditorFontFrame.Visible := (ParentIndex = 0) and (Level = 1) and (TreeNode.Index = 0);
    if FEditorFontFrame.Visible then
    begin
      FOptionsContainer.AssignTo(FEditorFontFrame.SynEdit);
      FEditorFontFrame.SynEdit.ActiveLineColor := LightenColor(FEditorFontFrame.SynEdit.Color, 1 - (10 - FOptionsContainer.ColorBrightness)/10);
      UpdateMarginAndColors(FEditorFontFrame.SynEdit);
    end;
    FEditorLeftMarginFrame.Visible := (ParentIndex = 0) and (Level = 1) and (TreeNode.Index = 1);
    FEditorRightMarginFrame.Visible := (ParentIndex = 0) and (Level = 1) and (TreeNode.Index = 2);
    FEditorTabsFrame.Visible := (ParentIndex = 0) and (Level = 1) and (TreeNode.Index = 3);
    FEditorSearchFrame.Visible := (ParentIndex = 0) and (Level = 1) and (TreeNode.Index = 4);
    FEditorCompletionProposalFrame.Visible := (ParentIndex = 0) and (Level = 1) and (TreeNode.Index = 5);
    FEditorErrorCheckingFrame.Visible := (ParentIndex = 0) and (Level = 1) and (TreeNode.Index = 6);
    FEditorOtherFrame.Visible := (ParentIndex = 0) and (Level = 1) and (TreeNode.Index = 7);
    FOptionsDirectoryFrame.Visible := (Level = 0) and (TreeNode.Index = 1);
    FDirectoryTabsFrame.Visible := (ParentIndex = 1) and (Level = 1) and (TreeNode.Index = 0);
    FOptionsOutputFrame.Visible := (Level = 0) and (TreeNode.Index = 2);
    FOptionsOutputTabsFrame.Visible := (ParentIndex = 2) and (Level = 1) and (TreeNode.Index = 0);
    FOptionsCompareFrame.Visible := (Level = 0) and (TreeNode.Index = 3);
    FOptionsPrintFrame.Visible := (Level = 0) and (TreeNode.Index = 4);
    FMainMenuFrame.Visible := (Level = 0) and (TreeNode.Index = 5);
    FToolBarFrame.Visible := (Level = 0) and (TreeNode.Index = 6);
    FStatusBarFrame.Visible := (Level = 0) and (TreeNode.Index = 7);
    FFileTypesFrame.Visible := (Level = 0) and (TreeNode.Index = 8);

    { style bug with long TEdit border and resize }
    if FFileTypesFrame.Visible then
      if FFileTypesFrame.ExtensionsEdit.CanFocus then
        FFileTypesFrame.ExtensionsEdit.SetFocus;
  end;
end;

procedure TOptionsForm.OptionsVirtualStringTreeFreeNode(Sender: TBaseVirtualTree;
  Node: PVirtualNode);
var
  Data: POptionsRec;
begin
  Data := Sender.GetNodeData(Node);
  Finalize(Data^);
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
        TargetCanvas.Font.Color := LStyles.GetSystemColor(clHighlightText)
    end;
end;

procedure TOptionsForm.PutData;
begin
  FEditorOptionsFrame.PutData(FOptionsContainer);
  FEditorFontFrame.PutData(FOptionsContainer);
  FEditorLeftMarginFrame.PutData(FOptionsContainer);
  FEditorRightMarginFrame.PutData(FOptionsContainer);
  FEditorSearchFrame.PutData(FOptionsContainer);
  FEditorTabsFrame.PutData(FOptionsContainer);
  FEditorCompletionProposalFrame.PutData(FOptionsContainer);
  FOptionsDirectoryFrame.PutData(FOptionsContainer);
  FDirectoryTabsFrame.PutData(FOptionsContainer);
  FOptionsOutputFrame.PutData(FOptionsContainer);
  FOptionsOutputTabsFrame.PutData(FOptionsContainer);
  FOptionsCompareFrame.PutData(FOptionsContainer);
  FEditorErrorCheckingFrame.PutData(FOptionsContainer);
  FEditorOtherFrame.PutData(FOptionsContainer);
  FOptionsPrintFrame.PutData(FOptionsContainer);
  FMainMenuFrame.PutData(FOptionsContainer);
  FToolBarFrame.PutData(FOptionsContainer);
  FStatusBarFrame.PutData(FOptionsContainer);
end;

procedure TOptionsForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FOptionsContainer.SupportedFileExts(True);
  WriteIniFile;
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
  FDirectoryTabsFrame := TDirectoryTabsFrame.Create(OptionsPanel);
  FDirectoryTabsFrame.Parent := OptionsPanel;
  FEditorCompletionProposalFrame := TEditorCompletionProposalFrame.Create(OptionsPanel);
  FEditorCompletionProposalFrame.Parent := OptionsPanel;
  FEditorErrorCheckingFrame := TEditorErrorCheckingFrame.Create(OptionsPanel);
  FEditorErrorCheckingFrame.Parent := OptionsPanel;
  FEditorFontFrame := TEditorFontFrame.Create(OptionsPanel);
  FEditorFontFrame.Parent := OptionsPanel;
  FEditorLeftMarginFrame := TEditorLeftMarginFrame.Create(OptionsPanel);
  FEditorLeftMarginFrame.Parent := OptionsPanel;
  FEditorRightMarginFrame := TEditorRightMarginFrame.Create(OptionsPanel);
  FEditorRightMarginFrame.Parent := OptionsPanel;
  FEditorSearchFrame := TEditorSearchFrame.Create(OptionsPanel);
  FEditorSearchFrame.Parent := OptionsPanel;
  FEditorOptionsFrame := TEditorOptionsFrame.Create(OptionsPanel);
  FEditorOptionsFrame.Parent := OptionsPanel;
  FEditorOtherFrame := TEditorOtherFrame.Create(OptionsPanel);
  FEditorOtherFrame.Parent := OptionsPanel;
  FEditorTabsFrame := TEditorTabsFrame.Create(OptionsPanel);
  FEditorTabsFrame.Parent := OptionsPanel;
  FFileTypesFrame := TFileTypesFrame.Create(OptionsPanel);
  FFileTypesFrame.Parent := OptionsPanel;
  FMainMenuFrame := TMainMenuFrame.Create(OptionsPanel);
  FMainMenuFrame.Parent := OptionsPanel;
  FOptionsCompareFrame := TOptionsCompareFrame.Create(OptionsPanel);
  FOptionsCompareFrame.Parent := OptionsPanel;
  FOptionsDirectoryFrame := TOptionsDirectoryFrame.Create(OptionsPanel);
  FOptionsDirectoryFrame.Parent := OptionsPanel;
  FOptionsOutputFrame := TOptionsOutputFrame.Create(OptionsPanel);
  FOptionsOutputFrame.Parent := OptionsPanel;
  FOptionsPrintFrame := TOptionsPrintFrame.Create(OptionsPanel);
  FOptionsPrintFrame.Parent := OptionsPanel;
  FOptionsOutputTabsFrame := TOptionsOutputTabsFrame.Create(OptionsPanel);
  FOptionsOutputTabsFrame.Parent := OptionsPanel;
  FStatusBarFrame := TStatusBarFrame.Create(OptionsPanel);
  FStatusBarFrame.Parent := OptionsPanel;
  FToolBarFrame := TToolBarFrame.Create(OptionsPanel);
  FToolBarFrame.Parent := OptionsPanel;
end;

procedure TOptionsForm.FormShow(Sender: TObject);
var
  Node: PVirtualNode;
begin
  inherited;
  Node := OptionsVirtualStringTree.GetFirstSelected;
  CreateTree;
  OptionsVirtualStringTree.Selected[Node] := True;
  SetVisibleFrame;
end;

end.
