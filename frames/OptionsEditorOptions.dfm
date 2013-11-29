object EditorOptionsFrame: TEditorOptionsFrame
  Left = 0
  Top = 0
  Width = 451
  Height = 513
  Align = alClient
  TabOrder = 0
  object Panel: TPanel
    Left = 0
    Top = 0
    Width = 451
    Height = 513
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object LineSpacingLabel: TLabel
      Left = 11
      Top = 229
      Width = 59
      Height = 13
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Line Spacing'
    end
    object TabWidthLabel: TLabel
      Left = 11
      Top = 269
      Width = 49
      Height = 13
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Tab Width'
    end
    object ActiveLineColorBrightnessLabel: TLabel
      Left = 11
      Top = 309
      Width = 133
      Height = 13
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Active Line Color Brightness'
    end
    object InsertCaretLabel: TLabel
      Left = 11
      Top = 357
      Width = 59
      Height = 13
      Caption = 'Insert Caret'
    end
    object NonblinkingCaretColorLabel: TLabel
      Left = 11
      Top = 400
      Width = 116
      Height = 13
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Non-blinking Caret Color'
    end
    object AutoIndentCheckBox: TBCCheckBox
      Left = 9
      Top = 6
      Width = 201
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Auto Indent'
      Checked = True
      State = cbChecked
      TabOrder = 0
      ReadOnly = False
    end
    object TrimTrailingSpacesCheckBox: TBCCheckBox
      Left = 9
      Top = 166
      Width = 201
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Trim Trailing Spaces'
      Checked = True
      State = cbChecked
      TabOrder = 8
      ReadOnly = False
    end
    object ScrollPastEofCheckBox: TBCCheckBox
      Left = 9
      Top = 66
      Width = 201
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Scroll Past End of File'
      TabOrder = 3
      ReadOnly = False
    end
    object ScrollPastEolCheckBox: TBCCheckBox
      Left = 9
      Top = 86
      Width = 198
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Scroll Past End of Line'
      Checked = True
      State = cbChecked
      TabOrder = 4
      ReadOnly = False
    end
    object LineSpacingEdit: TBCEdit
      Left = 9
      Top = 244
      Width = 64
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      TabOrder = 11
      Text = '0'
      EnterToTab = False
      OnlyNumbers = True
      NumbersWithDots = False
      NumbersWithSpots = False
      ErrorColor = 14803198
      NumbersAllowNegative = False
    end
    object TabWidthEdit: TBCEdit
      Left = 9
      Top = 284
      Width = 64
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      TabOrder = 12
      Text = '2'
      EnterToTab = False
      OnlyNumbers = True
      NumbersWithDots = False
      NumbersWithSpots = False
      ErrorColor = clBlack
      NumbersAllowNegative = False
    end
    object BrightnessTrackBar: TTrackBar
      Left = 4
      Top = 324
      Width = 150
      Height = 27
      Min = 1
      Position = 2
      TabOrder = 13
    end
    object TabsToSpacesCheckBox: TBCCheckBox
      Left = 9
      Top = 146
      Width = 198
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Tabs to Spaces'
      Checked = True
      State = cbChecked
      TabOrder = 7
      ReadOnly = False
    end
    object AutoSaveCheckBox: TBCCheckBox
      Left = 9
      Top = 26
      Width = 201
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Auto Save'
      TabOrder = 1
      ReadOnly = False
    end
    object InsertCaretComboBox: TBCComboBox
      Left = 9
      Top = 373
      Width = 133
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Style = csDropDownList
      DropDownCount = 9
      TabOrder = 14
      DeniedKeyStrokes = True
      ReadOnly = False
      DropDownFixedWidth = 0
    end
    object UndoAfterSaveCheckBox: TBCCheckBox
      Left = 9
      Top = 206
      Width = 201
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Undo After Save'
      TabOrder = 10
      ReadOnly = False
    end
    object SmartTabsCheckBox: TBCCheckBox
      Left = 9
      Top = 106
      Width = 201
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Smart Tabs'
      TabOrder = 5
      ReadOnly = False
    end
    object SmartTabDeleteCheckBox: TBCCheckBox
      Left = 9
      Top = 126
      Width = 201
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Smart Tab Delete'
      TabOrder = 6
      ReadOnly = False
    end
    object TripleClickRowSelectCheckBox: TBCCheckBox
      Left = 9
      Top = 186
      Width = 201
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Triple-Click Row Select'
      Checked = True
      State = cbChecked
      TabOrder = 9
      ReadOnly = False
    end
    object NonblinkingCaretCheckBox: TBCCheckBox
      Left = 9
      Top = 46
      Width = 198
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Non-blinking Caret'
      TabOrder = 2
      ReadOnly = False
    end
    object NonblinkingCaretColorBox: TColorBox
      Left = 9
      Top = 416
      Width = 145
      Height = 22
      Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
      TabOrder = 15
    end
  end
end
