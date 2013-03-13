object OptionsCompareFrame: TOptionsCompareFrame
  Left = 0
  Top = 0
  Width = 451
  Height = 304
  Align = alClient
  TabOrder = 0
  Visible = False
  object Panel: TPanel
    Left = 0
    Top = 0
    Width = 451
    Height = 304
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object IgnoreCaseCheckBox: TBCCheckBox
      Left = 9
      Top = 6
      Width = 276
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Ignore Case'
      Checked = True
      State = cbChecked
      TabOrder = 0
      ReadOnly = False
    end
    object IgnoreBlanksCheckBox: TBCCheckBox
      Left = 9
      Top = 26
      Width = 282
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Ignore Blanks'
      Checked = True
      State = cbChecked
      TabOrder = 1
      ReadOnly = False
    end
  end
end
