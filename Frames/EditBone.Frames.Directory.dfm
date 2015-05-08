object DirectoryFrame: TDirectoryFrame
  Left = 0
  Top = 0
  Width = 451
  Height = 304
  Align = alClient
  DoubleBuffered = True
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  ParentBackground = False
  ParentColor = False
  ParentDoubleBuffered = False
  ParentFont = False
  TabOrder = 0
  object PageControl: TBCPageControl
    Left = 0
    Top = 0
    Width = 451
    Height = 304
    Align = alClient
    DoubleBuffered = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentDoubleBuffered = False
    ParentFont = False
    PopupMenu = PopupMenu
    TabHeight = 22
    TabOrder = 0
    OnMouseDown = PageControlMouseDown
    TabPadding = 2
    SkinData.SkinSection = 'PAGECONTROL'
    OnDblClick = PageControlDblClick
    OnCloseBtnClick = PageControlCloseButtonClick
    HoldShiftToDragDrop = False
    RightClickSelect = True
    TabDragDrop = True
  end
  object ActionList: TActionList
    Images = ImagesDataModule.ImageListSmall
    Left = 84
    Top = 74
    object ActionDirectoryOpen: TAction
      Caption = '&Open Directory'
      Hint = 'Open directory'
      ImageIndex = 53
      OnExecute = ActionDirectoryOpenExecute
    end
    object ActionDirectoryClose: TAction
      Caption = '&Close Directory'
      Hint = 'Close directory'
      ImageIndex = 54
      OnExecute = ActionDirectoryCloseExecute
    end
    object ActionDirectoryEdit: TAction
      Caption = '&Edit Directory'
      Hint = 'Edit directory'
      ImageIndex = 55
      OnExecute = ActionDirectoryEditExecute
    end
    object ActionDirectoryRefresh: TAction
      Caption = '&Refresh'
      Hint = 'Refresh files'
      ImageIndex = 93
      ShortCut = 116
      OnExecute = ActionDirectoryRefreshExecute
    end
    object ActionDirectoryRename: TAction
      Caption = 'Re&name'
      Hint = 'Rename a file'
      ImageIndex = 96
      OnExecute = ActionDirectoryRenameExecute
    end
    object ActionDirectoryDelete: TAction
      Caption = '&Delete'
      Hint = 'Delete a file or directory'
      ImageIndex = 97
      OnExecute = ActionDirectoryDeleteExecute
    end
    object ActionDirectoryProperties: TAction
      Caption = '&Properties'
      ImageIndex = 99
      OnExecute = ActionDirectoryPropertiesExecute
    end
    object ActionDirectoryFiles: TAction
      Caption = '&Files...'
      Hint = 'Search files from the selected directory and its subdirectories'
      ImageIndex = 56
      ShortCut = 16507
      OnExecute = ActionDirectoryFilesExecute
    end
    object ActionDirectoryFindInFiles: TAction
      Caption = '&Find in Files...'
      Hint = 'Search for a string in multiple files'
      ImageIndex = 36
    end
    object ActionDirectoryContextMenu: TAction
      Caption = 'C&ontext Menu'
      Hint = 'Context menu'
      ImageIndex = 98
      OnExecute = ActionDirectoryContextMenuExecute
    end
  end
  object PopupMenu: TPopupMenu
    Images = ImagesDataModule.ImageListSmall
    OnPopup = PopupMenuPopup
    Left = 82
    Top = 136
    object OpenDirectoryMenuItem: TMenuItem
      Action = ActionDirectoryOpen
      Hint = 'Open a new directory'
      ShortCut = 16452
    end
    object CloseDirectoryMenuItem: TMenuItem
      Action = ActionDirectoryClose
      Hint = 'Close the active directory'
      ShortCut = 24644
    end
    object EditDirectoryMenuItem: TMenuItem
      Action = ActionDirectoryEdit
      ShortCut = 24645
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object FilesMenuItem: TMenuItem
      Action = ActionDirectoryFiles
    end
    object FindinFilesMenuItem: TMenuItem
      Action = ActionDirectoryFindInFiles
    end
    object Separator2MenuItem: TMenuItem
      Caption = '-'
    end
    object RefreshMenuItem: TMenuItem
      Action = ActionDirectoryRefresh
    end
    object Separator1MenuItem: TMenuItem
      Caption = '-'
    end
    object RenameMenuItem: TMenuItem
      Action = ActionDirectoryRename
    end
    object DeleteMenuItem: TMenuItem
      Action = ActionDirectoryDelete
    end
    object Separator3MenuItem: TMenuItem
      Caption = '-'
    end
    object ContextMenu1: TMenuItem
      Action = ActionDirectoryContextMenu
    end
    object PropertiesMenuItem: TMenuItem
      Action = ActionDirectoryProperties
    end
  end
  object FrameAdapter: TsFrameAdapter
    SkinData.SkinSection = 'CHECKBOX'
    Left = 82
    Top = 192
  end
end
