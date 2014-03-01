object UnicodeCharacterMapForm: TUnicodeCharacterMapForm
  Left = 0
  Top = 0
  Caption = 'Unicode Character Map'
  ClientHeight = 402
  ClientWidth = 387
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  Icon.Data = {
    0000010001001010000001002000280400001600000028000000100000002000
    0000010020000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0030000000330000003300000033000000330000003300000033000000330000
    0033000000330000003300000033000000330000003300000033000000239E93
    85F29E9688FF9D9587FF9D9587FF9D9487FF9D9486FF9D9486FF9D9486FF9D94
    86FF9D9486FF9D9486FF9D9487FF9D9587FF9D9587FF9E9688FF938B7FC09E96
    88FFCAC5C2FFC7C2BEFFC7C2BEFFC6C1BDFFC5C0BCFFC5C0BBFFC5C0BBFFC5C0
    BBFFC5C0BBFFC5C0BCFFC6C1BDFFC7C2BEFFC7C2BEFFCAC5C2FF9E9688FF9D94
    87FFC9C6C1FFF6F8FAFFAFA89DFFF5F6F9FFF3F4F6FFF3F4F6FFF3F4F6FFF3F4
    F6FFF3F4F6FFF3F4F6FFF5F6F8FFAFA89DFFF6F8FAFFC9C6C1FF9D9487FF9D94
    87FFCDCAC4FFAAA497FFACA598FFACA599FFAAA497FFABA498FFAAA497FFABA4
    98FFAAA497FFABA498FFAAA497FFAAA397FFAAA396FFCDC9C4FF9D9487FF9C94
    86FFCFCDC6FFF5F6F9FFF7F8FAFFA9A296FFF8FAFDFFA9A396FFF8FAFDFFA9A3
    96FFF8FAFDFFA9A296FFF6F7FAFFF3F4F6FFF2F3F5FFCECBC4FF9C9486FF9C94
    86FFD3D2CBFFA49C8EFFA69E91FFA7A092FFA7A092FFA7A092FFA7A092FFA7A0
    92FFA7A092FFA7A092FFA59E90FFA2998BFFF1F2F4FFD1D0C8FF9C9386FF9C93
    86FFD6D5CDFFF6F7FAFFA1998CFFF8FAFDFFA29A8DFFF8FAFDFFA29A8DFFF8FA
    FDFFA29A8DFFF8FAFDFFA1998CFFF5F6F9FFDDD9D7FFD5D4CBFF9C9386FF9C93
    86FFDADAD1FFB6B0A4FFB8B1A6FFB8B1A5FFB8B2A6FFB8B1A5FFB8B2A6FFB8B1
    A5FFB8B2A6FFB8B1A5FFB8B1A6FFB6B0A4FFB6AFA3FFDADAD1FF9C9386FF9D94
    87FFDFE1D7FFDDDED4FFDDDED4FFDDDED5FFDDDED5FFDDDED5FFDDDED5FFDDDE
    D5FFDDDED5FFDDDED5FFDDDED5FFDDDED4FFDDDED4FFDFE1D7FF9D9487FF9F96
    89B09D9587FF9C9386FF9C9386FF9C9386FF9C9386FF9C9386FF9C9386FF9C93
    86FF9C9386FF9C9386FF9C9386FF9C9386FF9C9386FF9D9587FF9F9689B00000
    00000000000000000000A0988BFF000000330000002400000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    00000000000000000000A0998BB5A1998CFF948C7FC400000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000A1998CFF00000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000}
  OldCreateOrder = False
  OnClose = FormClose
  OnDestroy = FormDestroy
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar: TStatusBar
    Left = 0
    Top = 383
    Width = 387
    Height = 19
    Panels = <>
    SimplePanel = True
  end
  object Panel: TPanel
    Left = 0
    Top = 30
    Width = 387
    Height = 353
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object StringGridCharacter: TStringGrid
      AlignWithMargins = True
      Left = 6
      Top = 3
      Width = 375
      Height = 344
      Margins.Left = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Align = alClient
      ColCount = 20
      DefaultColWidth = 19
      DefaultRowHeight = 19
      FixedCols = 0
      RowCount = 3277
      FixedRows = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected]
      ScrollBars = ssVertical
      TabOrder = 0
      OnClick = StringGridCharacterClick
      OnDblClick = InsertActionExecute
      OnDrawCell = StringGridCharacterDrawCell
      OnMouseDown = StringGridCharacterMouseDown
      OnMouseUp = StringGridCharacterMouseUp
    end
    object ImagePanel: TPanel
      Left = 150
      Top = 88
      Width = 125
      Height = 125
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 1
      Visible = False
      object ImagePanelShape: TShape
        Left = 0
        Top = 0
        Width = 125
        Height = 125
        Align = alClient
      end
      object Image: TImage
        Left = 0
        Top = 0
        Width = 125
        Height = 125
        Align = alClient
        Transparent = True
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 387
    Height = 30
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      387
      30)
    object FontComboBox: TJvFontComboBox
      AlignWithMargins = True
      Left = 6
      Top = 6
      Width = 375
      Height = 22
      Margins.Left = 6
      Margins.Right = 6
      Anchors = [akLeft, akTop, akRight]
      DroppedDownWidth = 375
      MaxMRUCount = 0
      FontName = 'Arial'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemIndex = 40
      ParentFont = False
      Sorted = True
      TabOrder = 0
      OnChange = FontComboBoxChange
    end
  end
  object ActionList: TActionList
    Left = 58
    Top = 142
    object InsertAction: TAction
      OnExecute = InsertActionExecute
    end
  end
end
