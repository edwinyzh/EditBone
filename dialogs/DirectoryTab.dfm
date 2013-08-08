object DirectoryTabDialog: TDirectoryTabDialog
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'DirectoryTabDialog'
  ClientHeight = 155
  ClientWidth = 488
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object TopPanel: TPanel
    Left = 0
    Top = 0
    Width = 488
    Height = 123
    Align = alClient
    BevelOuter = bvNone
    Padding.Left = 12
    Padding.Top = 12
    Padding.Right = 12
    Padding.Bottom = 8
    TabOrder = 0
    object TabNamePanel: TPanel
      Left = 12
      Top = 12
      Width = 464
      Height = 26
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      DesignSize = (
        464
        26)
      object TabNameLabel: TLabel
        Left = 0
        Top = 9
        Width = 48
        Height = 13
        Caption = 'Tab Name'
      end
      object TabNameEdit: TBCEdit
        Left = 87
        Top = 5
        Width = 377
        Height = 21
        Hint = 'Tab name'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Text = 'C:\'
        EnterToTab = False
        OnlyNumbers = False
        NumbersWithDots = False
        NumbersWithSpots = False
        ErrorColor = clBlack
        NumbersAllowNegative = False
        EditColor = clInfoBk
        UseColoring = True
      end
    end
    object RootDirectoryPanel: TPanel
      Left = 12
      Top = 38
      Width = 464
      Height = 26
      Align = alTop
      BevelOuter = bvNone
      Padding.Top = 4
      Padding.Bottom = 1
      TabOrder = 1
      DesignSize = (
        464
        26)
      object RootDirectoryLabel: TLabel
        Left = 0
        Top = 8
        Width = 70
        Height = 13
        Caption = 'Root Directory'
      end
      object RootDirectoryEdit: TBCEdit
        Left = 87
        Top = 4
        Width = 354
        Height = 21
        Hint = 'Root directory'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Text = 'C:\'
        EnterToTab = False
        OnlyNumbers = False
        NumbersWithDots = False
        NumbersWithSpots = False
        ErrorColor = clBlack
        NumbersAllowNegative = False
        EditColor = clInfoBk
        UseColoring = True
      end
      object RootDrectoryBitBtn: TBitBtn
        Left = 443
        Top = 4
        Width = 21
        Height = 21
        Action = RootDirectoryClickAction
        Align = alRight
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          0274AC0274AC0274AC0274AC0274AC0274AC0274AC0274AC0274AC0274ACFF00
          FFFF00FFFF00FFFF00FFFF00FF0274AC138AC456B6E14BBFF74ABFF74ABFF74A
          BFF74ABFF64ABFF74ABFF62398CC0C81BAFF00FFFF00FFFF00FFFF00FF0274AC
          33AAE02392C454C7F854C7F753C7F854C7F754C7F854C7F854C7F8279DCEBAEB
          EF0274ACFF00FFFF00FFFF00FF0274AC57CAF80274AC5ED1FA5ED1FA5ED1FA5E
          D1FA5ED1FA5FD1FA5ED1F82CA1CEBAEBEF0274ACFF00FFFF00FFFF00FF0274AC
          68DAFB2BA4D196EBFB74E5FB74E5FB74E5FC74E5FC74E5FB74E5FC33A9CFBAEB
          EFBAEBEF0274ACFF00FFFF00FF0274AC70E3FB5CD1EFFEFFFFB8F4FCBAF4FCBA
          F4FCBAF4FEB8F4FEBAF4FC83C9DEE3FEFEC5EFF60274ACFF00FFFF00FF0274AC
          7AEBFE7AEBFC0274AC0274AC0274AC0274AC0274AC0274AC0274AC0274AC0274
          AC0274AC0274ACFF00FFFF00FF0274AC83F2FE82F3FE83F2FC83F3FE82F3FE83
          F2FE82F3FC83F2FE82F3FE036FA7FF00FFFF00FFFF00FFFF00FFFF00FF0274AC
          FEFEFE89FAFF89FAFE8AF8FE8AFAFE89F8FE8AFAFE8AFAFF89FAFF036FA7FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF0274ACFEFEFE8FFEFF8FFEFF0274AC02
          74AC0274AC0274AC0274ACFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF0274AC0274AC0274ACFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        TabOrder = 1
      end
    end
    object ShowFileTypePanel: TPanel
      Left = 12
      Top = 90
      Width = 464
      Height = 26
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      object ShowFileTypeLabel: TLabel
        Left = 0
        Top = 8
        Width = 72
        Height = 13
        Caption = 'Show File Type'
      end
      object ShowFileTypeComboBox: TBCComboBox
        Left = 87
        Top = 4
        Width = 90
        Height = 21
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 0
        Text = 'Hide'
        StyleElements = [seFont, seBorder]
        Items.Strings = (
          'Hide'
          'Bottom'
          'Top')
        DeniedKeyStrokes = False
        ReadOnly = False
        EditColor = clInfoBk
        UseColoring = True
        DropDownFixedWidth = 0
      end
    end
    object ShowDrivesPanel: TPanel
      Left = 12
      Top = 64
      Width = 464
      Height = 26
      Align = alTop
      BevelOuter = bvNone
      Padding.Top = 4
      Padding.Bottom = 1
      TabOrder = 3
      object ShowDrivesLabel: TLabel
        Left = 0
        Top = 8
        Width = 59
        Height = 13
        Caption = 'Show Drives'
      end
      object ExcludeOtherBranchesCheckBox: TBCCheckBox
        Left = 184
        Top = 4
        Width = 277
        Height = 21
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Action = ExcludeOtherBranchesAction
        TabOrder = 0
        ReadOnly = False
      end
      object ShowDrivesComboBox: TBCComboBox
        Left = 87
        Top = 4
        Width = 90
        Height = 21
        Style = csDropDownList
        ItemIndex = 1
        TabOrder = 1
        Text = 'Bottom'
        StyleElements = [seFont, seBorder]
        Items.Strings = (
          'Hide'
          'Bottom'
          'Top')
        DeniedKeyStrokes = False
        ReadOnly = False
        EditColor = clInfoBk
        UseColoring = True
        DropDownFixedWidth = 0
      end
    end
  end
  object ButtonPanel: TPanel
    Left = 0
    Top = 123
    Width = 488
    Height = 32
    Align = alBottom
    BevelOuter = bvNone
    Padding.Left = 8
    Padding.Right = 8
    Padding.Bottom = 8
    TabOrder = 1
    object OKButton: TButton
      Left = 322
      Top = 0
      Width = 75
      Height = 24
      Action = OKAction
      Align = alRight
      Default = True
      TabOrder = 0
    end
    object CancelButton: TButton
      Left = 405
      Top = 0
      Width = 75
      Height = 24
      Align = alRight
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 1
    end
    object ButtonDividerPanel: TPanel
      Left = 397
      Top = 0
      Width = 8
      Height = 24
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 2
    end
  end
  object ActionList: TActionList
    Left = 416
    Top = 76
    object OKAction: TAction
      Caption = '&OK'
      OnExecute = OKActionExecute
    end
    object ExcludeOtherBranchesAction: TAction
      Caption = ' Exclude Other Directory Branches'
      OnExecute = ExcludeOtherBranchesActionExecute
    end
    object RootDirectoryClickAction: TAction
      OnExecute = RootDirectoryClickActionExecute
    end
  end
end
