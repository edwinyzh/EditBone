unit Directory;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, BCFileControl, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ImgList, Vcl.ToolWin, Vcl.ActnList, Vcl.Buttons, JvExControls, JvLabel, Vcl.Menus,
  JvSpeedButton, JvExComCtrls, JvComCtrls, BCPopupMenu, BCPageControl, Vcl.ActnPopup, Vcl.Themes,
  Vcl.PlatformDefaultStyleActnCtrls, BCImageList, VirtualTrees;

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
    procedure DirectoryRenameActionExecute(Sender: TObject);
    procedure DirectoryDeleteActionExecute(Sender: TObject);
    procedure DriveComboChange(Sender: TObject);
    procedure TabsheetDblClick(Sender: TObject);
    procedure DirectoryCloseActionExecute(Sender: TObject);
    procedure DirectoryOpenActionExecute(Sender: TObject);
    procedure DirectoryRefreshActionExecute(Sender: TObject);
    procedure DirectoryEditActionExecute(Sender: TObject);
    //procedure VirtualDrawTreeKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    FTabsheetDblClick: TNotifyEvent;
    function ReadIniFile: Boolean;
    function DriveComboBox: TBCDriveComboBox;
    function GetIsAnyDirectory: Boolean;
    function GetExcludeOtherBranches: Boolean;
    function GetSelectedPath: string;
    function GetRootDirectory: string;
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
  System.Types, DirectoryTab, Winapi.ShellAPI, StyleHooks, Common, BigIni;

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
  with TBigIniFile.Create(ChangeFileExt(Application.EXEName, '.ini')) do
  try
    { Preferences }
    ReadSectionValues('LastPaths', LastPaths);
    for i := 0 to LastPaths.Count - 1 do
    begin
      s := System.Copy(LastPaths.Strings[i], Pos('=', LastPaths.Strings[i]) + 1, Length(LastPaths.Strings[i]));
      if Pos(';', s) <> 0 then
      begin
        TabName := Copy(s, 1, Pos(';', s) - 1);
        s := Copy(s, Pos(';', s) + 1, Length(s));
        Root := Copy(s, 1, Pos(';', s) - 1);
        s := Copy(s, Pos(';', s) + 1, Length(s));
        LastPath := Copy(s, 1, Pos(';', s) - 1);
        s := Copy(s, Pos(';', s) + 1, Length(s));
        ShowDrives := StrToBool(Copy(s, 1, Pos(';', s) - 1));
        s := Copy(s, Pos(';', s) + 1, Length(s));
        ExcludeOtherBranches := StrToBool(s);
      end
      else
      begin
        { old ini version before 1.6.2 }
        TabName := IncludeTrailingBackslash(ExtractFileDrive(s));
        Root := TabName;
        LastPath := s;
        ShowDrives := True;
        ExcludeOtherBranches := False;
      end;
      if DirectoryExists(LastPath) then
        OpenDirectory(TabName, Root, LastPath, ShowDrives, ExcludeOtherBranches);
    end;
    i := ReadInteger('Preferences', 'ActiveDirectoryIndex', 0);
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

function TDirectoryFrame.ActiveDrivesPanel: TPanel;
var
  i: Integer;
begin
  Result := nil;
  for i := 0 to PageControl.ActivePage.ComponentCount - 1 do
    if PageControl.ActivePage.Components[i].Tag = 99 then
      Result := TPanel(PageControl.ActivePage.Components[i]);
end;

function TDirectoryFrame.GetExcludeOtherBranches: Boolean;
begin
  Result := ActiveFileTreeView.ExcludeOtherBranches;
end;

procedure TDirectoryFrame.WriteIniFile;
var
  i: Integer;
begin
  with TBigIniFile.Create(ChangeFileExt(Application.EXEName, '.ini')) do
  try
    WriteInteger('Preferences', 'ActiveDirectoryIndex', PageControl.ActivePageIndex);
    { Preferences }
    EraseSection('LastPaths');
    EraseSection('Directory'); // old stuff, remove if exists
    { Open directories }
    for i := 0 to PageControl.PageCount - 1 do
    begin
      PageControl.ActivePageIndex := i;
      WriteString('LastPaths', IntToStr(i), PageControl.ActivePage.Caption + ';' + ActiveFileTreeView.RootDirectory + ';' +
        SelectedPath + ';' + BoolToStr(ActiveDrivesPanel.Visible) + ';' + BoolToStr(GetExcludeOtherBranches));
    end;
  finally
    Free;
  end;
end;

function TDirectoryFrame.ActiveFileTreeView: TBCFileTreeView;
var
  i: Integer;
begin
  Result := nil;
  for i := 0 to PageControl.ActivePage.ComponentCount - 1 do
    if PageControl.ActivePage.Components[i] is TBCFileTreeView then
    begin
      Result := TBCFileTreeView(PageControl.ActivePage.Components[i]);
      Break;
    end;
end;

procedure TDirectoryFrame.TabsheetDblClick(Sender: TObject);
begin
  if Assigned(FTabsheetDblClick) then
    FTabsheetDblClick(Sender);
end;

function TDirectoryFrame.DriveComboBox: TBCDriveComboBox;
var
  i: Integer;
begin
  Result := nil;
  if Assigned(PageControl.ActivePage) then
  for i := 0 to PageControl.ActivePage.ComponentCount - 1 do
    if PageControl.ActivePage.Components[i] is TBCDriveComboBox then
    begin
      Result := TBCDriveComboBox(PageControl.ActivePage.Components[i]);
      Break;
    end;
end;

procedure TDirectoryFrame.CloseDirectory;
begin
  if not Common.AskYesOrNo(Format('Close directory %s, are you sure?', [PageControl.ActivePage.Caption])) then
    Exit;
  if PageControl.PageCount > 0 then
  begin
    PageControl.ActivePage.Destroy;
    if PageControl.PageCount > 0 then
      PageControl.ActivePageIndex := PageControl.PageCount - 1;
  end;
  { for some reason Destroy method will lose the Images property even there is still pages... }
  if PageControl.PageCount > 0 then
    PageControl.Images := DriveComboBox.SystemIconsImageList;
  Application.ProcessMessages;
end;

function TDirectoryFrame.SelectedFile: string;
begin
  Result := ActiveFileTreeView.SelectedFile;
end;

function TDirectoryFrame.GetSelectedPath: string;
begin
  Result := ActiveFileTreeView.SelectedPath;
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

function TDirectoryFrame.GetRootDirectory: string;
begin
  Result := ActiveFileTreeView.RootDirectory;
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
begin
  DriveComboBox.Drive := ExtractFileDir(RootDirectory)[1];
  ActiveFileTreeView.OpenPath(RootDirectory, LastPath, ExcludeOtherBranches);
end;

procedure TDirectoryFrame.DriveComboChange(Sender: TObject);
var
  BCDriveComboBox: TBCDriveComboBox;
begin
  BCDriveComboBox := DriveComboBox;
  if Assigned(BCDriveComboBox) then
  begin
    PageControl.ActivePage.ImageIndex := BCDriveComboBox.IconIndex;
    if (Length(PageControl.ActivePage.Caption) = 3) and
      (Pos(':\', PageControl.ActivePage.Caption) = 2) then
      PageControl.ActivePage.Caption := BCDriveComboBox.Drive + ':\';
  end;
end;

{procedure TDirectoryFrame.VirtualDrawTreeKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  PageControl.ActivePage.Repaint;
end;}

procedure TDirectoryFrame.OpenDirectory(TabName: string; RootDirectory: string; LastPath: string; ShowDrives: Boolean; ExcludeOtherBranches: Boolean);
var
  TabSheet: TTabSheet;
  FileTreeViewPanel: TPanel;
  DriveComboBoxPanel: TPanel;
  BCDriveComboBox: TBCDriveComboBox;
  BCFileTreeView: TBCFileTreeView;
  //LStyles: TCustomStyleServices;
  //LColor: TColor;
begin
  if not DirectoryExists(RootDirectory) then
    Exit;
  if not DirectoryExists(LastPath) then
    Exit;

  TabSheet := TTabSheet.Create(PageControl);
  TabSheet.Visible := False;
  TabSheet.PageControl := PageControl;
  TabSheet.ImageIndex := -1;

 // if PageControl.PageCount > 0 then
  PageControl.ActivePage := TabSheet;

  FileTreeViewPanel := TPanel.Create(TabSheet);
  with FileTreeViewPanel do
  begin
    Visible := False;
    Parent := TabSheet;
    Align := alClient;
    BevelOuter := bvNone;
    Padding.Top := 1;
    Padding.Left := 1;
    //if TStyleManager.ActiveStyle.Name = 'Windows' then
      Padding.Right := 3;
    //else
    //  Padding.Right := 1;
    Padding.Bottom := 2;
    ParentBackground := True;
    //DoubleBuffered := False;
    ParentColor := True;
    //ParentDoubleBuffered := False;
  end;

  BCFileTreeView := TBCFileTreeView.Create(TabSheet);
  with BCFileTreeView do
  begin
    Parent := FileTreeViewPanel;
    Align := alClient;
    //Width := 446;

    //ParentColor := True;
    //ParentBackground := True;
    PopupMenu := Self.PopupMenu;
    ShowHiddenFiles := False;
    ShowSystemFiles := False;
    ShowArchiveFiles := True;
    TabOrder := 0;
    TabStop := True;
    OnDblClick := TabsheetDblClick;

    //OnKeyUp := VirtualDrawTreeKeyUp;
    {LStyles := StyleServices;
    if not LStyles.GetElementColor(LStyles.GetElementDetails(ttItemNormal), ecTextColor, LColor) or (LColor = clNone) then
      LColor := LStyles.GetSystemColor(clWindowText);
    Font.Color := LColor;
    Color := LStyles.GetStyleColor(scListView); }

  end;
  TStyleManager.Engine.RegisterStyleHook(TBaseVirtualTree {TBCFileTreeView}, TVirtualTreeStyleHook);
  //TStyleManager.Engine.RegisterStyleHook(TBCFileTreeView, TListBoxStyleHook);
  DriveComboBoxPanel := TPanel.Create(TabSheet);
  with DriveComboBoxPanel do
  begin
    Parent := TabSheet; //FileTreeViewPanel;
    Height := 24;
    Align := alBottom;
    BevelOuter := bvNone;
    //Padding.Top := 0;
    //Padding.Bottom := 0;
    Padding.Left := 1;
    //if TStyleManager.ActiveStyle.Name = 'Windows' then
      Padding.Right := 3;
    //else
    //  Padding.Right := 1;
    ParentBackground := True;
    //DoubleBuffered := False;
    ParentColor := True;
    //ParentDoubleBuffered := False;
    Tag := 99; { to find it }
  end;
  BCDriveComboBox := TBCDriveComboBox.Create(TabSheet);
  with BCDriveComboBox do
  begin
    Parent := DriveComboBoxPanel;
    Left := 0;
    //Top := 3;
    //Width := 446;
    Height := 21;
    Align := alClient;
    FileTreeView := BCFileTreeView;
    Drive := 'C';
    TabOrder := 1;
    OnChange := DriveComboChange;
  end;
  DriveComboBoxPanel.Visible := ShowDrives;

  PageControl.Images := BCDriveComboBox.SystemIconsImageList; //TImageList.Create(Self);
  //PageControl.Images.Handle := SHGetFileInfo('', 0, SHFileInfo, SizeOf(SHFileInfo), SHGFI_ICON or SHGFI_SYSICONINDEX or SHGFI_SMALLICON
  //  {or SHGFI_ADDOVERLAYS or SHGFI_OVERLAYINDEX});
  TabSheet.ImageIndex := BCDriveComboBox.IconIndex;
  //PageControl.ActivePage.ImageIndex := BCDriveComboBox.IconIndex;
  PageControl.ActivePage.Caption := TabName; // BCDriveComboBox.Drive + ':\';

  OpenPath(RootDirectory, LastPath, ExcludeOtherBranches);
  FileTreeViewPanel.Visible := True;
  TabSheet.Visible := True;
//  PageControl.ActivePage := TabSheet;
end;

function TDirectoryFrame.GetIsAnyDirectory: Boolean;
begin
  Result := False;
  if Assigned(PageControl) then
    Result := PageControl.PageCount <> 0;
end;

procedure TDirectoryFrame.UpdateControls;
var
  i, j: Integer;
begin
  //LStyles := StyleServices;
  PageControl.DoubleBuffered := TStyleManager.ActiveStyle.Name = 'Windows';
  {if LStyles.Enabled then }
    for i := 0 to PageControl.PageCount - 1 do
      for j := 0 to PageControl.Pages[i].ComponentCount - 1 do
        if PageControl.Pages[i].Components[j] is TPanel then
        begin
          if TStyleManager.ActiveStyle.Name = 'Windows' then
            TPanel(PageControl.Pages[i].Components[j]).Padding.Right := 3
          else
            TPanel(PageControl.Pages[i].Components[j]).Padding.Right := 1;
          //TBCFileTreeView(PageControl.Pages[i].Components[j]).Colors.TreeLineColor := LStyles.GetStyleFontColor(sfEditBoxTextNormal);
        end;

        //Colors.UnfocusedSelectionColor := LStyles.GetSystemColor(clHighlight);
      //Colors.SelectionTextColor := LStyles.GetSystemColor(clHighlightText);
end;

//initialization

 // TStyleManager.Engine.RegisterStyleHook(TBCFileTreeView, TListBoxStyleHook);


end.
