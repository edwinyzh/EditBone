object DirTabSheetFrame: TDirTabSheetFrame
  Left = 0
  Top = 0
  Width = 323
  Height = 489
  TabOrder = 0
  object Panel: TPanel
    Left = 0
    Top = 0
    Width = 323
    Height = 489
    Align = alClient
    BevelOuter = bvNone
    Padding.Left = 1
    Padding.Top = 1
    Padding.Right = 3
    Padding.Bottom = 2
    ParentColor = True
    TabOrder = 0
    object DriveComboBoxPanel: TPanel
      Left = 1
      Top = 462
      Width = 319
      Height = 25
      Align = alBottom
      AutoSize = True
      BevelOuter = bvNone
      Padding.Top = 3
      ParentColor = True
      TabOrder = 0
      object DriveComboBox: TBCDriveComboBox
        Left = 0
        Top = 3
        Width = 319
        Height = 22
        Align = alClient
        FileTreeView = FileTreeView
        Drive = 'C'
        TabOrder = 0
        ExplicitLeft = 1
        ExplicitWidth = 318
      end
    end
    object FileTreeViewPanel: TPanel
      Left = 1
      Top = 1
      Width = 319
      Height = 461
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object FileTreeView: TBCFileTreeView
        Left = 0
        Top = 0
        Width = 319
        Height = 461
        Align = alClient
        DragOperations = []
        EditDelay = 500
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
        TabOrder = 0
        TreeOptions.AutoOptions = [toAutoDropExpand, toAutoScroll, toAutoScrollOnExpand, toAutoTristateTracking, toAutoDeleteMovedNodes, toAutoChangeScale]
        TreeOptions.MiscOptions = [toEditable, toFullRepaintOnResize, toInitOnSave, toToggleOnDblClick, toWheelPanning, toEditOnClick]
        TreeOptions.PaintOptions = [toShowBackground, toShowButtons, toShowDropmark, toShowRoot, toThemeAware, toUseBlendedSelection]
        Columns = <>
      end
    end
  end
end
