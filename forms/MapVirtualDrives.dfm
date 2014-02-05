object MapVirtualDrivesForm: TMapVirtualDrivesForm
  Left = 0
  Top = 0
  Caption = 'Map Virtual Drives'
  ClientHeight = 508
  ClientWidth = 489
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar: TStatusBar
    Left = 0
    Top = 489
    Width = 489
    Height = 19
    Panels = <>
  end
  object ButtonPanel: TPanel
    Left = 0
    Top = 0
    Width = 489
    Height = 27
    Align = alTop
    BevelOuter = bvNone
    Padding.Left = 2
    Padding.Top = 2
    Padding.Right = 2
    Padding.Bottom = 2
    TabOrder = 1
    object ToolbarSeparator2Bevel: TBevel
      AlignWithMargins = True
      Left = 80
      Top = 4
      Width = 4
      Height = 19
      Margins.Left = 6
      Margins.Top = 2
      Margins.Bottom = 2
      Align = alLeft
      Shape = bsLeftLine
      ExplicitLeft = 93
    end
    object StandardToolBar: TBCToolBar
      Left = 2
      Top = 2
      Width = 72
      Height = 23
      Align = alLeft
      ButtonHeight = 23
      Images = ImagesDataModule.ImageList
      TabOrder = 0
      object NewToolButton: TToolButton
        Left = 0
        Top = 0
        Action = AddAction
      end
      object OpenToolButton: TToolButton
        Left = 23
        Top = 0
        Action = DeleteAction
      end
      object ToolButton1: TToolButton
        Left = 46
        Top = 0
        Action = EditAction
      end
    end
    object CloseToolBar: TBCToolBar
      Left = 87
      Top = 2
      Width = 23
      Height = 23
      Align = alLeft
      ButtonHeight = 23
      Images = ImagesDataModule.ImageList
      TabOrder = 1
      object CloseToolButton: TToolButton
        Left = 0
        Top = 0
        Action = CloseAction
      end
    end
  end
  object VirtualTreePanel: TPanel
    Left = 0
    Top = 27
    Width = 489
    Height = 462
    Align = alClient
    BevelOuter = bvNone
    Padding.Left = 4
    Padding.Right = 4
    Padding.Bottom = 4
    TabOrder = 2
    object VirtualDrawTree: TVirtualDrawTree
      Left = 4
      Top = 0
      Width = 481
      Height = 458
      Align = alClient
      Ctl3D = True
      DragOperations = []
      EditDelay = 0
      Header.AutoSizeIndex = 0
      Header.DefaultHeight = 20
      Header.Font.Charset = DEFAULT_CHARSET
      Header.Font.Color = clWindowText
      Header.Font.Height = -11
      Header.Font.Name = 'Tahoma'
      Header.Font.Style = []
      Header.Height = 20
      Header.Options = [hoAutoResize, hoColumnResize, hoShowSortGlyphs, hoVisible, hoAutoSpring]
      Images = ImagesDataModule.ImageList
      ParentCtl3D = False
      TabOrder = 0
      TreeOptions.AutoOptions = [toAutoDropExpand, toAutoScrollOnExpand]
      TreeOptions.MiscOptions = [toFullRepaintOnResize, toGridExtensions, toInitOnSave, toToggleOnDblClick, toWheelPanning, toEditOnClick]
      TreeOptions.PaintOptions = [toHideFocusRect, toHotTrack, toShowButtons, toShowDropmark, toShowHorzGridLines, toShowVertGridLines, toThemeAware, toUseBlendedSelection]
      TreeOptions.SelectionOptions = [toDisableDrawSelection, toFullRowSelect, toMiddleClickSelect, toRightClickSelect]
      WantTabs = True
      OnCompareNodes = VirtualDrawTreeCompareNodes
      OnDblClick = VirtualDrawTreeDblClick
      OnDrawNode = VirtualDrawTreeDrawNode
      OnFreeNode = VirtualDrawTreeFreeNode
      OnGetImageIndex = VirtualDrawTreeGetImageIndex
      OnGetNodeWidth = VirtualDrawTreeGetNodeWidth
      Columns = <
        item
          Options = [coEnabled, coParentBidiMode, coParentColor, coVisible, coFixed]
          Position = 0
          Width = 41
          WideText = 'Drive'
        end
        item
          Options = [coEnabled, coParentBidiMode, coParentColor, coVisible, coAutoSpring, coSmartResize]
          Position = 1
          Width = 436
          WideText = 'Path'
        end>
    end
  end
  object ActionList: TActionList
    Images = ImagesDataModule.ImageList
    Left = 186
    Top = 72
    object AddAction: TAction
      Caption = 'AddAction'
      Hint = 'Add a virtual drive'
      ImageIndex = 249
    end
    object DeleteAction: TAction
      Caption = 'Open...'
      Hint = 'Delete selected virtual drive'
      ImageIndex = 250
    end
    object EditAction: TAction
      Caption = 'EditAction'
      Hint = 'Edit selected virtual drive'
      ImageIndex = 251
      OnExecute = EditActionExecute
    end
    object CloseAction: TAction
      Caption = 'CloseAction'
      Hint = 'Close the language editor'
      ImageIndex = 76
      OnExecute = CloseActionExecute
    end
  end
  object ApplicationEvents: TApplicationEvents
    OnMessage = ApplicationEventsMessage
    Left = 182
    Top = 148
  end
end
