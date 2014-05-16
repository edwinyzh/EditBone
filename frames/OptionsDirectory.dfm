inherited OptionsDirectoryFrame: TOptionsDirectoryFrame
  Width = 121
  Height = 143
  ExplicitWidth = 121
  ExplicitHeight = 143
  object Panel: TPanel
    AlignWithMargins = True
    Left = 4
    Top = 0
    Width = 117
    Height = 143
    Margins.Left = 4
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    BevelOuter = bvNone
    Color = clWindow
    ParentBackground = False
    TabOrder = 0
    object IndentLabel: TLabel
      Left = 2
      Top = 105
      Width = 32
      Height = 13
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Indent'
    end
    object ShowTreeLinesCheckBox: TBCCheckBox
      Left = 0
      Top = 0
      Width = 99
      Height = 17
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Show Tree Lines'
      TabOrder = 0
      LinkedControls = <>
    end
    object IndentEdit: TBCEdit
      Left = 0
      Top = 122
      Width = 64
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      TabOrder = 5
      Text = '20'
      EnterToTab = False
      OnlyNumbers = True
      NumbersWithDots = False
      NumbersWithSpots = False
      ErrorColor = 14803198
      NumbersAllowNegative = False
    end
    object ShowHiddenFilesCheckBox: TBCCheckBox
      Left = 0
      Top = 20
      Width = 107
      Height = 17
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Show Hidden Files'
      TabOrder = 1
      LinkedControls = <>
    end
    object ShowSystemFilesCheckBox: TBCCheckBox
      Left = 0
      Top = 40
      Width = 109
      Height = 17
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Show System Files'
      TabOrder = 2
      LinkedControls = <>
    end
    object ShowArchiveFilesCheckBox: TBCCheckBox
      Left = 0
      Top = 60
      Width = 110
      Height = 17
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Show Archive Files'
      Checked = True
      Color = clWindow
      ParentColor = False
      State = cbChecked
      TabOrder = 3
      LinkedControls = <>
    end
    object ShowOverlayIconsCheckBox: TBCCheckBox
      Left = 0
      Top = 80
      Width = 117
      Height = 17
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Show Overlay Icons'
      Checked = True
      Color = clWindow
      ParentColor = False
      State = cbChecked
      TabOrder = 4
      LinkedControls = <>
    end
  end
end
