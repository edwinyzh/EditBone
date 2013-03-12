object FileTypesFrame: TFileTypesFrame
  Left = 0
  Top = 0
  Width = 273
  Height = 435
  Align = alClient
  TabOrder = 0
  Visible = False
  ExplicitWidth = 542
  object FileTypesBottomPanel: TPanel
    Left = 0
    Top = 409
    Width = 273
    Height = 26
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitWidth = 542
    DesignSize = (
      273
      26)
    object ExtensionsLabel: TLabel
      Left = 8
      Top = 7
      Width = 52
      Height = 13
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Anchors = [akLeft, akBottom]
      Caption = 'Extensions'
      ExplicitTop = 11
    end
    object ExtensionsEdit: TBCEdit
      Left = 70
      Top = 4
      Width = 203
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Anchors = [akLeft, akRight, akBottom]
      TabOrder = 0
      OnChange = ExtensionsEditChange
      OnlyNumbers = False
      NumbersWithDots = False
      NumbersWithSpots = False
      EditColor = clInfoBk
      NumbersAllowNegative = False
      ExplicitWidth = 472
    end
  end
  object FileTypesTopPanel: TPanel
    Left = 0
    Top = 0
    Width = 273
    Height = 409
    Align = alClient
    BevelOuter = bvNone
    Padding.Left = 4
    TabOrder = 1
    ExplicitWidth = 542
    object FileTypesListBox: TListBox
      Left = 4
      Top = 0
      Width = 269
      Height = 409
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alClient
      ItemHeight = 13
      TabOrder = 0
      OnClick = FileTypesListBoxClick
      ExplicitWidth = 533
    end
  end
end
