unit OutputTabSheet;

interface

uses
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VirtualTrees, Vcl.ExtCtrls;

type
  TOutputTabSheetFrame = class(TFrame)
    Panel: TPanel;
    VirtualDrawTree: TVirtualDrawTree;
    procedure VirtualDrawTreeGetImageIndex(Sender: TBaseVirtualTree; Node: PVirtualNode; Kind: TVTImageKind;
      Column: TColumnIndex; var Ghosted: Boolean; var ImageIndex: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TOutputTabSheetFrame.VirtualDrawTreeGetImageIndex(Sender: TBaseVirtualTree; Node: PVirtualNode;
  Kind: TVTImageKind; Column: TColumnIndex; var Ghosted: Boolean; var ImageIndex: Integer);
begin
  ImageIndex := 8;
end;

end.
