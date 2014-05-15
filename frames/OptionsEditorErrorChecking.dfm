inherited OptionsEditorErrorCheckingFrame: TOptionsEditorErrorCheckingFrame
  Width = 194
  Height = 63
  AutoSize = True
  Visible = False
  ExplicitWidth = 194
  ExplicitHeight = 63
  object Panel: TPanel
    AlignWithMargins = True
    Left = 4
    Top = 0
    Width = 190
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
      Width = 188
      Height = 13
      Caption = 'Version When DOCTYPE Does Not Exist'
    end
    object HTMLErrorCheckingCheckBox: TBCCheckBox
      Left = 0
      Top = 0
      Width = 59
      Height = 17
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Enabled'
      Checked = True
      State = cbChecked
      TabOrder = 0
      OnClick = HTMLErrorCheckingCheckBoxClick
      LinkedControls = <>
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
