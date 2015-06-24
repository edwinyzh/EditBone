unit EditBone.Frames.Directory;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Winapi.Windows, System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.ComCtrls,
  BCControls.FileControl, Vcl.ImgList, Vcl.ActnList, Vcl.Buttons, Vcl.Menus, BCControls.PageControl, VirtualTrees,
  EditBone.Frames.Directory.TabSheet, System.Actions, BCCommon.Forms.SearchForFiles, BCCommon.Images, sPageControl,
  sFrameAdapter, Vcl.PlatformDefaultStyleActnCtrls, System.ImageList, acAlphaImageList, BCControls.ImageList;

type
  TDirectoryFrame = class(TFrame)
    MenuItemCloseDirectory: TMenuItem;
    MenuItemDelete: TMenuItem;
    ActionList: TActionList;
    ActionDirectoryClose: TAction;
    ActionDirectoryDelete: TAction;
    ActionDirectoryEdit: TAction;
    ActionDirectoryOpen: TAction;
    ActionDirectoryProperties: TAction;
    ActionDirectoryRefresh: TAction;
    ActionDirectoryRename: TAction;
    MenuItemEditDirectory: TMenuItem;
    MenuItemOpenDirectory: TMenuItem;
    PageControl: TBCPageControl;
    PopupMenu: TPopupMenu;
    MenuItemProperties: TMenuItem;
    MenuItemRefresh: TMenuItem;
    MenuItemRename: TMenuItem;
    MenuItemSeparator3: TMenuItem;
    MenuItemSeparator2: TMenuItem;
    MenuItemSeparator4: TMenuItem;
    ActionDirectoryFiles: TAction;
    MenuItemFiles: TMenuItem;
    ActionDirectoryFindInFiles: TAction;
    MenuItemFindinFiles: TMenuItem;
    ActionDirectoryContextMenu: TAction;
    MenuItemContextMenu: TMenuItem;
    FrameAdapter: TsFrameAdapter;
    MenuItemSeparator1: TMenuItem;
    TabSheetOpen: TsTabSheet;
    ImageList16: TBCImageList;
    ImageList20: TBCImageList;
    ImageList24: TBCImageList;
    procedure ActionDirectoryCloseExecute(Sender: TObject);
    procedure ActionDirectoryDeleteExecute(Sender: TObject);
    procedure ActionDirectoryEditExecute(Sender: TObject);
    procedure ActionDirectoryOpenExecute(Sender: TObject);
    procedure ActionDirectoryPropertiesExecute(Sender: TObject);
    procedure ActionDirectoryRefreshExecute(Sender: TObject);
    procedure ActionDirectoryRenameExecute(Sender: TObject);
    procedure DriveComboChange(Sender: TObject);
    procedure FileTreeViewClick(Sender: TObject);
    procedure FileTreeViewDblClick(Sender: TObject);
    procedure PageControlCloseButtonClick(Sender: TComponent; TabIndex: Integer; var CanClose: Boolean;
      var Action: TacCloseAction);
    procedure PageControlDblClick(Sender: TObject);
    procedure PageControlMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure PopupMenuPopup(Sender: TObject);
    procedure ActionDirectoryFilesExecute(Sender: TObject);
    procedure ActionDirectoryContextMenuExecute(Sender: TObject);
    procedure TabSheetOpenClickBtn(Sender: TObject);
  private
    FFileTreeViewDblClick: TNotifyEvent;
    FFileTreeViewClick: TNotifyEvent;
    FImages: TImageList;
    FOnSearchForFilesOpenFile: TOpenFileEvent;
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
    procedure CreateImageList;
    procedure SetDrivesPanelOrientation(ShowDrives: Byte; TabSheetFrame: TDirTabSheetFrame = nil);
    procedure SetFileTypePanelOrientation(ShowFileType: Byte; FileType: string = ''; TabSheetFrame: TDirTabSheetFrame = nil);
    procedure SetActionSearchForFiles(Action: TAction);
  public
    constructor Create(AOwner: TComponent); override;
    function CloseDirectory(AFreePage: Boolean = True; ATabIndex: Integer = -1): Boolean;
    function SelectedFile: string;
    procedure EditDirectory;
    procedure OpenDirectory(TabName: string; RootDirectory: string; LastPath: string; ShowDrives: Byte;
      ExcludeOtherBranches: Boolean; ShowFileType: Byte; FileType: string); overload;
    procedure OpenDirectory; overload;
    procedure OpenPath(RootDirectory: string; LastPath: string; ExcludeOtherBranches: Boolean = False);
    procedure SetOptions;
    procedure WriteIniFile;
    property ExcludeOtherBranches: Boolean read GetActiveExcludeOtherBranches;
    property IsAnyDirectory: Boolean read GetIsAnyDirectory;
    property OnFileTreeViewClick: TNotifyEvent read FFileTreeViewClick write FFileTreeViewClick;
    property OnFileTreeViewDblClick: TNotifyEvent read FFileTreeViewDblClick write FFileTreeViewDblClick;
    property OnSearchForFilesOpenFile: TOpenFileEvent read FOnSearchForFilesOpenFile write FOnSearchForFilesOpenFile;
    property RootDirectory: string read GetRootDirectory;
    property SelectedPath: string read GetSelectedPath;
    property ActionSearchForFiles: TAction write SetActionSearchForFiles;
  end;

implementation

{$R *.dfm}

uses
  EditBone.Dialogs.DirectoryTab, BigIni, BCCommon.Language.Strings, BCCommon.Options.Container, BCControls.Utils,
  System.Math, BCCommon.FileUtils, BCCommon.Messages, BCCommon.StringUtils, BCCommon.Dialogs.Base,
  Winapi.ShellAPI, Winapi.CommCtrl;

procedure TDirectoryFrame.ActionDirectoryContextMenuExecute(Sender: TObject);
var
  s: string;
begin
  s := SelectedFile;
  if s = '' then
    s := SelectedPath;
  DisplayContextMenu(Handle, s, ScreenToClient(Mouse.CursorPos));
end;

procedure TDirectoryFrame.CreateImageList;
var
  SysImageList: THandle;
  Icon: TIcon;
begin
  if not Assigned(FImages) then
    FImages := TImageList.Create(Self);
  SysImageList := GetSysImageList;
  if SysImageList <> 0 then
  begin
    FImages.Handle := SysImageList;
    FImages.BkColor := clNone;
    FImages.ShareImages := True;
  end;
  { open image index }
  Icon := TIcon.Create;
  try
    { Windows font size causing a problem: Icon size will be smaller than PageControl.Images size }
    case FImages.Height of
      16:
        { smaller }
        if Assigned(TabSheetOpen) then
        begin
          ImageList16.GetIcon(0, Icon);
          TabSheetOpen.ImageIndex := ImageList_AddIcon(FImages.Handle, Icon.Handle);
        end;
      20:
        { medium }
        if Assigned(TabSheetOpen) then
        begin
          ImageList20.GetIcon(0, Icon);
          TabSheetOpen.ImageIndex := ImageList_AddIcon(FImages.Handle, Icon.Handle);
        end;
      24:
        { larger }
        if Assigned(TabSheetOpen) then
        begin
          ImageList24.GetIcon(0, Icon);
          TabSheetOpen.ImageIndex := ImageList_AddIcon(FImages.Handle, Icon.Handle);
        end;
    end;
  finally
    Icon.Free;
  end;
end;

constructor TDirectoryFrame.Create(AOwner: TComponent);
begin
  inherited;
  ReadIniFile;
  CreateImageList;
  { IDE can lose there properties }
  ActionList.Images := ImagesDataModule.ImageListSmall;
  PopupMenu.Images := ImagesDataModule.ImageListSmall;
end;

procedure TDirectoryFrame.SetActionSearchForFiles(Action: TAction);
begin
  ActionDirectoryFindInFiles.Caption := Action.Caption;
  ActionDirectoryFindInFiles.Hint := Action.Hint;
  ActionDirectoryFindInFiles.OnExecute := Action.OnExecute;
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
  with TBigIniFile.Create(GetIniFilename) do
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
      Margins.Top := 4;
      Margins.Bottom := 0;
      Align := alBottom
    end
    else
    if ShowDrives = 2 then
    with DirTabSheetFrame.DriveComboBox do
    begin
      Margins.Top := 0;
      Margins.Bottom := 4;
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
      Margins.Top := 4;
      Margins.Bottom := 0;
      Align := alBottom
    end
    else
    if ShowFileType = 2 then
    with DirTabSheetFrame.FileTypeComboBox do
    begin
      Margins.Top := 0;
      Margins.Bottom := 4;
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
  with TBigIniFile.Create(GetIniFilename) do
  try
    WriteInteger('Options', 'ActiveDirectoryIndex', PageControl.ActivePageIndex);
    { Options }
    EraseSection('LastPaths');
    { Open directories }
    if OptionsContainer.DirSaveTabs then
    for i := 0 to PageControl.PageCount - 2 do
    begin
      DirTabSheetFrame := GetDirTabSheetFrame(PageControl.Pages[i]);
      FileTreeView := DirTabSheetFrame.FileTreeView;
      WriteString('LastPaths', IntToStr(i), Format('%s;%s;%s;%d;%s;%d;%s', [Trim(PageControl.Pages[i].Caption),
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

procedure TDirectoryFrame.FileTreeViewClick(Sender: TObject);
begin
  if Assigned(FFileTreeViewClick) then
    FFileTreeViewClick(Sender);
end;

procedure TDirectoryFrame.FileTreeViewDblClick(Sender: TObject);
begin
  if Assigned(FFileTreeViewDblClick) then
    FFileTreeViewDblClick(Sender);
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

function TDirectoryFrame.CloseDirectory(AFreePage: Boolean = True; ATabIndex: Integer = -1): Boolean;
var
  LActivePageIndex: Integer;
  LTabSheet: TTabSheet;
begin
  Result := True;
  if ATabIndex <> -1 then
    LTabSheet := PageControl.Pages[ATabIndex]
  else
    LTabSheet := PageControl.ActivePage;
  if not AskYesOrNo(Format(LanguageDataModule.GetYesOrNoMessage('CloseDirectory'), [LTabSheet.Caption])) then
    Exit(False);
  if PageControl.PageCount > 0 then
  begin
    PageControl.TabClosed := True;
    if ATabIndex = -1 then
      LActivePageIndex := PageControl.ActivePageIndex
    else
      LActivePageIndex := ATabIndex;
    if AFreePage and (PageControl.PageCount > 0) then
    begin
      PageControl.Pages[LActivePageIndex].Free;
      if LActivePageIndex > 0 then
        PageControl.ActivePageIndex := LActivePageIndex - 1
      else
      if PageControl.PageCount > 0 then
        PageControl.ActivePageIndex := 0;
    end
    else
    begin
      TsTabSheet(PageControl.Pages[LActivePageIndex]).TabVisible := False;
      PageControl.Pages[LActivePageIndex].PageIndex := PageControl.PageCount - 1;
    end;
  end;
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

procedure TDirectoryFrame.ActionDirectoryCloseExecute(Sender: TObject);
begin
  CloseDirectory;
end;

procedure TDirectoryFrame.ActionDirectoryDeleteExecute(Sender: TObject);
var
  Result: Boolean;
  FileTreeView: TBCFileTreeView;
  SelectedNode: PVirtualNode;
  Data: PBCFileTreeNodeRec;
begin
  FileTreeView := GetFileTreeView;
  if Assigned(FileTreeView) then
  begin
    SelectedNode := FileTreeView.GetFirstSelected;
    Data := FileTreeView.GetNodeData(SelectedNode);
    if Data.FileType = ftDirectory then
      Result := AskYesOrNo(Format(LanguageDataModule.GetYesOrNoMessage('DeleteDirectory'), [SelectedPath]))
    else
      Result := AskYesOrNo(Format(LanguageDataModule.GetYesOrNoMessage('DeleteFile'), [SelectedFile]));
    if Result then
      FileTreeView.DeleteSelectedNode;
  end;
end;

procedure TDirectoryFrame.EditDirectory;
var
  FileTreeView: TBCFileTreeView;
begin
  FileTreeView := GetFileTreeView;
  if Assigned(FileTreeView) then
  with TDirectoryTabDialog.Create(Self) do
  try
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
  finally
    Free;
  end;
end;

procedure TDirectoryFrame.ActionDirectoryEditExecute(Sender: TObject);
begin
  EditDirectory;
end;

procedure TDirectoryFrame.ActionDirectoryFilesExecute(Sender: TObject);
begin
  with SearchForFilesForm do
  begin
    OnOpenFile := FOnSearchForFilesOpenFile;
    Open(SelectedPath);
  end;
end;

procedure TDirectoryFrame.OpenDirectory;
begin
  with TDirectoryTabDialog.Create(Self) do
  try
    TabName := 'C:\';
    RootDirectory := TabName;
    ShowDrives := 1;
    ExcludeOtherBranches := False;
    ShowFileType := 0;
    if Open(dtOpen) then
      OpenDirectory(TabName, RootDirectory, RootDirectory, ShowDrives, ExcludeOtherBranches, ShowFileType, '*.*');
  finally
    Free;
  end;
end;

procedure TDirectoryFrame.ActionDirectoryOpenExecute(Sender: TObject);
begin
  OpenDirectory;
end;

procedure TDirectoryFrame.ActionDirectoryPropertiesExecute(Sender: TObject);
var
  FileTreeView: TBCFileTreeView;
begin
  FileTreeView := GetFileTreeView;
  if Assigned(FileTreeView) then
    if FileTreeView.SelectedCount > 0 then
      FilePropertiesDialog(FileTreeView.SelectedFile);
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

procedure TDirectoryFrame.ActionDirectoryRefreshExecute(Sender: TObject);
var
  FileTreeView: TBCFileTreeView;
begin
  FileTreeView := GetFileTreeView;
  if Assigned(FileTreeView) then
    FileTreeView.OpenPath(RootDirectory, SelectedPath, ExcludeOtherBranches);
end;

procedure TDirectoryFrame.ActionDirectoryRenameExecute(Sender: TObject);
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

procedure TDirectoryFrame.PageControlCloseButtonClick(Sender: TComponent; TabIndex: Integer; var CanClose: Boolean;
  var Action: TacCloseAction);
begin
  if CloseDirectory(False, TabIndex) then
    Action := acaFree
  else
    CanClose := False;
end;

procedure TDirectoryFrame.PageControlDblClick(Sender: TObject);
begin
  if OptionsContainer.DirCloseTabByDblClick then
    ActionDirectoryClose.Execute;
end;

procedure TDirectoryFrame.PageControlMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  if (Button = mbMiddle) and OptionsContainer.DirCloseTabByMiddleClick then
    ActionDirectoryClose.Execute;
end;

procedure TDirectoryFrame.PopupMenuPopup(Sender: TObject);
begin
  ActionDirectoryProperties.Enabled := FileExists(SelectedFile);
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
  TabSheet: TsTabSheet;
  DirTabSheetFrame: TDirTabSheetFrame;
  SHFileInfo: TSHFileInfo;
begin
  if not DirectoryExists(RootDirectory) then
    Exit;
  if not DirectoryExists(LastPath) then
    Exit;

  TabSheet := TsTabSheet.Create(PageControl);
  TabSheet.PageControl := PageControl;
  TabSheet.SkinData.SkinSection := 'CHECKBOX';

  if Assigned(TabSheetOpen) then
    TabSheetOpen.PageIndex := PageControl.PageCount - 1;

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
      OnClick := FileTreeViewClick;
      OnDblClick := FileTreeViewDblClick;
      DefaultNodeHeight := Images.Height + 2;
    end;
    DriveComboBox.OnChange := DriveComboChange;
    SetDrivesPanelOrientation(ShowDrives, DirTabSheetFrame);
    SetFileTypePanelOrientation(ShowFileType, FileType, DirTabSheetFrame);
    SHGetFileInfo(PChar(RootDirectory), 0, SHFileInfo, SizeOf(SHFileInfo), SHGFI_SYSICONINDEX or SHGFI_DISPLAYNAME or SHGFI_TYPENAME);
    TabSheet.ImageIndex := SHFileInfo.iIcon;
    { destroy the icon, we are only using the index }
    DestroyIcon(SHFileInfo.hIcon);
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
begin
  PageControl.DoubleBuffered := OptionsContainer.DirDoubleBuffered;
  PageControl.MultiLine := OptionsContainer.DirMultiLine;
  PageControl.ShowCloseBtns := OptionsContainer.DirShowCloseButton;
  PageControl.RightClickSelect := OptionsContainer.DirRightClickSelect;
  if Assigned(TabSheetOpen) then
    TabSheetOpen.TabVisible := OptionsContainer.DirShowOpenDirectoryButton;
  if OptionsContainer.DirShowImage then
    PageControl.Images := FImages
  else
    PageControl.Images := nil;
  for i := 0 to PageControl.PageCount - 2 do
  begin
    FileTreeView := TDirTabSheetFrame(PageControl.Pages[i].Components[0]).FileTreeView;
    FileTreeView.Indent := OptionsContainer.DirIndent;
    FileTreeView.ShowHiddenFiles := OptionsContainer.DirShowHiddenFiles;
    FileTreeView.ShowSystemFiles := OptionsContainer.DirShowSystemFiles;
    FileTreeView.ShowArchiveFiles := OptionsContainer.DirShowArchiveFiles;
    FileTreeView.ShowOverlayIcons := OptionsContainer.DirShowOverlayIcons;
    if OptionsContainer.DirShowTreeLines then
      FileTreeView.TreeOptions.PaintOptions := FileTreeView.TreeOptions.PaintOptions + [toShowTreeLines]
    else
      FileTreeView.TreeOptions.PaintOptions := FileTreeView.TreeOptions.PaintOptions - [toShowTreeLines]
  end;
end;

procedure TDirectoryFrame.TabSheetOpenClickBtn(Sender: TObject);
begin
  OpenDirectory;
end;

end.

