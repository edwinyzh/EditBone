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
    procedure VirtualDrawTreeInitNode(Sender: TBaseVirtualTree; ParentNode, Node: PVirtualNode;
      var InitialStates: TVirtualNodeInitStates);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses
  BCCommon.OptionsContainer;

procedure TOutputTabSheetFrame.VirtualDrawTreeGetImageIndex(Sender: TBaseVirtualTree; Node: PVirtualNode;
  Kind: TVTImageKind; Column: TColumnIndex; var Ghosted: Boolean; var ImageIndex: Integer);
begin
  ImageIndex := 8;
end;

procedure TOutputTabSheetFrame.VirtualDrawTreeInitNode(Sender: TBaseVirtualTree; ParentNode, Node: PVirtualNode;
  var InitialStates: TVirtualNodeInitStates);
begin
  with Sender do
  if OptionsContainer.OutputShowCheckBox then
  begin
    if GetNodeLevel(Node) = 0 then
    begin
      CheckType[Node] := ctCheckBox;
      CheckState[Node] := csCheckedNormal;
    end
  end
  else
    CheckType[Node] := ctNone;
end;

end.
