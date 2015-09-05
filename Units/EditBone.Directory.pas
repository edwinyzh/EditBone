unit EditBone.Directory;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Winapi.Windows, System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.ComCtrls,
  BCControls.FileControl, Vcl.ImgList, Vcl.ActnList, Vcl.Buttons, Vcl.Menus, BCControls.PageControl, VirtualTrees,
  System.Actions, BCCommon.Forms.SearchForFiles, BCCommon.Images, sPageControl, Vcl.StdCtrls,
  Vcl.PlatformDefaultStyleActnCtrls, System.ImageList, acAlphaImageList, BCControls.ImageList,
  BCComponents.SkinManager;

type
  TEBDirectory = class(TObject)
    procedure DriveComboChange(Sender: TObject);
    procedure FileTreeViewClick(Sender: TObject);
    procedure FileTreeViewDblClick(Sender: TObject);
  private
    FFileTreeViewDblClick: TNotifyEvent;
    FFileTreeViewClick: TNotifyEvent;
    FImages: TImageList;
    FOnSearchForFilesOpenFile: TOpenFileEvent;
    FPageControl: TBCPageControl;
    FPopupMenuFileTreeView: TPopupMenu;
    FSkinManager: TBCSkinManager;
    FTabSheetOpen: TTabSheet;
    function GetActiveDriveComboBox: TBCDriveComboBox;
    function GetDrivesPanelOrientation(ATabSheet: TTabSheet = nil): Byte;
    function GetFileTypePanelOrientation(ATabSheet: TTabSheet = nil): Byte;
    function GetDriveComboBox(ATabSheet: TTabSheet): TBCDriveComboBox;
    function GetFileTypeComboBox(ATabSheet: TTabSheet): TBCFileTypeComboBox;
    function GetActiveExcludeOtherBranches: Boolean;
    function GetFileTreeView(ATabSheet: TTabSheet = nil): TBCFileTreeView;
    function GetFileType(ATabSheet: TTabSheet): string;
    function GetIsAnyDirectory: Boolean;
    function GetRootDirectory: string;
    function GetSelectedPath: string;
    procedure CreateImageList;
    procedure SetDrivesPanelOrientation(ShowDrives: Byte; ADriveComboBox: TBCDriveComboBox = nil);
    procedure SetFileTypePanelOrientation(ShowFileType: Byte; FileType: string = ''; AFileTypeComboBox: TBCFileTypeComboBox = nil);
  public
    constructor Create(AOwner: TBCPageControl);
    destructor Destroy; override;
    function CloseDirectory(AFreePage: Boolean = True; ATabIndex: Integer = -1): Boolean;
    function ReadIniFile: Boolean; // TODO: function?
    function SelectedFile: string;
    procedure DeleteSelected;
    procedure EditDirectory;
    procedure FileProperties;
    procedure OpenDirectory(TabName: string; RootDirectory: string; LastPath: string; ShowDrives: Byte;
      ExcludeOtherBranches: Boolean; ShowFileType: Byte; FileType: string); overload;
    procedure OpenDirectory; overload;
    procedure OpenPath(RootDirectory: string; LastPath: string; ExcludeOtherBranches: Boolean = False);
    procedure Refresh;
    procedure Rename;
    procedure SetOptions;
    procedure WriteIniFile;
    property ExcludeOtherBranches: Boolean read GetActiveExcludeOtherBranches;
    property IsAnyDirectory: Boolean read GetIsAnyDirectory;
    property OnFileTreeViewClick: TNotifyEvent read FFileTreeViewClick write FFileTreeViewClick;
    property OnFileTreeViewDblClick: TNotifyEvent read FFileTreeViewDblClick write FFileTreeViewDblClick;
    property OnSearchForFilesOpenFile: TOpenFileEvent read FOnSearchForFilesOpenFile write FOnSearchForFilesOpenFile;
    property PageControl: TBCPageControl read FPageControl;
    property PopupMenuFileTreeView: TPopupMenu read FPopupMenuFileTreeView write FPopupMenuFileTreeView;
    property RootDirectory: string read GetRootDirectory;
    property SelectedPath: string read GetSelectedPath;
    property SkinManager: TBCSkinManager read FSkinManager write FSkinManager;
    //property TabSheetOpen: TsTabSheet read FTabSheetOpen write FTabSheetOpen;
  end;

implementation

uses
  EditBone.Dialog.DirectoryTab, BigIni, BCCommon.Language.Strings, BCCommon.Options.Container, BCControls.Utils,
  System.Math, BCCommon.FileUtils, BCCommon.Messages, BCCommon.StringUtils, BCCommon.Dialogs.Base,
  Winapi.ShellAPI, Winapi.CommCtrl, EditBone.DataModule.Images, BCControls.Panel, EditBone.Consts;

destructor TEBDirectory.Destroy;
begin
  if Assigned(FImages) then
    FImages.Free;

  inherited Destroy;
end;

procedure TEBDirectory.CreateImageList;
var
  SysImageList: THandle;
  Icon: TIcon;
begin
  if not Assigned(FImages) then
    FImages := TImageList.Create(nil);
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
        if Assigned(FTabSheetOpen) then
        begin
          EBDataModuleImages.ImageListDirectory16.GetIcon(0, Icon);
          FTabSheetOpen.ImageIndex := ImageList_AddIcon(FImages.Handle, Icon.Handle);
        end;
      20:
        { medium }
        if Assigned(FTabSheetOpen) then
        begin
          EBDataModuleImages.ImageListDirectory20.GetIcon(0, Icon);
          FTabSheetOpen.ImageIndex := ImageList_AddIcon(FImages.Handle, Icon.Handle);
        end;
      24:
        { larger }
        if Assigned(FTabSheetOpen) then
        begin
          EBDataModuleImages.ImageListDirectory24.GetIcon(0, Icon);
          FTabSheetOpen.ImageIndex := ImageList_AddIcon(FImages.Handle, Icon.Handle);
        end;
    end;
  finally
    Icon.Free;
  end;
end;

constructor TEBDirectory.Create(AOwner: TBCPageControl);
begin
  inherited Create;
  FPageControl := AOwner;
  FTabSheetOpen := AOwner.Pages[0];
  CreateImageList;
end;

function TEBDirectory.ReadIniFile: Boolean;
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
    if i < FPageControl.PageCount then
      FPageControl.ActivePageIndex := i;
    Result := LastPaths.Count > 0;
  finally
    LastPaths.Free;
    Free;
  end;
end;

function TEBDirectory.GetDriveComboBox(ATabSheet: TTabSheet): TBCDriveComboBox;
var
  i: Integer;
  LPanel: TBCPanel;
begin
  Result := nil;
  if Assigned(ATabSheet) then
    if ATabSheet.ControlCount <> 0 then
      if ATabSheet.Controls[0] is TBCPanel then
      begin
        LPanel := TBCPanel(ATabSheet.Controls[0]);
        if Assigned(LPanel) then
        for i := 0 to LPanel.ControlCount - 1 do
        if LPanel.Controls[i] is TBCDriveComboBox then
        begin
          Result := LPanel.Controls[i] as TBCDriveComboBox;
          Break;
        end;
      end;
end;

function TEBDirectory.GetFileTypeComboBox(ATabSheet: TTabSheet): TBCFileTypeComboBox;
var
  i: Integer;
  LPanel: TBCPanel;
begin
  Result := nil;
  if Assigned(ATabSheet) then
    if ATabSheet.ControlCount <> 0 then
      if ATabSheet.Controls[0] is TBCPanel then
      begin
        LPanel := TBCPanel(ATabSheet.Controls[0]);
        if Assigned(LPanel) then
        for i := 0 to LPanel.ControlCount - 1 do
        if LPanel.Controls[i] is TBCFileTypeComboBox then
        begin
          Result := LPanel.Controls[i] as TBCFileTypeComboBox;
          Break;
        end;
      end;
end;

function TEBDirectory.GetDrivesPanelOrientation(ATabSheet: TTabSheet): Byte;
var
  LDriveComboBox: TBCDriveComboBox;
begin
  Result := 0;
  if not Assigned(ATabSheet) then
    ATabSheet := FPageControl.ActivePage;
  LDriveComboBox := GetDriveComboBox(ATabSheet);
  if Assigned(LDriveComboBox) then
    if LDriveComboBox.Visible then
    begin
      if LDriveComboBox.Align = alBottom then
        Result := 1
      else
        Result := 2;
    end;
end;

function TEBDirectory.GetFileType(ATabSheet: TTabSheet): string;
var
  LFileTypeComboBox: TBCFileTypeComboBox;
begin
  Result := '';
  LFileTypeComboBox := GetFileTypeComboBox(ATabSheet);
  if Assigned(LFileTypeComboBox) then
    Result := LFileTypeComboBox.Text;
end;

procedure TEBDirectory.SetDrivesPanelOrientation(ShowDrives: Byte; ADriveComboBox: TBCDriveComboBox);
var
  LDriveComboBox: TBCDriveComboBox;
begin
  if not Assigned(ADriveComboBox) then
    LDriveComboBox := GetDriveComboBox(FPageControl.ActivePage)
  else
    LDriveComboBox := ADriveComboBox;
  if Assigned(LDriveComboBox) then
  begin
    LDriveComboBox.Visible := ShowDrives <> 0;
    if ShowDrives = 1 then
    with LDriveComboBox do
    begin
      Margins.Top := 4;
      Margins.Bottom := 0;
      Align := alBottom
    end
    else
    if ShowDrives = 2 then
    with LDriveComboBox do
    begin
      Margins.Top := 0;
      Margins.Bottom := 4;
      Align := alTop
    end;
  end;
end;

procedure TEBDirectory.SetFileTypePanelOrientation(ShowFileType: Byte; FileType: string; AFileTypeComboBox: TBCFileTypeComboBox);
var
  LFileTypeComboBox: TBCFileTypeComboBox;
begin
  if not Assigned(AFileTypeComboBox) then
    LFileTypeComboBox := GetFileTypeComboBox(FPageControl.ActivePage)
  else
    LFileTypeComboBox := AFileTypeComboBox;
  if Assigned(LFileTypeComboBox) then
  begin
    LFileTypeComboBox.Visible := ShowFileType <> 0;
    if FileType <> '' then
      LFileTypeComboBox.Text := FileType;
    if ShowFileType = 1 then
    with LFileTypeComboBox do
    begin
      Margins.Top := 4;
      Margins.Bottom := 0;
      Align := alBottom
    end
    else
    if ShowFileType = 2 then
    with LFileTypeComboBox do
    begin
      Margins.Top := 0;
      Margins.Bottom := 4;
      Align := alTop
    end;
  end;
end;

function TEBDirectory.GetFileTypePanelOrientation(ATabSheet: TTabSheet = nil): Byte;
var
  LFileTypeComboBox: TBCFileTypeComboBox;
begin
  Result := 0;
  if not Assigned(ATabSheet) then
    ATabSheet := FPageControl.ActivePage;
  LFileTypeComboBox := GetFileTypeComboBox(ATabSheet);
  if Assigned(LFileTypeComboBox) then
    if LFileTypeComboBox.Visible then
    begin
      if LFileTypeComboBox.Align = alBottom then
        Result := 1
      else
        Result := 2;
    end;
end;

function TEBDirectory.GetActiveExcludeOtherBranches: Boolean;
var
  FileTreeView: TBCFileTreeView;
begin
  Result := False;
  FileTreeView := GetFileTreeView;
  if Assigned(FileTreeView) then
    Result := FileTreeView.ExcludeOtherBranches;
end;

procedure TEBDirectory.WriteIniFile;
var
  i: Integer;
  FileTreeView: TBCFileTreeView;
  LTabSheet: TTabSheet;
begin
  with TBigIniFile.Create(GetIniFilename) do
  try
    WriteInteger('Options', 'ActiveDirectoryIndex', FPageControl.ActivePageIndex);
    { Options }
    EraseSection('LastPaths');
    { Open directories }
    if OptionsContainer.DirSaveTabs then
    for i := 0 to FPageControl.PageCount - 2 do
    begin
      LTabSheet := FPageControl.Pages[i];
      FileTreeView := GetFileTreeView(LTabSheet);
      if Assigned(FileTreeView) then
        WriteString('LastPaths', IntToStr(i), Format('%s;%s;%s;%d;%s;%d;%s', [Trim(LTabSheet.Caption),
          FileTreeView.RootDirectory, FileTreeView.SelectedPath, GetDrivesPanelOrientation(LTabSheet),
          BoolToStr(FileTreeView.ExcludeOtherBranches), GetFileTypePanelOrientation(LTabSheet),
          GetFileType(LTabSheet)]));
    end;
  finally
    Free;
  end;
end;

function TEBDirectory.GetFileTreeView(ATabSheet: TTabSheet): TBCFileTreeView;
var
  i: Integer;
  LPanel: TBCPanel;
begin
  if not Assigned(ATabSheet) then
    ATabSheet := FPageControl.ActivePage;

  Result := nil;
  if Assigned(ATabSheet) then
    if ATabSheet.ControlCount <> 0 then
      if ATabSheet.Controls[0] is TBCPanel then
      begin
        LPanel := TBCPanel(ATabSheet.Controls[0]);
        if Assigned(LPanel) then
        for i := 0 to LPanel.ControlCount - 1 do
        if LPanel.Controls[i] is TBCFileTreeView then
        begin
          Result := LPanel.Controls[i] as TBCFileTreeView;
          Break;
        end;
      end;
end;

procedure TEBDirectory.FileTreeViewClick(Sender: TObject);
begin
  if Assigned(FFileTreeViewClick) then
    FFileTreeViewClick(Sender);
end;

procedure TEBDirectory.FileTreeViewDblClick(Sender: TObject);
begin
  if Assigned(FFileTreeViewDblClick) then
    FFileTreeViewDblClick(Sender);
end;

function TEBDirectory.GetActiveDriveComboBox: TBCDriveComboBox;
begin
  Result := GetDriveComboBox(FPageControl.ActivePage);
end;

function TEBDirectory.CloseDirectory(AFreePage: Boolean = True; ATabIndex: Integer = -1): Boolean;
var
  LActivePageIndex: Integer;
  LTabSheet: TTabSheet;
begin
  Result := True;
  if ATabIndex <> -1 then
    LTabSheet := FPageControl.Pages[ATabIndex]
  else
    LTabSheet := FPageControl.ActivePage;
  if not AskYesOrNo(Format(LanguageDataModule.GetYesOrNoMessage('CloseDirectory'), [LTabSheet.Caption])) then
    Exit(False);
  if FPageControl.PageCount > 0 then
  begin
    FPageControl.TabClosed := True;
    if ATabIndex = -1 then
      LActivePageIndex := FPageControl.ActivePageIndex
    else
      LActivePageIndex := ATabIndex;
    if AFreePage and (FPageControl.PageCount > 0) then
    begin
      FPageControl.Pages[LActivePageIndex].Free;
      if LActivePageIndex > 0 then
        FPageControl.ActivePageIndex := LActivePageIndex - 1
      else
      if FPageControl.PageCount > 0 then
        FPageControl.ActivePageIndex := 0;
    end
    else
    begin
      TsTabSheet(FPageControl.Pages[LActivePageIndex]).TabVisible := False;
      FPageControl.Pages[LActivePageIndex].PageIndex := LActivePageIndex + 1;
    end;
  end;
end;

function TEBDirectory.SelectedFile: string;
var
  FileTreeView: TBCFileTreeView;
begin
  Result := '';
  FileTreeView := GetFileTreeView;
  if Assigned(FileTreeView) then
    Result := FileTreeView.SelectedFile;
end;

function TEBDirectory.GetSelectedPath: string;
var
  FileTreeView: TBCFileTreeView;
begin
  Result := '';
  FileTreeView := GetFileTreeView;
  if Assigned(FileTreeView) then
    Result := FileTreeView.SelectedPath;
end;

procedure TEBDirectory.DeleteSelected;
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

procedure TEBDirectory.EditDirectory;
var
  FileTreeView: TBCFileTreeView;
begin
  FileTreeView := GetFileTreeView;
  if Assigned(FileTreeView) then
  with TDirectoryTabDialog.Create(nil) do
  try
    TabName := FPageControl.ActivePage.Caption{ActivePageCaption};
    RootDirectory := FileTreeView.RootDirectory;
    ShowDrives := GetDrivesPanelOrientation;
    ExcludeOtherBranches := FileTreeView.ExcludeOtherBranches;
    ShowFileType := GetFileTypePanelOrientation;
    if Open(dtEdit) then
    begin
      FPageControl.ActivePage.Caption{ActivePageCaption} := TabName;
      SetDrivesPanelOrientation(ShowDrives);
      SetFileTypePanelOrientation(ShowFileType);
      FileTreeView.OpenPath(RootDirectory, SelectedPath, ExcludeOtherBranches);
    end;
  finally
    Free;
  end;
end;

procedure TEBDirectory.OpenDirectory;
begin
  with TDirectoryTabDialog.Create(nil) do
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

procedure TEBDirectory.FileProperties;
var
  FileTreeView: TBCFileTreeView;
begin
  FileTreeView := GetFileTreeView;
  if Assigned(FileTreeView) then
    if FileTreeView.SelectedCount > 0 then
      FilePropertiesDialog(FileTreeView.SelectedFile);
end;

function TEBDirectory.GetRootDirectory: string;
var
  FileTreeView: TBCFileTreeView;
begin
  Result := '';
  FileTreeView := GetFileTreeView;
  if Assigned(FileTreeView) then
    Result := FileTreeView.RootDirectory;
end;

procedure TEBDirectory.Refresh;
var
  FileTreeView: TBCFileTreeView;
begin
  FileTreeView := GetFileTreeView;
  if Assigned(FileTreeView) then
    FileTreeView.OpenPath(RootDirectory, SelectedPath, ExcludeOtherBranches, True);
end;

procedure TEBDirectory.Rename;
var
  FileTreeView: TBCFileTreeView;
begin
  FileTreeView := GetFileTreeView;
  if Assigned(FileTreeView) then
    FileTreeView.RenameSelectedNode;
end;

procedure TEBDirectory.OpenPath(RootDirectory: string; LastPath: string; ExcludeOtherBranches: Boolean);
var
  FileTreeView: TBCFileTreeView;
begin
  GetActiveDriveComboBox.Drive := ExtractFileDir(RootDirectory)[1];
  FileTreeView := GetFileTreeView;
  if Assigned(FileTreeView) then
    FileTreeView.OpenPath(RootDirectory, LastPath, ExcludeOtherBranches);
end;

procedure TEBDirectory.DriveComboChange(Sender: TObject);
var
  DriveComboBox: TBCDriveComboBox;
begin
  DriveComboBox := GetActiveDriveComboBox;
  if Assigned(DriveComboBox) then
  begin
    FPageControl.ActivePage.ImageIndex := DriveComboBox.IconIndex;
    if (Length(FPageControl.ActivePage.Caption{ActivePageCaption}) = 3) and
      (Pos(':\', FPageControl.ActivePage.Caption{ActivePageCaption}) = 2) then
      FPageControl.ActivePage.Caption{ActivePageCaption} := Format('%s:\', [DriveComboBox.Drive]);
  end;
end;

procedure TEBDirectory.OpenDirectory(TabName: string; RootDirectory: string; LastPath: string; ShowDrives: Byte;
  ExcludeOtherBranches: Boolean; ShowFileType: Byte; FileType: string);
var
  LTabSheet: TsTabSheet;
  SHFileInfo: TSHFileInfo;

  LPanel: TBCPanel;
  LFileTreeView: TBCFileTreeView;
  LDriveComboBox: TBCDriveComboBox;
  LFileTypeComboBox: TBCFileTypeComboBox;
begin
  if not DirectoryExists(RootDirectory) then
    Exit;
  if not DirectoryExists(LastPath) then
    Exit;

  LTabSheet := TsTabSheet.Create(FPageControl);
  LTabSheet.PageControl := FPageControl;
  LTabSheet.SkinData.SkinSection := 'TABSHEET';

  if Assigned(FTabSheetOpen) then
    FTabSheetOpen.PageIndex := FPageControl.PageCount - 1;

  LTabSheet.Visible := False;
  LTabSheet.ImageIndex := -1;
  FPageControl.ActivePage := LTabSheet;

  LPanel := TBCPanel.Create(LTabSheet);
  with LPanel do
  begin
    Visible := False;
    Parent := LTabSheet;
    Align := alClient;
    Padding.Left := 2;
    Padding.Top := 2;
    Padding.Right := 2;
    Padding.Bottom := 2;
  end;

  LFileTreeView := TBCFileTreeView.Create(LPanel);
  with LFileTreeView do
  begin
    Parent := LPanel;
    Align := alClient;
    Indent := 20;
    TreeOptions.AutoOptions := [toAutoDropExpand, toAutoScroll, toAutoScrollOnExpand, toAutoTristateTracking,
      toAutoDeleteMovedNodes, toAutoChangeScale];
    TreeOptions.MiscOptions := [toEditable, toFullRepaintOnResize, toToggleOnDblClick, toWheelPanning, toEditOnClick];
    TreeOptions.PaintOptions := [toHideFocusRect, toShowButtons, toShowDropmark, toShowRoot, toThemeAware];
    PopupMenu := PopupMenuFileTreeView;
    OnClick := FileTreeViewClick;
    OnDblClick := FileTreeViewDblClick;
    DefaultNodeHeight := Images.Height + 2;
    SkinManager := FSkinManager;
  end;

  LDriveComboBox := TBCDriveComboBox.Create(LPanel);
  with LDriveComboBox do
  begin
    Parent := LPanel;
    AlignWithMargins := True;
    Margins.Bottom := 4;
    Align := alTop;
    FileTreeView := LFileTreeView;
    Drive := 'C';
    OnChange := DriveComboChange;
  end;

  LFileTypeComboBox := TBCFileTypeComboBox.Create(LPanel);
  with LFileTypeComboBox do
  begin
    Parent := LPanel;
    AlignWithMargins := True;
    Margins.Top := 4;
    Align := alBottom;
    FileTreeView := LFileTreeView;
    FileType := '*.*';
    Text := '*.*';
    Extensions := OptionsContainer.Extensions;
  end;

  SetDrivesPanelOrientation(ShowDrives, LDriveComboBox);
  SetFileTypePanelOrientation(ShowFileType, FileType, LFileTypeComboBox);
  SHGetFileInfo(PChar(RootDirectory), 0, SHFileInfo, SizeOf(SHFileInfo), SHGFI_SYSICONINDEX or SHGFI_DISPLAYNAME or SHGFI_TYPENAME);
  LTabSheet.ImageIndex := SHFileInfo.iIcon;
  DestroyIcon(SHFileInfo.hIcon); { destroy the icon, we are only using the index }

  PageControl.ActivePage.Caption{ActivePageCaption} := TabName;
  SetOptions;
  OpenPath(RootDirectory, LastPath, ExcludeOtherBranches);
  LPanel.Visible := True;
  LTabSheet.Visible := True;
end;

function TEBDirectory.GetIsAnyDirectory: Boolean;
begin
  Result := False;
  if Assigned(PageControl) then
    Result := PageControl.PageCount <> 0;
end;

procedure TEBDirectory.SetOptions;
var
  i: Integer;
  LFileTreeView: TBCFileTreeView;
begin
  PageControl.MultiLine := OptionsContainer.DirMultiLine;
  PageControl.ShowCloseBtns := OptionsContainer.DirShowCloseButton;
  PageControl.RightClickSelect := OptionsContainer.DirRightClickSelect;
  if Assigned(FTabSheetOpen) then
    FTabSheetOpen.TabVisible := OptionsContainer.DirShowOpenDirectoryButton;
  if OptionsContainer.DirShowImage then
    PageControl.Images := FImages
  else
    PageControl.Images := nil;
  for i := 0 to PageControl.PageCount - 2 do
  begin
    LFileTreeView := GetFileTreeView(PageControl.Pages[i]);
    if Assigned(LFileTreeView) then
    begin
      LFileTreeView.Indent := OptionsContainer.DirIndent;
      LFileTreeView.ShowHiddenFiles := OptionsContainer.DirShowHiddenFiles;
      LFileTreeView.ShowSystemFiles := OptionsContainer.DirShowSystemFiles;
      LFileTreeView.ShowArchiveFiles := OptionsContainer.DirShowArchiveFiles;
      LFileTreeView.ShowOverlayIcons := OptionsContainer.DirShowOverlayIcons;
      if OptionsContainer.DirShowTreeLines then
        LFileTreeView.TreeOptions.PaintOptions := LFileTreeView.TreeOptions.PaintOptions + [toShowTreeLines]
      else
        LFileTreeView.TreeOptions.PaintOptions := LFileTreeView.TreeOptions.PaintOptions - [toShowTreeLines]
    end;
  end;
end;

end.
