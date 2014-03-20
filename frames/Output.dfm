object OutputFrame: TOutputFrame
  Left = 0
  Top = 0
  Width = 451
  Height = 302
  Align = alClient
  Color = clWindow
  ParentBackground = False
  ParentColor = False
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
    object CopyToClipboardAction: TAction
      Caption = 'C&opy to Clipboard'
      Hint = 'Copy to clipboard'
      ImageIndex = 40
      OnExecute = CopyToClipboardActionExecute
    end
    object OpenAllAction: TAction
      Caption = '&Open All'
      Hint = 'Open all files'
      ImageIndex = 135
      OnExecute = OpenAllActionExecute
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
      Action = CopyToClipboardAction
    end
    object OpenAllMenuItem: TMenuItem
      Action = OpenAllAction
    end
  end
end
