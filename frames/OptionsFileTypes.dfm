inherited OptionsFileTypesFrame: TOptionsFileTypesFrame
  Width = 451
  Height = 305
  Align = alClient
  Visible = False
  ExplicitWidth = 451
  ExplicitHeight = 305
  object FileTypesBottomPanel: TPanel
    Left = 0
    Top = 263
    Width = 451
    Height = 42
    Align = alBottom
    BevelOuter = bvNone
    Padding.Left = 4
    TabOrder = 0
    DesignSize = (
      451
      42)
    object ExtensionsLabel: TLabel
      Left = 6
      Top = 4
      Width = 52
      Height = 13
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Anchors = [akLeft, akBottom]
      Caption = 'Extensions'
    end
    object ExtensionsEdit: TBCEdit
      Left = 4
      Top = 21
      Width = 447
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alBottom
      TabOrder = 0
      OnChange = ExtensionsEditChange
      EnterToTab = False
      OnlyNumbers = False
      NumbersWithDots = False
      NumbersWithSpots = False
      ErrorColor = 14803198
      NumbersAllowNegative = False
    end
  end
  object FileTypesTopPanel: TPanel
    Left = 0
    Top = 0
    Width = 451
    Height = 263
    Align = alClient
    BevelOuter = bvNone
    Padding.Left = 4
    TabOrder = 1
    object FileTypesListBox: TListBox
      Left = 4
      Top = 0
      Width = 447
      Height = 263
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alClient
      ItemHeight = 13
      TabOrder = 0
      OnClick = FileTypesListBoxClick
    end
  end
end
