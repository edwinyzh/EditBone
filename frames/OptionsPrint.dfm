object OptionsPrintFrame: TOptionsPrintFrame
  Left = 0
  Top = 0
  Width = 487
  Height = 394
  TabOrder = 0
  object Panel: TPanel
    Left = 0
    Top = 0
    Width = 487
    Height = 394
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object DateTimeLabel: TLabel
      Left = 11
      Top = 136
      Width = 51
      Height = 13
      Caption = 'Date Time '
    end
    object PrintedByLabel: TLabel
      Left = 11
      Top = 92
      Width = 49
      Height = 13
      Caption = 'Printed By'
    end
    object DocumentNameLabel: TLabel
      Left = 11
      Top = 5
      Width = 78
      Height = 13
      Caption = 'Document Name'
    end
    object PageNumberLabel: TLabel
      Left = 11
      Top = 49
      Width = 64
      Height = 13
      Caption = 'Page Number'
    end
    object DateTimeComboBox: TBCComboBox
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
      TabOrder = 3
      DeniedKeyStrokes = True
      ReadOnly = False
      DropDownFixedWidth = 0
    end
    object PrintedByComboBox: TBCComboBox
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
      TabOrder = 2
      DeniedKeyStrokes = True
      ReadOnly = False
      DropDownFixedWidth = 0
    end
    object DocumentNameComboBox: TBCComboBox
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
      TabOrder = 0
      DeniedKeyStrokes = True
      ReadOnly = False
      DropDownFixedWidth = 0
    end
    object PageNumberComboBox: TBCComboBox
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
      TabOrder = 1
      DeniedKeyStrokes = True
      ReadOnly = False
      DropDownFixedWidth = 0
    end
    object ShowHeaderLineCheckBox: TBCCheckBox
      Left = 9
      Top = 180
      Width = 201
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Show Header Line'
      Checked = True
      State = cbChecked
      TabOrder = 4
      ReadOnly = False
    end
    object ShowFooterLineCheckBox: TBCCheckBox
      Left = 9
      Top = 200
      Width = 201
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Show Footer Line'
      Checked = True
      State = cbChecked
      TabOrder = 5
      ReadOnly = False
    end
    object ShowLineNumbersCheckBox: TBCCheckBox
      Left = 9
      Top = 220
      Width = 201
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Show Line Numbers'
      TabOrder = 6
      ReadOnly = False
    end
    object WordWrapCheckBox: TBCCheckBox
      Left = 9
      Top = 240
      Width = 201
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Word Wrap'
      TabOrder = 7
      ReadOnly = False
    end
  end
end
