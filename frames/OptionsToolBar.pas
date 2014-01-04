unit OptionsToolBar;

interface

uses
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, BCControls.CheckBox,
  BCCommon.OptionsContainer, BCFrames.OptionsFrame, Vcl.ComCtrls, BCCommon.Images, Vcl.ImgList, BCControls.ImageList,
  Vcl.ToolWin, BCControls.ToolBar, System.Actions, Vcl.ActnList, Vcl.ActnMan;

type
  TOptionsToolBarFrame = class(TOptionsFrame)
    Panel: TPanel;
    ListView: TListView;
    ButtonPanel: TPanel;
    ColumnsToolBar: TBCToolBar;
    MoveUpToolButton: TToolButton;
    MoveDownToolButton: TToolButton;
    ImageList: TBCImageList;
    DividerBevel: TBevel;
    ActionList: TActionList;
    MoveUpAction: TAction;
    MoveDownAction: TAction;
    AddItemAction: TAction;
    DeleteItemAction: TAction;
    AddDividerAction: TAction;
    BCToolBar1: TBCToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
  private
    { Private declarations }
    FActionManager: TActionManager;
  public
    { Public declarations }
    destructor Destroy; override;
    procedure GetData; override;
    procedure PutData; override;
    property ActionManager: TActionManager read FActionManager write FActionManager;
  end;

function OptionsToolBarFrame(AOwner: TComponent; ActionManager: TActionManager): TOptionsToolBarFrame;

implementation

{$R *.dfm}

var
  FOptionsToolBarFrame: TOptionsToolBarFrame;

function OptionsToolBarFrame(AOwner: TComponent; ActionManager: TActionManager): TOptionsToolBarFrame;
begin
  if not Assigned(FOptionsToolBarFrame) then
    FOptionsToolBarFrame := TOptionsToolBarFrame.Create(AOwner);
  FOptionsToolBarFrame.ActionManager := ActionManager;
  FOptionsToolBarFrame.ListView.SmallImages := ImagesDataModule.ImageList; { IDE can lose this }
  Result := FOptionsToolBarFrame;
end;

destructor TOptionsToolBarFrame.Destroy;
begin
  inherited;
  FOptionsToolBarFrame := nil;
end;

procedure TOptionsToolBarFrame.GetData;
begin
  { read from ini }

end;

procedure TOptionsToolBarFrame.PutData;
begin
  { write to ini }

end;

end.
