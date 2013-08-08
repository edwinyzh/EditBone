object FileTypesFrame: TFileTypesFrame
  Left = 0
  Top = 0
  Width = 451
  Height = 302
  Align = alClient
  TabOrder = 0
  Visible = False
  object FileTypesBottomPanel: TPanel
    Left = 0
    Top = 260
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
      Text = ''
      OnChange = ExtensionsEditChange
      EnterToTab = False
      OnlyNumbers = False
      NumbersWithDots = False
      NumbersWithSpots = False
      ErrorColor = 14803198
      NumbersAllowNegative = False
      FocusOnColor = clInfoBk
      FocusOffColor = clWindow
      UseColoring = True
    end
  end
  object FileTypesTopPanel: TPanel
    Left = 0
    Top = 0
    Width = 451
    Height = 260
    Align = alClient
    BevelOuter = bvNone
    Padding.Left = 4
    TabOrder = 1
    object FileTypesListBox: TListBox
      Left = 4
      Top = 0
      Width = 447
      Height = 260
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
