object OptionsEditorCompletionProposalFrame: TOptionsEditorCompletionProposalFrame
  Left = 0
  Top = 0
  Width = 320
  Height = 240
  TabOrder = 0
  object Panel: TPanel
    Left = 0
    Top = 0
    Width = 320
    Height = 240
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object ShortcutLabel: TLabel
      Left = 11
      Top = 73
      Width = 41
      Height = 13
      Caption = 'Shortcut'
    end
    object EnabledCheckBox: TBCCheckBox
      Left = 9
      Top = 6
      Width = 201
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Enabled'
      Checked = True
      State = cbChecked
      TabOrder = 0
      ReadOnly = False
    end
    object CaseSensitiveCheckBox: TBCCheckBox
      Left = 9
      Top = 26
      Width = 201
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Case Sensitive'
      Checked = True
      State = cbChecked
      TabOrder = 1
      ReadOnly = False
    end
    object ResizeableCheckBox: TBCCheckBox
      Left = 9
      Top = 46
      Width = 201
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Resizeable'
      Checked = True
      State = cbChecked
      TabOrder = 2
      ReadOnly = False
    end
    object ShortcutComboBox: TBCComboBox
      Left = 9
      Top = 89
      Width = 160
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DropDownCount = 9
      TabOrder = 3
      Text = 'Ctrl+Space'
      DeniedKeyStrokes = True
      ReadOnly = False
      DropDownFixedWidth = 0
    end
  end
end
