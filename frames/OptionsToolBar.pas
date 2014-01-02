unit OptionsToolBar;

interface

uses
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, BCControls.CheckBox,
  BCCommon.OptionsContainer, BCFrames.OptionsFrame, Vcl.ComCtrls, BCCommon.Images;

type
  TOptionsToolBarFrame = class(TOptionsFrame)
    Panel: TPanel;
    ListView1: TListView;
    ButtonPanel: TPanel;
  private
    { Private declarations }
  public
    { Public declarations }
    destructor Destroy; override;
    procedure GetData; override;
    procedure PutData; override;
  end;

function OptionsToolBarFrame(AOwner: TComponent): TOptionsToolBarFrame;

implementation

{$R *.dfm}

var
  FOptionsToolBarFrame: TOptionsToolBarFrame;

function OptionsToolBarFrame(AOwner: TComponent): TOptionsToolBarFrame;
begin
  if not Assigned(FOptionsToolBarFrame) then
    FOptionsToolBarFrame := TOptionsToolBarFrame.Create(AOwner);
  Result := FOptionsToolBarFrame;
end;

destructor TOptionsToolBarFrame.Destroy;
begin
  inherited;
  FOptionsToolBarFrame := nil;
end;

procedure TOptionsToolBarFrame.GetData;
begin

end;

procedure TOptionsToolBarFrame.PutData;
begin
  
end;

end.
