object EditorFontFrame: TEditorFontFrame
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
    object TopPanel: TPanel
      Left = 0
      Top = 0
      Width = 451
      Height = 33
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object SelectFontSpeedButton: TSpeedButton
        Left = 6
        Top = 7
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
        Left = 34
        Top = 11
        Width = 128
        Height = 16
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Courier New 10pt'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
      end
    end
    object BottomPanel: TPanel
      Left = 0
      Top = 33
      Width = 451
      Height = 271
      Align = alClient
      BevelOuter = bvNone
      Caption = 'BottomPanel'
      Padding.Left = 4
      TabOrder = 1
      object SynEdit: TBCSynEdit
        Left = 4
        Top = 0
        Width = 447
        Height = 271
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        TabOrder = 0
        Gutter.Font.Charset = DEFAULT_CHARSET
        Gutter.Font.Color = clWindowText
        Gutter.Font.Height = -11
        Gutter.Font.Name = 'Courier New'
        Gutter.Font.Style = []
      end
    end
  end
  object FontDialog: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = []
    Left = 10
    Top = 40
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
