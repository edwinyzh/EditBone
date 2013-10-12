object DocTabSheetFrame: TDocTabSheetFrame
  Left = 0
  Top = 0
  Width = 664
  Height = 547
  Align = alClient
  TabOrder = 0
  object Panel: TPanel
    Left = 0
    Top = 0
    Width = 664
    Height = 547
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
      Height = 544
      Color = clBtnFace
      ParentColor = False
      Visible = False
    end
    object VirtualDrawTree: TVirtualDrawTree
      Left = 1
      Top = 1
      Width = 200
      Height = 544
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
      Width = 459
      Height = 544
      Align = alClient
      BevelOuter = bvNone
      Color = clWindow
      ParentBackground = False
      TabOrder = 1
      object HorizontalSplitter: TSplitter
        Left = 0
        Top = 263
        Width = 459
        Height = 4
        Cursor = crVSplit
        Align = alBottom
        ParentColor = False
        Visible = False
      end
      object SynEditSplitter: TSplitter
        Left = 255
        Top = 0
        Width = 4
        Height = 263
        Align = alRight
        ParentColor = False
        Visible = False
      end
      object SplitSynEditPanel: TPanel
        Left = 0
        Top = 267
        Width = 459
        Height = 277
        Align = alBottom
        BevelOuter = bvNone
        ParentColor = True
        TabOrder = 0
        Visible = False
        object SplitSynEditSplitter: TSplitter
          Left = 255
          Top = 0
          Width = 4
          Height = 277
          Align = alRight
          Color = clBtnFace
          ParentColor = False
          Visible = False
        end
        object SplitSynEdit: TBCSynEdit
          Left = 0
          Top = 0
          Width = 255
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
        object SplitSynEditMinimap: TBCSynEdit
          Left = 259
          Top = 0
          Width = 200
          Height = 277
          Align = alRight
          ActiveLineColor = clSkyBlue
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -1
          Font.Name = 'Courier New'
          Font.Style = []
          TabOrder = 1
          Visible = False
          Gutter.Font.Charset = DEFAULT_CHARSET
          Gutter.Font.Color = clWindowText
          Gutter.Font.Height = -11
          Gutter.Font.Name = 'Courier New'
          Gutter.Font.Style = []
          Gutter.Visible = False
          Gutter.Width = 0
          Options = [eoAutoIndent, eoDragDropEditing, eoEnhanceEndKey, eoGroupUndo, eoScrollPastEol, eoSpecialLineDefaultFg, eoTabsToSpaces, eoTrimTrailingSpaces]
          ReadOnly = True
          ScrollBars = ssNone
          FontSmoothing = fsmNone
        end
      end
      object SynEdit: TBCSynEdit
        Left = 0
        Top = 0
        Width = 255
        Height = 263
        Align = alClient
        ActiveLineColor = clSkyBlue
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        TabOrder = 1
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
      object SynEditMiniMap: TBCSynEdit
        Left = 259
        Top = 0
        Width = 200
        Height = 263
        Align = alRight
        ActiveLineColor = clSkyBlue
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -1
        Font.Name = 'Courier New'
        Font.Style = []
        TabOrder = 2
        Visible = False
        Gutter.Font.Charset = DEFAULT_CHARSET
        Gutter.Font.Color = clWindowText
        Gutter.Font.Height = -11
        Gutter.Font.Name = 'Courier New'
        Gutter.Font.Style = []
        Gutter.Visible = False
        Gutter.Width = 0
        Options = [eoAutoIndent, eoDragDropEditing, eoEnhanceEndKey, eoGroupUndo, eoScrollPastEol, eoSpecialLineDefaultFg, eoTabsToSpaces, eoTrimTrailingSpaces]
        ReadOnly = True
        ScrollBars = ssNone
        OnPaint = SynEditMiniMapPaint
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
  object SynCompletionProposal: TSynCompletionProposal
    Options = [scoLimitToMatchedText, scoUsePrettyText, scoCompleteWithTab, scoCompleteWithEnter]
    ItemList.Strings = (
      'Test'
      'Char'
      'Character')
    Width = 160
    EndOfTokenChr = '()[]. '
    TriggerChars = '.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clBtnText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    Columns = <>
    Resizeable = False
    Margin = 4
    OnExecute = SynCompletionProposalExecute
    ShortCut = 16416
    Editor = SynEdit
    Left = 64
    Top = 64
  end
  object SplitSynCompletionProposal: TSynCompletionProposal
    Options = [scoCaseSensitive, scoLimitToMatchedText, scoUsePrettyText, scoCompleteWithTab, scoCompleteWithEnter]
    ItemList.Strings = (
      'Test'
      'Char'
      'Character')
    EndOfTokenChr = '()[]. '
    TriggerChars = '.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clBtnText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    Columns = <>
    Resizeable = False
    Margin = 4
    OnExecute = SplitSynCompletionProposalExecute
    ShortCut = 16416
    Editor = SplitSynEdit
    Left = 64
    Top = 124
  end
end
