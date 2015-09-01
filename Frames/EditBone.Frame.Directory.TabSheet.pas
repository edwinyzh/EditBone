unit EditBone.Frame.Directory.TabSheet;

interface

uses
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, VirtualTrees,
  BCControls.FileControl, Vcl.StdCtrls, BCControls.Panel, sFrameAdapter, sPanel, sComboBox;

type
  TDirTabSheetFrame = class(TFrame)
    Panel: TBCPanel;
    FileTreeView: TBCFileTreeView;
    DriveComboBox: TBCDriveComboBox;
    FileTypeComboBox: TBCFileTypeComboBox;
    FrameAdapter: TsFrameAdapter;
  end;

implementation

{$R *.dfm}

end.
