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
    FSelectedLanguage: string;
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
    procedure PutData;
    procedure ReadIniFile;
    procedure SetVisibleFrame;
    procedure WriteIniFile;
    procedure EditorOptionsVisible(Visible: Boolean);
    procedure EditorFontVisible(Visible: Boolean);
    procedure EditorLeftMarginVisible(Visible: Boolean);
    procedure EditorRightMarginVisible(Visible: Boolean);
    procedure EditorTabsVisible(Visible: Boolean);
    procedure EditorSearchVisible(Visible: Boolean);
    procedure EditorCompletionProposalVisible(Visible: Boolean);
    procedure EditorErrorCheckingVisible(Visible: Boolean);
    procedure EditorOtherVisible(Visible: Boolean);
    procedure DirectoryVisible(Visible: Boolean);
    procedure DirectoryTabsVisible(Visible: Boolean);
    procedure OutputVisible(Visible: Boolean);
    procedure OutputTabsVisible(Visible: Boolean);
    procedure CompareVisible(Visible: Boolean);
    procedure PrintVisible(Visible: Boolean);
    procedure MainMenuVisible(Visible: Boolean);
    procedure ToolBarVisible(Visible: Boolean);
    procedure StatusBarVisible(Visible: Boolean);
    procedure FileTypesVisible(Visible: Boolean);
  public
    function Execute(EditOptions: TEditBoneOptionsContainer): Boolean;
  end;

function OptionsForm: TOptionsForm;

implementation

{$R *.dfm}

uses
  BCCommon.StyleUtils, BCCommon.LanguageStrings, System.IniFiles, SynEditTypes, SynCompletionProposal,
  BCCommon.LanguageUtils, BCCommon.Lib, Winapi.Windows;

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
    Data.Index := 0;
    Data.ImageIndex := EditorAction.ImageIndex;
    Data.Caption := EditorAction.Caption;
    { Font }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.Index := 1;
    Data.ImageIndex := EditorFontAction.ImageIndex;
    Data.Caption := EditorFontAction.Caption;
    { Left Margin }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.Index := 2;
    Data.ImageIndex := EditorLeftMarginAction.ImageIndex;
    Data.Caption := EditorLeftMarginAction.Caption;
    { Right Margin }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.Index := 3;
    Data.ImageIndex := EditorRightMarginAction.ImageIndex;
    Data.Caption := EditorRightMarginAction.Caption;
    { Tabs }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.Index := 4;
    Data.ImageIndex := EditorTabsAction.ImageIndex;
    Data.Caption := EditorTabsAction.Caption;
    { Search }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.Index := 5;
    Data.ImageIndex := EditorSearchAction.ImageIndex;
    Data.Caption := EditorSearchAction.Caption;
    { Completion proposal }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.Index := 6;
    Data.ImageIndex := EditorCompletionProposalAction.ImageIndex;
    Data.Caption := EditorCompletionProposalAction.Caption;
    { Error checking }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.Index := 7;
    Data.ImageIndex := EditorErrorCheckingAction.ImageIndex;
    Data.Caption := EditorErrorCheckingAction.Caption;
    { Other }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.Index := 8;
    Data.ImageIndex := EditorOtherAction.ImageIndex;
    Data.Caption := EditorOtherAction.Caption;
    Node.ChildCount := OptionsVirtualStringTree.ChildCount[Node];
    OptionsVirtualStringTree.Selected[Node] := True;
    OptionsVirtualStringTree.Expanded[Node] := True;
    { Directory }
    Node := AddChild(nil);
    Data := GetNodeData(Node);
    Data.Index := 9;
    Data.ImageIndex := DirectoryAction.ImageIndex;
    Data.Caption := DirectoryAction.Caption;
    { Tabs }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.Index := 10;
    Data.ImageIndex := DirectoryTabsAction.ImageIndex;
    Data.Caption := DirectoryTabsAction.Caption;
    Node.ChildCount := OptionsVirtualStringTree.ChildCount[Node];
    OptionsVirtualStringTree.Selected[Node] := True;
    OptionsVirtualStringTree.Expanded[Node] := True;
    { Output }
    Node := AddChild(nil);
    Data := GetNodeData(Node);
    Data.Index := 11;
    Data.ImageIndex := OutputAction.ImageIndex;
    Data.Caption := OutputAction.Caption;
    { Tabs }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.Index := 12;
    Data.ImageIndex := OutputTabsAction.ImageIndex;
    Data.Caption := OutputTabsAction.Caption;
    Node.ChildCount := OptionsVirtualStringTree.ChildCount[Node];
    OptionsVirtualStringTree.Selected[Node] := True;
    OptionsVirtualStringTree.Expanded[Node] := True;
    { Compare }
    Node := AddChild(nil);
    Data := GetNodeData(Node);
    Data.Index := 13;
    Data.ImageIndex := CompareAction.ImageIndex;
    Data.Caption := CompareAction.Caption;
    { Print }
    Node := AddChild(nil);
    Data := GetNodeData(Node);
    Data.Index := 14;
    Data.ImageIndex := PrintAction.ImageIndex;
    Data.Caption := PrintAction.Caption;
    { Main menu }
    Node := AddChild(nil);
    Data := GetNodeData(Node);
    Data.Index := 15;
    Data.ImageIndex := MainMenuAction.ImageIndex;
    Data.Caption := MainMenuAction.Caption;
    { Tool Bar }
    Node := AddChild(nil);
    Data := GetNodeData(Node);
    Data.Index := 16;
    Data.ImageIndex := ToolBarAction.ImageIndex;
    Data.Caption := ToolBarAction.Caption;
    { Status Bar }
    Node := AddChild(nil);
    Data := GetNodeData(Node);
    Data.Index := 17;
    Data.ImageIndex := StatusBarAction.ImageIndex;
    Data.Caption := StatusBarAction.Caption;
    { File types }
    Node := AddChild(nil);
    Data := GetNodeData(Node);
    Data.Index := 18;
    Data.ImageIndex := FileTypesAction.ImageIndex;
    Data.Caption := FileTypesAction.Caption;

    OptionsVirtualStringTree.Selected[OptionsVirtualStringTree.GetFirst] := True;
  end;
end;

function TOptionsForm.Execute(EditOptions: TEditBoneOptionsContainer): Boolean;
var
  Node: PVirtualNode;
  Data: POptionsRec;
begin
  ReadIniFile;

  if not Assigned(EditOptions) then
  begin
    Result:= False;
    Exit;
  end;
  FSelectedLanguage := GetSelectedLanguage;
  UpdateLanguage(Self, FSelectedLanguage);
  FOptionsContainer := EditOptions;

  Result := Showmodal = mrOk;
  if Result then
    PutData;

  { save the selected tree node }
  with TIniFile.Create(GetIniFilename) do
  try
    Node := OptionsVirtualStringTree.GetFirstSelected;
    Data := OptionsVirtualStringTree.GetNodeData(Node);
    WriteInteger('Options', 'OptionsSelectedItemIndex', Data.Index);
  finally
    Free;
  end;

  Free;
end;

procedure TOptionsForm.OptionsVirtualStringTreeClick(Sender: TObject);
begin
  SetVisibleFrame;
end;

procedure TOptionsForm.EditorOptionsVisible(Visible: Boolean);
begin
  if Visible then
    if not Assigned(FOptionsEditorOptionsFrame) then
    begin
      FOptionsEditorOptionsFrame := TOptionsEditorOptionsFrame.Create(OptionsPanel);
      UpdateLanguage(TForm(FOptionsEditorOptionsFrame), FSelectedLanguage);
      FOptionsEditorOptionsFrame.GetData(FOptionsContainer);
      FOptionsEditorOptionsFrame.Parent := ScrollBox;
    end;
  if Assigned(FOptionsEditorOptionsFrame) then
    FOptionsEditorOptionsFrame.Visible := Visible;
end;

procedure TOptionsForm.EditorFontVisible(Visible: Boolean);
begin
  if Visible then
    if not Assigned(FOptionsEditorFontFrame) then
    begin
      FOptionsEditorFontFrame := TOptionsEditorFontFrame.Create(OptionsPanel);
      UpdateLanguage(TForm(FOptionsEditorFontFrame), FSelectedLanguage);
      FOptionsEditorFontFrame.GetData(FOptionsContainer);
      FOptionsContainer.AssignTo(FOptionsEditorFontFrame.SynEdit);
      FOptionsEditorFontFrame.SynEdit.ActiveLineColor := LightenColor(FOptionsEditorFontFrame.SynEdit.Color, 1 - (10 - FOptionsContainer.ColorBrightness)/10);
      UpdateMarginAndColors(FOptionsEditorFontFrame.SynEdit);
      FOptionsEditorFontFrame.Parent := ScrollBox;
    end;
  if Assigned(FOptionsEditorFontFrame) then
    FOptionsEditorFontFrame.Visible := Visible;
end;

procedure TOptionsForm.EditorLeftMarginVisible(Visible: Boolean);
begin
  if Visible then
    if not Assigned(FOptionsEditorLeftMarginFrame) then
    begin
      FOptionsEditorLeftMarginFrame := TOptionsEditorLeftMarginFrame.Create(OptionsPanel);
      UpdateLanguage(TForm(FOptionsEditorLeftMarginFrame), FSelectedLanguage);
      FOptionsEditorLeftMarginFrame.GetData(FOptionsContainer);
      FOptionsEditorLeftMarginFrame.Parent := ScrollBox;
    end;
  if Assigned(FOptionsEditorLeftMarginFrame) then
    FOptionsEditorLeftMarginFrame.Visible := Visible;
end;

procedure TOptionsForm.EditorRightMarginVisible(Visible: Boolean);
begin
  if Visible then
    if not Assigned(FOptionsEditorRightMarginFrame) then
    begin
      FOptionsEditorRightMarginFrame := TOptionsEditorRightMarginFrame.Create(OptionsPanel);
      UpdateLanguage(TForm(FOptionsEditorRightMarginFrame), FSelectedLanguage);
      FOptionsEditorRightMarginFrame.GetData(FOptionsContainer);
      FOptionsEditorRightMarginFrame.Parent := ScrollBox;
    end;
  if Assigned(FOptionsEditorRightMarginFrame) then
    FOptionsEditorRightMarginFrame.Visible := Visible;
end;

procedure TOptionsForm.EditorTabsVisible(Visible: Boolean);
begin
  if Visible then
    if not Assigned(FOptionsEditorTabsFrame) then
    begin
      FOptionsEditorTabsFrame := TOptionsEditorTabsFrame.Create(OptionsPanel);
      UpdateLanguage(TForm(FOptionsEditorTabsFrame), FSelectedLanguage);
      FOptionsEditorTabsFrame.GetData(FOptionsContainer);
      FOptionsEditorTabsFrame.Parent := ScrollBox;
    end;
  if Assigned(FOptionsEditorTabsFrame) then
    FOptionsEditorTabsFrame.Visible := Visible;
end;

procedure TOptionsForm.EditorSearchVisible(Visible: Boolean);
begin
  if Visible then
    if not Assigned(FOptionsEditorSearchFrame) then
    begin
      FOptionsEditorSearchFrame := TOptionsEditorSearchFrame.Create(OptionsPanel);
      UpdateLanguage(TForm(FOptionsEditorSearchFrame), FSelectedLanguage);
      FOptionsEditorSearchFrame.GetData(FOptionsContainer);
      FOptionsEditorSearchFrame.Parent := ScrollBox;
    end;
  if Assigned(FOptionsEditorSearchFrame) then
    FOptionsEditorSearchFrame.Visible := Visible;
end;

procedure TOptionsForm.EditorCompletionProposalVisible(Visible: Boolean);
begin
  if Visible then
    if not Assigned(FOptionsEditorCompletionProposalFrame) then
    begin
      FOptionsEditorCompletionProposalFrame := TOptionsEditorCompletionProposalFrame.Create(OptionsPanel);
      UpdateLanguage(TForm(FOptionsEditorCompletionProposalFrame), FSelectedLanguage);
      FOptionsEditorCompletionProposalFrame.GetData(FOptionsContainer);
      FOptionsEditorCompletionProposalFrame.Parent := ScrollBox;
    end;
  if Assigned(FOptionsEditorCompletionProposalFrame) then
    FOptionsEditorCompletionProposalFrame.Visible := Visible;
end;

procedure TOptionsForm.EditorErrorCheckingVisible(Visible: Boolean);
begin
  if Visible then
    if not Assigned(FOptionsEditorErrorCheckingFrame) then
    begin
      FOptionsEditorErrorCheckingFrame := TOptionsEditorErrorCheckingFrame.Create(OptionsPanel);
      UpdateLanguage(TForm(FOptionsEditorErrorCheckingFrame), FSelectedLanguage);
      FOptionsEditorErrorCheckingFrame.GetData(FOptionsContainer);
      FOptionsEditorErrorCheckingFrame.Parent := ScrollBox;
    end;
  if Assigned(FOptionsEditorErrorCheckingFrame) then
    FOptionsEditorErrorCheckingFrame.Visible := Visible;
end;

procedure TOptionsForm.EditorOtherVisible(Visible: Boolean);
begin
  if Visible then
    if not Assigned(FOptionsEditorOtherFrame) then
    begin
      FOptionsEditorOtherFrame := TOptionsEditorOtherFrame.Create(OptionsPanel);
      UpdateLanguage(TForm(FOptionsEditorOtherFrame), FSelectedLanguage);
      FOptionsEditorOtherFrame.GetData(FOptionsContainer);
      FOptionsEditorOtherFrame.Parent := ScrollBox;
    end;
  if Assigned(FOptionsEditorOtherFrame) then
    FOptionsEditorOtherFrame.Visible := Visible;
end;

procedure TOptionsForm.DirectoryVisible(Visible: Boolean);
begin
  if Visible then
    if not Assigned(FOptionsDirectoryFrame) then
    begin
      FOptionsDirectoryFrame := TOptionsDirectoryFrame.Create(OptionsPanel);
      UpdateLanguage(TForm(FOptionsDirectoryFrame), FSelectedLanguage);
      FOptionsDirectoryFrame.GetData(FOptionsContainer);
      FOptionsDirectoryFrame.Parent := ScrollBox;
    end;
  if Assigned(FOptionsDirectoryFrame) then
    FOptionsDirectoryFrame.Visible := Visible;
end;

procedure TOptionsForm.DirectoryTabsVisible(Visible: Boolean);
begin
  if Visible then
    if not Assigned(FOptionsDirectoryTabsFrame) then
    begin
      FOptionsDirectoryTabsFrame := TOptionsDirectoryTabsFrame.Create(OptionsPanel);
      UpdateLanguage(TForm(FOptionsDirectoryTabsFrame), FSelectedLanguage);
      FOptionsDirectoryTabsFrame.GetData(FOptionsContainer);
      FOptionsDirectoryTabsFrame.Parent := ScrollBox;
    end;
  if Assigned(FOptionsDirectoryTabsFrame) then
    FOptionsDirectoryTabsFrame.Visible := Visible;
end;

procedure TOptionsForm.OutputVisible(Visible: Boolean);
begin
  if Visible then
    if not Assigned(FOptionsOutputFrame) then
    begin
      FOptionsOutputFrame := TOptionsOutputFrame.Create(OptionsPanel);
      UpdateLanguage(TForm(FOptionsOutputFrame), FSelectedLanguage);
      FOptionsOutputFrame.GetData(FOptionsContainer);
      FOptionsOutputFrame.Parent := ScrollBox;
    end;
  if Assigned(FOptionsOutputFrame) then
    FOptionsOutputFrame.Visible := Visible;
end;

procedure TOptionsForm.OutputTabsVisible(Visible: Boolean);
begin
  if Visible then
    if not Assigned(FOptionsOutputTabsFrame) then
    begin
      FOptionsOutputTabsFrame := TOptionsOutputTabsFrame.Create(OptionsPanel);
      UpdateLanguage(TForm(FOptionsOutputTabsFrame), FSelectedLanguage);
      FOptionsOutputTabsFrame.GetData(FOptionsContainer);
      FOptionsOutputTabsFrame.Parent := ScrollBox;
    end;
  if Assigned(FOptionsOutputTabsFrame) then
    FOptionsOutputTabsFrame.Visible := Visible;
end;

procedure TOptionsForm.CompareVisible(Visible: Boolean);
begin
  if Visible then
    if not Assigned(FOptionsCompareFrame) then
    begin
      FOptionsCompareFrame := TOptionsCompareFrame.Create(OptionsPanel);
      UpdateLanguage(TForm(FOptionsCompareFrame), FSelectedLanguage);
      FOptionsCompareFrame.GetData(FOptionsContainer);
      FOptionsCompareFrame.Parent := ScrollBox;
    end;
  if Assigned(FOptionsCompareFrame) then
    FOptionsCompareFrame.Visible := Visible;
end;

procedure TOptionsForm.PrintVisible(Visible: Boolean);
begin
  if Visible then
    if not Assigned(FOptionsPrintFrame) then
    begin
      FOptionsPrintFrame := TOptionsPrintFrame.Create(OptionsPanel);
      UpdateLanguage(TForm(FOptionsPrintFrame), FSelectedLanguage);
      FOptionsPrintFrame.GetData(FOptionsContainer);
      FOptionsPrintFrame.Parent := ScrollBox;
    end;
  if Assigned(FOptionsPrintFrame) then
    FOptionsPrintFrame.Visible := Visible;
end;

procedure TOptionsForm.MainMenuVisible(Visible: Boolean);
begin
  if Visible then
    if not Assigned(FOptionsMainMenuFrame) then
    begin
      FOptionsMainMenuFrame := TOptionsMainMenuFrame.Create(OptionsPanel);
      UpdateLanguage(TForm(FOptionsMainMenuFrame), FSelectedLanguage);
      FOptionsMainMenuFrame.GetData(FOptionsContainer);
      FOptionsMainMenuFrame.Parent := ScrollBox;
    end;
  if Assigned(FOptionsMainMenuFrame) then
    FOptionsMainMenuFrame.Visible := Visible;
end;

procedure TOptionsForm.ToolBarVisible(Visible: Boolean);
begin
  if Visible then
    if not Assigned(FOptionsToolBarFrame) then
    begin
      FOptionsToolBarFrame := TOptionsToolBarFrame.Create(OptionsPanel);
      UpdateLanguage(TForm(FOptionsToolBarFrame), FSelectedLanguage);
      FOptionsToolBarFrame.GetData(FOptionsContainer);
      FOptionsToolBarFrame.Parent := ScrollBox;
    end;
  if Assigned(FOptionsToolBarFrame) then
    FOptionsToolBarFrame.Visible := Visible;
end;

procedure TOptionsForm.StatusBarVisible(Visible: Boolean);
begin
  if Visible then
    if not Assigned(FOptionsStatusBarFrame) then
    begin
      FOptionsStatusBarFrame := TOptionsStatusBarFrame.Create(OptionsPanel);
      UpdateLanguage(TForm(FOptionsStatusBarFrame), FSelectedLanguage);
      FOptionsStatusBarFrame.GetData(FOptionsContainer);
      FOptionsStatusBarFrame.Parent := ScrollBox;
    end;
  if Assigned(FOptionsStatusBarFrame) then
    FOptionsStatusBarFrame.Visible := Visible;
end;

procedure TOptionsForm.FileTypesVisible(Visible: Boolean);
begin
  if Visible then
    if not Assigned(FOptionsFileTypesFrame) then
    begin
      FOptionsFileTypesFrame := TOptionsFileTypesFrame.Create(OptionsPanel);
      UpdateLanguage(TForm(FOptionsFileTypesFrame), FSelectedLanguage);
      FOptionsFileTypesFrame.GetData(FOptionsContainer);
      { style bug with long TEdit border and resize }
      if FOptionsFileTypesFrame.Visible then
        if FOptionsFileTypesFrame.ExtensionsEdit.CanFocus then
          FOptionsFileTypesFrame.ExtensionsEdit.SetFocus;
      FOptionsFileTypesFrame.Parent := ScrollBox;
    end;
  if Assigned(FOptionsFileTypesFrame) then
    FOptionsFileTypesFrame.Visible := Visible;
end;

procedure TOptionsForm.SetVisibleFrame;
var
  Level, ParentIndex: Integer;
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

    EditorOptionsVisible((Level = 0) and (TreeNode.Index = 0));
    EditorFontVisible((ParentIndex = 0) and (Level = 1) and (TreeNode.Index = 0));
    EditorLeftMarginVisible((ParentIndex = 0) and (Level = 1) and (TreeNode.Index = 1));
    EditorRightMarginVisible((ParentIndex = 0) and (Level = 1) and (TreeNode.Index = 2));
    EditorTabsVisible((ParentIndex = 0) and (Level = 1) and (TreeNode.Index = 3));
    EditorSearchVisible((ParentIndex = 0) and (Level = 1) and (TreeNode.Index = 4));
    EditorCompletionProposalVisible((ParentIndex = 0) and (Level = 1) and (TreeNode.Index = 5));
    EditorErrorCheckingVisible((ParentIndex = 0) and (Level = 1) and (TreeNode.Index = 6));
    EditorOtherVisible((ParentIndex = 0) and (Level = 1) and (TreeNode.Index = 7));
    DirectoryVisible((Level = 0) and (TreeNode.Index = 1));
    DirectoryTabsVisible((ParentIndex = 1) and (Level = 1) and (TreeNode.Index = 0));
    OutputVisible((Level = 0) and (TreeNode.Index = 2));
    OutputTabsVisible((ParentIndex = 2) and (Level = 1) and (TreeNode.Index = 0));
    CompareVisible((Level = 0) and (TreeNode.Index = 3));
    PrintVisible((Level = 0) and (TreeNode.Index = 4));
    MainMenuVisible((Level = 0) and (TreeNode.Index = 5));
    ToolBarVisible((Level = 0) and (TreeNode.Index = 6));
    StatusBarVisible((Level = 0) and (TreeNode.Index = 7));
    FileTypesVisible((Level = 0) and (TreeNode.Index = 8));
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
  if Assigned(FOptionsEditorOptionsFrame) then
    FOptionsEditorOptionsFrame.PutData(FOptionsContainer);
  if Assigned(FOptionsEditorFontFrame) then
    FOptionsEditorFontFrame.PutData(FOptionsContainer);
  if Assigned(FOptionsEditorLeftMarginFrame) then
    FOptionsEditorLeftMarginFrame.PutData(FOptionsContainer);
  if Assigned(FOptionsEditorRightMarginFrame) then
    FOptionsEditorRightMarginFrame.PutData(FOptionsContainer);
  if Assigned(FOptionsEditorSearchFrame) then
    FOptionsEditorSearchFrame.PutData(FOptionsContainer);
  if Assigned(FOptionsEditorTabsFrame) then
    FOptionsEditorTabsFrame.PutData(FOptionsContainer);
  if Assigned(FOptionsEditorCompletionProposalFrame) then
    FOptionsEditorCompletionProposalFrame.PutData(FOptionsContainer);
  if Assigned(FOptionsDirectoryFrame) then
    FOptionsDirectoryFrame.PutData(FOptionsContainer);
  if Assigned(FOptionsDirectoryTabsFrame) then
    FOptionsDirectoryTabsFrame.PutData(FOptionsContainer);
  if Assigned(FOptionsOutputFrame) then
    FOptionsOutputFrame.PutData(FOptionsContainer);
  if Assigned(FOptionsOutputTabsFrame) then
    FOptionsOutputTabsFrame.PutData(FOptionsContainer);
  if Assigned(FOptionsCompareFrame) then
    FOptionsCompareFrame.PutData(FOptionsContainer);
  if Assigned(FOptionsEditorErrorCheckingFrame) then
    FOptionsEditorErrorCheckingFrame.PutData(FOptionsContainer);
  if Assigned(FOptionsEditorOtherFrame) then
    FOptionsEditorOtherFrame.PutData(FOptionsContainer);
  if Assigned(FOptionsPrintFrame) then
    FOptionsPrintFrame.PutData(FOptionsContainer);
  if Assigned(FOptionsMainMenuFrame) then
    FOptionsMainMenuFrame.PutData(FOptionsContainer);
  if Assigned(FOptionsToolBarFrame) then
    FOptionsToolBarFrame.PutData(FOptionsContainer);
  if Assigned(FOptionsStatusBarFrame) then
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
