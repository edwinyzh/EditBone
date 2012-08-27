object FindInFilesDialog: TFindInFilesDialog
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Find in Files'
  ClientHeight = 113
  ClientWidth = 402
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCloseQuery = FormCloseQuery
  OnDestroy = FormDestroy
  DesignSize = (
    402
    113)
  PixelsPerInch = 96
  TextHeight = 13
  object FindWhatLabel: TLabel
    Left = 8
    Top = 12
    Width = 47
    Height = 13
    Caption = 'Find what'
  end
  object FileTypeLabel: TLabel
    Left = 8
    Top = 36
    Width = 41
    Height = 13
    Caption = 'File type'
  end
  object FolderLabel: TLabel
    Left = 8
    Top = 59
    Width = 30
    Height = 13
    Caption = 'Folder'
  end
  object FindWhatComboBox: TBCComboBox
    Left = 76
    Top = 8
    Width = 228
    Height = 21
    ItemHeight = 13
    ReadOnly = False
    TabOrder = 0
    OnKeyUp = FindWhatComboBoxKeyUp
    EditColor = clInfoBk
    DeniedKeyStrokes = False
  end
  object FileTypeComboBox: TBCComboBox
    Left = 76
    Top = 33
    Width = 228
    Height = 21
    DropDownCount = 20
    ItemHeight = 13
    ReadOnly = False
    TabOrder = 1
    Text = '*.*'
    EditColor = clInfoBk
    DeniedKeyStrokes = False
  end
  object CaseSensitiveCheckBox: TBCCheckBox
    Left = 80
    Top = 84
    Width = 120
    Height = 17
    Caption = 'C&ase sensitivity'
    TabOrder = 3
  end
  object LookInSubfoldersCheckBox: TBCCheckBox
    Left = 196
    Top = 84
    Width = 120
    Height = 17
    Caption = '&Look in subfolders'
    Checked = True
    State = cbChecked
    TabOrder = 4
  end
  object FindButton: TButton
    Left = 317
    Top = 8
    Width = 75
    Height = 23
    Anchors = [akTop, akRight]
    Caption = '&Find'
    Default = True
    Enabled = False
    ModalResult = 1
    TabOrder = 5
  end
  object CancelButton: TButton
    Left = 317
    Top = 37
    Width = 75
    Height = 23
    Anchors = [akTop, akRight]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 6
  end
  object FolderDirectoryEdit: TJvDirectoryEdit
    Left = 76
    Top = 57
    Width = 228
    Height = 21
    DialogKind = dkWin32
    DialogText = 'Choose directory to search:'
    DialogOptions = []
    DialogOptionsWin32 = [odOnlyDirectory, odStatusAvailable, odNewDialogStyle, odNoNewButtonFolder]
    ButtonFlat = True
    ButtonWidth = 18
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
  end
end
