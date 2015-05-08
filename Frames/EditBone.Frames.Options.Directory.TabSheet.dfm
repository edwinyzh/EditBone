inherited OptionsDirectoryTabsFrame: TOptionsDirectoryTabsFrame
  Width = 148
  Height = 157
  Visible = False
  object Panel: TBCPanel [0]
    AlignWithMargins = True
    Left = 4
    Top = 0
    Width = 144
    Height = 157
    Margins.Left = 4
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    BevelOuter = bvNone
    Color = clWindow
    ParentBackground = False
    TabOrder = 0
    SkinData.SkinSection = 'CHECKBOX'
    object CheckBoxMultiline: TBCCheckBox
      Left = 0
      Top = 60
      Width = 61
      Height = 20
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Multiline'
      TabOrder = 3
      SkinData.SkinSection = 'CHECKBOX'
      ImgChecked = 0
      ImgUnchecked = 0
    end
    object CheckBoxShowCloseButton: TBCCheckBox
      Left = 0
      Top = 100
      Width = 111
      Height = 20
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Show close button'
      TabOrder = 5
      SkinData.SkinSection = 'CHECKBOX'
      ImgChecked = 0
      ImgUnchecked = 0
    end
    object CheckBoxShowImage: TBCCheckBox
      Left = 0
      Top = 120
      Width = 80
      Height = 20
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Show image'
      TabOrder = 6
      SkinData.SkinSection = 'CHECKBOX'
      ImgChecked = 0
      ImgUnchecked = 0
    end
    object CheckBoxCloseTabByDblClick: TBCCheckBox
      Left = 0
      Top = 0
      Width = 141
      Height = 20
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Close tab by double-click'
      TabOrder = 0
      SkinData.SkinSection = 'CHECKBOX'
      ImgChecked = 0
      ImgUnchecked = 0
    end
    object CheckBoxCloseTabByMiddleClick: TBCCheckBox
      Left = 0
      Top = 20
      Width = 139
      Height = 20
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Close tab by middle-click'
      TabOrder = 1
      SkinData.SkinSection = 'CHECKBOX'
      ImgChecked = 0
      ImgUnchecked = 0
    end
    object CheckBoxDoubleBuffered: TBCCheckBox
      Left = 0
      Top = 40
      Width = 101
      Height = 20
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Double buffered'
      Checked = True
      State = cbChecked
      TabOrder = 2
      SkinData.SkinSection = 'CHECKBOX'
      ImgChecked = 0
      ImgUnchecked = 0
    end
    object CheckBoxRightClickSelect: TBCCheckBox
      Left = 0
      Top = 140
      Width = 101
      Height = 20
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Right click select'
      Checked = True
      State = cbChecked
      TabOrder = 7
      SkinData.SkinSection = 'CHECKBOX'
      ImgChecked = 0
      ImgUnchecked = 0
    end
    object CheckBoxSaveTabs: TBCCheckBox
      Left = 0
      Top = 80
      Width = 71
      Height = 20
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Save tabs'
      Checked = True
      State = cbChecked
      TabOrder = 4
      SkinData.SkinSection = 'CHECKBOX'
      ImgChecked = 0
      ImgUnchecked = 0
    end
  end
end
