object OutputFrame: TOutputFrame
  Left = 0
  Top = 0
  Width = 451
  Height = 305
  Align = alClient
  Color = clWindow
  ParentBackground = False
  ParentColor = False
  TabOrder = 0
  object PageControl: TBCPageControl
    Left = 0
    Top = 0
    Width = 451
    Height = 305
    Align = alClient
    DoubleBuffered = False
    Images = ImagesDataModule.ImageListSmall
    ParentDoubleBuffered = False
    PopupMenu = PopupMenu
    TabHeight = 22
    TabOrder = 0
    OnMouseDown = PageControlMouseDown
    TabMargin = 4
    SkinData.SkinSection = 'PAGECONTROL'
    OnDblClick = PageControlDblClick
    OnCloseBtnClick = PageControlCloseButtonClick
    HoldShiftToDragDrop = False
    RightClickSelect = True
    TabDragDrop = True
  end
  object ActionList: TActionList
    Images = ImagesDataModule.ImageListSmall
    Left = 72
    Top = 52
    object ActionOutputClose: TAction
      Caption = '&Close'
      Hint = 'Close current page'
      ImageIndex = 6
      OnExecute = ActionOutputCloseExecute
    end
    object ActionOutputCloseAll: TAction
      Caption = 'Close &All'
      Hint = 'Close all pages'
      ImageIndex = 7
      OnExecute = ActionOutputCloseAllExecute
    end
    object ActionCloseAllOtherPages: TAction
      Caption = 'Close A&ll Other Pages'
      Hint = 'Close all other pages'
      ImageIndex = 8
      OnExecute = ActionCloseAllOtherPagesExecute
    end
    object ActionCopyAllToClipboard: TAction
      Caption = 'C&opy all to Clipboard'
      Hint = 'Copy all to clipboard'
      ImageIndex = 15
      OnExecute = ActionCopyAllToClipboardExecute
    end
    object ActionCopySelectedToClipboard: TAction
      Caption = 'Cop&y selected to Clipboard'
      Hint = 'Copy selected to clipboard'
      ImageIndex = 100
      OnExecute = ActionCopySelectedToClipboardExecute
    end
    object ActionOpenAll: TAction
      Caption = 'O&pen All'
      Hint = 'Open all files'
      ImageIndex = 1
      OnExecute = ActionOpenAllExecute
    end
    object ActionOpenSelected: TAction
      Caption = 'Op&en selected'
      Hint = 'Open selected files'
      ImageIndex = 101
      OnExecute = ActionOpenSelectedExecute
    end
    object ActionSelectAll: TAction
      Caption = 'Select all'
      Hint = 'Select all files'
      ImageIndex = 102
      OnExecute = ActionSelectAllExecute
    end
    object ActionUnselectAll: TAction
      Caption = 'Unselect all'
      Hint = 'Unselect all files'
      ImageIndex = 103
      OnExecute = ActionUnselectAllExecute
    end
  end
  object PopupMenu: TPopupMenu
    Images = ImagesDataModule.ImageListSmall
    Left = 72
    Top = 110
    object MenuItemClose: TMenuItem
      Action = ActionOutputClose
    end
    object MenuItemCloseAll: TMenuItem
      Action = ActionOutputCloseAll
    end
    object MenuItemCloseAllOtherPages: TMenuItem
      Action = ActionCloseAllOtherPages
    end
    object MenuItemSeparator1: TMenuItem
      Caption = '-'
    end
    object MenuItemCopyToClipboard: TMenuItem
      Action = ActionCopyAllToClipboard
    end
    object MenuItemCopySelectedToClipboard: TMenuItem
      Action = ActionCopySelectedToClipboard
    end
    object MenuItemSeparator2: TMenuItem
      Caption = '-'
    end
    object MenuItemOpenAll: TMenuItem
      Action = ActionOpenAll
    end
    object MenuItemOpenSelected: TMenuItem
      Action = ActionOpenSelected
    end
    object MenuItemSeparator3: TMenuItem
      Caption = '-'
    end
    object MenuItemSelectAll: TMenuItem
      Action = ActionSelectAll
    end
    object MenuItemUnselectAll: TMenuItem
      Action = ActionUnselectAll
    end
  end
  object FrameAdapter: TsFrameAdapter
    SkinData.SkinSection = 'CHECKBOX'
    Left = 70
    Top = 170
  end
end
