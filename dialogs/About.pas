unit About;

interface

uses
  System.SysUtils, Winapi.Windows, Winapi.Messages, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, Dlg;

type
  TAboutDialog = class(TDialog)
    Panel1: TPanel;
    Panel2: TPanel;
    OhjelmanNimiLabel: TLabel;
    VersionLabel: TLabel;
    OSLabel: TLabel;
    MemoryAvailableLabel: TLabel;
    Panel3: TPanel;
    LinkLabel3: TLinkLabel;
    CodeGearLinkLabel: TLinkLabel;
    ThanksToLabel: TLabel;
    Panel4: TPanel;
    OKButton: TButton;
    Panel6: TPanel;
    KayttovaltuusImage: TImage;
    CopyrightLabel: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure LinkClick(Sender: TObject; const Link: string;
      LinkType: TSysLinkType);
    procedure FormShow(Sender: TObject);
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
  StyleHooks, Common;

var
  FAboutDialog: TAboutDialog;

function AboutDialog: TAboutDialog;
begin
  if FAboutDialog = nil then
    Application.CreateForm(TAboutDialog, FAboutDialog);
  Result := FAboutDialog;
  StyleHooks.SetStyledFormSize(Result);
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
  VersionLabel.Caption := Format(VersionLabel.Caption, [Common.GetFileVersion(Application.ExeName)]);
  CopyrightLabel.Caption := Format(CopyrightLabel.Caption, ['© 2010-2012 Lasse Rautiainen']);
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
  Result := Common.GetFileVersion(Application.ExeName);
end;

end.
