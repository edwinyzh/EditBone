object EditorOptionsFrame: TEditorOptionsFrame
  Left = 0
  Top = 0
  Width = 451
  Height = 304
  Align = alClient
  TabOrder = 0
  object Panel: TPanel
    Left = 0
    Top = 0
    Width = 451
    Height = 304
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object ExtraLinesLabel: TLabel
      Left = 7
      Top = 131
      Width = 53
      Height = 13
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Extra Lines'
    end
    object TabWidthLabel: TLabel
      Left = 7
      Top = 175
      Width = 49
      Height = 13
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Tab Width'
    end
    object ActiveLineColorBrightnessLabel: TLabel
      Left = 7
      Top = 221
      Width = 133
      Height = 13
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Active Line Color Brightness'
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
      Top = 46
      Width = 201
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Trim Trailing Spaces'
      Checked = True
      State = cbChecked
      TabOrder = 2
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
    object ExtraLinesEdit: TBCEdit
      Left = 7
      Top = 146
      Width = 64
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      TabOrder = 6
      Text = '0'
      OnlyNumbers = True
      NumbersWithDots = False
      NumbersWithSpots = False
      EditColor = clInfoBk
      NumbersAllowNegative = False
    end
    object TabWidthEdit: TBCEdit
      Left = 7
      Top = 192
      Width = 64
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      TabOrder = 7
      Text = '8'
      OnlyNumbers = True
      NumbersWithDots = False
      NumbersWithSpots = False
      EditColor = clInfoBk
      NumbersAllowNegative = False
    end
    object BrightnessTrackBar: TTrackBar
      Left = 0
      Top = 236
      Width = 150
      Height = 27
      Min = 1
      Position = 2
      TabOrder = 8
    end
    object TabsToSpacesCheckBox: TBCCheckBox
      Left = 9
      Top = 106
      Width = 198
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Tabs to Spaces'
      Checked = True
      State = cbChecked
      TabOrder = 5
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
  end
end
