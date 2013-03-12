object EditorGutterFrame: TEditorGutterFrame
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
    object EdgeColumnLabel: TLabel
      Left = 9
      Top = 55
      Width = 62
      Height = 13
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Edge Column'
    end
    object GutterVisibleCheckBox: TBCCheckBox
      Left = 9
      Top = 6
      Width = 198
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Visible'
      Checked = True
      State = cbChecked
      TabOrder = 0
      ReadOnly = False
    end
    object LineNumbersCheckBox: TBCCheckBox
      Left = 9
      Top = 26
      Width = 212
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Line Numbers'
      Checked = True
      State = cbChecked
      TabOrder = 1
      ReadOnly = False
    end
    object EdgeColumnEdit: TBCEdit
      Left = 7
      Top = 72
      Width = 30
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Flat = False
      ParentFlat = False
      TabOrder = 2
      Text = '80'
      OnlyNumbers = False
      NumbersWithDots = False
      NumbersWithSpots = False
      EditColor = clInfoBk
      NumbersAllowNegative = False
    end
  end
end
