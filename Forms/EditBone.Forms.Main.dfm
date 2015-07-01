inherited MainForm: TMainForm
  Caption = 'EditBone'
  ClientHeight = 662
  ClientWidth = 1111
  KeyPreview = True
  Position = poDefault
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  ExplicitWidth = 1127
  ExplicitHeight = 720
  PixelsPerInch = 96
  TextHeight = 13
  object SplitterHorizontal: TBCSplitter [0]
    Left = 0
    Top = 506
    Width = 1111
    Height = 5
    Cursor = crVSplit
    Align = alBottom
    Visible = False
    SkinData.SkinSection = 'SPLITTER'
    ExplicitTop = 505
  end
  inherited StatusBar: TBCStatusBar
    Top = 637
    Width = 1111
    Height = 25
    Panels = <
      item
        Width = 60
      end
      item
        Alignment = taCenter
        Style = psOwnerDraw
        Width = 90
      end
      item
        Width = 90
      end
      item
        Width = 90
      end
      item
        Width = 50
      end>
    ParentColor = True
    OnDrawPanel = StatusBarDrawPanel
    ExplicitTop = 637
    ExplicitWidth = 1111
    ExplicitHeight = 25
    object SpeedButtonMacroPlay: TBCSpeedButton
      Left = 0
      Top = 3
      Width = 16
      Height = 16
      Action = ActionMacroPlayback
      Flat = True
      SkinData.SkinSection = 'TOOLBUTTON'
      ImageIndex = 87
      Images = ImagesDataModule.ImageList
      ShowCaption = False
    end
    object SpeedButtonMacroRecordPause: TBCSpeedButton
      Left = 18
      Top = 3
      Width = 16
      Height = 16
      Action = ActionMacroRecord
      Flat = True
      SkinData.SkinSection = 'TOOLBUTTON'
      ImageIndex = 88
      Images = ImagesDataModule.ImageList
      ShowCaption = False
    end
    object SpeedButtonMacroStop: TBCSpeedButton
      Left = 36
      Top = 3
      Width = 16
      Height = 16
      Action = ActionMacroStop
      Flat = True
      SkinData.SkinSection = 'TOOLBUTTON'
      ImageIndex = 90
      Images = ImagesDataModule.ImageList
      ShowCaption = False
    end
  end
  object PanelMenuBar: TBCPanel [2]
    Left = 0
    Top = 28
    Width = 1111
    Height = 91
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 4
    SkinData.SkinSection = 'CHECKBOX'
    object PageControlToolBar: TBCPageControl
      AlignWithMargins = True
      Left = 0
      Top = 4
      Width = 1111
      Height = 87
      Margins.Left = 0
      Margins.Top = 4
      Margins.Right = 0
      Margins.Bottom = 0
      ActivePage = TabSheetEdit
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      HotTrack = True
      Images = ImagesDataModule.ImageListSmall
      MultiLine = True
      ParentFont = False
      TabOrder = 0
      TabPadding = 2
      TabSpacing = 12
      SkinData.SkinSection = 'RIBBONPAGE'
      SkinData.OuterEffects.Visibility = ovAlways
      ActivePageCaption = 'Edit'
      HoldShiftToDragDrop = False
      TabDragDrop = False
      object TabSheetButton: TsTabSheet
        ImageIndex = 86
        TabType = ttMenu
        TabMenu = PopupMenuToolBar
        TabSkin = 'MENUBTN'
        SkinData.CustomColor = False
        SkinData.CustomFont = False
      end
      object TabSheetFile: TsTabSheet
        Caption = 'File'
        ImageIndex = -1
        TabSkin = 'RIBBONTAB'
        SkinData.CustomColor = False
        SkinData.CustomFont = False
        object PanelFileButtons: TBCPanel
          Left = 0
          Top = 0
          Width = 1103
          Height = 58
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          SkinData.SkinSection = 'CHECKBOX'
          object SpeedButtonFileNew: TBCSpeedButton
            Left = 0
            Top = 0
            Width = 60
            Height = 58
            Action = ActionFileNew
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            ButtonStyle = tbsTextButton
            SkinData.SkinSection = 'TOOLBUTTON'
            ImageIndex = 0
            Images = ImagesDataModule.ImageList
          end
          object SpeedButtonFileOpen: TBCSpeedButton
            Left = 60
            Top = 0
            Width = 60
            Height = 58
            Action = ActionFileOpen
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsTextButton
            SkinData.SkinSection = 'TOOLBUTTON'
            ImageIndex = 1
            Images = ImagesDataModule.ImageList
          end
          object SpeedButtonFileReopen: TBCSpeedButton
            Left = 120
            Top = 0
            Width = 70
            Height = 58
            Action = ActionFileReopen
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsDropDown
            SkinData.SkinSection = 'TOOLBUTTON'
            DropdownMenu = PopupMenuFileReopen
            ImageIndex = 2
            Images = ImagesDataModule.ImageList
          end
          object SpeedButtonFileDivider1: TBCSpeedButton
            AlignWithMargins = True
            Left = 190
            Top = 4
            Width = 10
            Height = 50
            Margins.Left = 0
            Margins.Top = 4
            Margins.Right = 0
            Margins.Bottom = 4
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            OnClick = ActionFileOpenExecute
            ButtonStyle = tbsDivider
            SkinData.SkinSection = 'SPEEDBUTTON'
            ImageIndex = 1
          end
          object SpeedButtonFileSave: TBCSpeedButton
            Left = 200
            Top = 0
            Width = 60
            Height = 58
            Action = ActionFileSave
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsTextButton
            SkinData.SkinSection = 'TOOLBUTTON'
            ImageIndex = 3
            Images = ImagesDataModule.ImageList
          end
          object SpeedButtonFileSaveAs: TBCSpeedButton
            Left = 260
            Top = 0
            Width = 60
            Height = 58
            Action = ActionFileSaveAs
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsTextButton
            SkinData.SkinSection = 'TOOLBUTTON'
            ImageIndex = 4
            Images = ImagesDataModule.ImageList
          end
          object SpeedButtonFileSaveAll: TBCSpeedButton
            Left = 320
            Top = 0
            Width = 60
            Height = 58
            Action = ActionFileSaveAll
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsTextButton
            SkinData.SkinSection = 'TOOLBUTTON'
            ImageIndex = 5
            Images = ImagesDataModule.ImageList
          end
          object SpeedButtonFileDivider2: TBCSpeedButton
            AlignWithMargins = True
            Left = 566
            Top = 4
            Width = 10
            Height = 50
            Margins.Left = 0
            Margins.Top = 4
            Margins.Right = 0
            Margins.Bottom = 4
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            OnClick = ActionFileOpenExecute
            ButtonStyle = tbsDivider
            SkinData.SkinSection = 'SPEEDBUTTON'
            ImageIndex = 1
          end
          object SpeedButtonCloseAllOther: TBCSpeedButton
            Left = 500
            Top = 0
            Width = 66
            Height = 58
            Action = ActionFileCloseAllOther
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsTextButton
            SkinData.SkinSection = 'TOOLBUTTON'
            ImageIndex = 8
            Images = ImagesDataModule.ImageList
          end
          object SpeedButtonCloseAll: TBCSpeedButton
            Left = 440
            Top = 0
            Width = 60
            Height = 58
            Action = ActionFileCloseAll
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsTextButton
            SkinData.SkinSection = 'TOOLBUTTON'
            ImageIndex = 7
            Images = ImagesDataModule.ImageList
          end
          object SpeedButtonClose: TBCSpeedButton
            Left = 380
            Top = 0
            Width = 60
            Height = 58
            Action = ActionFileClose
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsTextButton
            SkinData.SkinSection = 'TOOLBUTTON'
            ImageIndex = 6
            Images = ImagesDataModule.ImageList
          end
          object SpeedButtonFilePrint: TBCSpeedButton
            Left = 576
            Top = 0
            Width = 60
            Height = 58
            Action = ActionFilePrint
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsTextButton
            SkinData.SkinSection = 'TOOLBUTTON'
            ImageIndex = 9
            Images = ImagesDataModule.ImageList
          end
          object SpeedButtonFilePrintPreview: TBCSpeedButton
            Left = 636
            Top = 0
            Width = 60
            Height = 58
            Action = ActionFilePrintPreview
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsTextButton
            SkinData.SkinSection = 'TOOLBUTTON'
            ImageIndex = 10
            Images = ImagesDataModule.ImageList
          end
          object SpeedButtonFileDivider3: TBCSpeedButton
            AlignWithMargins = True
            Left = 696
            Top = 4
            Width = 10
            Height = 50
            Margins.Left = 0
            Margins.Top = 4
            Margins.Right = 0
            Margins.Bottom = 4
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            OnClick = ActionFileOpenExecute
            ButtonStyle = tbsDivider
            SkinData.SkinSection = 'SPEEDBUTTON'
            ImageIndex = 1
          end
          object SpeedButtonFileExit: TBCSpeedButton
            Left = 706
            Top = 0
            Width = 60
            Height = 58
            Action = ActionFileExit
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsTextButton
            SkinData.SkinSection = 'TOOLBUTTON'
            ImageIndex = 11
            Images = ImagesDataModule.ImageList
          end
        end
      end
      object TabSheetEdit: TsTabSheet
        Caption = 'Edit'
        ImageIndex = -1
        TabSkin = 'RIBBONTAB'
        SkinData.CustomColor = False
        SkinData.CustomFont = False
        object PanelEditButtons: TBCPanel
          Left = 0
          Top = 0
          Width = 1103
          Height = 58
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          SkinData.SkinSection = 'CHECKBOX'
          object SpeedButtonEditUndo: TBCSpeedButton
            Left = 0
            Top = 0
            Width = 60
            Height = 58
            Action = ActionEditUndo
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsTextButton
            SkinData.SkinSection = 'TOOLBUTTON'
            ImageIndex = 12
            Images = ImagesDataModule.ImageList
          end
          object SpeedButtonEditRedo: TBCSpeedButton
            Left = 60
            Top = 0
            Width = 60
            Height = 58
            Action = ActionEditRedo
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsTextButton
            SkinData.SkinSection = 'TOOLBUTTON'
            ImageIndex = 13
            Images = ImagesDataModule.ImageList
          end
          object SpeedButtonEditDivider1: TBCSpeedButton
            AlignWithMargins = True
            Left = 120
            Top = 4
            Width = 10
            Height = 50
            Margins.Left = 0
            Margins.Top = 4
            Margins.Right = 0
            Margins.Bottom = 4
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            OnClick = ActionFileOpenExecute
            ButtonStyle = tbsDivider
            SkinData.SkinSection = 'SPEEDBUTTON'
            ImageIndex = 1
          end
          object SpeedButtonEditCut: TBCSpeedButton
            Left = 130
            Top = 0
            Width = 60
            Height = 58
            Action = ActionEditCut
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsTextButton
            SkinData.SkinSection = 'TOOLBUTTON'
            ImageIndex = 14
            Images = ImagesDataModule.ImageList
          end
          object SpeedButtonEditCopy: TBCSpeedButton
            Left = 190
            Top = 0
            Width = 60
            Height = 58
            Action = ActionEditCopy
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsTextButton
            SkinData.SkinSection = 'TOOLBUTTON'
            ImageIndex = 15
            Images = ImagesDataModule.ImageList
          end
          object SpeedButtonEditPaste: TBCSpeedButton
            Left = 250
            Top = 0
            Width = 60
            Height = 58
            Action = ActionEditPaste
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsTextButton
            SkinData.SkinSection = 'TOOLBUTTON'
            ImageIndex = 16
            Images = ImagesDataModule.ImageList
          end
          object SpeedButtonEditDivider2: TBCSpeedButton
            AlignWithMargins = True
            Left = 370
            Top = 4
            Width = 10
            Height = 50
            Margins.Left = 0
            Margins.Top = 4
            Margins.Right = 0
            Margins.Bottom = 4
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            OnClick = ActionFileOpenExecute
            ButtonStyle = tbsDivider
            SkinData.SkinSection = 'SPEEDBUTTON'
            ImageIndex = 1
          end
          object SpeedButtonEditSelectAll: TBCSpeedButton
            Left = 310
            Top = 0
            Width = 60
            Height = 58
            Action = ActionEditSelectAll
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsTextButton
            SkinData.SkinSection = 'TOOLBUTTON'
            ImageIndex = 17
            Images = ImagesDataModule.ImageList
          end
          object SpeedButtonEditInsert: TBCSpeedButton
            Left = 380
            Top = 0
            Width = 70
            Height = 58
            Action = ActionEditInsert
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsDropDown
            SkinData.SkinSection = 'TOOLBUTTON'
            DropdownMenu = PopupMenuEditInsert
            ImageIndex = 18
            Images = ImagesDataModule.ImageList
          end
          object SpeedButtonEditDelete: TBCSpeedButton
            Left = 450
            Top = 0
            Width = 70
            Height = 58
            Action = ActionEditDelete
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsDropDown
            SkinData.SkinSection = 'TOOLBUTTON'
            DropdownMenu = PopupMenuEditDelete
            ImageIndex = 22
            Images = ImagesDataModule.ImageList
          end
          object SpeedButtonEditDivider3: TBCSpeedButton
            AlignWithMargins = True
            Left = 520
            Top = 4
            Width = 10
            Height = 50
            Margins.Left = 0
            Margins.Top = 4
            Margins.Right = 0
            Margins.Bottom = 4
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            OnClick = ActionFileOpenExecute
            ButtonStyle = tbsDivider
            SkinData.SkinSection = 'SPEEDBUTTON'
            ImageIndex = 1
          end
          object SpeedButtonEditSort: TBCSpeedButton
            Left = 600
            Top = 0
            Width = 70
            Height = 58
            Action = ActionEditSort
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsDropDown
            SkinData.SkinSection = 'TOOLBUTTON'
            DropdownMenu = PopupMenuEditSort
            ImageIndex = 30
            Images = ImagesDataModule.ImageList
          end
          object SpeedButtonEditIndent: TBCSpeedButton
            Left = 530
            Top = 0
            Width = 70
            Height = 58
            Action = ActionEditIndent
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsDropDown
            SkinData.SkinSection = 'TOOLBUTTON'
            DropdownMenu = PopupMenuEditIndent
            ImageIndex = 27
            Images = ImagesDataModule.ImageList
          end
          object SpeedButtonEditDivider4: TBCSpeedButton
            AlignWithMargins = True
            Left = 670
            Top = 4
            Width = 10
            Height = 50
            Margins.Left = 0
            Margins.Top = 4
            Margins.Right = 0
            Margins.Bottom = 4
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            OnClick = ActionFileOpenExecute
            ButtonStyle = tbsDivider
            SkinData.SkinSection = 'SPEEDBUTTON'
            ImageIndex = 1
          end
          object SpeedButtonEditToggleCase: TBCSpeedButton
            Left = 680
            Top = 0
            Width = 76
            Height = 58
            Action = ActionEditToggleCase
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsDropDown
            SkinData.SkinSection = 'TOOLBUTTON'
            DropdownMenu = PopupMenuToggleCase
            ImageIndex = 33
            Images = ImagesDataModule.ImageList
          end
        end
      end
      object TabSheetSearch: TsTabSheet
        Caption = 'Search'
        ImageIndex = -1
        TabSkin = 'RIBBONTAB'
        SkinData.CustomColor = False
        SkinData.CustomFont = False
        object PanelSearchButtons: TBCPanel
          Left = 0
          Top = 0
          Width = 1103
          Height = 58
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          SkinData.SkinSection = 'CHECKBOX'
          object SpeedButtonSearchSearch: TBCSpeedButton
            Left = 0
            Top = 0
            Width = 60
            Height = 58
            Action = ActionSearchSearch
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsTextButton
            SkinData.SkinSection = 'TOOLBUTTON'
            ImageIndex = 34
            Images = ImagesDataModule.ImageList
          end
          object SpeedButtonSearchReplace: TBCSpeedButton
            Left = 60
            Top = 0
            Width = 60
            Height = 58
            Action = ActionSearchReplace
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsTextButton
            SkinData.SkinSection = 'TOOLBUTTON'
            ImageIndex = 35
            Images = ImagesDataModule.ImageList
          end
          object SpeedButtonSearchDivider1: TBCSpeedButton
            AlignWithMargins = True
            Left = 180
            Top = 4
            Width = 10
            Height = 50
            Margins.Left = 0
            Margins.Top = 4
            Margins.Right = 0
            Margins.Bottom = 4
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            OnClick = ActionFileOpenExecute
            ButtonStyle = tbsDivider
            SkinData.SkinSection = 'SPEEDBUTTON'
            ImageIndex = 1
          end
          object SpeedButtonSearchFindInFiles: TBCSpeedButton
            Left = 120
            Top = 0
            Width = 60
            Height = 58
            Action = ActionSearchFindInFiles
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsTextButton
            SkinData.SkinSection = 'TOOLBUTTON'
            ImageIndex = 36
            Images = ImagesDataModule.ImageList
          end
          object SpeedButtonSearchToggleBookmark: TBCSpeedButton
            Left = 190
            Top = 0
            Width = 80
            Height = 58
            Action = ActionSearchToggleBookmark
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsTextButton
            SkinData.SkinSection = 'TOOLBUTTON'
            ImageIndex = 39
            Images = ImagesDataModule.ImageList
          end
          object SpeedButtonSearchToggleBookmarks: TBCSpeedButton
            Left = 270
            Top = 0
            Width = 94
            Height = 58
            Action = ActionSearchToggleBookmarks
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsDropDown
            SkinData.SkinSection = 'TOOLBUTTON'
            DropdownMenu = PopupMenuSearchToggleBookmarks
            ImageIndex = 40
            Images = ImagesDataModule.ImageList
          end
          object SpeedButtonSearchGoToBookmarks: TBCSpeedButton
            Left = 364
            Top = 0
            Width = 94
            Height = 58
            Action = ActionSearchGoToBookmarks
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsDropDown
            SkinData.SkinSection = 'TOOLBUTTON'
            DropdownMenu = PopupMenuSearchGotoBookmarks
            ImageIndex = 41
            Images = ImagesDataModule.ImageList
          end
          object SpeedButtonSearchDivider2: TBCSpeedButton
            AlignWithMargins = True
            Left = 538
            Top = 4
            Width = 10
            Height = 50
            Margins.Left = 0
            Margins.Top = 4
            Margins.Right = 0
            Margins.Bottom = 4
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            OnClick = ActionFileOpenExecute
            ButtonStyle = tbsDivider
            SkinData.SkinSection = 'SPEEDBUTTON'
            ImageIndex = 1
          end
          object SpeedButtonSearchClearBookmarks: TBCSpeedButton
            Left = 458
            Top = 0
            Width = 80
            Height = 58
            Action = ActionSearchClearBookmarks
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsTextButton
            SkinData.SkinSection = 'TOOLBUTTON'
            ImageIndex = 42
            Images = ImagesDataModule.ImageList
          end
          object SpeedButtonSearchGoToLine: TBCSpeedButton
            Left = 548
            Top = 0
            Width = 60
            Height = 58
            Action = ActionSearchGoToLine
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsTextButton
            SkinData.SkinSection = 'TOOLBUTTON'
            ImageIndex = 43
            Images = ImagesDataModule.ImageList
          end
        end
      end
      object TabSheetView: TsTabSheet
        Caption = 'View'
        ImageIndex = -1
        TabSkin = 'RIBBONTAB'
        SkinData.CustomColor = False
        SkinData.CustomFont = False
        object PanelViewButtons: TBCPanel
          Left = 0
          Top = 0
          Width = 1103
          Height = 58
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          SkinData.SkinSection = 'CHECKBOX'
          object SpeedButtonViewOpenDirectory: TBCSpeedButton
            Left = 0
            Top = 0
            Width = 60
            Height = 58
            Action = ActionViewOpenDirectory
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            ButtonStyle = tbsTextButton
            SkinData.SkinSection = 'TOOLBUTTON'
            ImageIndex = 53
            Images = ImagesDataModule.ImageList
          end
          object SpeedButtonViewCloseDirectory: TBCSpeedButton
            Left = 60
            Top = 0
            Width = 60
            Height = 58
            Action = ActionViewCloseDirectory
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsTextButton
            SkinData.SkinSection = 'TOOLBUTTON'
            ImageIndex = 54
            Images = ImagesDataModule.ImageList
          end
          object SpeedButtonViewDivider1: TBCSpeedButton
            AlignWithMargins = True
            Left = 180
            Top = 4
            Width = 10
            Height = 50
            Margins.Left = 0
            Margins.Top = 4
            Margins.Right = 0
            Margins.Bottom = 4
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            OnClick = ActionFileOpenExecute
            ButtonStyle = tbsDivider
            SkinData.SkinSection = 'SPEEDBUTTON'
            ImageIndex = 1
          end
          object SpeedButtonViewEditDirectory: TBCSpeedButton
            Left = 120
            Top = 0
            Width = 60
            Height = 58
            Action = ActionViewEditDirectory
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsTextButton
            SkinData.SkinSection = 'TOOLBUTTON'
            ImageIndex = 55
            Images = ImagesDataModule.ImageList
          end
          object SpeedButtonViewFiles: TBCSpeedButton
            Left = 190
            Top = 0
            Width = 60
            Height = 58
            Action = ActionViewFiles
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsTextButton
            SkinData.SkinSection = 'TOOLBUTTON'
            ImageIndex = 56
            Images = ImagesDataModule.ImageList
          end
          object SpeedButtonViewWordWrap: TBCSpeedButton
            Left = 260
            Top = 0
            Width = 60
            Height = 58
            Action = ActionViewWordWrap
            Align = alLeft
            AllowAllUp = True
            GroupIndex = 1
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            SkinData.SkinSection = 'TOOLBUTTON'
            ImageIndex = 57
            Images = ImagesDataModule.ImageList
          end
          object SpeedButtonViewDivider2: TBCSpeedButton
            AlignWithMargins = True
            Left = 250
            Top = 4
            Width = 10
            Height = 50
            Margins.Left = 0
            Margins.Top = 4
            Margins.Right = 0
            Margins.Bottom = 4
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            OnClick = ActionFileOpenExecute
            ButtonStyle = tbsDivider
            SkinData.SkinSection = 'SPEEDBUTTON'
            ImageIndex = 1
          end
          object SpeedButtonViewSelectionMode: TBCSpeedButton
            Left = 440
            Top = 0
            Width = 60
            Height = 58
            Action = ActionViewSelectionMode
            Align = alLeft
            AllowAllUp = True
            GroupIndex = 4
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            SkinData.SkinSection = 'TOOLBUTTON'
            ImageIndex = 60
            Images = ImagesDataModule.ImageList
          end
          object SpeedButtonViewSpecialChars: TBCSpeedButton
            Left = 380
            Top = 0
            Width = 60
            Height = 58
            Action = ActionViewSpecialChars
            Align = alLeft
            AllowAllUp = True
            GroupIndex = 3
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            SkinData.SkinSection = 'TOOLBUTTON'
            ImageIndex = 59
            Images = ImagesDataModule.ImageList
          end
          object SpeedButtonViewLineNumbers: TBCSpeedButton
            Left = 320
            Top = 0
            Width = 60
            Height = 58
            Action = ActionViewLineNumbers
            Align = alLeft
            AllowAllUp = True
            GroupIndex = 2
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            SkinData.SkinSection = 'TOOLBUTTON'
            ImageIndex = 58
            Images = ImagesDataModule.ImageList
          end
          object SpeedButtonViewPreviousPage: TBCSpeedButton
            Left = 690
            Top = 0
            Width = 60
            Height = 58
            Action = ActionViewPreviousPage
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsTextButton
            SkinData.SkinSection = 'TOOLBUTTON'
            ImageIndex = 61
            Images = ImagesDataModule.ImageList
          end
          object SpeedButtonViewDivider3: TBCSpeedButton
            AlignWithMargins = True
            Left = 680
            Top = 4
            Width = 10
            Height = 50
            Margins.Left = 0
            Margins.Top = 4
            Margins.Right = 0
            Margins.Bottom = 4
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            OnClick = ActionFileOpenExecute
            ButtonStyle = tbsDivider
            SkinData.SkinSection = 'SPEEDBUTTON'
            ImageIndex = 1
          end
          object SpeedButtonViewNextPage: TBCSpeedButton
            Left = 750
            Top = 0
            Width = 60
            Height = 58
            Action = ActionViewNextPage
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsTextButton
            SkinData.SkinSection = 'TOOLBUTTON'
            ImageIndex = 62
            Images = ImagesDataModule.ImageList
          end
          object SpeedButtonXMLTree: TBCSpeedButton
            Left = 620
            Top = 0
            Width = 60
            Height = 58
            Action = ActionViewXMLTree
            Align = alLeft
            AllowAllUp = True
            GroupIndex = 7
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            SkinData.SkinSection = 'TOOLBUTTON'
            ImageIndex = 85
            Images = ImagesDataModule.ImageList
          end
          object SpeedButtonViewSplit: TBCSpeedButton
            Left = 560
            Top = 0
            Width = 60
            Height = 58
            Action = ActionViewSplit
            Align = alLeft
            AllowAllUp = True
            GroupIndex = 6
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            SkinData.SkinSection = 'TOOLBUTTON'
            ImageIndex = 95
            Images = ImagesDataModule.ImageList
          end
          object SpeedButtonViewMinimap: TBCSpeedButton
            Left = 500
            Top = 0
            Width = 60
            Height = 58
            Action = ActionViewMinimap
            Align = alLeft
            AllowAllUp = True
            GroupIndex = 5
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            SkinData.SkinSection = 'TOOLBUTTON'
            ImageIndex = 94
            Images = ImagesDataModule.ImageList
          end
        end
      end
      object TabSheetDocument: TsTabSheet
        Caption = 'Document'
        ImageIndex = -1
        TabSkin = 'RIBBONTAB'
        SkinData.CustomColor = False
        SkinData.CustomFont = False
        object PanelDocumentButtons: TBCPanel
          Left = 0
          Top = 0
          Width = 1103
          Height = 58
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          SkinData.SkinSection = 'CHECKBOX'
          object SpeedButtonDocumentInfo: TBCSpeedButton
            Left = 0
            Top = 0
            Width = 60
            Height = 58
            Action = ActionDocumentInfo
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            ButtonStyle = tbsTextButton
            SkinData.SkinSection = 'TOOLBUTTON'
            ImageIndex = 63
            Images = ImagesDataModule.ImageList
          end
          object SpeedButtonDocumentDivider1: TBCSpeedButton
            AlignWithMargins = True
            Left = 60
            Top = 4
            Width = 10
            Height = 50
            Margins.Left = 0
            Margins.Top = 4
            Margins.Right = 0
            Margins.Bottom = 4
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            OnClick = ActionFileOpenExecute
            ButtonStyle = tbsDivider
            SkinData.SkinSection = 'SPEEDBUTTON'
            ImageIndex = 1
            ExplicitLeft = 47
            ExplicitTop = -4
          end
          object SpeedButtonDocumentViewInBrowser: TBCSpeedButton
            Left = 232
            Top = 0
            Width = 82
            Height = 58
            Action = ActionDocumentViewInBrowser
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsTextButton
            SkinData.SkinSection = 'TOOLBUTTON'
            ImageIndex = 64
            Images = ImagesDataModule.ImageList
          end
          object SpeedButtonDocumentDivider2: TBCSpeedButton
            AlignWithMargins = True
            Left = 222
            Top = 4
            Width = 10
            Height = 50
            Margins.Left = 0
            Margins.Top = 4
            Margins.Right = 0
            Margins.Bottom = 4
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            OnClick = ActionFileOpenExecute
            ButtonStyle = tbsDivider
            SkinData.SkinSection = 'SPEEDBUTTON'
            ImageIndex = 1
            ExplicitLeft = 232
            ExplicitTop = 8
          end
          object SpeedButtonDocumentFormat: TBCSpeedButton
            Left = 70
            Top = 0
            Width = 76
            Height = 58
            Action = ActionDocumentFormat
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsDropDown
            SkinData.SkinSection = 'TOOLBUTTON'
            DropdownMenu = PopupMenuDocumentFormat
            ImageIndex = 65
            Images = ImagesDataModule.ImageList
            ExplicitLeft = 54
            ExplicitTop = -4
          end
          object SpeedButtonDocumentMacro: TBCSpeedButton
            Left = 146
            Top = 0
            Width = 76
            Height = 58
            Action = ActionMacro
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsDropDown
            SkinData.SkinSection = 'TOOLBUTTON'
            DropdownMenu = PopupMenuDocumentMacro
            ImageIndex = 136
            Images = ImagesDataModule.ImageList
            ExplicitLeft = 140
          end
        end
      end
      object TabSheetTools: TsTabSheet
        Caption = 'Tools'
        ImageIndex = -1
        TabSkin = 'RIBBONTAB'
        SkinData.CustomColor = False
        SkinData.CustomFont = False
        object PanelToolsButtons: TBCPanel
          Left = 0
          Top = 0
          Width = 1103
          Height = 58
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          SkinData.SkinSection = 'CHECKBOX'
          object SpeedButtonToolsOptions: TBCSpeedButton
            Left = 0
            Top = 0
            Width = 60
            Height = 58
            Action = ActionToolsOptions
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            ButtonStyle = tbsTextButton
            SkinData.SkinSection = 'TOOLBUTTON'
            ImageIndex = 68
            Images = ImagesDataModule.ImageList
          end
          object SpeedButtonToolsCompareFiles: TBCSpeedButton
            Left = 70
            Top = 0
            Width = 60
            Height = 58
            Action = ActionToolsCompareFiles
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsTextButton
            SkinData.SkinSection = 'TOOLBUTTON'
            ImageIndex = 69
            Images = ImagesDataModule.ImageList
          end
          object SpeedButtonToolsDivider1: TBCSpeedButton
            AlignWithMargins = True
            Left = 60
            Top = 4
            Width = 10
            Height = 50
            Margins.Left = 0
            Margins.Top = 4
            Margins.Right = 0
            Margins.Bottom = 4
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            OnClick = ActionFileOpenExecute
            ButtonStyle = tbsDivider
            SkinData.SkinSection = 'SPEEDBUTTON'
            ImageIndex = 1
          end
          object SpeedButtonToolsConvert: TBCSpeedButton
            Left = 130
            Top = 0
            Width = 60
            Height = 58
            Action = ActionToolsConvert
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsTextButton
            SkinData.SkinSection = 'TOOLBUTTON'
            ImageIndex = 70
            Images = ImagesDataModule.ImageList
          end
          object SpeedButtonToolsCharacterMap: TBCSpeedButton
            Left = 190
            Top = 0
            Width = 60
            Height = 58
            Action = ActionToolsCharacterMap
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsTextButton
            SkinData.SkinSection = 'TOOLBUTTON'
            ImageIndex = 71
            Images = ImagesDataModule.ImageList
          end
          object SpeedButtonToolsDivider2: TBCSpeedButton
            AlignWithMargins = True
            Left = 250
            Top = 4
            Width = 10
            Height = 50
            Margins.Left = 0
            Margins.Top = 4
            Margins.Right = 0
            Margins.Bottom = 4
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            OnClick = ActionFileOpenExecute
            ButtonStyle = tbsDivider
            SkinData.SkinSection = 'SPEEDBUTTON'
            ImageIndex = 1
          end
          object SpeedButtonToolsLanguageEditor: TBCSpeedButton
            Left = 260
            Top = 0
            Width = 65
            Height = 58
            Action = ActionToolsLanguageEditor
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsTextButton
            SkinData.SkinSection = 'TOOLBUTTON'
            ImageIndex = 75
            Images = ImagesDataModule.ImageList
          end
        end
      end
      object TabSheetHelp: TsTabSheet
        Caption = 'Help'
        ImageIndex = -1
        TabSkin = 'RIBBONTAB'
        SkinData.CustomColor = False
        SkinData.CustomFont = False
        object PanelHelpButtons: TBCPanel
          Left = 0
          Top = 0
          Width = 1103
          Height = 58
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          SkinData.SkinSection = 'CHECKBOX'
          object SpeedButtonHelpCheckForUpdates: TBCSpeedButton
            Left = 0
            Top = 0
            Width = 81
            Height = 58
            Action = ActionHelpCheckForUpdates
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            ButtonStyle = tbsTextButton
            SkinData.SkinSection = 'TOOLBUTTON'
            ImageIndex = 72
            Images = ImagesDataModule.ImageList
          end
          object SpeedButtonHelpVisitHomepage: TBCSpeedButton
            Left = 91
            Top = 0
            Width = 68
            Height = 58
            Action = ActionHelpVisitHomepage
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsTextButton
            SkinData.SkinSection = 'TOOLBUTTON'
            ImageIndex = 73
            Images = ImagesDataModule.ImageList
            ExplicitLeft = 70
          end
          object SpeedButtonHelpDivider1: TBCSpeedButton
            AlignWithMargins = True
            Left = 81
            Top = 4
            Width = 10
            Height = 50
            Margins.Left = 0
            Margins.Top = 4
            Margins.Right = 0
            Margins.Bottom = 4
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            OnClick = ActionFileOpenExecute
            ButtonStyle = tbsDivider
            SkinData.SkinSection = 'SPEEDBUTTON'
            ImageIndex = 1
            ExplicitLeft = 60
          end
          object SpeedButtonHelpAboutEditBone: TBCSpeedButton
            Left = 169
            Top = 0
            Width = 74
            Height = 58
            Action = ActionHelpAboutEditBone
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Segoe UI'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            ButtonStyle = tbsTextButton
            SkinData.SkinSection = 'TOOLBUTTON'
            ImageIndex = 74
            Images = ImagesDataModule.ImageList
          end
          object SpeedButtonHelpDivider2: TBCSpeedButton
            AlignWithMargins = True
            Left = 159
            Top = 4
            Width = 10
            Height = 50
            Margins.Left = 0
            Margins.Top = 4
            Margins.Right = 0
            Margins.Bottom = 4
            Align = alLeft
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = []
            Layout = blGlyphTop
            ParentFont = False
            OnClick = ActionFileOpenExecute
            ButtonStyle = tbsDivider
            SkinData.SkinSection = 'SPEEDBUTTON'
            ImageIndex = 1
            ExplicitLeft = 130
          end
        end
      end
    end
  end
  object PanelMiddle: TBCPanel [3]
    Left = 0
    Top = 119
    Width = 1111
    Height = 387
    Align = alClient
    BevelOuter = bvNone
    Color = clWindow
    DoubleBuffered = False
    ParentBackground = False
    ParentDoubleBuffered = False
    TabOrder = 2
    SkinData.SkinSection = 'CHECKBOX'
    object SplitterVertical: TBCSplitter
      Left = 329
      Top = 0
      Width = 5
      Height = 387
      Visible = False
      SkinData.SkinSection = 'SPLITTER'
      ExplicitLeft = 255
      ExplicitHeight = 386
    end
    object PanelDirectory: TBCPanel
      AlignWithMargins = True
      Left = 0
      Top = 5
      Width = 329
      Height = 377
      Margins.Left = 0
      Margins.Top = 5
      Margins.Right = 0
      Margins.Bottom = 5
      Align = alLeft
      BevelOuter = bvNone
      Color = clWindow
      DoubleBuffered = False
      ParentBackground = False
      ParentDoubleBuffered = False
      TabOrder = 0
      Visible = False
      SkinData.SkinSection = 'CHECKBOX'
    end
    object PanelDocument: TBCPanel
      AlignWithMargins = True
      Left = 334
      Top = 5
      Width = 777
      Height = 377
      Margins.Left = 0
      Margins.Top = 5
      Margins.Right = 0
      Margins.Bottom = 5
      Align = alClient
      BevelOuter = bvNone
      Color = clWindow
      DoubleBuffered = False
      ParentBackground = False
      ParentDoubleBuffered = False
      TabOrder = 1
      SkinData.SkinSection = 'CHECKBOX'
    end
  end
  object PanelOutput: TBCPanel [4]
    AlignWithMargins = True
    Left = 0
    Top = 511
    Width = 1111
    Height = 121
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 5
    Align = alBottom
    BevelOuter = bvNone
    Color = clWindow
    ParentBackground = False
    TabOrder = 3
    Visible = False
    SkinData.SkinSection = 'CHECKBOX'
  end
  object PanelToolBar: TBCPanel [5]
    Left = 0
    Top = 0
    Width = 1111
    Height = 28
    Align = alTop
    BevelOuter = bvNone
    Color = clWindow
    Padding.Left = 2
    Padding.Top = 2
    Padding.Right = 2
    Padding.Bottom = 2
    ParentBackground = False
    TabOrder = 1
    Visible = False
    SkinData.SkinSection = 'CHECKBOX'
    object SpeedButtonToolbarFileNew: TBCSpeedButton
      Left = 2
      Top = 2
      Width = 26
      Height = 24
      Action = ActionFileNew
      Align = alLeft
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Segoe UI'
      Font.Style = []
      Layout = blGlyphTop
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      ButtonStyle = tbsTextButton
      SkinData.SkinSection = 'TOOLBUTTON'
      ImageIndex = 0
      Images = ImagesDataModule.ImageList
      ShowCaption = False
    end
    object SpeedButtonToolbarFileOpen: TBCSpeedButton
      Left = 28
      Top = 2
      Width = 26
      Height = 24
      Action = ActionFileOpen
      Align = alLeft
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Segoe UI'
      Font.Style = []
      Layout = blGlyphTop
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      ButtonStyle = tbsTextButton
      SkinData.SkinSection = 'TOOLBUTTON'
      ImageIndex = 1
      Images = ImagesDataModule.ImageList
      ShowCaption = False
    end
    object SpeedButtonToolbarDivider1: TBCSpeedButton
      AlignWithMargins = True
      Left = 54
      Top = 4
      Width = 10
      Height = 20
      Margins.Left = 0
      Margins.Top = 2
      Margins.Right = 0
      Margins.Bottom = 2
      Align = alLeft
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      Layout = blGlyphTop
      ParentFont = False
      OnClick = ActionFileOpenExecute
      ButtonStyle = tbsDivider
      SkinData.SkinSection = 'SPEEDBUTTON'
      ImageIndex = 1
    end
    object SpeedButtonToolbarFileSave: TBCSpeedButton
      Left = 64
      Top = 2
      Width = 26
      Height = 24
      Action = ActionFileSave
      Align = alLeft
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Segoe UI'
      Font.Style = []
      Layout = blGlyphTop
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      ButtonStyle = tbsTextButton
      SkinData.SkinSection = 'TOOLBUTTON'
      ImageIndex = 3
      Images = ImagesDataModule.ImageList
      ShowCaption = False
    end
    object SpeedButtonToolbarFileSaveAs: TBCSpeedButton
      Left = 90
      Top = 2
      Width = 26
      Height = 24
      Action = ActionFileSaveAs
      Align = alLeft
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Segoe UI'
      Font.Style = []
      Layout = blGlyphTop
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      ButtonStyle = tbsTextButton
      SkinData.SkinSection = 'TOOLBUTTON'
      ImageIndex = 4
      Images = ImagesDataModule.ImageList
      ShowCaption = False
    end
    object SpeedButtonToolbarFileSaveAll: TBCSpeedButton
      Left = 116
      Top = 2
      Width = 26
      Height = 24
      Action = ActionFileSaveAll
      Align = alLeft
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Segoe UI'
      Font.Style = []
      Layout = blGlyphTop
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      ButtonStyle = tbsTextButton
      SkinData.SkinSection = 'TOOLBUTTON'
      ImageIndex = 5
      Images = ImagesDataModule.ImageList
      ShowCaption = False
    end
    object SpeedButtonToolbarFileClose: TBCSpeedButton
      Left = 142
      Top = 2
      Width = 26
      Height = 24
      Action = ActionFileClose
      Align = alLeft
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Segoe UI'
      Font.Style = []
      Layout = blGlyphTop
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      ButtonStyle = tbsTextButton
      SkinData.SkinSection = 'TOOLBUTTON'
      ImageIndex = 6
      Images = ImagesDataModule.ImageList
      ShowCaption = False
    end
    object SpeedButtonToolbarFileCloseAll: TBCSpeedButton
      Left = 168
      Top = 2
      Width = 26
      Height = 24
      Action = ActionFileCloseAll
      Align = alLeft
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Segoe UI'
      Font.Style = []
      Layout = blGlyphTop
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      ButtonStyle = tbsTextButton
      SkinData.SkinSection = 'TOOLBUTTON'
      ImageIndex = 7
      Images = ImagesDataModule.ImageList
      ShowCaption = False
    end
    object SpeedButtonToolbarDivider6: TBCSpeedButton
      AlignWithMargins = True
      Left = 468
      Top = 4
      Width = 10
      Height = 20
      Margins.Left = 0
      Margins.Top = 2
      Margins.Right = 0
      Margins.Bottom = 2
      Align = alLeft
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      Layout = blGlyphTop
      ParentFont = False
      OnClick = ActionFileOpenExecute
      ButtonStyle = tbsDivider
      SkinData.SkinSection = 'SPEEDBUTTON'
      ImageIndex = 1
    end
    object SpeedButtonToolbarFilePrint: TBCSpeedButton
      Left = 204
      Top = 2
      Width = 26
      Height = 24
      Action = ActionFilePrint
      Align = alLeft
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Segoe UI'
      Font.Style = []
      Layout = blGlyphTop
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      ButtonStyle = tbsTextButton
      SkinData.SkinSection = 'TOOLBUTTON'
      ImageIndex = 9
      Images = ImagesDataModule.ImageList
      ShowCaption = False
    end
    object SpeedButtonToolbarFilePrintPreview: TBCSpeedButton
      Left = 230
      Top = 2
      Width = 26
      Height = 24
      Action = ActionFilePrintPreview
      Align = alLeft
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Segoe UI'
      Font.Style = []
      Layout = blGlyphTop
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      ButtonStyle = tbsTextButton
      SkinData.SkinSection = 'TOOLBUTTON'
      ImageIndex = 10
      Images = ImagesDataModule.ImageList
      ShowCaption = False
    end
    object SpeedButtonToolbarDivider3: TBCSpeedButton
      AlignWithMargins = True
      Left = 256
      Top = 4
      Width = 10
      Height = 20
      Margins.Left = 0
      Margins.Top = 2
      Margins.Right = 0
      Margins.Bottom = 2
      Align = alLeft
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      Layout = blGlyphTop
      ParentFont = False
      OnClick = ActionFileOpenExecute
      ButtonStyle = tbsDivider
      SkinData.SkinSection = 'SPEEDBUTTON'
      ImageIndex = 1
    end
    object SpeedButtonToolbarDivider4: TBCSpeedButton
      AlignWithMargins = True
      Left = 344
      Top = 4
      Width = 10
      Height = 20
      Margins.Left = 0
      Margins.Top = 2
      Margins.Right = 0
      Margins.Bottom = 2
      Align = alLeft
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      Layout = blGlyphTop
      ParentFont = False
      OnClick = ActionFileOpenExecute
      ButtonStyle = tbsDivider
      SkinData.SkinSection = 'SPEEDBUTTON'
      ImageIndex = 1
    end
    object SpeedButtonToolbarDivider5: TBCSpeedButton
      AlignWithMargins = True
      Left = 406
      Top = 4
      Width = 10
      Height = 20
      Margins.Left = 0
      Margins.Top = 2
      Margins.Right = 0
      Margins.Bottom = 2
      Align = alLeft
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      Layout = blGlyphTop
      ParentFont = False
      OnClick = ActionFileOpenExecute
      ButtonStyle = tbsDivider
      SkinData.SkinSection = 'SPEEDBUTTON'
      ImageIndex = 1
    end
    object SpeedButtonToolbarDivider8: TBCSpeedButton
      AlignWithMargins = True
      Left = 566
      Top = 4
      Width = 10
      Height = 20
      Margins.Left = 0
      Margins.Top = 2
      Margins.Right = 0
      Margins.Bottom = 2
      Align = alLeft
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      Layout = blGlyphTop
      ParentFont = False
      OnClick = ActionFileOpenExecute
      ButtonStyle = tbsDivider
      SkinData.SkinSection = 'SPEEDBUTTON'
      ImageIndex = 1
    end
    object SpeedButtonToolbarDivider7: TBCSpeedButton
      AlignWithMargins = True
      Left = 504
      Top = 4
      Width = 10
      Height = 20
      Margins.Left = 0
      Margins.Top = 2
      Margins.Right = 0
      Margins.Bottom = 2
      Align = alLeft
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      Layout = blGlyphTop
      ParentFont = False
      OnClick = ActionFileOpenExecute
      ButtonStyle = tbsDivider
      SkinData.SkinSection = 'SPEEDBUTTON'
      ImageIndex = 1
    end
    object SpeedButtonToolbarDivider9: TBCSpeedButton
      AlignWithMargins = True
      Left = 654
      Top = 4
      Width = 10
      Height = 20
      Margins.Left = 0
      Margins.Top = 2
      Margins.Right = 0
      Margins.Bottom = 2
      Align = alLeft
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      Layout = blGlyphTop
      ParentFont = False
      OnClick = ActionFileOpenExecute
      ButtonStyle = tbsDivider
      SkinData.SkinSection = 'SPEEDBUTTON'
      ImageIndex = 1
    end
    object SpeedButtonToolbarDivider10: TBCSpeedButton
      AlignWithMargins = True
      Left = 820
      Top = 4
      Width = 10
      Height = 20
      Margins.Left = 0
      Margins.Top = 2
      Margins.Right = 0
      Margins.Bottom = 2
      Align = alLeft
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      Layout = blGlyphTop
      ParentFont = False
      OnClick = ActionFileOpenExecute
      ButtonStyle = tbsDivider
      SkinData.SkinSection = 'SPEEDBUTTON'
      ImageIndex = 1
    end
    object SpeedButtonToolbarDivider11: TBCSpeedButton
      AlignWithMargins = True
      Left = 856
      Top = 4
      Width = 10
      Height = 20
      Margins.Left = 0
      Margins.Top = 2
      Margins.Right = 0
      Margins.Bottom = 2
      Align = alLeft
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      Layout = blGlyphTop
      ParentFont = False
      OnClick = ActionFileOpenExecute
      ButtonStyle = tbsDivider
      SkinData.SkinSection = 'SPEEDBUTTON'
      ImageIndex = 1
    end
    object SpeedButtonToolbarDivider2: TBCSpeedButton
      AlignWithMargins = True
      Left = 194
      Top = 4
      Width = 10
      Height = 20
      Margins.Left = 0
      Margins.Top = 2
      Margins.Right = 0
      Margins.Bottom = 2
      Align = alLeft
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      Layout = blGlyphTop
      ParentFont = False
      OnClick = ActionFileOpenExecute
      ButtonStyle = tbsDivider
      SkinData.SkinSection = 'SPEEDBUTTON'
      ImageIndex = 1
    end
    object SpeedButtonToolbarViewOpenDirectory: TBCSpeedButton
      Left = 266
      Top = 2
      Width = 26
      Height = 24
      Action = ActionViewOpenDirectory
      Align = alLeft
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Segoe UI'
      Font.Style = []
      Layout = blGlyphTop
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      ButtonStyle = tbsTextButton
      SkinData.SkinSection = 'TOOLBUTTON'
      ImageIndex = 53
      Images = ImagesDataModule.ImageList
      ShowCaption = False
    end
    object SpeedButtonToolbarViewCloseDirectory: TBCSpeedButton
      Left = 292
      Top = 2
      Width = 26
      Height = 24
      Action = ActionViewCloseDirectory
      Align = alLeft
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Segoe UI'
      Font.Style = []
      Layout = blGlyphTop
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      ButtonStyle = tbsTextButton
      SkinData.SkinSection = 'TOOLBUTTON'
      ImageIndex = 54
      Images = ImagesDataModule.ImageList
      ShowCaption = False
    end
    object SpeedButtonToolbarViewEditDirectory: TBCSpeedButton
      Left = 318
      Top = 2
      Width = 26
      Height = 24
      Action = ActionViewEditDirectory
      Align = alLeft
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Segoe UI'
      Font.Style = []
      Layout = blGlyphTop
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      ButtonStyle = tbsTextButton
      SkinData.SkinSection = 'TOOLBUTTON'
      ImageIndex = 55
      Images = ImagesDataModule.ImageList
      ShowCaption = False
    end
    object SpeedButtonToolbarEditIndentIncrease: TBCSpeedButton
      Left = 354
      Top = 2
      Width = 26
      Height = 24
      Action = ActionEditIndentIncrease
      Align = alLeft
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Segoe UI'
      Font.Style = []
      Layout = blGlyphTop
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      ButtonStyle = tbsTextButton
      SkinData.SkinSection = 'TOOLBUTTON'
      ImageIndex = 28
      Images = ImagesDataModule.ImageList
      ShowCaption = False
    end
    object SpeedButtonToolbarEditIndentDecrease: TBCSpeedButton
      Left = 380
      Top = 2
      Width = 26
      Height = 24
      Action = ActionEditIndentDecrease
      Align = alLeft
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Segoe UI'
      Font.Style = []
      Layout = blGlyphTop
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      ButtonStyle = tbsTextButton
      SkinData.SkinSection = 'TOOLBUTTON'
      ImageIndex = 29
      Images = ImagesDataModule.ImageList
      ShowCaption = False
    end
    object SpeedButtonToolbarEditSortAsc: TBCSpeedButton
      Left = 416
      Top = 2
      Width = 26
      Height = 24
      Action = ActionEditSortAsc
      Align = alLeft
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Segoe UI'
      Font.Style = []
      Layout = blGlyphTop
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      ButtonStyle = tbsTextButton
      SkinData.SkinSection = 'TOOLBUTTON'
      ImageIndex = 31
      Images = ImagesDataModule.ImageList
      ShowCaption = False
    end
    object SpeedButtonToolbarEditSortDesc: TBCSpeedButton
      Left = 442
      Top = 2
      Width = 26
      Height = 24
      Action = ActionEditSortDesc
      Align = alLeft
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Segoe UI'
      Font.Style = []
      Layout = blGlyphTop
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      ButtonStyle = tbsTextButton
      SkinData.SkinSection = 'TOOLBUTTON'
      ImageIndex = 32
      Images = ImagesDataModule.ImageList
      ShowCaption = False
    end
    object SpeedButtonToolbarEditToggleCase: TBCSpeedButton
      Left = 478
      Top = 2
      Width = 26
      Height = 24
      Action = ActionEditToggleCase
      Align = alLeft
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Segoe UI'
      Font.Style = []
      Layout = blGlyphTop
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      ButtonStyle = tbsTextButton
      SkinData.SkinSection = 'TOOLBUTTON'
      ImageIndex = 33
      Images = ImagesDataModule.ImageList
      ShowCaption = False
    end
    object SpeedButtonToolbarEditUndo: TBCSpeedButton
      Left = 514
      Top = 2
      Width = 26
      Height = 24
      Action = ActionEditUndo
      Align = alLeft
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Segoe UI'
      Font.Style = []
      Layout = blGlyphTop
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      ButtonStyle = tbsTextButton
      SkinData.SkinSection = 'TOOLBUTTON'
      ImageIndex = 12
      Images = ImagesDataModule.ImageList
      ShowCaption = False
    end
    object SpeedButtonToolbarEditRedo: TBCSpeedButton
      Left = 540
      Top = 2
      Width = 26
      Height = 24
      Action = ActionEditRedo
      Align = alLeft
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Segoe UI'
      Font.Style = []
      Layout = blGlyphTop
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      ButtonStyle = tbsTextButton
      SkinData.SkinSection = 'TOOLBUTTON'
      ImageIndex = 13
      Images = ImagesDataModule.ImageList
      ShowCaption = False
    end
    object SpeedButtonToolbarSearchSearch: TBCSpeedButton
      Left = 576
      Top = 2
      Width = 26
      Height = 24
      Action = ActionSearchSearch
      Align = alLeft
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Segoe UI'
      Font.Style = []
      Layout = blGlyphTop
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      ButtonStyle = tbsTextButton
      SkinData.SkinSection = 'TOOLBUTTON'
      ImageIndex = 34
      Images = ImagesDataModule.ImageList
      ShowCaption = False
    end
    object SpeedButtonToolbarSearchReplace: TBCSpeedButton
      Left = 602
      Top = 2
      Width = 26
      Height = 24
      Action = ActionSearchReplace
      Align = alLeft
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Segoe UI'
      Font.Style = []
      Layout = blGlyphTop
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      ButtonStyle = tbsTextButton
      SkinData.SkinSection = 'TOOLBUTTON'
      ImageIndex = 35
      Images = ImagesDataModule.ImageList
      ShowCaption = False
    end
    object SpeedButtonToolbarSearchFindInFiles: TBCSpeedButton
      Left = 628
      Top = 2
      Width = 26
      Height = 24
      Action = ActionSearchFindInFiles
      Align = alLeft
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Segoe UI'
      Font.Style = []
      Layout = blGlyphTop
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      ButtonStyle = tbsTextButton
      SkinData.SkinSection = 'TOOLBUTTON'
      ImageIndex = 36
      Images = ImagesDataModule.ImageList
      ShowCaption = False
    end
    object SpeedButtonToolbarViewWordWrap: TBCSpeedButton
      Left = 664
      Top = 2
      Width = 26
      Height = 24
      Action = ActionViewWordWrap
      Align = alLeft
      AllowAllUp = True
      GroupIndex = 1
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Segoe UI'
      Font.Style = []
      Layout = blGlyphTop
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      ButtonStyle = tbsCheck
      SkinData.SkinSection = 'TOOLBUTTON'
      ImageIndex = 57
      Images = ImagesDataModule.ImageList
      ShowCaption = False
    end
    object SpeedButtonToolbarViewLineNumbers: TBCSpeedButton
      Left = 690
      Top = 2
      Width = 26
      Height = 24
      Action = ActionViewLineNumbers
      Align = alLeft
      AllowAllUp = True
      GroupIndex = 2
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Segoe UI'
      Font.Style = []
      Layout = blGlyphTop
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      ButtonStyle = tbsCheck
      SkinData.SkinSection = 'TOOLBUTTON'
      ImageIndex = 58
      Images = ImagesDataModule.ImageList
      ShowCaption = False
    end
    object SpeedButtonToolbarViewSpecialChars: TBCSpeedButton
      Left = 716
      Top = 2
      Width = 26
      Height = 24
      Action = ActionViewSpecialChars
      Align = alLeft
      AllowAllUp = True
      GroupIndex = 3
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Segoe UI'
      Font.Style = []
      Layout = blGlyphTop
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      ButtonStyle = tbsCheck
      SkinData.SkinSection = 'TOOLBUTTON'
      ImageIndex = 59
      Images = ImagesDataModule.ImageList
      ShowCaption = False
    end
    object SpeedButtonToolbarViewSelectionMode: TBCSpeedButton
      Left = 742
      Top = 2
      Width = 26
      Height = 24
      Action = ActionViewSelectionMode
      Align = alLeft
      AllowAllUp = True
      GroupIndex = 4
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Segoe UI'
      Font.Style = []
      Layout = blGlyphTop
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      ButtonStyle = tbsCheck
      SkinData.SkinSection = 'TOOLBUTTON'
      ImageIndex = 60
      Images = ImagesDataModule.ImageList
      ShowCaption = False
    end
    object SpeedButtonToolbarToolsCompareFiles: TBCSpeedButton
      Left = 830
      Top = 2
      Width = 26
      Height = 24
      Action = ActionToolsCompareFiles
      Align = alLeft
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Segoe UI'
      Font.Style = []
      Layout = blGlyphTop
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      ButtonStyle = tbsTextButton
      SkinData.SkinSection = 'TOOLBUTTON'
      ImageIndex = 69
      Images = ImagesDataModule.ImageList
      ShowCaption = False
    end
    object SpeedButtonToolbarDocumentInfo: TBCSpeedButton
      Left = 866
      Top = 2
      Width = 26
      Height = 24
      Action = ActionDocumentInfo
      Align = alLeft
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Segoe UI'
      Font.Style = []
      Layout = blGlyphTop
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      ButtonStyle = tbsTextButton
      SkinData.SkinSection = 'TOOLBUTTON'
      ImageIndex = 63
      Images = ImagesDataModule.ImageList
      ShowCaption = False
    end
    object SpeedButtonToolbarDocumentViewInBrowser: TBCSpeedButton
      Left = 892
      Top = 2
      Width = 26
      Height = 24
      Action = ActionDocumentViewInBrowser
      Align = alLeft
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Segoe UI'
      Font.Style = []
      Layout = blGlyphTop
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      ButtonStyle = tbsTextButton
      SkinData.SkinSection = 'TOOLBUTTON'
      ImageIndex = 64
      Images = ImagesDataModule.ImageList
      ShowCaption = False
    end
    object SpeedButtonToolbarViewSplit: TBCSpeedButton
      Left = 794
      Top = 2
      Width = 26
      Height = 24
      Action = ActionViewSplit
      Align = alLeft
      AllowAllUp = True
      GroupIndex = 6
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Segoe UI'
      Font.Style = []
      Layout = blGlyphTop
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      ButtonStyle = tbsCheck
      SkinData.SkinSection = 'TOOLBUTTON'
      ImageIndex = 95
      Images = ImagesDataModule.ImageList
      ShowCaption = False
    end
    object SpeedButtonToolbarViewMinimap: TBCSpeedButton
      Left = 768
      Top = 2
      Width = 26
      Height = 24
      Action = ActionViewMinimap
      Align = alLeft
      AllowAllUp = True
      GroupIndex = 5
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Segoe UI'
      Font.Style = []
      Layout = blGlyphTop
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      ButtonStyle = tbsCheck
      SkinData.SkinSection = 'TOOLBUTTON'
      ImageIndex = 94
      Images = ImagesDataModule.ImageList
      ShowCaption = False
    end
  end
  inherited SkinManager: TBCSkinManager
    IsDefault = False
    ThirdParty.ThirdButtons = ' '#13#10'TButton'#13#10
    ThirdParty.ThirdGrids = ' '#13#10'TStringGrid'#13#10
    ThirdParty.ThirdVirtualTrees = ' '#13#10'TBCFileTreeView'#13#10'TVirtualDrawTree'#13#10
    OnGetMenuExtraLineData = SkinManagerGetMenuExtraLineData
    Left = 32
    Top = 178
  end
  inherited TitleBar: TBCTitleBar
    Images = ImagesDataModule.ImageListSmall
    Items = <
      item
        DropdownMenu = PopupMenuToolBar
        FontData.Font.Charset = DEFAULT_CHARSET
        FontData.Font.Color = clWindowText
        FontData.Font.Height = -11
        FontData.Font.Name = 'Tahoma'
        FontData.Font.Style = []
        Height = 16
        ImageIndex = 86
        Index = 0
        Name = 'TitleBarItemMenu'
        ShowHint = False
        Visible = False
        Width = 16
      end
      item
        Caption = 'EditBone'
        FontData.Font.Charset = DEFAULT_CHARSET
        FontData.Font.Color = clWindowText
        FontData.Font.Height = -11
        FontData.Font.Name = 'Tahoma'
        FontData.Font.Style = []
        Height = 21
        Index = 1
        Name = 'TitleBarItemCaption'
        ShowHint = False
        Style = bsInfo
        Width = 53
      end
      item
        Align = tbaRight
        Caption = 'ANSI'
        DropdownMenu = PopupMenuEncoding
        FontData.Font.Charset = DEFAULT_CHARSET
        FontData.Font.Color = clWindowText
        FontData.Font.Height = -11
        FontData.Font.Name = 'Tahoma'
        FontData.Font.Style = []
        Height = 22
        Index = 2
        Name = 'TitleBarItemEncoding'
        ShowHint = False
        Style = bsMenu
        Width = 56
        OnMouseDown = TitleBarItems2MouseDown
      end
      item
        Align = tbaRight
        FontData.Font.Charset = DEFAULT_CHARSET
        FontData.Font.Color = clWindowText
        FontData.Font.Height = -11
        FontData.Font.Name = 'Tahoma'
        FontData.Font.Style = []
        Index = 3
        Name = 'TitleBarItemSpacing1'
        ShowHint = False
        Style = bsSpacing
        Width = 6
      end
      item
        Align = tbaRight
        Caption = 'Text'
        DropdownMenu = PopupMenuHighlighters
        FontData.Font.Charset = DEFAULT_CHARSET
        FontData.Font.Color = clWindowText
        FontData.Font.Height = -11
        FontData.Font.Name = 'Tahoma'
        FontData.Font.Style = []
        Height = 22
        Index = 4
        Name = 'TitleBarItemHighlighter'
        ShowHint = False
        Style = bsMenu
        Width = 52
        OnMouseDown = TitleBarItems4MouseDown
      end
      item
        Align = tbaRight
        FontData.Font.Charset = DEFAULT_CHARSET
        FontData.Font.Color = clWindowText
        FontData.Font.Height = -11
        FontData.Font.Name = 'Tahoma'
        FontData.Font.Style = []
        Index = 5
        Name = 'TitleBarItemSpacing2'
        ShowHint = False
        Style = bsSpacing
        Width = 6
      end
      item
        Align = tbaRight
        Caption = 'Default'
        DropdownMenu = PopupMenuColors
        FontData.Font.Charset = DEFAULT_CHARSET
        FontData.Font.Color = clWindowText
        FontData.Font.Height = -11
        FontData.Font.Name = 'Tahoma'
        FontData.Font.Style = []
        Height = 22
        Index = 6
        Name = 'TitleBarItemColors'
        ShowHint = False
        Style = bsMenu
        Width = 68
        OnMouseDown = TitleBarItems6MouseDown
      end
      item
        Align = tbaRight
        FontData.Font.Charset = DEFAULT_CHARSET
        FontData.Font.Color = clWindowText
        FontData.Font.Height = -11
        FontData.Font.Name = 'Tahoma'
        FontData.Font.Style = []
        Index = 7
        Name = 'TitleBarItemSpacing3'
        ShowHint = False
        Style = bsSpacing
        Width = 2
      end>
    Left = 36
    Top = 234
  end
  inherited SkinProvider: TBCSkinProvider
    Left = 32
    Top = 294
  end
  inherited ApplicationEvents: TApplicationEvents
    OnActivate = ApplicationEventsActivate
    OnHint = ApplicationEventsHint
    OnMessage = ApplicationEventsMessage
    Left = 122
    Top = 244
  end
  object PopupMenuEditInsert: TPopupMenu [10]
    Images = ImagesDataModule.ImageList
    Left = 276
    Top = 145
    object MenuItemEditInsertLine: TMenuItem
      Action = ActionEditInsertLine
    end
    object MenuItemEditInsertTags: TMenuItem
      Action = ActionEditInsertTag
    end
    object MenuItemEditInsertDate: TMenuItem
      Action = ActionEditInsertDateTime
    end
  end
  object PopupMenuEditDelete: TPopupMenu [11]
    Images = ImagesDataModule.ImageList
    Left = 276
    Top = 203
    object MenuItemEditDeleteLine: TMenuItem
      Action = ActionEditDeleteLine
    end
    object MenuItemEditDeleteEndOfLine: TMenuItem
      Action = ActionEditDeleteEndOfLine
    end
    object MenuItemEditDeleteWord: TMenuItem
      Action = ActionEditDeleteWord
    end
    object MenuItemEditDeleteWhitespace: TMenuItem
      Action = ActionEditDeleteWhitespace
    end
  end
  object PopupMenuFileReopen: TPopupMenu [12]
    Images = ImagesDataModule.ImageListSmall
    Left = 338
    Top = 117
  end
  object PopupMenuEditIndent: TPopupMenu [13]
    Images = ImagesDataModule.ImageList
    Left = 276
    Top = 261
    object MenuItemEditIndentDecrease: TMenuItem
      Action = ActionEditIndentDecrease
    end
    object MenuItemEditIndentIncrease: TMenuItem
      Action = ActionEditIndentIncrease
    end
  end
  object PopupMenuEditSort: TPopupMenu [14]
    Images = ImagesDataModule.ImageList
    Left = 276
    Top = 313
    object MenuItemEditSortAscending: TMenuItem
      Action = ActionEditSortAsc
    end
    object MenuItemEditSortDescending: TMenuItem
      Action = ActionEditSortDesc
    end
  end
  object PopupMenuSearchGotoBookmarks: TPopupMenu [15]
    Images = ImagesDataModule.ImageList
    Left = 445
    Top = 153
    object MenuItemSearchGotoBookmark1: TMenuItem
      Action = ActionGotoBookmarks1
    end
    object MenuItemSearchGotoBookmark2: TMenuItem
      Action = ActionGotoBookmarks2
    end
    object MenuItemSearchGotoBookmark3: TMenuItem
      Action = ActionGotoBookmarks3
    end
    object MenuItemSearchGotoBookmark4: TMenuItem
      Action = ActionGotoBookmarks4
    end
    object MenuItemSearchGotoBookmark5: TMenuItem
      Action = ActionGotoBookmarks5
    end
    object MenuItemSearchGotoBookmark6: TMenuItem
      Action = ActionGotoBookmarks6
    end
    object MenuItemSearchGotoBookmark7: TMenuItem
      Action = ActionGotoBookmarks7
    end
    object MenuItemSearchGotoBookmark8: TMenuItem
      Action = ActionGotoBookmarks8
    end
    object MenuItemSearchGotoBookmark9: TMenuItem
      Action = ActionGotoBookmarks9
    end
  end
  object PopupMenuSearchToggleBookmarks: TPopupMenu [16]
    Images = ImagesDataModule.ImageList
    Left = 445
    Top = 209
    object MenuItemSearchToggleBookmark1: TMenuItem
      Action = ActionToggleBookmarks1
    end
    object MenuItemSearchToggleBookmark2: TMenuItem
      Action = ActionToggleBookmarks2
    end
    object MenuItemSearchToggleBookmark3: TMenuItem
      Action = ActionToggleBookmarks3
    end
    object MenuItemSearchToggleBookmark4: TMenuItem
      Action = ActionToggleBookmarks4
    end
    object MenuItemSearchToggleBookmark5: TMenuItem
      Action = ActionToggleBookmarks5
    end
    object MenuItemSearchToggleBookmark6: TMenuItem
      Action = ActionToggleBookmarks6
    end
    object MenuItemSearchToggleBookmark7: TMenuItem
      Action = ActionToggleBookmarks7
    end
    object MenuItemSearchToggleBookmark8: TMenuItem
      Action = ActionToggleBookmarks8
    end
    object MenuItemSearchToggleBookmark9: TMenuItem
      Action = ActionToggleBookmarks9
    end
  end
  object PopupMenuToolBar: TPopupMenu [17]
    Images = ImagesDataModule.ImageList
    Left = 277
    Top = 381
    object MenuItemToolBarMenuLanguage: TMenuItem
      Action = ActionToolBarMenuLanguage
      SubMenuImages = ImagesDataModule.ImageListSmall
    end
    object MenuItemToolBarMenuSkin: TMenuItem
      Action = ActionToolBarMenuSkin
      SubMenuImages = ImagesDataModule.ImageListSmall
    end
    object MenuItemToolBarMenuView: TMenuItem
      Action = ActionToolBarMenuView
      SubMenuImages = ImagesDataModule.ImageListSmall
      object MenuItemToolBarMenuViewColor: TMenuItem
        Action = ActionViewColorSelection
        Hint = 'Show or hide the color selection'
      end
      object MenuItemToolBarMenuViewDirectory: TMenuItem
        Action = ActionViewDirectory
      end
      object MenuItemToolBarMenuViewEncoding: TMenuItem
        Action = ActionViewEncodingSelection
      end
      object MenuItemToolBarMenuViewHighlighter: TMenuItem
        Action = ActionViewHighlighterSelection
      end
      object MenuItemMainMenu: TMenuItem
        Action = ActionViewMainMenu
      end
      object MenuItemToolBarMenuViewMenuBar: TMenuItem
        Action = ActionViewMenuBar
      end
      object MenuItemToolBarMenuViewOutput: TMenuItem
        Action = ActionViewOutput
      end
      object MenuItemToolBarMenuViewStatusBar: TMenuItem
        Action = ActionViewStatusBar
      end
      object MenuItemToolBarMenuViewToolbar: TMenuItem
        Action = ActionViewToolbar
      end
    end
  end
  object PopupMenuColors: TPopupMenu [18]
    Left = 446
    Top = 366
  end
  object PopupMenuHighlighters: TPopupMenu [19]
    Left = 446
    Top = 310
  end
  object PopupMenuEncoding: TPopupMenu [20]
    Left = 444
    Top = 264
    object MenuItemEncodingANSI: TMenuItem
      Tag = 1
      Action = ActionEncodingANSI
      RadioItem = True
    end
    object MenuItemEncodingASCII: TMenuItem
      Action = ActionEncodingASCII
      RadioItem = True
    end
    object MenuItemEncodingBigEndianUnicode: TMenuItem
      Tag = 2
      Action = ActionEncodingBigEndianUnicode
      RadioItem = True
    end
    object MenuItemEncodingUnicode: TMenuItem
      Tag = 3
      Action = ActionEncodingUnicode
      RadioItem = True
    end
    object MenuItemEncodingUTF7: TMenuItem
      Tag = 4
      Action = ActionEncodingUTF7
      RadioItem = True
    end
    object MenuItemEncodingUTF8: TMenuItem
      Tag = 5
      Action = ActionEncodingUTF8
      RadioItem = True
    end
    object MenuItemEncodingUTF8WithoutBOM: TMenuItem
      Tag = 6
      Action = ActionEncodingUTF8WithoutBOM
      RadioItem = True
    end
  end
  inherited ActionList: TActionList
    Images = ImagesDataModule.ImageList
    Left = 122
    Top = 300
    object ActionFile: TAction [0]
      Category = 'File'
      Caption = 'File'
      OnExecute = ActionDummyExecute
    end
    object ActionFileNew: TAction [1]
      Category = 'File'
      Caption = 'New'
      Hint = 'Create a new document'
      ImageIndex = 0
      ShortCut = 16462
      OnExecute = ActionFileNewExecute
    end
    object ActionFileOpen: TAction [2]
      Category = 'File'
      Caption = 'Open'
      Hint = 'Open an existing document'
      ImageIndex = 1
      ShortCut = 16463
      OnExecute = ActionFileOpenExecute
    end
    object ActionFileReopen: TAction [3]
      Category = 'File'
      Caption = 'Reopen'
      ImageIndex = 2
      OnExecute = ActionFileReopenExecute
    end
    object ActionFileSave: TAction [4]
      Category = 'File'
      Caption = 'Save'
      Hint = 'Save the active document'
      ImageIndex = 3
      ShortCut = 16467
      OnExecute = ActionFileSaveExecute
    end
    object ActionFileSaveAs: TAction [5]
      Category = 'File'
      Caption = 'Save as'
      Hint = 'Save the active document with a new name'
      ImageIndex = 4
      ShortCut = 49235
      OnExecute = ActionFileSaveAsExecute
    end
    object ActionFileSaveAll: TAction [6]
      Category = 'File'
      Caption = 'Save all'
      Hint = 'Save all documents'
      ImageIndex = 5
      ShortCut = 24659
      OnExecute = ActionFileSaveAllExecute
    end
    object ActionFileClose: TAction [7]
      Category = 'File'
      Caption = 'Close'
      Hint = 'Close the active document'
      ImageIndex = 6
      ShortCut = 16499
      OnExecute = ActionFileCloseExecute
    end
    object ActionFileCloseAll: TAction [8]
      Category = 'File'
      Caption = 'Close all'
      Hint = 'Close all open files'
      ImageIndex = 7
      OnExecute = ActionFileCloseAllExecute
    end
    object ActionFileCloseAllOther: TAction [9]
      Category = 'File'
      Caption = 'Close all other'
      Hint = 'Close all other pages'
      ImageIndex = 8
      ShortCut = 24691
      OnExecute = ActionFileCloseAllOtherExecute
    end
    object ActionFilePrint: TAction [10]
      Category = 'File'
      Caption = 'Print'
      Hint = 'Print the active document'
      ImageIndex = 9
      ShortCut = 16464
      OnExecute = ActionFilePrintExecute
    end
    object ActionFilePrintPreview: TAction [11]
      Category = 'File'
      Caption = 'Print preview'
      Hint = 'Preview the active document'
      ImageIndex = 10
      OnExecute = ActionFilePrintPreviewExecute
    end
    inherited ActionFileExit: TAction
      Category = 'File'
    end
    object ActionEditUndo: TAction
      Category = 'Edit'
      Caption = 'Undo'
      Hint = 'Undo the last action'
      ImageIndex = 12
      ShortCut = 16474
      OnExecute = ActionEditUndoExecute
    end
    object ActionEditRedo: TAction
      Category = 'Edit'
      Caption = 'Redo'
      Hint = 'Redo the previously undone action'
      ImageIndex = 13
      ShortCut = 24666
      OnExecute = ActionEditRedoExecute
    end
    object ActionEditCut: TAction
      Category = 'Edit'
      Caption = 'Cut'
      Hint = 'Cut the selection and put it on the clipboard'
      ImageIndex = 14
      ShortCut = 16472
      OnExecute = ActionEditCutExecute
    end
    object ActionEditCopy: TAction
      Category = 'Edit'
      Caption = 'Copy'
      Hint = 'Copy the selection and put it on the clipboard'
      ImageIndex = 15
      ShortCut = 16451
      OnExecute = ActionEditCopyExecute
    end
    object ActionEditPaste: TAction
      Category = 'Edit'
      Caption = 'Paste'
      Hint = 'Insert clipboard contents'
      ImageIndex = 16
      ShortCut = 16470
      OnExecute = ActionEditPasteExecute
    end
    object ActionEditSelectAll: TAction
      Category = 'Edit'
      Caption = 'Select all'
      Hint = 'Select all'
      ImageIndex = 17
      ShortCut = 16449
      OnExecute = ActionEditSelectAllExecute
    end
    object ActionEditInsert: TAction
      Category = 'Edit'
      Caption = 'Insert'
      ImageIndex = 18
      OnExecute = ActionDummyExecute
    end
    object ActionEditInsertLine: TAction
      Category = 'Edit'
      Caption = 'Line'
      Hint = 'Insert line'
      ImageIndex = 19
      ShortCut = 16397
      OnExecute = ActionEditInsertLineExecute
    end
    object ActionEditInsertTag: TAction
      Category = 'Edit'
      Caption = 'HTML/XML tags'
      Hint = 'Insert HTML/XML tags'
      ImageIndex = 20
      ShortCut = 24660
      OnExecute = ActionEditInsertTagExecute
    end
    object ActionEditInsertDateTime: TAction
      Category = 'Edit'
      Caption = 'Date and time'
      Hint = 'Insert date and time'
      ImageIndex = 21
      ShortCut = 41028
      OnExecute = ActionEditInsertDateTimeExecute
    end
    object ActionEditDelete: TAction
      Category = 'Edit'
      Caption = 'Delete'
      ImageIndex = 22
      OnExecute = ActionDummyExecute
    end
    object ActionEditDeleteLine: TAction
      Category = 'Edit'
      Caption = 'Line'
      Hint = 'Delete line'
      ImageIndex = 23
      ShortCut = 16473
      OnExecute = ActionEditDeleteLineExecute
    end
    object ActionEditDeleteEndOfLine: TAction
      Category = 'Edit'
      Caption = 'End of line'
      Hint = 'Delete end of line'
      ImageIndex = 24
      ShortCut = 24665
      OnExecute = ActionEditDeleteEndOfLineExecute
    end
    object ActionEditDeleteWord: TAction
      Category = 'Edit'
      Caption = 'Word'
      Hint = 'Delete word'
      ImageIndex = 25
      ShortCut = 16468
      OnExecute = ActionEditDeleteWordExecute
    end
    object ActionEditDeleteWhitespace: TAction
      Category = 'Edit'
      Caption = 'Whitespace'
      Hint = 'Remove all whitespace from selected text'
      ImageIndex = 26
      ShortCut = 16471
      OnExecute = ActionEditDeleteWhitespaceExecute
    end
    object ActionEditIndent: TAction
      Category = 'Edit'
      Caption = 'Indent'
      ImageIndex = 27
      OnExecute = ActionDummyExecute
    end
    object ActionEditIndentIncrease: TAction
      Category = 'Edit'
      Caption = 'Increase'
      Hint = 'Increase indent'
      ImageIndex = 28
      ShortCut = 24649
      OnExecute = ActionEditIndentIncreaseExecute
    end
    object ActionEditIndentDecrease: TAction
      Category = 'Edit'
      Caption = 'Decrease'
      Hint = 'Decrease indent'
      ImageIndex = 29
      ShortCut = 24661
      OnExecute = ActionEditIndentDecreaseExecute
    end
    object ActionEditSort: TAction
      Category = 'Edit'
      Caption = 'Sort'
      ImageIndex = 30
      OnExecute = ActionDummyExecute
    end
    object ActionEditSortAsc: TAction
      Category = 'Edit'
      Caption = 'Ascending'
      Hint = 'Sort ascending'
      ImageIndex = 31
      ShortCut = 24641
      OnExecute = ActionEditSortAscExecute
    end
    object ActionEditSortDesc: TAction
      Category = 'Edit'
      Caption = 'Descending'
      Hint = 'Sort descending'
      ImageIndex = 32
      ShortCut = 24644
      OnExecute = ActionEditSortDescExecute
    end
    object ActionEditToggleCase: TAction
      Category = 'Edit'
      Caption = 'Toggle case'
      Hint = 'Toggle case'
      ImageIndex = 33
      ShortCut = 24643
      OnExecute = ActionEditToggleCaseExecute
    end
    object ActionSearch: TAction
      Category = 'Search'
      Caption = 'Search'
      OnExecute = ActionDummyExecute
    end
    object ActionSearchSearch: TAction
      Category = 'Search'
      Caption = 'Search'
      Hint = 'Search the specified text'
      ImageIndex = 34
      ShortCut = 16454
      OnExecute = ActionSearchSearchExecute
    end
    object ActionSearchReplace: TAction
      Category = 'Search'
      Caption = 'Replace'
      Hint = 'Replace the specified text with different text'
      ImageIndex = 35
      ShortCut = 16466
      OnExecute = ActionSearchReplaceExecute
    end
    object ActionSearchFindInFiles: TAction
      Category = 'Search'
      Caption = 'Find in files'
      Hint = 'Search for a string in multiple files'
      ImageIndex = 36
      ShortCut = 24646
      OnExecute = ActionSearchFindInFilesExecute
    end
    object ActionSearchFindNext: TAction
      Category = 'Search'
      Caption = 'Find next'
      Hint = 'Find the next matching text'
      ImageIndex = 37
      ShortCut = 114
      OnExecute = ActionSearchFindNextExecute
    end
    object ActionSearchFindPrevious: TAction
      Category = 'Search'
      Caption = 'Find previous'
      Hint = 'Find the previous matching text'
      ImageIndex = 38
      ShortCut = 8306
      OnExecute = ActionSearchFindPreviousExecute
    end
    object ActionSearchToggleBookmark: TAction
      Category = 'Search'
      Caption = 'Toggle bookmark'
      Hint = 
        'Set or clear bookmark at current line. Bookmarks can be also set' +
        ' by using Ctrl+Shift+1..9. Go to bookmark by using Ctrl+1..9.'
      ImageIndex = 39
      ShortCut = 16497
      OnExecute = ActionSearchToggleBookmarkExecute
    end
    object ActionSearchToggleBookmarks: TAction
      Category = 'Search'
      Caption = 'Toggle bookmarks'
      Hint = 'Toggle bookmarks'
      ImageIndex = 40
      OnExecute = ActionDummyExecute
    end
    object ActionSearchGoToBookmarks: TAction
      Category = 'Search'
      Caption = 'Go to bookmarks'
      Hint = 'Go to bookmarks'
      ImageIndex = 41
      OnExecute = ActionDummyExecute
    end
    object ActionSearchClearBookmarks: TAction
      Category = 'Search'
      Caption = 'Clear bookmarks'
      Hint = 'Clear all bookmarks'
      ImageIndex = 42
      OnExecute = ActionSearchClearBookmarksExecute
    end
    object ActionSearchGoToLine: TAction
      Category = 'Search'
      Caption = 'Go to line'
      Hint = 'Go to line'
      ImageIndex = 43
      ShortCut = 16455
      OnExecute = ActionSearchGoToLineExecute
    end
    object ActionGotoBookmarks1: TAction
      Tag = 1
      Category = 'GotoBookmarks'
      Caption = 'Bookmark 1'
      ImageIndex = 44
      ShortCut = 16433
      OnExecute = ActionGotoBookmarksExecute
    end
    object ActionGotoBookmarks2: TAction
      Tag = 2
      Category = 'GotoBookmarks'
      Caption = 'Bookmark 2'
      ImageIndex = 45
      ShortCut = 16434
      OnExecute = ActionGotoBookmarksExecute
    end
    object ActionGotoBookmarks3: TAction
      Tag = 3
      Category = 'GotoBookmarks'
      Caption = 'Bookmark 3'
      ImageIndex = 46
      ShortCut = 16435
      OnExecute = ActionGotoBookmarksExecute
    end
    object ActionGotoBookmarks4: TAction
      Tag = 4
      Category = 'GotoBookmarks'
      Caption = 'Bookmark 4'
      ImageIndex = 47
      ShortCut = 16436
      OnExecute = ActionGotoBookmarksExecute
    end
    object ActionGotoBookmarks5: TAction
      Tag = 5
      Category = 'GotoBookmarks'
      Caption = 'Bookmark 5'
      ImageIndex = 48
      ShortCut = 16437
      OnExecute = ActionGotoBookmarksExecute
    end
    object ActionGotoBookmarks6: TAction
      Tag = 6
      Category = 'GotoBookmarks'
      Caption = 'Bookmark 6'
      ImageIndex = 49
      ShortCut = 16438
      OnExecute = ActionGotoBookmarksExecute
    end
    object ActionGotoBookmarks7: TAction
      Tag = 7
      Category = 'GotoBookmarks'
      Caption = 'Bookmark 7'
      ImageIndex = 50
      ShortCut = 16439
      OnExecute = ActionGotoBookmarksExecute
    end
    object ActionGotoBookmarks8: TAction
      Tag = 8
      Category = 'GotoBookmarks'
      Caption = 'Bookmark 8'
      ImageIndex = 51
      ShortCut = 16440
      OnExecute = ActionGotoBookmarksExecute
    end
    object ActionGotoBookmarks9: TAction
      Tag = 9
      Category = 'GotoBookmarks'
      Caption = 'Bookmark 9'
      ImageIndex = 52
      ShortCut = 16441
      OnExecute = ActionGotoBookmarksExecute
    end
    object ActionView: TAction
      Category = 'View'
      Caption = 'View'
      OnExecute = ActionDummyExecute
    end
    object ActionViewOpenDirectory: TAction
      Category = 'View'
      Caption = 'Open directory'
      Hint = 'Open a new directory'
      ImageIndex = 53
      ShortCut = 16452
      OnExecute = ActionViewOpenDirectoryExecute
    end
    object ActionViewCloseDirectory: TAction
      Category = 'View'
      Caption = 'Close directory'
      Hint = 'Close the active directory'
      ImageIndex = 54
      ShortCut = 24644
      OnExecute = ActionViewCloseDirectoryExecute
    end
    object ActionViewEditDirectory: TAction
      Category = 'View'
      Caption = 'Edit directory'
      Hint = 'Edit the active directory'
      ImageIndex = 55
      ShortCut = 24645
      OnExecute = ActionViewEditDirectoryExecute
    end
    object ActionViewFiles: TAction
      Category = 'View'
      Caption = 'Files'
      Hint = 'Search files from the selected directory and its subdirectories'
      ImageIndex = 56
      ShortCut = 16507
      OnExecute = ActionViewFilesExecute
    end
    object ActionViewWordWrap: TAction
      Category = 'View'
      AutoCheck = True
      Caption = 'Word wrap'
      GroupIndex = 1
      Hint = 'Toggle word wrap'
      ImageIndex = 57
      OnExecute = ActionViewWordWrapExecute
    end
    object ActionViewLineNumbers: TAction
      Category = 'View'
      AutoCheck = True
      Caption = 'Line numbers'
      GroupIndex = 2
      Hint = 'Toggle line numbers'
      ImageIndex = 58
      OnExecute = ActionViewLineNumbersExecute
    end
    object ActionViewSpecialChars: TAction
      Category = 'View'
      AutoCheck = True
      Caption = 'Special chars'
      GroupIndex = 3
      Hint = 'Toggle special characters'
      ImageIndex = 59
      OnExecute = ActionViewSpecialCharsExecute
    end
    object ActionViewSelectionMode: TAction
      Category = 'View'
      AutoCheck = True
      Caption = 'Selection mode'
      GroupIndex = 4
      Hint = 
        'Toggle selection mode. Also pressing Alt on editor will toggle s' +
        'election mode.'
      ImageIndex = 60
      OnExecute = ActionViewSelectionModeExecute
    end
    object ActionViewMinimap: TAction
      Category = 'View'
      AutoCheck = True
      Caption = 'Minimap'
      GroupIndex = 5
      Hint = 'Show or hide the minimap'
      ImageIndex = 94
      OnExecute = ActionViewMinimapExecute
    end
    object ActionViewSplit: TAction
      Category = 'View'
      AutoCheck = True
      Caption = 'Split'
      GroupIndex = 6
      Hint = 'Split the document'
      ImageIndex = 95
      OnExecute = ActionViewSplitExecute
    end
    object ActionViewXMLTree: TAction
      Category = 'View'
      AutoCheck = True
      Caption = 'XML tree'
      GroupIndex = 7
      Hint = 'Show or hide the XML tree'
      ImageIndex = 85
      OnExecute = ActionViewXMLTreeExecute
    end
    object ActionViewPreviousPage: TAction
      Category = 'View'
      Caption = 'Previous page'
      Hint = 'Go to previous page'
      ImageIndex = 61
      ShortCut = 24585
      OnExecute = ActionViewPreviousPageExecute
    end
    object ActionViewNextPage: TAction
      Category = 'View'
      Caption = 'Next page'
      Hint = 'Go to next page'
      ImageIndex = 62
      ShortCut = 16393
      OnExecute = ActionViewNextPageExecute
    end
    object ActionDocument: TAction
      Category = 'Document'
      Caption = 'Document'
      OnExecute = ActionDummyExecute
    end
    object ActionDocumentInfo: TAction
      Category = 'Document'
      Caption = 'Info'
      Hint = 'Line, word, and character count'
      ImageIndex = 63
      OnExecute = ActionDocumentInfoExecute
    end
    object ActionDocumentViewInBrowser: TAction
      Category = 'Document'
      Caption = 'View in browser'
      Hint = 'View current document in default browser'
      ImageIndex = 64
      ShortCut = 32834
      OnExecute = ActionDocumentViewInBrowserExecute
    end
    object ActionMenuFile: TAction
      Category = 'Menu'
      Caption = 'File'
      ShortCut = 32838
      OnExecute = ActionMenuFileExecute
    end
    object ActionMenuEdit: TAction
      Category = 'Menu'
      Caption = 'Edit'
      ShortCut = 32837
      OnExecute = ActionMenuEditExecute
    end
    object ActionMenuSearch: TAction
      Category = 'Menu'
      Caption = 'Search'
      ShortCut = 32851
      OnExecute = ActionMenuSearchExecute
    end
    object ActionMenuView: TAction
      Category = 'Menu'
      Caption = 'View'
      ShortCut = 32854
      OnExecute = ActionMenuViewExecute
    end
    object ActionMenuDocument: TAction
      Category = 'Menu'
      Caption = 'Document'
      ShortCut = 32836
      OnExecute = ActionMenuDocumentExecute
    end
    object ActionMenuTools: TAction
      Category = 'Menu'
      Caption = 'Tools'
      ShortCut = 32852
      OnExecute = ActionMenuToolsExecute
    end
    object ActionMenuHelp: TAction
      Category = 'Menu'
      Caption = 'Help'
      ShortCut = 32840
      OnExecute = ActionMenuHelpExecute
    end
    object ActionTools: TAction
      Category = 'Tools'
      Caption = 'Tools'
      OnExecute = ActionDummyExecute
    end
    object ActionToolsOptions: TAction
      Category = 'Tools'
      Caption = 'Options'
      Hint = 'Set options'
      ImageIndex = 68
      OnExecute = ActionToolsOptionsExecute
    end
    object ActionToolsCompareFiles: TAction
      Category = 'Tools'
      Caption = 'Compare files'
      Enabled = False
      Hint = 'Compare files'
      ImageIndex = 69
      OnExecute = ActionToolsCompareFilesExecute
    end
    object ActionToolsConvert: TAction
      Category = 'Tools'
      Caption = 'Convert'
      Hint = 'Convert between numerical units'
      ImageIndex = 70
      OnExecute = ActionToolsConvertExecute
    end
    object ActionToolsCharacterMap: TAction
      Category = 'Tools'
      Caption = 'Character map'
      Hint = 'Insert unicode characters to active document by double-clicking'
      ImageIndex = 71
      OnExecute = ActionToolsCharacterMapExecute
    end
    object ActionHelp: TAction
      Category = 'Help'
      Caption = 'Help'
      OnExecute = ActionDummyExecute
    end
    object ActionHelpCheckForUpdates: TAction
      Category = 'Help'
      Caption = 'Check for updates'
      Hint = 'Check for updates'
      ImageIndex = 72
      OnExecute = ActionHelpCheckForUpdatesExecute
    end
    object ActionHelpVisitHomepage: TAction
      Category = 'Help'
      Caption = 'Visit homepage'
      Hint = 'Visit EditBone homepage - http://www.bonecode.com/'
      ImageIndex = 73
      OnExecute = ActionHelpVisitHomepageExecute
    end
    object ActionHelpAboutEditBone: TAction
      Category = 'Help'
      Caption = 'About EditBone'
      Hint = 'Display information about EditBone'
      ImageIndex = 74
      OnExecute = ActionHelpAboutEditBoneExecute
    end
    object ActionToggleBookmarks1: TAction
      Category = 'ToggleBookmarks'
      Caption = 'Bookmark 1'
      ImageIndex = 44
      ShortCut = 24625
      OnExecute = ActionToggleBookmarksExecute
    end
    object ActionToggleBookmarks2: TAction
      Tag = 1
      Category = 'ToggleBookmarks'
      Caption = 'Bookmark 2'
      ImageIndex = 45
      ShortCut = 24626
      OnExecute = ActionToggleBookmarksExecute
    end
    object ActionToggleBookmarks3: TAction
      Tag = 2
      Category = 'ToggleBookmarks'
      Caption = 'Bookmark 3'
      ImageIndex = 46
      ShortCut = 24627
      OnExecute = ActionToggleBookmarksExecute
    end
    object ActionToggleBookmarks4: TAction
      Tag = 3
      Category = 'ToggleBookmarks'
      Caption = 'Bookmark 4'
      ImageIndex = 47
      ShortCut = 24628
      OnExecute = ActionToggleBookmarksExecute
    end
    object ActionToggleBookmarks5: TAction
      Tag = 4
      Category = 'ToggleBookmarks'
      Caption = 'Bookmark 5'
      ImageIndex = 48
      ShortCut = 24629
      OnExecute = ActionToggleBookmarksExecute
    end
    object ActionToggleBookmarks6: TAction
      Tag = 5
      Category = 'ToggleBookmarks'
      Caption = 'Bookmark 6'
      ImageIndex = 49
      ShortCut = 24630
      OnExecute = ActionToggleBookmarksExecute
    end
    object ActionToggleBookmarks7: TAction
      Tag = 6
      Category = 'ToggleBookmarks'
      Caption = 'Bookmark 7'
      ImageIndex = 50
      ShortCut = 24631
      OnExecute = ActionToggleBookmarksExecute
    end
    object ActionToggleBookmarks8: TAction
      Tag = 7
      Category = 'ToggleBookmarks'
      Caption = 'Bookmark 8'
      ImageIndex = 51
      ShortCut = 24632
      OnExecute = ActionToggleBookmarksExecute
    end
    object ActionToggleBookmarks9: TAction
      Tag = 8
      Category = 'ToggleBookmarks'
      Caption = 'Bookmark 9'
      ImageIndex = 52
      ShortCut = 24633
      OnExecute = ActionToggleBookmarksExecute
    end
    object ActionToolBarMenuLanguage: TAction
      Category = 'ToolBarMenu'
      Caption = 'Language'
      ImageIndex = 75
      OnExecute = ActionDummyExecute
    end
    object ActionToolBarMenuSkin: TAction
      Category = 'ToolBarMenu'
      Caption = 'Skin...'
      ImageIndex = 76
      OnExecute = ActionToolBarMenuSkinExecute
    end
    object ActionToolBarMenuView: TAction
      Category = 'ToolBarMenu'
      Caption = 'View'
      ImageIndex = 77
      OnExecute = ActionDummyExecute
    end
    object ActionSelectReopenFile: TAction
      Category = 'File'
      OnExecute = ActionSelectReopenFileExecute
    end
    object ActionFileReopenClear: TAction
      Category = 'File'
      Caption = 'Clear'
      ImageIndex = 22
      OnExecute = ActionFileReopenClearExecute
    end
    object ActionViewEncodingSelection: TAction
      Category = 'View'
      Caption = 'Encoding'
      Hint = 'Show or hide the encoding selection'
      OnExecute = ActionViewEncodingSelectionExecute
    end
    object ActionViewHighlighterSelection: TAction
      Category = 'View'
      Caption = 'Highlighter'
      Hint = 'Show or hide the highlighter selection'
      OnExecute = ActionViewHighlighterSelectionExecute
    end
    object ActionViewColorSelection: TAction
      Category = 'View'
      Caption = 'Color'
      Hint = 'Show or hide the highlighter color selection'
      OnExecute = ActionViewColorSelectionExecute
    end
    object ActionViewToolbar: TAction
      Category = 'View'
      Caption = 'Toolbar'
      Hint = 'Show or hide the toolbar'
      OnExecute = ActionViewToolbarExecute
    end
    object ActionViewMenuBar: TAction
      Category = 'View'
      Caption = 'Menu bar'
      Hint = 'Show or hide the menu bar'
      OnExecute = ActionViewMenuBarExecute
    end
    object ActionViewStatusBar: TAction
      Category = 'View'
      Caption = 'Status bar'
      Hint = 'Show or hide the status bar'
      OnExecute = ActionViewStatusBarExecute
    end
    object ActionViewOutput: TAction
      Category = 'View'
      Caption = 'Output'
      Hint = 'Show or hide the output'
      OnExecute = ActionViewOutputExecute
    end
    object ActionViewDirectory: TAction
      Category = 'View'
      Caption = 'Directory'
      Hint = 'Show or hide the directory'
      OnExecute = ActionViewDirectoryExecute
    end
    object ActionFileProperties: TAction
      Category = 'File'
      Caption = 'Properties...'
      Hint = 'See the file properties'
      ImageIndex = 99
      OnExecute = ActionFilePropertiesExecute
    end
    object ActionFileSelectFromDirectory: TAction
      Category = 'File'
      Caption = 'Select from directory'
      Hint = 'Select the file from the active directory'
      ImageIndex = 116
      OnExecute = ActionFileSelectFromDirectoryExecute
    end
    object ActionToolsSelectForCompare: TAction
      Category = 'Tools'
      Caption = 'Select for compare...'
      Hint = 'Select document for compare'
      ImageIndex = 69
      OnExecute = ActionToolsSelectForCompareExecute
    end
    object ActionDocumentFormat: TAction
      Category = 'Document'
      Caption = 'Format'
      ImageIndex = 65
      OnExecute = ActionDummyExecute
    end
    object ActionDocumentFormatSQL: TAction
      Category = 'Document'
      Caption = 'SQL'
      Hint = 'Format SQL'
      ImageIndex = 66
      OnExecute = ActionDocumentFormatSQLExecute
    end
    object ActionDocumentFormatXML: TAction
      Category = 'Document'
      Caption = 'XML'
      Hint = 'Format XML'
      ImageIndex = 67
      OnExecute = ActionDocumentFormatXMLExecute
    end
    object ActionMacro: TAction
      Category = 'Macro'
      Caption = 'Macro'
      ImageIndex = 136
      OnExecute = ActionDummyExecute
    end
    object ActionMacroPlayback: TAction
      Category = 'Macro'
      Caption = 'Playback'
      Hint = 'Playback the macro'
      ImageIndex = 87
      ShortCut = 24656
      OnExecute = ActionMacroPlaybackExecute
    end
    object ActionMacroRecord: TAction
      Category = 'Macro'
      Caption = 'Record'
      Hint = 'Record a macro'
      ImageIndex = 88
      ShortCut = 24658
      OnExecute = ActionMacroRecordExecute
    end
    object ActionMacroPause: TAction
      Category = 'Macro'
      Caption = 'Pause'
      Hint = 'Pause a macro'
      ImageIndex = 89
      OnExecute = ActionMacroPauseExecute
    end
    object ActionMacroStop: TAction
      Category = 'Macro'
      Caption = 'Stop'
      Hint = 'Stop the macro recording'
      ImageIndex = 90
      ShortCut = 24659
      OnExecute = ActionMacroStopExecute
    end
    object ActionMacroOpen: TAction
      Category = 'Macro'
      Caption = 'Open...'
      Hint = 'Open an existing macro'
      ImageIndex = 91
      OnExecute = ActionMacroOpenExecute
    end
    object ActionMacroSaveAs: TAction
      Category = 'Macro'
      Caption = 'Save as...'
      Hint = 'Save the macro with a new name'
      ImageIndex = 92
      OnExecute = ActionMacroSaveAsExecute
    end
    object ActionDirectorySearchFindInFiles: TAction
      Category = 'Search'
      Caption = '<directory find in files action>'
      OnExecute = ActionDirectorySearchFindInFilesExecute
    end
    object ActionToolsLanguageEditor: TAction
      Category = 'Tools'
      Caption = 'Language editor'
      Hint = 'Language editor'
      ImageIndex = 75
      OnExecute = ActionToolsLanguageEditorExecute
    end
    object ActionEdit: TAction
      Category = 'Edit'
      Caption = 'Edit'
      OnExecute = ActionDummyExecute
    end
    object ActionViewMainMenu: TAction
      Category = 'View'
      Caption = 'Main menu'
      Hint = 'Show or hide the main menu'
      OnExecute = ActionViewMainMenuExecute
    end
    object ActionSelectEncoding: TAction
      OnExecute = ActionSelectEncodingExecute
    end
    object ActionSelectHighlighter: TAction
      Caption = 'ActionSelectHighlighter'
      OnExecute = ActionSelectHighlighterExecute
    end
    object ActionSelectHighlighterColor: TAction
      Caption = 'ActionSelectHighlighterColor'
      OnExecute = ActionSelectHighlighterColorExecute
    end
    object ActionEncodingASCII: TAction
      Caption = 'ASCII'
      OnExecute = ActionSelectEncodingExecute
    end
    object ActionEncodingANSI: TAction
      Caption = 'ANSI'
      OnExecute = ActionSelectEncodingExecute
    end
    object ActionEncodingBigEndianUnicode: TAction
      Caption = 'Big Endian Unicode'
      OnExecute = ActionSelectEncodingExecute
    end
    object ActionEncodingUnicode: TAction
      Caption = 'Unicode'
      OnExecute = ActionSelectEncodingExecute
    end
    object ActionEncodingUTF7: TAction
      Caption = 'UTF-7'
      OnExecute = ActionSelectEncodingExecute
    end
    object ActionEncodingUTF8: TAction
      Caption = 'UTF-8'
      OnExecute = ActionSelectEncodingExecute
    end
    object ActionEncodingUTF8WithoutBOM: TAction
      Caption = 'UTF-8 without BOM'
      OnExecute = ActionSelectEncodingExecute
    end
    object ActionEditToggleCaseUpper: TAction
      Category = 'Edit'
      Caption = 'Upper'
      ImageIndex = 33
      OnExecute = ActionEditToggleCaseUpperExecute
    end
    object ActionEditToggleCaseLower: TAction
      Category = 'Edit'
      Caption = 'Lower'
      ImageIndex = 33
      OnExecute = ActionEditToggleCaseLowerExecute
    end
    object ActionEditToggleCaseAlternating: TAction
      Category = 'Edit'
      Caption = 'Alternating'
      ImageIndex = 33
      OnExecute = ActionEditToggleCaseAlternatingExecute
    end
    object ActionEditToggleCaseSentence: TAction
      Category = 'Edit'
      Caption = 'Sentence'
      ImageIndex = 33
      OnExecute = ActionEditToggleCaseSentenceExecute
    end
    object ActionEditToggleCaseTitle: TAction
      Category = 'Edit'
      Caption = 'Title'
      ImageIndex = 33
      OnExecute = ActionEditToggleCaseTitleExecute
    end
  end
  inherited MainMenu: TMainMenu
    Images = ImagesDataModule.ImageListSmall
    Left = 117
    Top = 366
    object MenuItemMainMenuFile: TMenuItem
      Action = ActionFile
      object MenuItemMainMenuFileNew: TMenuItem
        Action = ActionFileNew
      end
      object MenuItemMainMenuFileOpen: TMenuItem
        Action = ActionFileOpen
      end
      object MenuItemMainMenuFileReopen: TMenuItem
        Action = ActionFileReopen
      end
      object MenuItemMainMenuFileDivider1: TMenuItem
        Caption = '-'
      end
      object MenuItemMainMenuFileSave: TMenuItem
        Action = ActionFileSave
      end
      object MenuItemMainMenuFileSaveAs: TMenuItem
        Action = ActionFileSaveAs
      end
      object MenuItemMainMenuFileSaveAll: TMenuItem
        Action = ActionFileSaveAll
      end
      object MenuItemMainMenuFileClose: TMenuItem
        Action = ActionFileClose
      end
      object MenuItemMainMenuFileCloseAll: TMenuItem
        Action = ActionFileCloseAll
      end
      object MenuItemMainMenuFileCloseAllOther: TMenuItem
        Action = ActionFileCloseAllOther
      end
      object MenuItemMainMenuFileDivider2: TMenuItem
        Caption = '-'
      end
      object MenuItemMainMenuFilePrint: TMenuItem
        Action = ActionFilePrint
      end
      object MenuItemMainMenuFilePrintPreview: TMenuItem
        Action = ActionFilePrintPreview
      end
      object MenuItemMainMenuFileDivider3: TMenuItem
        Caption = '-'
      end
      object MenuItemMainMenuFileExit: TMenuItem
        Action = ActionFileExit
      end
    end
    object MenuItemMainMenuEdit: TMenuItem
      Action = ActionEdit
      object MenuItemMainMenuEditUndo: TMenuItem
        Action = ActionEditUndo
      end
      object MenuItemMainMenuEditRedo: TMenuItem
        Action = ActionEditRedo
      end
      object MenuItemMainMenuEditDivider1: TMenuItem
        Caption = '-'
      end
      object MenuItemMainMenuEditCut: TMenuItem
        Action = ActionEditCut
      end
      object MenuItemMainMenuEditCopy: TMenuItem
        Action = ActionEditCopy
      end
      object MenuItemMainMenuEditPaste: TMenuItem
        Action = ActionEditPaste
      end
      object MenuItemMainMenuEditSelectAll: TMenuItem
        Action = ActionEditSelectAll
      end
      object MenuItemMainMenuEditDivider2: TMenuItem
        Caption = '-'
      end
      object MenuItemMainMenuEditInsert: TMenuItem
        Action = ActionEditInsert
        object MenuItemMainMenuEditInsertLine: TMenuItem
          Action = ActionEditInsertLine
        end
        object MenuItemMainMenuEditInsertHTMLXMLTags: TMenuItem
          Action = ActionEditInsertTag
        end
        object MenuItemMainMenuEditInsertDateAndTime: TMenuItem
          Action = ActionEditInsertDateTime
        end
      end
      object MenuItemMainMenuEditDelete: TMenuItem
        Action = ActionEditDelete
        object MenuItemMainMenuEditDeleteLine: TMenuItem
          Action = ActionEditDeleteLine
        end
        object MenuItemMainMenuEditDeleteEndOfLine: TMenuItem
          Action = ActionEditDeleteEndOfLine
        end
        object MenuItemMainMenuEditDeleteWord: TMenuItem
          Action = ActionEditDeleteWord
        end
        object MenuItemMainMenuEditDeleteWhitespace: TMenuItem
          Action = ActionEditDeleteWhitespace
        end
      end
      object MenuItemMainMenuEditDivider3: TMenuItem
        Caption = '-'
      end
      object MenuItemMainMenuEditIndent: TMenuItem
        Action = ActionEditIndent
        object MenuItemMainMenuEditIndentIncrease: TMenuItem
          Action = ActionEditIndentIncrease
        end
        object MenuItemMainMenuEditIndentDecrease: TMenuItem
          Action = ActionEditIndentDecrease
        end
      end
      object MenuItemMainMenuEditSort: TMenuItem
        Action = ActionEditSort
        object MenuItemMainMenuEditSortAscending: TMenuItem
          Action = ActionEditSortAsc
        end
        object MenuItemMainMenuEditSortDescending: TMenuItem
          Action = ActionEditSortDesc
        end
      end
      object MenuItemMainMenuEditDivider4: TMenuItem
        Caption = '-'
      end
      object MenuItemMainMenuEditToggleCase: TMenuItem
        Action = ActionEditToggleCase
      end
    end
    object MenuItemMainMenuSearch: TMenuItem
      Action = ActionSearch
      object MenuItemMainMenuSearchSearch: TMenuItem
        Action = ActionSearchSearch
      end
      object MenuItemMainMenuSearchReplace: TMenuItem
        Action = ActionSearchReplace
      end
      object MenuItemMainMenuSearchFindInFiles: TMenuItem
        Action = ActionSearchFindInFiles
      end
      object MenuItemMainMenuSearchDivider1: TMenuItem
        Caption = '-'
      end
      object MenuItemMainMenuSearchToggleBookmark: TMenuItem
        Action = ActionSearchToggleBookmark
      end
      object MenuItemMainMenuSearchToggleBookmarks: TMenuItem
        Action = ActionSearchToggleBookmarks
        object MenuItemMainMenuSearchToggleBookmarksBookmark11: TMenuItem
          Action = ActionToggleBookmarks1
        end
        object MenuItemMainMenuSearchToggleBookmarksBookmark2: TMenuItem
          Action = ActionToggleBookmarks2
        end
        object MenuItemMainMenuSearchToggleBookmarksBookmark3: TMenuItem
          Action = ActionToggleBookmarks3
        end
        object MenuItemMainMenuSearchToggleBookmarksBookmark4: TMenuItem
          Action = ActionToggleBookmarks4
        end
        object MenuItemMainMenuSearchToggleBookmarksBookmark5: TMenuItem
          Action = ActionToggleBookmarks5
        end
        object MenuItemMainMenuSearchToggleBookmarksBookmark6: TMenuItem
          Action = ActionToggleBookmarks6
        end
        object MenuItemMainMenuSearchToggleBookmarksBookmark7: TMenuItem
          Action = ActionToggleBookmarks7
        end
        object MenuItemMainMenuSearchToggleBookmarksBookmark8: TMenuItem
          Action = ActionToggleBookmarks8
        end
        object MenuItemMainMenuSearchToggleBookmarksBookmark9: TMenuItem
          Action = ActionToggleBookmarks9
        end
      end
      object MenuItemMainMenuSearchGoToBookmarks: TMenuItem
        Action = ActionSearchGoToBookmarks
        object MenuItemMainMenuSearchGoToBookmarksBookmark1: TMenuItem
          Action = ActionGotoBookmarks1
        end
        object MenuItemMainMenuSearchGoToBookmarksBookmark2: TMenuItem
          Action = ActionGotoBookmarks2
        end
        object MenuItemMainMenuSearchGoToBookmarksBookmark3: TMenuItem
          Action = ActionGotoBookmarks3
        end
        object MenuItemMainMenuSearchGoToBookmarksBookmark4: TMenuItem
          Action = ActionGotoBookmarks4
        end
        object MenuItemMainMenuSearchGoToBookmarksBookmark5: TMenuItem
          Action = ActionGotoBookmarks5
        end
        object MenuItemMainMenuSearchGoToBookmarksBookmark6: TMenuItem
          Action = ActionGotoBookmarks6
        end
        object MenuItemMainMenuSearchGoToBookmarksBookmark7: TMenuItem
          Action = ActionGotoBookmarks7
        end
        object MenuItemMainMenuSearchGoToBookmarksBookmark8: TMenuItem
          Action = ActionGotoBookmarks8
        end
        object MenuItemMainMenuSearchGoToBookmarksBookmark9: TMenuItem
          Action = ActionGotoBookmarks9
        end
      end
      object MenuItemMainMenuSearchClearBookmarks: TMenuItem
        Action = ActionSearchClearBookmarks
      end
      object MenuItemMainMenuSearchDivider2: TMenuItem
        Caption = '-'
      end
      object MenuItemMainMenuSearchGoToLine: TMenuItem
        Action = ActionSearchGoToLine
      end
    end
    object MenuItemMainMenuView: TMenuItem
      Action = ActionView
      object MenuItemMainMenuViewOpenDirectory: TMenuItem
        Action = ActionViewOpenDirectory
      end
      object MenuItemMainMenuViewCloseDirectory: TMenuItem
        Action = ActionViewCloseDirectory
      end
      object MenuItemMainMenuViewEditDirectory: TMenuItem
        Action = ActionViewEditDirectory
      end
      object MenuItemMainMenuViewDivider1: TMenuItem
        Caption = '-'
      end
      object MenuItemMainMenuViewFiles: TMenuItem
        Action = ActionViewFiles
      end
      object MenuItemMainMenuViewDivider2: TMenuItem
        Caption = '-'
      end
      object MenuItemMainMenuViewWordWrap: TMenuItem
        Action = ActionViewWordWrap
        AutoCheck = True
      end
      object MenuItemMainMenuViewLineNumbers: TMenuItem
        Action = ActionViewLineNumbers
        AutoCheck = True
      end
      object MenuItemMainMenuViewSpecialChars: TMenuItem
        Action = ActionViewSpecialChars
        AutoCheck = True
      end
      object MenuItemMainMenuViewSelectionMode: TMenuItem
        Action = ActionViewSelectionMode
        AutoCheck = True
      end
      object MenuItemMainMenuViewMinimap: TMenuItem
        Action = ActionViewMinimap
        AutoCheck = True
      end
      object MenuItemMainMenuViewSplit: TMenuItem
        Action = ActionViewSplit
        AutoCheck = True
      end
      object MenuItemMainMenuViewXMLTree: TMenuItem
        Action = ActionViewXMLTree
        AutoCheck = True
      end
      object MenuItemMainMenuViewDivider3: TMenuItem
        Caption = '-'
      end
      object MenuItemMainMenuViewPreviousPage: TMenuItem
        Action = ActionViewPreviousPage
      end
      object MenuItemMainMenuViewNextPage: TMenuItem
        Action = ActionViewNextPage
      end
    end
    object MenuItemMainMenuDocument: TMenuItem
      Action = ActionDocument
      object MenuItemMainMenuDocumentInfo: TMenuItem
        Action = ActionDocumentInfo
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object MenuItemMainMenuDocumentFormat: TMenuItem
        Action = ActionDocumentFormat
        object MenuItemMainMenuDocumentFormatSQL: TMenuItem
          Action = ActionDocumentFormatSQL
        end
        object MenuItemMainMenuDocumentFormatXML: TMenuItem
          Action = ActionDocumentFormatXML
        end
      end
      object Macro1: TMenuItem
        Action = ActionMacro
        object Playback1: TMenuItem
          Action = ActionMacroPlayback
        end
        object MenuItemMainMenuMacroRecordPause: TMenuItem
          Action = ActionMacroRecord
        end
        object Saveas1: TMenuItem
          Action = ActionMacroStop
        end
        object N5: TMenuItem
          Caption = '-'
        end
        object Open1: TMenuItem
          Action = ActionMacroOpen
        end
        object Saveas2: TMenuItem
          Action = ActionMacroSaveAs
        end
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object MenuItemMainMenuDocumentViewInBrowser: TMenuItem
        Action = ActionDocumentViewInBrowser
      end
    end
    object MenuItemMainMenuTools: TMenuItem
      Caption = 'Tools'
      object MenuItemMainMenuToolsOptions: TMenuItem
        Action = ActionToolsOptions
      end
      object MenuItemMainMenuToolsDivider1: TMenuItem
        Caption = '-'
      end
      object MenuItemMainMenuToolsCompareFiles: TMenuItem
        Action = ActionToolsCompareFiles
      end
      object MenuItemMainMenuToolsConvert: TMenuItem
        Action = ActionToolsConvert
      end
      object MenuItemMainMenuToolsCharacterMap: TMenuItem
        Action = ActionToolsCharacterMap
      end
      object MenuItemMainMenuToolsDivider2: TMenuItem
        Caption = '-'
      end
      object MenuItemMainMenuToolsLanguageEditor: TMenuItem
        Action = ActionToolsLanguageEditor
      end
    end
    object MenuItemMainMenuHelp: TMenuItem
      Action = ActionHelp
      object MenuItemMainMenuHelpCheckForUpdates: TMenuItem
        Action = ActionHelpCheckForUpdates
      end
      object MenuItemMainMenuHelpDivider1: TMenuItem
        Caption = '-'
      end
      object MenuItemMainMenuHelpVisitHomepage: TMenuItem
        Action = ActionHelpVisitHomepage
      end
      object MenuItemMainMenuHelpDivider2: TMenuItem
        Caption = '-'
      end
      object MenuItemMainMenuHelpAboutEditBone: TMenuItem
        Action = ActionHelpAboutEditBone
      end
    end
  end
  object PopupMenuDocument: TPopupMenu
    Images = ImagesDataModule.ImageListSmall
    Left = 616
    Top = 158
    object MenuItemFileClose: TMenuItem
      Action = ActionFileClose
    end
    object MenuItemFileCloseAll: TMenuItem
      Action = ActionFileCloseAll
    end
    object MenuItemPopupMenuDocumentDivider1: TMenuItem
      Caption = '-'
    end
    object MenuItemFileCloseAllOther: TMenuItem
      Action = ActionFileCloseAllOther
    end
    object MenuItemPopupMenuDocumentDivider2: TMenuItem
      Caption = '-'
    end
    object MenuItemFileSave: TMenuItem
      Action = ActionFileSave
    end
    object MenuItemFileSaveAs: TMenuItem
      Action = ActionFileSaveAs
    end
    object MenuItemPopupMenuDocumentDivider3: TMenuItem
      Caption = '-'
    end
    object MenuItemFilePrint: TMenuItem
      Action = ActionFilePrint
    end
    object MenuItemFilePrintPreview: TMenuItem
      Action = ActionFilePrintPreview
    end
    object MenuItemPopupMenuDocumentDivider4: TMenuItem
      Caption = '-'
    end
    object MenuItemToolsSelectForCompare: TMenuItem
      Action = ActionToolsSelectForCompare
    end
    object MenuItemFileSelectFromDirectory: TMenuItem
      Action = ActionFileSelectFromDirectory
    end
    object MenuItemPopupMenuDocumentDivider5: TMenuItem
      Caption = '-'
    end
    object MenuItemFileProperties: TMenuItem
      Action = ActionFileProperties
    end
  end
  object DragDrop: TBCDragDrop
    DropTarget = Owner
    OnDrop = DragDropDrop
    Left = 36
    Top = 372
  end
  object PopupMenuDocumentFormat: TPopupMenu
    Images = ImagesDataModule.ImageList
    Left = 272
    Top = 437
    object MenuItemDocumentFormatSQL: TMenuItem
      Action = ActionDocumentFormatSQL
    end
    object MenuItemDocumentFormatXML: TMenuItem
      Action = ActionDocumentFormatXML
    end
  end
  object PopupMenuEditor: TPopupMenu
    Images = ImagesDataModule.ImageListSmall
    Left = 616
    Top = 254
    object MenuItemCut: TMenuItem
      Action = ActionEditCut
    end
    object MenuItemCopy: TMenuItem
      Action = ActionEditCopy
    end
    object MenuItemPaste: TMenuItem
      Action = ActionEditPaste
    end
    object MenuItemSelectAll: TMenuItem
      Action = ActionEditSelectAll
    end
    object MenuItemSeparator1: TMenuItem
      Caption = '-'
    end
    object MenuItemUndo: TMenuItem
      Action = ActionEditUndo
    end
    object MenuItemRedo: TMenuItem
      Action = ActionEditRedo
    end
    object MenuItemSeparator2: TMenuItem
      Caption = '-'
    end
    object MenuItemToggleBookmark: TMenuItem
      Action = ActionSearchToggleBookmark
    end
    object MenuItemToggleBookmarks: TMenuItem
      Action = ActionSearchToggleBookmarks
      object MenuItemToggleBookmark1: TMenuItem
        Tag = 1
        Action = ActionToggleBookmarks1
      end
      object MenuItemToggleBookmark2: TMenuItem
        Tag = 2
        Action = ActionToggleBookmarks2
      end
      object MenuItemToggleBookmark3: TMenuItem
        Tag = 3
        Action = ActionToggleBookmarks3
      end
      object MenuItemToggleBookmark4: TMenuItem
        Tag = 4
        Action = ActionToggleBookmarks4
      end
      object MenuItemToggleBookmark5: TMenuItem
        Tag = 5
        Action = ActionToggleBookmarks5
      end
      object MenuItemToggleBookmark6: TMenuItem
        Tag = 6
        Action = ActionToggleBookmarks6
      end
      object MenuItemToggleBookmark7: TMenuItem
        Tag = 7
        Action = ActionToggleBookmarks7
      end
      object MenuItemToggleBookmark8: TMenuItem
        Tag = 8
        Action = ActionToggleBookmarks8
      end
      object MenuItemToggleBookmark9: TMenuItem
        Tag = 9
        Action = ActionToggleBookmarks9
      end
    end
    object MenuItemGotoBookmarks: TMenuItem
      Action = ActionSearchGoToBookmarks
      object MenuItemGotoBookmark1: TMenuItem
        Tag = 1
        Action = ActionGotoBookmarks1
      end
      object MenuItemGotoBookmark2: TMenuItem
        Tag = 2
        Action = ActionGotoBookmarks2
      end
      object MenuItemGotoBookmark3: TMenuItem
        Tag = 3
        Action = ActionGotoBookmarks3
      end
      object MenuItemGotoBookmark4: TMenuItem
        Tag = 4
        Action = ActionGotoBookmarks4
      end
      object MenuItemGotoBookmark5: TMenuItem
        Tag = 5
        Action = ActionGotoBookmarks5
      end
      object MenuItemGotoBookmark6: TMenuItem
        Tag = 6
        Action = ActionGotoBookmarks6
      end
      object MenuItemGotoBookmark7: TMenuItem
        Tag = 7
        Action = ActionGotoBookmarks7
      end
      object MenuItemGotoBookmark8: TMenuItem
        Tag = 8
        Action = ActionGotoBookmarks8
      end
      object MenuItemGotoBookmark9: TMenuItem
        Tag = 9
        Action = ActionGotoBookmarks9
      end
    end
    object MenuItemClearBookmarks: TMenuItem
      Action = ActionSearchClearBookmarks
    end
    object MenuItemSeparator3: TMenuItem
      Caption = '-'
    end
    object MenuItemInsert: TMenuItem
      Action = ActionEditInsert
      object MenuItemInsertLine: TMenuItem
        Action = ActionEditInsertLine
      end
      object MenuItemInsertTag: TMenuItem
        Action = ActionEditInsertTag
      end
      object MenuItemDateandTime: TMenuItem
        Action = ActionEditInsertDateTime
      end
    end
    object MenuItemDelete: TMenuItem
      Action = ActionEditDelete
      object MenuItemDeleteLine: TMenuItem
        Action = ActionEditDeleteLine
      end
      object MenuItemDeleteEndOfLine: TMenuItem
        Action = ActionEditDeleteEndOfLine
      end
      object MenuItemDeleteWord: TMenuItem
        Action = ActionEditDeleteWord
      end
      object MenuItemDeleteWhiteSpace: TMenuItem
        Action = ActionEditDeleteWhitespace
      end
    end
    object MenuItemSeparator4: TMenuItem
      Caption = '-'
    end
    object MenuItemIndent: TMenuItem
      Action = ActionEditIndent
      object MenuItemIncreaseIndent: TMenuItem
        Action = ActionEditIndentIncrease
      end
      object MenuItemDecreaseIndent: TMenuItem
        Action = ActionEditIndentDecrease
      end
    end
    object MenuItemSort: TMenuItem
      Action = ActionEditSort
      object MenuItemSortAscending: TMenuItem
        Action = ActionEditSortAsc
      end
      object MenuItemSortDescending: TMenuItem
        Action = ActionEditSortDesc
      end
    end
    object MenuItemSeparator5: TMenuItem
      Caption = '-'
    end
    object MenuItemFormat: TMenuItem
      Action = ActionDocumentFormat
      object MenuItemFormatSQL: TMenuItem
        Action = ActionDocumentFormatSQL
      end
      object MenuItemFormatXML: TMenuItem
        Action = ActionDocumentFormatXML
      end
    end
    object MenuItemSeparator6: TMenuItem
      Caption = '-'
    end
    object MenuItemToggleCase: TMenuItem
      Action = ActionEditToggleCase
    end
  end
  object PopupMenuToggleCase: TPopupMenu
    Images = ImagesDataModule.ImageList
    Left = 745
    Top = 156
    object Upper1: TMenuItem
      Action = ActionEditToggleCaseUpper
    end
    object Lower1: TMenuItem
      Action = ActionEditToggleCaseLower
    end
    object Alternating1: TMenuItem
      Action = ActionEditToggleCaseAlternating
    end
    object Sentence1: TMenuItem
      Action = ActionEditToggleCaseSentence
    end
    object itle1: TMenuItem
      Action = ActionEditToggleCaseTitle
    end
  end
  object AppInstances: TJvAppInstances
    OnCmdLineReceived = AppInstancesCmdLineReceived
    Left = 789
    Top = 246
  end
  object AlphaImageListStatusBar: TsAlphaImageList
    Items = <
      item
        ImageFormat = ifPNG
        ImageName = 'a'
        ImgData = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000000467414D410000B18F0BFC6105000000097048597300000EC100000E
          C101B8916BED0000001874455874536F667477617265007061696E742E6E6574
          20342E302E35658532650000011B49444154384F9D52CB6EC23010CC27B67C40
          7FA37FD04FE8B1071471097909A9270EED6FF450824A919A0807A570201CB63B
          1BDBDA405404238D761CEF8E27B2032212DE3F3E73E9F435F462F4F2C1E5BCE1
          12833B3ED90DA362FDF014CAFA5205BDD3CD099CC0C94E5F432F74AC7C36CBE2
          2CA3699250C4448DD35498E6F93460B85E2F34D1788AA228A4566529262CA5D7
          0FE904381158144BFA5C2C4587930935CDAF687B40DF40334A622E44ABEF357D
          ADD6A25FE7EF62822483063A411477066555D10F473E854DD837D07406665B93
          A96BDAD48636C68806ECBEF4FAA1A104BBDDFE8CC0A08126AE0E68DB231D0EAD
          27D680DD975E3FA413E00DFC07BBDF37D0BCC94027E087D2E0AA1015FFEBC96B
          7C1F87E15BD74BC11FAE132904381C83A50000000049454E44AE426082}
      end>
    Left = 455
    Top = 448
    Bitmap = {
      494C010100000800080001000100FFFFFFFF0400FFFFFFFFFFFFFFFF424D7600
      0000000000007600000028000000040000000100000001000400000000000400
      0000000000000000000000000000000000000000000000008000008000000080
      8000800000008000800080800000C0C0C000808080000000FF0000FF000000FF
      FF00FF000000FF00FF00FFFF0000FFFFFF0000000000}
  end
  object PopupMenuDocumentMacro: TPopupMenu
    Images = ImagesDataModule.ImageList
    Left = 270
    Top = 491
    object MenuItemMacroPlayback: TMenuItem
      Action = ActionMacroPlayback
    end
    object MenuItemMacroRecordPause: TMenuItem
      Action = ActionMacroRecord
    end
    object MenuItemMacroStop: TMenuItem
      Action = ActionMacroStop
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object MenuItemMacroOpen: TMenuItem
      Action = ActionMacroOpen
    end
    object MenuItemMacroSaveAs: TMenuItem
      Action = ActionMacroSaveAs
    end
  end
end
