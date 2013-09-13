object EditorSearchFrame: TEditorSearchFrame
  Left = 0
  Top = 0
  Width = 320
  Height = 240
  TabOrder = 0
  object Panel: TPanel
    Left = 0
    Top = 0
    Width = 320
    Height = 240
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object ShowSearchStringNotFoundCheckBox: TBCCheckBox
      Left = 9
      Top = 6
      Width = 282
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Show Search String Not Found Message'
      Checked = True
      State = cbChecked
      TabOrder = 0
      ReadOnly = False
    end
    object BeepIfSearchStringNotFoundCheckBox: TBCCheckBox
      Left = 9
      Top = 26
      Width = 288
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Beep If Search String Not Found'
      Checked = True
      State = cbChecked
      TabOrder = 1
      ReadOnly = False
    end
  end
end
