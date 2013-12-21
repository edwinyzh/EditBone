object OptionsEditorErrorCheckingFrame: TOptionsEditorErrorCheckingFrame
  Left = 0
  Top = 0
  Width = 278
  Height = 62
  TabOrder = 0
  Visible = False
  object Panel: TPanel
    Left = 0
    Top = 0
    Width = 278
    Height = 62
    BevelOuter = bvNone
    TabOrder = 0
    object HTMLVersionLabel: TLabel
      Left = 6
      Top = 25
      Width = 188
      Height = 13
      Caption = 'Version When DOCTYPE Does Not Exist'
    end
    object HTMLErrorCheckingCheckBox: TBCCheckBox
      Left = 4
      Top = 0
      Width = 278
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Enabled'
      Checked = True
      State = cbChecked
      TabOrder = 0
      OnClick = HTMLErrorCheckingCheckBoxClick
      ReadOnly = False
    end
    object HTMLVersionComboBox: TBCComboBox
      Left = 4
      Top = 41
      Width = 186
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Style = csDropDownList
      TabOrder = 1
      DeniedKeyStrokes = True
      ReadOnly = False
      DropDownFixedWidth = 0
    end
  end
end
