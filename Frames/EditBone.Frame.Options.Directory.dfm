inherited OptionsDirectoryFrame: TOptionsDirectoryFrame
  Width = 162
  Height = 176
  object Panel: TBCPanel [0]
    AlignWithMargins = True
    Left = 4
    Top = 0
    Width = 158
    Height = 176
    Margins.Left = 4
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    BevelOuter = bvNone
    Color = clWindow
    ParentBackground = False
    TabOrder = 0
    SkinData.SkinSection = 'CHECKBOX'
    object StickyLabelShowTreeLines: TsStickyLabel
      Left = 0
      Top = 119
      Width = 100
      Height = 13
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      AutoSize = False
      Caption = 'Show Tree Lines'
      AttachTo = SliderShowTreeLines
      Gap = 8
    end
    object StickyLabelShowHiddenFiles: TsStickyLabel
      Left = 0
      Top = 50
      Width = 100
      Height = 13
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      AutoSize = False
      Caption = 'Show Hidden Files'
      AttachTo = SliderShowHiddenFiles
      Gap = 8
    end
    object StickyLabelShowSystemFiles: TsStickyLabel
      Left = 0
      Top = 96
      Width = 100
      Height = 13
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      AutoSize = False
      Caption = 'Show System Files'
      AttachTo = SliderShowSystemFiles
      Gap = 8
    end
    object StickyLabelShowArchiveFiles: TsStickyLabel
      Left = 0
      Top = 27
      Width = 100
      Height = 13
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      AutoSize = False
      Caption = 'Show Archive Files'
      ParentColor = False
      AttachTo = SliderShowArchiveFiles
      Gap = 8
    end
    object StickyLabelShowOverlayIcons: TsStickyLabel
      Left = 0
      Top = 73
      Width = 100
      Height = 13
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      AutoSize = False
      Caption = 'Show Overlay Icons'
      ParentColor = False
      AttachTo = SliderShowOverlayIcons
      Gap = 8
    end
    object StickyLabelAutoHide: TsStickyLabel
      Left = 0
      Top = 4
      Width = 100
      Height = 13
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      AutoSize = False
      Caption = 'Auto hide'
      ParentColor = False
      AttachTo = SliderAutoHide
      Gap = 8
    end
    object SliderShowTreeLines: TsSlider
      Left = 108
      Top = 115
      Width = 50
      AutoSize = True
      TabOrder = 5
      ImageIndexOff = 0
      ImageIndexOn = 0
      FontOn.Charset = DEFAULT_CHARSET
      FontOn.Color = clWindowText
      FontOn.Height = -11
      FontOn.Name = 'Tahoma'
      FontOn.Style = []
      SliderCaptionOn = 'Yes'
      SliderCaptionOff = 'No'
    end
    object EditIndent: TBCEdit
      Left = 0
      Top = 155
      Width = 64
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      TabOrder = 6
      Text = '20'
      SkinData.SkinSection = 'EDIT'
      BoundLabel.Active = True
      BoundLabel.Caption = 'Indent'
      BoundLabel.Indent = 4
      BoundLabel.Layout = sclTopLeft
      EnterToTab = False
      OnlyNumbers = True
      NumbersWithDots = False
      NumbersWithSpots = False
      ErrorColor = 14803198
      NumbersAllowMinus = False
      NumbersAllowPlus = False
    end
    object SliderShowHiddenFiles: TsSlider
      Left = 108
      Top = 46
      Width = 50
      AutoSize = True
      TabOrder = 2
      ImageIndexOff = 0
      ImageIndexOn = 0
      FontOn.Charset = DEFAULT_CHARSET
      FontOn.Color = clWindowText
      FontOn.Height = -11
      FontOn.Name = 'Tahoma'
      FontOn.Style = []
      SliderCaptionOn = 'Yes'
      SliderCaptionOff = 'No'
    end
    object SliderShowSystemFiles: TsSlider
      Left = 108
      Top = 92
      Width = 50
      AutoSize = True
      TabOrder = 4
      ImageIndexOff = 0
      ImageIndexOn = 0
      FontOn.Charset = DEFAULT_CHARSET
      FontOn.Color = clWindowText
      FontOn.Height = -11
      FontOn.Name = 'Tahoma'
      FontOn.Style = []
      SliderCaptionOn = 'Yes'
      SliderCaptionOff = 'No'
    end
    object SliderShowArchiveFiles: TsSlider
      Left = 108
      Top = 23
      Width = 50
      AutoSize = True
      TabOrder = 1
      ImageIndexOff = 0
      ImageIndexOn = 0
      FontOn.Charset = DEFAULT_CHARSET
      FontOn.Color = clWindowText
      FontOn.Height = -11
      FontOn.Name = 'Tahoma'
      FontOn.Style = []
      SliderCaptionOn = 'Yes'
      SliderCaptionOff = 'No'
    end
    object SliderShowOverlayIcons: TsSlider
      Left = 108
      Top = 69
      Width = 50
      AutoSize = True
      TabOrder = 3
      ImageIndexOff = 0
      ImageIndexOn = 0
      FontOn.Charset = DEFAULT_CHARSET
      FontOn.Color = clWindowText
      FontOn.Height = -11
      FontOn.Name = 'Tahoma'
      FontOn.Style = []
      SliderCaptionOn = 'Yes'
      SliderCaptionOff = 'No'
    end
    object SliderAutoHide: TsSlider
      Left = 108
      Top = 0
      Width = 50
      AutoSize = True
      TabOrder = 0
      ImageIndexOff = 0
      ImageIndexOn = 0
      FontOn.Charset = DEFAULT_CHARSET
      FontOn.Color = clWindowText
      FontOn.Height = -11
      FontOn.Name = 'Tahoma'
      FontOn.Style = []
      SliderCaptionOn = 'Yes'
      SliderCaptionOff = 'No'
    end
  end
end
