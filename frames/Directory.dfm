object DirectoryFrame: TDirectoryFrame
  Left = 0
  Top = 0
  Width = 451
  Height = 304
  Align = alClient
  DoubleBuffered = True
  Color = clWindow
  ParentBackground = False
  ParentColor = False
  ParentDoubleBuffered = False
  TabOrder = 0
  object PageControl: TBCPageControl
    Left = 0
    Top = 0
    Width = 451
    Height = 304
    Align = alClient
    DoubleBuffered = True
    ParentDoubleBuffered = False
    PopupMenu = PopupMenu
    TabOrder = 0
    OnMouseDown = PageControlMouseDown
    ParentColor = False
    RightClickSelect = True
    TabDragDrop = True
    HoldShiftToDragDrop = False
    ShowCloseButton = False
    OnCloseButtonClick = PageControlCloseButtonClick
    OnDblClick = PageControlDblClick
  end
  object DirectoryActionList: TActionList
    Images = ImagesDataModule.ImageList
    Left = 84
    Top = 74
    object DirectoryOpenAction: TAction
      Caption = '&Open Directory'
      Hint = 'Open directory'
      ImageIndex = 215
      OnExecute = DirectoryOpenActionExecute
    end
    object DirectoryCloseAction: TAction
      Caption = '&Close Directory'
      Hint = 'Close directory'
      ImageIndex = 216
      OnExecute = DirectoryCloseActionExecute
    end
    object DirectoryEditAction: TAction
      Caption = '&Edit Directory'
      Hint = 'Edit directory'
      ImageIndex = 217
      OnExecute = DirectoryEditActionExecute
    end
    object DirectoryRefreshAction: TAction
      Caption = '&Refresh'
      Hint = 'Refresh files'
      ImageIndex = 161
      ShortCut = 116
      OnExecute = DirectoryRefreshActionExecute
    end
    object DirectoryRenameAction: TAction
      Caption = 'Re&name'
      Hint = 'Rename a file'
      ImageIndex = 208
      OnExecute = DirectoryRenameActionExecute
    end
    object DirectoryDeleteAction: TAction
      Caption = '&Delete'
      Hint = 'Delete a file or directory'
      ImageIndex = 213
      OnExecute = DirectoryDeleteActionExecute
    end
    object DirectoryPropertiesAction: TAction
      Caption = '&Properties'
      ImageIndex = 157
      OnExecute = DirectoryPropertiesActionExecute
    end
    object DirectoryFilesAction: TAction
      Caption = '&Files...'
      Hint = 'Search files from the selected directory and its subdirectories'
      ImageIndex = 65
      ShortCut = 16507
      OnExecute = DirectoryFilesActionExecute
    end
    object DirectoryFindInFilesAction: TAction
      Caption = '&Find in Files...'
      Hint = 'Search for a string in multiple files'
      ImageIndex = 82
    end
    object DirectoryContextMenuAction: TAction
      Caption = 'C&ontext Menu'
      Hint = 'Context menu'
      ImageIndex = 247
      OnExecute = DirectoryContextMenuActionExecute
    end
  end
  object PopupMenu: TBCPopupMenu
    Images = ImagesDataModule.ImageList
    OnPopup = PopupMenuPopup
    Left = 104
    Top = 156
    object OpenDirectoryMenuItem: TMenuItem
      Action = DirectoryOpenAction
      Hint = 'Open a new directory'
      ShortCut = 16452
    end
    object CloseDirectoryMenuItem: TMenuItem
      Action = DirectoryCloseAction
      Hint = 'Close the active directory'
      ShortCut = 24644
    end
    object EditDirectoryMenuItem: TMenuItem
      Action = DirectoryEditAction
      ShortCut = 24645
    end
    object FilesMenuItem: TMenuItem
      Action = DirectoryFilesAction
    end
    object FindinFilesMenuItem: TMenuItem
      Action = DirectoryFindInFilesAction
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
    object ContextMenu1: TMenuItem
      Action = DirectoryContextMenuAction
    end
    object PropertiesMenuItem: TMenuItem
      Action = DirectoryPropertiesAction
    end
  end
end
