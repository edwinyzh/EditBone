unit About;

interface

uses
  System.SysUtils, Winapi.Windows, System.Classes, Vcl.Graphics, Vcl.Forms, Vcl.Controls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, BCDialogs.Dlg;

type
  TAboutDialog = class(TDialog)
    BottomPanel: TPanel;
    EditBoneImage: TImage;
    ImagePanel: TPanel;
    MemoryAvailableLabel: TLabel;
    OKButton: TButton;
    OSLabel: TLabel;
    ProgramNameLabel: TLabel;
    SeparatorPanel: TPanel;
    LinkRow2Label: TLinkLabel;
    LinkRow3Label: TLinkLabel;
    ThirdPartyComponentsLabel: TLabel;
    ThanksToPanel: TPanel;
    TopPanel: TPanel;
    VersionLabel: TLabel;
    DonationsButton: TButton;
    CopyrightLabel: TLabel;
    IconsLabel: TLabel;
    LinkRow4Label: TLinkLabel;
    LanguageFileContributorsLabel: TLabel;
    DevelopmentEnvironmentLabel: TLabel;
    LinkRow1Label: TLinkLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure LinkClick(Sender: TObject; const Link: string; LinkType: TSysLinkType);
    procedure DonationsButtonClick(Sender: TObject);
  private
    function GetVersion: string;
  public
    procedure Open;
    property Version: string read GetVersion;
  end;

function AboutDialog: TAboutDialog;

implementation

{$R *.dfm}

uses
  BCCommon.Lib, BCCommon.StyleUtils, BCCommon.FileUtils;

var
  FAboutDialog: TAboutDialog;

function AboutDialog: TAboutDialog;
begin
  if not Assigned(FAboutDialog) then
    Application.CreateForm(TAboutDialog, FAboutDialog);
  Result := FAboutDialog;
  SetStyledFormSize(Result);
end;

procedure TAboutDialog.Open;
begin
  ShowModal;
end;

procedure TAboutDialog.LinkClick(Sender: TObject;
  const Link: string; LinkType: TSysLinkType);
begin
  BrowseURL(Link);
end;

procedure TAboutDialog.DonationsButtonClick(Sender: TObject);
begin
  inherited;
  BrowseURL(DONATION_URL);
end;

procedure TAboutDialog.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TAboutDialog.FormDestroy(Sender: TObject);
begin
  FAboutDialog := nil
end;

procedure TAboutDialog.FormShow(Sender: TObject);
var
  MemoryStatus: TMemoryStatusEx;
begin
  inherited;
  try
    VersionLabel.Caption := Format(VersionLabel.Caption, [BCCommon.FileUtils.GetFileVersion(Application.ExeName),
      {$IFDEF WIN64}64{$ELSE}32{$ENDIF}]);
  except
    { silent }
  end;
  CopyrightLabel.Caption := Format(CopyrightLabel.Caption, ['© 2010-2014 Lasse Rautiainen']);
  if Width - CopyrightLabel.Left - CopyrightLabel.Width < 0 then
    Width := CopyrightLabel.Left + CopyrightLabel.Width + 20;
  { initialize the structure }
  FillChar(MemoryStatus, SizeOf(MemoryStatus), 0);
  MemoryStatus.dwLength := SizeOf(MemoryStatus);
  { check return code for errors }
  {$WARNINGS OFF}
  Win32Check(GlobalMemoryStatusEx(MemoryStatus));
  {$WARNINGS ON}
  OSLabel.Caption := GetOSInfo;
  MemoryAvailableLabel.Caption := Format(MemoryAvailableLabel.Caption, [FormatFloat('#,###" KB"', MemoryStatus.ullAvailPhys  div 1024)]);
end;

function TAboutDialog.GetVersion: string;
begin
  Result := GetFileVersion(Application.ExeName);
end;

end.
