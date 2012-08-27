object ReplaceDialog: TReplaceDialog
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Replace'
  ClientHeight = 137
  ClientWidth = 398
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  Position = poOwnerFormCenter
  OnCloseQuery = FormCloseQuery
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object ReplaceWithLabel: TLabel
    Left = 8
    Top = 41
    Width = 61
    Height = 13
    Caption = 'Replace with'
  end
  object SearchForLabel: TLabel
    Left = 8
    Top = 14
    Width = 50
    Height = 13
    Caption = 'Search for'
  end
  object ReplaceWithComboBox: TBCComboBox
    Left = 76
    Top = 37
    Width = 228
    Height = 21
    ItemHeight = 13
    ReadOnly = False
    TabOrder = 1
    EditColor = clInfoBk
    DeniedKeyStrokes = False
  end
  object SearchForComboBox: TBCComboBox
    Left = 76
    Top = 10
    Width = 228
    Height = 21
    ItemHeight = 13
    ReadOnly = False
    TabOrder = 0
    OnKeyUp = SearchForComboBoxKeyUp
    EditColor = clInfoBk
    DeniedKeyStrokes = False
  end
  object OptionsGroupBox: TGroupBox
    Left = 8
    Top = 64
    Width = 145
    Height = 65
    Caption = ' Options '
    TabOrder = 2
    object CaseSensitiveCheckBox: TBCCheckBox
      Left = 8
      Top = 16
      Width = 120
      Height = 17
      Caption = 'Case sensitivity'
      TabOrder = 0
    end
    object WholeWordsCheckBox: TBCCheckBox
      Left = 8
      Top = 39
      Width = 120
      Height = 17
      Caption = 'Whole words only'
      TabOrder = 1
    end
  end
  object ReplaceInRadioGroup: TRadioGroup
    Left = 159
    Top = 64
    Width = 145
    Height = 65
    Caption = ' Replace in '
    ItemIndex = 0
    Items.Strings = (
      'Whole file'
      'All open files')
    TabOrder = 3
  end
  object FindButton: TButton
    Left = 315
    Top = 8
    Width = 75
    Height = 23
    Caption = 'Find'
    Default = True
    Enabled = False
    ModalResult = 1
    TabOrder = 4
  end
  object CancelButton: TButton
    Left = 315
    Top = 66
    Width = 75
    Height = 23
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 6
  end
  object ReplaceAllButton: TButton
    Left = 315
    Top = 37
    Width = 75
    Height = 23
    Caption = 'Replace All'
    Enabled = False
    ModalResult = 6
    TabOrder = 5
  end
end
