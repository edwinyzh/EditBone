object OutputFrame: TOutputFrame
  Left = 0
  Top = 0
  Width = 451
  Height = 304
  Align = alClient
  Color = clWindow
  ParentBackground = False
  ParentColor = False
  TabOrder = 0
  object PageControl: TBCPageControl
    Left = 0
    Top = 0
    Width = 451
    Height = 304
    Align = alClient
    DoubleBuffered = False
    ParentDoubleBuffered = False
    PopupMenu = PopupMenu
    TabOrder = 0
    OnMouseDown = PageControlMouseDown
    RightClickSelect = True
    TabDragDrop = True
    HoldShiftToDragDrop = False
    ShowCloseButton = False
    OnCloseButtonClick = PageControlCloseButtonClick
    OnDblClick = PageControlDblClick
  end
  object OutputActionList: TActionList
    Images = ImagesDataModule.ImageList
    Left = 72
    Top = 52
    object OutputCloseAction: TAction
      Caption = '&Close'
      Hint = 'Close current page'
      ImageIndex = 85
      OnExecute = OutputCloseActionExecute
    end
    object OutputCloseAllAction: TAction
      Caption = 'Close &All'
      Hint = 'Close all pages'
      ImageIndex = 86
      OnExecute = OutputCloseAllActionExecute
    end
    object CloseAllOtherPagesAction: TAction
      Caption = 'Close A&ll Other Pages'
      Hint = 'Close all other pages'
      ImageIndex = 87
      OnExecute = CloseAllOtherPagesActionExecute
    end
    object CopyAllToClipboardAction: TAction
      Caption = 'C&opy all to Clipboard'
      Hint = 'Copy all to clipboard'
      ImageIndex = 40
      OnExecute = CopyAllToClipboardActionExecute
    end
    object CopySelectedToClipboardAction: TAction
      Caption = 'Cop&y selected to Clipboard'
      Hint = 'Copy selected to clipboard'
      ImageIndex = 259
    end
    object OpenAllAction: TAction
      Caption = 'O&pen All'
      Hint = 'Open all files'
      ImageIndex = 135
      OnExecute = OpenAllActionExecute
    end
    object OpenSelectedAction: TAction
      Caption = 'Op&en selected'
      Hint = 'Open selected files'
      ImageIndex = 258
      OnExecute = OpenSelectedActionExecute
    end
    object SelectAllAction: TAction
      Caption = 'Select all'
      Hint = 'Select all files'
      ImageIndex = 260
    end
    object UnselectAllAction: TAction
      Caption = 'Unselect all'
      Hint = 'Unselect all files'
      ImageIndex = 261
    end
  end
  object PopupMenu: TBCPopupMenu
    Images = ImagesDataModule.ImageList
    Left = 266
    Top = 124
    object CloseMenuItem: TMenuItem
      Action = OutputCloseAction
    end
    object CloseAllMenuItem: TMenuItem
      Action = OutputCloseAllAction
    end
    object CloseAllOtherPagesMenuItem: TMenuItem
      Action = CloseAllOtherPagesAction
    end
    object Separator2MenuItem: TMenuItem
      Caption = '-'
    end
    object CopytoClipboardMenuItem: TMenuItem
      Action = CopyAllToClipboardAction
    end
    object CopyselectedtoClipboard1: TMenuItem
      Action = CopySelectedToClipboardAction
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object OpenAllMenuItem: TMenuItem
      Action = OpenAllAction
    end
    object OpenSelectedAction1: TMenuItem
      Action = OpenSelectedAction
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object Selectall1: TMenuItem
      Action = SelectAllAction
    end
    object Unselectall1: TMenuItem
      Action = UnselectAllAction
    end
  end
end
