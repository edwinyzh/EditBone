object OptionsForm: TOptionsForm
  Left = 580
  Top = 154
  Caption = 'Options'
  ClientHeight = 542
  ClientWidth = 714
  Color = clWindow
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Icon.Data = {
    0000010001001010000001002000280400001600000028000000100000002000
    0000010020000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000C18C26FFC491
    2BFF000000000000000000000000000000000000000000000000000000000000
    00000000000000000000000000000000000000000000C0891EFFE7A842FFEAB0
    54FFD9A448FF000000000000000000000000000000000000000000000000BA89
    26FFB67E0EFFB57C09FFB57B09FFB57B09FFB47C0AFFBF820FFFFFF2D3FFE2A2
    39FFE8AF51FFD9A344FFB68012FFB88112FFBD8A27FF0000000000000000B67E
    0EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFAD68FFCA8509FFFFF0
    CEFFE1A135FFE9AC48FFD5B471FFFFFFFFFFBD810AFF0000000000000000B57B
    09FFFFFFFFFFE5D5CBFFE5D6CAFFE5D5C9FFF9FCFFFFFBFFFFFFCBA862FFCA83
    05FFFFEDC5FFDBB16CFFB5B8C1FF6A6A6EFF6F6F75FF87898DFF00000000B47B
    08FFFFFFFFFFE3D1C2FFE4D2C3FFE4D1C0FFF1F3F4FFF2F4F6FFF4F9FFFFC9A3
    59FFE0C289FFD9DBE3FFCECDD0FFD3D4D4FFEEEEEFFFECEAEDFF7C7B7AFFB47B
    09FFFFFFFFFFE0CCBBFFE1CEBCFFE1CCB9FFECEDEEFFEBEBEBFFECECEEFFEEF0
    F4FFF2F3F7FFA7A6A7FFDBD9DAFFD1CFCFFF767474FF7C7B7CFF817F7FFFB57B
    09FFFFFFFFFFDDC6B3FFDEC9B5FFDEC7B2FFE6E7E8FFE5E4E4FFE5E4E4FFE7E6
    E6FFEDECEBFF797775FFD9D7D6FFC5C2C2FF7B7B7DFF0000000000000000B57B
    09FFFFFFFFFFDAC1AAFFDCC4ADFFDCC3AAFFDFE0E1FFDEDEDDFFDEDDDCFFDFDE
    DDFFE5E4E3FF767370FFE3E1E2FFB3B1AFFF8A8787FF828183FF878585FFB57B
    09FFFFFFFFFFD4B89EFFD5BAA0FFD6B99EFFD5D6D8FFD5D5D5FFD5D4D4FFD6D5
    D5FFD9D9D9FFA3A2A0FFBDBBBBFFF4F4F4FFE5E5E6FFC4C4C5FF898785FFB57C
    0AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
    FFFFFFFFFFFFFFFFFFFFA8A9AFFF7D7D82FF828389FFA0A1A6FF00000000B57E
    0FFFF7E0BEFFE7B870FFE8BE7AFFE8BE7AFFE8BD79FFE8BD78FFE8BD78FFE7BD
    77FFE8BD77FFEABF79FFECBC73FFFFE6C0FFBB8008FF0000000000000000B680
    13FFF2D8AEFFCD8408FFD08A13FFD28E1AFFD49222FFD59529FFD8992FFFD99B
    36FFDB9F3EFFDEA345FFE0A64AFFF2D8ACFFB78112FF0000000000000000B882
    17FFEED09CFFECCE99FFECCF9AFFECCF9AFFECCE9AFFECCE99FFECCE98FFEBCD
    98FFEBCD97FFEBCD97FFEBCD96FFEECF9AFFB88217FF0000000000000000BE8D
    2AFFB88217FFB78116FFB78116FFB78116FFB78116FFB78116FFB78115FFB781
    15FFB68115FFB68115FFB78115FFB88217FFBF8E2DFF0000000000000000}
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PanelTop: TBCPanel
    Left = 0
    Top = 0
    Width = 714
    Height = 501
    Align = alClient
    BevelOuter = bvNone
    DoubleBuffered = True
    Padding.Top = 6
    ParentColor = True
    ParentDoubleBuffered = False
    TabOrder = 0
    SkinData.SkinSection = 'CHECKBOX'
    object Splitter: TBCSplitter
      Left = 200
      Top = 6
      Height = 495
      ShowGrip = True
      SkinData.SkinSection = 'SPLITTER'
    end
    object VirtualDrawTreeOptions: TVirtualDrawTree
      Left = 0
      Top = 6
      Width = 200
      Height = 495
      Align = alLeft
      Header.AutoSizeIndex = 0
      Header.Font.Charset = DEFAULT_CHARSET
      Header.Font.Color = clWindowText
      Header.Font.Height = -11
      Header.Font.Name = 'Tahoma'
      Header.Font.Style = []
      Header.MainColumn = -1
      Images = ImagesDataModule.ImageListSmall
      SelectionBlendFactor = 255
      TabOrder = 0
      TreeOptions.MiscOptions = [toFullRepaintOnResize, toToggleOnDblClick, toWheelPanning]
      TreeOptions.PaintOptions = [toHideFocusRect, toShowButtons, toShowDropmark, toShowRoot, toThemeAware]
      TreeOptions.SelectionOptions = [toFullRowSelect]
      OnClick = VirtualDrawTreeOptionsClick
      OnDrawNode = VirtualDrawTreeOptionsDrawNode
      OnFreeNode = VirtualDrawTreeOptionsFreeNode
      OnGetImageIndex = VirtualDrawTreeOptionsGetImageIndex
      OnGetNodeWidth = VirtualDrawTreeOptionsGetNodeWidth
      OnKeyUp = VirtualDrawTreeOptionsKeyUp
      Columns = <>
    end
    object OptionsPanel: TBCPanel
      Left = 206
      Top = 6
      Width = 508
      Height = 495
      Align = alClient
      BevelOuter = bvNone
      DoubleBuffered = True
      ParentColor = True
      ParentDoubleBuffered = False
      TabOrder = 1
      SkinData.SkinSection = 'CHECKBOX'
      object ScrollBox: TBCScrollBox
        Left = 0
        Top = 0
        Width = 508
        Height = 495
        Align = alClient
        BorderStyle = bsNone
        TabOrder = 0
        SkinData.SkinSection = 'CHECKBOX'
      end
    end
  end
  object PanelButton: TBCPanel
    Left = 0
    Top = 501
    Width = 714
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    Padding.Top = 8
    Padding.Right = 6
    Padding.Bottom = 8
    TabOrder = 1
    SkinData.SkinSection = 'CHECKBOX'
    object ButtonOK: TButton
      Left = 553
      Top = 8
      Width = 75
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alRight
      Caption = '&OK'
      Default = True
      ModalResult = 1
      TabOrder = 0
    end
    object ButtonCancel: TButton
      AlignWithMargins = True
      Left = 633
      Top = 8
      Width = 75
      Height = 25
      Margins.Left = 5
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alRight
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 1
    end
  end
  object ActionList: TActionList
    Images = ImagesDataModule.ImageList
    Left = 136
    Top = 36
    object ActionCompare: TAction
      Caption = 'Compare Files'
      ImageIndex = 69
    end
    object ActionDirectory: TAction
      Caption = 'Directory'
      ImageIndex = 116
    end
    object ActionDirectoryTabs: TAction
      Caption = 'Tabs'
      ImageIndex = 113
    end
    object ActionEditor: TAction
      Caption = 'Editor'
      ImageIndex = 104
    end
    object ActionEditorCaret: TAction
      Caption = 'Caret'
      ImageIndex = 105
    end
    object ActionEditorCodeFolding: TAction
      Caption = 'Code folding'
      ImageIndex = 106
    end
    object ActionEditorColors: TAction
      Caption = 'Colors'
      ImageIndex = 83
    end
    object ActionEditorCompletionProposal: TAction
      Caption = 'Completion proposal'
      ImageIndex = 107
    end
    object ActionEditorDefaults: TAction
      Caption = 'Defaults'
      ImageIndex = 115
    end
    object ActionEditorFonts: TAction
      Caption = 'Fonts'
      ImageIndex = 108
    end
    object ActionEditorLeftMargin: TAction
      Caption = 'Left margin'
      ImageIndex = 109
    end
    object ActionEditorMatchingPair: TAction
      Caption = 'Matching pair'
      ImageIndex = 110
    end
    object ActionEditorMinimap: TAction
      Caption = 'Minimap'
      ImageIndex = 94
    end
    object ActionEditorRightMargin: TAction
      Caption = 'Right Margin'
      ImageIndex = 111
    end
    object ActionEditorScroll: TAction
      Caption = 'Scroll'
      ImageIndex = 112
    end
    object ActionEditorSearch: TAction
      Caption = 'Search'
      ImageIndex = 34
    end
    object ActionEditorSelection: TAction
      Caption = 'Selection'
      ImageIndex = 60
    end
    object ActionEditorSpecialChars: TAction
      Caption = 'Special chars'
      ImageIndex = 59
    end
    object ActionEditorTabs: TAction
      Caption = 'Tabs'
      ImageIndex = 113
    end
    object ActionEditorTabulator: TAction
      Caption = 'Tabulator'
      ImageIndex = 114
    end
    object ActionFileTypes: TAction
      Caption = 'File Types'
      ImageIndex = 120
    end
    object ActionMainMenu: TAction
      Caption = 'Main Menu'
      ImageIndex = 117
    end
    object ActionOutput: TAction
      Caption = 'Output'
      ImageIndex = 36
    end
    object ActionOutputTabs: TAction
      Caption = 'Tabs'
      ImageIndex = 113
    end
    object ActionPrint: TAction
      Caption = 'Print'
      ImageIndex = 9
    end
    object ActionStatusBar: TAction
      Caption = 'Status bar'
      ImageIndex = 119
    end
    object ActionSQLAlignments: TAction
      Caption = 'Alignments'
      ImageIndex = 121
    end
    object ActionSQLCapitalization: TAction
      Caption = 'Capitalization'
      ImageIndex = 122
    end
    object ActionSQLFormatter: TAction
      Caption = 'SQL Formatter'
      ImageIndex = 65
    end
    object ActionSQLIndentation: TAction
      Caption = 'Indentation'
      ImageIndex = 28
    end
    object ActionSQLInsert: TAction
      Caption = 'Insert'
      ImageIndex = 123
    end
    object ActionSQLSelect: TAction
      Caption = 'Select'
      ImageIndex = 124
    end
    object ActionSQLUpdate: TAction
      Caption = 'Update'
      ImageIndex = 125
    end
    object ActionSQLWhitespace: TAction
      Caption = 'Whitespace'
      ImageIndex = 126
    end
    object ActionToolBar: TAction
      Caption = 'Tool Bar'
      ImageIndex = 118
    end
  end
  object SkinProvider: TsSkinProvider
    AddedTitle.Font.Charset = DEFAULT_CHARSET
    AddedTitle.Font.Color = clNone
    AddedTitle.Font.Height = -11
    AddedTitle.Font.Name = 'Tahoma'
    AddedTitle.Font.Style = []
    FormHeader.AdditionalHeight = 0
    SkinData.SkinSection = 'FORM'
    TitleButtons = <>
    Left = 271
    Top = 52
  end
end
