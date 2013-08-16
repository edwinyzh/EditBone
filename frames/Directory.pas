unit Directory;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.ComCtrls, BCControls.FileControl, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ImgList, Vcl.ToolWin, Vcl.ActnList, Vcl.Buttons, JvExControls, JvLabel, Vcl.Menus,
  JvSpeedButton, JvExComCtrls, JvComCtrls, BCControls.PopupMenu, BCControls.PageControl, Vcl.ActnPopup, Vcl.Themes,
  Vcl.PlatformDefaultStyleActnCtrls, BCControls.ImageList, VirtualTrees, DirectoryTabSheet, System.Actions;

type
  TDirectoryFrame = class(TFrame)
    CloseDirectoryMenuItem: TMenuItem;
    DeleteMenuItem: TMenuItem;
    DirectoryActionList: TActionList;
    DirectoryCloseAction: TAction;
    DirectoryDeleteAction: TAction;
    DirectoryEditAction: TAction;
    DirectoryOpenAction: TAction;
    DirectoryPropertiesAction: TAction;
    DirectoryRefreshAction: TAction;
    DirectoryRenameAction: TAction;
    EditDirectoryMenuItem: TMenuItem;
    ImagesList: TBCImageList;
    OpenDirectoryMenuItem: TMenuItem;
    PageControl: TBCPageControl;
    PopupMenu: TBCPopupMenu;
    PropertiesMenuItem: TMenuItem;
    RefreshMenuItem: TMenuItem;
    RenameMenuItem: TMenuItem;
    Separator1MenuItem: TMenuItem;
    Separator2MenuItem: TMenuItem;
    Separator3MenuItem: TMenuItem;
    procedure DirectoryCloseActionExecute(Sender: TObject);
    procedure DirectoryDeleteActionExecute(Sender: TObject);
    procedure DirectoryEditActionExecute(Sender: TObject);
    procedure DirectoryOpenActionExecute(Sender: TObject);
    procedure DirectoryPropertiesActionExecute(Sender: TObject);
    procedure DirectoryRefreshActionExecute(Sender: TObject);
    procedure DirectoryRenameActionExecute(Sender: TObject);
    procedure DriveComboChange(Sender: TObject);
    procedure TabsheetDblClick(Sender: TObject);
    procedure PageControlCloseButtonClick(Sender: TObject);
    procedure PageControlDblClick(Sender: TObject);
    procedure PageControlMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    FTabsheetDblClick: TNotifyEvent;
    function GetActiveDriveComboBox: TBCDriveComboBox;
    function GetDrivesPanelOrientation(TabSheet: TTabSheet = nil): Byte;
    function GetFileTypePanelOrientation(TabSheet: TTabSheet = nil): Byte;
    function GetDirTabSheetFrame(TabSheet: TTabSheet): TDirTabSheetFrame;
    function GetActiveExcludeOtherBranches: Boolean;
    function GetFileTreeView(TabSheet: TTabSheet = nil): TBCFileTreeView;
    function GetFileType(TabSheet: TTabSheet): string;
    function GetIsAnyDirectory: Boolean;
    function GetRootDirectory: string;
    function GetSelectedPath: string;
    function ReadIniFile: Boolean;
    procedure SetDrivesPanelOrientation(ShowDrives: Byte; TabSheetFrame: TDirTabSheetFrame = nil);
    procedure SetFileTypePanelOrientation(ShowFileType: Byte; FileType: string = ''; TabSheetFrame: TDirTabSheetFrame = nil);
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    function SelectedFile: string;
    procedure CloseDirectory;
    procedure EditDirectory;
    procedure OpenDirectory(TabName: string; RootDirectory: string; LastPath: string; ShowDrives: Byte;
      ExcludeOtherBranches: Boolean; ShowFileType: Byte; FileType: string); overload;
    procedure OpenDirectory; overload;
    procedure OpenPath(RootDirectory: string; LastPath: string; ExcludeOtherBranches: Boolean);
    procedure UpdateControls;
    procedure SetOptions;
    procedure WriteIniFile;
    property ExcludeOtherBranches: Boolean read GetActiveExcludeOtherBranches;
    property IsAnyDirectory: Boolean read GetIsAnyDirectory;
    property OnTabsheetDblClick: TNotifyEvent read FTabsheetDblClick write FTabsheetDblClick;
    property RootDirectory: string read GetRootDirectory;
    property SelectedPath: string read GetSelectedPath;
  end;

implementation

{$R *.dfm}

uses
  System.Types, DirectoryTab, Winapi.ShellAPI, BCCommon.StyleUtils, BigIni, BCCommon.LanguageStrings, Options,
  System.Math, BCCommon.FileUtils, BCCommon.Messages, BCCommon.Dialogs, BCCommon.StringUtils;

constructor TDirectoryFrame.Create(AOwner: TComponent);
begin
  inherited;
  ReadIniFile;
end;

function TDirectoryFrame.ReadIniFile: Boolean;
var
  i: Integer;
  s: string;
  LastPaths: TStrings;
  TabName, Root, LastPath, FileType: string;
  ShowDrives, ShowFileType: Byte; { 0=Hide, 1=Bottom, 2=Top }
  ExcludeOtherBranches: Boolean;
begin
  LastPaths := TStringList.Create;
  with TBigIniFile.Create(GetINIFilename) do
  try
    { Options }
    ReadSectionValues('LastPaths', LastPaths);
    for i := 0 to LastPaths.Count - 1 do
    begin
      s := RemoveTokenFromStart('=', LastPaths.Strings[i]);
      TabName := GetNextToken(';', s);
      s := RemoveTokenFromStart(';', s);
      Root := GetNextToken(';', s);
      s := RemoveTokenFromStart(';', s);
      LastPath := GetNextToken(';', s);
      s := RemoveTokenFromStart(';', s);
      ShowDrives := Abs(StrToInt(GetNextToken(';', s)));
      s := RemoveTokenFromStart(';', s);
      ExcludeOtherBranches := StrToBool(GetNextToken(';', s));
      s := RemoveTokenFromStart(';', s);
      if s = '' then { Version < 6.7.0 }
        s := '0;*.*';
      ShowFileType := StrToInt(GetNextToken(';', s));
      FileType := RemoveTokenFromStart(';', s);
      if DirectoryExists(LastPath) then
        OpenDirectory(TabName, Root, LastPath, ShowDrives, ExcludeOtherBranches, ShowFileType, FileType);
    end;
    i := ReadInteger('Options', 'ActiveDirectoryIndex', 0);
    if i < PageControl.PageCount then
      PageControl.ActivePageIndex := i;
    Result := LastPaths.Count > 0;
  finally
    LastPaths.Free;
    Free;
  end;
end;

function TDirectoryFrame.GetDirTabSheetFrame(TabSheet: TTabSheet): TDirTabSheetFrame;
begin
  Result := nil;
  if Assigned(TabSheet) then
    if TabSheet.ComponentCount <> 0 then
      if TabSheet.Components[0] is TDirTabSheetFrame then
        Result := TDirTabSheetFrame(TabSheet.Components[0]);
end;

function TDirectoryFrame.GetDrivesPanelOrientation(TabSheet: TTabSheet): Byte;
var
  DirTabSheetFrame: TDirTabSheetFrame;
begin
  Result := 0;
  if not Assigned(TabSheet) then
    TabSheet := PageControl.ActivePage;
  DirTabSheetFrame := GetDirTabSheetFrame(TabSheet);
  if Assigned(DirTabSheetFrame) then
    if DirTabSheetFrame.DriveComboBox.Visible then
    begin
      if DirTabSheetFrame.DriveComboBox.Align = alBottom then
        Result := 1
      else
        Result := 2;
    end;
end;

function TDirectoryFrame.GetFileType(TabSheet: TTabSheet): string;
var
  DirTabSheetFrame: TDirTabSheetFrame;
begin
  Result := '';
  DirTabSheetFrame := GetDirTabSheetFrame(TabSheet);
  if Assigned(DirTabSheetFrame) then
    Result := DirTabSheetFrame.FileTypeComboBox.Text;
end;

procedure TDirectoryFrame.SetDrivesPanelOrientation(ShowDrives: Byte; TabSheetFrame: TDirTabSheetFrame);
var
  DirTabSheetFrame: TDirTabSheetFrame;
begin
  if not Assigned(TabSheetFrame) then
    DirTabSheetFrame := GetDirTabSheetFrame(PageControl.ActivePage)
  else
    DirTabSheetFrame := TabSheetFrame;
  if Assigned(DirTabSheetFrame) then
  begin
    DirTabSheetFrame.DriveComboBox.Visible := ShowDrives <> 0;
    if ShowDrives = 1 then
    with DirTabSheetFrame.DriveComboBox do
    begin
      Margins.Top := 3;
      Margins.Bottom := 0;
      Align := alBottom
    end
    else
    if ShowDrives = 2 then
    with DirTabSheetFrame.DriveComboBox do
    begin
      Margins.Top := 0;
      Margins.Bottom := 3;
      Align := alTop
    end;
  end;
end;

procedure TDirectoryFrame.SetFileTypePanelOrientation(ShowFileType: Byte; FileType: string; TabSheetFrame: TDirTabSheetFrame);
var
  DirTabSheetFrame: TDirTabSheetFrame;
begin
  if not Assigned(TabSheetFrame) then
    DirTabSheetFrame := GetDirTabSheetFrame(PageControl.ActivePage)
  else
    DirTabSheetFrame := TabSheetFrame;
  if Assigned(DirTabSheetFrame) then
  begin
    DirTabSheetFrame.FileTypeComboBox.Visible := ShowFileType <> 0;
    if FileType <> '' then
      DirTabSheetFrame.FileTypeComboBox.Text := FileType;
    if ShowFileType = 1 then
    with DirTabSheetFrame.FileTypeComboBox do
    begin
      Margins.Top := 3;
      Margins.Bottom := 0;
      Align := alBottom
    end
    else
    if ShowFileType = 2 then
    with DirTabSheetFrame.FileTypeComboBox do
    begin
      Margins.Top := 0;
      Margins.Bottom := 3;
      Align := alTop
    end;
  end;
end;

function TDirectoryFrame.GetFileTypePanelOrientation(TabSheet: TTabSheet = nil): Byte;
var
  DirTabSheetFrame: TDirTabSheetFrame;
begin
  Result := 0;
  if not Assigned(TabSheet) then
    TabSheet := PageControl.ActivePage;
  DirTabSheetFrame := GetDirTabSheetFrame(TabSheet);
  if Assigned(DirTabSheetFrame) then
    if DirTabSheetFrame.FileTypeComboBox.Visible then
    begin
      if DirTabSheetFrame.FileTypeComboBox.Align = alBottom then
        Result := 1
      else
        Result := 2;
    end;
end;

function TDirectoryFrame.GetActiveExcludeOtherBranches: Boolean;
var
  FileTreeView: TBCFileTreeView;
begin
  Result := False;
  FileTreeView := GetFileTreeView;
  if Assigned(FileTreeView) then
    Result := FileTreeView.ExcludeOtherBranches;
end;

procedure TDirectoryFrame.WriteIniFile;
var
  i: Integer;
  DirTabSheetFrame: TDirTabSheetFrame;
  FileTreeView: TBCFileTreeView;
begin
  with TBigIniFile.Create(GetINIFilename) do
  try
    WriteInteger('Options', 'ActiveDirectoryIndex', PageControl.ActivePageIndex);
    { Options }
    EraseSection('LastPaths');
    { Open directories }
    for i := 0 to PageControl.PageCount - 1 do
    begin
      DirTabSheetFrame := GetDirTabSheetFrame(PageControl.Pages[i]);
      FileTreeView := DirTabSheetFrame.FileTreeView;
      WriteString('LastPaths', IntToStr(i), Format('%s;%s;%s;%d;%s;%d;%s', [PageControl.Pages[i].Caption,
        FileTreeView.RootDirectory, FileTreeView.SelectedPath, GetDrivesPanelOrientation(PageControl.Pages[i]),
        BoolToStr(FileTreeView.ExcludeOtherBranches), GetFileTypePanelOrientation(PageControl.Pages[i]),
        GetFileType(PageControl.Pages[i])]));
    end;
  finally
    Free;
  end;
end;

function TDirectoryFrame.GetFileTreeView(TabSheet: TTabSheet): TBCFileTreeView;
var
  DirTabSheetFrame: TDirTabSheetFrame;
begin
  Result := nil;
  if not Assigned(TabSheet) then
    TabSheet := PageControl.ActivePage;
  DirTabSheetFrame := GetDirTabSheetFrame(TabSheet);
  if Assigned(DirTabSheetFrame) then
    Result := DirTabSheetFrame.FileTreeView;
end;

procedure TDirectoryFrame.TabsheetDblClick(Sender: TObject);
begin
  if Assigned(FTabsheetDblClick) then
    FTabsheetDblClick(Sender);
end;

function TDirectoryFrame.GetActiveDriveComboBox: TBCDriveComboBox;
var
  DirTabSheetFrame: TDirTabSheetFrame;
begin
  Result := nil;
  DirTabSheetFrame := GetDirTabSheetFrame(PageControl.ActivePage);
  if Assigned(DirTabSheetFrame) then
    Result := DirTabSheetFrame.DriveComboBox;
end;

procedure TDirectoryFrame.CloseDirectory;
var
  ActivePageIndex: Integer;
begin
  if not AskYesOrNo(Format(LanguageDataModule.GetYesOrNo('CloseDirectory'), [PageControl.ActivePageCaption])) then
    Exit;
  if PageControl.PageCount > 0 then
  begin
    ActivePageIndex := PageControl.ActivePageIndex;
    PageControl.ActivePage.Free;
    if PageControl.PageCount > 0 then
      PageControl.ActivePageIndex := Max(ActivePageIndex - 1, 0);
  end;
  { for some reason Destroy method will lose the Images property even there are still pages... }
  if PageControl.PageCount > 0 then
    PageControl.Images := GetActiveDriveComboBox.SystemIconsImageList;
end;

function TDirectoryFrame.SelectedFile: string;
var
  FileTreeView: TBCFileTreeView;
begin
  Result := '';
  FileTreeView := GetFileTreeView;
  if Assigned(FileTreeView) then
    Result := FileTreeView.SelectedFile;
end;

function TDirectoryFrame.GetSelectedPath: string;
var
  FileTreeView: TBCFileTreeView;
begin
  Result := '';
  FileTreeView := GetFileTreeView;
  if Assigned(FileTreeView) then
    Result := FileTreeView.SelectedPath;
end;

procedure TDirectoryFrame.DirectoryCloseActionExecute(Sender: TObject);
begin
  CloseDirectory;
end;

procedure TDirectoryFrame.DirectoryDeleteActionExecute(Sender: TObject);
var
  FileTreeView: TBCFileTreeView;
begin
  FileTreeView := GetFileTreeView;
  if Assigned(FileTreeView) then
    FileTreeView.DeleteSelectedNode;
end;

procedure TDirectoryFrame.EditDirectory;
var
  FileTreeView: TBCFileTreeView;
begin
  FileTreeView := GetFileTreeView;
  if Assigned(FileTreeView) then
  with DirectoryTabDialog do
  begin
    TabName := PageControl.ActivePageCaption;
    RootDirectory := FileTreeView.RootDirectory;
    ShowDrives := GetDrivesPanelOrientation;
    ExcludeOtherBranches := FileTreeView.ExcludeOtherBranches;
    ShowFileType := GetFileTypePanelOrientation;
    if Open(dtEdit) then
    begin
      PageControl.ActivePageCaption := TabName;
      SetDrivesPanelOrientation(ShowDrives);
      SetFileTypePanelOrientation(ShowFileType);
      FileTreeView.OpenPath(RootDirectory, SelectedPath, ExcludeOtherBranches);
    end;
  end;
end;

procedure TDirectoryFrame.DirectoryEditActionExecute(Sender: TObject);
begin
  EditDirectory;
end;

procedure TDirectoryFrame.OpenDirectory;
begin
  with DirectoryTabDialog do
  begin
    TabName := 'C:\';
    RootDirectory := TabName;
    ShowDrives := 1;
    ExcludeOtherBranches := False;
    ShowFileType := 0;
    if Open(dtOpen) then
      OpenDirectory(TabName, RootDirectory, RootDirectory, ShowDrives, ExcludeOtherBranches, ShowFileType, '*.*');
  end;
end;

procedure TDirectoryFrame.DirectoryOpenActionExecute(Sender: TObject);
begin
  OpenDirectory;
end;

procedure TDirectoryFrame.DirectoryPropertiesActionExecute(Sender: TObject);
var
  FileTreeView: TBCFileTreeView;
begin
  FileTreeView := GetFileTreeView;
  if Assigned(FileTreeView) then
    if FileTreeView.SelectedCount > 0 then
      PropertiesDialog(FileTreeView.SelectedFile);
end;

function TDirectoryFrame.GetRootDirectory: string;
var
  FileTreeView: TBCFileTreeView;
begin
  Result := '';
  FileTreeView := GetFileTreeView;
  if Assigned(FileTreeView) then
    Result := FileTreeView.RootDirectory;
end;

procedure TDirectoryFrame.DirectoryRefreshActionExecute(Sender: TObject);
var
  FileTreeView: TBCFileTreeView;
begin
  FileTreeView := GetFileTreeView;
  if Assigned(FileTreeView) then
    FileTreeView.OpenPath(RootDirectory, SelectedPath, ExcludeOtherBranches);
end;

procedure TDirectoryFrame.DirectoryRenameActionExecute(Sender: TObject);
var
  FileTreeView: TBCFileTreeView;
begin
  FileTreeView := GetFileTreeView;
  if Assigned(FileTreeView) then
    FileTreeView.RenameSelectedNode;
end;

procedure TDirectoryFrame.OpenPath(RootDirectory: string; LastPath: string; ExcludeOtherBranches: Boolean);
var
  FileTreeView: TBCFileTreeView;
begin
  GetActiveDriveComboBox.Drive := ExtractFileDir(RootDirectory)[1];
  FileTreeView := GetFileTreeView;
  if Assigned(FileTreeView) then
    FileTreeView.OpenPath(RootDirectory, LastPath, ExcludeOtherBranches);
end;

procedure TDirectoryFrame.PageControlCloseButtonClick(Sender: TObject);
begin
  DirectoryCloseAction.Execute;
end;

procedure TDirectoryFrame.PageControlDblClick(Sender: TObject);
begin
  if OptionsContainer.DirCloseTabByDblClick then
    DirectoryCloseAction.Execute;
end;

procedure TDirectoryFrame.PageControlMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  if (Button = mbMiddle) and OptionsContainer.DirCloseTabByMiddleClick then
    DirectoryCloseAction.Execute;
end;

procedure TDirectoryFrame.DriveComboChange(Sender: TObject);
var
  DriveComboBox: TBCDriveComboBox;
begin
  DriveComboBox := GetActiveDriveComboBox;
  if Assigned(DriveComboBox) then
  begin
    PageControl.ActivePage.ImageIndex := DriveComboBox.IconIndex;
    if (Length(PageControl.ActivePageCaption) = 3) and
      (Pos(':\', PageControl.ActivePageCaption) = 2) then
      PageControl.ActivePageCaption := Format('%s:\', [DriveComboBox.Drive]);
  end;
end;

procedure TDirectoryFrame.OpenDirectory(TabName: string; RootDirectory: string; LastPath: string; ShowDrives: Byte;
  ExcludeOtherBranches: Boolean; ShowFileType: Byte; FileType: string);
var
  TabSheet: TTabSheet;
  DirTabSheetFrame: TDirTabSheetFrame;
begin
  if not DirectoryExists(RootDirectory) then
    Exit;
  if not DirectoryExists(LastPath) then
    Exit;

  TabSheet := TTabSheet.Create(PageControl);
  TabSheet.PageControl := PageControl;
  TabSheet.Visible := False;
  TabSheet.ImageIndex := -1;
  PageControl.ActivePage := TabSheet;

  DirTabSheetFrame := TDirTabSheetFrame.Create(TabSheet);
  with DirTabSheetFrame do
  begin
    Panel.Visible := False;
    Parent := TabSheet;
    with FileTreeView do
    begin
      PopupMenu := Self.PopupMenu;
      ShowHiddenFiles := False;
      ShowSystemFiles := False;
      ShowArchiveFiles := True;
      OnDblClick := TabsheetDblClick;
      DefaultNodeHeight := Images.Height + 2;
    end;
    DriveComboBox.OnChange := DriveComboChange;
    SetDrivesPanelOrientation(ShowDrives, DirTabSheetFrame);
    SetFileTypePanelOrientation(ShowFileType, FileType, DirTabSheetFrame);
    PageControl.Images := DriveComboBox.SystemIconsImageList;
    TabSheet.ImageIndex := DriveComboBox.IconIndex;
    FileTypeComboBox.Extensions := OptionsContainer.Extensions;
  end;
  PageControl.ActivePageCaption := TabName;
  SetOptions;
  OpenPath(RootDirectory, LastPath, ExcludeOtherBranches);
  DirTabSheetFrame.Panel.Visible := True;
  TabSheet.Visible := True;
end;

function TDirectoryFrame.GetIsAnyDirectory: Boolean;
begin
  Result := False;
  if Assigned(PageControl) then
    Result := PageControl.PageCount <> 0;
end;

procedure TDirectoryFrame.SetOptions;
var
  i: Integer;
  FileTreeView: TBCFileTreeView;
  DriveComboBox: TBCDriveComboBox;
begin
  PageControl.DoubleBuffered := OptionsContainer.DirDoubleBuffered;
  PageControl.MultiLine := OptionsContainer.DirMultiLine;
  PageControl.ShowCloseButton := OptionsContainer.DirShowCloseButton;
  if OptionsContainer.DirShowImage then
  begin
    DriveComboBox := GetActiveDriveComboBox;
    if Assigned(DriveComboBox) then
      PageControl.Images := DriveComboBox.SystemIconsImageList
  end
  else
    PageControl.Images := nil;
  for i := 0 to PageControl.PageCount - 1 do
  begin
    FileTreeView := TDirTabSheetFrame(PageControl.Pages[i].Components[0]).FileTreeView;
    FileTreeView.Indent := OptionsContainer.DirIndent;
    if OptionsContainer.DirShowTreeLines then
      FileTreeView.TreeOptions.PaintOptions := FileTreeView.TreeOptions.PaintOptions + [toShowTreeLines]
    else
      FileTreeView.TreeOptions.PaintOptions := FileTreeView.TreeOptions.PaintOptions - [toShowTreeLines]
  end;
end;

procedure TDirectoryFrame.UpdateControls;
var
  i, Right: Integer;
  DirTabSheetFrame: TDirTabSheetFrame;
  LStyles: TCustomStyleServices;
  PanelColor: TColor;
begin
  SetOptions;
  Application.ProcessMessages; { Important! }
  LStyles := StyleServices;
  PanelColor := clNone;
  if LStyles.Enabled then
    PanelColor := LStyles.GetStyleColor(scPanel);
  if TStyleManager.ActiveStyle.Name = STYLENAME_WINDOWS then
    Right := 3
  else
  if LStyles.Enabled and
    (GetRValue(PanelColor) + GetGValue(PanelColor) + GetBValue(PanelColor) > 500) then
    Right := 2
  else
    Right := 1;
  for i := 0 to PageControl.PageCount - 1 do
  begin
    DirTabSheetFrame := GetDirTabSheetFrame(PageControl.Pages[i]);
    if Assigned(DirTabSheetFrame) then
      DirTabSheetFrame.Panel.Padding.Right := Right
  end;
end;

end.
