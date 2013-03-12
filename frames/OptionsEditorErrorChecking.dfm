object EditorErrorCheckingFrame: TEditorErrorCheckingFrame
  Left = 0
  Top = 0
  Width = 486
  Height = 414
  Align = alClient
  TabOrder = 0
  Visible = False
  object Panel: TPanel
    Left = 0
    Top = 0
    Width = 486
    Height = 414
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object HTMLVersionLabel: TLabel
      Left = 9
      Top = 30
      Width = 188
      Height = 13
      Caption = 'Version When DOCTYPE Does Not Exist'
    end
    object HTMLErrorCheckingCheckBox: TBCCheckBox
      Left = 9
      Top = 5
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
      Left = 9
      Top = 46
      Width = 186
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ItemHeight = 13
      ReadOnly = False
      TabOrder = 1
      EditColor = clInfoBk
      DeniedKeyStrokes = True
      DropDownFixedWidth = 0
    end
  end
end
