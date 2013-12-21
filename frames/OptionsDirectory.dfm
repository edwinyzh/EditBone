object OptionsDirectoryFrame: TOptionsDirectoryFrame
  Left = 0
  Top = 0
  Width = 201
  Height = 125
  TabOrder = 0
  object Panel: TPanel
    Left = 0
    Top = 0
    Width = 201
    Height = 125
    BevelOuter = bvNone
    TabOrder = 0
    object IndentLabel: TLabel
      Left = 6
      Top = 87
      Width = 32
      Height = 13
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Indent'
    end
    object ShowTreeLinesCheckBox: TBCCheckBox
      Left = 4
      Top = 0
      Width = 201
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Show Tree Lines'
      TabOrder = 0
      ReadOnly = False
    end
    object IndentEdit: TBCEdit
      Left = 4
      Top = 104
      Width = 64
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      TabOrder = 4
      Text = '20'
      EnterToTab = False
      OnlyNumbers = True
      NumbersWithDots = False
      NumbersWithSpots = False
      ErrorColor = 14803198
      NumbersAllowNegative = False
    end
    object ShowHiddenFilesCheckBox: TBCCheckBox
      Left = 4
      Top = 20
      Width = 201
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Show Hidden Files'
      TabOrder = 1
      ReadOnly = False
    end
    object ShowSystemFilesCheckBox: TBCCheckBox
      Left = 4
      Top = 40
      Width = 201
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Show System Files'
      TabOrder = 2
      ReadOnly = False
    end
    object ShowArchiveFilesCheckBox: TBCCheckBox
      Left = 4
      Top = 58
      Width = 201
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Show Archive Files'
      Checked = True
      State = cbChecked
      TabOrder = 3
      ReadOnly = False
    end
  end
end
