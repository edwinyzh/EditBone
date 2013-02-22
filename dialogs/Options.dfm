object OptionsDialog: TOptionsDialog
  Left = 580
  Top = 154
  BorderStyle = bsDialog
  Caption = 'Options'
  ClientHeight = 422
  ClientWidth = 470
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
  object TopPanel: TPanel
    Left = 0
    Top = 0
    Width = 470
    Height = 381
    Align = alClient
    BevelOuter = bvNone
    Padding.Left = 6
    Padding.Top = 6
    Padding.Right = 6
    TabOrder = 0
    ExplicitHeight = 379
    object PageControl: TPageControl
      Left = 6
      Top = 6
      Width = 458
      Height = 375
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ActivePage = EditorTabSheet
      Align = alClient
      TabOrder = 0
      ExplicitHeight = 373
      object EditorTabSheet: TTabSheet
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Editor'
        ExplicitHeight = 345
        object EditorPanel: TPanel
          Left = 0
          Top = 0
          Width = 450
          Height = 347
          Align = alClient
          BevelOuter = bvNone
          Padding.Left = 4
          Padding.Right = 4
          Padding.Bottom = 4
          TabOrder = 0
          ExplicitHeight = 345
          object Editor1Panel: TPanel
            Left = 4
            Top = 0
            Width = 442
            Height = 54
            Align = alTop
            BevelOuter = bvNone
            Padding.Right = 2
            TabOrder = 0
            object EditorFontGroupBox: TGroupBox
              Left = 0
              Top = 0
              Width = 216
              Height = 54
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Align = alLeft
              Caption = ' Editor Font '
              TabOrder = 0
              object SelectFontSpeedButton: TSpeedButton
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
              object EditorFontPanel: TPanel
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
              Left = 224
              Top = 0
              Width = 216
              Height = 54
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Align = alRight
              Caption = ' Gutter '
              TabOrder = 1
              object LineNumbersCheckBox: TBCCheckBox
                Left = 120
                Top = 20
                Width = 90
                Height = 21
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = ' Line Numbers'
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
          object Editor2Panel: TPanel
            Left = 4
            Top = 54
            Width = 442
            Height = 71
            Align = alTop
            BevelOuter = bvNone
            Padding.Right = 2
            TabOrder = 1
            object EditorOptionsGroupBox: TGroupBox
              Left = 0
              Top = 0
              Width = 440
              Height = 71
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Align = alClient
              Caption = ' Options '
              TabOrder = 0
              object AutoIndentCheckBox: TBCCheckBox
                Left = 15
                Top = 20
                Width = 124
                Height = 21
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = ' Auto Indent'
                Checked = True
                State = cbChecked
                TabOrder = 0
                OnClick = HTMLErrorCheckingCheckBoxClick
                ReadOnly = False
              end
              object ScrollPastEofCheckBox: TBCCheckBox
                Left = 239
                Top = 20
                Width = 158
                Height = 21
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = ' Scroll Past End of File'
                TabOrder = 2
                OnClick = HTMLErrorCheckingCheckBoxClick
                ReadOnly = False
              end
              object ScrollPastEolCheckBox: TBCCheckBox
                Left = 239
                Top = 38
                Width = 158
                Height = 21
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = ' Scroll Past End of Line'
                Checked = True
                State = cbChecked
                TabOrder = 3
                OnClick = HTMLErrorCheckingCheckBoxClick
                ReadOnly = False
              end
              object TrimTrailingSpacesCheckBox: TBCCheckBox
                Left = 15
                Top = 38
                Width = 124
                Height = 21
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = ' Trim Trailing Spaces'
                Checked = True
                State = cbChecked
                TabOrder = 1
                OnClick = HTMLErrorCheckingCheckBoxClick
                ReadOnly = False
              end
            end
          end
          object Editor3Panel: TPanel
            Left = 4
            Top = 125
            Width = 442
            Height = 54
            Align = alTop
            BevelOuter = bvNone
            Padding.Right = 2
            TabOrder = 2
            object LineSpacingGroupBox: TGroupBox
              Left = 0
              Top = 0
              Width = 440
              Height = 54
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Align = alClient
              Anchors = [akLeft, akTop, akBottom]
              Caption = ' Line spacing / Tab spacing '
              TabOrder = 0
              object ExtraLinesLabel: TLabel
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
              object TabWidthLabel: TLabel
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
                Left = 137
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
                Left = 361
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
          object Editor4Panel: TPanel
            Left = 4
            Top = 179
            Width = 442
            Height = 54
            Align = alTop
            BevelOuter = bvNone
            Padding.Right = 2
            TabOrder = 3
            object RightEdgeGroupBox: TGroupBox
              Left = 0
              Top = 0
              Width = 216
              Height = 54
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Align = alLeft
              Caption = ' Right Edge '
              TabOrder = 0
              object EdgeColumnLabel: TLabel
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
                Left = 138
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
              Left = 224
              Top = 0
              Width = 216
              Height = 54
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Align = alRight
              Anchors = [akLeft, akTop, akBottom]
              Caption = ' Page Control Tabs '
              TabOrder = 1
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
          object Editor5Panel: TPanel
            Left = 4
            Top = 233
            Width = 442
            Height = 54
            Align = alTop
            BevelOuter = bvNone
            Padding.Right = 2
            TabOrder = 4
            object CPASHighlighterGroupBox: TGroupBox
              Left = 0
              Top = 0
              Width = 216
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
              Left = 224
              Top = 0
              Width = 216
              Height = 54
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Align = alRight
              Anchors = [akLeft, akTop, akBottom]
              Caption = ' SQL Dialect '
              TabOrder = 1
              DesignSize = (
                216
                54)
              object SQLDialectComboBox: TBCComboBox
                Left = 15
                Top = 20
                Width = 186
                Height = 21
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Anchors = [akTop, akRight]
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
          object Editor6Panel: TPanel
            Left = 4
            Top = 287
            Width = 442
            Height = 56
            Align = alClient
            BevelOuter = bvNone
            Padding.Right = 2
            Padding.Bottom = 2
            TabOrder = 5
            ExplicitHeight = 54
            object HTMLVersionGroupBox: TGroupBox
              Left = 0
              Top = 0
              Width = 440
              Height = 54
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Align = alClient
              Caption = ' HTML Error Checking / Version When DOCTYPE Does Not Exist'
              TabOrder = 0
              ExplicitHeight = 58
              DesignSize = (
                440
                54)
              object HTMLVersionComboBox: TBCComboBox
                Left = 238
                Top = 20
                Width = 186
                Height = 21
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Anchors = [akTop, akRight]
                ItemHeight = 13
                ReadOnly = False
                TabOrder = 0
                EditColor = clInfoBk
                DeniedKeyStrokes = True
                DropDownFixedWidth = 0
              end
              object HTMLErrorCheckingCheckBox: TBCCheckBox
                Left = 15
                Top = 20
                Width = 124
                Height = 21
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = ' Enabled'
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
      object ToolbarTabSheet: TTabSheet
        Caption = 'Toolbar'
        ImageIndex = 2
        ExplicitHeight = 349
      end
      object FileTypesTabSheet: TTabSheet
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'File Types'
        ImageIndex = 1
        ExplicitHeight = 349
        object FileTypesBottomPanel: TPanel
          Left = 0
          Top = 317
          Width = 450
          Height = 30
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 0
          ExplicitTop = 319
          DesignSize = (
            450
            30)
          object ExtensionsLabel: TLabel
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
            Width = 374
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
        object FileTypesTopPanel: TPanel
          Left = 0
          Top = 0
          Width = 450
          Height = 317
          Align = alClient
          BevelOuter = bvNone
          Padding.Left = 4
          Padding.Top = 4
          Padding.Right = 4
          TabOrder = 1
          ExplicitHeight = 319
          object FileTypesListBox: TListBox
            Left = 4
            Top = 4
            Width = 442
            Height = 313
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Align = alClient
            ItemHeight = 13
            TabOrder = 0
            OnClick = FileTypesListBoxClick
            ExplicitHeight = 315
          end
        end
      end
    end
  end
  object ButtonPanel: TPanel
    Left = 0
    Top = 381
    Width = 470
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    Padding.Top = 8
    Padding.Right = 6
    Padding.Bottom = 8
    TabOrder = 1
    ExplicitTop = 379
    object OKButton: TButton
      Left = 306
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
    object CancelButton: TButton
      Left = 389
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
    object ButtonDividerPanel: TPanel
      Left = 381
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
    Left = 136
    Top = 34
    object SelectFontAction: TAction
      Hint = 'Select a font'
      OnExecute = SelectFontActionExecute
    end
  end
end
