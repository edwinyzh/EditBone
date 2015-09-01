object LanguageEditorForm: TLanguageEditorForm
  Left = 0
  Top = 0
  Caption = 'Language Editor - [%s]'
  ClientHeight = 474
  ClientWidth = 820
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Icon.Data = {
    0000010001001010000001002000280400001600000028000000100000002000
    0000010020000000000000000000000000000000000000000000000000000000
    0023000000330000003300000033000000330000003300000033000000330000
    003300000033000000330000003300000033000000330000002C000000007F7F
    7FC0848484FF828282FF818181FF818181FF818181FF818181FF828282FF8282
    82FF828282FF828282FF828282FF828282FF848484FF838383E1000000008484
    84FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF848484FF000000008282
    82FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4240
    40FFFFFFFFFF292626FFFFFFFFFFFFFFFFFFFFFFFFFF828282FF000000008181
    81FFFFFFFFFFFFFFFFFFFFFFFFFF5B5959FF211F20FFFFFFFFFFFFFFFFFF7675
    75FF737171FF363435FFFFFFFFFF6C6969FFFFFFFFFF838383FF000000008181
    81FFFFFFFFFFFFFEFEFF1C191BFFFFFFFFFF595757FFFFFFFFFFFFFFFFFF3F3D
    3EFF3C3B3BFF3C3A3BFF2D2D2CFF312E30FFFFFFFFFF838383FF000000008282
    82FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB7B8B6FF3B3B
    3BFF8A8B8BFF353234FFFFFFFFFFFFFFFFFFFFFFFFFF828282FF000000008383
    83FFFFFFFFFF767575FF282627FFFFFFFFFF222121FFFFFFFFFF4A4A4AFFE7E7
    E5FF424242FF2A2829FFFFFFFFFFF9F9F8FFFFFFFFFF828282FF000000008383
    83FFFFFFFFFF252223FF312F30FF2E2C2DFF2A2829FFFFFFFFFF545454FFFFFF
    FFFF3B3C3CFFFFFFFFFFF0EFEEFF222121FFFFFFFFFF838383FF000000008383
    83FFFFFFFFFFFFFFFFFF282829FFFFFFFFFF282728FFFFFFFFFFFFFEFDFFFFFF
    FFFF989797FF282627FFFFFFFFFFC2C1C0FFFFFFFFFF838383FF000000008383
    83FFFFFFFFFF161517FF1D1C1DFFFCFBFAFF1F1E1EFF211E20FF211E20FF2321
    22FF2A2829FF2E2B2DFF242223FF181517FFFFFFFFFF838383FF000000008282
    82FFFFFFFFFFE8E8E6FFEAEAE8FFE8E8E6FFECECEAFFF2F2F0FFF8F8F6FFFDFD
    FAFFFFFFFFFF201E20FFF6F7F4FFEAEAE8FFFFFFFFFF828282FF000000008282
    82FFFFFFFFFFDCDAD8FFDDDCD9FFDDDCDAFFDFDEDCFFE5E4E2FF131213FF1A19
    19FF1A191AFF838281FFE5E4E2FFDDDCD9FFFFFFFFFF828282FF000000008282
    82FFFFFFFFFFD4D3D0FFD5D4D2FFD5D4D2FFD6D5D3FFD9D8D6FFE0DFDCFFE3E2
    DFFFE2E1DEFFDEDDDAFFD8D7D4FFD5D4D1FFFFFFFFFF828282FF000000008484
    84FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF848484FF000000008787
    87EF858585FF828282FF828282FF828282FF828282FF828282FF828282FF8282
    82FF828282FF828282FF828282FF828282FF858585FF878787EF00000000}
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar: TBCStatusBar
    Left = 0
    Top = 455
    Width = 820
    Height = 19
    Panels = <
      item
        Width = 86
      end
      item
        Width = 86
      end
      item
        Width = 86
      end>
    SkinData.SkinSection = 'STATUSBAR'
  end
  object VirtualTreePanel: TBCPanel
    Left = 0
    Top = 58
    Width = 820
    Height = 397
    Align = alClient
    BevelOuter = bvNone
    Padding.Left = 4
    Padding.Right = 4
    Padding.Bottom = 4
    TabOrder = 1
    SkinData.SkinSection = 'CHECKBOX'
    object VirtualDrawTree: TVirtualDrawTree
      Left = 4
      Top = 0
      Width = 812
      Height = 393
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
      Header.Options = [hoColumnResize, hoShowSortGlyphs, hoVisible]
      Images = ImagesDataModule.ImageListSmall
      ParentCtl3D = False
      TabOrder = 0
      TreeOptions.AutoOptions = [toAutoDropExpand, toAutoScrollOnExpand]
      TreeOptions.MiscOptions = [toEditable, toFullRepaintOnResize, toGridExtensions, toInitOnSave, toToggleOnDblClick, toWheelPanning, toEditOnClick]
      TreeOptions.PaintOptions = [toHideFocusRect, toHotTrack, toShowButtons, toShowDropmark, toShowHorzGridLines, toShowRoot, toShowVertGridLines, toThemeAware]
      TreeOptions.SelectionOptions = [toDisableDrawSelection, toExtendedFocus, toMiddleClickSelect, toRightClickSelect]
      WantTabs = True
      OnCompareNodes = VirtualDrawTreeCompareNodes
      OnCreateEditor = VirtualDrawTreeCreateEditor
      OnDrawNode = VirtualDrawTreeDrawNode
      OnEdited = VirtualDrawTreeEdited
      OnEditing = VirtualDrawTreeEditing
      OnFreeNode = VirtualDrawTreeFreeNode
      OnGetImageIndex = VirtualDrawTreeGetImageIndex
      OnGetNodeWidth = VirtualDrawTreeGetNodeWidth
      OnInitChildren = VirtualDrawTreeInitChildren
      OnInitNode = VirtualDrawTreeInitNode
      Columns = <
        item
          Position = 0
          Width = 220
          WideText = 'Object'
        end
        item
          Position = 1
          Width = 220
          WideText = 'Caption'
        end
        item
          Position = 2
          Width = 220
          WideText = 'Hint'
        end
        item
          Position = 3
          Width = 120
          WideText = 'Shortcut'
        end>
    end
  end
  object ButtonPanel: TBCPanel
    Left = 0
    Top = 0
    Width = 820
    Height = 58
    Align = alTop
    BevelOuter = bvNone
    Color = clWindow
    Padding.Left = 2
    Padding.Top = 2
    Padding.Right = 2
    Padding.Bottom = 2
    TabOrder = 2
    SkinData.SkinSection = 'CHECKBOX'
    object SpeedButtonOpen: TBCSpeedButton
      Left = 62
      Top = 2
      Width = 60
      Height = 54
      Action = ActionFileOpen
      Align = alLeft
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Segoe UI'
      Font.Style = []
      Layout = blGlyphTop
      ParentFont = False
      ButtonStyle = tbsTextButton
      SkinData.SkinSection = 'TOOLBUTTON'
      ImageIndex = 1
      Images = ImagesDataModule.ImageList
    end
    object SpeedButtonNew: TBCSpeedButton
      Left = 2
      Top = 2
      Width = 60
      Height = 54
      Action = ActionFileNew
      Align = alLeft
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Segoe UI'
      Font.Style = []
      Layout = blGlyphTop
      ParentFont = False
      ButtonStyle = tbsTextButton
      SkinData.SkinSection = 'TOOLBUTTON'
      ImageIndex = 0
      Images = ImagesDataModule.ImageList
    end
    object SpeedButtonDivider1: TBCSpeedButton
      AlignWithMargins = True
      Left = 122
      Top = 6
      Width = 10
      Height = 46
      Margins.Left = 0
      Margins.Top = 4
      Margins.Right = 0
      Margins.Bottom = 4
      Align = alLeft
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      Layout = blGlyphTop
      ParentFont = False
      ButtonStyle = tbsDivider
      SkinData.SkinSection = 'SPEEDBUTTON'
      ImageIndex = 1
    end
    object SpeedButtonSave: TBCSpeedButton
      Left = 132
      Top = 2
      Width = 60
      Height = 54
      Action = ActionFileSave
      Align = alLeft
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Segoe UI'
      Font.Style = []
      Layout = blGlyphTop
      ParentFont = False
      ButtonStyle = tbsTextButton
      SkinData.SkinSection = 'TOOLBUTTON'
      ImageIndex = 3
      Images = ImagesDataModule.ImageList
    end
    object SpeedButtonDivider2: TBCSpeedButton
      AlignWithMargins = True
      Left = 192
      Top = 6
      Width = 10
      Height = 46
      Margins.Left = 0
      Margins.Top = 4
      Margins.Right = 0
      Margins.Bottom = 4
      Align = alLeft
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      Layout = blGlyphTop
      ParentFont = False
      ButtonStyle = tbsDivider
      SkinData.SkinSection = 'SPEEDBUTTON'
      ImageIndex = 1
    end
    object SpeedButtonClose: TBCSpeedButton
      Left = 202
      Top = 2
      Width = 60
      Height = 54
      Action = ActionExit
      Align = alLeft
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Segoe UI'
      Font.Style = []
      Layout = blGlyphTop
      ParentFont = False
      ButtonStyle = tbsTextButton
      SkinData.SkinSection = 'TOOLBUTTON'
      ImageIndex = 11
      Images = ImagesDataModule.ImageList
    end
  end
  object ActionList: TActionList
    Images = ImagesDataModule.ImageList
    Left = 182
    Top = 118
    object ActionFileNew: TAction
      Caption = 'New'
      Hint = 'Create a new language file'
      ImageIndex = 0
      OnExecute = ActionFileNewExecute
    end
    object ActionFileOpen: TAction
      Caption = 'Open'
      Hint = 'Open an existing language file'
      ImageIndex = 1
      OnExecute = ActionFileOpenExecute
    end
    object ActionFileSave: TAction
      Caption = 'Save'
      Hint = 'Save file'
      ImageIndex = 3
      OnExecute = ActionFileSaveExecute
    end
    object ActionExit: TAction
      Caption = 'Exit'
      Hint = 'Exit the language editor'
      ImageIndex = 11
      OnExecute = ActionExitExecute
    end
  end
  object ApplicationEvents: TApplicationEvents
    OnHint = ApplicationEventsHint
    OnMessage = ApplicationEventsMessage
    Left = 84
    Top = 128
  end
  object OpenDialog: TsOpenDialog
    Left = 54
    Top = 72
  end
  object SaveDialog: TsSaveDialog
    Left = 28
    Top = 118
  end
  object SkinProvider: TsSkinProvider
    AddedTitle.Font.Charset = DEFAULT_CHARSET
    AddedTitle.Font.Color = clNone
    AddedTitle.Font.Height = -11
    AddedTitle.Font.Name = 'Tahoma'
    AddedTitle.Font.Style = []
    SkinData.SkinSection = 'FORM'
    TitleButtons = <>
    Left = 260
    Top = 95
  end
end
