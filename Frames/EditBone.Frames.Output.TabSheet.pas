unit EditBone.Frames.Output.TabSheet;

interface

uses
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VirtualTrees, Vcl.ExtCtrls, BCControls.Panel,
  sPanel, sFrameAdapter;

type
  TOutputTabSheetFrame = class(TFrame)
    FrameAdapter: TsFrameAdapter;
    Panel: TBCPanel;
    VirtualDrawTree: TVirtualDrawTree;
    procedure VirtualDrawTreeInitNode(Sender: TBaseVirtualTree; ParentNode, Node: PVirtualNode;
      var InitialStates: TVirtualNodeInitStates);
  end;

implementation

{$R *.dfm}

uses
  BCCommon.Options.Container, EditBone.Types;

procedure TOutputTabSheetFrame.VirtualDrawTreeInitNode(Sender: TBaseVirtualTree; ParentNode, Node: PVirtualNode;
  var InitialStates: TVirtualNodeInitStates);
var
  Data: POutputRec;
begin
  with Sender do
  if OptionsContainer.OutputShowCheckBox then
  begin
    if GetNodeLevel(Node) = 0 then
    begin
      Data := Sender.GetNodeData(Node);
      if Data.Level <> 2 then
      begin
        CheckType[Node] := ctCheckBox;
        CheckState[Node] := csCheckedNormal;
      end;
    end
  end
  else
    CheckType[Node] := ctNone;
end;

end.
