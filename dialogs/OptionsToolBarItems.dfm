object OptionsToolBarItemsDialog: TOptionsToolBarItemsDialog
  Left = 0
  Top = 0
  Caption = 'Select Items'
  ClientHeight = 376
  ClientWidth = 314
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object ButtonPanel: TPanel
    Left = 0
    Top = 344
    Width = 314
    Height = 32
    Align = alBottom
    BevelOuter = bvNone
    Padding.Left = 8
    Padding.Right = 8
    Padding.Bottom = 8
    TabOrder = 0
    ExplicitLeft = -61
    ExplicitTop = 255
    ExplicitWidth = 456
    object OKButton: TButton
      Left = 148
      Top = 0
      Width = 75
      Height = 24
      Align = alRight
      Caption = 'Add'
      Default = True
      TabOrder = 0
      ExplicitLeft = 290
    end
    object CancelButton: TButton
      Left = 231
      Top = 0
      Width = 75
      Height = 24
      Align = alRight
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 1
      ExplicitLeft = 373
    end
    object ButtonDividerPanel: TPanel
      Left = 223
      Top = 0
      Width = 8
      Height = 24
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 2
      ExplicitLeft = 365
    end
  end
  object VirtualDrawTree: TVirtualDrawTree
    AlignWithMargins = True
    Left = 6
    Top = 6
    Width = 302
    Height = 332
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
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
    Header.Options = [hoAutoResize, hoShowImages, hoShowSortGlyphs, hoVisible, hoAutoSpring]
    Indent = 0
    ParentCtl3D = False
    SelectionBlendFactor = 255
    TabOrder = 1
    TreeOptions.AutoOptions = [toAutoDropExpand, toAutoScrollOnExpand]
    TreeOptions.PaintOptions = [toHideFocusRect, toShowButtons, toShowDropmark, toShowRoot, toThemeAware, toGhostedIfUnfocused, toUseBlendedSelection]
    TreeOptions.SelectionOptions = [toFullRowSelect, toMiddleClickSelect]
    WantTabs = True
    OnDrawNode = VirtualDrawTreeDrawNode
    OnGetImageIndex = VirtualDrawTreeGetImageIndex
    OnGetNodeWidth = VirtualDrawTreeGetNodeWidth
    ExplicitLeft = -133
    ExplicitTop = 0
    ExplicitWidth = 447
    ExplicitHeight = 305
    Columns = <
      item
        CheckBox = True
        Options = [coEnabled, coParentBidiMode, coParentColor, coVisible, coAutoSpring]
        Position = 0
        Width = 298
        WideText = 'Menu Item'
      end>
  end
end
