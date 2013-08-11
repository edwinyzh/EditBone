object EditorOtherFrame: TEditorOtherFrame
  Left = 0
  Top = 0
  Width = 451
  Height = 302
  Align = alClient
  TabOrder = 0
  Visible = False
  object Panel: TPanel
    Left = 0
    Top = 0
    Width = 451
    Height = 302
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object CPASHighlighterLabel: TLabel
      Left = 11
      Top = 136
      Width = 142
      Height = 13
      Caption = 'Default C / Pascal Highlighter '
    end
    object SQLDialectLabel: TLabel
      Left = 11
      Top = 92
      Width = 57
      Height = 13
      Caption = 'SQL Dialect '
    end
    object CSSVersionLabel: TLabel
      Left = 11
      Top = 5
      Width = 57
      Height = 13
      Caption = 'CSS Version'
    end
    object PHPVersionLabel: TLabel
      Left = 11
      Top = 49
      Width = 57
      Height = 13
      Caption = 'PHP Version'
    end
    object CPASHighlighterComboBox: TBCComboBox
      Left = 9
      Top = 151
      Width = 186
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Style = csDropDownList
      DropDownCount = 9
      TabOrder = 0
      DeniedKeyStrokes = True
      ReadOnly = False
      DropDownFixedWidth = 0
    end
    object SQLDialectComboBox: TBCComboBox
      Left = 9
      Top = 108
      Width = 186
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Style = csDropDownList
      DropDownCount = 9
      TabOrder = 1
      DeniedKeyStrokes = True
      ReadOnly = False
      DropDownFixedWidth = 0
    end
    object CSSVersionComboBox: TBCComboBox
      Left = 9
      Top = 21
      Width = 186
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Style = csDropDownList
      DropDownCount = 9
      TabOrder = 2
      DeniedKeyStrokes = True
      ReadOnly = False
      DropDownFixedWidth = 0
    end
    object PHPVersionComboBox: TBCComboBox
      Left = 9
      Top = 64
      Width = 186
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Style = csDropDownList
      DropDownCount = 9
      TabOrder = 3
      DeniedKeyStrokes = True
      ReadOnly = False
      DropDownFixedWidth = 0
    end
  end
end
