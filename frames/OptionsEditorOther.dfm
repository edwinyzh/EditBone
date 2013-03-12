object EditorOtherFrame: TEditorOtherFrame
  Left = 0
  Top = 0
  Width = 320
  Height = 240
  Align = alClient
  TabOrder = 0
  Visible = False
  object Panel: TPanel
    Left = 0
    Top = 0
    Width = 320
    Height = 240
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitLeft = -47
    ExplicitTop = -151
    ExplicitWidth = 367
    ExplicitHeight = 391
    object CPASHighlighterLabel: TLabel
      Left = 9
      Top = 8
      Width = 142
      Height = 13
      Caption = 'Default C / Pascal Highlighter '
    end
    object SQLDialectLabel: TLabel
      Left = 9
      Top = 51
      Width = 57
      Height = 13
      Caption = 'SQL Dialect '
    end
    object CPASHighlighterComboBox: TBCComboBox
      Left = 9
      Top = 23
      Width = 186
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DropDownCount = 9
      ItemHeight = 13
      ReadOnly = False
      TabOrder = 0
      EditColor = clInfoBk
      DeniedKeyStrokes = True
      DropDownFixedWidth = 0
    end
    object SQLDialectComboBox: TBCComboBox
      Left = 9
      Top = 66
      Width = 186
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DropDownCount = 9
      ItemHeight = 13
      ReadOnly = False
      TabOrder = 1
      EditColor = clInfoBk
      DeniedKeyStrokes = True
      DropDownFixedWidth = 0
    end
  end
end
