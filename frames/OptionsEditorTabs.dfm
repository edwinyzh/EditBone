object EditorTabsFrame: TEditorTabsFrame
  Left = 0
  Top = 0
  Width = 320
  Height = 240
  Align = alClient
  TabOrder = 0
  Visible = False
  object Panel: TPanel
    Left = 0
    Top = 0
    Width = 320
    Height = 240
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitLeft = -47
    ExplicitTop = -151
    ExplicitWidth = 367
    ExplicitHeight = 391
    object MultilineCheckBox: TBCCheckBox
      Left = 9
      Top = 6
      Width = 158
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Multiline'
      TabOrder = 0
      ReadOnly = False
    end
    object ShowCloseButtonCheckBox: TBCCheckBox
      Left = 9
      Top = 26
      Width = 158
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Show Close Button'
      TabOrder = 1
      ReadOnly = False
    end
  end
end
