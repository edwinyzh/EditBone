inherited OptionsFileTypesFrame: TOptionsFileTypesFrame
  Width = 451
  Height = 305
  Align = alClient
  Visible = False
  object PanelFileTypesBottom: TBCPanel [0]
    Left = 0
    Top = 263
    Width = 451
    Height = 42
    Align = alBottom
    BevelOuter = bvNone
    Color = clWindow
    Padding.Left = 4
    ParentBackground = False
    TabOrder = 0
    SkinData.SkinSection = 'CHECKBOX'
    object EditExtensions: TBCEdit
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
      OnChange = EditExtensionsChange
      SkinData.SkinSection = 'EDIT'
      BoundLabel.Active = True
      BoundLabel.Caption = 'Extensions'
      BoundLabel.Indent = 4
      BoundLabel.Layout = sclTopLeft
      EnterToTab = False
      OnlyNumbers = False
      NumbersWithDots = False
      NumbersWithSpots = False
      ErrorColor = 14803198
      NumbersAllowMinus = False
      NumbersAllowPlus = False
    end
  end
  object FileTypesTopPanel: TBCPanel [1]
    Left = 0
    Top = 0
    Width = 451
    Height = 263
    Align = alClient
    BevelOuter = bvNone
    Color = clWindow
    ParentBackground = False
    TabOrder = 1
    SkinData.SkinSection = 'CHECKBOX'
    object VirtualDrawTree: TVirtualDrawTree
      AlignWithMargins = True
      Left = 4
      Top = 0
      Width = 447
      Height = 262
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
      Indent = 0
      ParentCtl3D = False
      SelectionBlendFactor = 255
      TabOrder = 0
      TreeOptions.AutoOptions = [toAutoDropExpand, toAutoScrollOnExpand]
      TreeOptions.PaintOptions = [toHideFocusRect, toShowButtons, toShowDropmark, toShowRoot, toThemeAware]
      TreeOptions.SelectionOptions = [toFullRowSelect, toMiddleClickSelect]
      WantTabs = True
      OnClick = VirtualDrawTreeClick
      OnDrawNode = VirtualDrawTreeDrawNode
      OnFreeNode = VirtualDrawTreeFreeNode
      OnGetNodeWidth = VirtualDrawTreeGetNodeWidth
      Columns = <
        item
          Options = [coEnabled, coParentBidiMode, coParentColor, coVisible, coAutoSpring]
          Position = 0
          Width = 447
          WideText = 'File Type'
        end>
    end
  end
end
