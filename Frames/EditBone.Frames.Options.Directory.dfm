inherited OptionsDirectoryFrame: TOptionsDirectoryFrame
  Width = 121
  Height = 143
  object Panel: TBCPanel [0]
    AlignWithMargins = True
    Left = 4
    Top = 0
    Width = 117
    Height = 143
    Margins.Left = 4
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    BevelOuter = bvNone
    Color = clWindow
    ParentBackground = False
    TabOrder = 0
    SkinData.SkinSection = 'CHECKBOX'
    object CheckBoxShowTreeLines: TBCCheckBox
      Left = 0
      Top = 0
      Width = 101
      Height = 20
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Show Tree Lines'
      TabOrder = 0
      SkinData.SkinSection = 'CHECKBOX'
      ImgChecked = 0
      ImgUnchecked = 0
    end
    object EditIndent: TBCEdit
      Left = 0
      Top = 122
      Width = 64
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      TabOrder = 5
      Text = '20'
      SkinData.SkinSection = 'EDIT'
      BoundLabel.Active = True
      BoundLabel.Caption = 'Indent'
      BoundLabel.Indent = 4
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'Tahoma'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclTopLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
      EnterToTab = False
      OnlyNumbers = True
      NumbersWithDots = False
      NumbersWithSpots = False
      ErrorColor = 14803198
      NumbersAllowNegative = False
      ValueInt = 20
    end
    object CheckBoxShowHiddenFiles: TBCCheckBox
      Left = 0
      Top = 20
      Width = 109
      Height = 20
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Show Hidden Files'
      TabOrder = 1
      SkinData.SkinSection = 'CHECKBOX'
      ImgChecked = 0
      ImgUnchecked = 0
    end
    object CheckBoxShowSystemFiles: TBCCheckBox
      Left = 0
      Top = 40
      Width = 111
      Height = 20
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Show System Files'
      TabOrder = 2
      SkinData.SkinSection = 'CHECKBOX'
      ImgChecked = 0
      ImgUnchecked = 0
    end
    object CheckBoxShowArchiveFiles: TBCCheckBox
      Left = 0
      Top = 60
      Width = 112
      Height = 20
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Show Archive Files'
      Checked = True
      ParentColor = False
      State = cbChecked
      TabOrder = 3
      SkinData.SkinSection = 'CHECKBOX'
      ImgChecked = 0
      ImgUnchecked = 0
    end
    object CheckBoxShowOverlayIcons: TBCCheckBox
      Left = 0
      Top = 80
      Width = 119
      Height = 20
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Show Overlay Icons'
      Checked = True
      ParentColor = False
      State = cbChecked
      TabOrder = 4
      SkinData.SkinSection = 'CHECKBOX'
      ImgChecked = 0
      ImgUnchecked = 0
    end
  end
end
