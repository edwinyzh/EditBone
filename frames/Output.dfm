object OutputFrame: TOutputFrame
  Left = 0
  Top = 0
  Width = 451
  Height = 304
  Align = alClient
  TabOrder = 0
  object PageControl: TBCPageControl
    Left = 0
    Top = 0
    Width = 451
    Height = 304
    Align = alClient
    DoubleBuffered = False
    Images = ImageList
    ParentDoubleBuffered = False
    PopupMenu = PopupMenu
    TabOrder = 0
    TabDragDrop = False
    HoldShiftToDragDrop = False
    ShowCloseButton = False
    OnCloseButtonClick = PageControlCloseButtonClick
    OnDblClick = PageControlDblClick
  end
  object OutputActionList: TActionList
    Images = ImageList
    Left = 72
    Top = 52
    object OutputCloseAction: TAction
      Caption = '&Close'
      Hint = 'Close current page'
      ImageIndex = 2
      OnExecute = OutputCloseActionExecute
    end
    object OutputCloseAllAction: TAction
      Caption = 'Close &All'
      Hint = 'Close all pages'
      OnExecute = OutputCloseAllActionExecute
    end
    object CloseAllOtherPagesAction: TAction
      Caption = 'Close A&ll Other Pages'
      Hint = 'Close all other pages'
      OnExecute = CloseAllOtherPagesActionExecute
    end
  end
  object ImageList: TBCImageList
    Left = 192
    Top = 48
    Bitmap = {
      494C010104000800200210001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A4787400A4787400A4787400A4787400A4787400A4787400A478
      7400A4787400A47874008C5D5C00000000001C99CE002BA5D5001C9DD1000A8A
      C600000000000000000000000000000000000000000000000000000000000000
      0000BFA5A3004D5A720000000000000000000000000000000000000000000000
      00000000000000009A0000009A0000009A0000009A0000009A0000009A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A87C7500FEE5CB00FFE2C400FFDFBE00FFDCB800FFD9B100FED6
      AC00FFD4A600FFD1A2008C5D5C0000000000249CCF00A6EEF7006CEBF8005DD9
      F0004AC7E70039B8E00020A0D4000F91CA000F91C9000000000000000000BFA5
      A300576683001276E2003C91DC00000000000000000000000000000000000000
      000000009A001E4FFD001748FE001143FE000C3DFE000738FE000434FE000000
      9A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000AD807800FFEAD400E5A65700E5A65700E5A65700E5A65700E5A6
      5700E5A65700FFD4A8008C5D5C00000000000C8CC70099DDEF008BFFFF0080FC
      FF0082FBFF007FFAFF0079F3FF0065E1F7004ECEED003CBAE0007591A0005B66
      81001170D80033A1FF002A9AFE00000000000000000000000000000000000000
      9A002B5CFD002556FD001E50FD00FFFFFF00FFFFFF000C3EFE000839FE000435
      FE0000009A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B4867A00FEEEDD00FFEBD600FFE8CF00FFE4C900FEE1C200FEDD
      BB00FFDBB500FFD8AF008C5D5C00000000001296CC0059BADE009FFEFF0075F7
      FF0078F6FF0077F2FC0089D9E00087D7DE007BE2EA0091BCC000516889001370
      D50031A0FF00319EFB000000000000000000000000000000000000009A00386A
      FC003363FD002C5EFC002657FD00FFFFFF00FFFFFF001345FD000E3FFD00093A
      FE000436FE0000009A0000000000000000000000000000000000000000000000
      0000717171007171710000000000000000000000000071717100717171000000
      000000000000000000000000000000000000A4787400A4787400A4787400A478
      7400A4787400BA8D7D00FEF2E500E5A65700E5A65700E5A65700E5A65700E5A6
      5700E5A65700FEDCB7008C5D5C000000000026A5D40048C1E6009FEFF80079F6
      FB0087D8DC00BACABC00DABCA500D0B59E00AF9A8C00817A73004179AF0032A3
      FF003DACFE001B9CD4000000000000000000000000000000000000009A003E6F
      FD003A6BFC003465FC002E5FFD002858FC002152FE001B4BFD001446FD000E40
      FE00093AFE0000009A0000000000000000000000000000000000000000007171
      7100DBDBDB00DBDBDB00717171000000000071717100DBDBDB00DBDBDB007171
      710000000000000000000000000000000000A87C7500FEE5CB00FFE2C400FFDF
      BE00FFDCB800C2958100FEF6EC00FEF3E600FEEFE100FFEDDA00FEE9D400FEE6
      CC00FFE2C600FEDFBF008C5D5C000000000027AFDE008B97A10088CFE2008BD1
      D300CBB4AD00F7F0DD00FFFFD800FFFFD900FAF8C500CFB08C00C4A9A3004DC1
      FC0055D0FB0041C1E3000000000000000000000000000000000000009A004475
      FC004071FC003A6CFD003466FD00FFFFFF00FFFFFF002253FD001C4CFD001547
      FD000F41FD0000009A0000000000000000000000000000000000000000007171
      7100DBDBDB00DBDBDB00DBDBDB0071717100DBDBDB00DBDBDB00DBDBDB007171
      710000000000000000000000000000000000AD807800FFEAD400E5A65700E5A6
      5700E5A65700CA9B8300FFF9F300E5A65700E5A65700E5A65700E5A65700E5A6
      5700E5A65700FEE3C8008C5D5C000000000025AFE100AD706B005DBCDD00B5A6
      9E00F7F4EE00FFFFFF00FFFFE300FFFFD400FFF7C100FFE6A500D8A082006FD4
      EB0059D7FB0068E2F8000E90C90000000000000000000000000000009A004879
      FC004575FC004171FC003B6CFC00FFFFFF00FFFFFF00295AFD002354FD001C4E
      FE001647FD0000009A0000000000000000000000000000000000000000000000
      000071717100DBDBDB00DBDBDB00DBDBDB00DBDBDB00DBDBDB00787878000000
      000000000000000000000000000000000000B4867A00FEEEDD00FFEBD600FFE8
      CF00FFE4C900D1A28600FEFBF900FEF9F400FEF7EF00FEF5EA00FEF1E400FEEE
      DE00FEEBD700FEE8D0008C5D5C000000000026AFE100B5776D00A4CFD900CEB6
      9E00FFFFEA00FFFFF300FFFFEA00FFFFD700F7DCA900F6C98600E1B8910091C0
      C70053D3FB007EF3FF0028AAD80000000000000000000000000000009A00497A
      FC004979FC004577FD004172FC00FFFFFF00FFFFFF003062FC002B5BFC002455
      FD001D4FFD0000009A0000000000000000000000000000000000000000000000
      00000000000071717100DBDBDB00DBDBDB00DBDBDB0071717100000000000000
      000000000000000000000000000000000000BA8D7D00FEF2E500E5A65700E5A6
      5700E5A65700D8A98A00FEFEFD00FEFCFA00FEFAF600FEF8F100FEF5EC00EBDF
      DB00D3C2C000BAA9AA008C5D5C000000000028B0E000BC7F6E00FFF4EB00D5BC
      A100FFFFDD00FFFFDD00FFFFE000FFFACA00EFBD8100F4BD7700E7C49A0093C0
      C4004FD3FB007DF4FF0056D5EF0000000000000000000000000000009A00497A
      FC00497AFC00497AFC004677FC00FFFFFF00FFFFFF003868FC003163FD002B5D
      FD002556FD0000009A0000000000000000000000000000000000000000000000
      000071717100DBDBDB00DBDBDB00DBDBDB00DBDBDB00DBDBDB00717171000000
      000000000000000000000000000000000000C2958100FEF6EC00FEF3E600FEEF
      E100FFEDDA00DFB08D00FEFEFE00FEFEFE00FEFCFB00FEFBF700FEF8F200B481
      7600B4817600B4817600B17F74000000000028AFE100C5887000FFFCF800CAAA
      9900FEFFCE00FFFFC900F8E1AD00F0C78C00F3CA9600FFEBB500D5AF95009AC9
      D3007AE0FE009DFBFF0096F8FF0023A1D3000000000000000000000000000000
      9A00497AFC00497AFC00497AFC00FFFFFF00FFFFFF003E6FFC003969FC003364
      FD0000009A000000000000000000000000000000000000000000000000007171
      7100DBDBDB00DBDBDB00DBDBDB0071717100DBDBDB00DBDBDB00DBDBDB007171
      710000000000000000000000000000000000CA9B8300FFF9F300E5A65700E5A6
      5700E5A65700E4B58E00FEFEFE00FEFEFE00FEFEFE00FEFDFC00FEFBF800B481
      7600EBB56F00E49B4200000000000000000028B0E100CE917300FFFAF700D8C4
      BD00DCC59E00FCE5A700FAC78200FBD08B00FFF7E000E7DCCE008CA5AA006BC9
      E6005FBCE00060BBDE006CC4E30029A1D1000000000000000000000000000000
      000000009A00497AFC00497AFC00497AFC004778FC004374FC003E70FD000000
      9A00000000000000000000000000000000000000000000000000000000007171
      7100DBDBDB00DBDBDB00717171000000000071717100DBDBDB00DBDBDB007171
      710000000000000000000000000000000000D1A28600FEFBF900FEF9F400FEF7
      EF00FEF5EA00E8B89000DCA88700DCA88700DCA88700DCA88700DCA88700B481
      7600F0B25E000000000000000000000000002DB2E200D5997500FFF8F300FCFB
      FA00E5D1C900E9CAA600E7C59900E1C29800CCB59F00B18B880075E7F8006DED
      FE00179DD1000000000000000000000000000000000000000000000000000000
      00000000000000009A0000009A0000009A0000009A0000009A0000009A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000717171007171710000000000000000000000000071717100717171000000
      000000000000000000000000000000000000D8A98A00FEFEFD00FEFCFA00FEFA
      F600FEF8F100FEF5EC00EBDFDB00D3C2C000BAA9AA008C5D5C00000000000000
      0000000000000000000000000000000000001FA1D900DDA07700FFFBF600FFFF
      FF00FFFFFF00FFFFFE00FBF4EB00B4837900BF784900B16F530050C0E50050C4
      E7001C9DD0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DFB08D00FEFEFE00FEFEFE00FEFC
      FB00FEFBF700FEF8F200B4817600B4817600B4817600B17F7400000000000000
      00000000000000000000000000000000000000000000E2A67800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F8FAFC00B6877A00E299550000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E4B58E00FEFEFE00FEFEFE00FEFE
      FE00FEFDFC00FEFBF800B4817600EBB56F00E49B420000000000000000000000
      00000000000000000000000000000000000000000000E7AB7900D1926D00D192
      6D00D1926D00D1926D00D1926D00B47E6F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E8B89000DCA88700DCA88700DCA8
      8700DCA88700DCA88700B4817600F0B25E000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFFFFF8010FF3F81FFFFFF801
      0061F00FFFFFF8010001E007FFFFF8010003C003F39F00010003C003E10F0001
      0003C003E00F00010001C003F01F00010001C003F83F00010001C003F01F0001
      0000E007E00F00030000F00FE10F00070007F81FF39F003F0007FFFFFFFF003F
      807FFFFFFFFF007F80FFFFFFFFFF00FF00000000000000000000000000000000
      000000000000}
  end
  object PopupMenu: TBCPopupMenu
    Images = ImageList
    Left = 264
    Top = 124
    object CloseMenuItem: TMenuItem
      Action = OutputCloseAction
    end
    object CloseAllMenuItem: TMenuItem
      Action = OutputCloseAllAction
    end
    object Separator1MenuItem: TMenuItem
      Caption = '-'
    end
    object CloseAllOtherPagesMenuItem: TMenuItem
      Action = CloseAllOtherPagesAction
    end
    object Separator2MenuItem: TMenuItem
      Caption = '-'
    end
    object CopytoClipboardMenuItem: TMenuItem
      Caption = 'C&opy to Clipboard'
      ImageIndex = 3
      OnClick = CopytoClipboardMenuItemClick
    end
  end
end
