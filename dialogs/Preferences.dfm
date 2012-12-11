object PreferencesDialog: TPreferencesDialog
  Left = 580
  Top = 154
  BorderStyle = bsDialog
  Caption = 'Preferences'
  ClientHeight = 349
  ClientWidth = 471
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 471
    Height = 308
    Align = alClient
    BevelOuter = bvNone
    Padding.Left = 6
    Padding.Top = 6
    Padding.Right = 6
    TabOrder = 0
    object PageControl: TPageControl
      Left = 6
      Top = 6
      Width = 459
      Height = 302
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 0
      object TabSheet1: TTabSheet
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Editor'
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 451
          Height = 274
          Align = alClient
          BevelOuter = bvNone
          Padding.Left = 4
          Padding.Right = 4
          Padding.Bottom = 4
          TabOrder = 0
          object Panel5: TPanel
            Left = 4
            Top = 0
            Width = 443
            Height = 54
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            object EditorFontGroupBox: TGroupBox
              Left = 0
              Top = 0
              Width = 218
              Height = 54
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Align = alLeft
              Caption = ' Editor Font '
              TabOrder = 0
              object SpeedButton1: TSpeedButton
                Left = 178
                Top = 20
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
              object Panel6: TPanel
                Left = 11
                Top = 20
                Width = 158
                Height = 33
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                BevelOuter = bvNone
                TabOrder = 0
                object FontLabel: TLabel
                  Left = 4
                  Top = 3
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
            end
            object GutterGroupBox: TGroupBox
              Left = 225
              Top = 0
              Width = 218
              Height = 54
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Align = alRight
              Caption = ' Gutter '
              TabOrder = 1
              ExplicitLeft = 228
              object LineNumbersCheckBox: TBCCheckBox
                Left = 120
                Top = 20
                Width = 90
                Height = 21
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = ' Line numbers'
                Checked = True
                State = cbChecked
                TabOrder = 0
                ReadOnly = False
              end
              object GutterVisibleCheckBox: TBCCheckBox
                Left = 15
                Top = 20
                Width = 62
                Height = 21
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = ' Visible'
                Checked = True
                State = cbChecked
                TabOrder = 1
                ReadOnly = False
              end
            end
          end
          object Panel7: TPanel
            Left = 4
            Top = 54
            Width = 443
            Height = 54
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 1
            object LineSpacingGroupBox: TGroupBox
              Left = 0
              Top = 0
              Width = 443
              Height = 54
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Align = alClient
              Caption = ' Line spacing / Tab spacing '
              TabOrder = 0
              object Label8: TLabel
                Left = 15
                Top = 23
                Width = 53
                Height = 13
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Extra Lines'
              end
              object Label9: TLabel
                Left = 238
                Top = 23
                Width = 49
                Height = 13
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Tab Width'
              end
              object ExtraLinesEdit: TBCEdit
                Left = 135
                Top = 20
                Width = 64
                Height = 21
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                TabOrder = 0
                Text = '0'
                OnlyNumbers = False
                NumbersWithDots = False
                NumbersWithSpots = False
                EditColor = clInfoBk
                NumbersAllowNegative = False
              end
              object TabWidthEdit: TBCEdit
                Left = 365
                Top = 20
                Width = 64
                Height = 21
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                TabOrder = 1
                Text = '8'
                OnlyNumbers = False
                NumbersWithDots = False
                NumbersWithSpots = False
                EditColor = clInfoBk
                NumbersAllowNegative = False
              end
            end
          end
          object Panel8: TPanel
            Left = 4
            Top = 108
            Width = 443
            Height = 54
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 2
            object RightEdgeGroupBox: TGroupBox
              Left = 0
              Top = 0
              Width = 218
              Height = 54
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Align = alLeft
              Caption = ' Right Edge '
              TabOrder = 0
              object Label10: TLabel
                Left = 15
                Top = 23
                Width = 62
                Height = 13
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Edge Column'
              end
              object EdgeColumnEdit: TBCEdit
                Left = 135
                Top = 20
                Width = 63
                Height = 21
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Flat = False
                ParentFlat = False
                TabOrder = 0
                Text = '80'
                OnlyNumbers = False
                NumbersWithDots = False
                NumbersWithSpots = False
                EditColor = clInfoBk
                NumbersAllowNegative = False
              end
            end
            object TabsGroupBox: TGroupBox
              Left = 225
              Top = 0
              Width = 218
              Height = 54
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Align = alRight
              Caption = ' Page Control Tabs '
              TabOrder = 1
              ExplicitLeft = 228
              object MultilineCheckBox: TBCCheckBox
                Left = 15
                Top = 20
                Width = 147
                Height = 21
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = ' Multiline'
                TabOrder = 0
                ReadOnly = False
              end
            end
          end
          object Panel9: TPanel
            Left = 4
            Top = 162
            Width = 443
            Height = 54
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 3
            object CPASHighlighterGroupBox: TGroupBox
              Left = 0
              Top = 0
              Width = 218
              Height = 54
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Align = alLeft
              Caption = ' Default C / Pascal Highlighter '
              TabOrder = 0
              object CPASHighlighterComboBox: TBCComboBox
                Left = 15
                Top = 20
                Width = 186
                Height = 21
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                DropDownCount = 9
                ItemHeight = 13
                ReadOnly = False
                TabOrder = 0
                EditColor = clInfoBk
                DeniedKeyStrokes = True
                DropDownFixedWidth = 0
              end
            end
            object SQLDialectGroupBox: TGroupBox
              Left = 225
              Top = 0
              Width = 218
              Height = 54
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Align = alRight
              Caption = ' SQL Dialect '
              TabOrder = 1
              ExplicitLeft = 228
              object SQLDialectComboBox: TBCComboBox
                Left = 17
                Top = 20
                Width = 186
                Height = 21
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                DropDownCount = 9
                ItemHeight = 13
                ReadOnly = False
                TabOrder = 0
                EditColor = clInfoBk
                DeniedKeyStrokes = True
                DropDownFixedWidth = 0
              end
            end
          end
          object Panel10: TPanel
            Left = 4
            Top = 216
            Width = 443
            Height = 54
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 4
            object HTMLVersionGroupBox: TGroupBox
              Left = 0
              Top = 0
              Width = 443
              Height = 54
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Align = alClient
              Caption = '                                          '
              TabOrder = 0
              object HTMLVersionLabel: TLabel
                Left = 15
                Top = 23
                Width = 184
                Height = 13
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Version when DOCTYPE does not exist'
              end
              object HTMLVersionComboBox: TBCComboBox
                Left = 243
                Top = 20
                Width = 186
                Height = 21
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                ItemHeight = 13
                ReadOnly = False
                TabOrder = 0
                EditColor = clInfoBk
                DeniedKeyStrokes = True
                DropDownFixedWidth = 0
              end
              object HTMLErrorCheckingCheckBox: TBCCheckBox
                Left = 14
                Top = -2
                Width = 124
                Height = 21
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = ' HTML Error Checking'
                Checked = True
                State = cbChecked
                TabOrder = 1
                OnClick = HTMLErrorCheckingCheckBoxClick
                ReadOnly = False
              end
            end
          end
        end
      end
      object FileTypesTabSheet: TTabSheet
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'File Types'
        ImageIndex = 1
        object Panel11: TPanel
          Left = 0
          Top = 244
          Width = 451
          Height = 30
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 0
          DesignSize = (
            451
            30)
          object Label1: TLabel
            Left = 8
            Top = 8
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
            Left = 70
            Top = 6
            Width = 375
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
          end
        end
        object Panel12: TPanel
          Left = 0
          Top = 0
          Width = 451
          Height = 244
          Align = alClient
          BevelOuter = bvNone
          Padding.Left = 4
          Padding.Top = 4
          Padding.Right = 4
          TabOrder = 1
          object FileTypesListBox: TListBox
            Left = 4
            Top = 4
            Width = 443
            Height = 240
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
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 308
    Width = 471
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    Padding.Top = 8
    Padding.Right = 6
    Padding.Bottom = 8
    TabOrder = 1
    object btnOk: TButton
      Left = 307
      Top = 8
      Width = 75
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alRight
      Caption = '&OK'
      Default = True
      ModalResult = 1
      TabOrder = 0
    end
    object btnCancel: TButton
      Left = 390
      Top = 8
      Width = 75
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alRight
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 1
    end
    object Panel4: TPanel
      Left = 382
      Top = 8
      Width = 8
      Height = 25
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 2
    end
  end
  object FontDialog: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [fdFixedPitchOnly, fdNoSimulations]
    Left = 332
    Top = 70
  end
  object ActionList: TActionList
    Left = 130
    Top = 78
    object SelectFontAction: TAction
      OnExecute = SelectFontActionExecute
    end
  end
end
