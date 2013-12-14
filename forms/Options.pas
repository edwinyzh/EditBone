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
    FOptionsDirectoryTabsFrame: TOptionsDirectoryTabsFrame;
    FOptionsEditorCompletionProposalFrame: TOptionsEditorCompletionProposalFrame;
    FOptionsEditorErrorCheckingFrame: TOptionsEditorErrorCheckingFrame;
    FOptionsEditorFontFrame: TOptionsEditorFontFrame;
    FOptionsEditorLeftMarginFrame: TOptionsEditorLeftMarginFrame;
    FOptionsEditorOptionsFrame: TOptionsEditorOptionsFrame;
    FOptionsEditorOtherFrame: TOptionsEditorOtherFrame;
    FOptionsEditorRightMarginFrame: TOptionsEditorRightMarginFrame;
    FOptionsEditorSearchFrame: TOptionsEditorSearchFrame;
    FOptionsEditorTabsFrame: TOptionsEditorTabsFrame;
    FOptionsFileTypesFrame: TOptionsFileTypesFrame;
    FOptionsMainMenuFrame: TOptionsMainMenuFrame;
    FOptionsCompareFrame: TOptionsCompareFrame;
    FOptionsContainer: TEditBoneOptionsContainer;
    FOptionsDirectoryFrame: TOptionsDirectoryFrame;
    FOptionsOutputFrame: TOptionsOutputFrame;
    FOptionsPrintFrame: TOptionsPrintFrame;
    FOptionsOutputTabsFrame: TOptionsOutputTabsFrame;
    FOptionsStatusBarFrame: TOptionsStatusBarFrame;
    FOptionsToolBarFrame: TOptionsToolBarFrame;
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
  FOptionsDirectoryTabsFrame.Free;
  FOptionsEditorCompletionProposalFrame.Free;
  FOptionsEditorErrorCheckingFrame.Free;
  FOptionsEditorFontFrame.Free;
  FOptionsEditorLeftMarginFrame.Free;
  FOptionsEditorRightMarginFrame.Free;
  FOptionsEditorSearchFrame.Free;
  FOptionsEditorOptionsFrame.Free;
  FOptionsEditorOtherFrame.Free;
  FOptionsEditorTabsFrame.Free;
  FOptionsFileTypesFrame.Free;
  FOptionsMainMenuFrame.Free;
  FOptionsCompareFrame.Free;
  FOptionsDirectoryFrame.Free;
  FOptionsOutputFrame.Free;
  FOptionsPrintFrame.Free;
  FOptionsOutputTabsFrame.Free;
  FOptionsStatusBarFrame.Free;
  FOptionsToolBarFrame.Free;

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
  UpdateLanguage(TForm(FOptionsDirectoryTabsFrame), SelectedLanguage);
  UpdateLanguage(TForm(FOptionsEditorCompletionProposalFrame), SelectedLanguage);
  UpdateLanguage(TForm(FOptionsEditorErrorCheckingFrame), SelectedLanguage);
  UpdateLanguage(TForm(FOptionsEditorFontFrame), SelectedLanguage);
  UpdateLanguage(TForm(FOptionsEditorLeftMarginFrame), SelectedLanguage);
  UpdateLanguage(TForm(FOptionsEditorRightMarginFrame), SelectedLanguage);
  UpdateLanguage(TForm(FOptionsEditorSearchFrame), SelectedLanguage);
  UpdateLanguage(TForm(FOptionsEditorOptionsFrame), SelectedLanguage);
  UpdateLanguage(TForm(FOptionsEditorOtherFrame), SelectedLanguage);
  UpdateLanguage(TForm(FOptionsEditorTabsFrame), SelectedLanguage);
  UpdateLanguage(TForm(FOptionsFileTypesFrame), SelectedLanguage);
  UpdateLanguage(TForm(FOptionsMainMenuFrame), SelectedLanguage);
  UpdateLanguage(TForm(FOptionsCompareFrame), SelectedLanguage);
  UpdateLanguage(TForm(FOptionsDirectoryFrame), SelectedLanguage);
  UpdateLanguage(TForm(FOptionsOutputFrame), SelectedLanguage);
  UpdateLanguage(TForm(FOptionsPrintFrame), SelectedLanguage);
  UpdateLanguage(TForm(FOptionsOutputTabsFrame), SelectedLanguage);
  UpdateLanguage(TForm(FOptionsStatusBarFrame), SelectedLanguage);
  UpdateLanguage(TForm(FOptionsToolBarFrame), SelectedLanguage);

  FOptionsContainer := EditOptions;
  GetData;

  Result:= Showmodal = mrOk;
  if Result then
    PutData;
end;

procedure TOptionsForm.GetData;
begin
  FOptionsEditorOptionsFrame.GetData(FOptionsContainer);
  FOptionsEditorFontFrame.GetData(FOptionsContainer);
  FOptionsEditorLeftMarginFrame.GetData(FOptionsContainer);
  FOptionsEditorRightMarginFrame.GetData(FOptionsContainer);
  FOptionsEditorSearchFrame.GetData(FOptionsContainer);
  FOptionsEditorTabsFrame.GetData(FOptionsContainer);
  FOptionsEditorCompletionProposalFrame.GetData(FOptionsContainer);
  FOptionsDirectoryFrame.GetData(FOptionsContainer);
  FOptionsDirectoryTabsFrame.GetData(FOptionsContainer);
  FOptionsOutputFrame.GetData(FOptionsContainer);
  FOptionsOutputTabsFrame.GetData(FOptionsContainer);
  FOptionsEditorErrorCheckingFrame.GetData(FOptionsContainer);
  FOptionsCompareFrame.GetData(FOptionsContainer);
  FOptionsFileTypesFrame.GetData(FOptionsContainer);
  FOptionsEditorOtherFrame.GetData(FOptionsContainer);
  FOptionsPrintFrame.GetData(FOptionsContainer);
  FOptionsMainMenuFrame.GetData(FOptionsContainer);
  FOptionsToolBarFrame.GetData(FOptionsContainer);
  FOptionsStatusBarFrame.GetData(FOptionsContainer);
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
    FOptionsEditorOptionsFrame.Visible := (Level = 0) and (TreeNode.Index = 0);
    FOptionsEditorFontFrame.Visible := (ParentIndex = 0) and (Level = 1) and (TreeNode.Index = 0);
    if FOptionsEditorFontFrame.Visible then
    begin
      FOptionsContainer.AssignTo(FOptionsEditorFontFrame.SynEdit);
      FOptionsEditorFontFrame.SynEdit.ActiveLineColor := LightenColor(FOptionsEditorFontFrame.SynEdit.Color, 1 - (10 - FOptionsContainer.ColorBrightness)/10);
      UpdateMarginAndColors(FOptionsEditorFontFrame.SynEdit);
    end;
    FOptionsEditorLeftMarginFrame.Visible := (ParentIndex = 0) and (Level = 1) and (TreeNode.Index = 1);
    FOptionsEditorRightMarginFrame.Visible := (ParentIndex = 0) and (Level = 1) and (TreeNode.Index = 2);
    FOptionsEditorTabsFrame.Visible := (ParentIndex = 0) and (Level = 1) and (TreeNode.Index = 3);
    FOptionsEditorSearchFrame.Visible := (ParentIndex = 0) and (Level = 1) and (TreeNode.Index = 4);
    FOptionsEditorCompletionProposalFrame.Visible := (ParentIndex = 0) and (Level = 1) and (TreeNode.Index = 5);
    FOptionsEditorErrorCheckingFrame.Visible := (ParentIndex = 0) and (Level = 1) and (TreeNode.Index = 6);
    FOptionsEditorOtherFrame.Visible := (ParentIndex = 0) and (Level = 1) and (TreeNode.Index = 7);
    FOptionsDirectoryFrame.Visible := (Level = 0) and (TreeNode.Index = 1);
    FOptionsDirectoryTabsFrame.Visible := (ParentIndex = 1) and (Level = 1) and (TreeNode.Index = 0);
    FOptionsOutputFrame.Visible := (Level = 0) and (TreeNode.Index = 2);
    FOptionsOutputTabsFrame.Visible := (ParentIndex = 2) and (Level = 1) and (TreeNode.Index = 0);
    FOptionsCompareFrame.Visible := (Level = 0) and (TreeNode.Index = 3);
    FOptionsPrintFrame.Visible := (Level = 0) and (TreeNode.Index = 4);
    FOptionsMainMenuFrame.Visible := (Level = 0) and (TreeNode.Index = 5);
    FOptionsToolBarFrame.Visible := (Level = 0) and (TreeNode.Index = 6);
    FOptionsStatusBarFrame.Visible := (Level = 0) and (TreeNode.Index = 7);
    FOptionsFileTypesFrame.Visible := (Level = 0) and (TreeNode.Index = 8);

    { style bug with long TEdit border and resize }
    if FOptionsFileTypesFrame.Visible then
      if FOptionsFileTypesFrame.ExtensionsEdit.CanFocus then
        FOptionsFileTypesFrame.ExtensionsEdit.SetFocus;
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
  FOptionsEditorOptionsFrame.PutData(FOptionsContainer);
  FOptionsEditorFontFrame.PutData(FOptionsContainer);
  FOptionsEditorLeftMarginFrame.PutData(FOptionsContainer);
  FOptionsEditorRightMarginFrame.PutData(FOptionsContainer);
  FOptionsEditorSearchFrame.PutData(FOptionsContainer);
  FOptionsEditorTabsFrame.PutData(FOptionsContainer);
  FOptionsEditorCompletionProposalFrame.PutData(FOptionsContainer);
  FOptionsDirectoryFrame.PutData(FOptionsContainer);
  FOptionsDirectoryTabsFrame.PutData(FOptionsContainer);
  FOptionsOutputFrame.PutData(FOptionsContainer);
  FOptionsOutputTabsFrame.PutData(FOptionsContainer);
  FOptionsCompareFrame.PutData(FOptionsContainer);
  FOptionsEditorErrorCheckingFrame.PutData(FOptionsContainer);
  FOptionsEditorOtherFrame.PutData(FOptionsContainer);
  FOptionsPrintFrame.PutData(FOptionsContainer);
  FOptionsMainMenuFrame.PutData(FOptionsContainer);
  FOptionsToolBarFrame.PutData(FOptionsContainer);
  FOptionsStatusBarFrame.PutData(FOptionsContainer);
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
  FOptionsDirectoryTabsFrame := TOptionsDirectoryTabsFrame.Create(OptionsPanel);
  FOptionsDirectoryTabsFrame.Parent := OptionsPanel;
  FOptionsEditorCompletionProposalFrame := TOptionsEditorCompletionProposalFrame.Create(OptionsPanel);
  FOptionsEditorCompletionProposalFrame.Parent := OptionsPanel;
  FOptionsEditorErrorCheckingFrame := TOptionsEditorErrorCheckingFrame.Create(OptionsPanel);
  FOptionsEditorErrorCheckingFrame.Parent := OptionsPanel;
  FOptionsEditorFontFrame := TOptionsEditorFontFrame.Create(OptionsPanel);
  FOptionsEditorFontFrame.Parent := OptionsPanel;
  FOptionsEditorLeftMarginFrame := TOptionsEditorLeftMarginFrame.Create(OptionsPanel);
  FOptionsEditorLeftMarginFrame.Parent := OptionsPanel;
  FOptionsEditorRightMarginFrame := TOptionsEditorRightMarginFrame.Create(OptionsPanel);
  FOptionsEditorRightMarginFrame.Parent := OptionsPanel;
  FOptionsEditorSearchFrame := TOptionsEditorSearchFrame.Create(OptionsPanel);
  FOptionsEditorSearchFrame.Parent := OptionsPanel;
  FOptionsEditorOptionsFrame := TOptionsEditorOptionsFrame.Create(OptionsPanel);
  FOptionsEditorOptionsFrame.Parent := OptionsPanel;
  FOptionsEditorOtherFrame := TOptionsEditorOtherFrame.Create(OptionsPanel);
  FOptionsEditorOtherFrame.Parent := OptionsPanel;
  FOptionsEditorTabsFrame := TOptionsEditorTabsFrame.Create(OptionsPanel);
  FOptionsEditorTabsFrame.Parent := OptionsPanel;
  FOptionsFileTypesFrame := TOptionsFileTypesFrame.Create(OptionsPanel);
  FOptionsFileTypesFrame.Parent := OptionsPanel;
  FOptionsMainMenuFrame := TOptionsMainMenuFrame.Create(OptionsPanel);
  FOptionsMainMenuFrame.Parent := OptionsPanel;
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
  FOptionsStatusBarFrame := TOptionsStatusBarFrame.Create(OptionsPanel);
  FOptionsStatusBarFrame.Parent := OptionsPanel;
  FOptionsToolBarFrame := TOptionsToolBarFrame.Create(OptionsPanel);
  FOptionsToolBarFrame.Parent := OptionsPanel;
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
