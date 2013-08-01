object DocTabSheetFrame: TDocTabSheetFrame
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
      Height = 299
      Color = clBtnFace
      ParentColor = False
      Visible = False
      ExplicitLeft = 216
      ExplicitTop = 90
      ExplicitHeight = 100
    end
    object VirtualDrawTree: TVirtualDrawTree
      Left = 1
      Top = 1
      Width = 200
      Height = 299
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
      Left = 204
      Top = 1
      Width = 247
      Height = 299
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object HorizontalSplitter: TSplitter
        Left = 0
        Top = 118
        Width = 247
        Height = 3
        Cursor = crVSplit
        Align = alBottom
        Visible = False
        ExplicitTop = 0
        ExplicitWidth = 232
      end
      object Splitter1: TSplitter
        Left = 38
        Top = 0
        Height = 118
        Align = alRight
        ExplicitLeft = 720
        ExplicitTop = -6
        ExplicitHeight = 256
      end
      object SplitSynEdit: TBCSynEdit
        Left = 0
        Top = 121
        Width = 247
        Height = 178
        Align = alBottom
        ActiveLineColor = clSkyBlue
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        TabOrder = 0
        Visible = False
        Gutter.AutoSize = True
        Gutter.Font.Charset = DEFAULT_CHARSET
        Gutter.Font.Color = clWindowText
        Gutter.Font.Height = -11
        Gutter.Font.Name = 'Courier New'
        Gutter.Font.Style = []
        Gutter.ShowLineNumbers = True
        Options = [eoAltSetsColumnMode, eoAutoIndent, eoDragDropEditing, eoEnhanceEndKey, eoGroupUndo, eoScrollPastEol, eoShowScrollHint, eoSmartTabDelete, eoSmartTabs, eoSpecialLineDefaultFg, eoTabsToSpaces, eoTrimTrailingSpaces]
        WantTabs = True
        FontSmoothing = fsmNone
      end
      object MinimapPanel: TPanel
        Left = 41
        Top = 0
        Width = 206
        Height = 118
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 1
        object SynMiniMap1: TSynMiniMap
          Left = 0
          Top = 0
          Width = 206
          Height = 118
          Colors.Background = clWhite
          Colors.Highlight = clWhite
          Colors.PreviousLine = clNone
          Colors.PreviousLineText = clNone
          Colors.Text = clGray
          Colors.TextHighlight = clGray
          Editor = SynEdit
          FontFactor = 2.000000000000000000
          Options.AllowScroll = True
          Options.ReverseScroll = False
          Options.TabWidthOverride = False
          Options.TabWidth = 4
          PixelFormat = pf32bit
          OnClick = SynMiniMap1Click
          Ctl3D = True
          Align = alClient
        end
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 38
        Height = 118
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 2
        object SynEdit: TBCSynEdit
          Left = 0
          Top = 0
          Width = 38
          Height = 118
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
          Options = [eoAltSetsColumnMode, eoAutoIndent, eoDragDropEditing, eoEnhanceEndKey, eoGroupUndo, eoScrollPastEol, eoShowScrollHint, eoSmartTabDelete, eoSmartTabs, eoSpecialLineDefaultFg, eoTabsToSpaces, eoTrimTrailingSpaces]
          WantTabs = True
          FontSmoothing = fsmNone
        end
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
    URIHighlighter = SynURISyn
    Left = 298
    Top = 148
  end
end
