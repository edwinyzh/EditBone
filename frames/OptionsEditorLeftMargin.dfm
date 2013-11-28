object EditorLeftMarginFrame: TEditorLeftMarginFrame
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
    object WidthLabel: TLabel
      Left = 11
      Top = 200
      Width = 28
      Height = 13
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Width'
    end
    object LineModifiedColorLabel: TLabel
      Left = 29
      Top = 112
      Width = 90
      Height = 13
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Line Modified Color'
    end
    object LineNormalColorLabel: TLabel
      Left = 29
      Top = 154
      Width = 83
      Height = 13
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Line Normal Color'
    end
    object VisibleCheckBox: TBCCheckBox
      Left = 9
      Top = 6
      Width = 294
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Visible'
      Checked = True
      State = cbChecked
      TabOrder = 0
      ReadOnly = False
    end
    object AutoSizeCheckBox: TBCCheckBox
      Left = 9
      Top = 26
      Width = 276
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Auto Size'
      Checked = True
      State = cbChecked
      TabOrder = 1
      ReadOnly = False
    end
    object LeftMarginWidthEdit: TBCEdit
      Left = 9
      Top = 217
      Width = 64
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      TabOrder = 7
      Text = '48'
      EnterToTab = False
      OnlyNumbers = True
      NumbersWithDots = False
      NumbersWithSpots = False
      ErrorColor = 14803198
      NumbersAllowNegative = False
    end
    object ShowLineModifiedCheckBox: TBCCheckBox
      Left = 9
      Top = 86
      Width = 296
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Show Line Modified'
      Checked = True
      State = cbChecked
      TabOrder = 4
      ReadOnly = False
    end
    object LineModifiedColorBox: TColorBox
      Left = 27
      Top = 128
      Width = 145
      Height = 22
      Selected = clYellow
      TabOrder = 5
    end
    object LineNormalColorBox: TColorBox
      Left = 27
      Top = 170
      Width = 145
      Height = 22
      Selected = clGreen
      TabOrder = 6
    end
    object InTensCheckBox: TBCCheckBox
      Left = 9
      Top = 46
      Width = 296
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Line Numbers In Tens'
      Checked = True
      State = cbChecked
      TabOrder = 2
      ReadOnly = False
    end
    object ZeroStartCheckBox: TBCCheckBox
      Left = 9
      Top = 66
      Width = 268
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Line Numbers Zero Start'
      Checked = True
      State = cbChecked
      TabOrder = 3
      ReadOnly = False
    end
  end
end
