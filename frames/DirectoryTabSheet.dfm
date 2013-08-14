object DirTabSheetFrame: TDirTabSheetFrame
  Left = 0
  Top = 0
  Width = 451
  Height = 302
  Align = alClient
  TabOrder = 0
  object Panel: TPanel
    Left = 0
    Top = 0
    Width = 451
    Height = 302
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alClient
    BevelOuter = bvNone
    Padding.Left = 1
    Padding.Top = 1
    Padding.Right = 3
    Padding.Bottom = 2
    ParentColor = True
    TabOrder = 0
    object FileTreeView: TBCFileTreeView
      Left = 1
      Top = 26
      Width = 447
      Height = 250
      Align = alClient
      DragOperations = []
      EditDelay = 500
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      Header.AutoSizeIndex = 0
      Header.Font.Charset = DEFAULT_CHARSET
      Header.Font.Color = clWindowText
      Header.Font.Height = -11
      Header.Font.Name = 'Tahoma'
      Header.Font.Style = []
      Header.MainColumn = -1
      Header.Options = []
      IncrementalSearch = isAll
      Indent = 20
      ParentFont = False
      TabOrder = 0
      TreeOptions.AutoOptions = [toAutoDropExpand, toAutoScroll, toAutoScrollOnExpand, toAutoTristateTracking, toAutoDeleteMovedNodes, toAutoChangeScale]
      TreeOptions.MiscOptions = [toEditable, toFullRepaintOnResize, toInitOnSave, toToggleOnDblClick, toWheelPanning, toEditOnClick]
      TreeOptions.PaintOptions = [toShowBackground, toShowButtons, toShowDropmark, toShowRoot, toThemeAware, toUseBlendedSelection, toUseExplorerTheme]
      Columns = <>
    end
    object DriveComboBox: TBCDriveComboBox
      AlignWithMargins = True
      Left = 1
      Top = 1
      Width = 447
      Height = 22
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Align = alTop
      FileTreeView = FileTreeView
      Drive = 'C'
      TabOrder = 1
    end
    object FileTypeComboBox: TBCFileTypeComboBox
      AlignWithMargins = True
      Left = 1
      Top = 279
      Width = 447
      Height = 21
      Margins.Left = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alBottom
      FileTreeViewUpdateDelay = 500
      FileTreeView = FileTreeView
      TabOrder = 2
      Text = '*.*'
    end
  end
end
