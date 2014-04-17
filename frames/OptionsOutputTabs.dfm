inherited OptionsOutputTabsFrame: TOptionsOutputTabsFrame
  Width = 149
  Height = 155
  AutoSize = True
  Visible = False
  object Panel: TPanel
    AlignWithMargins = True
    Left = 4
    Top = 0
    Width = 145
    Height = 155
    Margins.Left = 4
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    AutoSize = True
    BevelOuter = bvNone
    Color = clWindow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    object MultilineCheckBox: TBCCheckBox
      Left = 0
      Top = 60
      Width = 60
      Height = 15
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Multiline'
      TabOrder = 3
      AutoSize = True
      ReadOnly = False
    end
    object ShowCloseButtonCheckBox: TBCCheckBox
      Left = 0
      Top = 100
      Width = 112
      Height = 15
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Show Close Button'
      TabOrder = 5
      AutoSize = True
      ReadOnly = False
    end
    object ShowImageCheckBox: TBCCheckBox
      Left = 0
      Top = 120
      Width = 81
      Height = 15
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Show Image'
      TabOrder = 6
      AutoSize = True
      ReadOnly = False
    end
    object CloseTabByDblClickCheckBox: TBCCheckBox
      Left = 0
      Top = 0
      Width = 145
      Height = 15
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Close Tab by Double-Click'
      TabOrder = 0
      AutoSize = True
      ReadOnly = False
    end
    object CloseTabByMiddleClickCheckBox: TBCCheckBox
      Left = 0
      Top = 20
      Width = 142
      Height = 15
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Close Tab by Middle-Click'
      TabOrder = 1
      AutoSize = True
      ReadOnly = False
    end
    object DoubleBufferedCheckBox: TBCCheckBox
      Left = 0
      Top = 40
      Width = 100
      Height = 15
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Double Buffered'
      Checked = True
      State = cbChecked
      TabOrder = 2
      AutoSize = True
      ReadOnly = False
    end
    object RightClickSelectCheckBox: TBCCheckBox
      Left = 0
      Top = 140
      Width = 103
      Height = 15
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Right Click Select'
      Checked = True
      State = cbChecked
      TabOrder = 7
      AutoSize = True
      ReadOnly = False
    end
    object SaveTabsCheckBox: TBCCheckBox
      Left = 0
      Top = 80
      Width = 72
      Height = 15
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Save Tabs'
      Checked = True
      State = cbChecked
      TabOrder = 4
      AutoSize = True
      ReadOnly = False
    end
  end
end
