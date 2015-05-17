unit EditBone.Frames.Document.TabSheet;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls,
  Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, VirtualTrees, BCEditor.Editor, Vcl.ActnList, BCControls.Splitter,
  BCControls.ProgressBar, EditBone.Frames.Document.TabSheet.XMLTree,  BCControls.Panel, Vcl.Menus,
  Vcl.PlatformDefaultStyleActnCtrls, BCEditor.Editor.Base, sSplitter, sPanel, sFrameAdapter, BCCommon.Frames.Base,
  BCCommon.Frames.Search, Vcl.AppEvnts;

type
  TDocTabSheetFrame = class(TFrame)
    Editor: TBCEditor;
    FrameAdapter: TsFrameAdapter;
    Panel: TBCPanel;
    PanelDocument: TBCPanel;
    PanelSplitEditor: TBCPanel;
    PanelXMLTree: TBCPanel;
    SplitterHorizontal: TBCSplitter;
    SplitterVertical: TBCSplitter;
    SearchFrame: TBCSearchFrame;
    ApplicationEvents: TApplicationEvents;
    procedure RefreshActionExecute(Sender: TObject);
    procedure EditorRightMarginMouseUp(Sender: TObject);
    procedure SplitEditorRightMarginMouseUp(Sender: TObject);
    procedure EditorMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure SplitEditorMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure EditorEnter(Sender: TObject);
    procedure ApplicationEventsMessage(var Msg: tagMSG; var Handled: Boolean);
  private
    FModified: Boolean;
    FImageListXMLTree: TImageList;
    FPopupMenuXMLTree: TPopupMenu;
    FProgressBar: TBCProgressBar;
    FDocumentXMLTreeFrame: TDocumentXMLTreeFrame;
    function GetSplitVisible: Boolean;
    function GetMinimapVisible: Boolean;
    function GetXMLTreeVisible: Boolean;
    function GetCaretX: Integer;
    function GetCaretY: Integer;
    procedure NormalSelectionMode(Editor: TBCEditor);
    procedure ReadIniFile;
    procedure SetSplitVisible(Value: Boolean);
    procedure SetMinimapVisible(Value: Boolean);
    procedure SetXMLTreeVisible(Value: Boolean);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function IsSearchFocused: Boolean;
    procedure LoadFromXML(XML: string);
    procedure PasteToSearch(AText: string);
    procedure SearchSelectAll;
    procedure ShowSearch;
    procedure UpdateLanguage(SelectedLanguage: string);
    property ImageListXMLTree: TImageList read FImageListXMLTree write FImageListXMLTree;
    property PopupMenuXMLTree: TPopupMenu read FPopupMenuXMLTree write FPopupMenuXMLTree;
    property SplitVisible: Boolean read GetSplitVisible write SetSplitVisible;
    property MinimapVisible: Boolean read GetMinimapVisible write SetMinimapVisible;
    property XMLTreeVisible: Boolean read GetXMLTreeVisible write SetXMLTreeVisible;
    property ProgressBar: TBCProgressBar read FProgressBar write FProgressBar;
    property CaretX: Integer read GetCaretX;
    property CaretY: Integer read GetCaretY;
  end;

implementation

{$R *.dfm}

uses
  BCCommon.Options.Container, System.Math, BCEditor.Types, BigIni, BCCommon.FileUtils, BCCommon.Language.Utils;

procedure TDocTabSheetFrame.ApplicationEventsMessage(var Msg: tagMSG; var Handled: Boolean);
begin
  SearchFrame.Visible := Editor.Search.Enabled;
end;

constructor TDocTabSheetFrame.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  SearchFrame.Editor := Editor;
  FModified := False;
end;

destructor TDocTabSheetFrame.Destroy;
begin
  if Assigned(FDocumentXMLTreeFrame) then
    FDocumentXMLTreeFrame.Free;
  inherited;
end;

procedure TDocTabSheetFrame.UpdateLanguage(SelectedLanguage: string);
begin
  BCCommon.Language.Utils.UpdateLanguage(TForm(Self), SelectedLanguage);
end;

procedure TDocTabSheetFrame.NormalSelectionMode(Editor: TBCEditor);
begin
  if OptionsContainer.EnableSelectionMode and (soALTSetsColumnMode in Editor.Selection.Options) then
  begin
    OptionsContainer.EnableSelectionMode := False;
    Editor.Selection.Options := Editor.Selection.Options - [soALTSetsColumnMode];
    Editor.Selection.Mode := smNormal;
  end;
end;

procedure TDocTabSheetFrame.ReadIniFile;

  procedure SetOption(Enabled: Boolean; Option: TBCEditorSearchOption);
  begin
    if Enabled then
      Editor.Search.Options := Editor.Search.Options + [Option]
    else
      Editor.Search.Options := Editor.Search.Options - [Option];
  end;

begin
  with TBigIniFile.Create(GetIniFilename) do
  try
    SetOption(ReadBool('Options', 'SearchBeepIfSearchStringNotFound', True), soBeepIfStringNotFound);
    SetOption(ReadBool('Options', 'SearchCaseSensitive', False), soCaseSensitive);
    SetOption(ReadBool('Options', 'SearchEntireScope', False), soEntireScope);
    SetOption(ReadBool('Options', 'SearchHighlightResult', True), soHighlightResults);
    if ReadBool('Options', 'SearchRegularExpression', False) then
      Editor.Search.Engine := seRegularExpression
    else
    if ReadBool('Options', 'SearchWildCard', False) then
      Editor.Search.Engine := seWildCard
    else
      Editor.Search.Engine := seNormal;
    SetOption(ReadBool('Options', 'SearchOnTyping', True), soSearchOnTyping);
    SetOption(ReadBool('Options', 'SearchSelectedOnly', False), soSelectedOnly);
    SetOption(ReadBool('Options', 'SearchShowSearchStringNotFound', False), soShowStringNotFound);
    SetOption(ReadBool('Options', 'SearchWholeWordsOnly', False), soWholeWordsOnly);
  finally
    Free;
  end;
end;

procedure TDocTabSheetFrame.ShowSearch;
var
  LOldCaretPosition: TBCEditorTextPosition;
  LOldSelectionBeginPosition, LOldSelectionEndPosition: TBCEditorTextPosition;
  LSelectedText: string;
  LSelectionAvailable: Boolean;
begin
  LOldCaretPosition := Editor.CaretPosition;
  LSelectionAvailable := Editor.SelectionAvailable;
  if LSelectionAvailable then
  begin
    LOldSelectionBeginPosition := Editor.SelectionBeginPosition;
    LOldSelectionEndPosition := Editor.SelectionEndPosition;
  end;
  ReadIniFile;
  Editor.Search.Enabled := True;
  Editor.CaretPosition := LOldCaretPosition;
  if LSelectionAvailable then
  begin
    Editor.SelectionBeginPosition := LOldSelectionBeginPosition;
    Editor.SelectionEndPosition := LOldSelectionEndPosition;
  end;
  Application.ProcessMessages;
  LSelectedText := Editor.SelectedText;
  if LSelectedText <> '' then
  begin
    Editor.Search.SearchText := LSelectedText;
    SearchFrame.ComboBoxSearchText.Text := Editor.Search.SearchText;
  end;
  if SearchFrame.ComboBoxSearchText.CanFocus then
    SearchFrame.ComboBoxSearchText.SetFocus;
end;

procedure TDocTabSheetFrame.PasteToSearch(AText: string);
begin
  if Editor.Search.Enabled then
  begin
    Editor.Search.SearchText := AText;
    SearchFrame.ComboBoxSearchText.Text := Editor.Search.SearchText;
  end;
end;

function TDocTabSheetFrame.IsSearchFocused: Boolean;
begin
  Result := SearchFrame.ComboBoxSearchText.Focused;
end;

procedure TDocTabSheetFrame.SearchSelectAll;
begin
  SearchFrame.ComboBoxSearchText.SelectAll;
end;

procedure TDocTabSheetFrame.EditorEnter(Sender: TObject);
begin
  SearchFrame.Editor := Editor;
end;

procedure TDocTabSheetFrame.EditorMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  NormalSelectionMode(Editor);
end;

procedure TDocTabSheetFrame.EditorRightMarginMouseUp(Sender: TObject);
begin
  OptionsContainer.RightMarginPosition := Editor.RightMargin.Position;
  // TODO: SplitEditor.RightMargin.Position := Editor.RightMargin.Position;
end;

function TDocTabSheetFrame.GetXMLTreeVisible: Boolean;
begin
  Result := PanelXMLTree.Visible;
  Application.ProcessMessages;
end;

procedure TDocTabSheetFrame.SetXMLTreeVisible(Value: Boolean);
begin
  SplitterVertical.Visible := Value;
  if not Assigned(FDocumentXMLTreeFrame) then
  begin
    FDocumentXMLTreeFrame := TDocumentXMLTreeFrame.Create(PanelXMLTree);
    FDocumentXMLTreeFrame.ProgressBar := ProgressBar;
    FDocumentXMLTreeFrame.Editor := Editor;
    FDocumentXMLTreeFrame.VirtualDrawTree.Images := ImageListXMLTree;
    FDocumentXMLTreeFrame.VirtualDrawTree.PopupMenu := FPopupMenuXMLTree;
    FDocumentXMLTreeFrame.Parent := PanelXMLTree;
  end;
  PanelXMLTree.Visible := Value;
end;

procedure TDocTabSheetFrame.SplitEditorMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  // TODO: NormalSelectionMode(SplitEditor);
end;

procedure TDocTabSheetFrame.SplitEditorRightMarginMouseUp(Sender: TObject);
begin
  // TODO: OptionsContainer.MarginRightMargin := SplitEditor.RightMargin.Position;
  //Editor.RightMargin.Position := SplitEditor.RightMargin.Position;
end;

procedure TDocTabSheetFrame.RefreshActionExecute(Sender: TObject);
begin
  LoadFromXML(Editor.Text);
end;

procedure TDocTabSheetFrame.LoadFromXML(XML: string);
begin
  if Assigned(FDocumentXMLTreeFrame) then
    FDocumentXMLTreeFrame.LoadFromXML(XML);
end;

function TDocTabSheetFrame.GetSplitVisible: Boolean;
begin
  Result := PanelSplitEditor.Visible;
end;

procedure TDocTabSheetFrame.SetSplitVisible(Value: Boolean);
begin
  PanelSplitEditor.Visible := Value;
  SplitterHorizontal.Visible := Value;
end;

function TDocTabSheetFrame.GetMinimapVisible: Boolean;
begin
  Result := Editor.MiniMap.Visible;
end;

procedure TDocTabSheetFrame.SetMinimapVisible(Value: Boolean);
begin
  Editor.Minimap.Visible := Value;
  //TODO: SplitEditor.Minimap.Visible := Value;
end;

function TDocTabSheetFrame.GetCaretY: Integer;
begin
  Result := Editor.CaretY;
end;

function TDocTabSheetFrame.GetCaretX: Integer;
begin
  Result := Editor.CaretX;
end;

end.
