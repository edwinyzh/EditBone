inherited OptionsFileTypesFrame: TOptionsFileTypesFrame
  Width = 451
  Height = 305
  Align = alClient
  Visible = False
  ExplicitWidth = 451
  ExplicitHeight = 305
  object FileTypesBottomPanel: TPanel
    Left = 0
    Top = 263
    Width = 451
    Height = 42
    Align = alBottom
    BevelOuter = bvNone
    Padding.Left = 4
    TabOrder = 0
    DesignSize = (
      451
      42)
    object ExtensionsLabel: TLabel
      Left = 6
      Top = 4
      Width = 52
      Height = 13
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Anchors = [akLeft, akBottom]
      Caption = 'Extensions'
    end
    object ExtensionsEdit: TBCEdit
      Left = 4
      Top = 21
      Width = 447
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alBottom
      TabOrder = 0
      OnChange = ExtensionsEditChange
      EnterToTab = False
      OnlyNumbers = False
      NumbersWithDots = False
      NumbersWithSpots = False
      ErrorColor = 14803198
      NumbersAllowNegative = False
    end
  end
  object FileTypesTopPanel: TPanel
    Left = 0
    Top = 0
    Width = 451
    Height = 263
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object VirtualDrawTree: TVirtualDrawTree
      AlignWithMargins = True
      Left = 4
      Top = 0
      Width = 447
      Height = 263
      Hint = 
        'Use drag and drop to move menu items. Right click popup menu to ' +
        'insert and delete items.'
      Margins.Left = 4
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alClient
      Ctl3D = True
      DragOperations = []
      EditDelay = 0
      Header.AutoSizeIndex = 0
      Header.DefaultHeight = 20
      Header.Font.Charset = DEFAULT_CHARSET
      Header.Font.Color = clWindowText
      Header.Font.Height = -11
      Header.Font.Name = 'Tahoma'
      Header.Font.Style = []
      Header.Height = 20
      Header.Options = [hoAutoResize, hoShowSortGlyphs, hoVisible, hoAutoSpring]
      Images = ImagesDataModule.ImageList
      Indent = 0
      ParentCtl3D = False
      SelectionBlendFactor = 255
      TabOrder = 0
      TreeOptions.AutoOptions = [toAutoDropExpand, toAutoScrollOnExpand]
      TreeOptions.PaintOptions = [toHideFocusRect, toShowButtons, toShowDropmark, toShowRoot, toThemeAware, toUseBlendedSelection]
      TreeOptions.SelectionOptions = [toFullRowSelect, toMiddleClickSelect]
      WantTabs = True
      OnClick = VirtualDrawTreeClick
      OnDrawNode = VirtualDrawTreeDrawNode
      OnGetNodeWidth = VirtualDrawTreeGetNodeWidth
      Columns = <
        item
          Options = [coEnabled, coParentBidiMode, coParentColor, coVisible, coAutoSpring]
          Position = 0
          Width = 443
          WideText = 'File Type'
        end>
    end
  end
end
