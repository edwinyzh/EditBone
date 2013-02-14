unit DocumentTabSheet;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, VirtualTrees, SynEdit, BCSynEdit;

type
  TTabSheetFrame = class(TFrame)
    Panel: TPanel;
    VirtualDrawTree: TVirtualDrawTree;
    VerticalSplitter: TSplitter;
    DocumentPanel: TPanel;
    SynEdit: TBCSynEdit;
    SplitSynEdit: TBCSynEdit;
    HorizontalSplitter: TSplitter;
  private
    { Private declarations }
    function GetXMLTreeVisible: Boolean;
    procedure SetXMLTreeVisible(Value: Boolean);
    function GetSplitVisible: Boolean;
    procedure SetSplitVisible(Value: Boolean);
  public
    { Public declarations }
    property XMLTreeVisible: Boolean read GetXMLTreeVisible write SetXMLTreeVisible;
    property SplitVisible: Boolean read GetSplitVisible write SetSplitVisible;
  end;

implementation

{$R *.dfm}

function TTabSheetFrame.GetXMLTreeVisible: Boolean;
begin
  Result := VirtualDrawTree.Visible;
end;

procedure TTabSheetFrame.SetXMLTreeVisible(Value: Boolean);
begin
  VirtualDrawTree.Visible := Value;
  VerticalSplitter.Visible := Value;
end;

function TTabSheetFrame.GetSplitVisible: Boolean;
begin
  Result := VirtualDrawTree.Visible;
end;

procedure TTabSheetFrame.SetSplitVisible(Value: Boolean);
begin
  SplitSynEdit.Visible := Value;
  HorizontalSplitter.Visible := Value;
end;

end.
