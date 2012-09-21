unit About;

interface

uses
  System.SysUtils, Winapi.Windows, Winapi.Messages, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage;

type
  TAboutDialog = class(TForm)
    OKButton: TButton;
    Panel1: TPanel;
    KayttovaltuusImage: TImage;
    OhjelmanNimiLabel: TLabel;
    VersionLabel: TLabel;
    OSLabel: TLabel;
    MemoryAvailableLabel: TLabel;
    CopyrightLabel: TLabel;
    BoneCodeLinkLabel: TLinkLabel;
    ThanksToLabel: TLabel;
    CodeGearLinkLabel: TLinkLabel;
    LinkLabel3: TLinkLabel;
    Panel2: TPanel;
    LinkLabel1: TLinkLabel;
    AndLabel: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure LinkClick(Sender: TObject; const Link: string;
      LinkType: TSysLinkType);
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
  Common;

var
  FAboutDialog: TAboutDialog;

function AboutDialog: TAboutDialog;
begin
  if FAboutDialog = nil then
    Application.CreateForm(TAboutDialog, FAboutDialog);
  Result := FAboutDialog;
  Common.SetStyledFormSize(Result, 386, 288);
end;

procedure TAboutDialog.Open;
var
  MemoryStatus: TMemoryStatusEx;
begin
  VersionLabel.Caption := Format(VersionLabel.Caption, [Common.GetFileVersion(Application.ExeName)]);
  { initialize the structure }
  FillChar(MemoryStatus, SizeOf(MemoryStatus), 0);
  MemoryStatus.dwLength := SizeOf(MemoryStatus);
  { check return code for errors }
  {$WARNINGS OFF}
  Win32Check(GlobalMemoryStatusEx(MemoryStatus));
  {$WARNINGS ON}
  OSLabel.Caption := GetOSInfo;
  MemoryAvailableLabel.Caption := Format(MemoryAvailableLabel.Caption, [FormatFloat('#,###" KB"', MemoryStatus.ullAvailPhys  div 1024)]);
  ShowModal;
end;

procedure TAboutDialog.LinkClick(Sender: TObject;
  const Link: string; LinkType: TSysLinkType);
begin
  BrowseURL(Link);
end;

procedure TAboutDialog.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TAboutDialog.FormDestroy(Sender: TObject);
begin
  FAboutDialog := nil
end;

function TAboutDialog.GetVersion: string;
begin
  Result := Common.GetFileVersion(Application.ExeName);
end;

end.
