unit DirectoryTabSheet;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, VirtualTrees, BCControls.BCFileControl,
  Vcl.StdCtrls;

type
  TDirTabSheetFrame = class(TFrame)
    DriveComboBox: TBCDriveComboBox;
    DriveComboBoxPanel: TPanel;
    FileTreeView: TBCFileTreeView;
    FileTreeViewPanel: TPanel;
    Panel: TPanel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
