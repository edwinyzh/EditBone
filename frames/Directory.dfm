object DirectoryFrame: TDirectoryFrame
  Left = 0
  Top = 0
  Width = 451
  Height = 302
  Align = alClient
  TabOrder = 0
  object PageControl: TBCPageControl
    Left = 0
    Top = 0
    Width = 451
    Height = 302
    Align = alClient
    DoubleBuffered = False
    ParentDoubleBuffered = False
    PopupMenu = PopupMenu
    TabOrder = 0
    OnMouseDown = PageControlMouseDown
    TabDragDrop = True
    HoldShiftToDragDrop = False
    ShowCloseButton = False
    OnCloseButtonClick = PageControlCloseButtonClick
    OnDblClick = PageControlDblClick
  end
  object DirectoryActionList: TActionList
    Images = ImagesList
    Left = 84
    Top = 68
    object DirectoryOpenAction: TAction
      Caption = '&Open Directory'
      Hint = 'Open directory'
      ImageIndex = 0
      OnExecute = DirectoryOpenActionExecute
    end
    object DirectoryCloseAction: TAction
      Caption = '&Close Directory'
      Hint = 'Close directory'
      ImageIndex = 1
      OnExecute = DirectoryCloseActionExecute
    end
    object DirectoryEditAction: TAction
      Caption = '&Edit Directory'
      Hint = 'Edit directory'
      ImageIndex = 2
      OnExecute = DirectoryEditActionExecute
    end
    object DirectoryRefreshAction: TAction
      Caption = '&Refresh'
      Hint = 'Refresh files'
      ImageIndex = 3
      ShortCut = 116
      OnExecute = DirectoryRefreshActionExecute
    end
    object DirectoryRenameAction: TAction
      Caption = 'Re&name'
      Hint = 'Rename a file'
      ImageIndex = 4
      OnExecute = DirectoryRenameActionExecute
    end
    object DirectoryDeleteAction: TAction
      Caption = '&Delete'
      Hint = 'Delete a file or directory'
      ImageIndex = 5
      OnExecute = DirectoryDeleteActionExecute
    end
    object DirectoryPropertiesAction: TAction
      Caption = '&Properties'
      OnExecute = DirectoryPropertiesActionExecute
    end
  end
  object PopupMenu: TBCPopupMenu
    Images = ImagesList
    Left = 104
    Top = 156
    object OpenDirectoryMenuItem: TMenuItem
      Action = DirectoryOpenAction
      Hint = 'Open a new directory'
    end
    object CloseDirectoryMenuItem: TMenuItem
      Action = DirectoryCloseAction
      Hint = 'Close the active directory'
    end
    object EditDirectoryMenuItem: TMenuItem
      Action = DirectoryEditAction
    end
    object Separator2MenuItem: TMenuItem
      Caption = '-'
    end
    object RefreshMenuItem: TMenuItem
      Action = DirectoryRefreshAction
    end
    object Separator1MenuItem: TMenuItem
      Caption = '-'
    end
    object RenameMenuItem: TMenuItem
      Action = DirectoryRenameAction
    end
    object DeleteMenuItem: TMenuItem
      Action = DirectoryDeleteAction
    end
    object Separator3MenuItem: TMenuItem
      Caption = '-'
    end
    object PropertiesMenuItem: TMenuItem
      Action = DirectoryPropertiesAction
    end
  end
  object ImagesList: TBCImageList
    Left = 264
    Top = 96
    Bitmap = {
      494C010106000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EDA46200EDA46200EDA4
      6200EDA46200EDA4620000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CA680000CA68
      0000CA680000CA680000CA680000CA680000CA680000CA680000CA680000CA68
      0000CA680000CA68000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EDA46200FFE5BA00FECCA300F4B6
      8100EDA46200EDA46200EDA46200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CA680000FFF4E700FFE7
      CF00FFE5C900FFE2C200FFE0BD00FFDDB600FFDAB100FFD7AD00FFD5A900FFD4
      A500FFD3A300FFD9B100CA680000000000000000000000000000000000000000
      0000000000000000000000000000EDA46200FFF6CC00FEE2B700FCCA9F00F4B6
      8100EDA46200EDA46200EDA46200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CA680000FFEEDE00FEE3
      C500FEE0C000FEDDBA00FEDAB400FED7AD00FED4A900FED1A40000000000FECE
      9C0000000000FFD3A400CA680000000000000000000000000000000000000000
      0000000000000000000000000000EDA46200FFFACD00FEE2B700FECCA300F4B6
      8100EEA66800EDA46200EDA46200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CA680000FFF2E500FFE7
      CB00FFE3C6003F52CE000D29D3002E44CC00D4BCB800FED5A900FFD3A4000000
      0000FECE9D00FFD4A600CA680000000000000000000000000000000000000000
      0000000000000000000000000000F4CA9000FFFFD400FFE5BA00FED0A600F4B6
      8100EEA66800EDA46200EDA46200EDA462000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CA680000FFF6EB00FEEA
      D100FEE6CB00FEE3C6000000E100A49DC300FEDAB500FED8AF00FED7AA000000
      0000FED0A100FFD7AA00CA680000000000000000000000000000000000000000
      00000000000000000000EDA46200FEF2C700FFFACD00FED0A600F4B68100EEBA
      7900EEA66800EDA46200EDA46200EDA462000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CA680000FFFAF200FEED
      D900FFE9D100FFE6CB000000E100A5A1C700FEDDBA00FEDAB500FED8B0000000
      0000FED3A500FFD8AD00CA680000000000000000000000000000000000000000
      00000000000000000000EDA46200E7AB6800D77E3200DA813600E3954C00EEA6
      6800EEBA7900EFB47300EEA66800EDA462000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CA680000FFFCF800FFEF
      E000FEEDD900FFEAD3000000E100A4A3CC00FFE1C100FFDDBA00FEDCB5000000
      0000FED5AA00FFDAB400CA680000000000000000000000000000000000000000
      00000000000000000000D77E3200B7410000C95F1300DE833900EDA46200F0C2
      8400F7DAA400F4D79F00EEBA7900EAA35F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CA680000FFFFFE00FFF3
      E500FFEFE000FEEDD9000000E100A3A3D100FEE3C700FFE1C100FFDEBB000000
      0000FED8B000FFDDBA00CA680000000000000000000000000000000000000000
      00000000000000000000DE833900C2550B00CB651800DE833900004B0000004B
      0000FCEEBD00FEE2B700EEBA7900EDA462000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CA680000FFFFFF00D5D5
      EE00FFF3E500FFEFE0000000E100ADAFDE00FEE7CE00D4C7CE00FFE2C2000000
      0000FEDCB600FFE0C000CA680000000000000000000000000000000000000000
      000000000000000000000000000000000000DE833900004B00001E9A360039D7
      6700004B0000EDA4620000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CA680000FFFFFF004B64
      DE00B3B7E100F9ECDF000000E100ADB1E200E2D3D0002740D000FFE5C7000000
      0000FFDEBB00FFE3C500CA680000000000000000000000000000000000000000
      000093625D009C695E000000000000000000004B00000A72120026AC440023BA
      41000C861600004B000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CA680000FFFFFF007186
      E2000A2BDD000A2ADC000A2ADA000A2AD9000A29D8003950D200FEE7CE000000
      0000FFE1C200FFE6CB00CA68000000000000AD8179009F6F6A00C79D8300C498
      7E009C695E00B6784400915C590000000000004B0000004B00000A7212000C8C
      1800004B0000004B000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CA680000FFFFFF00F7F4
      F000F7F3EC00F8F1E900F7EFE400F9EDE000FAEBDC00F9E9D50000000000FFE9
      CF0000000000FFEAD300CA68000000000000A1767500DEB27D009F5B33009C6B
      6700C2937900AC765800915C590000000000000000000000000002630500004B
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CA680000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFB00FFFBF400FFF7EF00FFF4
      E700FFF0E100FFF7EE00CA680000000000008C595900905B5500AF5E1600D1A1
      7700A16E6300A16A50000000000000000000000000000000000002630500004B
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CA680000CA68
      0000CA680000CA680000CA680000CA680000CA680000CA680000CA680000CA68
      0000CA680000CA680000000000000000000000000000000000009E5E3A00A170
      6500C5A9AB00976867000000000000000000004B0000004B0000004B00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008C5959009365
      6600976868000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000008B
      4800008B4900008C4C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001C2D
      AD002131AD002233AD0000000000000000000000000000000000000000000000
      000000000000000000004E64760047658300478BD80000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A4A4A4008D8D8D008A8A8A008A8A
      8A008A8A8B008B8B8C008B8C8D008B8C8D008B8B8C006DC29B000094520000BA
      840077E0C60000BB860000995C0000000000A4A4A4008D8D8D008A8A8A008A8A
      8A008A8A8B008B8B8C008B8C8D008B8C8D008B8B8C00818BD6001B31BF00365D
      FA003961FE003960FA00283EC10000000000A4A4A4008D8D8D008A8A8A008A8A
      8A008A8A8B008B8B8C00507B99007EA5B5008BD3FF00235E96008A8A8A008A8A
      8A008A8A8A008D8D8D00A4A4A400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008D8D8D00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00007F360000BE880000BC
      8300FFFFFF0000BC830000C18D00008C4C008D8D8D00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000317A5003D61FB003C60
      FB003A5EF9003D61FB004366FD001E30AD008D8D8D00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0035A5EB0088E3FF007ED3FF000D96FF00255D9100FFFF
      FF00FFFFFF00FFFFFF008D8D8D00000000000000000000000000000000000070
      0000000000000000000000000000007000000070000000700000000000000000
      0000000000000000000000000000000000008B8B8B00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6A584009E6932009E693200C4A48200007F370072E5CB00FFFF
      FF00FFFFFF00FFFFFF0077E7CE00008B49008B8B8B00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6A584009E6932009E693200C4A482000417A400A7B9FF00FFFF
      FF00FFFFFF00FFFFFF00ACBDFF001B2DAC008B8B8B00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6A584009E6932001D6DC0003DC3FF0029A9FF001398FF002A61
      9500FFFFFF00FFFFFF008B8B8B00000000000000000000000000000000000070
      0000047503000000000000700000000000000000000000000000007000000000
      0000000000000000000000000000000000008B8B8B00FFFFFF00FFFFFF008081
      820083878A00A16A3200F0D9BB00E0BC8F009D672F00007E360000CA940000C8
      8F00FFFFFF0000C9900000CD9900008C4B008B8B8B00FFFFFF00FFFFFF008081
      820083878A00A16A3200F0D9BB00E0BC8F009D672F000115A4005876FE005876
      FF005473FE005877FF005F7CFF001D2EAD008B8B8B00FFFFFF00FFFFFF008081
      820083878A00A16A3200F0D9BB00E0BC8F002270C00042C5FF002BAAFF00129B
      FF0029669F00FFFFFF008B8B8B00000000000000000000000000000000000070
      0000007000000070000000000000000000000000000000000000000000000070
      0000000000000000000000000000000000008B8B8B00FFFFFF00FEFEFE008383
      8400FFFFFF00CFB08C00AD794100AD794100CCAD8A0063B68F00009B590000D1
      9A0074EED40000D49F0000A36700000000008B8B8B00FFFFFF00FEFEFE008383
      8400FFFFFF00CFB08C00AD794100AD794100CCAD8A00F5F7F900263BC3006B84
      FF00748CFF00718AFF00384DC800000000008B8B8B00FFFFFF00FEFEFE008383
      8400FFFFFF00CFB08C00AD794100AD794100CCAD8A002270C1003FC5FF0020AA
      FF0083B0D7007E7871008B8B8B00000000000000000000000000000000000070
      0000007000000070000000700000000000000000000000000000000000000070
      0000000000000000000000000000000000008B8B8B00FFFFFF00FAFAFA008383
      8300FDFFFF00FAFFFF00FCFFFF00FCFFFF00F9FEFF00F4F7F90062B58E000080
      370000843E0000894700398D6700000000008B8B8B00FFFFFF00FAFAFA008383
      8300FDFFFF00FAFFFF00FCFFFF00FCFFFF00F9FEFF00F4F7F900F5F7F9000518
      A6000F21AA00192BAD004B56A100000000008B8B8B00FFFFFF00FAFAFA008383
      8300FDFFFF00FAFFFF00FCFFFF00FCFFFF00F9FEFF00F4F7F9001C70C400ADD9
      EF0092887F00C1BFB800777C6E00000000000000000000000000000000000070
      0000007000000070000000700000007000000000000000000000000000000000
      0000000000000000000000000000000000008B8B8B00FFFEFE00F8F7F6008585
      8500FFFFFF00C2A280009F6A34009F6A3400C0A07E00F5F7F900F6F5F400F5F4
      F200F4F3F200FFFEFE008C8C8C00000000008B8B8B00FFFEFE00F8F7F6008585
      8500FFFFFF00C2A280009F6A34009F6A3400C0A07E00F5F7F900F6F5F400F5F4
      F200F4F3F200FFFEFE008C8C8C00000000008B8B8B00FFFEFE00F8F7F6008585
      8500FFFFFF00C2A280009F6A34009F6A3400C0A07E00F5F7F900F6F5F4007F78
      7200E9E6E200888B8200BA7AB6009869CA000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008B8C8C00FEFDFD00F5F4F3008787
      8800878B8F00A26C3400F0DABC00E1BD90009E693100F5F8FB005F6061009E9F
      9F009C9D9D00FFFEFE008C8C8C00000000008B8C8C00FEFDFD00F5F4F3008787
      8800878B8F00A26C3400F0DABC00E1BD90009E693100F5F8FB005F6061009E9F
      9F009C9D9D00FFFEFE008C8C8C00000000008B8C8C00FEFDFD00F5F4F3008787
      8800878B8F00A26C3400F0DABC00E1BD90009E693100F5F8FB005F6061009E9F
      9F007B7C7500E1B0DF00CB96C600AE7DCE000000000000000000000000000000
      0000000000000000000000000000007000000070000000700000007000000070
      0000000000000000000000000000000000008C8C8C00FDFCFC00F1F1F0008687
      8800F7FAFC00CBAB8900AE7A4000AD7A4000C8A88500EFF1F200EFEFEE00EFEE
      EC00EEEDEC00FDFCFC008C8C8C00000000008C8C8C00FDFCFC00F1F1F0008687
      8800F7FAFC00CBAB8900AE7A4000AD7A4000C8A88500EFF1F200EFEFEE00EFEE
      EC00EEEDEC00FDFCFC008C8C8C00000000008C8C8C00FDFCFC00F1F1F0008687
      8800F7FAFC00CBAB8900AE7A4000AD7A4000C8A88500EFF1F200EFEFEE00EFEE
      EC00EEEDEC00BF86D400BE8AD300000000000000000000000000000000000070
      0000000000000000000000000000000000000070000000700000007000000070
      0000000000000000000000000000000000008C8C8C00FEFEFF00EFEFF200858A
      8E00F1F4FA00EDF1F700ECEFF400EBEDF200EAEAED00E8E7E800E8E6E600E7E5
      E500E7E5E500FCFBFB008C8C8C00000000008C8C8C00FEFEFF00EFEFF200858A
      8E00F1F4FA00EDF1F700ECEFF400EBEDF200EAEAED00E8E7E800E8E6E600E7E5
      E500E7E5E500FCFBFB008C8C8C00000000008C8C8C00FEFEFF00EFEFF200858A
      8E00F1F4FA00EDF1F700ECEFF400EBEDF200EAEAED00E8E7E800E8E6E600E7E5
      E500E7E5E500FCFBFB008C8C8C00000000000000000000000000000000000070
      0000000000000000000000000000000000000000000000700000007000000070
      0000000000000000000000000000000000008C8C8D00FFFFFF00BC9C7A00A36E
      3700A26D3600BC9C7B00E9EAEE00E9E8E900E9E7E700E8E6E600E6E4E400E3E1
      E100E3E1E100FCFBFB008C8C8C00000000008C8C8D00FFFFFF00BC9C7A00A36E
      3700A26D3600BC9C7B00E9EAEE00E9E8E900E9E7E700E8E6E600E6E4E400E3E1
      E100E3E1E100FCFBFB008C8C8C00000000008C8C8D00FFFFFF00BC9C7A00A36E
      3700A26D3600BC9C7B00E9EAEE00E9E8E900E9E7E700E8E6E600E6E4E400E3E1
      E100E3E1E100FCFBFB008C8C8C00000000000000000000000000000000000000
      0000007000000000000000000000000000000070000000000000047503000070
      0000000000000000000000000000000000008C8D8D00FFFFFF009F693100F0DA
      BC00E2BE9100A06A3300E8E9EC0062636400A2A3A300A1A1A100E0DEDD00E0DE
      DD00E0DDDC00FCFDFB008C8C8C00000000008C8D8D00FFFFFF009F693100F0DA
      BC00E2BE9100A06A3300E8E9EC0062636400A2A3A300A1A1A100E0DEDD00E0DE
      DD00E0DDDC00FCFDFB008C8C8C00000000008C8D8D00FFFFFF009F693100F0DA
      BC00E2BE9100A06A3300E8E9EC0062636400A2A3A300A1A1A100E0DEDD00E0DE
      DD00E0DDDC00FCFDFB008C8C8C00000000000000000000000000000000000000
      0000000000000070000000700000007000000000000000000000000000000070
      0000000000000000000000000000000000008C8D8D00FFFFFF00C4A47F00AE7A
      4100AF7B4100C5A58100E2E2E300E2E0E000E2E0DF00E1DFDE00E0DEDD00DDDB
      D900DCDAD900FFFEFE008C8C8C00000000008C8D8D00FFFFFF00C4A47F00AE7A
      4100AF7B4100C5A58100E2E2E300E2E0E000E2E0DF00E1DFDE00E0DEDD00DDDB
      D900DCDAD900FFFEFE008C8C8C00000000008C8D8D00FFFFFF00C4A47F00AE7A
      4100AF7B4100C5A58100E2E2E300E2E0E000E2E0DF00E1DFDE00E0DEDD00DDDB
      D900DCDAD900FFFEFE008C8C8C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008E8F8F00FFFFFF00F7F7FA00F7F9
      FD00F7F9FE00F7F7FA00F5F4F500F5F3F300F5F3F300F5F3F300F5F3F300F4F2
      F200F4F2F200FFFFFF008E8E8E00000000008E8F8F00FFFFFF00F7F7FA00F7F9
      FD00F7F9FE00F7F7FA00F5F4F500F5F3F300F5F3F300F5F3F300F5F3F300F4F2
      F200F4F2F200FFFFFF008E8E8E00000000008E8F8F00FFFFFF00F7F7FA00F7F9
      FD00F7F9FE00F7F7FA00F5F4F500F5F3F300F5F3F300F5F3F300F5F3F300F4F2
      F200F4F2F200FFFFFF008E8E8E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000999999008E8F8F008D8D8E008D8D
      8E008D8E8E008D8D8E008C8D8D008C8D8D008C8D8D008C8D8D008C8D8D008C8C
      8D008C8D8D008E8E8E009999990000000000999999008E8F8F008D8D8E008D8D
      8E008D8E8E008D8D8E008C8D8D008C8D8D008C8D8D008C8D8D008C8D8D008C8C
      8D008C8D8D008E8E8E009999990000000000999999008E8F8F008D8D8E008D8D
      8E008D8E8E008D8D8E008C8D8D008C8D8D008C8D8D008C8D8D008C8D8D008C8C
      8D008C8D8D008E8E8E0099999900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF00FFFFFF8300000000C003FF0100000000
      8001FE01000000008001FE01000000008001FE00000000008001FC0000000000
      8001FC00000000008001FC00000000008001FC00000000008001FF0300000000
      8001F303000000008001010300000000800101CF00000000800103CF00000000
      C003C31F00000000FFFFC7FF00000000FFE3FFE3FC7FFFFF000100010001FFFF
      000000000001EE3F000000000001E5DF000000000001E3EF000100010001E1EF
      000100010001E0FF000100010000FFFF000100010000FE0F000100010001EF0F
      000100010001EF8F000100010001F74F000100010001F8EF000100010001FFFF
      000100010001FFFF000100010001FFFF00000000000000000000000000000000
      000000000000}
  end
end
