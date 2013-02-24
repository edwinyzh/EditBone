unit Directory;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.ComCtrls, BCFileControl, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ImgList, Vcl.ToolWin, Vcl.ActnList, Vcl.Buttons, JvExControls, JvLabel, Vcl.Menus,
  JvSpeedButton, JvExComCtrls, JvComCtrls, BCPopupMenu, BCPageControl, Vcl.ActnPopup, Vcl.Themes,
  Vcl.PlatformDefaultStyleActnCtrls, BCImageList, VirtualTrees, DirectoryTabSheet;

type
  TDirectoryFrame = class(TFrame)
    DirectoryActionList: TActionList;
    DirectoryCloseAction: TAction;
    PopupMenu: TBCPopupMenu;
    DirectoryRenameAction: TAction;
    DirectoryDeleteAction: TAction;
    Rename1: TMenuItem;
    Delete1: TMenuItem;
    PageControl: TBCPageControl;
    CloseDirectory1: TMenuItem;
    N1: TMenuItem;
    OpenDirectory1: TMenuItem;
    DirectoryOpenAction: TAction;
    ImagesList: TBCImageList;
    DirectoryRefreshAction: TAction;
    N2: TMenuItem;
    Refresh1: TMenuItem;
    DirectoryEditAction: TAction;
    EditDirectory1: TMenuItem;
    N3: TMenuItem;
    DirectoryPropertiesAction: TAction;
    Properties1: TMenuItem;
    procedure DirectoryRenameActionExecute(Sender: TObject);
    procedure DirectoryDeleteActionExecute(Sender: TObject);
    procedure DriveComboChange(Sender: TObject);
    procedure TabsheetDblClick(Sender: TObject);
    procedure DirectoryCloseActionExecute(Sender: TObject);
    procedure DirectoryOpenActionExecute(Sender: TObject);
    procedure DirectoryRefreshActionExecute(Sender: TObject);
    procedure DirectoryEditActionExecute(Sender: TObject);
    procedure DirectoryPropertiesActionExecute(Sender: TObject);
    //procedure VirtualDrawTreeKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    FTabsheetDblClick: TNotifyEvent;
    function ReadIniFile: Boolean;
    function ActiveDriveComboBox: TBCDriveComboBox;
    function GetIsAnyDirectory: Boolean;
    function GetExcludeOtherBranches: Boolean;
    function GetSelectedPath: string;
    function GetRootDirectory: string;
    function GetDirTabSheetFrame(TabSheet: TTabSheet): TDirTabSheetFrame;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function ActiveFileTreeView: TBCFileTreeView;
    function ActiveDrivesPanel: TPanel;
    function SelectedFile: string;
    property SelectedPath: string read GetSelectedPath;
    procedure OpenPath(RootDirectory: string; LastPath: string; ExcludeOtherBranches: Boolean);
    procedure WriteIniFile;
    procedure OpenDirectory; overload;
    procedure OpenDirectory(TabName: string; RootDirectory: string; LastPath: string; ShowDrives: Boolean;
      ExcludeOtherBranches: Boolean); overload;
    procedure CloseDirectory;
    procedure EditDirectory;
    property OnTabsheetDblClick: TNotifyEvent read FTabsheetDblClick write FTabsheetDblClick;
    property IsAnyDirectory: Boolean read GetIsAnyDirectory;
    property RootDirectory: string read GetRootDirectory;
    property ExcludeOtherBranches: Boolean read GetExcludeOtherBranches;
    procedure UpdateControls;
  end;

implementation

{$R *.dfm}

uses
  System.Types, DirectoryTab, Winapi.ShellAPI, StyleHooks, Common, BigIni, Language;

constructor TDirectoryFrame.Create(AOwner: TComponent);
begin
  inherited;
  ReadIniFile;
  //if not ReadIniFile then
  //  OpenDirectory;
end;

function TDirectoryFrame.ReadIniFile: Boolean;
var
  i: Integer;
  s: string;
  LastPaths: TStrings;
  TabName, Root, LastPath: string;
  ShowDrives, ExcludeOtherBranches: Boolean;
begin
  LastPaths := TStringList.Create;
  with TBigIniFile.Create(Common.GetINIFilename) do
  try
    { Options }
    ReadSectionValues('LastPaths', LastPaths);
    for i := 0 to LastPaths.Count - 1 do
    begin
      s := System.Copy(LastPaths.Strings[i], Pos('=', LastPaths.Strings[i]) + 1, Length(LastPaths.Strings[i]));
      { if Pos(';', s) <> 0 then
      begin }
      TabName := Copy(s, 1, Pos(';', s) - 1);
      s := Copy(s, Pos(';', s) + 1, Length(s));
      Root := Copy(s, 1, Pos(';', s) - 1);
      s := Copy(s, Pos(';', s) + 1, Length(s));
      LastPath := Copy(s, 1, Pos(';', s) - 1);
      s := Copy(s, Pos(';', s) + 1, Length(s));
      ShowDrives := StrToBool(Copy(s, 1, Pos(';', s) - 1));
      s := Copy(s, Pos(';', s) + 1, Length(s));
      ExcludeOtherBranches := StrToBool(s);
      (* end
      else
      begin
        { old ini version before 1.6.2 }
        TabName := IncludeTrailingBackslash(ExtractFileDrive(s));
        Root := TabName;
        LastPath := s;
        ShowDrives := True;
        ExcludeOtherBranches := False;
      end; *)
      if DirectoryExists(LastPath) then
        OpenDirectory(TabName, Root, LastPath, ShowDrives, ExcludeOtherBranches);
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

destructor TDirectoryFrame.Destroy;
begin

  inherited;
end;

function TDirectoryFrame.GetDirTabSheetFrame(TabSheet: TTabSheet): TDirTabSheetFrame;
begin
  Result := nil;
  if Assigned(TabSheet) then
    if TabSheet.ComponentCount <> 0 then
      if TabSheet.Components[0] is TDirTabSheetFrame then
        Result := TDirTabSheetFrame(TabSheet.Components[0]);
end;

function TDirectoryFrame.ActiveDrivesPanel: TPanel;
var
  DirTabSheetFrame: TDirTabSheetFrame;
begin
  Result := nil;
  DirTabSheetFrame := GetDirTabSheetFrame(PageControl.ActivePage);
  if Assigned(DirTabSheetFrame) then
      Result := DirTabSheetFrame.DriveComboBoxPanel;
end;

function TDirectoryFrame.GetExcludeOtherBranches: Boolean;
var
  FileTreeView: TBCFileTreeView;
begin
  Result := False;
  FileTreeView := ActiveFileTreeView;
  if Assigned(FileTreeView) then
    Result := FileTreeView.ExcludeOtherBranches;
end;

procedure TDirectoryFrame.WriteIniFile;
var
  i: Integer;
begin
  with TBigIniFile.Create(Common.GetINIFilename) do
  try
    WriteInteger('Options', 'ActiveDirectoryIndex', PageControl.ActivePageIndex);
    { Options }
    EraseSection('LastPaths');
    //EraseSection('Directory'); // old stuff, remove if exists
    { Open directories }
    for i := 0 to PageControl.PageCount - 1 do
    begin
      PageControl.ActivePageIndex := i;
      WriteString('LastPaths', IntToStr(i), Format('%s;%s;%s;%s;%s', [PageControl.ActivePage.Caption,
        ActiveFileTreeView.RootDirectory, SelectedPath, BoolToStr(ActiveDrivesPanel.Visible),
        BoolToStr(GetExcludeOtherBranches)]));
    end;
  finally
    Free;
  end;
end;

function TDirectoryFrame.ActiveFileTreeView: TBCFileTreeView;
var
  DirTabSheetFrame: TDirTabSheetFrame;
begin
  Result := nil;
  DirTabSheetFrame := GetDirTabSheetFrame(PageControl.ActivePage);
  if Assigned(DirTabSheetFrame) then
    Result := DirTabSheetFrame.FileTreeView;
end;

procedure TDirectoryFrame.TabsheetDblClick(Sender: TObject);
begin
  if Assigned(FTabsheetDblClick) then
    FTabsheetDblClick(Sender);
end;

function TDirectoryFrame.ActiveDriveComboBox: TBCDriveComboBox;
var
  DirTabSheetFrame: TDirTabSheetFrame;
begin
  Result := nil;
  DirTabSheetFrame := GetDirTabSheetFrame(PageControl.ActivePage);
  if Assigned(DirTabSheetFrame) then
    Result := DirTabSheetFrame.DriveComboBox;
end;

procedure TDirectoryFrame.CloseDirectory;
begin
  if not Common.AskYesOrNo(Format(LanguageDataModule.GetYesOrNo('CloseDirectory'), [PageControl.ActivePage.Caption])) then
    Exit;
  if PageControl.PageCount > 0 then
  begin
    PageControl.ActivePage.Destroy;
    if PageControl.PageCount > 0 then
      PageControl.ActivePageIndex := PageControl.PageCount - 1;
  end;
  { for some reason Destroy method will lose the Images property even there are still pages... }
  if PageControl.PageCount > 0 then
    PageControl.Images := ActiveDriveComboBox.SystemIconsImageList;
  Application.ProcessMessages;
end;

function TDirectoryFrame.SelectedFile: string;
begin
  Result := ActiveFileTreeView.SelectedFile;
end;

function TDirectoryFrame.GetSelectedPath: string;
var
  FileTreeView: TBCFileTreeView;
begin
  Result := '';
  FileTreeView := ActiveFileTreeView;
  if Assigned(FileTreeView) then
    Result := FileTreeView.SelectedPath;
end;

procedure TDirectoryFrame.DirectoryCloseActionExecute(Sender: TObject);
begin
  CloseDirectory;
end;

procedure TDirectoryFrame.DirectoryDeleteActionExecute(Sender: TObject);
begin
  ActiveFileTreeView.DeleteSelectedNode;
end;

procedure TDirectoryFrame.EditDirectory;
begin
  with DirectoryTabDialog do
  begin
    TabName := PageControl.ActivePage.Caption;
    RootDirectory := ActiveFileTreeView.RootDirectory;
    ShowDrives := ActiveDrivesPanel.Visible;
    ExcludeOtherBranches := GetExcludeOtherBranches;
    if Open(dtEdit) then
    begin
      PageControl.ActivePage.Caption := TabName;
      ActiveDrivesPanel.Visible := ShowDrives;
      ActiveFileTreeView.OpenPath(RootDirectory, SelectedPath, ExcludeOtherBranches);
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
    ShowDrives := True;
    ExcludeOtherBranches := False;
    if Open(dtOpen) then
      OpenDirectory(TabName, RootDirectory, RootDirectory, ShowDrives, ExcludeOtherBranches);
  end;
end;

procedure TDirectoryFrame.DirectoryOpenActionExecute(Sender: TObject);
begin
  OpenDirectory;
end;

procedure TDirectoryFrame.DirectoryPropertiesActionExecute(Sender: TObject);
begin
  if ActiveFileTreeView.SelectedCount > 0 then
    Common.PropertiesDialog(ActiveFileTreeView.SelectedFile);
end;

function TDirectoryFrame.GetRootDirectory: string;
var
  FileTreeView: TBCFileTreeView;
begin
  Result := '';
  FileTreeView := ActiveFileTreeView;
  if Assigned(FileTreeView) then
    Result := FileTreeView.RootDirectory;
end;

procedure TDirectoryFrame.DirectoryRefreshActionExecute(Sender: TObject);
begin
  ActiveFileTreeView.OpenPath(RootDirectory, SelectedPath, ExcludeOtherBranches);
end;

procedure TDirectoryFrame.DirectoryRenameActionExecute(Sender: TObject);
begin
  ActiveFileTreeView.RenameSelectedNode;
end;

procedure TDirectoryFrame.OpenPath(RootDirectory: string; LastPath: string; ExcludeOtherBranches: Boolean);
var
  FileTreeView: TBCFileTreeView;
begin
  ActiveDriveComboBox.Drive := ExtractFileDir(RootDirectory)[1];
  FileTreeView := ActiveFileTreeView;
  if Assigned(FileTreeView) then
    FileTreeView.OpenPath(RootDirectory, LastPath, ExcludeOtherBranches);
end;

procedure TDirectoryFrame.DriveComboChange(Sender: TObject);
var
  DriveComboBox: TBCDriveComboBox;
begin
  DriveComboBox := ActiveDriveComboBox;
  if Assigned(DriveComboBox) then
  begin
    PageControl.ActivePage.ImageIndex := DriveComboBox.IconIndex;
    if (Length(PageControl.ActivePage.Caption) = 3) and
      (Pos(':\', PageControl.ActivePage.Caption) = 2) then
      PageControl.ActivePage.Caption := Format('%s:\', [DriveComboBox.Drive]);
  end;
end;

procedure TDirectoryFrame.OpenDirectory(TabName: string; RootDirectory: string; LastPath: string; ShowDrives: Boolean; ExcludeOtherBranches: Boolean);
var
  TabSheet: TTabSheet;
  DirTabSheetFrame: TDirTabSheetFrame;
begin
  if not DirectoryExists(RootDirectory) then
    Exit;
  if not DirectoryExists(LastPath) then
    Exit;

  TabSheet := TTabSheet.Create(PageControl);
  TabSheet.Visible := False;
  TabSheet.PageControl := PageControl;
  TabSheet.ImageIndex := -1;

  PageControl.ActivePage := TabSheet;

  DirTabSheetFrame := TDirTabSheetFrame.Create(TabSheet);
  with DirTabSheetFrame do
  begin
    Panel.Visible := False;
    Parent := TabSheet;
    Align := alClient;
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
    DriveComboBoxPanel.Visible := ShowDrives;
    PageControl.Images := DriveComboBox.SystemIconsImageList;
    TabSheet.ImageIndex := DriveComboBox.IconIndex;
  end;
  PageControl.ActivePage.Caption := TabName;

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

procedure TDirectoryFrame.UpdateControls;
var
  i: Integer;
  DirTabSheetFrame: TDirTabSheetFrame;
  LStyles: TCustomStyleServices;
  PanelColor: TColor;
begin
  PageControl.DoubleBuffered := TStyleManager.ActiveStyle.Name = STYLENAME_WINDOWS;
  Application.ProcessMessages; { Important! }
  LStyles := StyleServices;
  PanelColor := clNone;
  if LStyles.Enabled then
    PanelColor := LStyles.GetStyleColor(scPanel);
  for i := 0 to PageControl.PageCount - 1 do
  begin
    DirTabSheetFrame := GetDirTabSheetFrame(PageControl.Pages[i]);

    if Assigned(DirTabSheetFrame) then
    begin
      if TStyleManager.ActiveStyle.Name = STYLENAME_WINDOWS then
        DirTabSheetFrame.Panel.Padding.Right := 3
      else
      if LStyles.Enabled and
        (GetRValue(PanelColor) + GetGValue(PanelColor) + GetBValue(PanelColor) > 500) then
        DirTabSheetFrame.Panel.Padding.Right := 2
      else
        DirTabSheetFrame.Panel.Padding.Right := 1;
    end;
  end;
end;

end.
