object DocumentXMLTreeFrame: TDocumentXMLTreeFrame
  Left = 0
  Top = 0
  Width = 451
  Height = 304
  Align = alClient
  Color = clWindow
  ParentBackground = False
  ParentColor = False
  TabOrder = 0
  object VirtualDrawTree: TVirtualDrawTree
    Left = 0
    Top = 0
    Width = 451
    Height = 304
    Align = alClient
    DragOperations = []
    Header.AutoSizeIndex = 0
    Header.Font.Charset = DEFAULT_CHARSET
    Header.Font.Color = clWindowText
    Header.Font.Height = -11
    Header.Font.Name = 'Tahoma'
    Header.Font.Style = []
    Header.MainColumn = -1
    TabOrder = 0
    OnClick = VirtualDrawTreeClick
    OnDrawNode = VirtualDrawTreeDrawNode
    OnFreeNode = VirtualDrawTreeFreeNode
    OnGetImageIndex = VirtualDrawTreeGetImageIndex
    OnGetNodeWidth = VirtualDrawTreeGetNodeWidth
    OnInitNode = VirtualDrawTreeInitNode
    Columns = <>
  end
  object XMLDocument: TXMLDocument
    Left = 150
    Top = 60
    DOMVendorDesc = 'MSXML'
  end
  object FrameAdapter: TsFrameAdapter
    SkinData.SkinSection = 'CHECKBOX'
    Left = 198
    Top = 124
  end
end
