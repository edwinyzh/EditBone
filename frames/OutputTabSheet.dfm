object OutputTabSheetFrame: TOutputTabSheetFrame
  Left = 0
  Top = 0
  Width = 595
  Height = 198
  TabOrder = 0
  object Panel: TPanel
    Left = 0
    Top = 0
    Width = 595
    Height = 198
    Align = alClient
    BevelOuter = bvNone
    Padding.Left = 1
    Padding.Top = 1
    Padding.Right = 3
    Padding.Bottom = 2
    ParentColor = True
    TabOrder = 0
    object VirtualDrawTree: TVirtualDrawTree
      Left = 1
      Top = 1
      Width = 591
      Height = 195
      Align = alClient
      Colors.GridLineColor = clScrollBar
      Ctl3D = True
      DragOperations = []
      Header.AutoSizeIndex = 0
      Header.Font.Charset = DEFAULT_CHARSET
      Header.Font.Color = clWindowText
      Header.Font.Height = -11
      Header.Font.Name = 'Tahoma'
      Header.Font.Style = []
      Header.MainColumn = -1
      Header.Options = []
      Indent = 20
      ParentCtl3D = False
      TabOrder = 0
      TreeOptions.AutoOptions = [toAutoDropExpand, toAutoScroll, toAutoScrollOnExpand, toAutoTristateTracking, toAutoDeleteMovedNodes, toAutoChangeScale]
      TreeOptions.MiscOptions = [toFullRepaintOnResize, toInitOnSave, toToggleOnDblClick, toWheelPanning]
      TreeOptions.PaintOptions = [toShowButtons, toShowRoot, toThemeAware, toUseBlendedSelection]
      ExplicitTop = 2
      ExplicitHeight = 194
      Columns = <>
    end
  end
end
