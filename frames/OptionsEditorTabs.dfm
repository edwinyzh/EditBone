object EditorTabsFrame: TEditorTabsFrame
  Left = 0
  Top = 0
  Width = 451
  Height = 304
  Align = alClient
  TabOrder = 0
  Visible = False
  object Panel: TPanel
    Left = 0
    Top = 0
    Width = 451
    Height = 304
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object MultilineCheckBox: TBCCheckBox
      Left = 9
      Top = 28
      Width = 232
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Multiline'
      TabOrder = 1
      ReadOnly = False
    end
    object ShowCloseButtonCheckBox: TBCCheckBox
      Left = 9
      Top = 48
      Width = 218
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Show Close Button'
      TabOrder = 2
      ReadOnly = False
    end
    object ShowImageCheckBox: TBCCheckBox
      Left = 9
      Top = 70
      Width = 218
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Show Image'
      TabOrder = 3
      ReadOnly = False
    end
    object CloseTabByDblClickCheckBox: TBCCheckBox
      Left = 9
      Top = 6
      Width = 218
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Close Tab by Double Click'
      TabOrder = 0
      ReadOnly = False
    end
  end
end
