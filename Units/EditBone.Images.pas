unit EditBone.Images;

interface

uses
  System.SysUtils, System.Classes, System.ImageList, Vcl.ImgList, Vcl.Controls, acAlphaImageList, BCControls.ImageList;

type
  TDataModuleImages = class(TDataModule)
    ImageList16: TBCImageList;
    ImageList20: TBCImageList;
    ImageList24: TBCImageList;
    ImageListXMLTree: TBCImageList;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModuleImages: TDataModuleImages;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
