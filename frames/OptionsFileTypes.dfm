object FileTypesFrame: TFileTypesFrame
  Left = 0
  Top = 0
  Width = 306
  Height = 304
  Align = alClient
  TabOrder = 0
  Visible = False
  object FileTypesBottomPanel: TPanel
    Left = 0
    Top = 262
    Width = 306
    Height = 42
    Align = alBottom
    BevelOuter = bvNone
    Padding.Left = 4
    TabOrder = 0
    DesignSize = (
      306
      42)
    object ExtensionsLabel: TLabel
      Left = 4
      Top = 4
      Width = 52
      Height = 13
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Anchors = [akLeft, akBottom]
      Caption = 'Extensions'
      ExplicitTop = 8
    end
    object ExtensionsEdit: TBCEdit
      Left = 4
      Top = 21
      Width = 302
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alBottom
      TabOrder = 0
      OnChange = ExtensionsEditChange
      OnlyNumbers = False
      NumbersWithDots = False
      NumbersWithSpots = False
      EditColor = clInfoBk
      NumbersAllowNegative = False
    end
  end
  object FileTypesTopPanel: TPanel
    Left = 0
    Top = 0
    Width = 306
    Height = 262
    Align = alClient
    BevelOuter = bvNone
    Padding.Left = 4
    TabOrder = 1
    object FileTypesListBox: TListBox
      Left = 4
      Top = 0
      Width = 302
      Height = 262
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
