object DocTabSheetFrame: TDocTabSheetFrame
  Left = 0
  Top = 0
  Width = 451
  Height = 304
  Align = alClient
  Color = clWindow
  ParentBackground = False
  ParentColor = False
  TabOrder = 0
  object Panel: TBCPanel
    Left = 0
    Top = 0
    Width = 451
    Height = 279
    Align = alClient
    BevelOuter = bvNone
    Color = clWindow
    Padding.Left = 1
    Padding.Top = 1
    Padding.Bottom = 2
    ParentBackground = False
    TabOrder = 1
    SkinData.SkinSection = 'CHECKBOX'
    object SplitterVertical: TBCSplitter
      Left = 187
      Top = 1
      Width = 5
      Height = 276
      ParentColor = False
      Visible = False
      SkinData.SkinSection = 'SPLITTER'
      ExplicitLeft = 186
    end
    object PanelDocument: TBCPanel
      Left = 192
      Top = 1
      Width = 259
      Height = 276
      Align = alClient
      BevelOuter = bvNone
      Color = clWindow
      TabOrder = 0
      SkinData.SkinSection = 'CHECKBOX'
      object SplitterHorizontal: TBCSplitter
        Left = 0
        Top = 271
        Width = 259
        Height = 5
        Cursor = crVSplit
        Align = alBottom
        Visible = False
        SkinData.SkinSection = 'SPLITTER'
        ExplicitLeft = -2
        ExplicitTop = 133
      end
      object Editor: TBCEditor
        AlignWithMargins = True
        Left = 1
        Top = 1
        Width = 256
        Height = 270
        Cursor = crIBeam
        Margins.Left = 1
        Margins.Top = 1
        Margins.Right = 2
        Margins.Bottom = 0
        ActiveLine.Indicator.Visible = False
        Align = alClient
        Caret.NonBlinking.Enabled = False
        Caret.Options = []
        CodeFolding.Colors.Indent = clBlack
        CodeFolding.Hint.Font.Charset = DEFAULT_CHARSET
        CodeFolding.Hint.Font.Color = clWindowText
        CodeFolding.Hint.Font.Height = -11
        CodeFolding.Hint.Font.Name = 'Courier New'
        CodeFolding.Hint.Font.Style = []
        CodeFolding.Visible = True
        CompletionProposal.CloseChars = '()[]. '
        CompletionProposal.Columns = <>
        CompletionProposal.Font.Charset = DEFAULT_CHARSET
        CompletionProposal.Font.Color = clWindowText
        CompletionProposal.Font.Height = -11
        CompletionProposal.Font.Name = 'Courier New'
        CompletionProposal.Font.Style = []
        CompletionProposal.ShortCut = 16416
        CompletionProposal.Trigger.Chars = '.'
        CompletionProposal.Trigger.Enabled = False
        Directories.Colors = 'Colors'
        Directories.Highlighters = 'Highlighters'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        LeftMargin.Font.Charset = DEFAULT_CHARSET
        LeftMargin.Font.Color = 13408665
        LeftMargin.Font.Height = -11
        LeftMargin.Font.Name = 'Courier New'
        LeftMargin.Font.Style = []
        LeftMargin.Width = 55
        Lines.Strings = (
          '')
        LineSpacing.Spacing = 1
        MatchingPair.Enabled = True
        Minimap.Font.Charset = DEFAULT_CHARSET
        Minimap.Font.Color = clWindowText
        Minimap.Font.Height = -4
        Minimap.Font.Name = 'Courier New'
        Minimap.Font.Style = []
        Minimap.Width = 140
        OnEnter = EditorEnter
        OnRightMarginMouseUp = EditorRightMarginMouseUp
        RightMargin.Position = 80
        RightMargin.Visible = True
        Search.Enabled = False
        SpecialChars.Style = scsDot
        TabOrder = 0
        WordWrap.Enabled = False
        WordWrap.Position = 80
        WordWrap.Style = wwsClientWidth
        WordWrap.Indicator.Glyph.Data = {
          7E030000424D7E0300000000000036000000280000000F0000000E0000000100
          2000000000004803000000000000000000000000000000000000FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
          000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0080000000FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
          0000FFFFFF00FFFFFF00FFFFFF00FFFFFF008000000080000000FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF008000000080000000800000008000000080000000FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF00FFFF
          FF00FFFFFF00FFFFFF008000000080000000FFFFFF00FFFFFF0080000000FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF0080000000FFFFFF00FFFFFF0080000000FFFFFF00FFFF
          FF00FFFFFF000000000000000000000000000000000000000000FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0080000000FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF0080000000FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00800000008000000080000000800000008000
          00008000000080000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00}
      end
    end
    object PanelXMLTree: TBCPanel
      AlignWithMargins = True
      Left = 2
      Top = 2
      Width = 185
      Height = 275
      Margins.Left = 1
      Margins.Top = 1
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 1
      Visible = False
      SkinData.SkinSection = 'CHECKBOX'
    end
  end
  object PanelSearchFrame: TBCPanel
    Left = 0
    Top = 279
    Width = 451
    Height = 25
    Align = alBottom
    AutoSize = True
    BevelOuter = bvNone
    Padding.Top = 2
    Padding.Bottom = 2
    TabOrder = 0
    SkinData.SkinSection = 'CHECKBOX'
    inline SearchFrame: TBCSearchFrame
      Left = 0
      Top = 2
      Width = 451
      Height = 21
      Align = alBottom
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Padding.Left = 2
      ParentBackground = False
      ParentColor = False
      ParentFont = False
      TabOrder = 0
      ExplicitTop = 2
      ExplicitWidth = 451
      inherited SearchPanel: TBCPanel
        Left = 2
        Width = 449
        ExplicitLeft = 2
        ExplicitWidth = 449
        inherited SpeedButtonSearchClose: TBCSpeedButton
          Left = 428
          ExplicitLeft = 428
        end
        inherited Splitter: TBCSplitter
          Left = 240
          ExplicitLeft = 240
        end
        inherited ComboBoxSearchText: TBCComboBox
          Width = 240
          ExplicitWidth = 240
        end
        inherited PanelRight: TBCPanel
          Left = 373
          Width = 55
          ExplicitLeft = 373
          ExplicitWidth = 55
          inherited LabelSearchResultCount: TBCLabelFX
            Left = 43
            Height = 21
            ExplicitLeft = 43
          end
        end
        inherited PanelToolBar: TBCPanel
          Left = 246
          ExplicitLeft = 246
        end
      end
      inherited FrameAdapter: TsFrameAdapter
        Left = 338
      end
    end
  end
  object FrameAdapter: TsFrameAdapter
    SkinData.SkinSection = 'CHECKBOX'
    Left = 260
    Top = 121
  end
  object ApplicationEvents: TApplicationEvents
    OnMessage = ApplicationEventsMessage
    Left = 258
    Top = 215
  end
end
