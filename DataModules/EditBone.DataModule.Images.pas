unit EditBone.DataModule.Images;

interface

uses
  System.SysUtils, System.Classes, System.ImageList, Vcl.ImgList, Vcl.Controls, acAlphaImageList, BCControls.ImageList;

type
  TEBDataModuleImages = class(TDataModule)
    ImageListDocument16: TBCImageList;
    ImageListDocument20: TBCImageList;
    ImageListDocument24: TBCImageList;
    ImageListXMLTree: TBCImageList;
    ImageListStatusBar: TsAlphaImageList;
    ImageListDirectory16: TBCImageList;
    ImageListDirectory20: TBCImageList;
    ImageListDirectory24: TBCImageList;
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
