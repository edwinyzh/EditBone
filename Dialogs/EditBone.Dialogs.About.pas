unit EditBone.Dialogs.About;

interface

uses
  System.SysUtils, Winapi.Windows, System.Classes, Vcl.Graphics, Vcl.Forms, Vcl.Controls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, BCCommon.Dialogs.Base, BCControls.Panel, sPanel, BCControls.GroupLabel, sLabel,
  acImage, BCControls.Labels;

type
  TAboutDialog = class(TBCBaseDialog)
    ButtonDonations: TButton;
    ButtonOK: TButton;
    LabelDevelopmentEnvironment: TBCLabel;
    LabelIcons: TBCLabel;
    LabelLanguageFileContributors: TBCLabel;
    LabelThirdPartyComponents: TBCLabel;
    HTMLLabel3rdPartyComponents: TsHTMLLabel;
    HTMLLabelDevelopmentEnvironment: TsHTMLLabel;
    HTMLLabelIcons: TsHTMLLabel;
    HTMLLabelLanguageFileContributors: TsHTMLLabel;
    ImageEditBone: TsImage;
    LabelCopyright: TLabel;
    LabelMemoryAvailable: TLabel;
    LabelOperatingSystem: TLabel;
    LabelProgramName: TLabel;
    LabelVersion: TLabel;
    Panel3rdPartyComponents: TBCPanel;
    PanelButtons: TBCPanel;
    PanelDevelopmentEnvironment: TBCPanel;
    PanelIcons: TBCPanel;
    PanelLanguageFileContributors: TBCPanel;
    PanelThanksTo: TBCPanel;
    PanelTop: TBCPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LinkClick(Sender: TObject; const Link: string; LinkType: TSysLinkType);
    procedure ButtonDonationsClick(Sender: TObject);
  private
    procedure Initialize;
  public
    class procedure ClassShowModal(AOwner: TComponent);
  end;

implementation

{$R *.dfm}

uses
  BCCommon.Utils, BCCommon.Consts, BCCommon.FileUtils;

class procedure TAboutDialog.ClassShowModal(AOwner: TComponent);
begin
  with TAboutDialog.Create(AOwner) do
  try
    Initialize;
    ShowModal;
  finally
    Free;
  end;
end;

procedure TAboutDialog.LinkClick(Sender: TObject;
  const Link: string; LinkType: TSysLinkType);
begin
  BrowseURL(Link);
end;

procedure TAboutDialog.ButtonDonationsClick(Sender: TObject);
begin
  inherited;
  BrowseURL(DONATION_URL);
end;

procedure TAboutDialog.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TAboutDialog.Initialize;
var
  MemoryStatus: TMemoryStatusEx;
begin
  inherited;
  try
    LabelVersion.Caption := Format(LabelVersion.Caption, [BCCommon.FileUtils.GetFileVersion(Application.ExeName),
      {$IFDEF WIN64}64{$ELSE}32{$ENDIF}]);
  except
    { silent }
  end;
  LabelCopyright.Caption := Format(LabelCopyright.Caption, ['© 2010-2015 Lasse Rautiainen']);
  if Width - LabelCopyright.Left - LabelCopyright.Width < 0 then
    Width := LabelCopyright.Left + LabelCopyright.Width + 20;
  { initialize the structure }
  FillChar(MemoryStatus, SizeOf(MemoryStatus), 0);
  MemoryStatus.dwLength := SizeOf(MemoryStatus);
  { check return code for errors }
  {$WARNINGS OFF}
  Win32Check(GlobalMemoryStatusEx(MemoryStatus));
  {$WARNINGS ON}
  LabelOperatingSystem.Caption := GetOSInfo;
  LabelMemoryAvailable.Caption := Format(LabelMemoryAvailable.Caption, [FormatFloat('#,###" KB"', MemoryStatus.ullAvailPhys  div 1024)]);
end;

end.
