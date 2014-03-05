object DocTabSheetFrame: TDocTabSheetFrame
  Left = 0
  Top = 0
  Width = 451
  Height = 302
  Align = alClient
  Color = clWindow
  ParentBackground = False
  ParentColor = False
  TabOrder = 0
  object Panel: TPanel
    Left = 0
    Top = 0
    Width = 451
    Height = 302
    Align = alClient
    BevelOuter = bvNone
    Color = clWindow
    Padding.Left = 1
    Padding.Top = 1
    Padding.Bottom = 2
    ParentBackground = False
    TabOrder = 0
    object VerticalSplitter: TSplitter
      Left = 201
      Top = 1
      Width = 4
      Height = 299
      ParentColor = False
      Visible = False
      ExplicitHeight = 302
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
      OnClick = VirtualDrawTreeClick
      OnDrawNode = VirtualDrawTreeDrawNode
      OnFreeNode = VirtualDrawTreeFreeNode
      OnGetImageIndex = VirtualDrawTreeGetImageIndex
      OnGetNodeWidth = VirtualDrawTreeGetNodeWidth
      OnInitNode = VirtualDrawTreeInitNode
      Columns = <>
    end
    object DocumentPanel: TPanel
      Left = 205
      Top = 1
      Width = 246
      Height = 299
      Align = alClient
      BevelOuter = bvNone
      Color = clWindow
      ParentBackground = False
      TabOrder = 1
      object HorizontalSplitter: TSplitter
        Left = 0
        Top = 18
        Width = 246
        Height = 4
        Cursor = crVSplit
        Align = alBottom
        ParentColor = False
        Visible = False
        ExplicitTop = 21
      end
      object SplitSynEditPanel: TPanel
        Left = 0
        Top = 22
        Width = 246
        Height = 277
        Align = alBottom
        BevelOuter = bvNone
        ParentColor = True
        TabOrder = 0
        Visible = False
        object SplitSynEdit: TBCSynEdit
          Left = 0
          Top = 0
          Width = 246
          Height = 277
          Align = alClient
          ActiveLineColor = clSkyBlue
          CodeFolding.CaseSensitive = False
          CodeFolding.FolderBarLinesColor = 12434877
          ActiveLine.Background = clYellow
          ActiveLine.Foreground = clNavy
          ActiveLine.Visible = True
          LineDivider.Visible = False
          LineDivider.Color = clRed
          LineDivider.Style = psSolid
          RightEdge.MouseMove = False
          RightEdge.Visible = True
          RightEdge.Position = 80
          RightEdge.Color = clSilver
          RightEdge.Style = psSolid
          LineSpacing = 0
          LineSpacingRule = lsSpecified
          Background.Visible = False
          Background.RepeatMode = brmNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          TabOrder = 0
          Gutter.ShowLineModified = True
          Gutter.LineModifiedColor = clYellow
          Gutter.LineNormalColor = clLime
          Gutter.Intens = False
          Gutter.AutoSize = True
          Gutter.Color = clWindow
          Gutter.Font.Charset = DEFAULT_CHARSET
          Gutter.Font.Color = clWindowText
          Gutter.Font.Height = -11
          Gutter.Font.Name = 'Courier New'
          Gutter.Font.Style = []
          Gutter.BookmarkPanelColor = clNone
          Gutter.RightOffsetColor = clNone
          Gutter.ShowLineNumbers = True
          Gutter.ShowBookmarks = False
          Gutter.Width = 57
          Minimap.Font.Charset = DEFAULT_CHARSET
          Minimap.Font.Color = clWindowText
          Minimap.Font.Height = -4
          Minimap.Font.Name = 'Courier New'
          Minimap.Font.Style = []
          Minimap.Width = 0
          Minimap.CharWidth = 2
          Minimap.CharHeight = 4
          Minimap.LinesInWindow = 0
          Options = [eoAltSetsColumnMode, eoAutoIndent, eoDragDropEditing, eoEnhanceEndKey, eoGroupUndo, eoScrollPastEol, eoShowScrollHint, eoSpecialLineDefaultFg, eoTabsToSpaces, eoTrimTrailingSpaces]
          WantTabs = True
          WordWrap.Enabled = False
          WordWrap.Position = 80
          WordWrap.Style = wwsClientWidth
          OnRightEdgeMouseUp = SplitSynEditRightEdgeMouseUp
          FontSmoothing = fsmNone
        end
      end
      object SynEdit: TBCSynEdit
        Left = 0
        Top = 0
        Width = 246
        Height = 18
        Align = alClient
        ActiveLineColor = clSkyBlue
        CodeFolding.CaseSensitive = False
        CodeFolding.FolderBarLinesColor = 12434877
        ActiveLine.Background = clYellow
        ActiveLine.Foreground = clNavy
        ActiveLine.Visible = True
        LineDivider.Visible = False
        LineDivider.Color = clRed
        LineDivider.Style = psSolid
        RightEdge.MouseMove = True
        RightEdge.Visible = True
        RightEdge.Position = 80
        RightEdge.Color = clSilver
        RightEdge.Style = psSolid
        LineSpacing = 0
        LineSpacingRule = lsSpecified
        Background.Visible = False
        Background.RepeatMode = brmNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        TabOrder = 1
        Gutter.ShowLineModified = True
        Gutter.LineModifiedColor = clYellow
        Gutter.LineNormalColor = clLime
        Gutter.Intens = False
        Gutter.AutoSize = True
        Gutter.Color = clWindow
        Gutter.Font.Charset = DEFAULT_CHARSET
        Gutter.Font.Color = clWindowText
        Gutter.Font.Height = -11
        Gutter.Font.Name = 'Courier New'
        Gutter.Font.Style = []
        Gutter.BookmarkPanelColor = clNone
        Gutter.RightOffsetColor = clNone
        Gutter.ShowLineNumbers = True
        Gutter.ShowBookmarks = False
        Gutter.Width = 57
        Minimap.Font.Charset = DEFAULT_CHARSET
        Minimap.Font.Color = clWindowText
        Minimap.Font.Height = -4
        Minimap.Font.Name = 'Courier New'
        Minimap.Font.Style = []
        Minimap.Width = 0
        Minimap.CharWidth = 2
        Minimap.CharHeight = 4
        Minimap.LinesInWindow = 0
        Options = [eoAltSetsColumnMode, eoAutoIndent, eoDragDropEditing, eoEnhanceEndKey, eoGroupUndo, eoScrollPastEol, eoShowScrollHint, eoSpecialLineDefaultFg, eoTabsToSpaces, eoTrimTrailingSpaces]
        WantTabs = True
        WordWrap.Enabled = False
        WordWrap.Position = 80
        WordWrap.Style = wwsClientWidth
        OnRightEdgeMouseUp = SynEditRightEdgeMouseUp
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
