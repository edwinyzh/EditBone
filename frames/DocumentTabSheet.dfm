object TabSheetFrame: TTabSheetFrame
  Left = 0
  Top = 0
  Width = 618
  Height = 413
  TabOrder = 0
  object Panel: TPanel
    Left = 0
    Top = 0
    Width = 618
    Height = 413
    Align = alClient
    BevelOuter = bvNone
    Padding.Left = 1
    Padding.Top = 1
    Padding.Bottom = 2
    ParentColor = True
    TabOrder = 0
    object VerticalSplitter: TSplitter
      Left = 201
      Top = 1
      Height = 410
      Visible = False
      ExplicitLeft = 216
      ExplicitTop = 90
      ExplicitHeight = 100
    end
    object VirtualDrawTree: TVirtualDrawTree
      Left = 1
      Top = 1
      Width = 200
      Height = 410
      Align = alLeft
      BorderWidth = 1
      Header.AutoSizeIndex = 0
      Header.Font.Charset = DEFAULT_CHARSET
      Header.Font.Color = clWindowText
      Header.Font.Height = -11
      Header.Font.Name = 'Tahoma'
      Header.Font.Style = []
      Header.MainColumn = -1
      Images = ImageList
      TabOrder = 0
      Visible = False
      OnDrawNode = VirtualDrawTreeDrawNode
      OnFreeNode = VirtualDrawTreeFreeNode
      OnGetImageIndex = VirtualDrawTreeGetImageIndex
      OnGetNodeWidth = VirtualDrawTreeGetNodeWidth
      OnInitChildren = VirtualDrawTreeInitChildren
      OnInitNode = VirtualDrawTreeInitNode
      Columns = <>
    end
    object DocumentPanel: TPanel
      Left = 204
      Top = 1
      Width = 414
      Height = 410
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object HorizontalSplitter: TSplitter
        Left = 0
        Top = 229
        Width = 414
        Height = 3
        Cursor = crVSplit
        Align = alBottom
        Visible = False
        ExplicitTop = 0
        ExplicitWidth = 232
      end
      object SynEdit: TBCSynEdit
        Left = 0
        Top = 0
        Width = 414
        Height = 229
        Align = alClient
        ActiveLineColor = clSkyBlue
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        TabOrder = 0
        Gutter.AutoSize = True
        Gutter.Font.Charset = DEFAULT_CHARSET
        Gutter.Font.Color = clWindowText
        Gutter.Font.Height = -11
        Gutter.Font.Name = 'Courier New'
        Gutter.Font.Style = []
        Gutter.ShowLineNumbers = True
        Options = [eoAltSetsColumnMode, eoAutoIndent, eoDragDropEditing, eoEnhanceEndKey, eoGroupUndo, eoScrollPastEol, eoShowScrollHint, eoSmartTabDelete, eoSmartTabs, eoSpecialLineDefaultFg, eoTabsToSpaces, eoTrimTrailingSpaces]
        WantTabs = True
      end
      object SplitSynEdit: TBCSynEdit
        Left = 0
        Top = 232
        Width = 414
        Height = 178
        Align = alBottom
        ActiveLineColor = clSkyBlue
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        TabOrder = 1
        Visible = False
        Gutter.AutoSize = True
        Gutter.Font.Charset = DEFAULT_CHARSET
        Gutter.Font.Color = clWindowText
        Gutter.Font.Height = -11
        Gutter.Font.Name = 'Courier New'
        Gutter.Font.Style = []
        Gutter.ShowLineNumbers = True
        Options = [eoAltSetsColumnMode, eoAutoIndent, eoDragDropEditing, eoEnhanceEndKey, eoGroupUndo, eoScrollPastEol, eoShowScrollHint, eoSmartTabDelete, eoSmartTabs, eoSpecialLineDefaultFg, eoTabsToSpaces, eoTrimTrailingSpaces]
        WantTabs = True
      end
    end
  end
  object XMLDocument: TXMLDocument
    Left = 72
    Top = 18
    DOMVendorDesc = 'MSXML'
  end
  object ImageList: TImageList
    Left = 72
    Top = 70
    Bitmap = {
      494C010108001800180010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000079777900797779007977
      7900797779007977790079777900797779007977790079777900797779007977
      7900797779007977790079777900000000000000000079777900797779007977
      7900797779007977790079777900797779007977790079777900797779007977
      7900797779007977790079777900000000000000000079777900797779007977
      7900797779007977790079777900797779007977790079777900797779007977
      7900797779007977790079777900000000000000000079777900797779007977
      7900797779007977790079777900797779007977790079777900797779007977
      7900797779007977790079777900000000000000000084868400F7F3F700F7F3
      F700F7F3F700F7F3F700F7F3F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7FF00F7FBFF0084868400000000000000000084868400F7F3F700F7F3
      F700F7F3F700F7F3F700F7F3F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7FF00F7FBFF0084868400000000000000000084868400F7F3F700F7F3
      F700F7F3F700F7F3F700F7F3F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7FF00F7FBFF0084868400000000000000000084868400F7F3F700F7F3
      F700F7F3F700F7F3F700F7F3F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7FF00F7FBFF0084868400000000000000000094929400F7F3F700F7F3
      F700F7F3F700F7F3F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      FF00F7FBFF00FFFBFF0094929400000000000000000094929400F7F3F700F7F3
      F700F7F3F700F7F3F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      FF00F7FBFF00FFFBFF0094929400000000000000000094929400F7F3F700F7F3
      F700F7F3F700F7F3F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      FF00F7FBFF00FFFBFF0094929400000000000000000094929400F7F3F700F7F3
      F700F7F3F700F7F3F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      FF00F7FBFF00FFFBFF009492940000000000000000009C9E9C00F7F3F700F7F3
      F700AD9A9C00AD9A9C00AD9A9C00AD9A9C00AD9A9C00AD969C00AD969C00AD96
      9C00FFFBFF00FFFBFF009C9E9C0000000000000000009C9E9C00F7F3F700F7F3
      F700AD9A9C00AD9A9C00AD9A9C00AD9A9C00AD9A9C00AD969C00AD969C00AD96
      9C00FFFBFF00FFFBFF009C9E9C0000000000000000009C9E9C00F7F3F700F7F3
      F700AD9A9C00AD9A9C00AD9A9C00AD9A9C00AD9A9C00AD969C00AD969C00AD96
      9C00FFFBFF00FFFBFF009C9E9C0000000000000000009C9E9C00F7F3F700F7F3
      F700AD9A9C00AD9A9C00AD9A9C00AD9A9C00AD9A9C00AD969C00AD969C00AD96
      9C00FFFBFF00FFFBFF009C9E9C000000000000000000ADAEAD00F7F3F700F7F3
      F700F7F7F700F7F7F700F7F7F700F7F7FF00F7F7FF00F7F7FF00FFFBFF00FFFB
      FF00FFFBFF00FFFBFF00ADAEAD000000000000000000ADAEAD00F7F3F700F7F3
      F700F7F7F700F7F7F700F7F7F700F7F7FF00F7F7FF00F7F7FF00FFFBFF00FFFB
      FF00FFFBFF00FFFBFF00ADAEAD000000000000000000ADAEAD00F7F3F700F7F3
      F700F7F7F700F7F7F700F7F7F700F7F7FF00F7F7FF00F7F7FF00FFFBFF00FFFB
      FF00FFFBFF00FFFBFF00ADAEAD000000000000000000ADAEAD00F7F3F700F7F3
      F700F7F7F700F7F7F700F7F7F700F7F7FF00F7F7FF00F7F7FF00FFFBFF00FFFB
      FF00FFFBFF00FFFBFF00ADAEAD000000000000000000ADAEAD00F7F3F700F7F7
      F700AD9A9C00AD9A9C00AD9A9C00AD9A9C00AD9A9C00AD969C00AD969C00AD96
      9C00FFFBFF00FFFBFF00ADAEAD000000000000000000ADAEAD00F7F3F700F7F7
      F700AD9A9C00AD9A9C00AD9A9C00AD9A9C00AD9A9C00AD969C00AD969C00AD96
      9C00FFFBFF00FFFBFF00ADAEAD000000000000000000ADAEAD00F7F3F700F7F7
      F700AD9A9C00AD9A9C00AD9A9C00AD9A9C00AD9A9C00AD969C00AD969C00AD96
      9C00FFFBFF00FFFBFF00ADAEAD000000000000000000ADAEAD00F7F3F700F7F7
      F700AD9A9C00AD9A9C00AD9A9C00AD9A9C00AD9A9C00AD969C00AD969C00AD96
      9C00FFFBFF00FFFBFF00ADAEAD000000000000000000B5B2B500F7F7F700F7F7
      F700F7F7F700F7F7FF00F7FBFF00FFFBFF00FFFBFF00FFFBFF00FFFBFF00FFFB
      FF00FFFFFF00FFFFFF00B5B2B5000000000000000000B5B2B500F7F7F700F7F7
      F700F7F7F700F7F7FF00F7FBFF00FFFBFF00FFFBFF00FFFBFF00FFFBFF00FFFB
      FF00FFFFFF00FFFFFF00B5B2B5000000000000000000B5B2B500F7F7F700F7F7
      F700F7F7F700F7F7FF00F7FBFF00FFFBFF00FFFBFF00FFFBFF00FFFBFF00FFFB
      FF00FFFFFF00FFFFFF00B5B2B5000000000000000000B5B2B500F7F7F700F7F7
      F700F7F7F700F7F7FF00F7FBFF00FFFBFF00FFFBFF00FFFBFF00FFFBFF00FFFB
      FF00FFFFFF00FFFFFF00B5B2B5000000000000000000B5B2B500F7F7F700F7F7
      F700F7F7FF00F7FBFF00FFFBFF00FFFBFF00FFFBFF00FFFBFF00FFFBFF00FFFF
      FF00FFFFFF00FFFFFF00B5B2B5000000000000000000B5B2B500F7F7F700F7F7
      F700F7F7FF00F7FBFF00FFFBFF00FFFBFF00FFFBFF00FFFBFF00FFFBFF00FFFF
      FF00FFFFFF00FFFFFF00B5B2B5000000000000000000B5B2B500F7F7F700F7F7
      F700F7F7FF00F7FBFF00FFFBFF00FFFBFF00FFFBFF00FFFBFF00FFFBFF00FFFF
      FF00FFFFFF00FFFFFF00B5B2B5000000000000000000B5B2B500F7F7F700F7F7
      F700F7F7FF00F7FBFF00FFFBFF00FFFBFF00FFFBFF00FFFBFF00FFFBFF00FFFF
      FF00FFFFFF00FFFFFF00B5B2B5000000000000000000B5B6B500F7F7F700D6D3
      D600796F7100FFFBFF00DEB6B50050921F00619A1600BD928C00FFFFFF00796F
      7100E7E3E700FFFFFF00B5B6B5000000000000000000B5B6B500F7F7F700D6D3
      D600796F7100FFFBFF00DEB6B50050921F00619A1600BD928C00FFFFFF00796F
      7100E7E3E700FFFFFF00B5B6B5000000000000000000B5B6B500F7F7F700D6D3
      D600796F7100FFFBFF00DEB6B50050921F00619A1600BD928C00FFFFFF00796F
      7100E7E3E700FFFFFF00B5B6B5000000000000000000B5B6B500F7F7F700D6D3
      D600796F7100FFFBFF00DEB6B50050921F00619A1600BD928C00FFFFFF00796F
      7100E7E3E700FFFFFF00B5B6B5000000000000000000BDBABD00EFEBEF00796F
      7100FFFBFF00FFFBFF00AD5F3700B5AE2700C6AE4000796F2700FFFFFF00FFFF
      FF00796F7100F7F3F700BDBABD000000000000000000BDBABD00EFEBEF00796F
      7100FFFBFF00FFFBFF00AD5F3700B5AE2700C6AE4000796F2700FFFFFF00FFFF
      FF00796F7100F7F3F700BDBABD000000000000000000BDBABD00EFEBEF00796F
      7100FFFBFF00FFFBFF00AD5F3700B5AE2700C6AE4000796F2700FFFFFF00FFFF
      FF00796F7100F7F3F700BDBABD000000000000000000BDBABD00EFEBEF00796F
      7100FFFBFF00FFFBFF00AD5F3700B5AE2700C6AE4000796F2700FFFFFF00FFFF
      FF00796F7100F7F3F700BDBABD000000000000000000BDBABD00F7FBFF00D6D3
      D600796F7100FFFBFF00849E6100BDE38400F7C7610071A64800FFFFFF00796F
      7100DED7DE00FFFFFF00BDBABD000000000000000000BDBABD00F7FBFF00D6D3
      D600796F7100FFFBFF00849E6100BDE38400F7C7610071A64800FFFFFF00796F
      7100DED7DE00FFFFFF00BDBABD000000000000000000BDBABD00F7FBFF00D6D3
      D600796F7100FFFBFF00849E6100BDE38400F7C7610071A64800FFFFFF00796F
      7100DED7DE00FFFFFF00BDBABD000000000000000000BDBABD00F7FBFF00D6D3
      D600796F7100FFFBFF00849E6100BDE38400F7C7610071A64800FFFFFF00796F
      7100DED7DE00FFFFFF00BDBABD000000000000000000BDBEBD00FFFBFF00FFFB
      FF00FFFBFF00FFFBFF00E7E3D6009CBA7900C69A6100D6BEB500FFFFFF00FFFF
      FF00E7E7E700DEDFE700BDBABD000000000000000000BDBEBD00FFFBFF00FFFB
      FF00FFFBFF00FFFBFF00E7E3D6009CBA7900C69A6100D6BEB500FFFFFF00FFFF
      FF00E7E7E700DEDFE700BDBABD000000000000000000BDBEBD00FFFBFF00FFFB
      FF00FFFBFF00FFFBFF00E7E3D6009CBA7900C69A6100D6BEB500FFFFFF00FFFF
      FF00E7E7E700DEDFE700BDBABD000000000000000000BDBEBD00FFFBFF00FFFB
      FF00FFFBFF00FFFBFF00E7E3D6009CBA7900C69A6100D6BEB500FFFFFF00FFFF
      FF00E7E7E700DEDFE700BDBABD000000000000000000BDBEBD00FFFBFF00FFFB
      FF00FFFBFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BDBA
      BD00BDBABD00BDBABD00BDBABD000000000000000000BDBEBD00FFFBFF00FFFB
      FF00FFFBFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BDBA
      BD00BDBABD00BDBABD00BDBABD000000000000000000BDBEBD00FFFBFF00FFFB
      FF00FFFBFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BDBA
      BD00BDBABD00BDBABD00BDBABD000000000000000000BDBEBD00FFFBFF00FFFB
      FF00FFFBFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BDBA
      BD00BDBABD00BDBABD00BDBABD000000000000000000BDBEBD00FFFBFF00FFFB
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C7
      C600F7F7F700BDBABD00000000000000000000000000BDBEBD00FFFBFF00FFFB
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C7
      C600F7F7F700BDBABD00000000000000000000000000BDBEBD00FFFBFF00FFFB
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C7
      C600F7F7F700BDBABD00000000000000000000000000BDBEBD00FFFBFF00FFFB
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C7
      C600F7F7F700BDBABD00000000000000000000000000C6C3C600FFFBFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CECB
      CE00BDBABD0000000000000000000000000000000000C6C3C600FFFBFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CECB
      CE00BDBABD0000000000000000000000000000000000C6C3C600FFFBFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CECB
      CE00BDBABD0000000000000000000000000000000000C6C3C600FFFBFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CECB
      CE00BDBABD0000000000000000000000000000000000C6C3C600C6C3C600C6C3
      C600C6C3C600C6C3C600C6C3C600C6C3C600C6C3C600C6C3C600C6C3C600BDBE
      BD000000000000000000000000000000000000000000C6C3C600C6C3C600C6C3
      C600C6C3C600C6C3C600C6C3C600C6C3C600C6C3C600C6C3C600C6C3C600BDBE
      BD000000000000000000000000000000000000000000C6C3C600C6C3C600C6C3
      C600C6C3C600C6C3C600C6C3C600C6C3C600C6C3C600C6C3C600C6C3C600BDBE
      BD000000000000000000000000000000000000000000C6C3C600C6C3C600C6C3
      C600C6C3C600C6C3C600C6C3C600C6C3C600C6C3C600C6C3C600C6C3C600BDBE
      BD00000000000000000000000000000000000000000079777900797779007977
      7900797779007977790079777900797779007977790079777900797779007977
      7900797779007977790079777900000000000000000079777900797779007977
      7900797779007977790079777900797779007977790079777900797779007977
      7900797779007977790079777900000000000000000079777900797779007977
      7900797779007977790079777900797779007977790079777900797779007977
      7900797779007977790079777900000000000000000079777900797779007977
      7900797779007977790079777900797779007977790079777900797779007977
      7900797779007977790079777900000000000000000084868400F7F3F700F7F3
      F700F7F3F700F7F3F700F7F3F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7FF00F7FBFF0084868400000000000000000084868400F7F3F700F7F3
      F700F7F3F700F7F3F700F7F3F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7FF00F7FBFF0084868400000000000000000084868400F7F3F700F7F3
      F700F7F3F700F7F3F700F7F3F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7FF00F7FBFF0084868400000000000000000084868400F7F3F700F7F3
      F700F7F3F700F7F3F700F7F3F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7FF00F7FBFF0084868400000000000000000094929400F7F3F700F7F3
      F700F7F3F700F7F3F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      FF00F7FBFF00FFFBFF0094929400000000000000000094929400F7F3F700F7F3
      F700F7F3F700F7F3F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      FF00F7FBFF00FFFBFF0094929400000000000000000094929400F7F3F700F7F3
      F700F7F3F700F7F3F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      FF00F7FBFF00FFFBFF0094929400000000000000000094929400F7F3F700F7F3
      F700F7F3F700F7F3F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      FF00F7FBFF00FFFBFF009492940000000000000000009C9E9C00F7F3F700F7F3
      F700AD9A9C00AD9A9C00AD9A9C00AD9A9C00AD9A9C00AD969C00AD969C00AD96
      9C00FFFBFF00FFFBFF009C9E9C0000000000000000009C9E9C00F7F3F700F7F3
      F700AD9A9C00AD9A9C00AD9A9C00AD9A9C00AD9A9C00AD969C00AD969C00AD96
      9C00FFFBFF00FFFBFF009C9E9C0000000000000000009C9E9C00F7F3F700F7F3
      F700AD9A9C00AD9A9C00AD9A9C00AD9A9C00AD9A9C00AD969C00AD969C00AD96
      9C00FFFBFF00FFFBFF009C9E9C0000000000000000009C9E9C00F7F3F700F7F3
      F700AD9A9C00AD9A9C00AD9A9C00AD9A9C00AD9A9C00AD969C00AD969C00AD96
      9C00FFFBFF00FFFBFF009C9E9C000000000000000000ADAEAD00F7F3F700F7F3
      F700F7F7F700F7F7F700F7F7F700F7F7FF00F7F7FF00F7F7FF00FFFBFF00FFFB
      FF00FFFBFF00FFFBFF00ADAEAD000000000000000000ADAEAD00F7F3F700F7F3
      F700F7F7F700F7F7F700F7F7F700F7F7FF00F7F7FF00F7F7FF00FFFBFF00FFFB
      FF00FFFBFF00FFFBFF00ADAEAD000000000000000000ADAEAD00F7F3F700F7F3
      F700F7F7F700F7F7F700F7F7F700F7F7FF00F7F7FF00F7F7FF00FFFBFF00FFFB
      FF00FFFBFF00FFFBFF00ADAEAD000000000000000000ADAEAD00F7F3F700F7F3
      F700F7F7F700F7F7F700F7F7F700F7F7FF00F7F7FF00F7F7FF00FFFBFF00FFFB
      FF00FFFBFF00FFFBFF00ADAEAD000000000000000000ADAEAD00F7F3F700F7F7
      F700AD9A9C00AD9A9C00AD9A9C00AD9A9C00AD9A9C00AD969C00AD969C00AD96
      9C00FFFBFF00FFFBFF00ADAEAD000000000000000000ADAEAD00F7F3F700F7F7
      F700AD9A9C00AD9A9C00AD9A9C00AD9A9C00AD9A9C00AD969C00AD969C00AD96
      9C00FFFBFF00FFFBFF00ADAEAD000000000000000000ADAEAD00F7F3F700F7F7
      F700AD9A9C00AD9A9C00AD9A9C00AD9A9C00AD9A9C00AD969C00AD969C00AD96
      9C00FFFBFF00FFFBFF00ADAEAD000000000000000000ADAEAD00F7F3F700F7F7
      F700AD9A9C00AD9A9C00AD9A9C00AD9A9C00AD9A9C00AD969C00AD969C00AD96
      9C00FFFBFF00FFFBFF00ADAEAD000000000000000000B5B2B500F7F7F700F7F7
      F700F7F7F700F7F7FF00F7FBFF00FFFBFF00FFFBFF00FFFBFF00FFFBFF00FFFB
      FF00FFFFFF00FFFFFF00B5B2B5000000000000000000B5B2B500F7F7F700F7F7
      F700F7F7F700F7F7FF00F7FBFF00FFFBFF00FFFBFF00FFFBFF00FFFBFF00FFFB
      FF00FFFFFF00FFFFFF00B5B2B5000000000000000000B5B2B500F7F7F700F7F7
      F700F7F7F700F7F7FF00F7FBFF00FFFBFF00FFFBFF00FFFBFF00FFFBFF00FFFB
      FF00FFFFFF00FFFFFF00B5B2B5000000000000000000B5B2B500F7F7F700F7F7
      F700F7F7F700F7F7FF00F7FBFF00FFFBFF00FFFBFF00FFFBFF00FFFBFF00FFFB
      FF00FFFFFF00FFFFFF00B5B2B5000000000000000000B5B2B500F7F7F700F7F7
      F700F7F7FF00F7FBFF00FFFBFF00FFFBFF00FFFBFF00FFFBFF00FFFBFF00FFFF
      FF00FFFFFF00FFFFFF00B5B2B5000000000000000000B5B2B500F7F7F700F7F7
      F700F7F7FF00F7FBFF00FFFBFF00FFFBFF00FFFBFF00FFFBFF00FFFBFF00FFFF
      FF00FFFFFF00FFFFFF00B5B2B5000000000000000000B5B2B500F7F7F700F7F7
      F700F7F7FF00F7FBFF00FFFBFF00FFFBFF00FFFBFF00FFFBFF00FFFBFF00FFFF
      FF00FFFFFF00FFFFFF00B5B2B5000000000000000000B5B2B500F7F7F700F7F7
      F700F7F7FF00F7FBFF00FFFBFF00FFFBFF00FFFBFF00FFFBFF00FFFBFF00FFFF
      FF00FFFFFF00FFFFFF00B5B2B5000000000000000000B5B6B500F7F7F700D6D3
      D600796F7100FFFBFF00DEB6B50050921F00619A1600BD928C00FFFFFF00796F
      7100E7E3E700FFFFFF00B5B6B5000000000000000000B5B6B500F7F7F700D6D3
      D600796F7100FFFBFF00DEB6B50050921F00619A1600BD928C00FFFFFF00796F
      7100E7E3E700FFFFFF00B5B6B5000000000000000000B5B6B500F7F7F700D6D3
      D600796F7100FFFBFF00DEB6B50050921F00619A1600BD928C00FFFFFF00796F
      7100E7E3E700FFFFFF00B5B6B5000000000000000000B5B6B500F7F7F700D6D3
      D600796F7100FFFBFF00DEB6B50050921F00619A1600BD928C00FFFFFF00796F
      7100E7E3E700FFFFFF00B5B6B5000000000000000000BDBABD00EFEBEF00796F
      7100FFFBFF00FFFBFF00AD5F3700B5AE2700C6AE4000796F2700FFFFFF00FFFF
      FF00796F7100F7F3F700BDBABD000000000000000000BDBABD00EFEBEF00796F
      7100FFFBFF00FFFBFF00AD5F3700B5AE2700C6AE4000796F2700FFFFFF00FFFF
      FF00796F7100F7F3F700BDBABD000000000000000000BDBABD00EFEBEF00796F
      7100FFFBFF00FFFBFF00AD5F3700B5AE2700C6AE4000796F2700FFFFFF00FFFF
      FF00796F7100F7F3F700BDBABD000000000000000000BDBABD00EFEBEF00796F
      7100FFFBFF00FFFBFF00AD5F3700B5AE2700C6AE4000796F2700FFFFFF00FFFF
      FF00796F7100F7F3F700BDBABD000000000000000000BDBABD00F7FBFF00D6D3
      D600796F7100FFFBFF00849E6100BDE38400F7C7610071A64800FFFFFF00796F
      7100DED7DE00FFFFFF00BDBABD000000000000000000BDBABD00F7FBFF00D6D3
      D600796F7100FFFBFF00849E6100BDE38400F7C7610071A64800FFFFFF00796F
      7100DED7DE00FFFFFF00BDBABD000000000000000000BDBABD00F7FBFF00D6D3
      D600796F7100FFFBFF00849E6100BDE38400F7C7610071A64800FFFFFF00796F
      7100DED7DE00FFFFFF00BDBABD000000000000000000BDBABD00F7FBFF00D6D3
      D600796F7100FFFBFF00849E6100BDE38400F7C7610071A64800FFFFFF00796F
      7100DED7DE00FFFFFF00BDBABD000000000000000000BDBEBD00FFFBFF00FFFB
      FF00FFFBFF00FFFBFF00E7E3D6009CBA7900C69A6100D6BEB500FFFFFF00FFFF
      FF00E7E7E700DEDFE700BDBABD000000000000000000BDBEBD00FFFBFF00FFFB
      FF00FFFBFF00FFFBFF00E7E3D6009CBA7900C69A6100D6BEB500FFFFFF00FFFF
      FF00E7E7E700DEDFE700BDBABD000000000000000000BDBEBD00FFFBFF00FFFB
      FF00FFFBFF00FFFBFF00E7E3D6009CBA7900C69A6100D6BEB500FFFFFF00FFFF
      FF00E7E7E700DEDFE700BDBABD000000000000000000BDBEBD00FFFBFF00FFFB
      FF00FFFBFF00FFFBFF00E7E3D6009CBA7900C69A6100D6BEB500FFFFFF00FFFF
      FF00E7E7E700DEDFE700BDBABD000000000000000000BDBEBD00FFFBFF00FFFB
      FF00FFFBFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BDBA
      BD00BDBABD00BDBABD00BDBABD000000000000000000BDBEBD00FFFBFF00FFFB
      FF00FFFBFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BDBA
      BD00BDBABD00BDBABD00BDBABD000000000000000000BDBEBD00FFFBFF00FFFB
      FF00FFFBFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BDBA
      BD00BDBABD00BDBABD00BDBABD000000000000000000BDBEBD00FFFBFF00FFFB
      FF00FFFBFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BDBA
      BD00BDBABD00BDBABD00BDBABD000000000000000000BDBEBD00FFFBFF00FFFB
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C7
      C600F7F7F700BDBABD00000000000000000000000000BDBEBD00FFFBFF00FFFB
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C7
      C600F7F7F700BDBABD00000000000000000000000000BDBEBD00FFFBFF00FFFB
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C7
      C600F7F7F700BDBABD00000000000000000000000000BDBEBD00FFFBFF00FFFB
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C7
      C600F7F7F700BDBABD00000000000000000000000000C6C3C600FFFBFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CECB
      CE00BDBABD0000000000000000000000000000000000C6C3C600FFFBFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CECB
      CE00BDBABD0000000000000000000000000000000000C6C3C600FFFBFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CECB
      CE00BDBABD0000000000000000000000000000000000C6C3C600FFFBFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CECB
      CE00BDBABD0000000000000000000000000000000000C6C3C600C6C3C600C6C3
      C600C6C3C600C6C3C600C6C3C600C6C3C600C6C3C600C6C3C600C6C3C600BDBE
      BD000000000000000000000000000000000000000000C6C3C600C6C3C600C6C3
      C600C6C3C600C6C3C600C6C3C600C6C3C600C6C3C600C6C3C600C6C3C600BDBE
      BD000000000000000000000000000000000000000000C6C3C600C6C3C600C6C3
      C600C6C3C600C6C3C600C6C3C600C6C3C600C6C3C600C6C3C600C6C3C600BDBE
      BD000000000000000000000000000000000000000000C6C3C600C6C3C600C6C3
      C600C6C3C600C6C3C600C6C3C600C6C3C600C6C3C600C6C3C600C6C3C600BDBE
      BD0000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000080018001800180018001800180018001
      8001800180018001800180018001800180018001800180018001800180018001
      8001800180018001800180018001800180018001800180018001800180018001
      8001800180018001800180018001800180018001800180018003800380038003
      8007800780078007800F800F800F800F80018001800180018001800180018001
      8001800180018001800180018001800180018001800180018001800180018001
      8001800180018001800180018001800180018001800180018001800180018001
      8001800180018001800180018001800180018001800180018003800380038003
      8007800780078007800F800F800F800F00000000000000000000000000000000
      000000000000}
  end
end
