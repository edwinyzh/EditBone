unit VirtualDrive;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, BCDialogs.Dlg,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, BCControls.ComboBox, BCControls.Edit, JvExControls, JvSpeedButton,
  Vcl.ExtCtrls;

type
  TVirtualDriveDialog = class(TDialog)
    ButtonPanel: TPanel;
    OKButton: TButton;
    CancelButton: TButton;
    ButtonDividerPanel: TPanel;
    TopPanel: TPanel;
    RootDirectoryPanel: TPanel;
    RootDirectoryLabel: TLabel;
    RootDrectoryBitBtn: TJvSpeedButton;
    RootDirectoryEdit: TBCEdit;
    ShowDrivesPanel: TPanel;
    ShowDrivesLabel: TLabel;
    ShowDrivesComboBox: TBCComboBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  VirtualDriveDialog: TVirtualDriveDialog;

implementation

{$R *.dfm}

end.
