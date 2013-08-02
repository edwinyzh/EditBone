object DocTabSheetFrame: TDocTabSheetFrame
  Left = 0
  Top = 0
  Width = 865
  Height = 561
  Align = alClient
  TabOrder = 0
  object Panel: TPanel
    Left = 0
    Top = 0
    Width = 865
    Height = 561
    Align = alClient
    BevelOuter = bvNone
    Padding.Left = 1
    Padding.Top = 1
    Padding.Bottom = 2
    ParentColor = True
    TabOrder = 0
    object VerticalSplitter: TSplitter
      Left = 201
      Top = 1
      Width = 4
      Height = 558
      Color = clBtnFace
      ParentColor = False
      Visible = False
      ExplicitHeight = 546
    end
    object VirtualDrawTree: TVirtualDrawTree
      Left = 1
      Top = 1
      Width = 200
      Height = 558
      Align = alLeft
      DragOperations = []
      Header.AutoSizeIndex = 0
      Header.Font.Charset = DEFAULT_CHARSET
      Header.Font.Color = clWindowText
      Header.Font.Height = -11
      Header.Font.Name = 'Tahoma'
      Header.Font.Style = []
      Header.MainColumn = -1
      TabOrder = 0
      Visible = False
      OnDrawNode = VirtualDrawTreeDrawNode
      OnFreeNode = VirtualDrawTreeFreeNode
      OnGetImageIndex = VirtualDrawTreeGetImageIndex
      OnGetNodeWidth = VirtualDrawTreeGetNodeWidth
      OnInitChildren = VirtualDrawTreeInitChildren
      OnInitNode = VirtualDrawTreeInitNode
      Columns = <>
    end
    object DocumentPanel: TPanel
      Left = 205
      Top = 1
      Width = 660
      Height = 558
      Align = alClient
      BevelOuter = bvNone
      Color = clWindow
      ParentBackground = False
      TabOrder = 1
      object HorizontalSplitter: TSplitter
        Left = 0
        Top = 277
        Width = 660
        Height = 4
        Cursor = crVSplit
        Align = alBottom
        ParentColor = False
        Visible = False
        ExplicitLeft = 2
        ExplicitTop = 285
        ExplicitWidth = 665
      end
      object SynEditSplitter: TSplitter
        Left = 456
        Top = 0
        Width = 4
        Height = 277
        Align = alRight
        ParentColor = False
        Visible = False
        ExplicitLeft = 546
        ExplicitTop = 4
        ExplicitHeight = 303
      end
      object SplitSynEditPanel: TPanel
        Left = 0
        Top = 281
        Width = 660
        Height = 277
        Align = alBottom
        BevelOuter = bvNone
        ParentColor = True
        TabOrder = 0
        Visible = False
        object SplitSynEditSplitter: TSplitter
          Left = 456
          Top = 0
          Width = 4
          Height = 277
          Align = alRight
          Color = clBtnFace
          ParentColor = False
          Visible = False
          ExplicitLeft = 466
          ExplicitHeight = 365
        end
        object SplitSynEdit: TBCSynEdit
          Left = 0
          Top = 0
          Width = 456
          Height = 277
          Align = alClient
          ActiveLineColor = clSkyBlue
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          TabOrder = 0
          Gutter.AutoSize = True
          Gutter.Font.Charset = DEFAULT_CHARSET
          Gutter.Font.Color = clWindowText
          Gutter.Font.Height = -11
          Gutter.Font.Name = 'Courier New'
          Gutter.Font.Style = []
          Gutter.ShowLineNumbers = True
          Options = [eoAltSetsColumnMode, eoAutoIndent, eoDragDropEditing, eoEnhanceEndKey, eoGroupUndo, eoScrollPastEol, eoShowScrollHint, eoSpecialLineDefaultFg, eoTabsToSpaces, eoTrimTrailingSpaces]
          WantTabs = True
          FontSmoothing = fsmNone
        end
        object SplitSynEditMinimap: TSynMiniMap
          Left = 460
          Top = 0
          Width = 200
          Height = 277
          Editor = SplitSynEdit
          FontFactor = 2.000000000000000000
          Options.AllowScroll = True
          Options.ReverseScroll = False
          Options.TabWidthOverride = False
          Options.TabWidth = 4
          PixelFormat = pf32bit
          OnClick = SplitSynEditMinimapClick
          UseThemes = True
          Align = alRight
          Visible = False
        end
      end
      object SynEditMinimap: TSynMiniMap
        Left = 460
        Top = 0
        Width = 200
        Height = 277
        Editor = SynEdit
        FontFactor = 2.000000000000000000
        Options.AllowScroll = True
        Options.ReverseScroll = False
        Options.TabWidthOverride = False
        Options.TabWidth = 4
        PixelFormat = pf32bit
        OnClick = SynEditMinimapClick
        UseThemes = True
        Align = alRight
        Visible = False
      end
      object SynEdit: TBCSynEdit
        Left = 0
        Top = 0
        Width = 456
        Height = 277
        Align = alClient
        ActiveLineColor = clSkyBlue
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        TabOrder = 2
        Gutter.AutoSize = True
        Gutter.Font.Charset = DEFAULT_CHARSET
        Gutter.Font.Color = clWindowText
        Gutter.Font.Height = -11
        Gutter.Font.Name = 'Courier New'
        Gutter.Font.Style = []
        Gutter.ShowLineNumbers = True
        Options = [eoAltSetsColumnMode, eoAutoIndent, eoDragDropEditing, eoEnhanceEndKey, eoGroupUndo, eoScrollPastEol, eoShowScrollHint, eoSpecialLineDefaultFg, eoTabsToSpaces, eoTrimTrailingSpaces]
        WantTabs = True
        FontSmoothing = fsmNone
      end
    end
  end
  object XMLDocument: TXMLDocument
    Left = 310
    Top = 28
    DOMVendorDesc = 'MSXML'
  end
  object SynURISyn: TSynURISyn
    Tag = 52
    URIAttri.Style = []
    VisitedURIAttri.Style = []
    Left = 294
    Top = 88
  end
  object SynURIOpener: TSynURIOpener
    Editor = SynEdit
    URIHighlighter = SynURISyn
    Left = 298
    Top = 148
  end
end
