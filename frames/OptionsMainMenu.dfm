object MainMenuFrame: TMainMenuFrame
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
    object SelectFontSpeedButton: TSpeedButton
      Left = 8
      Top = 71
      Width = 21
      Height = 21
      Action = SelectFontAction
      Glyph.Data = {
        FE020000424DFE02000000000000FE0100002800000010000000100000000100
        08000000000000010000120B0000120B0000720000007200000000000000FFFF
        FF00FF00FF00705364009053550077494B00FF828300F27B7D00FF838400F47D
        7F00CE6B6D00FF868700FC848600FF878800B6626300A65A5B00884D4E009957
        5900A65F6000985759007D4B4C00D8707000D7707000D36E6E00AC5B5A00FF86
        8600BD656500A15656008E4D4D00A75B5B00A65B5B00A0585800A15959009F58
        58009C5656009C5757009A5656009F5A590098555500935353007F4949007A47
        4700CF433F00CB433F00E36C6800744544007E4D4C00FE7E0000EA880900AB79
        1F00BD882200968A3400837B310000F3ED0000EDEE0009D9FA0008CBF00008C1
        E900019FD100048EBA000998C5000D779A0011A3D4001176A1002793C100006A
        A600026398001290D3001B90D0004490BA000065A00000609A00056099000A7B
        BD001593DD002295DD00299DE3002E99DD0036ADF80000569000025F9E00035D
        9A000564A3000765A6000963A0000A6099000C66A4000F6EAF001273B400228B
        CF002DA1EE001B5D8B003299DE00095E9E00095F9E0009609E00095D99001F62
        9600428EC900459CEA005083B1004F759C004A6B8B003698FE00216EF2002269
        FA0059658300374D87005B688B000F42F7006F7BA3007782A600062AF8007F82
        9F00020202020202020202020202020202020202020202020202020202020202
        02020202020202020202020202020202020202022821182E02020323121C0202
        0202020202200B0F0202022C1925020202020202020222070414051606110202
        020202020202021F17290216061302020202020202020202211A2D1506220202
        020202020202020202210E0A081B02020202020202020202020226090D1D0202
        0202020202020202020202240C1E020202020202020202020202020227100202
        0202020202020202020202020202020202020202020202020202020202020202
        0202020202020202020202020202020202020202020202020202020202020202
        0202}
    end
    object FontLabel: TLabel
      Left = 36
      Top = 75
      Width = 57
      Height = 13
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Tahoma 8pt'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object AnimationStyleLabel: TLabel
      Left = 11
      Top = 102
      Width = 74
      Height = 13
      Caption = 'Animation Style'
    end
    object AnimationDurationLabel: TLabel
      Left = 11
      Top = 142
      Width = 91
      Height = 13
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Animation Duration'
    end
    object PersistentHotKeysCheckBox: TBCCheckBox
      Left = 9
      Top = 6
      Width = 232
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Persistent Hot Keys'
      TabOrder = 0
      ReadOnly = False
    end
    object ShadowsCheckBox: TBCCheckBox
      Left = 9
      Top = 26
      Width = 232
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Shadows'
      Checked = True
      State = cbChecked
      TabOrder = 1
      ReadOnly = False
    end
    object UseSystemFontCheckBox: TBCCheckBox
      Left = 9
      Top = 46
      Width = 232
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Use System Font'
      TabOrder = 2
      ReadOnly = False
    end
    object AnimationStyleComboBox: TBCComboBox
      Left = 9
      Top = 118
      Width = 186
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DropDownCount = 9
      TabOrder = 3
      EditColor = clInfoBk
      DeniedKeyStrokes = True
      ReadOnly = False
      DropDownFixedWidth = 0
    end
    object AnimationDurationEdit: TBCEdit
      Left = 9
      Top = 158
      Width = 64
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Flat = False
      ParentFlat = False
      TabOrder = 4
      Text = '150'
      OnlyNumbers = True
      NumbersWithDots = False
      NumbersWithSpots = False
      EditColor = clInfoBk
      NumbersAllowNegative = False
    end
  end
  object FontDialog: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = []
    Left = 210
    Top = 84
  end
  object ActionList: TActionList
    Left = 134
    Top = 48
    object SelectFontAction: TAction
      Hint = 'Select a font'
      OnExecute = SelectFontActionExecute
    end
  end
end
