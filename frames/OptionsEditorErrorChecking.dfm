inherited OptionsEditorErrorCheckingFrame: TOptionsEditorErrorCheckingFrame
  Width = 229
  Height = 63
  AutoSize = True
  Visible = False
  object Panel: TPanel
    AlignWithMargins = True
    Left = 4
    Top = 0
    Width = 225
    Height = 63
    Margins.Left = 4
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    AutoSize = True
    BevelOuter = bvNone
    Color = clWindow
    ParentBackground = False
    TabOrder = 0
    object HTMLVersionLabel: TLabel
      Left = 2
      Top = 25
      Width = 223
      Height = 16
      Caption = 'Version When DOCTYPE Does Not Exist'
    end
    object HTMLErrorCheckingCheckBox: TBCCheckBox
      Left = 0
      Top = 0
      Width = 78
      Height = 18
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Enabled'
      Checked = True
      State = cbChecked
      TabOrder = 0
      OnClick = HTMLErrorCheckingCheckBoxClick
      AutoSize = True
      ReadOnly = False
    end
    object HTMLVersionComboBox: TBCComboBox
      Left = 0
      Top = 41
      Width = 186
      Height = 22
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Style = csOwnerDrawFixed
      TabOrder = 1
      DeniedKeyStrokes = True
      ReadOnly = False
      DropDownFixedWidth = 0
    end
  end
end
