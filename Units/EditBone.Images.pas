unit EditBone.Images;

interface

uses
  System.SysUtils, System.Classes, System.ImageList, Vcl.ImgList, Vcl.Controls, acAlphaImageList, BCControls.ImageList;

type
  TEBDataModuleImages = class(TDataModule)
    ImageList16: TBCImageList;
    ImageList20: TBCImageList;
    ImageList24: TBCImageList;
    ImageListXMLTree: TBCImageList;
    ImageListStatusBar: TsAlphaImageList;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EBDataModuleImages: TEBDataModuleImages;

implementation

uses
  Forms;

{$R *.dfm}

initialization

  Application.CreateForm(TEBDataModuleImages, EBDataModuleImages);

end.
