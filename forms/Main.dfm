object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'EditBone'
  ClientHeight = 560
  ClientWidth = 1100
  Color = clBtnFace
  TransparentColorValue = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDefault
  ShowHint = True
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar: TStatusBar
    Left = 0
    Top = 541
    Width = 1100
    Height = 19
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    Panels = <
      item
        Alignment = taCenter
        Width = 86
      end
      item
        Width = 86
      end
      item
        Width = 86
      end
      item
        Width = 50
      end>
    UseSystemFont = False
  end
  object MainMenuPanel: TPanel
    Left = 0
    Top = 0
    Width = 1100
    Height = 24
    Align = alTop
    BevelOuter = bvNone
    Padding.Top = 2
    Padding.Right = 2
    ParentColor = True
    ParentShowHint = False
    ShowHint = False
    TabOrder = 3
    object ActionMainMenuBar: TActionMainMenuBar
      Left = 0
      Top = 0
      Width = 529
      Height = 30
      UseSystemFont = False
      ActionManager = ActionManager
      Align = alNone
      Color = clMenuBar
      ColorMap.DisabledFontColor = 7171437
      ColorMap.HighlightColor = clWhite
      ColorMap.BtnSelectedFont = clBlack
      ColorMap.UnusedColor = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentShowHint = False
      ShowHint = True
      Spacing = 1
    end
    object EncodingComboBox: TBCComboBox
      Left = 834
      Top = 2
      Width = 130
      Height = 21
      Align = alRight
      Style = csDropDownList
      DropDownCount = 57
      TabOrder = 1
      OnChange = EncodingComboBoxChange
      Items.Strings = (
        'ASCII'
        'ANSI'
        'Big Endian Unicode'
        'Unicode '
        'UTF-7'
        'UTF-8'
        'UTF-8 Without BOM')
      DeniedKeyStrokes = True
      ReadOnly = False
      DropDownFixedWidth = 0
    end
    object HighlighterPanel: TPanel
      Left = 964
      Top = 2
      Width = 134
      Height = 22
      Align = alRight
      AutoSize = True
      BevelOuter = bvNone
      Padding.Left = 4
      TabOrder = 2
      object HighlighterComboBox: TBCComboBox
        Left = 4
        Top = 0
        Width = 130
        Height = 21
        Align = alRight
        Style = csDropDownList
        DropDownCount = 57
        TabOrder = 0
        OnChange = HighlighterComboBoxChange
        Items.Strings = (
          '68HC11 Assembler'
          'AWK Scripts'
          'Baan 4GL'
          'C# (classic)'
          'C# (default)'
          'C# (twilight)'
          'C/C++ (classic)'
          'C/C++ (default)'
          'C/C++ (twilight)'
          'CA-Clipper'
          'Cache'
          'Cascading Stylesheets'
          'COBOL'
          'CORBA IDL'
          'CPM Reports'
          'DOT Graph Drawing'
          'DSP'
          'DWScript'
          'Eiffel'
          'Fortran'
          'Foxpro'
          'Galaxy'
          'GEMBASE'
          'GW-TEL'
          'Haskell'
          'HP48'
          'HTML & PHP'
          'INI'
          'Inno Setup Scripts'
          'Java'
          'Javascript'
          'Kixtart Scripts'
          'LEGO LDraw'
          'LLVM'
          'Modelica'
          'Modula-3'
          'Msg'
          'MS-DOS Batch'
          'Pascal (classic)'
          'Pascal (default)'
          'Pascal (twilight)'
          'Perl'
          'Progress'
          'Python'
          'Resource'
          'Ruby'
          'Semanta DD'
          'SQL'
          'Standard ML'
          'Structured Text'
          'Tcl/Tk'
          'TeX'
          'Text'
          'UNIX Shell'
          'Visual Basic'
          'VBScript'
          'Vrml97/X3D World'
          'Web IDL'
          'x86 Assembly'
          'XML'
          'YAML')
        DeniedKeyStrokes = True
        ReadOnly = False
        DropDownFixedWidth = 0
      end
    end
  end
  object ToolBarPanel: TPanel
    Left = 0
    Top = 24
    Width = 1100
    Height = 28
    Align = alTop
    AutoSize = True
    BevelOuter = bvNone
    Padding.Left = 2
    Padding.Top = 2
    Padding.Right = 2
    ParentColor = True
    TabOrder = 1
    Visible = False
    object ActionToolBar: TActionToolBar
      Left = 2
      Top = 2
      Width = 1096
      Height = 26
      ActionManager = ActionManager
      Align = alClient
      Color = clMenuBar
      ColorMap.DisabledFontColor = 7171437
      ColorMap.HighlightColor = clWhite
      ColorMap.BtnSelectedFont = clBlack
      ColorMap.UnusedColor = clWhite
      EdgeInner = esNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      HorzSeparator = False
      ParentFont = False
      PopupMenu = ToolbarPopupMenu
      Spacing = 0
    end
  end
  object ContentPanel: TPanel
    Left = 0
    Top = 52
    Width = 1100
    Height = 489
    Align = alClient
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 2
    object HorizontalSplitter: TSplitter
      Left = 0
      Top = 335
      Width = 1100
      Height = 3
      Cursor = crVSplit
      Align = alBottom
      AutoSnap = False
      Visible = False
    end
    object VerticalSplitter: TSplitter
      Left = 257
      Top = 0
      Height = 335
      AutoSnap = False
      MinSize = 100
      ResizeStyle = rsUpdate
    end
    object OutputPanel: TPanel
      Left = 0
      Top = 338
      Width = 1100
      Height = 151
      Align = alBottom
      BevelOuter = bvNone
      DoubleBuffered = False
      Padding.Left = 4
      Padding.Right = 3
      Padding.Bottom = 3
      ParentDoubleBuffered = False
      TabOrder = 0
      Visible = False
    end
    object DirectoryPanel: TPanel
      Left = 0
      Top = 0
      Width = 257
      Height = 335
      Align = alLeft
      BevelOuter = bvNone
      DoubleBuffered = False
      Padding.Left = 4
      Padding.Top = 4
      Padding.Bottom = 3
      ParentDoubleBuffered = False
      TabOrder = 1
    end
    object DocumentPanel: TPanel
      Left = 260
      Top = 0
      Width = 840
      Height = 335
      Align = alClient
      BevelOuter = bvNone
      DoubleBuffered = False
      Padding.Top = 2
      Padding.Right = 3
      Padding.Bottom = 3
      ParentColor = True
      ParentDoubleBuffered = False
      TabOrder = 2
    end
  end
  object ActionManager: TActionManager
    ActionBars = <
      item
      end
      item
      end
      item
        Items = <
          item
            Items = <
              item
                Action = FileNewAction
                ShortCut = 16462
              end
              item
                Action = FileOpenAction
                ShortCut = 16463
              end>
            Caption = '&File'
          end>
      end
      item
      end
      item
      end
      item
        Items = <
          item
            Items = <
              item
                Action = FileNewAction
                ImageIndex = 0
                ShortCut = 16462
              end
              item
                Action = FileOpenAction
                ImageIndex = 1
                ShortCut = 16463
              end
              item
                Caption = '-'
              end
              item
                Action = FileCloseAction
                ShortCut = 16499
              end>
            Caption = '&File'
          end>
      end
      item
        Items = <
          item
            Items = <
              item
                Action = FileNewAction
                ImageIndex = 0
                ShortCut = 16462
              end
              item
                Action = FileOpenAction
                ImageIndex = 1
                ShortCut = 16463
              end
              item
                Action = FileReopenAction
                Caption = '&Reopen'
                ImageIndex = 2
              end
              item
                Caption = '-'
              end
              item
                Action = FileSaveAction
                ImageIndex = 3
                ShortCut = 16467
              end
              item
                Action = FileSaveAsAction
                ImageIndex = 4
                ShortCut = 49235
              end
              item
                Action = FileSaveAllAction
                ImageIndex = 5
                ShortCut = 24659
              end
              item
                Action = FileCloseAction
                ImageIndex = 6
                ShortCut = 16499
              end
              item
                Action = FileCloseAllAction
                ImageIndex = 7
              end
              item
                Action = FileCloseAllOtherPagesAction
                Caption = 'Clos&e All Other'
                ImageIndex = 8
                ShortCut = 24691
              end
              item
                Caption = '-'
              end
              item
                Action = FilePrintAction
                ImageIndex = 9
                ShortCut = 16464
              end
              item
                Action = FilePrintPreviewAction
                ImageIndex = 10
              end
              item
                Caption = '-'
              end
              item
                Action = FileExitAction
                ImageIndex = 11
                ShortCut = 32883
              end>
            Caption = '&File'
          end
          item
            Items = <
              item
                Action = EditUndoAction
                ImageIndex = 13
                ShortCut = 16474
              end
              item
                Action = EditRedoAction
                ImageIndex = 14
                ShortCut = 24666
              end
              item
                Caption = '-'
              end
              item
                Action = EditCutAction
                ImageIndex = 15
                ShortCut = 16472
              end
              item
                Action = EditCopyAction
                ImageIndex = 16
                ShortCut = 16451
              end
              item
                Action = EditPasteAction
                ImageIndex = 17
                ShortCut = 16470
              end
              item
                Action = EditSelectAllAction
                ImageIndex = 18
                ShortCut = 16449
              end
              item
                Caption = '-'
              end
              item
                Items = <
                  item
                    Action = EditInsertLineAction
                    ImageIndex = 20
                    ShortCut = 16462
                  end
                  item
                    Action = EditInsertTagAction
                    ImageIndex = 21
                    ShortCut = 24660
                  end
                  item
                    Action = EditInsertDateTimeAction
                    ImageIndex = 22
                    ShortCut = 41028
                  end>
                Action = EditInsertAction
                ImageIndex = 19
                UsageCount = 1
              end
              item
                Items = <
                  item
                    Action = EditDeleteLineAction
                    ImageIndex = 24
                    ShortCut = 16473
                  end
                  item
                    Action = EditDeleteEOLAction
                    ImageIndex = 25
                    ShortCut = 24665
                  end
                  item
                    Action = EditDeleteWordAction
                    ImageIndex = 26
                    ShortCut = 16468
                  end
                  item
                    Caption = '-'
                  end
                  item
                    Action = EditRemoveWhiteSpaceAction
                    ImageIndex = 27
                  end>
                Action = EditDeleteAction
                ImageIndex = 23
                UsageCount = 1
              end
              item
                Caption = '-'
              end
              item
                Items = <
                  item
                    Action = EditIncreaseIndentAction
                    Caption = '&Increase'
                    ImageIndex = 29
                    ShortCut = 24649
                  end
                  item
                    Action = EditDecreaseIndentAction
                    ImageIndex = 30
                    ShortCut = 24661
                  end>
                Action = EditIndentAction
                ImageIndex = 28
                UsageCount = 1
              end
              item
                Items = <
                  item
                    Action = EditSortAscAction
                    ImageIndex = 32
                    ShortCut = 24641
                  end
                  item
                    Action = EditSortDescAction
                    Caption = '&Descending'
                    ImageIndex = 33
                    ShortCut = 24644
                  end>
                Action = EditSortAction
                ImageIndex = 31
                UsageCount = 1
              end
              item
                Caption = '-'
              end
              item
                Action = EditToggleCaseAction
                ImageIndex = 34
                ShortCut = 24643
              end>
            Caption = '&Edit'
          end
          item
            Items = <
              item
                Action = SearchAction
                ImageIndex = 35
                ShortCut = 16454
              end
              item
                Action = SearchReplaceAction
                ImageIndex = 36
                ShortCut = 16466
              end
              item
                Action = SearchFindInFilesAction
                ImageIndex = 37
                ShortCut = 24646
              end
              item
                Caption = '-'
              end
              item
                Action = SearchFindNextAction
                ImageIndex = 38
                ShortCut = 114
              end
              item
                Action = SearchFindPreviousAction
                ImageIndex = 39
                ShortCut = 8306
              end
              item
                Caption = '-'
              end
              item
                Action = ToggleBookmarkAction
                ImageIndex = 40
                ShortCut = 16497
              end
              item
                Items = <
                  item
                    Action = ToggleBookmarks1Action
                    ImageIndex = 42
                    ShortCut = 24625
                  end
                  item
                    Action = ToggleBookmarks2Action
                    ImageIndex = 43
                    ShortCut = 24626
                  end
                  item
                    Action = ToggleBookmarks3Action
                    ImageIndex = 44
                    ShortCut = 24627
                  end
                  item
                    Action = ToggleBookmarks4Action
                    ImageIndex = 45
                    ShortCut = 24628
                  end
                  item
                    Action = ToggleBookmarks5Action
                    ImageIndex = 46
                    ShortCut = 24629
                  end
                  item
                    Action = ToggleBookmarks6Action
                    ImageIndex = 47
                    ShortCut = 24630
                  end
                  item
                    Action = ToggleBookmarks7Action
                    ImageIndex = 48
                    ShortCut = 24631
                  end
                  item
                    Action = ToggleBookmarks8Action
                    ImageIndex = 49
                    ShortCut = 24632
                  end
                  item
                    Action = ToggleBookmarks9Action
                    ImageIndex = 50
                    ShortCut = 24633
                  end>
                Action = ToggleBookmarksAction
                ImageIndex = 41
                UsageCount = 1
              end
              item
                Items = <
                  item
                    Action = GotoBookmarks1Action
                    ImageIndex = 42
                    ShortCut = 16433
                  end
                  item
                    Action = GotoBookmarks2Action
                    ImageIndex = 43
                    ShortCut = 16434
                  end
                  item
                    Action = GotoBookmarks3Action
                    ImageIndex = 44
                    ShortCut = 16435
                  end
                  item
                    Action = GotoBookmarks4Action
                    ImageIndex = 45
                    ShortCut = 16436
                  end
                  item
                    Action = GotoBookmarks5Action
                    ImageIndex = 46
                    ShortCut = 16437
                  end
                  item
                    Action = GotoBookmarks6Action
                    ImageIndex = 47
                    ShortCut = 16438
                  end
                  item
                    Action = GotoBookmarks7Action
                    ImageIndex = 48
                    ShortCut = 16439
                  end
                  item
                    Action = GotoBookmarks8Action
                    ImageIndex = 49
                    ShortCut = 16440
                  end
                  item
                    Action = GotoBookmarks9Action
                    ImageIndex = 50
                    ShortCut = 16441
                  end>
                Action = GotoBookmarksAction
                Caption = '&Go to Bookmarks'
                ImageIndex = 51
                UsageCount = 1
              end
              item
                Action = ClearBookmarksAction
                ImageIndex = 52
              end
              item
                Caption = '-'
              end
              item
                Action = SearchGotoLineAction
                Caption = 'Go to &Line'
                ImageIndex = 53
                ShortCut = 16455
              end>
            Caption = '&Search'
          end
          item
            Items = <
              item
                Action = ViewOpenDirectoryAction
                ImageIndex = 54
                ShortCut = 16452
              end
              item
                Action = ViewCloseDirectoryAction
                ImageIndex = 55
                ShortCut = 24644
              end
              item
                Action = ViewEditDirectoryAction
                ImageIndex = 56
                ShortCut = 24645
              end
              item
                Caption = '-'
              end
              item
                Action = ViewDirectoryAction
              end
              item
                Action = ViewEncodingSelectionAction
              end
              item
                Action = ViewHighlighterSelectionAction
              end
              item
                Action = ViewMiniMapAction
                Caption = 'Minim&ap'
              end
              item
                Action = ViewOutputAction
              end
              item
                Action = ViewSplitAction
              end
              item
                Action = ViewStatusBarAction
              end
              item
                Action = ViewToolbarAction
              end
              item
                Action = ViewXMLTreeAction
              end
              item
                Caption = '-'
              end
              item
                Action = ViewLanguageAction
                ImageIndex = 57
              end
              item
                Action = ViewStyleAction
                ImageIndex = 58
              end
              item
                Caption = '-'
              end
              item
                Action = ViewWordWrapAction
              end
              item
                Action = ViewLineNumbersAction
              end
              item
                Action = ViewSpecialCharsAction
              end
              item
                Action = ViewSelectionModeAction
              end
              item
                Caption = '-'
              end
              item
                Action = ViewNextPageAction
                ImageIndex = 59
                ShortCut = 16393
              end
              item
                Action = ViewPreviousPageAction
                ImageIndex = 60
                ShortCut = 24585
              end>
            Caption = '&View'
          end
          item
            Items = <
              item
                Action = ToolsWordCountAction
                ImageIndex = 65
              end
              item
                Action = FormatXMLAction
                Caption = '&Format XML'
                ImageIndex = 66
              end
              item
                Caption = '-'
              end
              item
                Items = <
                  item
                    Action = MacroRecordPauseAction
                    ImageIndex = 68
                    ShortCut = 24658
                  end
                  item
                    Action = MacroStopAction
                    ImageIndex = 70
                    ShortCut = 24659
                  end
                  item
                    Action = MacroPlaybackAction
                    ImageIndex = 71
                    ShortCut = 24656
                  end
                  item
                    Caption = '-'
                  end
                  item
                    Action = MacroOpenAction
                    ImageIndex = 72
                  end
                  item
                    Action = MacroSaveAsAction
                    ImageIndex = 73
                  end>
                Action = MacroMenuAction
                ImageIndex = 67
                UsageCount = 1
              end
              item
                Caption = '-'
              end
              item
                Action = ViewInBrowserAction
                ImageIndex = 74
                ShortCut = 32834
              end>
            Caption = '&Document'
          end
          item
            Items = <
              item
                Action = CompareFilesAction
                ImageIndex = 75
              end
              item
                Action = ToolsConvertAction
                ImageIndex = 76
              end
              item
                Action = ToolsDuplicateCheckerAction
                ImageIndex = 77
              end
              item
                Action = ToolsUnicodeCharacterMapAction
                ImageIndex = 78
              end
              item
                Caption = '-'
              end
              item
                Action = ToolsLanguageEditorAction
                ImageIndex = 57
              end
              item
                Caption = '-'
              end
              item
                Action = ToolsOptionsAction
                ImageIndex = 79
              end>
            Caption = '&Tools'
          end
          item
            Items = <
              item
                Action = HelpCheckForUpdatesMenuAction
                ImageIndex = 80
              end
              item
                Caption = '-'
              end
              item
                Action = HelpHomeAction
                ImageIndex = 81
              end
              item
                Caption = '-'
              end
              item
                Action = HelpAboutAction
                ImageIndex = 82
              end>
            Caption = '&Help'
          end>
        ActionBar = ActionMainMenuBar
      end
      item
        Items = <
          item
            Action = FileNewAction
            ImageIndex = 0
            ShowCaption = False
            ShortCut = 16462
          end
          item
            Action = FileOpenAction
            ImageIndex = 1
            ShowCaption = False
            ShortCut = 16463
          end
          item
            Caption = '-'
          end
          item
            Action = FileSaveAction
            ImageIndex = 3
            ShowCaption = False
            ShortCut = 16467
          end
          item
            Action = FileSaveAsAction
            ImageIndex = 4
            ShowCaption = False
            ShortCut = 49235
          end
          item
            Action = FileSaveAllAction
            ImageIndex = 5
            ShowCaption = False
            ShortCut = 24659
          end
          item
            Action = FileCloseAction
            ImageIndex = 6
            ShowCaption = False
            ShortCut = 16499
          end
          item
            Action = FileCloseAllAction
            Caption = 'Close All'
            ImageIndex = 7
            ShowCaption = False
          end
          item
            Caption = '-'
          end
          item
            Action = FilePrintAction
            ImageIndex = 9
            ShowCaption = False
            ShortCut = 16464
          end
          item
            Action = FilePrintPreviewAction
            ImageIndex = 10
            ShowCaption = False
          end
          item
            Caption = '-'
          end
          item
            Action = ViewOpenDirectoryAction
            Caption = 'Open Direc&tory'
            ImageIndex = 54
            ShowCaption = False
            ShortCut = 16452
          end
          item
            Action = ViewCloseDirectoryAction
            Caption = 'Close Director&y'
            ImageIndex = 55
            ShowCaption = False
            ShortCut = 24644
          end
          item
            Action = ViewEditDirectoryAction
            ImageIndex = 56
            ShowCaption = False
            ShortCut = 24645
          end
          item
            Caption = '-'
          end
          item
            Action = EditIncreaseIndentAction
            ImageIndex = 29
            ShowCaption = False
            ShortCut = 24649
          end
          item
            Action = EditDecreaseIndentAction
            ImageIndex = 30
            ShowCaption = False
            ShortCut = 24661
          end
          item
            Caption = '-'
          end
          item
            Action = EditSortAscAction
            Caption = 'Sort Ascendin&g'
            ImageIndex = 32
            ShowCaption = False
            ShortCut = 24641
          end
          item
            Action = EditSortDescAction
            Caption = 'Sort Descending'
            ImageIndex = 33
            ShowCaption = False
            ShortCut = 24644
          end
          item
            Caption = '-'
          end
          item
            Action = EditToggleCaseAction
            Caption = 'Togg&le Case'
            ImageIndex = 34
            ShowCaption = False
            ShortCut = 24643
          end
          item
            Caption = '-'
          end
          item
            Action = EditUndoAction
            ImageIndex = 13
            ShowCaption = False
            ShortCut = 16474
          end
          item
            Action = EditRedoAction
            ImageIndex = 14
            ShowCaption = False
            ShortCut = 24666
          end
          item
            Caption = '-'
          end
          item
            Action = SearchAction
            Caption = 'Searc&h...'
            ImageIndex = 35
            ShowCaption = False
            ShortCut = 16454
          end
          item
            Action = SearchReplaceAction
            Caption = 'Replace...'
            ImageIndex = 36
            ShowCaption = False
            ShortCut = 16466
          end
          item
            Action = SearchFindInFilesAction
            ImageIndex = 37
            ShowCaption = False
            ShortCut = 24646
          end
          item
            Caption = '-'
          end
          item
            Action = ViewWordWrapAction
            CommandStyle = csCheckBox
            ImageIndex = 61
            ShowCaption = False
            CommandProperties.Width = -1
          end
          item
            Action = ViewLineNumbersAction
            Caption = 'Line Nu&mbers'
            CommandStyle = csCheckBox
            ImageIndex = 62
            ShowCaption = False
            CommandProperties.Width = -1
          end
          item
            Action = ViewSpecialCharsAction
            Caption = 'Special Chars'
            CommandStyle = csCheckBox
            ImageIndex = 63
            ShowCaption = False
            CommandProperties.Width = -1
          end
          item
            Action = ViewSelectionModeAction
            Caption = 'Column Mode'
            CommandStyle = csCheckBox
            ImageIndex = 64
            ShowCaption = False
            CommandProperties.Width = -1
          end
          item
            Caption = '-'
          end
          item
            Action = CompareFilesAction
            Caption = 'Compare Files...'
            ImageIndex = 75
            ShowCaption = False
          end
          item
            Caption = '-'
          end
          item
            Action = MacroRecordPauseAction
            Caption = 'Record'
            ImageIndex = 68
            ShowCaption = False
            ShortCut = 24658
          end
          item
            Action = MacroStopAction
            Caption = 'Stop'
            ImageIndex = 70
            ShowCaption = False
            ShortCut = 24659
          end
          item
            Action = MacroPlaybackAction
            Caption = 'Play&back'
            ImageIndex = 71
            ShowCaption = False
            ShortCut = 24656
          end
          item
            Action = MacroOpenAction
            Caption = 'Open...'
            ImageIndex = 72
            ShowCaption = False
          end
          item
            Action = MacroSaveAsAction
            Caption = 'Save as...'
            ImageIndex = 73
            ShowCaption = False
          end
          item
            Caption = '-'
          end
          item
            Action = ToolsWordCountAction
            Caption = 'Line, Word and Character Count...'
            ImageIndex = 65
            ShowCaption = False
          end
          item
            Action = ViewInBrowserAction
            Caption = 'View in Browser'
            ImageIndex = 74
            ShowCaption = False
            ShortCut = 32834
          end>
        ActionBar = ActionToolBar
      end>
    Images = ImageList
    Left = 296
    Top = 192
    StyleName = 'Platform Default'
    object FileMenuAction: TAction
      Category = '&File'
      Caption = '&File'
      OnExecute = DummyActionExecute
    end
    object FileNewAction: TAction
      Category = '&File'
      Caption = '&New'
      Hint = 'Create a new document'
      ImageIndex = 0
      ShortCut = 16462
      OnExecute = FileNewActionExecute
    end
    object FileOpenAction: TAction
      Category = '&File'
      Caption = '&Open...'
      Hint = 'Open an existing document'
      ImageIndex = 1
      ShortCut = 16463
      OnExecute = FileOpenActionExecute
    end
    object FileReopenAction: TAction
      Category = '&File'
      Caption = 'Reopen'
      ImageIndex = 2
      OnExecute = FileReopenActionExecute
    end
    object FileSaveAction: TAction
      Category = '&File'
      Caption = '&Save'
      Hint = 'Save the active document'
      ImageIndex = 3
      ShortCut = 16467
      OnExecute = FileSaveActionExecute
    end
    object FileSaveAsAction: TAction
      Category = '&File'
      Caption = 'S&ave As...'
      Hint = 'Save the active document with a new name'
      ImageIndex = 4
      ShortCut = 49235
      OnExecute = FileSaveAsActionExecute
    end
    object FileSaveAllAction: TAction
      Category = '&File'
      Caption = 'Sa&ve All'
      Hint = 'Save all documents'
      ImageIndex = 5
      ShortCut = 24659
      OnExecute = FileSaveAllActionExecute
    end
    object FileCloseAction: TAction
      Category = '&File'
      Caption = '&Close'
      Hint = 'Close the active document'
      ImageIndex = 6
      ShortCut = 16499
      OnExecute = FileCloseActionExecute
    end
    object FileCloseAllAction: TAction
      Category = '&File'
      Caption = 'C&lose All'
      Hint = 'Close all open files'
      ImageIndex = 7
      OnExecute = FileCloseAllActionExecute
    end
    object FileCloseAllOtherPagesAction: TAction
      Category = '&File'
      Caption = 'Close All Other'
      Hint = 'Close all other pages'
      ImageIndex = 8
      ShortCut = 24691
      OnExecute = FileCloseAllOtherPagesActionExecute
    end
    object FilePrintAction: TAction
      Category = '&File'
      Caption = '&Print...'
      Hint = 'Print the active document'
      ImageIndex = 9
      ShortCut = 16464
      OnExecute = FilePrintActionExecute
    end
    object FilePrintPreviewAction: TAction
      Category = '&File'
      Caption = 'Pr&int Preview...'
      Hint = 'Preview the active document'
      ImageIndex = 10
      OnExecute = FilePrintPreviewActionExecute
    end
    object FileExitAction: TAction
      Category = '&File'
      Caption = 'E&xit'
      Hint = 'Quit the application'
      ImageIndex = 11
      ShortCut = 32883
      OnExecute = FileExitActionExecute
    end
    object EditMenuAction: TAction
      Category = '&Edit'
      Caption = '&Edit'
      OnExecute = DummyActionExecute
    end
    object EditUndoAction: TAction
      Category = '&Edit'
      Caption = '&Undo'
      Hint = 'Undo the last action'
      ImageIndex = 13
      ShortCut = 16474
      OnExecute = EditUndoActionExecute
    end
    object EditRedoAction: TAction
      Category = '&Edit'
      Caption = '&Redo'
      Hint = 'Redo the previously undone action'
      ImageIndex = 14
      ShortCut = 24666
      OnExecute = EditRedoActionExecute
    end
    object EditCutAction: TAction
      Category = '&Edit'
      Caption = '&Cut'
      Hint = 'Cut the selection and put it on the Clipboard'
      ImageIndex = 15
      ShortCut = 16472
      OnExecute = EditCutActionExecute
    end
    object EditCopyAction: TAction
      Category = '&Edit'
      Caption = 'C&opy'
      Hint = 'Copy the selection and put it on the Clipboard'
      ImageIndex = 16
      ShortCut = 16451
      OnExecute = EditCopyActionExecute
    end
    object EditPasteAction: TAction
      Category = '&Edit'
      Caption = '&Paste'
      Hint = 'Insert Clipboard contents'
      ImageIndex = 17
      ShortCut = 16470
      OnExecute = EditPasteActionExecute
    end
    object SearchMenuAction: TAction
      Category = '&Search'
      Caption = '&Search'
      OnExecute = DummyActionExecute
    end
    object SearchAction: TAction
      Category = '&Search'
      Caption = '&Search...'
      Hint = 'Search the specified text'
      ImageIndex = 35
      ShortCut = 16454
      OnExecute = SearchActionExecute
    end
    object SearchReplaceAction: TAction
      Category = '&Search'
      Caption = '&Replace...'
      Hint = 'Replace the specified text with different text'
      ImageIndex = 36
      ShortCut = 16466
      OnExecute = SearchReplaceActionExecute
    end
    object SearchFindInFilesAction: TAction
      Category = '&Search'
      Caption = '&Find in Files...'
      Hint = 'Search for a string in multiple files'
      ImageIndex = 37
      ShortCut = 24646
      OnExecute = SearchFindInFilesActionExecute
    end
    object SearchFindNextAction: TAction
      Category = '&Search'
      Caption = 'Find &Next'
      Hint = 'Find the next matching text'
      ImageIndex = 38
      ShortCut = 114
      OnExecute = SearchFindNextActionExecute
    end
    object SearchFindPreviousAction: TAction
      Category = '&Search'
      Caption = 'Find &Previous'
      Hint = 'Find the previous matching text'
      ImageIndex = 38
      ShortCut = 8306
      OnExecute = SearchFindPreviousActionExecute
    end
    object ViewMenuAction: TAction
      Category = '&View'
      Caption = '&View'
      OnExecute = DummyActionExecute
    end
    object ViewOpenDirectoryAction: TAction
      Category = '&View'
      Caption = '&Open Directory'
      Hint = 'Open a new directory'
      ImageIndex = 54
      ShortCut = 16452
      OnExecute = ViewOpenDirectoryActionExecute
    end
    object ViewCloseDirectoryAction: TAction
      Category = '&View'
      Caption = '&Close Directory'
      Hint = 'Close the active directory'
      ImageIndex = 55
      ShortCut = 24644
      OnExecute = ViewCloseDirectoryActionExecute
    end
    object ViewEditDirectoryAction: TAction
      Category = '&View'
      Caption = '&Edit Directory'
      Hint = 'Edit the active directory'
      ImageIndex = 56
      ShortCut = 24645
      OnExecute = ViewEditDirectoryActionExecute
    end
    object ViewDirectoryAction: TAction
      Category = '&View'
      Caption = '&Directory'
      Checked = True
      Hint = 'Show or hide the directory'
      OnExecute = ViewDirectoryActionExecute
    end
    object ViewEncodingSelectionAction: TAction
      Category = '&View'
      Caption = 'Encodin&g'
      Hint = 'Show or hide the encoding selection'
      OnExecute = ViewEncodingSelectionActionExecute
    end
    object ViewHighlighterSelectionAction: TAction
      Category = '&View'
      Caption = '&Highlighter'
      Checked = True
      Hint = 'Show or hide the highlighter selection'
      OnExecute = ViewHighlighterSelectionActionExecute
    end
    object ViewMiniMapAction: TAction
      Category = '&View'
      Caption = 'Minimap'
      Hint = 'Show or hide the minimap'
      OnExecute = ViewMiniMapActionExecute
    end
    object ViewOutputAction: TAction
      Category = '&View'
      Caption = 'O&utput'
      Hint = 'Show or hide the output'
      OnExecute = ViewOutputActionExecute
    end
    object ViewSplitAction: TAction
      Category = '&View'
      Caption = 'S&plit'
      Hint = 'Split the document'
      OnExecute = ViewSplitActionExecute
    end
    object ViewStatusBarAction: TAction
      Category = '&View'
      Caption = '&Status Bar'
      Checked = True
      Hint = 'Show or hide the status bar'
      OnExecute = ViewStatusBarActionExecute
    end
    object ViewToolbarAction: TAction
      Category = '&View'
      Caption = '&Toolbar'
      Checked = True
      Hint = 'Show or hide the toolbar'
      OnExecute = ViewToolbarActionExecute
    end
    object ViewXMLTreeAction: TAction
      Category = '&View'
      Caption = '&XML Tree'
      Hint = 'Show or hide the XML tree'
      OnExecute = ViewXMLTreeActionExecute
    end
    object ViewLanguageAction: TAction
      Category = '&View'
      Caption = '&Language'
      ImageIndex = 57
      OnExecute = DummyActionExecute
    end
    object ViewStyleAction: TAction
      Category = '&View'
      Caption = 'St&yle'
      ImageIndex = 58
      OnExecute = DummyActionExecute
    end
    object ViewNextPageAction: TAction
      Category = '&View'
      Caption = '&Next Page'
      Hint = 'Go to next page'
      ImageIndex = 59
      ShortCut = 16393
      OnExecute = ViewNextPageActionExecute
    end
    object ViewPreviousPageAction: TAction
      Category = '&View'
      Caption = 'P&revious Page'
      Hint = 'Go to previous page'
      ImageIndex = 60
      ShortCut = 24585
      OnExecute = ViewPreviousPageActionExecute
    end
    object ViewWordWrapAction: TAction
      Category = '&View'
      Caption = '&Word Wrap'
      Hint = 'Toggle word wrap'
      ImageIndex = 61
      OnExecute = ViewWordWrapActionExecute
    end
    object ViewLineNumbersAction: TAction
      Category = '&View'
      Caption = 'Line Num&bers'
      Checked = True
      Hint = 'Toggle line numbers'
      ImageIndex = 62
      OnExecute = ViewLineNumbersActionExecute
    end
    object ToolsMenuAction: TAction
      Category = '&Tools'
      Caption = '&Tools'
      OnExecute = DummyActionExecute
    end
    object HelpMenuAction: TAction
      Category = '&Help'
      Caption = '&Help'
      OnExecute = DummyActionExecute
    end
    object HelpCheckForUpdatesMenuAction: TAction
      Category = '&Help'
      Caption = '&Check for Updates...'
      Hint = 'Check for updates'
      ImageIndex = 80
      OnExecute = HelpCheckForUpdatesMenuActionExecute
    end
    object HelpHomeAction: TAction
      Category = '&Help'
      Caption = '&Visit Homepage...'
      Hint = 'Visit EditBone homepage - http://www.bonecode.com/'
      ImageIndex = 81
      OnExecute = HelpHomeActionExecute
    end
    object HelpAboutAction: TAction
      Category = '&Help'
      Caption = '&About EditBone...'
      Hint = 'Display information about EditBone'
      ImageIndex = 82
      OnExecute = HelpAboutActionExecute
    end
    object ViewSpecialCharsAction: TAction
      Category = '&View'
      Caption = 'Spec&ial Chars'
      GroupIndex = 1
      Hint = 'Toggle special characters'
      ImageIndex = 63
      OnExecute = ViewSpecialCharsActionExecute
    end
    object OutputDblClickAction: TAction
      Caption = 'OutputDblClickAction'
      OnExecute = OutputDblClickActionExecute
    end
    object FileTreeViewDblClickAction: TAction
      Caption = 'FileTreeViewDblClickAction'
      OnExecute = FileTreeViewDblClickActionExecute
    end
    object CompareFilesAction: TAction
      Category = '&Tools'
      Caption = '&Compare Files...'
      Hint = 'Compare files'
      ImageIndex = 75
      OnExecute = CompareFilesActionExecute
    end
    object DocumentMenuAction: TAction
      Category = '&Document'
      Caption = '&Document'
      OnExecute = DummyActionExecute
    end
    object ToolsWordCountAction: TAction
      Category = '&Document'
      Caption = '&Line, Word and Character Count...'
      Hint = 'Line, word and character count'
      ImageIndex = 65
      OnExecute = ToolsWordCountActionExecute
    end
    object FormatXMLAction: TAction
      Category = '&Document'
      Caption = 'Format XML'
      Hint = 'Format XML'
      ImageIndex = 66
      OnExecute = FormatXMLActionExecute
    end
    object ViewInBrowserAction: TAction
      Category = '&Document'
      Caption = '&View in Browser'
      Hint = 'View current document in default browser'
      ImageIndex = 74
      ShortCut = 32834
      OnExecute = ViewInBrowserActionExecute
    end
    object ViewSelectionModeAction: TAction
      Category = '&View'
      Caption = 'Selection &Mode'
      Hint = 
        'Toggle selection mode. Also pressing Alt on editor will toggle s' +
        'election mode.'
      ImageIndex = 64
      OnExecute = ViewSelectionModeActionExecute
    end
    object ToggleBookmarkAction: TAction
      Category = '&Search'
      Caption = '&Toggle Bookmark'
      Hint = 
        'Set or clear bookmark at current line. Bookmarks can be also set' +
        ' by using Ctrl+Shift+0..9. Go to bookmark by using Ctrl+0..9.'
      ImageIndex = 40
      ShortCut = 16497
      OnExecute = ToggleBookmarkActionExecute
    end
    object EditSelectAllAction: TAction
      Category = '&Edit'
      Caption = '&Select All'
      Hint = 'Select all'
      ImageIndex = 18
      ShortCut = 16449
      OnExecute = EditSelectAllActionExecute
    end
    object EditInsertAction: TAction
      Category = '&Insert'
      Caption = '&Insert'
      ImageIndex = 19
      OnExecute = DummyActionExecute
    end
    object EditInsertLineAction: TAction
      Category = '&Insert'
      Caption = '&Insert Line'
      Hint = 'Insert line'
      ImageIndex = 20
      ShortCut = 16462
      OnExecute = EditInsertLineActionExecute
    end
    object EditDeleteAction: TAction
      Category = '&Delete'
      Caption = 'D&elete'
      ImageIndex = 23
      OnExecute = DummyActionExecute
    end
    object EditDeleteEOLAction: TAction
      Category = '&Delete'
      Caption = '&End of Line'
      Hint = 'Delete end of line'
      ImageIndex = 24
      ShortCut = 24665
      OnExecute = EditDeleteEOLActionExecute
    end
    object EditDeleteLineAction: TAction
      Category = '&Delete'
      Caption = '&Line'
      Hint = 'Delete line'
      ImageIndex = 25
      ShortCut = 16473
      OnExecute = EditDeleteLineActionExecute
    end
    object EditDeleteWordAction: TAction
      Category = '&Delete'
      Caption = '&Word'
      Hint = 'Delete word'
      ImageIndex = 26
      ShortCut = 16468
      OnExecute = EditDeleteWordActionExecute
    end
    object EditIndentAction: TAction
      Category = '&Indent'
      Caption = 'I&ndent'
      ImageIndex = 28
      OnExecute = DummyActionExecute
    end
    object EditIncreaseIndentAction: TAction
      Category = '&Indent'
      Caption = 'Increase'
      Hint = 'Increase indent'
      ImageIndex = 29
      SecondaryShortCuts.Strings = (
        'Tab')
      ShortCut = 24649
      OnExecute = EditIncreaseIndentActionExecute
    end
    object EditDecreaseIndentAction: TAction
      Category = '&Indent'
      Caption = '&Decrease'
      Hint = 'Decrease indent'
      ImageIndex = 30
      SecondaryShortCuts.Strings = (
        'Shift+Tab')
      ShortCut = 24661
      OnExecute = EditDecreaseIndentActionExecute
    end
    object EditSortAction: TAction
      Category = '&Sort'
      Caption = 'Sor&t'
      ImageIndex = 31
      OnExecute = DummyActionExecute
    end
    object EditSortAscAction: TAction
      Category = '&Sort'
      Caption = '&Ascending'
      Hint = 'Sort ascending'
      ImageIndex = 32
      ShortCut = 24641
      OnExecute = EditSortAscActionExecute
    end
    object EditSortDescAction: TAction
      Category = '&Sort'
      Caption = 'Descending'
      Hint = 'Sort descending'
      ImageIndex = 33
      ShortCut = 24644
      OnExecute = EditSortDescActionExecute
    end
    object EditToggleCaseAction: TAction
      Category = '&Edit'
      Caption = 'To&ggle Case'
      Hint = 'Toggle case'
      ImageIndex = 34
      ShortCut = 24643
      OnExecute = EditToggleCaseActionExecute
    end
    object ToggleBookmarksAction: TAction
      Category = 'T&oggle Bookmarks'
      Caption = 'T&oggle Bookmarks'
      ImageIndex = 41
      OnExecute = DummyActionExecute
    end
    object GotoBookmarksAction: TAction
      Category = 'Go to Bookmarks'
      Caption = 'Go to Bookmarks'
      ImageIndex = 51
      OnExecute = DummyActionExecute
    end
    object ClearBookmarksAction: TAction
      Category = '&Search'
      Caption = 'Clear &Bookmarks'
      Hint = 'Clear all bookmarks'
      ImageIndex = 52
      OnExecute = ClearBookmarksActionExecute
    end
    object MacroMenuAction: TAction
      Category = '&Macro'
      Caption = '&Macro'
      ImageIndex = 67
      OnExecute = DummyActionExecute
    end
    object MacroRecordPauseAction: TAction
      Category = '&Macro'
      Caption = '&Record'
      Hint = 'Record or pause a macro'
      ImageIndex = 68
      ShortCut = 24658
      OnExecute = MacroRecordPauseActionExecute
    end
    object MacroStopAction: TAction
      Category = '&Macro'
      Caption = '&Stop'
      Hint = 'Stop the macro recording'
      ImageIndex = 70
      ShortCut = 24659
      OnExecute = MacroStopActionExecute
    end
    object MacroPlaybackAction: TAction
      Category = '&Macro'
      Caption = '&Playback'
      Hint = 'Playback the macro'
      ImageIndex = 71
      ShortCut = 24656
      OnExecute = MacroPlaybackActionExecute
    end
    object MacroOpenAction: TAction
      Category = '&Macro'
      Caption = '&Open...'
      Hint = 'Open an existing macro'
      ImageIndex = 72
      OnExecute = MacroOpenActionExecute
    end
    object MacroSaveAsAction: TAction
      Category = '&Macro'
      Caption = 'S&ave as...'
      Hint = 'Save the macro with a new name'
      ImageIndex = 73
      OnExecute = MacroSaveAsActionExecute
    end
    object PopupMenuStandardAction: TAction
      Category = 'ToolbarPopup'
      Caption = 'Standard'
      Checked = True
      OnExecute = PopupMenuStandardActionExecute
    end
    object PopupMenuPrintAction: TAction
      Category = 'ToolbarPopup'
      Caption = 'Print'
      Checked = True
      OnExecute = PopupMenuPrintActionExecute
    end
    object PopupMenuDirectoryAction: TAction
      Category = 'ToolbarPopup'
      Caption = 'Directory'
      Checked = True
      OnExecute = PopupMenuDirectoryActionExecute
    end
    object PopupMenuIndentAction: TAction
      Category = 'ToolbarPopup'
      Caption = 'Indent'
      Checked = True
      OnExecute = PopupMenuIndentActionExecute
    end
    object PopupMenuSortAction: TAction
      Category = 'ToolbarPopup'
      Caption = 'Sort'
      Checked = True
      OnExecute = PopupMenuSortActionExecute
    end
    object PopupMenuCaseAction: TAction
      Category = 'ToolbarPopup'
      Caption = 'Case'
      Checked = True
      OnExecute = PopupMenuCaseActionExecute
    end
    object PopupMenuCommandAction: TAction
      Category = 'ToolbarPopup'
      Caption = 'Command'
      Checked = True
      OnExecute = PopupMenuCommandActionExecute
    end
    object PopupMenuSearchAction: TAction
      Category = 'ToolbarPopup'
      Caption = 'Search'
      Checked = True
      OnExecute = PopupMenuSearchActionExecute
    end
    object PopupMenuModeAction: TAction
      Category = 'ToolbarPopup'
      Caption = 'Mode'
      Checked = True
      OnExecute = PopupMenuModeActionExecute
    end
    object PopupMenuToolsAction: TAction
      Category = 'ToolbarPopup'
      Caption = 'Tools'
      Checked = True
      OnExecute = PopupMenuToolsActionExecute
    end
    object PopupMenuMacroAction: TAction
      Category = 'ToolbarPopup'
      Caption = 'Macro'
      Checked = True
      OnExecute = PopupMenuMacroActionExecute
    end
    object ToolsSelectForCompareAction: TAction
      Category = '&Tools'
      Caption = 'Select for Compare...'
      Hint = 'Select document for compare'
      ImageIndex = 75
      OnExecute = ToolsSelectForCompareActionExecute
    end
    object PopupMenuDocumentAction: TAction
      Category = 'ToolbarPopup'
      Caption = 'Document'
      Checked = True
      OnExecute = PopupMenuDocumentActionExecute
    end
    object SelectStyleAction: TAction
      OnExecute = SelectStyleActionExecute
    end
    object ToolsConvertAction: TAction
      Category = '&Tools'
      Caption = 'C&onvert...'
      Hint = 'Convert between numerical units'
      ImageIndex = 76
      OnExecute = ToolsConvertActionExecute
    end
    object ToolsDuplicateCheckerAction: TAction
      Category = '&Tools'
      Caption = '&Duplicate Checker...'
      Hint = 'Check duplicate text blocks'
      ImageIndex = 77
      OnExecute = ToolsDuplicateCheckerActionExecute
    end
    object ToolsUnicodeCharacterMapAction: TAction
      Category = '&Tools'
      Caption = '&Unicode Character Map...'
      Hint = 
        'Insert unicode characters to active document by double clicking ' +
        'a character'
      ImageIndex = 78
      OnExecute = ToolsUnicodeCharacterMapActionExecute
    end
    object ToolsLanguageEditorAction: TAction
      Category = '&Tools'
      Caption = '&Language Editor...'
      Hint = 'Language editor'
      ImageIndex = 57
      OnExecute = ToolsLanguageEditorActionExecute
    end
    object ToolsOptionsAction: TAction
      Category = '&Tools'
      Caption = 'O&ptions...'
      Hint = 'Set options'
      ImageIndex = 79
      OnExecute = ToolsOptionsActionExecute
    end
    object SelectLanguageAction: TAction
      OnExecute = SelectLanguageActionExecute
    end
    object ToggleBookmarks1Action: TAction
      Tag = 1
      Category = 'T&oggle Bookmarks'
      Caption = 'Bookmark &1'
      ImageIndex = 42
      ShortCut = 24625
      OnExecute = ToggleBookmarksActionExecute
    end
    object GotoBookmarks1Action: TAction
      Tag = 1
      Category = 'Go to Bookmarks'
      Caption = 'Bookmark &1'
      ImageIndex = 42
      ShortCut = 16433
      OnExecute = GotoBookmarksActionExecute
    end
    object ToggleBookmarks2Action: TAction
      Tag = 2
      Category = 'T&oggle Bookmarks'
      Caption = 'Bookmark &2'
      ImageIndex = 43
      ShortCut = 24626
      OnExecute = ToggleBookmarksActionExecute
    end
    object ToggleBookmarks3Action: TAction
      Tag = 3
      Category = 'T&oggle Bookmarks'
      Caption = 'Bookmark &3'
      ImageIndex = 44
      ShortCut = 24627
      OnExecute = ToggleBookmarksActionExecute
    end
    object ToggleBookmarks4Action: TAction
      Tag = 4
      Category = 'T&oggle Bookmarks'
      Caption = 'Bookmark &4'
      ImageIndex = 45
      ShortCut = 24628
      OnExecute = ToggleBookmarksActionExecute
    end
    object ToggleBookmarks5Action: TAction
      Tag = 5
      Category = 'T&oggle Bookmarks'
      Caption = 'Bookmark &5'
      ImageIndex = 46
      ShortCut = 24629
      OnExecute = ToggleBookmarksActionExecute
    end
    object ToggleBookmarks6Action: TAction
      Tag = 6
      Category = 'T&oggle Bookmarks'
      Caption = 'Bookmark &6'
      ImageIndex = 47
      ShortCut = 24630
      OnExecute = ToggleBookmarksActionExecute
    end
    object ToggleBookmarks7Action: TAction
      Tag = 7
      Category = 'T&oggle Bookmarks'
      Caption = 'Bookmark &7'
      ImageIndex = 48
      ShortCut = 24631
      OnExecute = ToggleBookmarksActionExecute
    end
    object ToggleBookmarks8Action: TAction
      Tag = 8
      Category = 'T&oggle Bookmarks'
      Caption = 'Bookmark &8'
      ImageIndex = 49
      ShortCut = 24632
      OnExecute = ToggleBookmarksActionExecute
    end
    object ToggleBookmarks9Action: TAction
      Tag = 9
      Category = 'T&oggle Bookmarks'
      Caption = 'Bookmark &9'
      ImageIndex = 50
      ShortCut = 24633
      OnExecute = ToggleBookmarksActionExecute
    end
    object GotoBookmarks2Action: TAction
      Tag = 2
      Category = 'Go to Bookmarks'
      Caption = 'Bookmark &2'
      ImageIndex = 43
      ShortCut = 16434
      OnExecute = GotoBookmarksActionExecute
    end
    object GotoBookmarks3Action: TAction
      Tag = 3
      Category = 'Go to Bookmarks'
      Caption = 'Bookmark &3'
      ImageIndex = 44
      ShortCut = 16435
      OnExecute = GotoBookmarksActionExecute
    end
    object GotoBookmarks4Action: TAction
      Tag = 4
      Category = 'Go to Bookmarks'
      Caption = 'Bookmark &4'
      ImageIndex = 45
      ShortCut = 16436
      OnExecute = GotoBookmarksActionExecute
    end
    object GotoBookmarks5Action: TAction
      Tag = 5
      Category = 'Go to Bookmarks'
      Caption = 'Bookmark &5'
      ImageIndex = 46
      ShortCut = 16437
      OnExecute = GotoBookmarksActionExecute
    end
    object GotoBookmarks6Action: TAction
      Tag = 6
      Category = 'Go to Bookmarks'
      Caption = 'Bookmark &6'
      ImageIndex = 47
      ShortCut = 16438
      OnExecute = GotoBookmarksActionExecute
    end
    object GotoBookmarks7Action: TAction
      Tag = 7
      Category = 'Go to Bookmarks'
      Caption = 'Bookmark &7'
      ImageIndex = 48
      ShortCut = 16439
      OnExecute = GotoBookmarksActionExecute
    end
    object GotoBookmarks8Action: TAction
      Tag = 8
      Category = 'Go to Bookmarks'
      Caption = 'Bookmark &8'
      ImageIndex = 49
      ShortCut = 16440
      OnExecute = GotoBookmarksActionExecute
    end
    object GotoBookmarks9Action: TAction
      Tag = 9
      Category = 'Go to Bookmarks'
      Caption = 'Bookmark &9'
      ImageIndex = 50
      ShortCut = 16441
      OnExecute = GotoBookmarksActionExecute
    end
    object EditRemoveWhiteSpaceAction: TAction
      Category = '&Delete'
      Caption = 'Re&move Whitespace'
      Hint = 'Remove all whitespace from selected text'
      ImageIndex = 27
      OnExecute = EditRemoveWhiteSpaceActionExecute
    end
    object FilePropertiesAction: TAction
      Category = '&File'
      Caption = 'Pr&operties'
      Hint = 'See the file/directory properties'
      ImageIndex = 12
      OnExecute = FilePropertiesActionExecute
    end
    object SearchGotoLineAction: TAction
      Category = '&Search'
      Caption = 'Go to Line'
      Hint = 'Go to Line'
      ImageIndex = 53
      ShortCut = 16455
      OnExecute = SearchGotoLineActionExecute
    end
    object FileReopenClearAction: TAction
      Category = '&Reopen'
      Caption = '&Clear'
      ImageIndex = 23
      OnExecute = FileReopenClearActionExecute
    end
    object SelectReopenFileAction: TAction
      OnExecute = SelectReopenFileActionExecute
    end
    object EditInsertTagAction: TAction
      Category = '&Insert'
      Caption = '&HTML/XML Tags...'
      Hint = 'Insert HTML/XML tags'
      ImageIndex = 21
      ShortCut = 24660
      OnExecute = EditInsertTagActionExecute
    end
    object EditInsertDateTimeAction: TAction
      Category = '&Insert'
      Caption = '&Date and Time'
      Hint = 'Insert date and time'
      ImageIndex = 22
      ShortCut = 41028
      OnExecute = EditInsertDateTimeActionExecute
    end
  end
  object ImageList: TBCImageList
    ColorDepth = cd32Bit
    DrawingStyle = dsTransparent
    Left = 408
    Top = 224
    Bitmap = {
      494C010153005500040010001000FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000005001000001002000000000000050
      0100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000977C63008E70
      55008C6D51008B6C51008B6D51008C6D53008C6D53008B6D51008B6C51008C6D
      51008E705500977C630000000000000000000000000094A9B5007C9AAA00809B
      AA00829BA900829BA900809BAA007B9AAA0092AAB90000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000AE865D00A7774500AE865D00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008E705500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008E7055000000000000000000000000007D9BAB00BFD4E2002167
      94003FAAE2003FAAE20021679400BFD4E300789CB60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A97F5200C5A37E00FBF4E700C5A37E00A97F52000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008B6D5100FFFF
      FF00FCFEFF00FDFFFF00FFFFFF00AE722900AE722900FFFFFF00FDFFFF00FCFE
      FF00FFFFFF008B6D51000000000000000000000000007F9CAD00C7D9E400236A
      9F0044ABDF0044ABDF00236A9F00C5D9E600779BB500BC7B0000B67B0700B57B
      0900B57B0900B57C0900B67E0E00BF9A50000000000000000000000000000000
      000000000000A9805300C4A47F00F6EDDF00C19E7900F6EDDF00C4A47F00A980
      5300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008B6C5100FFFF
      FF00F9FAFD00FBFFFF00AD722A00F1BE7100F1BE7100AD722A00FBFFFF00F9FA
      FD00FFFFFF008B6C5100000000000000000000000000849FAD00CBDEE800206C
      A90043ABDE0043ABDE00206CA900C9DDE8007898AC00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B67E0E000000000000000000000000000000
      0000A9805300C5A58100F8F1E600B4895D00A3723E00B4895D00F8F1E600C5A5
      8100A98053000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008B6D5100FFFF
      FF00F7FDFF00AE722A00EFBC6E00EDBC7100EDBC7100EFBC6E00AE722A00F7FD
      FF00FFFFFF008B6D51000000000000000000000000008DA3B000D0E3EC005F98
      C7001E6EB4001E6EB4005F98C700CEE1EB007F9BAB00FFFFFF00F0D9B700EDD9
      BA00ECD8B900EAD6B700FFFFFF00B57B0900000000000000000000000000A980
      5300C7A68400FAF4EA00B3895C00A2703C00A3713D00A2703C00B3895C00FAF4
      EA00C7A68400A980530000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008C6D5200FFFF
      FF00AF722700F4C78300F1C78700EDC28100EBB96E00F2C88800F4C78300AF72
      2700FFFFFF008C6D520000000000000000002D75A8004E809F00D8EAF100D2E6
      F000D2EAF500D2EAF500D2E6F000D5E8F00040789B000860A100F2D6AB00D0AB
      7F00CEAA7F00E8D0A900FFFFFF00B47B09000000000000000000A97E5100C6A7
      8400FCF7EF00B38A5F00B8916800FAF2E400F8EFE000FBF3E600B9926900B38B
      5F00FCF7EF00C6A78400A97E5100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008C6D5200FFFF
      FF00C7A47600B2773100B27A3700EECD9C00E0AC5D00B27B3900B2783100C7A4
      7600FFFFFF008C6D52000000000000000000000000002A73AC00689BBD00DAEF
      FC00C3620E00C3620E00D9EEFB006096BB001165A500FFFAF800EBCF9D00E8D1
      A400E7D0A400E4CB9C00FFFFFF00B47B090000000000B18D6800C8A88700FDF9
      F200B58C6000A6764300A5754200B8906600FDF8EF00A26F3A00A7774500A676
      4400B58C6000FDF9F200C8A88700AD865C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008B6D5100FFFF
      FF00E8ECF000EBF3FC00B2772F00EFD8B700EBCFA600B3783100EBF3FC00E8EC
      F000FFFFFF008B6D5100000000000000000000000000000000002573B200679F
      C800E1F7FF00E1F7FF00629BC5001165A900FAF1EB00EDECEE00E4C68E00C9A2
      6D00C8A26D00E1C48E00FFFFFF00B47B090000000000A6754300FFFFFF00C4A4
      8100A3723E00A8784700A6754200B9916700FFFFFE00A4723E00A97A4A00A97A
      4900A4723E00C4A48100FFFFFF00A67543000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008B6C5200FFFF
      FF00E1E2E300E3E6EB00C4A07300B0752C00B0752C00C4A07300E3E6EB00E1E2
      E300FFFFFF008B6D520000000000000000000000000000000000000000001D73
      C0006BA3D20069A1CD001267AF00F2E9E100E5E2E000E0E1E500DFBF7D00DFC2
      8500DFC28500DDBD7D00FFFFFF00B57B090000000000C4A38200C9A98900FFFF
      FC00B48D6200A5744200BE9A7400FFFFFF00FFFFFF00A5744100A97A4900A777
      4400B58D6300FFFFFC00C9A98900BC9873000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000896D5700FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008A6D56000000000000000000000000000000000000000000CB84
      0100126FC2000F68B600E8DFD800DCD8D500D6D5D500D4D6DB00D9B36600D9B5
      6C00D8B56B00D7B36600FFFFFF00B57B09000000000000000000C5A58300C9AA
      8B00FFFFFF00B68C6200A3723D00A2703B00A2703B00A6764300A6764300B78D
      6300FFFFFF00C9AA8B00C5A58300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BF8E4800C28A
      3B00BF863800BF863800BF873900BF873A00BF873A00BF873900BF863800BF86
      3800C28A3B00B5874C000000000000000000000000000000000000000000BC7F
      0A00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B57C0B00000000000000000000000000C5A5
      8300CAAB8C00FFFFFF00B58C6100BA946B00FFFFFE00A3713D00B68E6300FFFF
      FF00CAAB8C00C5A5830000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C5914700F5D0
      9B00ECB96E00ECB97000ECB97000ECB97000ECB97000ECB97000ECB97000ECB9
      6E00F5D09B00C69147000000000000000000000000000000000000000000B67F
      0F00F9E2BF00E9B97000E9BE7900E8BE7900E8BD7900E8BD7900E7BD7900E7BD
      7900E7BC7700E6B66E00F7E0BE00B57E0F000000000000000000000000000000
      0000C5A58300CAAC8E00FFFFFF00B38A5F00A06C3600B48B6000FFFFFF00CAAC
      8E00C5A583000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C5904800E6C5
      9200D5A05100D6A15300D6A15400D6A15400D6A15400D6A15400D6A15300D5A0
      5100E6C59200C59048000000000000000000000000000000000000000000B680
      1300F2D8AE00CD840800D08A1300D38F1D00D4932400D6962B00D99A3400DB9E
      3B00DCA24200DFA64900F1D7AC00B68013000000000000000000000000000000
      000000000000C4A58300CBAD8E00FFFFFF00C6A88600FFFFFF00CBAD8F00C4A5
      8300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C5914900DDBD
      8F00DCBC8D00DCBC8E00DCBC8E00DCBC8E00DCBC8E00DCBC8E00DCBC8E00DCBC
      8D00DDBD8F00C59149000000000000000000000000000000000000000000B882
      1700EED09C00ECCE9900ECCF9A00ECCE9A00ECCE9900ECCE9900EBCD9800EBCD
      9800EBCD9700EBCD9600EECF9A00B88217000000000000000000000000000000
      00000000000000000000C4A58300CBAE9100FFFFFF00CBAE9100C4A583000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CB9A5600C591
      4900C5914800C5914800C5914800C5914800C5914800C5914800C5914800C591
      4800C5914900CB9A56000000000000000000000000000000000000000000CFAB
      6200B8821700B7811600B7811600B7811600B7811600B7811500B7811500B681
      1500B6811500B7811500B8821700CFAB62000000000000000000000000000000
      0000000000000000000000000000C4A38200A6754100C4A38200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B884440000000000000000000000000000000000000000000000
      0000579870005798700000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C18C2600C4912B0000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C4A9
      8800C5975E00DFAC6500B78241000000000000000000000000006EA384005798
      700057987000579870005798700084AC93000000000000000000B4B4B200B0B0
      AD00B3B0AB00B3B0AB00B1AFAB00B1AFAB00B1AFAB00B0AFAB00B0AFAC00B0B0
      AD00BABAB900000000000000000000000000A39B8E009E9688009D9587009D95
      87009D9487009D9486009D9486009D9486009D9486009D9486009D9486009D94
      87009D9587009D9587009E968800AEA89F000000000000000000000000000000
      00000000000000000000C0891E00E7A84200EAB05400D9A44800000000000000
      0000000000000000000000000000000000000000000000000000BB8C5200CA96
      4F00E4B16500F4C17700E5DCB000BB83420000000000000000005598710090BB
      A000000000000000000073A58600579870000000000000000000B0B0AE00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00B0B0AD000000000000000000000000009E968800CAC5C200C7C2BE00C7C2
      BE00C6C1BD00C5C0BC00C5C0BB00C5C0BB00C5C0BB00C5C0BB00C5C0BC00C6C1
      BD00C7C2BE00C7C2BE00CAC5C2009E968800BA892600B67E0E00B57C0900B57B
      0900B57B0900B47C0A00BF820F00FFF2D300E2A23900E8AF5100D9A34400B680
      1200B8811200BD8A2700000000000000000000000000C2A37C00BF894600D09D
      5500C89F6E00E1AC6500B9814000000000000000000000000000000000000000
      000000000000000000005D9B7500579870000000000000000000AEAEAC00FFFF
      FF002A8BE400238BEA00228AE9002289E9002289E900258CEA004D8FCC00FFFF
      FF00AEAEAC000000000000000000000000009D948700C9C6C100F6F8FA00AFA8
      9D00F5F6F900F3F4F600F3F4F600F3F4F600F3F4F600F3F4F600F3F4F600F5F6
      F800AFA89D00F6F8FA00C9C6C1009D948700B67E0E00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00CFAD6800CA850900FFF0CE00E1A13500E9AC4800D5B4
      7100FFFFFF00BD810A00000000000000000000000000BB864600DAB37E000000
      000000000000C1843D0000000000000000000000000000000000BDC6C0006BA1
      8000579870005798700065A07C00000000000000000000000000AEAEAB00FFFF
      FF001586ED00D5F9FF00D3F7FF00D3F7FF00D2F7FF00DBFCFF00288DEA00FFFF
      FF00AEAEAC000000000000000000000000009D948700CDCAC400AAA49700ACA5
      9800ACA59900AAA49700ABA49800AAA49700ABA49800AAA49700ABA49800AAA4
      9700AAA39700AAA39600CDC9C4009D948700B57B0900FFFFFF00E5D5CB00E5D6
      CA00E5D5C900F9FCFF00FBFFFF00CBA86200CA830500FFEDC500DBB16C00B5B8
      C1006A6A6E006F6F750087898D000000000000000000C0864100000000000000
      000000000000000000000000000000000000000000000000000057986F005798
      7000000000000000000000000000000000000000000000000000AEAEAC00FFFF
      FF0061ADF3000E81EB001083EC001083EC001082EB00208AEB005398D700FFFF
      FF00AFAEAB000000000000000000000000009C948600CFCDC600F5F6F900F7F8
      FA00A9A29600F8FAFD00A9A39600F8FAFD00A9A39600F8FAFD00A9A29600F6F7
      FA00F3F4F600F2F3F500CECBC4009C948600B47B0800FFFFFF00E3D1C200E4D2
      C300E4D1C000F1F3F400F2F4F600F4F9FF00C9A35900E0C28900D9DBE300CECD
      D000D3D4D400EEEEEF00ECEAED007C7B7A00000000000000000000000000429A
      CC00429ACC00419ACE00439ACC008EB5CC00000000000000000057986E005F9C
      7600000000000000000000000000579870000000000000000000AEAEAC00FFFF
      FF00F6F5F500F6F5F500F6F4F400F5F4F400F5F4F400F6F5F500F5F4F400FFFF
      FF00AEAEAB000000000000000000000000009C948600D3D2CB00A49C8E00A69E
      9100A7A09200A7A09200A7A09200A7A09200A7A09200A7A09200A7A09200A59E
      9000A2998B00F1F2F400D1D0C8009C938600B47B0900FFFFFF00E0CCBB00E1CE
      BC00E1CCB900ECEDEE00EBEBEB00ECECEE00EEF0F400F2F3F700A7A6A700DBD9
      DA00D1CFCF00767474007C7B7C00817F7F000000000000000000439ACC004699
      C8004799C8005FA7D0004799C7004799C9000000000000000000A5C8B2005698
      70005798700057987000569870005E9D78000000000000000000AEAEAC00FFFF
      FF00A5A5A500BEBEBD00BDBDBC00BCBCBB00F1F1F000A6A6A600BCBCBB00FFFF
      FF00AEAEAC000000000000000000000000009C938600D6D5CD00F6F7FA00A199
      8C00F8FAFD00A29A8D00F8FAFD00A29A8D00F8FAFD00A29A8D00F8FAFD00A199
      8C00F5F6F900DDD9D700D5D4CB009C938600B57B0900FFFFFF00DDC6B300DEC9
      B500DEC7B200E6E7E800E5E4E400E5E4E400E7E6E600EDECEB0079777500D9D7
      D600C5C2C2007B7B7D0000000000000000000000000060A3CA004799C80075AB
      C900000000000000000000000000000000000000000000000000000000000000
      0000539872005298720000000000000000000000000000000000AEAEAC00FFFF
      FF00EEEDEC00EFEEED00EEEDEC00EEEDEC00EDECEB00EFEEEC00EDECEB00FFFF
      FF00AEAEAC000000000000000000000000009C938600DADAD100B6B0A400B8B1
      A600B8B1A500B8B2A600B8B1A500B8B2A600B8B1A500B8B2A600B8B1A500B8B1
      A600B6B0A400B6AFA300DADAD1009C938600B57B0900FFFFFF00DAC1AA00DCC4
      AD00DCC3AA00DFE0E100DEDEDD00DEDDDC00DFDEDD00E5E4E30076737000E3E1
      E200B3B1AF008A87870082818300878585004799C7004799C7004799C7004799
      C7004799C7004799C70000000000000000000000000000000000000000000000
      0000000000000000000000000000C68442000000000000000000AEAEAC00FFFF
      FF00A2A3A300B9B8B700E9E8E700B8B7B600EAE9E800A4A4A400B8B7B600FFFF
      FF00AFAEAB000000000000000000000000009D948700DFE1D700DDDED400DDDE
      D400DDDED500DDDED500DDDED500DDDED500DDDED500DDDED500DDDED500DDDE
      D500DDDED400DDDED400DFE1D7009D948700B57B0900FFFFFF00D4B89E00D5BA
      A000D6B99E00D5D6D800D5D5D500D5D4D400D6D5D500D9D9D900A3A2A000BDBB
      BB00F4F4F400E5E5E600C4C4C50089878500000000004799C7004799C7000000
      000000000000000000000000000000000000000000000000000000000000BE83
      42000000000000000000CBA47200BC8646000000000000000000AEAEAC00FFFF
      FF00E2E0DF00E2E1E000E1E0DF00E2E0DF00E2E1E000E2E1E000E1E0DF00FFFF
      FF00B3AFAA00000000000000000000000000BDB7AE009D9587009C9386009C93
      86009C9386009C9386009C9386009C9386009C9386009C9386009C9386009C93
      86009C9386009C9386009D958700BDB7AE00B57C0A00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A8A9
      AF007D7D820082838900A0A1A600000000004799C7004799C7004799C7004799
      C7004799C7004799C7004799C700000000000000000000000000B9813E00E2AF
      6700C89E6C00CF9C5700BD894700C59864000000000000000000AFAFAD00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00BCB2A700000000000000000000000000000000000000000000000000A098
      8B00CCCCCC000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B57E0F00F7E0BE00E7B87000E8BE
      7A00E8BE7A00E8BD7900E8BD7800E8BD7800E7BD7700E8BD7700EABF7900ECBC
      7300FFE6C000BB8008000000000000000000000000004799C7004799C7006CA7
      C8000000000000000000000000000000000000000000C5823500F0DABB00F7C6
      7A00E7B56A00CA975000B9854600000000000000000000000000BEBEBC00B0B0
      AD00AFAEAB00B2AFAA00B5AFA600B2ACA500B0AAA400B0AAA400B0AAA400B5AD
      A4007DA1C0001B89ED005CA1E20000000000000000000000000000000000BCB7
      AD00A1998C00ADA79E0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B6801300F2D8AE00CD840800D08A
      1300D28E1A00D4922200D5952900D8992F00D99B3600DB9F3E00DEA34500E0A6
      4A00F2D8AC00B7811200000000000000000000000000000000004799C7004799
      C7004799C7004799C7004799C7004E9DCA000000000000000000B9813F00E2B0
      6800C0935D00D0AE830000000000000000000000000000000000000000000000
      000000000000000000001186F100CBF7FF00C7F4FF00C6F3FF00C6F3FF00C8F4
      FF00CEF6FF00D9FBFF00278DEA00000000000000000000000000000000000000
      0000FFFFFF00A1998C0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B8821700EED09C00ECCE9900ECCF
      9A00ECCF9A00ECCE9A00ECCE9900ECCE9800EBCD9800EBCD9700EBCD9700EBCD
      9600EECF9A00B882170000000000000000000000000000000000000000004B9B
      C8004799C7004799C7004799C7008BBFDD00000000000000000000000000B985
      4500000000000000000000000000000000000000000000000000000000000000
      0000000000000000000068B1F300228BEB002089EA002089EA002089EA002089
      EA002189EA00258BEA006CB1F100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BE8D2A00B8821700B7811600B781
      1600B7811600B7811600B7811600B7811500B7811500B6811500B6811500B781
      1500B8821700BF8E2D0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000068A4CE004195D100469AD40000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C09B5300B7821800B6811400B8801000B9810F00B87F
      0E00B67E0F00B6801300B7821800BB8928000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008B4F0000C6
      850000000000000000000000000000000000BEBEBD00AFAFAD00ADADAB00ADAD
      AB00ADADAB00ADADAB00AFAFAD00B4B4B300B8B8B600AFAFAD00ADADAB00ADAD
      AB00ADADAB00ADADAB00AFAFAD00BFBFBE0000000000000000000000000068A4
      CF004092CE0054ADDE0066C4ED0078E0FE003591D10000000000000000000000
      0000777674006E6B6A007A777600000000000000000000000000000000000000
      00000000000000000000BA841600F6CD8B00F3C27500F9FCFF008B8D9100F9F9
      F900F4F8FC00F2C17400F6CD8B00B78218000000000000000000000000000000
      000000000000BD851E00C5851C00CC851A00D08518000000000000894B0000E4
      A60000BE8000000000000000000000000000AFAFAD00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00AFAFAD00AFAFAD00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00AFAFAD00000000004E9CD10058B0DF006DC9
      EF007FE2FD007EE3FE007ADEFC007EE1FF00308CCD004C525B004C525B004C52
      5B00686768006A6766006C686700000000008A8787006B6867008C8B8B000000
      00000000000000000000BC831000F4CC8A00EBB65C00F2EDED007F797800F1E9
      E200EEE9E900EAB55B00F3CC8B00B6811600000000000000000000000000BC88
      1E00D1931B00E6991300438F3800008A4F0000894C0000884A000084430000D9
      A20000D8A00000BC80000000000000000000AEAEAB00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00ACACAA00ACACAA00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00AEAEAB00000000004094CF0092F1FF0085E7
      FF0080E1FD007ADEFB0077DBFB0083E1FF00308ACB00F3B56D00F8AF5D00FFAB
      46005F616700C0C2C30069666500000000006A676600C1C2C300666567006366
      6B0060646C005A627000BA810D00F3CE9200E6AD4F00EACFA900FFFFFF00FDFF
      FF00E8CEA700E6AD4E00F3CE9300B68115000000000000000000BF8A1F00DEA0
      2500E2A12700F2A1220000874D003BE8C40000D7A10000D7A10000D59F0000D0
      9C0000D09C0000D39F0000B9810000000000ADADAB00FFFFFF00FBFBFB00FAFA
      FA00FAFAFA00FBFBFB00FFFFFF00ACACAA00ACACAA00FFFFFF00FBFBFB00FAFA
      FA00FAFAFA00FBFBFB00FFFFFF00ADADAB00000000003E92CE009AF0FF0083E4
      FD007EDFFC007ADDFB0076DAFA0089E2FE0048A8DD0070AED900FBAD5A00FFA6
      4400595F660062626200676564000000000068656400646262005D606500FFB5
      5100FFB65F00FEC07C00B47E0C00F4D39D00E4A64100E3A43A00E3A13300E2A1
      3200E3A43A00E3A64100F4D49E00B681140000000000BE881E00E3A63000E4A9
      3500E8A83500FDA82F00008446006CE8D00000C8990000C8990000C8990000C7
      970000C8980000CA9A0063E6CD00008A4700ADADAB00FFFFFF00F8F7F700F8F7
      F700F8F7F700F8F7F700FFFFFF00ACACAA00ACACAA00FFFFFF00F8F7F700F8F7
      F700F8F7F700F8F7F700FFFFFF00ADADAB00000000003E92CE00A3F1FF0082E3
      FC007EDFFC007ADDFB0076DAFA0071D9FB009DE8FF002A89CB00FFC88B00FFCD
      8500565A6200C0C1C300666362000000000067646300C0C2C300585D6400FFAF
      4F00FCBB7400FABE7B00B07C0B00F5D8AB00E19E2F00E7CAA100EBE2E000EBE2
      E000E7CAA100E19E2F00F6D9AD00B680140000000000C9A23600ECAD3C00ECB0
      4200F7AF4100ACC661000081420096EDE2004DE8D4004FE7D4004DE6D10093E8
      D80000C3970060E0C70000B2810000000000ADADAB00FFFFFF00F5F4F400F5F4
      F400F5F4F400F5F4F400FFFFFF00ACACAA00ACACAA00FFFFFF00F5F4F400F5F4
      F400F5F4F400F5F4F400FFFFFF00ADADAB00000000003D92CE00ADF3FF0081E3
      FC007EDFFC007ADDFB0076DAFA006FD8FA00ABEBFF002B89CC00FFCC8500FFD8
      920056595E00605E5E00656261000000000065626100605E5F00565C6400FFA6
      3A00FFB26200FFC28300B07B0A00F7E1BB00DD941900EEE9E900EFE6DE00EFE6
      DE00EEE9E900DD941900F8E2BC00B6801200BE81170043E59400CDBF5A00F5B7
      5000DFBD590000FAB40000AA6700007E3E00008140000083420000813B0080E4
      D60057DAC50000AE80000000000000000000ADADAB00FFFFFF00F2F0F100F2F1
      F100F2F1F100F2F1F100FFFFFF00ACACAA00ACACAA00FFFFFF00F2F1F100F2F1
      F100F2F1F100F2F0F100FFFFFF00ADADAB00000000003C92CE00B6F6FF0080E3
      FC007DDFFC007ADDFB0076DAFA006ED7FA00B9EFFF002A89CC004C525B004C52
      5B0055585D00C2C4C500615D5C000000000064615F00C1C3C400585C6300FF9E
      2100FFAB4600FFB86600B37D0A00FBEAD000DA880200F0EEEC00B2ADA700B2AD
      A700F0EEEC00DA880200FBEAD100B67F1200BF841A0095D47600FAC77800FFC6
      730089D7860000F3AA0000EFA40000EDA20074D06F00FFA627000085450074E3
      D80000A98000498632000000000000000000ADADAB00FFFFFF00EEECED00EEEC
      ED00EDECEC00EEECED00FFFFFF00ACACAA00ACACAA00FFFFFF00EEECED00EDEC
      EC00EEECED00EEECED00FFFFFF00ADADAB00000000003C91CE00C0F8FF007FE2
      FC007DDFFC007ADDFB0075DAFA006DD7FA00C6F3FF002989CB00F8AF5D00FFAB
      460050555D005A5959005F5D5C0000000000625F5F005E5C5C00595B60004E57
      65004753650044516600B67F0B00FEEBCB00FCE6C300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FCE6C400FFECCE00B7811400BF881E00F8C36300FDDCA300FFD5
      91009DE19D0000F1AC0000EA9F0000E89D0000E89F00B0BC520000864B0000A7
      870000A86200D88213000000000000000000AEAEAB00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F3F3F300FFFFFF00ACACAA00ACACAA00FFFFFF00F4F4F400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00AEAEAB00000000003B91CE00C9F9FF007EE2
      FC007CDEFC0078DCFB0072D9FA006AD6FA00D2F6FF002888CB00FBAD5A00FFA6
      44004D525900C2C4C5005D5B5A0000000000615D5C00C2C4C50054585D00FFB5
      5300FFB56000FBBE7A00CB973900B07C0B00B37C0900BA7E0500BD7F0300BC7F
      0400B87E0900B67F0F00B7811400BD8D2900B6811600F4C67000FFE6BD00FFE0
      AC00CFE4AD0021F2B8000CEBA70045D9880022DA8A00D0B44700FFA22500E2A0
      200000DB8A00CC8217000000000000000000AFAFAD00FFFFFF00A5A5A300A7A7
      A500CBCBCA00FFFFFF00FFFFFF00ACACAA00ACACAA00FFFFFF00FFFEFE00CBCB
      CA00A7A7A400A5A5A300FFFFFF00AFAFAD00000000003A91CE00D2FCFF007AE2
      FC0077DDFC007FDFFB009BE6FD00B3EDFF00D4F9FF002688CB00FFC88B00FFCD
      85004D505500575555005D5A5900000000005F5D5C005A59590050555D00FFB1
      5000FCBB7400F6BB7600F5B56C00FBAD5A00FFA644004B536100525660005257
      64000000000000000000000000000000000000000000DFAB4700FFF2D800EBEC
      C60092F3C80040F4C30027EFB6001CE7A3000FDF9300BDB64C00FF9E220011D3
      7E0036BB6400000000000000000000000000CACAC900E9E9E900FFFFFF00E3E2
      E100A7A7A400FFFFFF00FFFFFF00ACACAA00ACACAA00FFFFFF00FFFFFE00A7A7
      A500EBEBEA00FFFFFF00E9E9E900CACAC800000000003991CF00E9FFFF00AFF0
      FF00CEF7FF00DAFAFF00C4ECFC008CCAEC005FAEE00082BDE600FFCC8500FFD8
      92004E515400C4C5C6005A595800000000005C5A5900C2C4C6004D535B00FFA7
      3B00FFB26100FCBF7D00FCC88F00FFC88B00FFCD85004C515800C1C4C7005858
      5D000000000000000000000000000000000000000000BD871C00FBDA9F00FFF0
      D60094F9D900D2E6B600EFD8990041EAB1003BE09A009FBB540003DA8A0000DC
      8F00C0871D0000000000000000000000000000000000B7B7B500E8E8E800FFFF
      FF00A5A5A300FFFFFF00FFFFFF00ACACAA00ADADAA00FFFFFF00FDFDFE00A5A5
      A300FFFFFF00E8E8E800CBCBC90000000000000000003C93D000E9FFFF00A8DA
      F3007BBDE4004398D200408EC7006E9CBC0090A5B2004C525B004C525B004C52
      5B0057565700595757005B595800000000005C5A59005756560050555B00FFA0
      2200FFAD4600FFB86000FFC27400FFCC8500FFD8920050525600575555005B59
      5900000000000000000000000000000000000000000000000000C38A1C00EEE0
      AC00AAFFF500E4EDCA00FFD8A400FFD08E00B8CA770000E2940012D58200B48C
      2400000000000000000000000000000000000000000000000000B8B8B500E9E9
      E900FFFFFF00FFFFFF00FFFFFF00AFAFAD00AFAFAD00FFFFFF00FFFFFF00FFFF
      FF00E9E9E900BDBDBC000000000000000000000000004297D2003B93D00062AD
      DC0093CDED00BBE7FA00D8FCFF00D6FCFF00D3FBFF00D1FBFF00D3FCFF002E91
      D500923B90005B5958008E3E8C000000000059575600C5C6C700555657004F54
      5A004C525A004B5158004B5056004C5055004F51550055545500C5C6C7005957
      560000000000000000000000000000000000000000000000000000000000B389
      1D0044CF810049F9CC0029FDCD002CEEB20000E69B0037C26B00AF8B26000000
      000000000000000000000000000000000000000000000000000000000000B7B7
      B500AFAFAD00AEAEAC00AFAFAD00BCBCBA00C9C9C700AFAFAD00AEAEAC00AFAF
      AD00B7B7B5000000000000000000000000000000000051A0D6004498D2004197
      D1003F95D1003D94D0003B93D0003A92D0003A92D0003A93D0003C94D1004B9E
      D600000000000000000000000000000000008C8B8A0059575600919090000000
      0000000000000000000000000000000000000000000091909000595756008C8B
      8A00000000000000000000000000000000000000000000000000000000000000
      000000000000C37E1100C47D1000C67E1200C87F140000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001D785F00008C
      4B000F815500000000001D785F00008C4B000F81550000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008A490018DD
      A200008D4C0000000000008A490018DDA200008D4C00137C5600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000400B5000000B4000000B4000400B500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BF5D6E00B9854500C05C71000000000000000000BC715B00B9854400C282
      4A00000000000000000000000000000000000000000000000000000000000000
      0000CEA47000BA823D00BA823D00BA823D00BA823D00BA823D00BA823D00CEA4
      70000000000000000000000000000000000000000000000000000088440029E6
      B400008C4400000000000088440029E6B4001EDEAB00009656003F5A6E000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000B9003043F000415CFF00415CFF003043F0000000B9000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B8844400FACA8000B88444000000000000000000B8844400FDCC7F00C78F
      3B00000000000000000000000000000000000000000000000000000000000000
      0000BA823D00E8B97400E8B97400E8B97400E8B97400E8B97400E8B97400BA82
      3D0000000000000000000000000000000000000000000000000000883F0039E2
      B800008C44000000000000883F0039E2B80000D49C0033DCB10000A467003E5A
      6D00000000000000000000000000000000000000000000000000000000000000
      00000800B9002736ED003346FC003144F9003144F9003346FC002736ED000400
      B600000000000000000000000000000000000000000000000000000000000000
      0000B8844400EEBC7200B88444000000000000000000B8844400F1BF7000CB91
      3900000000000000000000000000000000000000000000000000000000000000
      0000BA823D00E8B97400F0BE7400EFBE7400F0BE7400EFBE7400F3C78200BA82
      3D00000000000000000000000000000000000000000000000000008A40004CE3
      BF00008C440000000000008A40004CE3BF0000CE990000CF9A0049E2BF000EB1
      7B003E5A6D000000000000000000000000000000000000000000000000000000
      00000000B6002B3BFC002432F7002432F5002432F5002432F7002B3BFC000000
      B400000000000000000000000000000000000000000000000000000000000000
      0000B8844500E3B16400B88445000000000000000000B8844500E6B36200CC92
      3900000000000000000000000000000000000000000000000000000000000000
      0000BA823D00E0B87D00DFAC6000DFAC6200DFAC6000DFAC6000E0B87D00BA82
      3D00000000000000000000000000000000000000000000000000008C41005DE4
      C700008C440000000000008C41005DE4C70000CA980000C998000ECEA20056E2
      C50000B681004060740000000000000000000000000000000000000000000000
      00000000B6003B46FA00131EF300131FF200131FF200131EF3003B46FA000000
      B400000000000000000000000000000000000000000000000000000000000000
      0000B9844500D9A55700B98445000000000000000000B9844500DCA75500CC93
      3900000000000000000000000000000000000000000000000000000000000000
      0000BA823D00DEBB8A00CF9A4B00D09C4E00CF9A4B00D09C4E00DEBB8A00BA82
      3D00000000000000000000000000000000000000000000000000008A41006EE4
      D000008C440000000000008A41006EE4D00000C5990000C5990012CAA5006AE3
      CD0000B483000E83540000000000000000000000000000000000000000000000
      00000900BA006364EC004C50F700262CF200262CF2004C50F7006364EC000500
      B700000000000000000000000000000000000000000000000000000000000000
      0000B9844400CE984700B98444000000000000000000B9844400D19A4600CC92
      3900000000000000000000000000000000000000000000000000000000000000
      0000BA823D00DEC29A00C0873300C1883600C0873300C0873300DEC29A00BA82
      3D0000000000000000000000000000000000000000000000000000893F007EE6
      D500008C44000000000000893F007EE6D50000C0980000C199007EE5D40000A3
      6B00197B58000000000000000000000000000000000000000000000000000000
      0000000000000000BA007C7DEC00ABABFF00ABABFF007C7DEC000001B9000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B9844300F2E5CF00B98443000000000000000000B9844300F4E7CD00C88F
      3900000000000000000000000000000000000000000000000000000000000000
      0000BA823D00DDC5A200DDC5A300DEC5A300DDC5A300DDC5A200DDC5A200BA82
      3D0000000000000000000000000000000000000000000000000000873D008DE8
      DC00008C44000000000000873D008DE8DC0000BB970091E7DA0000995F001A7A
      5A00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000500B7000000B4000000B4000500B700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BE7D5100B9844300D05B80000000000000000000C5716100BA854200C682
      4C00000000000000000000000000000000000000000000000000000000000000
      0000CC9D6300BA823D00BA823D00BA823D00BA823D00BA823D00BA823D00CEA4
      700000000000000000000000000000000000000000000000000000843A009EEC
      E500008C44000000000000843A009EECE5009CE9DD00009251001C7B59000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000813600B3F0
      EB00008C44000000000000813600B3F0EB00008C440011804A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000042A275000088
      3C000C8B50000000000042A2750000883C000C8B500000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000067DBC10000B9
      910000A7860000987A0000886C00328E76000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B1B1B100A2A2A2009F9F9F009F9F
      9F009F9F9F009F9F9F009F9F9F009F9F9F009F9F9F009F9F9F009F9F9F009F9F
      9F009F9F9F009F9F9F00A2A2A200B1B1B1000000000000000000000000000000
      00000000000000000000000000000000000000000000B7794400AE5A1300AD59
      1200AE5A1300B7794600000000000000000000000000000000000000000091E6
      D20000BA8F0000A98100099B88003896D6006EA8D70000000000000000000000
      00000000000000000000000000000000000000000000000000008A8887006E6B
      6A008D8C8B000000000000000000000000000000000000000000000000008D8C
      8B006E6B6A008A8887000000000000000000A2A2A200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00A2A2A200B5B5B300AFAFAD00AEAEAB00ADAD
      AB00ADADAB00AEAEAC00AFB2B300B2B0AB00AD5A1500CD8D4A00E6B67600E4B2
      7100E6B67600CD8E4C00AE5B1500000000000000000000000000000000000000
      000057D8B40015BAA20065B0EA004FA5E9003299E60000000000000000000000
      00000000000000000000000000000000000000000000000000006C6867006A67
      66006867680063666B0060646A0060636A0060636A0061646B0063666B006867
      68006A6766006C6867000000000000000000A0A0A000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00A0A0A000B0B0AD00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C98B5700C9823C00DEAA6700DAA25B00FFFF
      FF00DAA25B00DEAA6800CB884600B87A46000000000000000000000000000000
      000000000000B2D8FB0077BDF3005AB1F0009F91880078706A00000000000000
      000000000000000000000000000000000000000000000000000069666500C0C2
      C3005E616600FFB65300FFB45C00FDBE7500FCC17D00FFB86400FFAF48005F61
      6700C0C2C300696665000000000000000000A0A0A000FFFFFF00454341005F5D
      5C0074716F00646261004A474500FFFFFF00FFFFFF00454240005F5D5C007471
      6F00646261004A484500FFFFFF00A0A0A000AEAEAB00FFFFFF00FDFDFC00FCFC
      FB00FCFCFB00FDFEFF00FFFFFF00A6490000D99F5A00D69C5800D3944C00FFFF
      FF00D3944C00D69C5800DBA36000AF5B15000000000000000000000000000000
      0000000000000000000000000000BBAEA600FAF7F300B0ACA9007B7166000000
      0000000000000000000000000000000000000000000000000000676564006262
      6200595E6500FFB45800FAB86F00F4B56C00F2B56D00F8AE5D00FFAA4400595F
      660062626200676564000000000000000000A0A0A000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FEFEFE00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00A0A0A000ADADAB00FFFFFF00F8F8F800F8F8
      F800F8F8F800F9FAFB00FEFFFF00A6490000DCAB7100D1914900CF8C4100FFFF
      FF00CF8C4100D1914900DEAD7600AE5A13000000000000000000000000000000
      0000000000000000000000000000A9A29E00D3D1CE00FEFAF600A39388000000
      000000000000000000000000000000000000000000000000000066636200C0C2
      C400565B6400FFAC4800FAB87000F7C18400F6BE7E00F9B06200FFB15300565A
      6200C0C1C300666362000000000000000000A0A0A000FFFFFF0048454300625F
      5F0077747200676564004C4A4800FDFDFC00FDFDFC004845430062605F007774
      7200676564004D4A4800FFFFFF00A0A0A000ADADAB00FFFFFF00F6F5F500F6F5
      F500F6F5F500F7F7F800FCFFFF00A6480000E8CAA500CB863900CA843600C881
      3000CA843600CB873A00EACEAB00AE5A12000000000000000000000000000000
      000000000000000000000000000000000000AAA49F00C0B2A900459EDB002191
      F30000000000000000000000000000000000000000000000000065626100605F
      5F00565C6400FFA43500FFAF5B00FBBA7400FDC38600FFCC9400FFD79B005659
      5E00605E5E00656261000000000000000000A0A0A000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FAF9F800FAF9F800FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00A0A0A000ADADAB00FFFFFF00F3F2F200F3F2
      F200F3F2F200F4F3F400F7FBFF00C0804B00CE976300DFB78900C8823600FFFF
      FF00C8833600E1B98C00D2A07000C38650000000000000000000000000000000
      000000000000000000000000000000000000000000000000000048B9F40035B8
      FF002D8DE300000000000000000000000000000000000000000063616000C1C3
      C400565C6300FF9E1F00FFA94300FFB55C00FFBF7000FFC88000FFD48D005659
      5D00C1C3C300636160000000000000000000A0A0A000FFFFFF00484644006360
      600077757300686665004D4B4900F7F8F700F7F8F70049464400636160007775
      7300686564004D4B4900FFFFFF00A0A0A000ADADAB00FFFFFF00F0F0EF00F0F0
      EF00F0F0EF00F0F1F000F2F5F600EBE6E100AB520500CB945E00E9CBAA00E8CA
      A800EACEAF00CF9C6B00AE591100000000000000000000000000000000003938
      D2003A39D30000000000000000003A39D3003938D200000000000000000046A1
      DF0036B9FF003289D90000000000000000000000000000000000625F5F005E5C
      5C00595B60004E576500475364004651610046505F0047515F004E556000595A
      5E005E5B5C00625F5F000000000000000000A0A0A000FFFFFF00FDFCFB00FFFF
      FF00FFFFFF00FFFFFF00FDFCFB00F4F3F200F4F3F200FDFCFB00FFFFFF00FFFF
      FF00FFFFFE00FCFBFA00FFFFFF00A0A0A000ADADAB00FFFFFF00EEECEB00EEED
      EC00EEEDEC00EEEDEC00EEEEED00F0F2F400E8E2DE00BD7F4800A7480000AA4E
      0000AD550A00C4865000000000000000000000000000000000003734CF007191
      FF003837D10000000000000000003837D1007191FF003734CF00000000000000
      00004091D40036B3FF003886D100000000000000000000000000615D5C00C2C4
      C50054575D00FFB65500FFB45D00FCBE7600FAC17D00FFB86400FFB049005558
      5D00C2C4C500615D5C000000000000000000A0A0A000FFFFFF00494644006361
      600078767400696766004F4C4A00F2F2F100F2F2F1004A474500646261007876
      7400686665004E4B4900FFFFFF00A0A0A000ADADAB00FFFFFF00EAE9E900EBEA
      EA00EBEAEA00EAE9E900F4F4F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00AFBB
      C30000000000000000000000000000000000000000003633CF006485FF006586
      FF003836D10000000000000000003836D1006586FF006485FF003633CF000000
      000000000000408ACF0037A6F4004589CB0000000000000000005F5D5C005A59
      59004F555C00FFB55900FBB97000F4B56C00F3B56D00F8AF5D00FFAB46005055
      5D005A5959005F5D5C000000000000000000A0A0A000FFFFFF00F6F5F400FBFA
      F900FBFAF900FBFAF900F7F6F500EFEEED00EFEEED00F8F7F600FBFAF900FBFA
      F900FAF9F800F6F5F400FFFFFF00A0A0A000ADADAB00FFFFFF00E7E7E600E8E8
      E700E8E8E700E6E7E500FFFFFF00CBCCCB00A7A7A500A6A7A500FFFFFF00AFB3
      B400000000000000000000000000000000003836D1006F8EFF00587AFF003632
      CE00000000000000000000000000000000003632CE00587AFF006F8EFF003836
      D1000000000000000000468ACD0072A7DA0000000000000000005D5B5A00C2C4
      C6004D545C00FFAD4900FAB87000F7C18400F6BE7E00F9B16200FFB153004D52
      5900C2C4C5005D5B5A000000000000000000A0A0A000FFFFFF00484643006260
      5F0077757300686564004E4C4900EBECEB00ECECEB0049474400636060007775
      7300676564004D4B4800FFFFFF00A0A0A000AEAEAB00FFFFFF00E4E3E200E5E4
      E300E5E4E300E4E3E200FFFFFF00A7A7A400EBEBEA00FFFFFF00E9E9E900CACA
      CA00000000000000000000000000000000003735D10088A2FF004B70FD003632
      CE00000000000000000000000000000000003632CE004B70FD0088A2FF003735
      D1000000000000000000000000000000000000000000000000005D5A59005755
      56004D535B00FFA43600FFB05B00FBBB7500FDC38700FFCC9500FFD89C004D50
      5500575555005D5A59000000000000000000A0A0A000FFFFFF00E8E7E600EAE9
      E800EAE9E800EAE9E800E9E7E600E5E4E300E5E4E300E9E8E700EAE9E800EAE9
      E800EAE9E800E8E7E600FFFFFF00A0A0A000AEAEAC00FFFFFF00E0DFDE00E1DF
      DE00E1DFDE00E0DFDE00FFFFFF00A5A5A300FFFFFF00E8E8E800CBCBC9000000
      000000000000000000000000000000000000000000003431CF00A4BAFF00416B
      FF003836D10000000000000000003836D100416BFF00A4BAFF003431CF000000
      00000000000000000000000000000000000000000000000000005A595800C4C6
      C7004E545A00FFA12000FFAB4400FFB75D00FFC17100FFCB8100FFD78F004E51
      5400C4C5C6005A5958000000000000000000A2A2A200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00A2A2A200AFAFAD00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E9E9E900CACAC900000000000000
      00000000000000000000000000000000000000000000000000003330D000C5D9
      FF003635D20000000000000000003635D200C5D9FF003330D000000000000000
      00000000000000000000000000000000000000000000000000005B5958005958
      5700575859004F545B004C525B004B5158004B5056004C5055004F5255005756
      5700595757005B5958000000000000000000ABABAB00A2A2A200A0A0A0009F9F
      9F009F9F9F009F9F9F009F9F9F009F9F9F009F9F9F009F9F9F009F9F9F009F9F
      9F009F9F9F00A0A0A000A2A2A200ABABAB00B8B8B600B0B0AD00AEAEAC00AEAE
      AB00AEAEAB00ADAEAB00AEAEAB00AFAFAD00B7B7B50000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003635
      D2003938D30000000000000000003938D3003635D20000000000000000000000
      00000000000000000000000000000000000000000000000000008E8C8C005B59
      5800929191000000000000000000000000000000000000000000000000009291
      90005B5958008E8C8C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BCBCBC00B2B2B200B0B0B000AFAF
      B000AFAFB000AFAFB000AFAFB000AFAFB000AFAFB000AFAFB000AFAFB000AFAF
      B000AFAFB000B0B0B000B2B2B200BCBCBC00BCBCBC00B2B2B200B0B0B000AFAF
      B000AFAFB000AFAFB000AFAFB000AFAFB000AFAFB000AFAFB000AFAFB000AFAF
      B000AFAFB000B0B0B000B2B2B200BCBCBC000000000000000000000000000000
      000000000000BA8D5300B16E1900B16E1900BB8E540000000000BB8E5400B16E
      1900B16E1900BA8D530000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B2B2B200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B2B2B200B2B2B200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B2B2B2000000000000000000000000000000
      000000000000B16E1900F7C67800EEBA6C00B16E190000000000B16E1800F7C6
      7800F7C67800B16E180000000000000000000000000000000000000000000000
      000000C68400008A4A0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B0B0B000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B0B0B000B0B0B000FFFFFF00FEFFFF00FFFF
      FF00FFFFFF00FFFFFF00FEFFFF00FEFEFF00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FDFEFE00FFFFFF00B0B0B0000000000000000000000000000000
      000000000000B06D1700F1BE7000F2BE7000B06D170000000000B06D1700F1BE
      6F00F1BE6F00B06D1700000000000000000000000000000000000000000000BE
      800000E4A6000088470000000000000000000000000000000000000000000000
      000000000000000000000000000000000000AFAFAF00FFFFFF00FFFFFF00403E
      3C0052504D005D5A580066646300716F6D0074726F006A6765005F5D5C005452
      4F0043403F00FFFFFF00FFFFFF00AFAFAF00AFAFAF00FFFFFF00FCFFFF00C674
      1A00C87A2400C7751C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FDFCFC00FFFFFF00AFAFAF000000000000000000000000000000
      000000000000B06D1700EDB96B00EDB96B00B06D170000000000B06D1700EDB9
      6B00EDB96B00B06D17000000000000000000000000000000000000BC800000D8
      A00000D9A100008342000087460000884700008A480046A37900000000000000
      000000000000000000000000000000000000AFAFAF00FFFFFF00FDFEFE00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FDFDFE00FFFFFF00AFAFAF00AFAFAF00FFFFFF00F8FCFF00E0BE
      9600CD853500EBD3BC00FFFFFF00434140005A5855006C6A6800716E6C005E5B
      590046444300FCFDFD00FFFFFF00AFAFAF000000000000000000000000000000
      000000000000B06D1700EBB56800EBB56800B06D170000000000B06D1700EBB5
      6800EBB56800B06D170000000000000000005187460000B9810000D39F0000D0
      9C0000D09C0000D59F0000D7A00000D7A00040E8C20000884600C9803F00B880
      3F00B57F3F00B6804000B8834200BA854500B0B0B000FFFFFF00FCFCFB004340
      3F0055535000605D5B006967660074727000777472006D6A680062605F005755
      530045434200FCFCFB00FFFFFF00B0B0B000B0B0B000FFFFFF00F6F8F900F8FF
      FF00F1EBE600C8781F00FAFFFF00FDFEFE00FFFFFE00FFFFFE00FEFFFE00FFFF
      FE00FCFDFB00F7F7F600FFFFFF00B0B0B0000000000000000000000000000000
      000000000000B06D1800E9B16500E9B16500B06D180000000000B06D1800E9B1
      6500E9B16500B06D18000000000000000000008A480060E6CD0000CA9A0000C8
      980000C7970000C8990000C8990000C899006BE7CF0000834000FFDC9F00FBD9
      9D00F8D89C00FCE1A800E4C18600B9844400B0B0B000FFFFFF00F9F7F600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F8F7F600FFFFFF00B0B0B000B0B0B000FFFFFF00F3F4F600D293
      4F00D9AA7600CF8F4700F5F8FB00F4F4F300F4F3F200F4F3F200F4F3F200F4F3
      F200F4F2F100F2F1F000FFFFFF00B0B0B0000000000000000000000000000000
      000000000000B06D1700E5AD6100E5AD6100B06E180000000000B06E1800E5AD
      6100E5AD6100B06E180000000000000000000000000000B381005DE0C60000C3
      970093E8D8004DE6D1004EE7D3004AE8D40090EDE20000823F00FFD08C00F6CC
      8900F4CB8700FBE1AE00B47D3C00D1AF8400B0B0B000FFFFFF00F6F6F5004442
      410056545100605E5C006A67670075737000787673006E6B6900636160005856
      540046444300F6F6F500FFFFFF00B0B0B000B0B0B000FFFFFF00EFF1F100F1F6
      FA00F2FAFF00F2F7FC00F1F2F300F1F1F000F1F1F000F1F1F000F1F1F000F1F1
      F000F0F0EF00EFEFEE00FFFFFF00B0B0B000000000000000000000000000B373
      1F00B16E1800AE6B1400E2A85B00E3A95C00B16E180000000000B16E1800E3A9
      5D00E3A95D00B16E18000000000000000000000000004885430000AC7D0055D9
      C30080E4D50000813A0000833F000082400000834100489D5900FFC67F00F4C3
      7C00F2C27900FCDFAA00B57F3E0000000000B0B0B000FFFFFF00F3F2F100FEFD
      FC00FFFFFF00FFFFFF00FFFFFF00FFFFFE00FFFFFE00FFFFFF00FFFFFF00FFFF
      FF00FDFCFC00F3F2F100FFFFFF00B0B0B000B0B0B000FFFFFF00EDEDED00EFF2
      F700C7741800F0F3F800F1F1F100F5F4F300F7F6F500F6F5F400F6F5F400F7F6
      F500F5F4F300EFEEED00FFFFFF00B0B0B0000000000000000000B4731D00D598
      4B00E1A45A00DFA35800DEA15500E1A45900B16E180000000000B16E1800E1A4
      5900E1A45900B16E1800000000000000000000000000D08240005AAD730000A6
      790070E1D50000844100FFC27300FFC07300FFBF7300FFBE7200F7BC7100F2BB
      6E00F2BA6B00FFE8BF00B57F3E0000000000B0B0B000FFFFFF00F0F0EF004543
      420056545200615F5D006B69680076747100787674006E6C6A00636160005957
      540047454400F0F0EF00FFFFFF00B0B0B000B0B0B000FFFFFF00E9EBEB00ECF2
      F800C9781E00EDF3F800F0F2F200454341005D5A58006F6D6B0073716E00605E
      5C0049474600EFEFEE00FFFFFF00B0B0B00000000000B2721E00D3944600DC9F
      5300DA9D5200D99D5100DA9D5100DDA05500B16F190000000000B16F1900DDA1
      5600DDA15600B16F1900000000000000000000000000BF844500FFD6AA0054AC
      710000A37C0000824000FFB66000F8B45F00F5B45F00F4B45F00F3B35E00F2B2
      5C00FBD09400F2D3A800B783440000000000B0B0B000FFFFFF00EDECEB00F8F7
      F600FDFCFB00FCFCFB00FBFAF900FAF9F800F9F9F800FBFAF900FCFBFA00FCFC
      FB00F8F7F600EDECEB00FFFFFF00B0B0B000B0B0B000FFFFFF00E8E8E900EBF1
      F800CA7A2100EBEFF500ECECEC00F0EFEE00F2F1F000F1F0EF00F1F0EF00F2F1
      F000F0EFEE00EAE9E800FFFFFF00B0B0B00000000000B26E1800DEA35E00D898
      4D00D7984D00D7984D00D7984D00DA9C5200B26F190000000000B26F1900DB9C
      5300DB9C5300B26F190000000000000000000000000000000000C0884700FFD7
      AF00FFF0CC00FFE5B800FFE4B800FFE3B800FFE3B800FFE3B800FFE2B700FFEE
      CD00F5D5AE00BA8746000000000000000000B0B0B000FFFFFF00EAEAE9004442
      410055535100605E5C006967660075727000787573006D6B680062605F005855
      530047444300E9EAE900FFFFFF00B0B0B000B0B0B000FFFFFF00E4E7E900CF93
      4F00CA781E00E6EBEF00E5E7E600E6E6E500E6E7E600E6E7E600E6E6E500E6E7
      E600E5E6E500E3E4E200FFFFFF00B0B0B00000000000B26E1700E7BB8900D593
      4600D5934700D5944800D5944900D8984D00B16E180000000000B16E1800D898
      4D00D8984E00B26F19000000000000000000000000000000000000000000BA83
      4400B87F3E00B77F3E00B57F3E00B57F3E00B47F3E00B47F3E00B47F3E00B57F
      3E00B7834400000000000000000000000000B0B0B000FFFFFF00E3E2E100E9E8
      E600EBEAE900EBEAE900EAE9E800E9E8E700E9E8E700EAE9E800EBEAE900EBEA
      E900E9E8E600E3E2E100FFFFFF00B0B0B000B0B0B000FFFFFF00E0E1E100E2E5
      E800DDD0C100E2E3E400E1E0DF00E1E0DF00E1E0DF00E1E0DF00E1E0DF00E1E0
      DF00E1DFDE00E0DFDE00FFFFFF00B0B0B00000000000B4731E00CD985900E5BB
      8C00DBA56900D6995500D6995500D99B5800AF6B1300B16D1500AF6B1300D99C
      5900DAA15F00B26F180000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B2B2B200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B2B2B200B2B2B200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B2B2B2000000000000000000B26F1800BD80
      3200D19D5E00DFAF7A00E1B38000E2B48100E3B68300E4B68400E3B68300E2B4
      8200E4B78500B26F180000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BABABA00B2B2B200B0B0B000B0B0
      B000B0B0B000B0B0B000B0B0B000B0B0B000B0B0B000B0B0B000B0B0B000B0B0
      B000B0B0B000B0B0B000B2B2B200BABABA00BABABA00B2B2B200B0B0B000B0B0
      B000B0B0B000B0B0B000B0B0B000B0B0B000B0B0B000B0B0B000B0B0B000B0B0
      B000B0B0B000B0B0B000B2B2B200BABABA000000000000000000000000000000
      0000B5752100B26E1600B16E1600B16E1600B16E1600B26E1600B16E1600B16E
      1600B26F18000000000000000000000000000000000000000000000000000000
      000000000000000000004E64760047658300478BD80000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A4A4A4008D8D8D008A8A8A008A8A
      8A008A8A8B008B8B8C00507B99007EA5B5008BD3FF00235E96008A8A8A008A8A
      8A008A8A8A008D8D8D00A4A4A400000000009F9F9F0084848400828282008181
      8100818181008181810081818100828282008282820082828200828282008282
      8200828282008484840094949400000000000000000000000000B6813C00B47F
      3A00B37D3A00B47F3A00B6803C000000000000000000B6803C00B47F3A00B27D
      3A00B27D3A00B47F3A00B6803C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008D8D8D00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0035A5EB0088E3FF007ED3FF000D96FF00255D9100FFFF
      FF00FFFFFF00FFFFFF008D8D8D000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084848400000000000000000000000000B57F3B00FFC0
      6E00FBBC6900FCBB6900B37E3A000000000000000000B9833E00FDBF6E00F9B7
      6300F9B86400FDBF6E00B57F3B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008B8B8B00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6A584009E6932001D6DC0003DC3FF0029A9FF001398FF002A61
      9500FFFFFF00FFFFFF008B8B8B000000000082828200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0042404000FFFFFF0029262600FFFF
      FF00FFFFFF00FFFFFF0082828200000000000000000000000000B47F3A00C08A
      4400CC975100F8BB6C00BA843D000000000000000000B9823E00D0995200F4B2
      5F00F4B56500D0984F00B57F3B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008A4A0000C6
      8400000000000000000000000000000000008B8B8B00FFFFFF00FFFFFF008081
      820083878A00A16A3200F0D9BB00E0BC8F002270C00042C5FF002BAAFF00129B
      FF0029669F00FFFFFF008B8B8B000000000081818100FFFFFF00FFFFFF00FFFF
      FF005B595900211F2000FFFFFF00FFFFFF00767575007371710036343500FFFF
      FF006C696900FFFFFF0083838300000000000000000000000000000000000000
      0000B27C3800E9B47100E5AE6600000000000000000000000000AF7B3700F2AF
      5B00F4BA6F00B17C380000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000088470000E4
      A60000BE80000000000000000000000000008B8B8B00FFFFFF00FEFEFE008383
      8400FFFFFF00CFB08C00AD794100AD794100CCAD8A002270C1003FC5FF0020AA
      FF0083B0D7007E7871008B8B8B000000000081818100FFFFFF00FFFEFE001C19
      1B00FFFFFF0059575700FFFFFF00FFFFFF003F3D3E003C3B3B003C3A3B002D2D
      2C00312E3000FFFFFF008383830000000000D0924800CF904400D09145000000
      000000000000BF8B4A00F8C07C00C0873E00B17B3600B17B3600AF793500F0AC
      5700F4BE7900B27C380000000000000000000000000000000000000000000000
      0000000000000000000046A37900008A480000884700008746000083420000D9
      A10000D8A00000BC800000000000000000008B8B8B00FFFFFF00FAFAFA008383
      8300FDFFFF00FAFFFF00FCFFFF00FCFFFF00F9FEFF00F4F7F9001C70C400ADD9
      EF0092887F00C1BFB800777C6E000000000082828200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B7B8B6003B3B3B008A8B8B0035323400FFFF
      FF00FFFFFF00FFFFFF008282820000000000CF904500FFFACA00F4D19600CF98
      560000000000B37D3800DDAF7300F2B56800F6C68A00F9C98F00F8C98F00ECA7
      5300F3C28300B27C37000000000000000000BA854500B8834200B6804000B57F
      3F00B8803F00C9803F000088460040E8C20000D7A00000D7A00000D59F0000D0
      9C0000D09C0000D39F0000B98100518746008B8B8B00FFFEFE00F8F7F6008585
      8500FFFFFF00C2A280009F6A34009F6A3400C0A07E00F5F7F900F6F5F4007F78
      7200E9E6E200888B8200BA7AB6009869CA0083838300FFFFFF00767575002826
      2700FFFFFF0022212100FFFFFF004A4A4A00E7E7E500424242002A282900FFFF
      FF00F9F9F800FFFFFF008282820000000000CF914600D49A5200FFE7B500D699
      4F000000000000000000B7823F00F4C78E00C68B4100B8813800B27F3F00EBA6
      5000F4C68D00B37C37000000000000000000B9844400E4C18600FCE1A800F8D8
      9C00FBD99D00FFDC9F00008340006BE7CF0000C8990000C8990000C8990000C7
      970000C8980000CA9A0060E6CD00008A48008B8C8C00FEFDFD00F5F4F3008787
      8800878B8F00A26C3400F0DABC00E1BD90009E693100F5F8FB005F6061009E9F
      9F007B7C7500E1B0DF00CB96C600AE7DCE0083838300FFFFFF0025222300312F
      30002E2C2D002A282900FFFFFF0054545400FFFFFF003B3C3C00FFFFFF00F0EF
      EE0022212100FFFFFF0083838300000000000000000000000000E3B37400FADA
      9F00D89D5400D08E4100B67B3300D2A56D00E7B373000000000000000000EAA3
      4E00F4CA9700B37C36000000000000000000D1AF8400B47D3C00FBE1AE00F4CB
      8700F6CC8900FFD08C0000823F0090EDE2004AE8D4004EE7D3004DE6D10093E8
      D80000C397005DE0C60000B38100000000008C8C8C00FDFCFC00F1F1F0008687
      8800F7FAFC00CBAB8900AE7A4000AD7A4000C8A88500EFF1F200EFEFEE00EFEE
      EC00EEEDEC00BF86D400BE8AD3000000000083838300FFFFFF00FFFFFF002828
      2900FFFFFF0028272800FFFFFF00FFFEFD00FFFFFF009897970028262700FFFF
      FF00C2C1C000FFFFFF0083838300000000000000000000000000CD8D4100FDE3
      B600FFE2A400FFF2CB00F2D7A900B17A3400F2CFA400C28F4C0000000000E6A0
      4900F6CFA200B37C3500000000000000000000000000B57F3E00FCDFAA00F2C2
      7900F4C37C00FFC67F00489D5900008341000082400000833F0000813A0080E4
      D50055D9C30000AC7D0048854300000000008C8C8C00FEFEFF00EFEFF200858A
      8E00F1F4FA00EDF1F700ECEFF400EBEDF200EAEAED00E8E7E800E8E6E600E7E5
      E500E7E5E500FCFBFB008C8C8C000000000083838300FFFFFF00161517001D1C
      1D00FCFBFA001F1E1E00211E2000211E2000232122002A2829002E2B2D002422
      230018151700FFFFFF008383830000000000000000000000000000000000E0B2
      7500FFE2AD00DBA25600CD8B3D00CFA26100C7995F00E8C29700C1843700E299
      4200F5D3AA00B27B3400000000000000000000000000B57F3E00FFE8BF00F2BA
      6B00F2BB6E00F7BC7100FFBE7200FFBF7300FFC07300FFC273000084410070E1
      D50000A679005AAD7300D0824000000000008C8C8D00FFFFFF00BC9C7A00A36E
      3700A26D3600BC9C7B00E9EAEE00E9E8E900E9E7E700E8E6E600E6E4E400E3E1
      E100E3E1E100FCFBFB008C8C8C000000000082828200FFFFFF00E8E8E600EAEA
      E800E8E8E600ECECEA00F2F2F000F8F8F600FDFDFA00FFFFFF00201E2000F6F7
      F400EAEAE800FFFFFF008282820000000000000000000000000000000000CD8D
      4000FCE4BE00E6B87B00CB8E4600FCE3BA00B1762D00E4C49B00EBB57500E3A5
      5A00F9E2C500B37A3300000000000000000000000000B7834400F2D3A800FBD0
      9400F2B25C00F3B35E00F4B45F00F5B45F00F8B45F00FFB660000082400000A3
      7C0054AC7100FFD6AA00BF844500000000008C8D8D00FFFFFF009F693100F0DA
      BC00E2BE9100A06A3300E8E9EC0062636400A2A3A300A1A1A100E0DEDD00E0DE
      DD00E0DDDC00FCFDFB008C8C8C000000000082828200FFFFFF00DCDAD800DDDC
      D900DDDCDA00DFDEDC00E5E4E200131213001A1919001A191A0083828100E5E4
      E200DDDCD900FFFFFF0082828200000000000000000000000000000000000000
      0000E1B47C00F6D4A300E2AD6700FFF1D200BF813500C1925500FAE6CC00FAE4
      C900FDE7CC00B47C350000000000000000000000000000000000BA874600F5D5
      AE00FFEECD00FFE2B700FFE3B800FFE3B800FFE3B800FFE4B800FFE5B800FFF0
      CC00FFD7AF00C088470000000000000000008C8D8D00FFFFFF00C4A47F00AE7A
      4100AF7B4100C5A58100E2E2E300E2E0E000E2E0DF00E1DFDE00E0DEDD00DDDB
      D900DCDAD900FFFEFE008C8C8C000000000082828200FFFFFF00D4D3D000D5D4
      D200D5D4D200D6D5D300D9D8D600E0DFDC00E3E2DF00E2E1DE00DEDDDA00D8D7
      D400D5D4D100FFFFFF0082828200000000000000000000000000000000000000
      0000CD8C3F00FBE6C600FBD29100FFF6E100CF8D3E0000000000B37B3400B37A
      3200B47C3400000000000000000000000000000000000000000000000000B783
      4400B57F3E00B47F3E00B47F3E00B47F3E00B57F3E00B57F3E00B77F3E00B87F
      3E00BA8344000000000000000000000000008E8F8F00FFFFFF00F7F7FA00F7F9
      FD00F7F9FE00F7F7FA00F5F4F500F5F3F300F5F3F300F5F3F300F5F3F300F4F2
      F200F4F2F200FFFFFF008E8E8E000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084848400000000000000000000000000000000000000
      000000000000E1B68100FFFEF300FFFFF500D08F410000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000999999008E8F8F008D8D8E008D8D
      8E008D8E8E008D8D8E008C8D8D008C8D8D008C8D8D008C8D8D008C8D8D008C8C
      8D008C8D8D008E8E8E0099999900000000009191910085858500828282008282
      8200828282008282820082828200828282008282820082828200828282008282
      8200828282008585850091919100000000000000000000000000000000000000
      000000000000D3995200CD8D3F00CE8E40000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000008B
      4800008B4900008C4C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001C2D
      AD002131AD002233AD00000000000000000000000000C19C7000BA864500B984
      4400B7814100B6803F00B57F3F00B57F3F00B57F3F00B57F3F00B57F3F00B57F
      3F00B6803F00B7824100BC905900000000000000000000000000000000000000
      000000000000A59180008E7055008D6E53008D6E53008D6E53008D6E53008D6E
      53008D6E53008D6E53008E715600977C6300A4A4A4008D8D8D008A8A8A008A8A
      8A008A8A8B008B8B8C008B8C8D008B8C8D008B8B8C006DC29B000094520000BA
      840077E0C60000BB860000995C0000000000A4A4A4008D8D8D008A8A8A008A8A
      8A008A8A8B008B8B8C008B8C8D008B8C8D008B8B8C00818BD6001B31BF00365D
      FA003961FE003960FA00283EC1000000000000000000BA864500C89D6200B680
      3F00FBDDA600F6D69E00F6D69D00F6D69D00F6D69D00F6D69D00F6D69D00F6D6
      9D00F6D69E00FBDDA700B7824100000000000000000000000000000000000000
      0000000000008C6C5000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008F7156008D8D8D00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00007F360000BE880000BC
      8300FFFFFF0000BC830000C18D00008C4C008D8D8D00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000317A5003D61FB003C60
      FB003A5EF9003D61FB004366FD001E30AD0000000000BA854500C89C6100B57E
      3D00F8DAA400F2D09500F1CF9400F2D09400F1CF9400F0CE9400F0CE9400F0CE
      9400F1CF9500F7DAA400B6803F0000000000B6B7B600B1B3B200B0B1B000B0B2
      B200B2B6B60088664800FFFFFF00848586007D7E7E009C9C9D007F8080007F80
      80009B9B9C0078797A00FFFFFF008D6E53008B8B8B00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6A584009E6932009E693200C4A48200007F370072E5CB00FFFF
      FF00FFFFFF00FFFFFF0077E7CE00008B49008B8B8B00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6A584009E6932009E693200C4A482000417A400A7B9FF00FFFF
      FF00FFFFFF00FFFFFF00ACBDFF001B2DAC0000000000BA854500C89C6000B57E
      3C00FADDA600F0CD9100F0CD9100F0CD9100F0CD9100F0CD9100EFCC9100EFCC
      9100F0CD9100F7DBA700B57F3E0000000000B0B0AE00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0084624400FFFFFF008687870062626200FFFFFF00646464006464
      6400FFFFFF005A5B5B00FFFFFF008D6E53008B8B8B00FFFFFF00FFFFFF008081
      820083878A00A16A3200F0D9BB00E0BC8F009D672F00007E360000CA940000C8
      8F00FFFFFF0000C9900000CD9900008C4B008B8B8B00FFFFFF00FFFFFF008081
      820083878A00A16A3200F0D9BB00E0BC8F009D672F000115A4005876FE005876
      FF005473FE005877FF005F7CFF001D2EAD0000000000BA854500C89C6000B67F
      3C00FFE3A800F1CA8B00F1CA8B00F1CA8B00F1CA8B00F1CA8B00EFC98C00EFC9
      8C00F0CA8D00F8DCAB00B57F3E0000000000AEAEAB00FFFFFF00FCFCFC00FDFD
      FD00FFFFFF0083614300FFFFFF00646566007B7B7B00999898007B7B7C007B7B
      7C009796960074757600FFFFFF008D6E52008B8B8B00FFFFFF00FEFEFE008383
      8400FFFFFF00CFB08C00AD794100AD794100CCAD8A0063B68F00009B590000D1
      9A0074EED40000D49F0000A36700000000008B8B8B00FFFFFF00FEFEFE008383
      8400FFFFFF00CFB08C00AD794100AD794100CCAD8A00F5F7F900263BC3006B84
      FF00748CFF00718AFF00384DC8000000000000000000BA854500C89C6000B77F
      3B00FFE9A900EFC68100EFC68100EFC68100EFC68100EFC68100ECC48200EDC6
      8400EEC88800F8DDAF00B57F3E0000000000ADADAB00FFFFFF00F8F7F700FAF9
      F900FFFFFF0082614200FFFFFF00F2F4F700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008D6E53008B8B8B00FFFFFF00FAFAFA008383
      8300FDFFFF00FAFFFF00FCFFFF00FCFFFF00F9FEFF00F4F7F90062B58E000080
      370000843E0000894700398D6700000000008B8B8B00FFFFFF00FAFAFA008383
      8300FDFFFF00FAFFFF00FCFFFF00FCFFFF00F9FEFF00F4F7F900F5F7F9000518
      A6000F21AA00192BAD004B56A1000000000000000000BA854500C89C6000B880
      3A00FFEDAC00EEC48300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00EEC48300F8DEB200B57F3E0000000000ADADAB00FFFFFF00F5F4F400F6F5
      F500FAFBFC00B09D8A0083624300846345008462440084624400856345008867
      4A008B6C4F008C6D52008D6F5400C0B0A2008B8B8B00FFFEFE00F8F7F6008585
      8500FFFFFF00C2A280009F6A34009F6A3400C0A07E00F5F7F900F6F5F400F5F4
      F200F4F3F200FFFEFE008C8C8C00000000008B8B8B00FFFEFE00F8F7F6008585
      8500FFFFFF00C2A280009F6A34009F6A3400C0A07E00F5F7F900F6F5F400F5F4
      F200F4F3F200FFFEFE008C8C8C000000000000000000BA854500C89C6000B77F
      3A00FFEEAF00EDBE7300EDBE7300EDBE7300EDBE7300EDBE7300EABC7400EBBE
      7800EDC38000F9DFB600B57F3D0000000000ADADAB00FFFFFF00F2F1F100F2F1
      F100F4F4F400F7F8F900F6F7F900F7F8FA00F6F7FA00F6F7FA00FFFFFF00B3B7
      B800000000000000000000000000000000008B8C8C00FEFDFD00F5F4F3008787
      8800878B8F00A26C3400F0DABC00E1BD90009E693100F5F8FB005F6061009E9F
      9F009C9D9D00FFFEFE008C8C8C00000000008B8C8C00FEFDFD00F5F4F3008787
      8800878B8F00A26C3400F0DABC00E1BD90009E693100F5F8FB005F6061009E9F
      9F009C9D9D00FFFEFE008C8C8C000000000000000000BA854500C89C6000B77F
      3A00FFEFB400EDC27D00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00EDC27D00F9E1BB00B57F3D0000000000ADADAB00FFFFFF00EFEDEE00EFEE
      EE00EFEEEE00EFEFEF00EFEFEF00EFEFEF00EFEFEF00F0EFF000FFFFFF00AFB2
      B3000000000000000000AC6E3100000000008C8C8C00FDFCFC00F1F1F0008687
      8800F7FAFC00CBAB8900AE7A4000AD7A4000C8A88500EFF1F200EFEFEE00EFEE
      EC00EEEDEC00FDFCFC008C8C8C00000000008C8C8C00FDFCFC00F1F1F0008687
      8800F7FAFC00CBAB8900AE7A4000AD7A4000C8A88500EFF1F200EFEFEE00EFEE
      EC00EEEDEC00FDFCFC008C8C8C000000000000000000BA854500C89B6000B77F
      3A00FFF1B800EFC07900EFC07900EFC07900EFC07900EFC07900EBBE7A00ECBF
      7C00EDC07E00FBE4BF00B57F3D0000000000ADADAB00FFFFFF00EBEAEA00ECEB
      EB00ECEBEB00EBE9E900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ADB2
      B50000000000AC6E3100AC6E3100000000008C8C8C00FEFEFF00EFEFF200858A
      8E00F1F4FA00EDF1F700ECEFF400EBEDF200EAEAED00E8E7E800E8E6E600E7E5
      E500E7E5E500FCFBFB008C8C8C00000000008C8C8C00FEFEFF00EFEFF200858A
      8E00F1F4FA00EDF1F700ECEFF400EBEDF200EAEAED00E8E7E800E8E6E600E7E5
      E500E7E5E500FCFBFB008C8C8C000000000000000000BA854500C89B6000B77F
      3900FFF4BD00EFC37D00EFC37D00EFC37D00EFC37D00EFC47F00ECC18000ECC1
      8000ECC07E00FBE6C500B57F3C0000000000ADADAB00FFFFFF00E8E7E700E9E8
      E800E9E8E800E7E6E600FFFFFF00CBCBCA00A6A6A400A5A5A200FFFFFF00AEB4
      B800B9773100BC7E3D00AC6E3100000000008C8C8D00FFFFFF00BC9C7A00A36E
      3700A26D3600BC9C7B00E9EAEE00E9E8E900E9E7E700E8E6E600E6E4E400E3E1
      E100E3E1E100FCFBFB008C8C8C00000000008C8C8D00FFFFFF00BC9C7A00A36E
      3700A26D3600BC9C7B00E9EAEE00E9E8E900E9E7E700E8E6E600E6E4E400E3E1
      E100E3E1E100FCFBFB008C8C8C000000000000000000BA854500C79B5F00B77F
      3900FFF5C100EFC37D00EFC37D00EFC37D00EFC37D00EFC37D00ECC17E00ECC0
      7D00ECBF7A00FCE8C900B57F3C0000000000AEAEAB00FFFFFF00E4E3E300E5E4
      E400E5E4E400E4E3E300FFFFFF00A6A6A400FBFBFA00FFFFFF00E9E9EB00CCD1
      D30000000000CB8D4600AC6E3100000000008C8D8D00FFFFFF009F693100F0DA
      BC00E2BE9100A06A3300E8E9EC0062636400A2A3A300A1A1A100E0DEDD00E0DE
      DD00E0DDDC00FCFDFB008C8C8C00000000008C8D8D00FFFFFF009F693100F0DA
      BC00E2BE9100A06A3300E8E9EC0062636400A2A3A300A1A1A100E0DEDD00E0DE
      DD00E0DDDC00FCFDFB008C8C8C000000000000000000B9844400C6995D00B77E
      3700FFF7C700EFBF7700EFBF7700EFBF7700EFBF7700EFBF7700ECBD7800ECBD
      7700ECBC7500FDEBCF00B57F3C0000000000AEAEAC00FFFFFF00E0DFDE00E1DF
      DE00E1DFDE00E0DFDD00FFFFFF00A5A5A300FFFFFF00E8E8E900CCCDCD000000
      00000000000000000000AC6E3100000000008C8D8D00FFFFFF00C4A47F00AE7A
      4100AF7B4100C5A58100E2E2E300E2E0E000E2E0DF00E1DFDE00E0DEDD00DDDB
      D900DCDAD900FFFEFE008C8C8C00000000008C8D8D00FFFFFF00C4A47F00AE7A
      4100AF7B4100C5A58100E2E2E300E2E0E000E2E0DF00E1DFDE00E0DEDD00DDDB
      D900DCDAD900FFFEFE008C8C8C000000000000000000B9844200EEDFCB00B87F
      3900FFFBCE00FEEDD000FEEDD000FEEDD000FEEDD000FEEDD000FCECD000FCEC
      D000FCECD000FFF0D500B6813E0000000000AFAFAD00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E9EAEB00BCBDBD00000000000000
      0000000000000000000000000000000000008E8F8F00FFFFFF00F7F7FA00F7F9
      FD00F7F9FE00F7F7FA00F5F4F500F5F3F300F5F3F300F5F3F300F5F3F300F4F2
      F200F4F2F200FFFFFF008E8E8E00000000008E8F8F00FFFFFF00F7F7FA00F7F9
      FD00F7F9FE00F7F7FA00F5F4F500F5F3F300F5F3F300F5F3F300F5F3F300F4F2
      F200F4F2F200FFFFFF008E8E8E000000000000000000BE8D5100B9844200BA84
      4100B77F3B00B77F3B00B77F3B00B77F3B00B77F3B00B77F3B00B57E3C00B57E
      3C00B57F3C00B6813E00BD8C500000000000B8B8B600B0B0AD00AEAEAC00AEAE
      AB00AEAEAB00ADAEAB00AEAEAB00AFAFAE00BCBEBE0000000000000000000000
      000000000000000000000000000000000000999999008E8F8F008D8D8E008D8D
      8E008D8E8E008D8D8E008C8D8D008C8D8D008C8D8D008C8D8D008C8D8D008C8C
      8D008C8D8D008E8E8E009999990000000000999999008E8F8F008D8D8E008D8D
      8E008D8E8E008D8D8E008C8D8D008C8D8D008C8D8D008C8D8D008C8D8D008C8C
      8D008C8D8D008E8E8E0099999900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BA8F6000B8895600B88A
      5700B8895500B5855000B4834C00B4834C00B4834C00B4834C00B4834C00B483
      4C00B4834C00B4834C00B5855000BA805D0000000000BA8F6000B8895600B88A
      5700B8895500B5855000B4834C00B4834C00B4834C00B4834C00B4834C00B483
      4C00B4834C00B4834C00B5855000BA805D0000000000BA8F6000B8895600B88A
      5700B8895500B5855000B4834C00B4834C00B4834C00B4834C00B4834C00B483
      4C00B4834C00B4834C00B5855000BA805D0000000000BA8F6000B8895600B88A
      5700B8895500B5855000B4834C00B4834C00B4834C00B4834C002C7E440000C6
      84000D864600B4834C00B5855000BA805D0000000000BA885100FFDFAA00BC8D
      5800B5844F00EAB46400E4A85300E4A85400E4A85400E4A85400E4A85400E4A8
      5400E4A85400E4A85300EAB46400B585500000000000BA885100FFDFAA00BC8D
      5800B5844F00EAB46400E4A85300E4A85400E4A85400E4A85400E4A85400E4A8
      5400E4A85400E4A85300EAB46400B585500000000000BA885100FFDFAA00BC8D
      5800B5844F00EAB46400E4A85300E4A85400E4A85400E4A85400E4A85400E4A8
      5400E4A85400E4A85300EAB46400B585500000000000BA885100FFDFAA00BC8D
      5800B5844F00EAB46400E4A85300E4A85400E4A85400E4A854000088470000E4
      A60000BE800022894700CC9D5700B5855000888E9700C3CAD40057616E00C697
      5E00B4824B00EAB76C00E3A85200E3A85400FDF9F400FFFFFF00E3A85400E3A8
      5400E3A85400E3A85200EBB86C00B4834C00888E9700C3CAD40057616E00C697
      5E00B4824B00EAB76C00E3A85200E3A85400F8E8D100FFFFFF00FFFFFF00FDF9
      F400E9B97600E3A85200EBB86C00B4834C00888E9700C3CAD40057616E00C697
      5E00B4824B00EAB76C00E3A85200E3A85400F8E8D100FFFFFF00FFFFFF00F6E2
      C600E3A85400E3A85200EBB86C00B4834C00888E9700C3CAD40057616E00C697
      5E00B4824B00EAB76C0037874500008A480000884700008746000088470000D9
      A10000D8A00000BC8000418C4D00B4834C0000000000BC895100AA7A3F00CB9F
      6500B2814B00EDBC7400E3A75200E3A85300F8E8D100FFFFFF00E9B97600E3A8
      5400E3A85300E3A75200EDBC7500B4834C0000000000BC895100AA7A3F00CB9F
      6500B2814B00EDBC7400E3A75200F6E2C600FFFFFF00F8E8D100F0D1A400FFFF
      FF00FDF9F400E3A75200EDBC7500B4834C0000000000BC895100AA7A3F00CB9F
      6500B2814B00EDBC7400E3A75200F0D1A300FFFFFF00FFFFFF00F9EEDD00FFFF
      FF00F4DCBA00E3A75200EDBC7500B4834C0000000000BC895100AA7A3F00CB9F
      6500B2814B00EDBC74000089470043E8C20000D7A00000D7A00000D59F0000D0
      9C0000D09C0000D39F0000B981002F7F450000000000BA885000FFDFA400D0A5
      6800B2804A00EEC07D00E3A85200E3A85400F2D7B000FFFFFF00F2D7B000E3A9
      5500E3A85400E3A85200EEC17E00B4834C0000000000BA885000FFDFA400D0A5
      6800B2804A00EEC07D00E3A85200FDF9F400FFFFFF00E3A95500E3A95500FDF9
      F400FFFFFF00E3A85200EEC17E00B4834C0000000000BA885000FFDFA400D0A5
      6800B2804A00EEC07D00E3A85200E9B97600F6E2C600E9BA7700E3A95500FFFF
      FF00FFFFFF00E3A85200EEC17E00B4834C0000000000BA885000FFDFA400D0A5
      6800B2804A00EEC07D00008845006FE8D00000C8990000C8990000C8990000C7
      970000C8980000CA9A0063E6CD00008A4700888E9700C3CAD400555F6D00D9AE
      6F00B2804A00EFC78A00E4AA5600E4AB5700E8B66D00FFFFFF00FAEEDD00E4AB
      5700E4AB5700E4AA5600F0C88B00B4834C00888E9700C3CAD400555F6D00D9AE
      6F00B2804A00EFC78A00E4AA5600F6E3C700FFFFFF00F1D2A500E8B66D00FFFF
      FF00FDF9F400E4AA5600F0C88B00B4834C00888E9700C3CAD400555F6D00D9AE
      6F00B2804A00EFC78A00E4AA5600E4AB5700F1D2A500FDF9F400FAEEDD00FDF9
      F400FFFFFF00E4AA5600F0C88B00B4834C00888E9700C3CAD400555F6D00D9AE
      6F00B2804A00EFC78A000089460099F0E4004FE9D50051E8D4004DE6D10094E8
      D80000C3970060E0C70000B281003B884A0000000000BC885100A67B3A00DEB5
      7600B17F4900F1CD9700E3AC5700E3AC5700E3AC5700F9EEDD00FFFFFF00E7B7
      6D00E3AC5700E3AC5700F2CD9700B4834C0000000000BC885100A67B3A00DEB5
      7600B17F4900F1CD9700E3AC5700E3AC5700F9EEDD00FFFFFF00FFFFFF00FFFF
      FF00E7B76D00E3AC5700F2CD9700B4834C0000000000BC885100A67B3A00DEB5
      7600B17F4900F1CD9700E3AC5700F0D3A500FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00E3AC5700F2CD9700B4834C0000000000BC885100A67B3A00DEB5
      7600B17F4900F1CD970045934C000089460000874400008642000088470082E4
      D6005ADAC40000AD7F0054A06300B4834C0000000000BA875000FFE09F00E3BB
      7A00B17E4900F3D3A100E3AD5900E3AD5900E3AD5900E7B86F00FFFFFF00F6E4
      C800E3AD5900E3AD5900F4D4A300B4834C0000000000BA875000FFE09F00E3BB
      7A00B17E4900F3D3A100E3AD5900F0D3A600FFFFFF00F9EFDE00F4DEBD00FFFF
      FF00F6E4C800E3AD5900F4D4A300B4834C0000000000BA875000FFE09F00E3BB
      7A00B17E4900F3D3A100E3AD5900FDFAF400FFFFFF00E7B86F00E3AD5900FFFF
      FF00FFFFFF00E3AD5900F4D4A300B4834C0000000000BA875000FFE09F00E3BB
      7A00B17E4900F3D3A1001D31C500283EF0001B2FC100E3AD5900008847007AE4
      D80000AA7F002B904A00F4D4A300B4834C00888E9700C3CAD400545E6D00EBC4
      7F00B17E4900F4D9AD00E3B15E00E3B15E00E3B15E00E3B15E00F2DBB400FFFF
      FF00ECCB9400E3B15E00F5DAAE00B4834C00888E9700C3CAD400545E6D00EBC4
      7F00B17E4900F4D9AD00E3B15E00F6E5C900FFFFFF00F0D5A900E3B15E00FFFF
      FF00FDFAF400E3B15E00F5DAAE00B4834C00888E9700C3CAD400545E6D00EBC4
      7F00B17E4900F4D9AD00E3B15E00FDFAF400FFFFFF00E7BB7300E3B15E00FFFF
      FF00FDFAF400E3B15E00F5DAAE00B4834C00888E9700C3CAD400545E6D00EBC4
      7F00B17E4900F4D9AD001C30C4003046F3001B30C400E3B15E0045944E0000AA
      8500148D4800E3B15E00F5DAAE00B4834C0000000000BC895100A47C3600ECC5
      8100B07E4900F5DEB600E4B26100FDFAF400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00E4B26100F6DFB800B4824C0000000000BC895100A47C3600ECC5
      8100B07E4900F5DEB600E4B26100F1D6AB00FFFFFF00FFFFFF00FBF5EA00FFFF
      FF00F6E5CA00E4B26100F6DFB800B4824C0000000000BC895100A47C3600ECC5
      8100B07E4900F5DEB600E4B26100F1D6AB00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F1D6AB00E4B26100F6DFB800B4824C0000000000BC895100A47C3600ECC5
      8100B07E4900F5DEB6001B30C400374DF4001B31C700E4B26100E4B26100E4B2
      6100E4B26100E4B26100F6DFB800B4824C0000000000BA875000F9D18B00EBC4
      7F00B07D4800F8E3C000E5B56500F8EBD600FDFAF500FDFAF500FDFAF500FDFA
      F500FDFAF500E5B56500F8E5C200B4824C0000000000BA875000F9D18B00EBC4
      7F00B07D4800F8E3C000E5B56500E5B56500F1D8AD00FCF5EA00FDFAF500F5E1
      C100E5B56500E5B56500F8E5C200B4824C0000000000BA875000F9D18B00EBC4
      7F00B07D4800F8E3C000E5B56500E5B56500F1D8AD00FDFAF500FDFAF500F1D8
      AD00E5B56500E5B56500F8E5C200B4824C0000000000BA875000F9D18B00EBC4
      7F00B07D4800F8E3C0001B2FC4003E55F7001B30C700E5B56500E5B56500E5B5
      6500E5B56500E5B56500F8E5C200B4824C00888D9700C1C8D200525A6700EBC3
      7B00B07D4600F9EACB00E6BB6F00E4B96B00E4B86800E4B76800E4B86800E4B8
      6800E4B96B00E6BB6F00FAECCD00B4834C00888D9700C1C8D200525A6700EBC3
      7B00B07D4600F9EACB00E6BB6F00E4B96B00E4B86800E4B76800E4B86800E4B8
      6800E4B96B00E6BB6F00FAECCD00B4834C00888D9700C1C8D200525A6700EBC3
      7B00B07D4600F9EACB00E6BB6F00E4B96B00E4B86800E4B76800E4B86800E4B8
      6800E4B96B00E6BB6F00FAECCD00B4834C00888D9700C1C8D200525A6700EBC3
      7B00B07D4600F9EACB001A2FC400455CF9001A2FC700E4B76800E4B86800E4B8
      6800E4B96B00E6BB6F00FAECCD00B4834C0000000000BA864E00FFF2D400FEF1
      D400B27F4900FEF1D700FCEED300FBEDD200FBEDD200FBEDD200FBEDD200FBED
      D200FBEDD200FCEED300FFF2D800B5844F0000000000BA864E00FFF2D400FEF1
      D400B27F4900FEF1D700FCEED300FBEDD200FBEDD200FBEDD200FBEDD200FBED
      D200FBEDD200FCEED300FFF2D800B5844F0000000000BA864E00FFF2D400FEF1
      D400B27F4900FEF1D700FCEED300FBEDD200FBEDD200FBEDD200FBEDD200FBED
      D200FBEDD200FCEED300FFF2D800B5844F0000000000BA864E00FFF2D400FEF1
      D400B27F4900FEF1D7001930C9004C64FF00192FCA00FBEDD200FBEDD200FBED
      D200FBEDD200FCEED300FFF2D800B5844F0000000000C49C7100B7875200B686
      5200B7875200B5844E00B4824C00B4824B00B4824B00B4824B00B4824B00B482
      4B00B4824B00B4824C00B5844F00BC80600000000000C49C7100B7875200B686
      5200B7875200B5844E00B4824C00B4824B00B4824B00B4824B00B4824B00B482
      4B00B4824B00B4824C00B5844F00BC80600000000000C49C7100B7875200B686
      5200B7875200B5844E00B4824C00B4824B00B4824B00B4824B00B4824B00B482
      4B00B4824B00B4824C00B5844F00BC80600000000000C49C7100B7875200B686
      5200B7875200B5844E00605793002338CB0060579200B4824B00B4824B00B482
      4B00B4824B00B4824C00B5844F00BC8060000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BA8F6000B8895600B88A
      5700B8895500B5855000B4834C00B4834C00B4834C00B4834C00B4834C00B483
      4C00B4834C00B4834C00B5855000BA805D0000000000BA8F6000B8895600B88A
      5700B8895500B5855000B4834C00B4834C00B4834C00B4834C00B4834C00B483
      4C00B4834C00B4834C00B5855000BA805D0000000000BA8F6000B8895600B88A
      5700B8895500B5855000B4834C00B4834C00B4834C00B4834C00B4834C00B483
      4C00B4834C00B4834C00B5855000BA805D0000000000BA8F6000B8895600B88A
      5700B8895500B5855000B4834C00B4834C00B4834C00B4834C00B4834C00B483
      4C00B4834C00B4834C00B5855000BA805D0000000000BA885100FFDFAA00BC8D
      5800B5844F00EAB46400E4A85300E4A85400E4A85400E4A85400E4A85400E4A8
      5400E4A85400E4A85300EAB46400B585500000000000BA885100FFDFAA00BC8D
      5800B5844F00EAB46400E4A85300E4A85400E4A85400E4A85400E4A85400E4A8
      5400E4A85400E4A85300EAB46400B585500000000000BA885100FFDFAA00BC8D
      5800B5844F00EAB46400E4A85300E4A85400E4A85400E4A85400E4A85400E4A8
      5400E4A85400E4A85300EAB46400B585500000000000BA885100FFDFAA00BC8D
      5800B5844F00EAB46400E4A85300E4A85400E4A85400E4A85400E4A85400E4A8
      5400E4A85400E4A85300EAB46400B5855000888E9700C3CAD40057616E00C697
      5E00B4824B00EAB76C00E3A85200E3A85400F8E8D100FFFFFF00FFFFFF00F9EE
      DD00E7B46B00E3A85200EBB86C00B4834C00888E9700C3CAD40057616E00C697
      5E00B4824B00EAB76C00E3A85200E3A85400E3A85400E3A85400F6E2C600FFFF
      FF00F0D1A400E3A85200EBB86C00B4834C00888E9700C3CAD40057616E00C697
      5E00B4824B00EAB76C00E3A85200E3A85400F8E8D100FFFFFF00FFFFFF00F9EE
      DD00E7B46B00E3A85200EBB86C00B4834C00888E9700C3CAD40057616E00C697
      5E00B4824B00EAB76C00E3A85200E3A85400F2D6AF00FFFFFF00FFFFFF00FDF9
      F400E7B46B00E3A85200EBB86C00B4834C0000000000BC895100AA7A3F00CB9F
      6500B2814B00EDBC7400E3A75200F4DCBA00FFFFFF00FDF9F400F9EEDD00FFFF
      FF00F9EEDD00E3A75200EDBC7500B4834C0000000000BC895100AA7A3F00CB9F
      6500B2814B00EDBC7400E3A75200F0D1A300F0D1A400F0D1A400F9EEDD00FFFF
      FF00F4DCBA00E7B36900EDBC7500B4834C0000000000BC895100AA7A3F00CB9F
      6500B2814B00EDBC7400E3A75200F4DCBA00FFFFFF00FDF9F400F8E8D100FFFF
      FF00F9EEDD00E3A75200EDBC7500B4834C0000000000BC895100AA7A3F00CB9F
      6500B2814B00EDBC7400E3A75200F0D1A300FFFFFF00FDF9F400F8E8D100FFFF
      FF00FDF9F400E3A75200EDBC7500B4834C0000000000BA885000FFDFA400D0A5
      6800B2804A00EEC07D00E3A85200F4DCBB00FDF9F400E7B46C00E3A95500FFFF
      FF00FFFFFF00E3A85200EEC17E00B4834C0000000000BA885000FFDFA400D0A5
      6800B2804A00EEC07D00E3A85200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F0D1A300EEC17E00B4834C0000000000BA885000FFDFA400D0A5
      6800B2804A00EEC07D00E3A85200F4DCBB00FDF9F400E7B46C00E3A95500FFFF
      FF00FFFFFF00E3A85200EEC17E00B4834C0000000000BA885000FFDFA400D0A5
      6800B2804A00EEC07D00E3A85200F8E8D100FFFFFF00E7B46C00E3A95500FDF9
      F400FFFFFF00E3A85200EEC17E00B4834C00888E9700C3CAD400555F6D00D9AE
      6F00B2804A00EFC78A00E4AA5600E4AB5700E4AB5700E4AB5700E4AB5700FFFF
      FF00FFFFFF00E4AA5600F0C88B00B4834C00888E9700C3CAD400555F6D00D9AE
      6F00B2804A00EFC78A00E4AA5600FFFFFF00FFFFFF00F1D2A500FAEEDD00FFFF
      FF00F4DDBC00E8B56D00F0C88B00B4834C00888E9700C3CAD400555F6D00D9AE
      6F00B2804A00EFC78A00E4AA5600E9BC7900F4DDBC00E8B66D00E4AB5700FFFF
      FF00FFFFFF00E4AA5600F0C88B00B4834C00888E9700C3CAD400555F6D00D9AE
      6F00B2804A00EFC78A00E4AA5600FDF9F400FFFFFF00EDC78F00E8B66D00FFFF
      FF00FFFFFF00E4AA5600F0C88B00B4834C0000000000BC885100A67B3A00DEB5
      7600B17F4900F1CD9700E3AC5700E3AC5700E3AC5700F2D8B100FFFFFF00FFFF
      FF00ECC88F00E3AC5700F2CD9700B4834C0000000000BC885100A67B3A00DEB5
      7600B17F4900F1CD9700E3AC5700ECC88F00FFFFFF00F0D3A500F6E3C700FFFF
      FF00F0D3A500E3AC5700F2CD9700B4834C0000000000BC885100A67B3A00DEB5
      7600B17F4900F1CD9700E3AC5700F0D3A500FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F9EEDD00E3AC5700F2CD9700B4834C0000000000BC885100A67B3A00DEB5
      7600B17F4900F1CD9700E3AC5700FDF9F400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F2D8B100E3AC5700F2CD9700B4834C0000000000BA875000FFE09F00E3BB
      7A00B17E4900F3D3A100E3AD5900E3AD5900E3AD5900ECC89000FFFFFF00FFFF
      FF00E9BD7A00E3AD5900F4D4A300B4834C0000000000BA875000FFE09F00E3BB
      7A00B17E4900F3D3A100E3AD5900E3AD5900F6E4C800FFFFFF00F8E9D300FFFF
      FF00F0D3A600E3AD5900F4D4A300B4834C0000000000BA875000FFE09F00E3BB
      7A00B17E4900F3D3A100E3AD5900E9BD7A00FFFFFF00FFFFFF00FDFAF400F6E4
      C800E7B86F00E3AD5900F4D4A300B4834C0000000000BA875000FFE09F00E3BB
      7A00B17E4900F3D3A100E3AD5900FDFAF400FFFFFF00F0D3A600F6E4C800F0D3
      A600E3AD5900E3AD5900F4D4A300B4834C00888E9700C3CAD400545E6D00EBC4
      7F00B17E4900F4D9AD00E3B15E00F0D5A900FBF5EA00F0D5A900F0D5A900FFFF
      FF00F6E5C900E3B15E00F5DAAE00B4834C00888E9700C3CAD400545E6D00EBC4
      7F00B17E4900F4D9AD00E3B15E00E3B15E00E3B15E00FFFFFF00FFFFFF00FFFF
      FF00F0D5A900E3B15E00F5DAAE00B4834C00888E9700C3CAD400545E6D00EBC4
      7F00B17E4900F4D9AD00E3B15E00E3B15E00FFFFFF00FFFFFF00E3B15E00E3B1
      5E00E3B15E00E3B15E00F5DAAE00B4834C00888E9700C3CAD400545E6D00EBC4
      7F00B17E4900F4D9AD00E3B15E00F4E0BF00FFFFFF00ECCB9400E7BB7300FDFA
      F400F4E0BF00E3B15E00F5DAAE00B4834C0000000000BC895100A47C3600ECC5
      8100B07E4900F5DEB600E4B26100E9C18100FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F1D6AB00E4B26100F6DFB800B4824C0000000000BC895100A47C3600ECC5
      8100B07E4900F5DEB600E4B26100E4B26100E4B26100E9C18100FFFFFF00FFFF
      FF00F1D6AB00E4B26100F6DFB800B4824C0000000000BC895100A47C3600ECC5
      8100B07E4900F5DEB600E4B26100E4B26100FDFAF400FFFFFF00FFFFFF00FFFF
      FF00F6E5CA00E4B26100F6DFB800B4824C0000000000BC895100A47C3600ECC5
      8100B07E4900F5DEB600E4B26100E8BC7600FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F2DBB500E4B26100F6DFB800B4824C0000000000BA875000F9D18B00EBC4
      7F00B07D4800F8E3C000E5B56500E5B56500F1D8AD00FCF5EA00FDFAF500F1D8
      AD00E5B56500E5B56500F8E5C200B4824C0000000000BA875000F9D18B00EBC4
      7F00B07D4800F8E3C000E5B56500E5B56500E5B56500E5B56500F3DCB700FDFA
      F500EECE9800E5B56500F8E5C200B4824C0000000000BA875000F9D18B00EBC4
      7F00B07D4800F8E3C000E5B56500E5B56500F3DCB700FDFAF500FDFAF500FDFA
      F500F3DCB700E5B56500F8E5C200B4824C0000000000BA875000F9D18B00EBC4
      7F00B07D4800F8E3C000E5B56500E5B56500EAC48400FAF0E000FDFAF500F6E6
      CC00E5B56500E5B56500F8E5C200B4824C00888D9700C1C8D200525A6700EBC3
      7B00B07D4600F9EACB00E6BB6F00E4B96B00E4B86800E4B76800E4B86800E4B8
      6800E4B96B00E6BB6F00FAECCD00B4834C00888D9700C1C8D200525A6700EBC3
      7B00B07D4600F9EACB00E6BB6F00E4B96B00E4B86800E4B76800E4B86800E4B8
      6800E4B96B00E6BB6F00FAECCD00B4834C00888D9700C1C8D200525A6700EBC3
      7B00B07D4600F9EACB00E6BB6F00E4B96B00E4B86800E4B76800E4B86800E4B8
      6800E4B96B00E6BB6F00FAECCD00B4834C00888D9700C1C8D200525A6700EBC3
      7B00B07D4600F9EACB00E6BB6F00E4B96B00E4B86800E4B76800E4B86800E4B8
      6800E4B96B00E6BB6F00FAECCD00B4834C0000000000BA864E00FFF2D400FEF1
      D400B27F4900FEF1D700FCEED300FBEDD200FBEDD200FBEDD200FBEDD200FBED
      D200FBEDD200FCEED300FFF2D800B5844F0000000000BA864E00FFF2D400FEF1
      D400B27F4900FEF1D700FCEED300FBEDD200FBEDD200FBEDD200FBEDD200FBED
      D200FBEDD200FCEED300FFF2D800B5844F0000000000BA864E00FFF2D400FEF1
      D400B27F4900FEF1D700FCEED300FBEDD200FBEDD200FBEDD200FBEDD200FBED
      D200FBEDD200FCEED300FFF2D800B5844F0000000000BA864E00FFF2D400FEF1
      D400B27F4900FEF1D700FCEED300FBEDD200FBEDD200FBEDD200FBEDD200FBED
      D200FBEDD200FCEED300FFF2D800B5844F0000000000C49C7100B7875200B686
      5200B7875200B5844E00B4824C00B4824B00B4824B00B4824B00B4824B00B482
      4B00B4824B00B4824C00B5844F00BC80600000000000C49C7100B7875200B686
      5200B7875200B5844E00B4824C00B4824B00B4824B00B4824B00B4824B00B482
      4B00B4824B00B4824C00B5844F00BC80600000000000C49C7100B7875200B686
      5200B7875200B5844E00B4824C00B4824B00B4824B00B4824B00B4824B00B482
      4B00B4824B00B4824C00B5844F00BC80600000000000C49C7100B7875200B686
      5200B7875200B5844E00B4824C00B4824B00B4824B00B4824B00B4824B00B482
      4B00B4824B00B4824C00B5844F00BC8060000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C19C7000BA864500B984
      4400B7814100B6803F00B57F3F00B57F3F00B57F3F00B57F3F00B57F3F00B57F
      3F00B6803F00B7824100BC9059000000000000000000BA8F6000B8895600B88A
      5700B8895500B5855000B4834C00B4834C00B4834C00B4834C00B4834C00B483
      4C00B4834C00B4834C00B5855000BA805D0000000000BA8F6000B8895600B88A
      5700B8895500B5855000B4834C00B4834C00B4834C00B4834C00B4834C00B483
      4C00B4834C00B4834C00B5855000BA805D0000000000BA8F6000B8895600B88A
      5700B8895500B5855000B4834C00B4834C00B4834C00B4834C00B4834C00B483
      4C00B4834C00B4834C00B5855000BA805D0000000000BA864500C89D6200B680
      3F00FBDDA600F6D69E00F6D69D00F6D69D00F6D69D00F6D69D00F6D69D00F6D6
      9D00F6D69E00FBDDA700B78241000000000000000000BA885100FFDFAA00BC8D
      5800B5844F00EAB46400E4A85300E4A85400E4A85400E4A85400E4A85400E4A8
      5400E4A85400E4A85300EAB46400B585500000000000BA885100FFDFAA00BC8D
      5800B5844F00EAB46400E4A85300E4A85400E4A85400E4A85400E4A85400E4A8
      5400E4A85400E4A85300EAB46400B585500000000000BA885100FFDFAA00BC8D
      5800B5844F00EAB46400E4A85300E4A85400E4A85400E4A85400E4A85400E4A8
      5400E4A85400E4A85300EAB46400B585500000000000BA854500C89C6100B57E
      3D00F8DAA400F2D09500F1CF9400F2D09400F1CF9400F0CE9400F0CE9400F0CE
      9400F1CF9500F7DAA400B6803F0000000000888E9700C3CAD40057616E00C697
      5E00B4824B00EAB76C00E3A85200E3A85400E3A85400E3A85400E3A85400E3A8
      5400E3A85400E3A85200EBB86C00B4834C00888E9700C3CAD40057616E00C697
      5E00B4824B00EAB76C00E3A85200E3A85400E3A85400E3A85400FFFFFF00FDF9
      F400E3A85400E3A85200EBB86C00B4834C00888E9700C3CAD40057616E00C697
      5E00B4824B00EAB76C00E3A85200FBF3E800FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00E3A85200EBB86C00B4834C0000000000BA854500C89C6000B57E
      3C00FADDA600F8D38F00FAD48E00E9C89200F4CF9000F0CD9100EFCC9100EFCC
      9100F0CD9100F7DBA700B57F3E000000000000000000BC895100AA7A3F00CB9F
      6500B2814B00EDBC74006667B400CFB396003745C100E3A85400E3A85400E3A8
      5400E3A85300E3A75200EDBC7500B4834C0000000000BC895100AA7A3F00CB9F
      6500B2814B00EDBC7400E3A75200E3A85300E3A85400E3A85400FFFFFF00FDF9
      F400E3A85300E3A75200EDBC7500B4834C0000000000BC895100AA7A3F00CB9F
      6500B2814B00EDBC7400E3A75200F0D1A300FFFFFF00FFFFFF00FDF9F400FDF9
      F400FDF9F400E3A75200EDBC7500B4834C0000000000BA854500C89C6000B67F
      3C00FFE3A8006667B400CFB396003745C100FBD28900F1CA8B00EFC98C00EFC9
      8C00F0CA8D00F8DCAB00B57F3E000000000000000000BA885000FFDFA400D0A5
      6800B2804A00EEC07D00152DC9000821F000162CC700E3A95500E3A95500E3A9
      5500E3A85400E3A85200EEC17E00B4834C0000000000BA885000FFDFA400D0A5
      6800B2804A00EEC07D00E3A85200E3A85400E3A95500E3A95500FFFFFF00FDF9
      F400E3A85400E3A85200EEC17E00B4834C0000000000BA885000FFDFA400D0A5
      6800B2804A00EEC07D00E3A85200E3A85400F8E8D200FFFFFF00F2D7B000E3A9
      5500E3A85400E3A85200EEC17E00B4834C0000000000BA854500C89C6000B77F
      3B00FFE9A900152DC9000821F000162CC700FFD27F00EFC68100ECC48200EDC6
      8400EEC88800F8DDAF00B57F3E0000000000888E9700C3CAD400555F6D00D9AE
      6F00B2804A00EFC78A001C32C6001930EE001B2FC100E4AB5700E4AB5700E4AB
      5700E4AB5700E4AA5600F0C88B00B4834C00888E9700C3CAD400555F6D00D9AE
      6F00B2804A00EFC78A00E4AA5600E4AB5700E4AB5700E4AB5700FFFFFF00FDF9
      F400E4AB5700E4AA5600F0C88B00B4834C00888E9700C3CAD400555F6D00D9AE
      6F00B2804A00EFC78A00E4AA5600E4AB5700E4AB5700FAEEDD00FFFFFF00F2D8
      B100E4AB5700E4AA5600F0C88B00B4834C0000000000BA854500C89C6000B880
      3A00FFEDAC001C32C6001930EE001B2FC100FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00EEC48300F8DEB200B57F3E000000000000000000BC885100A67B3A00DEB5
      7600B17F4900F1CD97001D32C5002239EF001C2FC100E3AC5700E3AC5700E3AC
      5700E3AC5700E3AC5700F2CD9700B4834C0000000000BC885100A67B3A00DEB5
      7600B17F4900F1CD9700E3AC5700E3AC5700E3AC5700E3AC5700FFFFFF00FDF9
      F400E3AC5700E3AC5700F2CD9700B4834C0000000000BC885100A67B3A00DEB5
      7600B17F4900F1CD9700E3AC5700E3AC5700E3AC5700E3AC5700F9EEDD00FFFF
      FF00F0D3A500E3AC5700F2CD9700B4834C0000000000BA854500C89C6000B77F
      3A00FFEEAF001D32C5002239EF001C2FC100FFCD7200EDBE7300EABC7400EBBE
      7800EDC38000F9DFB600B57F3D000000000000000000BA875000FFE09F00E3BB
      7A00B17E4900F3D3A1001D31C500283EF0001B2FC100E3AD5900E3AD5900E3AD
      5900E3AD5900E3AD5900F4D4A300B4834C0000000000BA875000FFE09F00E3BB
      7A00B17E4900F3D3A100E3AD5900F0D3A600FBF4E900ECC89000FFFFFF00FDFA
      F400E3AD5900E3AD5900F4D4A300B4834C0000000000BA875000FFE09F00E3BB
      7A00B17E4900F3D3A100E3AD5900E3AD5900E3AD5900E3AD5900E3AD5900FFFF
      FF00FFFFFF00E3AD5900F4D4A300B4834C0000000000BA854500C89C6000B77F
      3A00FFEFB4001D31C500283EF0001B2FC100FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00EDC27D00F9E1BB00B57F3D0000000000888E9700C3CAD400545E6D00EBC4
      7F00B17E4900F4D9AD001C30C4003046F3001B30C400E3B15E00E3B15E00E3B1
      5E00E3B15E00E3B15E00F5DAAE00B4834C00888E9700C3CAD400545E6D00EBC4
      7F00B17E4900F4D9AD00E3B15E00E9C17E00FFFFFF00FFFFFF00FFFFFF00FDFA
      F400E3B15E00E3B15E00F5DAAE00B4834C00888E9700C3CAD400545E6D00EBC4
      7F00B17E4900F4D9AD00E3B15E00F2DBB400FFFFFF00F0D5A900E3B15E00FFFF
      FF00FFFFFF00E3B15E00F5DAAE00B4834C0000000000BA854500C89B6000B77F
      3A00FFF1B8001C30C4003046F3001B30C400FFCD7500EFC07900EBBE7A00ECBF
      7C00EDC07E00FBE4BF00B57F3D000000000000000000BC895100A47C3600ECC5
      8100B07E4900F5DEB6001B30C400374DF4001B31C700E4B26100E4B26100E4B2
      6100E4B26100E4B26100F6DFB800B4824C0000000000BC895100A47C3600ECC5
      8100B07E4900F5DEB600E4B26100E4B26100E4B26100FAF0DF00FFFFFF00FDFA
      F400E4B26100E4B26100F6DFB800B4824C0000000000BC895100A47C3600ECC5
      8100B07E4900F5DEB600E4B26100E9C18100FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FDFAF400E4B26100F6DFB800B4824C0000000000BA854500C89B6000B77F
      3900FFF4BD001B30C400374DF4001B31C700FFCF7900EFC47F00ECC18000ECC1
      8000ECC07E00FBE6C500B57F3C000000000000000000BA875000F9D18B00EBC4
      7F00B07D4800F8E3C0001B2FC4003E55F7001B30C700E5B56500E5B56500E5B5
      6500E5B56500E5B56500F8E5C200B4824C0000000000BA875000F9D18B00EBC4
      7F00B07D4800F8E3C000E5B56500E5B56500E5B56500E5B56500FAF0E000F8EB
      D600E5B56500E5B56500F8E5C200B4824C0000000000BA875000F9D18B00EBC4
      7F00B07D4800F8E3C000E5B56500E5B56500EECE9800FCF5EA00FDFAF500F8EB
      D600E8BF7A00E5B56500F8E5C200B4824C0000000000BA854500C79B5F00B77F
      3900FFF5C1001B2FC4003E55F7001B30C700FFCE7600EFC37D00ECC17E00ECC0
      7D00ECBF7A00FCE8C900B57F3C0000000000888D9700C1C8D200525A6700EBC3
      7B00B07D4600F9EACB001A2FC400455CF9001A2FC700E4B76800E4B86800E4B8
      6800E4B96B00E6BB6F00FAECCD00B4834C00888D9700C1C8D200525A6700EBC3
      7B00B07D4600F9EACB00E6BB6F00E4B96B00E4B86800E4B76800E4B86800E4B8
      6800E4B96B00E6BB6F00FAECCD00B4834C00888D9700C1C8D200525A6700EBC3
      7B00B07D4600F9EACB00E6BB6F00E4B96B00E4B86800E4B76800E4B86800E4B8
      6800E4B96B00E6BB6F00FAECCD00B4834C0000000000B9844400C6995D00B77E
      3700FFF7C7001A2FC400455CF9001A2FC700FFCA7200EFBF7700ECBD7800ECBD
      7700ECBC7500FDEBCF00B57F3C000000000000000000BA864E00FFF2D400FEF1
      D400B27F4900FEF1D7001930C9004C64FF00192FCA00FBEDD200FBEDD200FBED
      D200FBEDD200FCEED300FFF2D800B5844F0000000000BA864E00FFF2D400FEF1
      D400B27F4900FEF1D700FCEED300FBEDD200FBEDD200FBEDD200FBEDD200FBED
      D200FBEDD200FCEED300FFF2D800B5844F0000000000BA864E00FFF2D400FEF1
      D400B27F4900FEF1D700FCEED300FBEDD200FBEDD200FBEDD200FBEDD200FBED
      D200FBEDD200FCEED300FFF2D800B5844F0000000000B9844200EEDFCB00B87F
      3900FFFBCE001930C9004C64FF00192FCA00FFF8CB00FEEDD000FCECD000FCEC
      D000FCECD000FFF0D500B6813E000000000000000000C49C7100B7875200B686
      5200B7875200B5844E00605793002338CB0060579200B4824B00B4824B00B482
      4B00B4824B00B4824C00B5844F00BC80600000000000C49C7100B7875200B686
      5200B7875200B5844E00B4824C00B4824B00B4824B00B4824B00B4824B00B482
      4B00B4824B00B4824C00B5844F00BC80600000000000C49C7100B7875200B686
      5200B7875200B5844E00B4824C00B4824B00B4824B00B4824B00B4824B00B482
      4B00B4824B00B4824C00B5844F00BC80600000000000BE8D5100B9844200BA84
      4100C3883700605793002338CB0060579200C2863400B77F3B00B57E3C00B57E
      3C00B57F3C00B6813E00BD8C5000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000004497D1004B9AD20000000000676363006B676700706E
      6C00000000000000000000000000676363006A676500706E6C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000706E6C006A6765006763630000000000000000000000
      0000706E6C006B6767006763630000000000B1B1B100A2A2A200A09FA000A09F
      A000A1A0A000A09FA0009F9F9F009F9FA0009FA0A100A0A0A200A0A0A200A0A0
      A200A0A0A200A0A0A100A2A2A200B1B1B1000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004194D00089EFFF004397D100615E5D0085848200BDBCBA00C3C3
      C10078757300000000005F5B5B0085848200BDBCBA00C3C2C000777472000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000077747200C3C2C000BDBCBA00858482005F5B5B00000000007875
      7300C3C3C100BDBCBA0085848200615E5D00A2A2A200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00A2A2A2000000000000000000000000000000
      0000000000000000000000000000000000007DB3D5003896D6003592D5003793
      D4003B93D20087EEFF0056ADDE00000000005F5C5B0081807E00B7B6B400BEBD
      BB00757270006E6C6A005C59580080807E00B7B6B400BEBDBB00757371000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000075737100BEBDBB00B7B6B40080807E005C5958006E6C6A007572
      7000BEBDBB00B7B6B40081807E005F5C5B00A0A0A000FFFFFF00FFFFFF00FFFF
      FF0000792C00FFFFFF00FFFFFF00FFFFFF00D2944F00CA7D2800D8A36700D9A3
      6800C97C2600D2914900FFFFFF00A0A0A1004D9BD2004094D0003E92CF003F92
      CE003F92CE003F92CE003F92CF0045A3DE0075B7D400FDDDA900FFEBB700FFEE
      C2006AA9CF003B92D10000000000000000005F5C5B00C3C2C100E1E0DF00E5E5
      E40073716E00BBB9B80059565500C1C1C000E1E0DF00E6E5E400757371000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000075737100E6E5E400E1E0DF00C1C1C00059565500BBB9B8007371
      6E00E5E5E400E1E0DF00C3C2C1005F5C5B00A1A0A000FFFFFF0049AE8100007D
      33000081380000782B00FFFFFF00FFFFFF00C97C2700CB833200D69D6000CC84
      3500CA812F00F5EDE500FFFFFF009FA0A0004094D000ABFAFF0094F2FF0094F2
      FF0094F2FF0095F2FF0095F4FF004AB5ED00F6D09900FFEDD000FFEAC500FFF4
      CC00FFEEC1003692D3000000000000000000615E5D0064605F00656261006A68
      660000000000BAB8B70000000000605C5C0063615E006C6A6800797775000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000797775006C6A680063615E00605C5C0000000000BAB8B7000000
      00006A6866006562610064605F00615E5D00A2A0A100FFFFFF00007A2D00FFFF
      FF00007A2E00FFFFFF00FEFBFE00FAFFFF00CF8C4200D49C5C00FFFFFF00CC84
      3500CB802E00FBFFFF00FFFFFF009F9F9F003D92CF00AEF4FF0086E7FF0087E7
      FE0087E7FE0088E7FE0089EAFF004BBCF200FDCD9000FFF7E900FAEED500FFEA
      C500FFEBB600409FDC00000000000000000000000000615E5D009A989700CBC9
      C60076727100BBBAB9005C5958009A989700CCCAC70078757400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000078757400CCCAC7009A9897005C595800BBBAB9007672
      7100CBC9C6009A989700615E5D0000000000A2A0A100FFFFFF0000762600FFFF
      FF00FFFCFF00FCF9FB00F7F7F800F7FCFF00F1ECE600D1914A00DEB68B00CD85
      3600CB802E00F8FFFF00FFFFFF009F9F9F003C92CE00B5F3FF007CE1FD007EE1
      FC007FE1FC0080E1FC0081E3FE0053C4F900F2C88D00FEEBD200FFF7E900FFED
      D000FCDCAA003A99DA0000000000000000000000000000000000686464006D6B
      6900000000006F6D6B0000000000666362006E6C6A0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000006E6C6A0066636200000000006F6D6B000000
      00006D6B6900686464000000000000000000A0A0A000FFFFFF00FEF7FB00FAF9
      FE00F8FAFF00F6FAFF00F5F8FD00F5FBFF00CC843400D1934D00E0BE9800CD85
      3600CB802D00F6FCFF00FFFFFF009F9F9F003C92CF00BFF4FF0071DDFC0073DC
      FB0075DCFB0078DDFB007ADEFC0068D4FC0088C7D500F2C88D00FDCD9000F6D0
      9A007DB6CC00429FDA0000000000000000000000000000000000625F5D00B9B9
      B7007977750000000000615F5D00BAB9B7007977750000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000079777500BAB9B700615F5D00000000007977
      7500B9B9B700625F5D0000000000000000009F9F9F00FFFFFF00F2F5F800DBAF
      8000CC823100CA7C2600D9AB7800F4FDFF00CA7C2700D1914D00F5FFFF00CC83
      3300CA7E2A00F2F8FE00FFFFFF009F9F9F003D93D000DFFFFF00DAF9FF00DBF8
      FF00DEF9FF0072DBFC0074DAFB0073DAFC0063D2FD0055C8FA004EBFF50049B8
      EE0079CEF5003E94D10000000000000000000000000000000000646260006E6C
      6A007A7876000000000062605E006D6B69007A78760000000000000000004081
      3500008C4A00000000000000000000000000000000000000000000000000008C
      4A004081350000000000000000007A7876006D6B690062605E00000000007A78
      76006E6C6A006462600000000000000000009F9F9F00FFFFFF00EFF3F800C979
      2100F1F9FF00CE8A3F00CB7E2A00F1FAFF00E1C9AF00CD843400CA7D2800CB7E
      2900D8A97500EFF1F500FFFFFF009F9F9F004095D100368ECD00348BCB00358A
      CA00368ACA005ABCEA006DD8FB0069D5FA0067D5FA0067D5FB0066D5FC0065D6
      FC00BCF2FF003D93D00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000085
      3D004ED4A8000088460000000000000000000000000000000000008846004ED4
      A80000853D000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009F9F9F00FFFFFF00ECF2F700CA7B
      2500EDF7FF00CF8A3F00CB7F2A00EDF4FB00ECF0F400EDF2F700EAEBEB00EAEB
      EA00ECF0F400EAECEC00FFFFFF009F9F9F003E94D000C5F7FF0074DEFE0076DE
      FD0077DFFE0050A9DC0054B8E800D9F7FF00D5F6FF00D5F6FF00D5F6FF00D5F7
      FF00DAFBFF003D94D00000000000000000000000000000000000000000000000
      00000000000000000000000000000000000034A27C00008134000081380000B8
      7B0011DCA90062D3AE000087440000000000000000000087440062D3AE0011DC
      A90000B87B00008138000081340034A27C000000000000000000000000000000
      0000000000000000000000000000000000009F9F9F00FFFFFF00EAEFF500CB7D
      2700CF8E4700CB7E2900D5A06600EAEDF100E9E9E900E8E8E800E9E9E900E9E9
      E900E8E8E800E7E6E500FFFFFF009F9F9F003C92CF00CBF6FF006AD6FA006DD6
      FA006CD7FA006CD9FC0047A8DD00318ACB002F8ACB002F8ACB002F8ACB00308B
      CB00358FCD004095D10000000000000000000000000000000000000000000000
      000000000000000000000000000000000000008233005AE8C80000CF9C0000CD
      9B0000CC9A0012D3A70072D7B900008A4800008A480072D7B90012D3A70000CC
      9A0000CD9B0000CF9C005AE8C800008233000000000000000000000000000000
      0000000000000000000000000000000000009FA0A000FFFFFF00E6EEF500CA7C
      2400E8F3FD00E7EEF400E6EAEE00E5E7E700E5E5E400E4E5E400E4E5E400E4E5
      E400E4E4E300E3E3E200FFFFFF009F9F9F003B92CF00D5F7FF0060D1F90061D0
      F800B5EBFD00DAF8FF00DCFBFF00DDFDFF00DDFDFF00DDFDFF00DDFDFF00DDFE
      FF00E3FFFF004096D10000000000000000000000000000000000000000000000
      000000000000000000000000000000000000008234006DE5D0005BDEC50060DD
      C40000C4990000C59B0083E5D200008A4700008A470083E5D20000C59B0000C4
      990060DDC4005BDEC5006DE5D000008234000000000000000000000000000000
      000000000000000000000000000000000000A0A0A000FFFFFF00D0995B00C978
      1E00E2E2E000E2E3E400E1E1E100E1E0DF00E1E0DF00E1E0DF00E1E0DF00E1E0
      DF00E1E0DF00E1DFDE00FFFFFF00A0A0A0003D94D000DCFCFF00D8F7FF00D8F7
      FF00DBFAFF00358ECD003A92CF003B92CF003B93CF003B93CF003B93CF003B93
      D0003E95D0004F9ED50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000991560002995A0007985B000DBB
      950000BE9B0095E5D6001B975C0000000000000000001B975C0095E5D60000BE
      9B000DBB950007985B0002995A00099156000000000000000000000000000000
      000000000000000000000000000000000000A2A2A200FFFFFF00FFFFFF00FCEB
      D800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00A2A2A2004F9ED5003D94D0003A92CF003A92
      CF003D94D00053A1D50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000087
      40009EE7E0001E995E00000000000000000000000000000000001E995E009EE7
      E000008740000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000ABACAC00A2A2A200A0A1A200A0A2
      A300A0A1A2009FA0A0009F9F9F009F9F9F009F9F9F009F9F9F009F9F9F009F9F
      9F009F9F9F00A0A0A000A2A2A200ABABAB000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001083
      39001B9D64000000000000000000000000000000000000000000000000001B9D
      6400108339000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BB8A4E00B783
      4300B7834400BD894E000000000000000000000000005E92620049854B004A84
      4A004A844A004B844B004B854D00548C5800000000000000000000000000B783
      4400B7834400000000000000000000000000000000005E92620049854C004A85
      4C00548C5800000000000000000000000000BCBCBC00B2B2B200B0B0B000B1B0
      B000B1B0B100B1B0B000B0B0B000B0B0B100B0B1B200B0B1B200B0B1B200B0B1
      B200B0B1B200B0B1B200B2B2B200BCBCBC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004780
      AB00487FAA004881AC0000000000000000000000000000000000B7824300FBCE
      8800F9CA8000B983430000000000000000000000000048844B009EE8C90050C8
      920052C8930053C8940055CC99004A854C000000000000000000B5814100F4C4
      7A00F4C47A00B581410000000000000000000000000047844B009EE9CA0053CC
      98004A854C00000000000000000000000000B2B2B200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B2B2B2000000000000000000000000000000
      00000000000000000000000000000000000000000000000000003E81B300739D
      BF001FADFF0092CEEA004491C600000000000000000000000000B6814100F4CB
      8A00F1C07500B882420000000000000000000000000047844A00BBEADD00B8E6
      D800B9E6D800BAE7D900BDEBDE0048854B0000000000B5814100F2C17600EEBC
      7200EEBD7300F2C17600B8814100000000000000000045844A00BCEBDE00BDEB
      DF0048854B00000000000000000000000000B1B0B000FFFFFF00FFFFFF00FFFF
      FF0000792B0082C7A400FFFFFF00FFFFFF00D2944E00C97D2800D8A36700D8A3
      6700C97B2600D1914900FFFFFF00B0B1B1000000000000000000000000000000
      00007F7D7C007B7A78007B7978007B79780085817E005B7D9700A29A9200AFA3
      9B00A0C2D800B0ECFF003F90C600000000000000000000000000B6814100F1CA
      9000EBB86D00B882420000000000000000000000000083AE870047844A004582
      4700458247004582470047844A0074A37700B8844400F7CE8F00F2C98900EDC2
      8200EBB96F00F2C98A00F9CE8F00C28443000000000083AF890047844A004784
      4A0077A57A00000000000000000000000000B2B1B100FFFFFF0049AE8100007D
      33000081380000782B004BA97900FFFFFF00C97C2700CB833200D69D6000CC84
      3500CA812F00F5EDE500FFFFFF00B0B0B1000000000000000000888785009C9D
      9D00D1D3D500E3E5EA00E2E4E900E3E4E900D1D1D3009C9A9A0083807D00C6C2
      BD00F4EBE400BFDEEA003F92CA00000000000000000000000000B6814000EFCD
      9800E6B26600B882430000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CAA16F00B7824200B37D3D00F0C8
      8E00E9B86C00B37E3F00B8824200CFA170000000000000000000000000000000
      000000000000000000000000000000000000B3B1B200FFFFFF00007A2D00FFFF
      FF00007A2E0082C7A400FEFBFE00FAFFFF00CF8C4200D49C5C00FFFFFF00CC84
      3500CB802E00FBFFFF00FFFFFF00B0B0B0000000000089888700B4B3B600E6E4
      DF00E9CD9A00F1CA7E00F5D38800F9DA8D00F2E1AD00E6E5E000B0AEB000908B
      8A00EDE3DB00368FCA0000000000000000000000000000000000B6814000EECF
      A100E0AC5E00B9834400000000000000000000000000749E770049854B004A84
      4A004B854D00759E780000000000000000000000000000000000B6804000F0CB
      9600E7B46900B6824200000000000000000000000000729E770048854B004A84
      4A004B854D00749E77000000000000000000B2B1B200FFFFFF0000772700FFFF
      FF00FFFCFF00FCF9FA00F7F7F800F7FCFF00F2ECE700D1914A00DEB68B00CD85
      3600CB802E00F8FFFF00FFFFFF00B0B0B00000000000A2A1A200EBE6E200E9BB
      7500ECC47C00F1D08900F5DA9400FAE39C00FDE89E00FBE39B00EBE8E300A09C
      9C005B87A5000000000000000000000000000000000000000000B6813F00EFD3
      AA00DAA55700B983440000000000000000000000000047844B009EE8C90051C9
      930055CC98004A854C0000000000000000000000000000000000B6814000EFCE
      9D00E4B16400B882430000000000000000000000000046854B009EE8C90051C9
      930055CC98004A854C000000000000000000B1B1B100FFFFFF00FFFBFF00FBFA
      FF00F7F8FC00F5F8FD00F5FAFF00F7FFFF00CD853700D1934E00E0BE9800CD85
      3600CB802D00F5FBFF00FFFFFF00B0B0B00087858400DCDFE100E6C28F00EBC4
      8A00EED09700F1D28E00F5DD9800FBEAA200FFF1A900FCE89D00F5E2AE00DBDC
      DE008B8684000000000000000000000000000000000000000000B6813F00F0D9
      B400D69F5000B884440000000000000000000000000045844A00BBEADD00B9E7
      D900BDEBDE0048854B0000000000000000000000000000000000B6813F00F0D1
      A400E0AC5E00B883430000000000000000000000000047844A00BBEADD00B9E7
      D900BDEBDE0048854B000000000000000000B0B1B100FFFFFF00D3955200CA79
      2100F4FFFF00D59C6000CB7D2800D59E6100CB802D00D1924E00F5FFFF00CC83
      3300CA7E2A00F2F8FE00FFFFFF00B0B0B00085848200F4F8FC00E1A95D00F3DB
      B700F1D9AC00F2D9A000F5DC9600F8E59E00FBEAA200F9E39C00F7D98B00F3F4
      FA00858382000000000000000000000000000000000000000000B7813F00EFDB
      BD00D09A4900B884450000000000000000000000000082AE880046844A004582
      480047844A0057905B0000000000000000000000000000000000B6813F00EFD4
      AD00DDA85A00B983440000000000000000000000000083AE870047844A004582
      480047844A0059915D000000000000000000B0B0B100FFFFFF00EAE6E100CF85
      3000D0883600D08B3B00D0883600EDECEC00E2CBB200CD843500CA7D2800CB7E
      2900D8A97500EEF1F400FFFFFF00B0B0B00088858400F7FCFF00DEA45800F6E8
      D100F3DFBB00F3DCAD00F4DCA300F5DC9700F5DD9800F4DA9300F3D18600F5F9
      FF0088858400000000000000000000000000BC8A4E00B9844300B7814000DAB7
      8700C68F4500B8834400BA844300C38A4E000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B6813F00F0D8
      B500D9A35400B983440000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B0B0B000FFFFFF00EAEFF400DFB3
      7B00EAE6DE00DD9D4D00DFB07300ECF3F900ECF0F400EDF2F700EAEBEB00EAEB
      EA00ECF0F40000772700FFFFFF00B0B0B0008A888600FDFFFF00DC9E5300F6E7
      D400F6E6CD00F4DFBA00F3DCAD00F2D99F00F1D28D00F0CF8900EEC87B00FBFD
      FF008A878600000000000000000000000000B9844400E8D1AC00C68F3E00C68F
      4000C6904100C68F3E00ECD5B200C384420000000000739E790049854C004A85
      4C00759E78000000000000000000000000000000000000000000B6803E00F1DC
      BC00D59F4F00B9844400000000000000000000000000749E770049854B004A84
      4A004A844A004B844B004B854D00749D7600B0B0B000FFFFFF00E8E9EB00E6D9
      C900DB9E4F00DA9A4700E5D4C000E9EBED00E8E8E800E8E8E80082C7A400007A
      2E00E8E8E800007A2D00FFFFFF00B0B0B000908D8C00EAEDF100E5B98800ECCC
      A300F9F1E500F6E6CC00F3DFBB00F1D9AC00EFD09700EBC37B00F0D3A100E9EB
      F0008F8D8B0000000000000000000000000000000000B8824000E8D0AD00C28B
      3800C28B3800E8D0AD00B9824000000000000000000046854B009EE9CA0053CC
      98004A854C000000000000000000000000000000000000000000B7813E00F0DB
      BB00D0994800BA83430000000000000000000000000048844B009EE8C90050C8
      920052C8930053C8940055CC99004A854C00B0B0B000FFFFFF00E3E5E500E5EB
      F000D4995400D3934800E6ECF200E5E6E700E4E5E4004BA9790000782B000081
      3800007D330049AE8100FFFFFF00B0B0B00000000000B3B2B200FEFAF500DBA0
      5800ECCBA200F9ECDC00F6E7D000F2DDBB00ECC99500E7B97200FFFDF900B2B1
      B200000000000000000000000000000000000000000000000000B7814000E8D1
      B000E8D1B000B881400000000000000000000000000046844A00BCEBDE00BDEB
      DF0048854B000000000000000000000000000000000000000000B8824000EFDB
      BB00EAD0A900BA83420000000000000000000000000047844A00BBEADD00B8E6
      D800B9E6D800BAE7D900BDEBDE0048854B00B0B0B000FFFFFF00E0DFDF00E1E3
      E500D8BD9D00D5AE8300E2E4E600E1E0E000E1E0DF00E1E0DF0082C7A4000079
      2B00E1DFDE00E0DFDE00FFFFFF00B0B0B000000000009D9B9A00CDCDCF00FFFD
      FA00E7BC8A00DA9C5100DDA25600DEA65A00ECC89600FFFFFC00CCCCCE009D9A
      9A0000000000000000000000000000000000000000000000000000000000B883
      4200B88342000000000000000000000000000000000082AD860047844A004784
      4A00568F5A000000000000000000000000000000000000000000CFAB7E00B882
      4100B8834100D1AB7F0000000000000000000000000082AD860047844A004582
      4700458247004582470047844A00568F5A00B2B2B200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B2B2B20000000000000000009F9D9B00B8B8
      B900F5F8FC00FFFFFF00FFFFFF00FFFFFF00F5F7FC00B8B7B9009F9C9B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BABABA00B2B2B200B0B0B000B0B0
      B000B0B0B100B0B0B100B0B0B000B0B0B000B0B0B000B0B0B000B0B0B000B0B0
      B000B0B0B000B0B0B000B2B2B200BABABA000000000000000000000000000000
      0000999695009593910095929100959291009996950000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B1B1B100A2A2A200A0A0A000A1A1
      A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A0A0A0009F9F9F009F9F
      9F009F9F9F009F9F9F00A2A2A200B1B1B100B1B1B100A2A2A200A0A0A000A1A1
      A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A0A0A0009F9F9F009F9F
      9F009F9F9F009F9F9F00A2A2A200B1B1B100B1B1B100A2A2A200A0A0A000A1A1
      A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A0A0A0009F9F9F009F9F
      9F009F9F9F009F9F9F00A2A2A200B1B1B100749E770049854B004A844A004A84
      4A004B844B004B854D00749D760000000000000000005E92620049854C004A85
      4C00548C5800000000000000000000000000A2A2A200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00A2A2A200A2A2A200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00A2A2A200A2A2A200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00A2A2A20048844B009EE8C90050C8920052C8
      930053C8940055CC99004A854C00000000000000000047844B009EE9CA0053CC
      98004A854C000000000000000000000000009F9F9F00FFFFFF00FFFFFF004442
      40005D5A58006F6D6A0073706E00605E5B0048464500FFFFFF00FFFFFF00FEFE
      FF00FEFEFE00FEFEFE00FFFFFF009F9F9F009F9F9F00FFFFFF00FFFFFF004442
      40005D5A58006F6D6A0073706E00605E5B0048464500FFFFFF00FFFFFF00FEFE
      FF00FEFEFE00FEFEFE00FFFFFF009F9F9F009F9F9F00FFFFFF00FFFFFF004442
      40005D5A58006F6D6A0073706E00605E5B0048464500FFFFFF00FFFFFF00FEFE
      FF00FEFEFE00FEFEFE00FFFFFF009F9F9F0047844A00BBEADD00B8E6D800B9E6
      D800BAE7D900BDEBDE0048854B00000000000000000045844A00BCEBDE00BDEB
      DF0048854B000000000000000000000000009F9F9F00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF009F9F9F009F9F9F00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF009F9F9F009F9F9F00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF009F9F9F0082AD860047844A00458247004582
      47004582470047844A00568F5A00000000000000000083AF890047844A004784
      4A0077A57A000000000000000000000000009F9F9F00FFFFFF00FEFEFE00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00767471006A6766005F5D5C005552
      500043414000FEFEFE00FFFFFF009F9F9F009F9F9F00FFFFFF00FEFEFE00D487
      2F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00767471006A6766005F5D5C005552
      500043414000FEFEFE00FFFFFF009F9F9F009F9F9F00FFFFFF00FEFEFE00FFFF
      FF00FFFFFF00FFFFFF00D4872F00FFFFFF00767471006A6766005F5D5C005552
      500043414000FEFEFE00FFFFFF009F9F9F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009F9F9F00FFFFFF00F8F8F800FCFC
      FB00FCFCFB00FCFCFB00FCFCFB00FCFCFB00FCFCFB00FCFCFB00FCFCFB00FCFC
      FB00FCFCFB00FCFCFB00FFFFFF009F9F9F009F9F9F00FFFFFF00F8F8F800D487
      2F00D1904700FCFCFB00FCFCFB00FCFCFB00FCFCFB00FCFCFB00FCFCFB00FCFC
      FB00FCFCFB00FCFCFB00FFFFFF009F9F9F009F9F9F00FFFFFF00F8F8F800FCFC
      FB00FCFCFB00D1904700D4872F00FCFCFB00FCFCFB00FCFCFB00FCFCFB00FCFC
      FB00FCFCFB00FCFCFB00FFFFFF009F9F9F000000000000000000729E77004885
      4B004A844A004B854D00749E77000000000000000000729E770048854B004A84
      4A004B854D00749E770000000000000000009F9F9F00FFFFFF00F3F3F300FCFB
      FA00FCFBFA00FCFBFA00FCFBFA00FCFBFA00504E4C006B696800807E7B00706E
      6D0054524F00FCFBFA00FFFFFF009F9F9F009F9F9F00FFFFFF00F3F3F300D487
      2F00D2862E00D48D3A00FCFBFA00FCFBFA00504E4C006B696800807E7B00706E
      6D0054524F00FCFBFA00FFFFFF009F9F9F009F9F9F00FFFFFF00F3F3F300FCFB
      FA00D48D3A00D2862E00D4872F00FCFBFA00504E4C006B696800807E7B00706E
      6D0054524F00FCFBFA00FFFFFF009F9F9F00000000000000000046854B009EE8
      C90051C9930055CC98004A854C00000000000000000046854B009EE8C90051C9
      930055CC98004A854C0000000000000000009F9F9F00FFFFFF00EFF2F400F8F8
      F700F8F8F700F8F8F700F8F8F700F8F8F700F8F8F700F8F8F700F8F8F700F8F8
      F700F8F8F700F8F8F700FFFFFF009F9F9F009F9F9F00FFFFFF00EFF2F400D487
      2F00DE943B00DE933A00DF994500F8F8F700F8F8F700F8F8F700F8F8F700F8F8
      F700F8F8F700F8F8F700FFFFFF009F9F9F009F9F9F00FFFFFF00EFF2F400DF99
      4500DE933A00DE943B00D4872F00F8F8F700F8F8F700F8F8F700F8F8F700F8F8
      F700F8F8F700F8F8F700FFFFFF009F9F9F00000000000000000047844A00BBEA
      DD00B9E7D900BDEBDE0048854B00000000000000000047844A00BBEADD00B9E7
      D900BDEBDE0048854B0000000000000000009F9F9F00FFFFFF00EDF0F300F4F2
      F100F4F2F100F4F2F100F4F2F100F4F2F100504E4C006B696800807E7B00706E
      6D0054524F00F4F2F100FFFFFF009F9F9F009F9F9F00FFFFFF00EDF0F300D487
      2F00D4872F00D7954900F4F2F100F4F2F100504E4C006B696800807E7B00706E
      6D0054524F00F4F2F100FFFFFF009F9F9F009F9F9F00FFFFFF00EDF0F300F4F2
      F100D7954900D4872F00D4872F00F4F2F100504E4C006B696800807E7B00706E
      6D0054524F00F4F2F100FFFFFF009F9F9F00000000000000000083AE87004784
      4A004582480047844A0059915D00000000000000000083AE870047844A004582
      480047844A0059915D0000000000000000009F9F9F00FFFFFF00EAECEE00F2F3
      F200F2F3F200F2F3F200F2F3F200F2F3F200F2F3F200F2F3F200F2F3F200F2F3
      F200F2F3F200F2F3F200FFFFFF009F9F9F009F9F9F00FFFFFF00EAECEE00D487
      2F00D18F4700F2F3F200F2F3F200F2F3F200F2F3F200F2F3F200F2F3F200F2F3
      F200F2F3F200F2F3F200FFFFFF009F9F9F009F9F9F00FFFFFF00EAECEE00F2F3
      F200F2F3F200D18F4700D4872F00F2F3F200F2F3F200F2F3F200F2F3F200F2F3
      F200F2F3F200F2F3F200FFFFFF009F9F9F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009F9F9F00FFFFFF00E8E8E800F0EF
      EE00F0EFEE00F0EFEE00F0EFEE00F0EFEE00514F4D006C6A6900817E7C00716F
      6E00F0EFEE00F0EFEE00FFFFFF009F9F9F009F9F9F00FFFFFF00E8E8E800D487
      2F00F0EFEE00F0EFEE00F0EFEE00F0EFEE00514F4D006C6A6900817E7C00716F
      6E00F0EFEE00F0EFEE00FFFFFF009F9F9F009F9F9F00FFFFFF00E8E8E800F0EF
      EE00F0EFEE00F0EFEE00D4872F00F0EFEE00514F4D006C6A6900817E7C00716F
      6E00F0EFEE00F0EFEE00FFFFFF009F9F9F000000000000000000000000005E92
      620049854C004A854C00548C58000000000000000000749E770049854B004A84
      4A004A844A004B844B004B854D00749D76009F9F9F00FFFFFF00E7E7E600E7E7
      E600E7E7E600E7E7E600E7E7E600E7E7E600E7E7E600E7E7E600E7E7E600E7E7
      E600E7E7E600EAEAE900FFFFFF009F9F9F009F9F9F00FFFFFF00E7E7E600E7E7
      E600E7E7E600E7E7E600E7E7E600E7E7E600E7E7E600E7E7E600E7E7E600E7E7
      E600E7E7E600EAEAE900FFFFFF009F9F9F009F9F9F00FFFFFF00E7E7E600E7E7
      E600E7E7E600E7E7E600E7E7E600E7E7E600E7E7E600E7E7E600E7E7E600E7E7
      E600E7E7E600EAEAE900FFFFFF009F9F9F000000000000000000000000004784
      4B009EE9CA0053CC98004A854C00000000000000000048844B009EE8C90050C8
      920052C8930053C8940055CC99004A854C00A0A0A000FFFFFF00E6E5E4004240
      3F0053514F005D5B5A006966640073706E00767472006B696800615F5E005755
      520046434200E7E6E400FFFFFF00A0A0A000A0A0A000FFFFFF00E6E5E4004240
      3F0053514F005D5B5A006966640073706E00767472006B696800615F5E005755
      520046434200E7E6E400FFFFFF00A0A0A000A0A0A000FFFFFF00E6E5E4004240
      3F0053514F005D5B5A006966640073706E00767472006B696800615F5E005755
      520046434200E7E6E400FFFFFF00A0A0A0000000000000000000000000004584
      4A00BCEBDE00BDEBDF0048854B00000000000000000047844A00BBEADD00B8E6
      D800B9E6D800BAE7D900BDEBDE0048854B00A2A2A200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00A2A2A200A2A2A200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00A2A2A200A2A2A200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00A2A2A20000000000000000000000000083AF
      890047844A0047844A0077A57A00000000000000000082AD860047844A004582
      4700458247004582470047844A00568F5A00ABABAB00A2A2A200A0A0A000A1A1
      A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1
      A100A1A1A100A0A0A000A2A2A200ABABAB00ABABAB00A2A2A200A0A0A000A1A1
      A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1
      A100A1A1A100A0A0A000A2A2A200ABABAB00ABABAB00A2A2A200A0A0A000A1A1
      A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1
      A100A1A1A100A0A0A000A2A2A200ABABAB000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001C2D
      AD002131AD002233AD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001C2D
      AD002131AD002233AD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001C2D
      AD002131AD002233AD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001C2D
      AD002131AD002233AD000000000000000000BCBCBC00B2B2B200B0B0B000AFAF
      B000AFAFB000AFAFB000AFAFB000AFAFB000AFAFB000AFAFB0001B31BF00365D
      FA003961FE003960FA00283EC100BCBCBC00BCBCBC00B2B2B200B0B0B000AFAF
      B000AFAFB000AFAFB000AFAFB000AFAFB000AFAFB000AFAFB0001B31BF00365D
      FA003961FE003960FA00283EC100BCBCBC00BCBCBC00B2B2B200B0B0B000AFAF
      B000AFAFB000AFAFB000AFAFB000AFAFB000AFAFB000AFAFB0001B31BF00365D
      FA003961FE003960FA00283EC100BCBCBC00BCBCBC00B2B2B200B0B0B000AFAF
      B000AFAFB000AFAFB000AFAFB000AFAFB000AFAFB000AFAFB0001B31BF00365D
      FA003961FE003960FA00283EC100BCBCBC00B2B2B200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000317A5003D61FB003C60
      FB003A5EF9003D61FB004366FD001E30AD00B2B2B200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000317A5003D61FB003C60
      FB003A5EF9003D61FB004366FD001E30AD00B2B2B200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000317A5003D61FB003C60
      FB003A5EF9003D61FB004366FD001E30AD00B2B2B200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000317A5003D61FB003C60
      FB003A5EF9003D61FB004366FD001E30AD00B0B0B000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000417A400A7B9FF00FFFF
      FF00FFFFFF00FFFFFF00ACBDFF001B2DAC00B0B0B000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000417A400A7B9FF00FFFF
      FF00FFFFFF00FFFFFF00ACBDFF001B2DAC00B0B0B000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000417A400A7B9FF00FFFF
      FF00FFFFFF00FFFFFF00ACBDFF001B2DAC00B0B0B000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000417A400A7B9FF00FFFF
      FF00FFFFFF00FFFFFF00ACBDFF001B2DAC00B1B1B100FFFFFF0042403E00A2A3
      A300A2A3A300A2A3A300A2A3A300A2A3A300A2A3A3000115A4005876FE005876
      FF005473FE005877FF005F7CFF001D2EAD00B1B1B100FFFFFF0042403E00A2A3
      A300A2A3A300A2A3A300A2A3A300A2A3A300A2A3A3000115A4005876FE005876
      FF005473FE005877FF005F7CFF001D2EAD00B1B1B100FFFFFF0042403E00A2A3
      A300A2A3A300A2A3A300A2A3A300A2A3A300A2A3A3000115A4005876FE005876
      FF005473FE005877FF005F7CFF001D2EAD00B1B1B100FFFFFF0042403E005473
      FE00A2A3A3005473FE00A2A3A300A2A3A300A2A3A3000115A4005876FE005876
      FF005473FE005877FF005F7CFF001D2EAD00B1B1B100FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00263BC3006B84
      FF00748CFF00718AFF00384DC800B0B0B000B1B1B100FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00263BC3006B84
      FF00748CFF00718AFF00384DC800B0B0B000B1B1B100FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00263BC3006B84
      FF00748CFF00718AFF00384DC800B0B0B000B1B1B100FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00263BC3006B84
      FF00748CFF00718AFF00384DC800B0B0B000B1B1B100FFFFFF0043414000A2A3
      A300A2A3A300A2A3A300A2A3A300A2A3A300A2A3A300F4F7F900FFFFFF000518
      A6000F21AA00192BAD00FFFFFF00B1B1B100B1B1B100FFFFFF0043414000A2A3
      A300A2A3A300A2A3A300A2A3A300A2A3A300A2A3A300F4F7F900FFFFFF000518
      A6000F21AA00192BAD00FFFFFF00B1B1B100B1B1B100FFFFFF0043414000A2A3
      A300A2A3A300A2A3A300A2A3A300A2A3A300A2A3A300F4F7F900FFFFFF000518
      A6000F21AA00192BAD00FFFFFF00B1B1B100B1B1B100FFFFFF0043414000A2A3
      A300A2A3A3005473FE00A2A3A3005473FE00A2A3A300F4F7F900FFFFFF000518
      A6000F21AA00192BAD00FFFFFF00B1B1B100B1B1B100FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFE00FEFD
      FC00FDFCFB00FBFAF800FFFFFF00B0B0B000B1B1B100FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFE00FEFD
      FC00FDFCFB00FBFAF800FFFFFF00B0B0B000B1B1B100FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFE00FEFD
      FC00FDFCFB00FBFAF800FFFFFF00B0B0B000B1B1B100FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFE00FEFD
      FC00FDFCFB00FBFAF800FFFFFF00B0B0B000B1B1B100FFFFFF0045434200A2A3
      A300A2A3A300A2A3A300A2A3A300A2A3A300A2A3A300A2A3A300F9F9F800F4F4
      F300F2F3F200F2F2F100FFFFFF00B0B0B000B1B1B100FFFFFF0045434200A2A3
      A300A2A3A300A2A3A300A2A3A300A2A3A300A2A3A300A2A3A300F9F9F800F4F4
      F300F2F3F200F2F2F100FFFFFF00B0B0B000B1B1B100FFFFFF0045434200A2A3
      A300A2A3A300A2A3A300A2A3A300A2A3A300A2A3A300A2A3A300F9F9F800F4F4
      F300F2F3F200F2F2F100FFFFFF00B0B0B000B1B1B100FFFFFF0045434200A2A3
      A3005473FE005473FE00A2A3A300A2A3A3005473FE00A2A3A300F9F9F800F4F4
      F300F2F3F200F2F2F100FFFFFF00B0B0B000B1B1B100FFFFFF00FDFCFB00FFFF
      FF00FFFFFF00FFFFFF00FFFFFE00FFFFFE00FFFFFF00FEFEFD00FAF9F800F8F7
      F600F7F6F500F5F4F300FFFFFF00B0B0B000B1B1B100FFFFFF00FDFCFB00FFFF
      FF00FFFFFF00FFFFFF00FFFFFE00FFFFFE00FFFFFF00FEFEFD00FAF9F800F8F7
      F600F7F6F500F5F4F300FFFFFF00B0B0B000B1B1B100FFFFFF00FDFCFB00FFFF
      FF00FFFFFF00FFFFFF00FFFFFE00FFFFFE00FFFFFF00FEFEFD00FAF9F800F8F7
      F600F7F6F500F5F4F300FFFFFF00B0B0B000B1B1B100FFFFFF00FDFCFB00FFFF
      FF00FFFFFF00FFFFFF00FFFFFE00FFFFFE00FFFFFF00FEFEFD00FAF9F800F8F7
      F600F7F6F500F5F4F300FFFFFF00B0B0B000B1B1B100FFFFFF000317A5005473
      FE005473FE005473FE005473FE005473FE005473FE005473FE005473FE005473
      FE005473FE005473FE00FFFFFF00B1B1B100B1B1B100FFFFFF0044424100A2A3
      A300A2A3A300A2A3A300A2A3A300A2A3A300A2A3A300A2A3A3005473FE005473
      FE005473FE005473FE00FFFFFF00B1B1B100B1B1B100FFFFFF0044424100A2A3
      A300A2A3A300FFFFFF005473FE005473FE005473FE005473FE00FFFFFF00A2A3
      A300A2A3A300A2A3A300FFFFFF00B1B1B100B1B1B100FFFFFF0044424100A2A3
      A300A2A3A3005473FE00A2A3A300A2A3A3005473FE005473FE00A2A3A300A2A3
      A3005473FE00A2A3A300FFFFFF00B1B1B100B1B1B100FFFFFF00F7F6F500FCFC
      FB00FCFBFB00FBFAF900FAF9F900FAFAF900FBFAF900F9F8F700F5F4F300F3F2
      F100F2F1F000EFEEED00FFFFFF00B0B0B000B1B1B100FFFFFF00F7F6F500FCFC
      FB00FCFBFB00FBFAF900FAF9F900FAFAF900FBFAF900F9F8F700F5F4F300F3F2
      F100F2F1F000EFEEED00FFFFFF00B0B0B000B1B1B100FFFFFF00F7F6F500FCFC
      FB00FCFBFB00FBFAF900FAF9F900FAFAF900FBFAF900F9F8F700F5F4F300F3F2
      F100F2F1F000EFEEED00FFFFFF00B0B0B000B1B1B100FFFFFF00F7F6F500FCFC
      FB00FCFBFB00FBFAF900FAF9F900FAFAF900FBFAF900F9F8F700F5F4F300F3F2
      F100F2F1F000EFEEED00FFFFFF00B0B0B000B1B1B100FFFFFF0044424100A2A3
      A300A2A3A300A2A3A300A2A3A300A2A3A300A2A3A300A2A3A300ECECEB00E7E7
      E600E6E6E500E5E5E400FFFFFF00B0B0B000B1B1B100FFFFFF0044424100A2A3
      A300A2A3A300A2A3A300A2A3A300A2A3A300A2A3A300A2A3A300ECECEB00E7E7
      E600E6E6E500E5E5E400FFFFFF00B0B0B000B1B1B100FFFFFF0044424100A2A3
      A300A2A3A300A2A3A300A2A3A300A2A3A300A2A3A300A2A3A300ECECEB00E7E7
      E600E6E6E500E5E5E400FFFFFF00B0B0B000B1B1B100FFFFFF0044424100A2A3
      A300A2A3A3005473FE00A2A3A300A2A3A3005473FE00A2A3A300ECECEB00E7E7
      E600E6E6E500E5E5E400FFFFFF00B0B0B000B1B1B100FFFFFF00E8E7E600EBEA
      E900EAE9E800EAE9E800E9E9E700EAE9E800EBEAE900E9E8E600E4E3E200E1E0
      DF00E1DFDE00E0DFDE00FFFFFF00B0B0B000B1B1B100FFFFFF00E8E7E600EBEA
      E900EAE9E800EAE9E800E9E9E700EAE9E800EBEAE900E9E8E600E4E3E200E1E0
      DF00E1DFDE00E0DFDE00FFFFFF00B0B0B000B1B1B100FFFFFF00E8E7E600EBEA
      E900EAE9E800EAE9E800E9E9E700EAE9E800EBEAE900E9E8E600E4E3E200E1E0
      DF00E1DFDE00E0DFDE00FFFFFF00B0B0B000B1B1B100FFFFFF00E8E7E600EBEA
      E900EAE9E800EAE9E800E9E9E700EAE9E800EBEAE900E9E8E600E4E3E200E1E0
      DF00E1DFDE00E0DFDE00FFFFFF00B0B0B000B2B2B200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B2B2B200B2B2B200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B2B2B200B2B2B200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B2B2B200B2B2B200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B2B2B200BABABA00B2B2B200B0B0B000B0B0
      B000B0B0B000B0B0B000B0B0B000B0B0B000B0B0B000B0B0B000B0B0B000B0B0
      B000B0B0B000B0B0B000B2B2B200BABABA00BABABA00B2B2B200B0B0B000B0B0
      B000B0B0B000B0B0B000B0B0B000B0B0B000B0B0B000B0B0B000B0B0B000B0B0
      B000B0B0B000B0B0B000B2B2B200BABABA00BABABA00B2B2B200B0B0B000B0B0
      B000B0B0B000B0B0B000B0B0B000B0B0B000B0B0B000B0B0B000B0B0B000B0B0
      B000B0B0B000B0B0B000B2B2B200BABABA00BABABA00B2B2B200B0B0B000B0B0
      B000B0B0B000B0B0B000B0B0B000B0B0B000B0B0B000B0B0B000B0B0B000B0B0
      B000B0B0B000B0B0B000B2B2B200BABABA000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000008B
      4800008B4900008C4C0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000008B
      4800008B4900008C4C0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000008B
      4800008B4900008C4C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BCBCBC00B2B2B200B0B0B000AFAF
      B000AFAFB000AFAFB000AFAFB000AFAFB000AFAFB000AFAFB0000094520000BA
      840077E0C60000BB860000995C00BCBCBC000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000094520000BA
      840077E0C60000BB860000995C000000000000000000979593007A7773007673
      700076736F0076736F0076736F007673700076736F0094918F000094520000BA
      840077E0C60000BB860000995C00000000000000000000000000000000000000
      000000000000000000002F3EC2002F3EC2002F3EC2002F3EC200000000000000
      000000000000000000000000000000000000B2B2B200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00007F360000BE880000BC
      8300FFFFFF0000BC830000C18D00008C4C000000000000000000000000000000
      00000000000000000000000000000000000000000000007F360000BE880000BC
      8300FFFFFF0000BC830000C18D00008C4C00000000007C797700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00007F360000BE880000BC
      8300FFFFFF0000BC830000C18D00008C4C000000000000000000000000000000
      00002F3EC2004A5BE2006175FC00697DFF00697DFF006175FC004A5BE2002F3E
      C20000000000000000000000000000000000B0B0B000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00007F370072E5CB00FFFF
      FF00FFFFFF00FFFFFF0077E7CE00008B49000000000000000000000000000000
      00000000000000000000000000000000000000000000007F370072E5CB00FFFF
      FF00FFFFFF00FFFFFF0077E7CE00008B4900000000007D797600FFFFFF00FFFF
      FF00FDFDFD00FEFEFE00FEFEFE00FFFFFF00FFFFFF00007F370072E5CB00FFFF
      FF00FFFFFF00FFFFFF0077E7CE00008B49000000000000000000000000002F3E
      C200596DF6006175FC006175FC006175FC006175FC006175FC006175FC00596D
      F6002F3EC200000000000000000000000000B1B1B100FFFFFF0042403E00A2A3
      A300A2A3A300A2A3A300A2A3A300A2A3A300A2A3A300007E360000CA940000C8
      8F00FFFFFF0000C9900000CD9900008C4B000000000000000000000000000000
      0000B8841A00B8841A00000000000000000000000000007E360000CA940000C8
      8F00FFFFFF0000C9900000CD9900008C4B00000000007E7C7900FFFFFF00FAFA
      FA00F9F9F900FBFBFB00FFFFFF00FFFFFF00DADADA00007E360000CA940000C8
      8F00FFFFFF0000C9900000CD9900008C4B0000000000000000002F3EC200596D
      F6005A6EF9005A6EF9005A6EF9005A6EF9005A6EF9005A6EF9005A6EF9005A6E
      F900596DF6002F3EC2000000000000000000B1B1B100FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00009B590000D1
      9A0074EED40000D49F0000A36700B0B0B000000000000000000000000000B681
      1700E5BD7300E6BE7400B8841A000000000000000000B8841A00009B590000D1
      9A0074EED40000D49F0000A367000000000000000000827F7D00FFFFFF00F5F6
      F600F5F5F600FCFCFC0058585800DAD9D9006A6A6A0071717100009B590000D1
      9A0074EED40000D49F0000A367000000000000000000000000004256DE00576D
      FB005267F7005267F7005267F7005267F7005267F7005267F7005267F7005267
      F700576DFB004256DE000000000000000000B1B1B100FFFFFF0043414000A2A3
      A300A2A3A300A2A3A300A2A3A300A2A3A300A2A3A300F4F7F900FFFFFF000080
      370000843E0000894700FFFFFF00B1B1B1000000000000000000B6821700E3B8
      6900E1B66600E4B96B00B8841A000000000000000000B8841A00E4B96B000080
      370000843E000089470000000000000000000000000085827F00FFFFFF00F2F2
      F100F3F3F200FCFCFB005C5C5C00FFFFFF00FFFFFF00FFFFFF00585858000080
      370000843E0000894700A8A6A40000000000000000002F3EC2004E64F4004C63
      F7003D55F4003D55F4003D55F4003D55F4003D55F4003D55F4003D55F4003D55
      F4004C63F7004E64F4002F3EC20000000000B1B1B100FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFE00FEFD
      FC00FDFCFB00FBFAF800FFFFFF00B0B0B00000000000B7821700E1B36300DFB1
      6000E0B36300B782170000000000000000000000000000000000B7821700E0B3
      6300DFB16000E1B36300B7821700000000000000000088868200FFFFFF00EFEE
      EE00F1F0F000FBFAFA005D5D5E00FFFFFF00626262005755550060606000EDED
      EC00F5F4F500F6F5F6008785820000000000000000002F3EC2005369F8003E56
      F300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF003E56F3005369F8002F3EC20000000000B1B1B100FFFFFF0045434200A2A3
      A300A2A3A300A2A3A300A2A3A300A2A3A300A2A3A300A2A3A300F9F9F800F4F4
      F300F2F3F200F2F2F100FFFFFF00B0B0B000B8841A00E4B86E00DDAD5800DEAE
      5A00B6811600000000000000000000000000000000000000000000000000B681
      1600DEAE5A00DDAD5800E4B86E00B8841A00000000008B888600FEFEFE00EBEB
      EA00EFEFEE00DFDFDE0061606000FFFFFF003A3B3B00FFFFFF00FDFDFB00F2F2
      F100EDEDEC00FFFFFF008C88860000000000000000002F3EC2006378F7002F4B
      EE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF002F4BEE006378F7002F3EC20000000000B1B1B100FFFFFF00FDFCFB00FFFF
      FF00FFFFFF00FFFFFF00FFFFFE00FFFFFE00FFFFFF00FEFEFD00FAF9F800F8F7
      F600F7F6F500F5F4F300FFFFFF00B0B0B000B8841900E8C28500DBA85000DCAA
      5300B6821700000000000000000000000000000000000000000000000000B682
      1700DCAA5300DBA85000E8C28500B8841900000000008E8B8800FEFEFD00E8E7
      E600EEECEB00595959002A2A2B00FBF9F8005E5E5D005E5E5E0058585900C7C6
      C500E9E8E700FEFEFD008E8B880000000000000000002F3EC2008696F8003852
      ED002A46EB002A46EB002A46EB002A46EB002A46EB002A46EB002A46EB002A46
      EB003852ED008696F8002F3EC20000000000B1B1B100FFFFFF00007F360000D1
      9A0000D19A0000D19A0000D19A0000D19A0000D19A0000D19A0000D19A0000D1
      9A0000D19A0000D19A00FFFFFF00B1B1B10000000000B6811500ECCC9A00DAA3
      4900DCA74F00B783190000000000000000000000000000000000B7831900DCA7
      4F00DAA34900ECCC9A00B68115000000000000000000948F8B00FFFFFE00E6E6
      E200E9E9E600F0F0EC00CCCAC600EFEEEB00F0EFEB00F0F0EC00EEEEEA00EAE9
      E600E7E6E300FFFFFE00948F8B000000000000000000000000006F7CDD008494
      F5003650EA003650EA003650EA003650EA003650EA003650EA003650EA003650
      EA008494F5006F7CDD000000000000000000B1B1B100FFFFFF00F7F6F500FCFC
      FB00FCFBFB00FBFAF900FAF9F900FAFAF900FBFAF900F9F8F700F5F4F300F3F2
      F100F2F1F000EFEEED00FFFFFF00B0B0B0000000000000000000B6801300F1D8
      B100D79F4100DAA24700B88419000000000000000000B8841900DAA24700D79F
      4100F1D8B100B6801300000000000000000000000000A39C8900FFFFFD00F2ED
      DE00F4F0E100F6F2E300F7F2E100F6F0DF00F6F0DE00F6F1E000F5F1E200F4F0
      E100F2EEDE00FFFFFD00A39C89000000000000000000000000002F3EC2009AA7
      F0007F90F300304CE800304CE800304CE800304CE800304CE800304CE8007F90
      F3009AA7F0002F3EC2000000000000000000B1B1B100FFFFFF0044424100A2A3
      A300A2A3A300A2A3A300A2A3A300A2A3A300A2A3A300A2A3A300ECECEB00E7E7
      E600E6E6E500E5E5E400FFFFFF00B0B0B000000000000000000000000000B680
      1200F7E5CB00F8E7CD00B88317000000000000000000B8831700F8E7CD00F7E5
      CB00B6801200000000000000000000000000000000000020E700526FEF000016
      E500000AB100000CB3000019E9000018E3000018E2000018E600000BB100000B
      B2000016E700526FEF000020E700000000000000000000000000000000002F3E
      C20097A3EF009EACF7006075ED003E57E9003E57E9006075ED009EACF70097A3
      EF002F3EC200000000000000000000000000B1B1B100FFFFFF00E8E7E600EBEA
      E900EAE9E800EAE9E800E9E9E700EAE9E800EBEAE900E9E8E600E4E3E200E1E0
      DF00E1DFDE00E0DFDE00FFFFFF00B0B0B0000000000000000000000000000000
      0000B8821600B882160000000000000000000000000000000000B8821600B882
      160000000000000000000000000000000000000000000138F1009DB3FB0096AF
      FF00C0BAA40080714E0093A2D6009BB2FD009CB2FA0097B0FF00C1BBA4008171
      4C0098B1FF009DB4FC000138F100000000000000000000000000000000000000
      00002F3EC2006F7CDD009EA9F200AFBBF800AFBBF8009EA9F2006F7CDD002F3E
      C20000000000000000000000000000000000B2B2B200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B2B2B2000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005173D2000648FE000042
      FF00BCB7A500938873002154E4000447FF000748FC000043FF00BDB7A400978B
      6E000045FF000748FE005173D200000000000000000000000000000000000000
      000000000000000000002F3EC2002F3EC2002F3EC2002F3EC200000000000000
      000000000000000000000000000000000000BABABA00B2B2B200B0B0B000B0B0
      B000B0B0B000B0B0B000B0B0B000B0B0B000B0B0B000B0B0B000B0B0B000B0B0
      B000B0B0B000B0B0B000B2B2B200BABABA000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BBB5A400A8A1950000000000000000000000000000000000BDB6A200B2A6
      8F00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B5B5B300B0B0AE00AEAEAC00ADADAB00ADADAB00ADAD
      AB00ADADAB00AEAEAB00AFAFAD00B5B5B3000000000000000000000000000000
      00000000000000000000C0BCB600B1B0AE00AEAEAB00ADADAB00ADADAB00ADAD
      AB00ADADAB00AEAEAB00AFAFAD00B5B5B30000000000000000007D7D7D000000
      0000848484000000000084848400000000007C7D7D00000000007C7D7D000000
      00007C7C7D000000000086868600000000000000000000000000000000000000
      00000000000000000000008C4B00008B4A00008B4A00008C4B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B0B0AE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B0B0AD006B87A500406893003F6893004068
      93003E679300335F8F00BBB7B000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B0B0AD008A8A8A00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      00000090500001A1690000AA760000AB770000AB770000AA760001A169000090
      5000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B0B0AD00F6F6F500ECECEB00FBFAFA00FDFDFD00FCFC
      FC00FBFBFC00FCFCFC00FFFFFF00AEAEAB003F6A9400568AB0004C82AB004D82
      AB004B81AB00417BA800B9B4AD00FFFFFF00FCFCFC00FBFBFC00FBFBFC00FBFB
      FC00FBFBFC00FCFCFC00FFFFFF00AEAEAB0000000000FFFFFF00E5E4E300E5E4
      E300E6E5E400E7E6E400E6E5E400E6E5E300E6E5E300E6E4E300E6E5E300E6E4
      E300E5E4E300E5E4E300FFFFFF008B8B8B000000000000000000000000000091
      520002AC770000C38C0000D6990018DEA80018DEA80000D6990000C38C0001AB
      760000925300000000000000000000000000B4B4B200AFAFAD00AEAEAB00ADAD
      AB00ADADAB00ADADAB00ACACAA00A9A9A700A8A8A600B8B7B600FBFAFA00F8F6
      F600F7F6F600F7F6F600FFFFFF00ADADAB003F6A95006594BB004C83AE004E83
      AE004C82AE00427DAC00B8B3AC00FFFFFF00F7F6F600F7F6F600F7F6F600F7F6
      F600F7F6F600F7F6F600FFFFFF00ADADAB008A8A8A00FFFFFF00E1E0DF00E2E1
      E000E3E2E100E3E2E100E3E2E100E3E2E100E3E2E100E3E2E100E3E2E100E3E2
      E100E2E1E000E1E0DF00FFFFFF00000000000000000000000000009051000FB4
      830002D2990000D69B0000D19300FFFFFF00FFFFFF0000D1930000D69B0000D1
      980001AB7600009050000000000000000000B0B0AD00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A8A8A500F9F8F800F5F4
      F400F4F3F300F4F3F300FFFFFF00ADADAB003F6B950074A1C3004F86B1005187
      B2004F86B2004581B000B8B2AB00FFFFFF00F4F3F300F4F3F300F4F3F300F4F3
      F300F4F3F300F4F3F300FFFFFF00ADADAB0000000000FFFFFF00DEDCDB00E0DD
      DD00E0DEDD00BFBEBD007D7D7D007D7D7D007D7D7D00979797007D7D7D00E0DE
      DD00E0DDDD00DEDCDB00FFFFFF008A8A8A00000000000000000016AB780011C9
      970000D49A0000D2970000CD8E00FFFFFF00FFFFFF0000CD8E0000D2970000D5
      9B0000C18C0001A169000000000000000000AEAEAB00FFFFFF00FCFCFC00FBFB
      FC00FBFBFC00FBFBFC00FBFBFC00FCFCFC00FFFFFF00A7A7A500F5F5F400F1F1
      F000EFEFEE00EFEFEE00FFFFFF00ADADAB003F6B970082ABCC005088B500528A
      B6005189B6004784B500B8B2AB00FFFFFF00F0F0EF00F0F0EF00F0F0EF00F0F0
      EF00EFEFEE00EFEFEE00FFFFFF00ADADAB008A8A8A00FFFFFF00DAD9D700DBDB
      D800DCDBD9008A8A8900A3A3A200DCDBD900C9C8C7007D7D7D0083838300DCDB
      D900DBDBD800DAD9D700FFFFFF000000000000000000008A480038C49C0000D1
      980000CD920000CB8E0000C78700FFFFFF00FFFFFF0000C7870000CB8E0000CE
      930000D09A0000AB7600008C4B0000000000ADADAB00FFFFFF00F7F6F600F7F6
      F600F7F6F600F7F6F600F7F6F600F7F6F600FFFFFF00A7A7A500F1F1F100EDED
      EC00EBEBEA00EBEBEA00FFFFFF00ADADAB003E6C970091B6D500528BBA00558C
      BB00548CBB004B88BB00B8B2AB00FFFFFF00ECECEB00EDEDEC00EDEDEC00ECEC
      EB00EBEBEA00EBEBEA00FFFFFF00ADADAB0000000000FFFFFF00D6D4D200D7D6
      D400D8D7D5008F8F8F008F8F8F00BAB9B800D8D7D500AEADAC0083838300D8D7
      D500D7D6D400D6D4D200FFFFFF008A8A8A00000000000089460051D2AF0012D4
      A300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000CF970000AD7800008B4A0000000000ADADAB00FFFFFF00F4F3F300F4F3
      F300F4F3F300F4F3F300F4F3F300F4F3F300FFFFFF00A8A8A500EDECEC00F4F3
      F300FFFFFF00FFFFFF00FFFFFF00AEAEAB003E6D97009FC1DD00538EBD005791
      BF005691BF004D8CBF00B7B1AA00FFFFFF00E9E8E800EAE8E900E9E8E800F3F2
      F200FFFFFF00FFFFFF00FFFFFF00AEAEAB008A8A8B00FFFFFF00D1D0CE00D3D2
      D000D4D3D100C8C8C6008E8E8E007D7D7D007D7D7D007D7D7D0083838300D4D3
      D100D3D2D000D1D0CE00FFFFFF0000000000000000000088450066DDBE0010D0
      A200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000CD970000AD7800008B4A0000000000ADADAB00FFFFFF00F0F0EF00F0F0
      EF00F0F0EF00F0F0EF00EFEFEE00EFEFEE00FFFFFF00A8A8A500E9E8E700FFFF
      FF00CACAC900A4A4A200FFFFFF00AFAFAD003E6E9900ACCAE4005691C1005A93
      C3005993C300508FC300B7B1AA00FFFFFF00E5E4E300E6E5E400E5E4E300FFFF
      FF00CACAC900A4A4A200FFFFFF00AFAFAD0000000000FFFFFF00CECCCB00D0CE
      CD00D1CFCE00C0BFBE00AAA9A800D1CFCE00D1CFCE00A4A3A30083828200D1CF
      CE00D0CECD00CECCCB00FFFFFF008B8B8B00000000000088460076E0C50000CA
      980000C5900000C48E0000C18700FFFFFF00FFFFFF0000C1870000C48E0000C7
      930000CB990000AB7600008C4B0000000000ADADAB00FFFFFF00ECECEB00EDED
      EC00EDEDEC00ECECEB00EBEBEA00EBEBEA00FFFFFF00A8A8A500E4E4E300FFFF
      FF00A4A4A200FFFFFF00E9E9E900CACAC8003E6F9A00B9D5EA005794C6005B97
      C8005B98C8005294C900B7B1AA00FFFFFF00E0E0DF00E0E0DF00E0E0DF00FFFF
      FF00A4A4A200FFFFFF00E9E9E900CACAC8008B8B8B00FFFFFF00CAC7C600CCCA
      C900CDCBCA00A8A7A6007D7D7D00A8A7A600A8A7A600888787008D8D8C00CDCB
      CA00CCCAC900CAC7C600FFFFFF0000000000000000000000000059C9A40049DE
      BC0000C7940000C7940000C38E00FFFFFF00FFFFFF0000C38E0000C8960000CB
      9A0006C1900000A168000000000000000000ADADAB00FFFFFF00E9E8E800EAE8
      E900E9E8E800F3F2F200FFFFFF00FFFFFF00FFFFFF00A9A9A600FFFFFF00FFFF
      FF00FFFFFF00E9E9E900CBCBC900000000003D709A00C6DEF0005997CB005E9A
      CD005E9BCE005798CF00BAB3AB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00E9E9E900CBCBC9000000000000000000FFFFFF00C5C4C200C8C7
      C500C9C8C600C9C8C600A6A5A40087878700828282008C8C8C00BFBEBC00C9C8
      C600C8C7C500C5C4C200FFFFFF008B8B8B0000000000000000000A945800ADF8
      E90018D0A70000C4940000C29000FFFFFF00FFFFFF0000C3910000C7990005C8
      9B0018B78700009050000000000000000000AEAEAB00FFFFFF00E5E4E300E6E5
      E400E5E4E300FFFFFF00CACAC900A4A4A200FFFFFF00ADADAA00AFAFAD00AEAE
      AC00AFAFAD00CACAC80000000000000000003E729D00D4E7F8005997CB007F95
      A70099938E0099938E00B0AFAD00B5B3AE00B2B0AC00B3B0AA00B4B0AB00B1B0
      AC00B0AFAD00CACAC80000000000000000008B8B8B00FFFFFF00C1BFBD00C4C2
      C000C5C3C100C5C3C100C5C3C100C5C3C100C5C3C100C5C3C100C5C3C100C5C3
      C100C4C2C000C1BFBD00FFFFFF0000000000000000000000000000000000199C
      6300BCFFF7005DE4C90000C3970000BF900000C0910000C4980022CAA20031C2
      970003935500000000000000000000000000AEAEAC00FFFFFF00E0E0DF00E0E0
      DF00E0E0DF00FFFFFF00A4A4A200FFFFFF00E9E9E900CCCCCB00000000000000
      00000000000000000000000000000000000042759F00ADD2F4005997CB00A7A1
      9B00D6CBC500D6CBC500D6CBC500A7A19B005997CB00A6D0F600336D9E000000
      00000000000000000000000000000000000000000000FFFFFF00B9B7B500BBB9
      B700BCBAB800BDBAB800BCBAB800BCBAB800BCBAB800BCBAB800BCBAB800BCBA
      B800BBB9B700B9B7B500FFFFFF008B8B8B000000000000000000000000000000
      00000E96590074D5B6009FF3E00092EFDA0079E5CA005DD6B5002EB586000391
      520000000000000000000000000000000000AFAFAD00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00E9E9E900CBCBC90000000000000000000000
      00000000000000000000000000000000000080A3C0003E77A4003E77A4009993
      8E00E5DDD800E5DDD800E5DDD80099938E003E77A4003C76A4007DA2C0000000
      0000000000000000000000000000000000008B8B8B00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000874400008743000087440000894600000000000000
      000000000000000000000000000000000000B8B8B600B0B0AD00AEAEAC00AEAE
      AB00ADADAB00AEAEAB00AFAFAD00BDBDBB000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000099938E0099938E0099938E00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007D7D7D000000
      0000848484000000000084848400000000007D7D7D00000000007D7D7D000000
      00007D7D7D000000000086868600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000008C
      4B00329D6C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BABAB900AFAFAD00AEAEAC00AEAE
      AC00AEAFAD00AFB0AE00AFB0AF00AFB0AE00AFAFAE00AFAFAD00AFAFAD00B0B0
      AE00BBBBB90000000000000000000000000000000000000000000087450054D9
      B000008847000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000008948000088470000884700008847000088470000884700008847000088
      470000884700008A49000D915500000000000000000000000000000000000000
      0000B97B3D00B0773F00BFA99400000000000000000000000000000000000000
      000000000000000000000000000000000000B0B0AD00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00B1B1AE00000000000000000000000000000000000087440065D7B30000D9
      A00000C384000085440000874600008847000088470000884700008847000089
      48000000000000000000000000000000000000000000000000000089470000B1
      740000D79C0000DCA10000DCA00000DCA00000DCA00000DCA00000DCA00000DC
      A00000DCA10000E1A700008A4900000000000000000000000000000000000000
      0000C1803C0000000000B2773F00000000000000000000000000000000000000
      000000000000000000000000000000000000AEAEAB00FFFFFF00FFFFFF00F7F3
      EF00C3845000A5480000A6490000A7490000AA6B3700ACA8A200ABAFB000ABAC
      AA00ADADAB00AFAFAD00B0B1AE00BABAB900008A480074DBBD0000D09C0000CE
      9A0000D59C0000D89F0000D9A00000D9A00000D9A00000D9A00000D9A10000D7
      9C0000B1740000894700000000000000000000000000008A470000C5930000D0
      9F0029D8AF005BE3C5005BE4C6005CE5C7005CE5C8005CE5C8005CE5C8005CE5
      C8005CE6C90060EACE00008A4800000000000000000000000000000000000000
      0000C9843A0000000000B97B3D0000000000000000000000000000000000C49D
      7700B0773F00B7916D000000000000000000AEAEAC00FFFFFF00F5EFEC00AB53
      0800C8843E00E4B27000E3AF6D00E5B27100CB874100AF570D00EFE9E600F5F7
      FA00F4F5F600F6F7F800FFFFFF00B0B1AE00008A480086E0C80000CB9B0000C9
      99005FE3C3005CE5C6005CE6C7005CE6C8005CE6C7005BE5C6005BE4C50029D8
      AF0000D09F0000C59300008A4700000000000000000000A8760000C5A1000DC8
      A60060D6BC0029AA780000864200008744000087440000874400008744000087
      440000874500008947004FB08300000000000000000000000000000000000000
      0000D5955100CCB7A000C07F3C00000000000000000000000000C0884E00D0A4
      7A0000000000B37A46000000000000000000AEAFAD00FFFFFF00C1844E00C67F
      3800DEA86500DAA15B00FFFFFF00DAA25B00DEA96600C8813A00BE814D00FFFF
      FF00FFFFFF00B48C7500FFFFFF00AFB0AE0000000000008743009BE3D00000C6
      9E0000C28F00008441000087440000874400008744000086420029AA780060D6
      BC000DC8A60000C5A10000A8760000000000068C4C0000C19A0000C6A00040CA
      AA000E9256000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000D0873600C98235000000000000000000C99A6A00C48849000000
      0000C4A98E00BE8853000000000000000000AFAFAE00FFFFFF00A6490000D89F
      5A00D69C5700D3944C00FFFFFF00D3944C00D69C5700D9A05B00A94E0000B896
      8700B7907C00B68E7900FFFFFF00AFAFAD00000000000000000000874300A4E6
      D900008845000000000000000000000000000000000000000000000000000E92
      560040CAAA0000C6A00000C19A00068C4C000089470000CFA40000CDA100009D
      6100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B3906D00B9B9B900D1A06A00CC853800CC8F4E00CC94
      5A00BE7E3C00000000000000000000000000AFB0AF00FFFFFF00A74A0000DCAB
      7100D1914900CF8C4100FFFFFF00CF8C4100D1914900DDAB7200A94D0000DEE8
      EF00DCE0E200DCDFDF00FFFFFF00AFAFAD00000000000000000000000000008B
      49003FA978000000000000000000000000000000000000000000000000000000
      0000009D610000CDA10000CFA400008947000089470000D6A30000D4A1000096
      5600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000AB8968009E958E00E09B4D0000000000000000000000
      000000000000000000000000000000000000AFAFAE00FFFFFF00A6480000E8CA
      A500CB863900CA843600C8813000CA843600CB863900E9CBA600A84B0000FFFF
      FF00FFFFFF00B58D7600FFFFFF00AFAFAD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000096560000D4A10000D6A300008947000088470000DAA30000D8A00000A0
      6100000000000000000000000000000000000000000000000000000000003EA0
      7400008C4B000000000000000000000000000000000000000000000000000000
      000000000000B5B8BC00D37C1D00B98B5E000000000000000000000000000000
      000000000000000000000000000000000000AEAFAD00FFFFFF00BD7E4800CF97
      6300E0B78900C8823600FFFFFF00C8823600E0B78A00D0996500B4764100B793
      8100B68E7A00B68D7700FFFFFF00AFB0AE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000A0610000D8A00000DAA30000884700078B4D0000D1970000D99F0000CB
      9000008D4B000000000000000000000000000000000000000000000000000089
      470054D9B0000088460000000000000000000000000000000000000000000000
      0000B7B6B600ECEDEF00BDB4A800CACCD0000000000000000000000000000000
      000000000000000000000000000000000000AEAEAC00FFFFFF00E5DFDB00AA52
      0600CC945E00E9CBAA00E8C9A700E9CBAB00CE966000AF560B00F8F4F000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B0B0AE000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000008D
      4B0000CB900000D99F0000D19700078B4D00000000002FBD8B0020DEAD0000D5
      9D0000C78F00009F6000008744000088460000884600008846000086430000BA
      7E0000D8A00065D7B3000087440000000000000000000000000000000000B0AE
      AB00EBEBEB00DAD9D900C4C3C300C7C6C6000000000000000000000000000000
      000000000000000000000000000000000000AEAEAB00FFFFFF00E9ECEE00E4DE
      DA00BD7E4700A7480000A7490000A8490000AC6D3700AEA9A200ACAFB000ACAD
      AC00AEAFAD00AFAFAD00B0B0AE00CBCBC900000000003FA07400008A49000088
      4600008846000088460000884600008846000088460000874400009F600000C7
      8F0000D59D0020DEAD002FBD8B000000000000000000008846003AD1AB0052E1
      C2001DD5AB0010D4A80011D5AA0011D6AB0011D6AB0011D6AB0011D5A90013D3
      A80000CC9B0000CE9D0074DBBF00008A48000000000000000000BEBDBD00EBEA
      EB00DBDAD90000000000CDCBCA00C8C7C5000000000000000000000000000000
      000000000000000000000000000000000000AEAEAB00FFFFFF00E3E5E400E6E9
      EA00E8EDF100E9F0F500E8F0F500FFFFFF00AAB0B200EDF0F100FFFFFF00EBEB
      EC00CDCDCC0000000000000000000000000000000000008A490014DFB00011DA
      AB0011DAAA0011DAAA0011DAAA0011DAAA0011DAAA0011D9A90010D4A9001DD5
      AB0052E1C2003AD1AB0000884600000000000000000000000000008845003ABA
      910062DEC80061E0CA0062E0CA0062E0CA0062E0CA0062E0CA0062E0C90065DE
      C70000C59A0000C69C0086DEC800008A48000000000000000000D4D4D300DDDC
      DB000000000000000000D4D2D100BDBBBA000000000000000000000000000000
      000000000000000000000000000000000000AEAEAC00FFFFFF00E0DFDE00E1E0
      DF00E1E1E100E1E2E100E1E1E100FFFFFF00A6A7A500FFFFFF00E8E8E800CBCB
      C9000000000000000000000000000000000000000000008A470066E2D00062DD
      CA0062DDC80062DDC80062DDC80062DDC80062DDC80062DDC90061E0CA0062DE
      C8003ABA91000088450000000000000000000000000000000000000000000000
      00000089460000884400008744000087440000874400008744000086410000AB
      7D0000BF9E009BDFD00000874300000000000000000000000000C5C3C2000000
      00000000000000000000D9D7D600C2C2C0000000000000000000000000000000
      000000000000000000000000000000000000AFAFAD00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E9E9E900CACAC9000000
      000000000000000000000000000000000000000000004FB0820000965D000093
      5A00009359000093590000935900009359000093590000945A00008743000089
      4500000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000089
      4500A4E4D9000087430000000000000000000000000000000000000000000000
      00000000000000000000D3D1D100B6B4B2000000000000000000000000000000
      000000000000000000000000000000000000B8B8B600B0B0AD00AEAEAC00AEAE
      AB00AEAEAB00AEAEAB00ADAEAB00AEAEAB00AFAFAD00B7B7B500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004EB0
      8300008C49000000000000000000000000000000000000000000000000000000
      00000000000000000000BBB9B700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C09E7900B5844E00B3824B00B3814B00B3814B00B3824B00B5844E00C09E
      790000000000000000000000000000000000BABAB900AFAFAD00AEAEAB00ADAD
      AB00ADADAB00ADADAB00AEAEAB00AEAEAC00AFAFAD00AFAFAD00B0B0AE00B6B3
      AF00C7C1BB0031699E00396D9E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000004B7DA30068A4D9000000000000000000000000000000
      000000000000000000000000000000000000000000006DA8D0004094D0003F92
      CF003F92CE003E92CF003E94D0006DA8D0000000000000000000000000000000
      0000BA854B00FFFFFC00FFFFF500FFFFF400FFFFF400FFFFF500FFFFFC00BA85
      4B0000000000000000000000000000000000B0B0AD00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0023629E0025B0FF0044C8FF003A83CC005C5C5C005C5C5C005E5B5A005E5A
      59005D5A5A005B5A5B005A5B5B005A5B5B005A5B5B005B5A5A005C5956005768
      76004E7EA4004C80AC005082AB0065A2D5000000000000000000000000000000
      000000000000000000000000000000000000000000003B93D100A9F9FF008FF0
      FF008FEFFF008DF0FF00D2FFFF003E94D0009A9A9A0081818100818182007F83
      8600BD854600FFFFF700FFF3DA00FFF2D900FFF2D900FFF3DA00FFFFF700BD85
      46007F83860081818200818181009A9A9A00AEAEAB00FFFFFF00FDFDFD00FCFC
      FD00FDFDFD00FEFEFE00FFFFFF00D3D3D4006E6F710058585C005A5A5D006360
      60007D7068003AC6FF0057DBFF003981C9000000000000000000000000003F69
      A50075666700706869006D6969006C6A69006C6A69006C6A68006E6762004C89
      BA004E85B2004D83AE005D8CB200629ED1000000000000000000000000000000
      000000000000000000000000000000000000000000003390D100B7F3FF0077E0
      FD0077E0FD0076E0FE00DAFEFF003B92CF0081818100D5D2D100CBC9C9007D7C
      7C0067676800A8A6A800A4A2A400A3A2A300A3A2A300A4A2A400A8A6A8006767
      68007D7C7C00CBC9C900D5D2D10081818100ADADAB00FFFFFF00FAF8F800F9F8
      F800FAF9F900FFFDFE00D1D1D20067646300E3C38C00FFEBA400FFF3AF00E7D3
      A10076706B00A09085003280CF00000000000000000000000000000000001382
      6B0000934600715C62006A62630067646300666463006764620068615B004F8A
      BB005086B4004F84B1006895B9005F9BCD0063A4D1004397D1004094D0003C92
      D0003991D0003B92D1004899D3000000000000000000308FD200CEF7FF00B5EE
      FE00DBF9FF00DDFBFF00E2FFFF003D94D0007F7F7F00DAD7D600C2BFBE00C8C5
      C400AFACAC00AFACAB00ADAAAA00ADAAAA00ADAAAA00ADAAAA00AFACAB00AFAC
      AC00C8C5C400C2BFBE00DAD7D6007F7F7F00ADADAB00FFFFFF00F6F6F600F6F6
      F600F8F8F800FEFFFF0077787900E3BE8400FFE6A500FFE7A600FFEFB300FFF9
      BB00E9D6A200807875000000000000000000000000000000000000000000008C
      46004FDDB000008D43006B585E00655E60006361600062605F00645D5700518D
      BE00528AB7005187B400739FC2005D97C9004397D10054A6D90082E3FD0086EB
      FF0083EAFF0085ECFF0051B3E40000000000000000003492D300DCFDFF00DAFB
      FF00348DCD003991CE003D94D0007EB8E0007E7E7E00E1E0DF00BDBBB9009290
      8E007B7977007D7B78007D7B78007D7B78007D7B78007D7B78007D7B78007B79
      770092908E00BDBBB900E1E0DF007E7E7E00ADADAB00FFFFFF00F4F4F300F4F4
      F300F6F6F500FDFEFE00696A6D00FFE09D00FFEFCA00FFE7B300FFE9AB00FFEF
      B200FFF4AF007876770000000000000000000D915400008A4700008845000084
      410000DAA20060D9B300008D420068545A00625B5C00605C5A00605852005490
      C200558CBA004E81AD007EA6C8005A94C4004095D000A0E5FB0048A7DD00DDFA
      FF00DAF9FF00DBFAFF00DDFCFF0059A0D30000000000539FD4003C93D0003B92
      CF005CA0D0000000000000000000000000007D7D7D00EDEBEB00B8B5B3006462
      61006B6968006C6A69006C6A69006C6A69006C6A69006C6A69006C6A69006B69
      680064626100B8B5B300EDEBEB007D7D7D00ADADAB00FFFFFF00F2F1F000F2F1
      F000F4F3F200FBFAFB006F6F7200FFDD9700FFF7E400FFEDC800FFE7B200FFE6
      A500FFECA5007C7B7E000000000000000000008A470063EDD00000D4A00000D2
      9E0000CC9C0000CD9C006FDCBD0000934600615457005C5756005B534D005794
      C500588EBC0047749B0088AFCF005790C0003D93CF00C1F7FF0051B5E5002F89
      CA002F8ACB00328CCC003992CF003F97D3000000000075ABD0003E93CF003E91
      CE003E92CE003E92CF003E94D0006EA9D1007C7C7D00F9F8F800F3F4F2009491
      90009B9897009C9998009C9998009C9998009C9998009C9998009C9998009B98
      970094919000F3F4F200F9F8F8007C7C7D00ADADAB00FFFFFF00EFEFEE00EFEF
      EE00F0F1F000F6F7F70084858700E7BB7C00FFF5DB00FFF7E400FFEECA00FFE5
      A400EBCC9500868587000000000000000000008A470061E1D00060DDCA0063DC
      C80000C49B0000C69C0082E1C800009447005C50540058535300574F4A005A96
      CA005B8FBE0022B9F70095B5D300548DBC003B92CF00D2F9FF00B6F0FF00DCFD
      FF00DFFFFF00E5FFFF003E95D00000000000000000003C93D100A9F9FF008FF0
      FF008FEFFF008DF0FF00D2FFFF003E94D0007C7C7D00F4F3F200D3D1D000827F
      7E00888685008986860089868500898685008986850089868500898686008886
      8500827F7E00D3D1D000F4F3F2007C7C7D00ADADAB00FFFFFF00ECEBEA00EDEC
      EB00EEECEB00F1F0F000CFCFD00083807D00E8BC7D00FFDC9700FFDF9C00EAC5
      8B008C88870000000000000000000000000010945700008A4700008844000085
      3F0000C1A00097E3D100008F43005A484E005650510053514F00524B45005B9A
      CD005C91C10020B7F5009EBCD7005189B8003D94D000DCFDFF00DAFBFF00358F
      CD003A92CF003E95D0007EB8E00000000000000000003490D100B7F3FF0077E0
      FD0077E0FD0076E0FE00DAFEFF003B92CF007E7E7E00FFFFFF00FFFFFF006D6B
      6A00706F6F006C6B6B006A6867006A6867006A6867006A6867006C6B6B00706F
      6F006D6B6A00FFFFFF00FFFFFF007E7E7E00ADADAB00FFFFFF00E9E9E800EAEA
      E900EAEAE900EBECEB00EFEFEF00D8D7D8009494960085858800848487009796
      9800A9AAAA00000000000000000000000000000000000000000000000000008B
      4400A0E8DA000091440055434A00524B4D004F4D4E004F4D4C004D4641005E9C
      D2005C95C5005990C100A6C4DF004E86B5004E9ED5003D94D0003D94D00053A1
      D50000000000000000000000000000000000000000003190D200CEF7FF00B5EE
      FE00DBF9FF00DDFBFF00E2FFFF003D94D000A9A9A9007F7F7F007F7F80008083
      8700BF864800FFFFF800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF800BF86
      4800808387007F7F80007F7F7F00A9A9A900ADAEAB00FFFFFF00E7E5E400E8E7
      E600E8E7E600E8E7E600E8E7E600FFFFFF00D3D3D300AFB0AF00AEAFAD00FFFF
      FF00B3B3B1000000000000000000000000000000000000000000000000001786
      6D0000964700523F45004F4749004D494A004C4A4A004C4848004A423D0060A0
      D5005D98C9005894C600AFCCE6004B83B0000000000000000000000000000000
      000000000000000000000000000000000000000000003692D200DCFDFF00DAFB
      FF00348DCD003991CE003D94D0007DB7E0000000000000000000000000007577
      7A00BA834700FFFFF300FFF0DD00FFEFDC00FFEFDC00FFF0DD00FFFFF300BA83
      470075777A00000000000000000000000000AEAEAB00FFFFFF00E3E3E200E4E4
      E300E4E5E400E4E4E300E3E3E200FFFFFF00A8A8A600EDEDEC00FFFFFF00EAEA
      EA00CACAC9000000000000000000000000000000000000000000000000004D7B
      B0004C3D3B004A43430048454400484644004846440047454200433C36005FA1
      D8005C9ACC005896C900B8D3EB004980AC000000000000000000000000000000
      000000000000000000000000000000000000000000007EB9E1003D94D0003D94
      D00082BAE1000000000000000000000000000000000000000000000000000000
      0000B7834900FFFFF400FFE1C000FFE0BF00FFE0BF00FFE1C000FFFFF400B783
      490000000000000000000000000000000000AEAEAC00FFFFFF00E0DFDE00E1DF
      DE00E1E0DF00E1DFDE00E0DFDE00FFFFFF00A5A5A300FFFFFF00E8E8E800CBCB
      C900000000000000000000000000000000000000000000000000000000004A7F
      AC0044383100433B3700433D3800433D3800433D3800423B36003C332C00B9DA
      F5007FB0DA005495CC00C0DAEF00467CA8000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B7854E00FFFFFD00FFFFF500FFFEF400FFFEF400FFFFF500FFFFFD00B785
      4E0000000000000000000000000000000000AFAFAD00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E9E9E900CACAC9000000
      00000000000000000000000000000000000000000000000000000000000082A6
      C3004A82AE004A83B0004A83B0004A83B0004A83B0004A82AF00447DA900709C
      BF00B9D5EB00B3D1EA00C1DBF2004279A5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CEAE8A00B5844F00B3824B00B3814B00B3814B00B3824B00B5844F00CEAE
      8A0000000000000000000000000000000000B8B8B600B0B0AD00AEAEAC00AEAE
      AB00AEAEAB00AEAEAB00ADAEAB00AEAEAB00AFAFAD00B7B7B500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000CEE3F5003F75A1000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000AC731400AD751900AC731600AC721400AB721400AA711300AA70
      1300AA701300AA711300AC741900B07A23000000000000000000000000000000
      00000000000000000000C3AA7700BF881600BF881600BF881600BF881600BF88
      1600BF881600BF881600BF881600BF9D58000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000058A0D1004296D1004296D1004094D0003F92CF003F92CE003F92CE003F92
      CE003F92CE003F92CF004094D0004D9BD200C3AB7A00B7821600B37A0600D7D0
      D400D8D1D300A96D0B00F7EFE300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00AC7419000000000000000000000000000000
      00000000000000000000BF881600F6CD8B00F3C27500F9FCFF008B8D9000F9F9
      F900F4F8FC00F2C17400F6CD8B00BF8816004B9CD4003695D7003694D8003694
      D8003694D8003694D8003694D8003694D8003694D8003694D8003D92D0003694
      D8003694D8003694D8003694D7004B9CD4000000000000000000000000000000
      00004195D000AAF9FF0091F0FF0092F0FF0091F0FF0092F0FF0092F0FF0092F0
      FF0092F0FF0092F0FF00A8F9FF004094D000B7821800F6CC8A00F0C17200F9F7
      FC00FFFFFF00A6690500F5EBDA00979A9F005354560095969700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00AA7114000000000000000000000000000000
      00000000000000000000BF881600F3CC8B00EBB65C00F2EDEC007F797800F1E9
      E200EEE9E800EAB55A00F3CC8B00BF8816004095D10091FBFF0091FBFF0091FB
      FF008CF8FF0092F4FF0093F3FF0093F2FF0093F3FF0093F3FF0092F4FF0090F3
      FF0091FBFF0091FBFF00A0FEFF003F94D1000000000000000000000000000000
      00004094CF00BAF5FF007FE3FF0081E3FE007FE3FF0081E3FE0082E3FE0082E3
      FE0082E3FE0081E4FF00B0F3FF003D92CF00B6811600F3CA8600EBB66000F8F5
      F800FFFFFF00A5680300F5EAD900FFFFFF0057575700FFFFFF00FBFBFA00F6F6
      F500F5F5F400F5F7F700FFFFFF00AA711300000000000000000000000000C3AA
      7700BF881600BF881600BF881600F3CE9200E6AC4D00EAD9C600FFFFFF00FDFE
      FF00E8D7C400E6AC4C00F3CE9300BF8816003E93D00088F4FF0088F4FF0088F4
      FF0088F4FF0080EEFF0082EDFF0082EDFF0082EEFF0082EEFF0081EFFF0088F4
      FF0088F4FF0088F4FF009FF8FF003D93D0000000000000000000000000000000
      00003F93CF00D3F9FF0070DBFC0071DAFB0070DBFC0071DAFB0072DAFB0072DA
      FB0073DAFB0073DBFB00BFF3FF003C92CE00B6811600F1CA8900E8B15500F9F8
      FD00FAF8FB00A6690500F6ECDB008C8E9200545556008B8B8C00E3E2E300DFDE
      DE00DEDEDE00DDDEE000FFFFFF00AA711400000000000000000000000000BF88
      1600F7CE8E00F5C78000BF881600F4D29B00E3A43B00E3A33500E3A13100E3A1
      3100E3A23500E3A43B00F4D39B00BF8816003F93D00082EDFF0082EDFF0082ED
      FF0082EDFF0082EDFF0082EDFF0082EDFF0082EDFF0082EDFF0082EDFF0082ED
      FF0082EDFF0082EDFF00A2F5FF003D92D0000000000000000000000000000000
      00003E93CF00DEFCFF00DAFAFF00DBF9FF00DAF8FF00AEEAFE0064D5FA0064D5
      FA0064D5FA0064D5FA00D3F8FF003B92CF00B6811500F3CB8F00E6AD4D00FDFF
      FF00EEE7E500A76B0900F6EFE300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00AC741900C3AA7700BF881600BF881600BF88
      1600F4CD8D00EEBD6A00BF881600F5D5A300E8C99D00EDE4E100EEE4DF00EEE4
      DF00EDE4E100E8C99D00F5D6A500BF8816003F93CF007DE8FF007DE8FF007DE8
      FF007DE8FF007DE8FF007DE8FF007DE8FF007DE8FF007DE8FF007DE8FF007DE8
      FF007DE8FF007DE8FF00A8F2FF003D92CF006EA8D0004296D1004296D1004095
      D0003B91CE00388DCC00388DCC00368CCB00318BCB00D8F9FF00D6F7FF00D6F7
      FF00D6F7FF00D6F7FF00DBFBFF003D94D000B6811500F3D09500E4AA4600E8CB
      A500FFFFFF00A66D1000A76F1300A76D1000A66D0E00A66C0E00A56C0E00A56B
      0E00A66C0E00A96F1200AC741900B07A2300BF881600F7CE8E00F5C78000BF88
      1600F3CF9400EAB35900BF881600F7DCAF00EFE7E300B1A9A400B3ABA400B3AB
      A400B1A9A400EFE7E300F7DDB000BF8816003F93CF0076E1FF006DDDFF0069DD
      FF0068DDFF006ADEFF006DDEFF006FDEFF006FDEFF006FDEFF006FDEFF006FDE
      FF006FDEFF0070DDFF00AFEFFF003D92CF004195D0009DFCFF0091F0FF0091F0
      FF00368DCC00C6F5FF006FDBFC0063C8F1003E9BD500318BCB00308BCC00358E
      CD00358ECD00358ECD00358ECD003F95D100B6811500F3D39C00E3A53E00E2A2
      3700E4A13200E6A43700E7A53A00E7A63A00E7A63A00E7A63C00E7A84000E8AA
      4300F6D69E00B88212000000000000000000BF881600F4CD8E00EEBD6A00BF88
      1600F4D39C00E7A94400BF881600F9E4C400EFEBE500F0EAE000F1EBE000F1EB
      E000F0EAE000EFEBE500FAE5C500BF8816003E94D000E1FFFF00DAFAFF00D9F9
      FF00D9FAFF00DCFAFF006EDAFD0070D9FC0070D8FB006FD8FB006FD8FB006FD8
      FB006FD8FB006CD8FB00B5EFFF003D92CF004094CF009FF8FF0081E3FE0081E3
      FE00328BCB00D3F6FF0062D3F90063D4F900B7EDFE00DBFAFF00DCFBFF00DEFE
      FF00DEFEFF00DFFFFF00E4FFFF004096D100B6811400F4D5A400E09E3100F4E0
      B700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F4E1B800E19F
      3200F5D6A400B68114000000000000000000BF881600F4CF9500EAB35900BF88
      1600F5D6A500EACEA800BF881600FDE6C100FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FEE9C700BF8816004095D100378ECD00348BCB00358B
      CB00368BCA00378ACA005BBBEA006CD6FB0068D4FA0066D2F90065D2F90065D2
      F90065D2F90063D2FA00B9F0FF003C92CF003F93CF00A7F6FF0070DBFC0070DB
      FC00318CCC00DAFBFF00D8F8FF00D8F8FF00D8FAFF00308ACB00338DCC003790
      CE003A92CF003B93D0003E95D0004F9ED500B6801400F5DAAE00DF982200FCFF
      FF00797C8000A1A3A500FEFBF200797A7C00A3A4A600A0A3A700FBFEFF00DF97
      2200F5DAAE00B68014000000000000000000BF881600F5D49D00E7A94400BF88
      1600F7DDB000F0EAEA00E0BC7300BF881600BF881600BF881600BF881600BF88
      1600BF881600BF881600BF881600D1AE69003E94D000C8F8FF0072DDFE0075DD
      FD0076DEFD0076DEFE004FAADC0054B8E800D9F7FF00D5F6FF00D5F6FF00D5F6
      FF00D4F5FF00D4F6FF00D9FBFF003D94D0003E93CF00B1F7FF00DAFAFF00E3FF
      FF006EB3DF003991CE003991CE00378FCD00338DCC0043A5DC00D9FEFF003C93
      D00000000000000000000000000000000000B6801300F7DFB900DD921500FCFC
      FC00FDF8EC00FFF8EA00FDF6E800FCF6E800FBF4E700F9F4E800FAFAFA00DC91
      1500F7DFB900B68013000000000000000000BF881600F6D7A700EACEA900BF88
      1600F9E4C300EFECE800F0ECE900F1EEEC00F1EEEC00F1EEED00F2F0F100FDE9
      CD00BF8816000000000000000000000000003B92CF00CEF7FF0069D5FA006DD5
      FA006DD5FA006BD5FA006BD8FC0047A8DD00318ACB002F8ACB002F8ACB002F8A
      CB002F8ACB00308BCB00358FCD004095D1003D93CF00388DCC00388DCC00388D
      CC00318BCB00DEFEFF00DEFEFF00DEFEFF00DEFEFF00D9FBFF00DCFEFF003D94
      D00000000000000000000000000000000000B67F1200FAE5C500DA8C0900FEFE
      FF00787879007A797900A2A1A1009F9E9E00F5EBE0009B9B9D00FCFCFF00DA8C
      0900FAE5C500B67F12000000000000000000BF881600F8DEB200F0ECEE00BF88
      1600FCE4BF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFE9
      C900BF8816000000000000000000000000003B92CF00D5F8FF0060D1F90063D1
      F80062D1F800B5EBFD00DAF8FF00DCFBFF00DDFDFF00DDFDFF00DDFDFF00DDFD
      FF00DDFDFF00DDFEFF00E3FFFF004096D1003B92CF00C7F5FF006EDBFC0063C8
      F1004BACDF00318CCC00318CCC00318CCC00318CCC00308CCC00358FCD003F95
      D10000000000000000000000000000000000B67F1200FBECD200D8840000FFFF
      FF00F1E5DA00F2E6DA00F2E6DA00F0E4D800EEE2D700EEE2D800FEFFFF00D883
      0000FBECD200B67F12000000000000000000BF881600FBE6C700F0EFEF00E0BC
      7300BF881600BF881600BF881600BF881600BF881600BF881600BF881600BF88
      1600DDC491000000000000000000000000003D94D000DCFCFF00D8F8FF00D9F7
      FF00D9F7FF00DBFAFF00358ECD003A92CF003B92CF003B93CF003B93CF003B93
      CF003B93CF003B93D0003E95D0007DB8E0003B92CF00D5F7FF0062D2F90062D2
      F900B6ECFE00DBF9FF00DCFBFF00DDFDFF00DEFEFF00DFFFFF00E4FFFF004096
      D10000000000000000000000000000000000B7811400FFECCD00FCE6C300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FCE6
      C300FFECCD00B78114000000000000000000BF881600FFE9C800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFEDD000BF881600000000000000
      0000000000000000000000000000000000006EAFDC003D94D0003A92CF003A92
      CF003A92CF003D94D00072B2DD00000000000000000000000000000000000000
      0000000000000000000000000000000000003D94D000DCFDFF00D8F9FF00D8F8
      FF00DBFBFF00358ECD003991CE003A92CF003B92CF003B93D0003E95D0007DB8
      E00000000000000000000000000000000000DEC69500B7811400B57E0F00B57C
      0B00B57C0900B57C0900B57C0900B57C0900B57C0900B57C0900B57C0B00B57E
      0F00B7811400DEC695000000000000000000D1AE6900BF881600BF881600BF88
      1600BF881600BF881600BF881600BF881600BF881600D2B06B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004F9ED5003D94D0003A92CF003A92
      CF003D94D00053A1D50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000008C4C003EA0730000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BABAB900AFAFAD00AEAEAB00ADAD
      AB00ADADAB00ADADAB00ADADAB00AEAEAC00B3B0AF00C5B5B900529F7A00008B
      4800008B4900008C4C0053A88200000000000000000000000000000000000000
      0000000000000000000068A4CE004195D100469AD40000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000088470018C891000087460000000000000000000000
      000000000000000000000000000000000000C2A97500B7821800B6801400B37A
      0600D7CFD200D8CEC900CFCECD00C9BFAC00D9CFCE00D5CAC300D4CAC400D6CF
      D200B37A0600B6801400B7821800C2A97500B0B0AD00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF006DC29B000094520000BA
      840077E0C60000BB860000995C0053A8820000000000000000000000000068A4
      CF004092CE0054ADDE0066C4ED0078E0FE003591D100BBB2AA00B0AEAB00ADAD
      AB00AEAEAB00AFAFAD00BABAB90000000000000000000000000068A4CF004092
      CE00438AB200008846003CCE9E0000DCA20000BC7F00009B5C00009D5F000088
      470000894800249761000000000000000000B7821800F6CD8B00F2C67D00F0C1
      7100FAF7FB00FFFFFF004C48480098939200FFFFFF00F7EFEA00F6EFEB00F9F6
      FA00F0C17100F2C67D00F6CD8B00B7821800AEAEAB00FFFFFF00FDFDFD00FCFC
      FD00FCFCFD00FCFCFD00FCFCFD00FFFEFF00FFFFFF00007F360000BE880000BC
      8300FFFFFF0000BC830000C18D00008C4C00000000004E9CD10058B0DF006DC9
      EF007FE2FD007EE3FE007ADEFC007EE1FF00308CCD00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00B0B0AD00000000004E9CD10058B0DF006DC9EF007FE2
      FD00008C4A0061D8B50000D49E0000D29C0000D5A1005ADEC7005ADEC7005ADE
      C7005ADEC70000C28C000090500000000000B6811600F3CA8700EDBC6D00EBB7
      6100F8F5F700FFFFFF004A454100948C8800FFFFFF00F1E8E000F0E7E000F7F4
      F700EBB76100EDBC6D00F3CA8700B6811600ADADAB00FFFFFF00FAF8F800F9F8
      F800F9F8F800F9F8F800F9F8F800FDFAFB00FFFFFF00007F370072E5CB00FFFF
      FF00FFFFFF00FFFFFF0077E7CE00008B4900000000004094CF0092F1FF0085E7
      FF0080E1FD007ADEFB0077DBFB0083E1FF00308ACB00FFFFFB00FFFFFD00FCFC
      FC00FCFCFC00FFFFFF00AEAEAB00000000004094CF0092F1FF0085E7FF0080E1
      FD007ADEFB000087440086EBDB0000C69F0000B1800000874500008D4D00009B
      6000009A5F0000B2800000B6890044A27700B6811600F1CB8900E9B76200E7B2
      5700F9F8FB00FDF7F200877F79004A444100FEF7F200EEE3D800EDE2D900F8F7
      FB00E8B25700E9B76200F1CB8900B6811600ADADAB00FFFFFF00F6F6F600F6F6
      F600F6F6F600F6F6F600F6F6F600F9F7F800FFFFFF00007E360000CA940000C8
      8F00FFFFFF0000C9900000CD9900008C4B00000000003E92CE009AF0FF0083E4
      FD007EDFFC007ADDFB0076DAFA0089E2FE0048A8DD0070AED900FFFCF800F9F6
      F600F7F6F600FFFFFF00ADADAB00000000003E92CE009AF0FF0083E4FD007EDF
      FC0062B1C9006DC9E60000874200A3EEED00008845008DEDFF009FF3FF00367F
      B400000000003CA6750000A1710000915300B6811600F3CC8E00E8B25A00E7AE
      5100FCFFFF00ECE0D700F1E4DA00F1E5DA00EDE0D500EADDD300E9DED500FBFF
      FF00E7AE5100E8B25A00F3CC8E00B6811600ADADAB00FFFFFF00F4F4F300F4F4
      F300F4F4F300F4F4F300F4F4F300F6F5F500FFFAFC0063B68F00009B590000D1
      9A0074EED40000D49F0000A3670068BC9600000000003E92CE00A3F1FF0082E3
      FC007EDFFC007ADDFB0076DAFA0071D9FB009DE8FF002A89CB00FFFBF600F6F4
      F300F4F3F300FFFFFF00ADADAB00000000003E92CE00A3F1FF0082E3FC007EDF
      FC00008E4E0038A1960060B8D500008B4800138C770087EBFF00A3F2FF001184
      6B00008B4A000000000000000000008E4E00B6811500F3CE9400E6AE5100E5AB
      4B00E6C9A400FFFFFF00FFFFFF00FFFFFF00FEFFFF00FDFFFF00FEFFFF00E6C9
      A400E5AC4B00E6AE5100F3CE9400B6811500ADADAB00FFFFFF00F2F1F000F2F1
      F000F2F1F000F2F1F000F2F1F000F3F1F000F8F3F400FFF9FD0062B58E000080
      370000843E000089470069BD960000000000000000003D92CE00ADF3FF0081E3
      FC007EDFFC007ADDFB0076DAFA006FD8FA00ABEBFF002B89CC00FFF8F100F2F1
      EF00EFF0EE00FFFFFF00ADADAB00000000003D92CE00ADF3FF0081E3FC007EDF
      FC000093530000AE7000159267008ABCCC002A6EA2008DC3CC0089C3CC000088
      470018E8B400008645000000000000000000B6811500F3D09A00E5A84500E3A6
      4000E2A13600E29E2F00E19D2D00E19D2C00E19D2C00E19D2D00E29E2F00E2A1
      3600E3A64000E5A84500F3D09A00B6811500ADADAB00FFFFFF00EFEFEE00EFEF
      EE00EFEFEE00EFEFEE00EFEFEE00EFEFEE00F0EFEF00F4F1F100FDF4F600FFFF
      FF00CBB4BB00000000000000000000000000000000003C92CE00B6F6FF0080E3
      FC007DDFFC007ADDFB0076DAFA006ED7FA00B9EFFF002A89CC00FCF2ED00EEEC
      EB00EBEAEA00FFFFFF00ADADAB00000000003C92CE00B6F6FF0080E3FC007DDF
      FC0029A7860000C3870000BB7E00009D5F00009F6000008847000087450000BC
      800000DBA0003CE9BD000087450000000000B6811400F4D4A000E1A13600F2DE
      B700FCFFFF00FBFFFD00FBFFFC00FBFFFD00FBFFFD00FBFFFD00FBFFFD00FBFF
      FF00F2DEB700E1A13600F4D4A000B6811400ADADAB00FFFFFF00ECEBEA00EDEC
      EB00EDECEB00EDECEB00EDECEB00ECEBEA00ECEBE900ECEBEA00EEEBEB00FFFF
      FF00B7AFB000000000000000000000000000000000003C91CE00C0F8FF007FE2
      FC007DDFFC007ADDFB0075DAFA006DD7FA00C6F3FF002989CB00FFF9F400FFFF
      FF00FFFFFF00FFFFFF00AEAEAB00000000003C91CE00C0F8FF007FE2FC007DDF
      FC007ADDFB00008F500000C48C0000DBA9005ADEC7005ADEC7005ADEC70000D4
      A10000D19C0000D39E0061DBB700008C4A00B6801400F6D8A700E09C2700FBFF
      FF00FCFBF300FCF9EF00FBF8EE00FCFAF000FCFAF000FBF9EE00F9F8ED00FAF9
      F100FAFEFE00E09B2700F6D8A700B6801400ADADAB00FFFFFF00E9E9E800EAEA
      E900EAEAE900EAEAE900E9E9E800F3F4F200FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00AFAEAC00000000000000000000000000000000003B91CE00C9F9FF007EE2
      FC007CDEFC0078DCFB0072D9FA006AD6FA00D2F6FF002888CB00FFFFFF00CDCB
      C900A4A4A200FFFFFF00AFAFAD00000000003B91CE00C9F9FF007EE2FC007CDE
      FC0078DCFB0072D9FA0013986900008A490000894800008948000087450000B1
      800000C7A00086DCC5000087440000000000B6801400F8DCB000E0981C00FBFB
      F80079787B00A2A0A200FCF6EA0079787900A3A1A300A09FA100FAF4E9009D9D
      A000F9F9F600E0981C00F8DCB000B6801400ADAEAB00FFFFFF00E7E5E400E8E7
      E600E8E7E600E8E7E600E7E5E400FFFFFF00CBCBCA00A7A7A400A5A5A300FFFF
      FF00AFAFAD00000000000000000000000000000000003A91CE00D2FCFF007AE2
      FC0077DDFC007FDFFB009BE6FD00B3EDFF00D4F9FF002688CB00FFFFFF00A7A5
      A200FFFFFF00E9E9E900CACAC800000000003A91CE00D2FCFF007AE2FC0077DD
      FC007FDFFB009BE6FC00B4EDFF00D8FAFF00318ACB00C6F8FF003D93CF000089
      4600A3E4DA00008744000000000000000000B6811300FCE3BC009B610400FDFC
      F900FDF5E800FEF4E700FBF2E500FCF2E500FBF2E500FBF2E500FAF1E300F9F1
      E500FCFAF7009A610400FCE3BC00B6811300AEAEAB00FFFFFF00E3E3E200E4E4
      E300E4E5E400E4E4E300E3E3E200FFFFFF00A7A7A400EBEBEA00FFFFFF00E9E9
      E900CACAC800000000000000000000000000000000003991CF00E9FFFF00AFF0
      FF00CEF7FF00DAFAFF00C4ECFC008CCAEC005FAEE00082BDE600FFFFFF00FFFF
      FF00E9E9E900CBCBC90000000000000000003991CF00E9FFFF00AFF0FF00CEF7
      FF00DAFAFF00C5EBFB0090C8EA0066ADDB0047A8DD00CBF8FF003C92CF004EB0
      8300008C4900000000000000000000000000B6801200FEE9C60071410000FFFF
      FF0079797A007A7A7A00A2A1A1009F9F9F00F6ECDE0077777700A1A1A1009E9F
      A000FFFFFF0070410000FEE9C600B6801200AEAEAC00FFFFFF00E0DFDE00E1DF
      DE00E1E0DF00E1DFDE00E0DFDE00FFFFFF00A5A5A300FFFFFF00E8E8E800CBCB
      C90000000000000000000000000000000000000000003C93D000E9FFFF00A8DA
      F3007BBDE4004398D200408EC7006E9CBC0090A5B200BAAFA600B5ADA600B5AF
      A900CFCDCA000000000000000000000000003C93D000E9FFFF00A8DAF3007BBD
      E4004398D1003493D10046AAE00053BDEB0061D3FB00CEF8FF003B92CF000000
      000000000000000000000000000000000000B6801200FDECD100DA860000FFFF
      FF00F1E5D800F2E5D800F2E5D700F0E3D600EFE2D500F1E4D700F1E4D600EFE3
      D600FFFFFF00DA860000FDECD100B6801200AFAFAD00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E9E9E900CACAC9000000
      000000000000000000000000000000000000000000004297D2003B93D00062AD
      DC0093CDED00BBE7FA00D8FCFF00D6FCFF00D3FBFF00D1FBFF00D3FCFF002E91
      D500000000000000000000000000000000004297D2003B93D00062ADDC0093CD
      ED00BBE7FA00D9FCFF00D9FAFF00D7F9FF00D7F9FF00D9FBFF003D94D0000000
      000000000000000000000000000000000000B7811500FFECCD00FCE7C300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FCE7C300FFECCD00B7811500B8B8B600B0B0AD00AEAEAC00AEAE
      AB00AEAEAB00AEAEAB00ADAEAB00AEAEAB00AFAFAD00B7B7B500000000000000
      0000000000000000000000000000000000000000000051A0D6004498D2004197
      D1003F95D1003D94D0003B93D0003A92D0003A92D0003A93D0003C94D1004B9E
      D6000000000000000000000000000000000051A0D6004498D2004197D1003F95
      D1003D94D0003B93D0003B92CF003B92CF003B92CF003D94D0004F9ED5000000
      000000000000000000000000000000000000DCC28F00B7811400B57E0F00B57C
      0B00B57C0900B57C0900B57C0900B57C0900B57C0900B57C0900B57C0900B57C
      0900B57C0B00B57E0F00B7811400DCC28F00424D3E000000000000003E000000
      2800000040000000500100000100010000000000800A00000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFFFFFF0000C003807FFE3F0000
      C003807FFC1F0000C0038000F80F0000C0038000F0070000C0038000E0030000
      C0030000C0010000C003800080000000C003C00080000000C003E00080000000
      C003E000C0010000C003E000E0030000C003E000F0070000C003E000F80F0000
      C003E000FC1F0000C003E000FE3F0000FFFFFFFFFFFFFFFFFBF3FFFFFFFFFE7F
      E1C0C0070000FC3FC0CCC0070000000381FCC007000000039BC1C00700000001
      BFCFC00700000000E0CEC00700000000C0C0C007000000038FF3C00700000000
      03FEC007000000009FECC0070000000101C0C007E7FF00038F81C001E3FF0003
      C0C3FC01F3FF0003E0EFFC01FFFF0003FFFFFFFFFFFFFFFFFC7FFC00FFCF0000
      E071FC00F847000080011C00E003000080010000C00100008001000080000000
      8001000080010000800100000003000080010000000300008001000000030000
      80010000000300008001000F800700008001000F800780018001000FC00FC003
      8001000FE01FE007800F1F8FF87FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFC47FFFFFFFFFFFFFC43FFC3FF18FF00FC41FF81FF18FF00FC40F
      F00FF18FF00FC407F00FF18FF00FC403F00FF18FF00FC403F00FF18FF00FC407
      F81FF18FF00FC40FFC3FF18FF00FC41FFFFFFFFFFFFFC43FFFFFFFFFFFFFC47F
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0FFFFFF0000FF83E07FC7E3
      00000001F07FC00300000000F83FC00300000000FE1FC00300000000FE1FC003
      00000000FF0FC00300000000FFC7C00300000001E663C00300000003C631C003
      0000000F8618C0030000000F0F0CC0030000000F0F0FC0030000001F861FC003
      0000003FC63FC0030000007FE67FC7E3FFFFFFFFFFFFFFFFFFFF00000000F843
      FFFF00000000F843F3FF00000000F843E3FF00000000F843C03F00000000F843
      000000000000F843000000000000F843800000000000E043800100000000C043
      80010000000080438001000000008043C003000000008043E007000000008003
      FFFF00000000C003FFFF00000000F007FC7FFFFFFFFFFFFF00010001C181FFFF
      00010001C181FFFF00010001C181FFCF00010001F1C3FFC7000100011803FC03
      0001000108030000000000010C03000000000001C063000100010001C0238001
      00010001E003800100010001E003800100010001F003C00300010001F047E007
      00010001F87FFFFF00010001F8FFFFFFFFFFFFFFFFE3FFE38001F80000010001
      8001F80000000000800100000000000080010000000000008001000000010001
      800100000001000180010000000100018001000F000100018001000D00010001
      8001000900010001800100010001000180010009000100018001001D00010001
      8001003F000100018001007F00010001FFFFFFFFFFFFFFFF8000800080008000
      8000800080008000000000000000000080008000800080008000800080008000
      0000000000000000800080008000800080008000800080000000000000000000
      8000800080008000800080008000800000000000000000008000800080008000
      8000800080008000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8000800080008000
      8000800080008000000000000000000080008000800080008000800080008000
      0000000000000000800080008000800080008000800080000000000000000000
      8000800080008000800080008000800000000000000000008000800080008000
      8000800080008000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8001800080008000
      8001800080008000800100000000000080018000800080008001800080008000
      8001000000000000800180008000800080018000800080008001000000000000
      8001800080008000800180008000800080010000000000008001800080008000
      80018000800080008001FFFFFFFFFFFFFFFFFFFC8E3FFC710000FFF8041FF820
      0000FF01001FF80000000003001FF800000000030A1FF85000000003803FFC01
      00000003CA7FFE5300000003C47FFE2300000003C467E62300000003FFE3C7FF
      00000003FF0180FF00000003FF0000FF00000003FF0000FF00000003FF0180FF
      000003FFFFE3C7FF0000FFFFFFE7E7FFFFFFFFFFFFFFFFFFC380E7870000FFE3
      C380C3870000FFC1C38081870000F001C38000870000C001C3FF00FF00008003
      C383C38300008007C383C38300000007C383C38300000007C383C38300000007
      00FFC3FF000000070087C380000000078187C3800000800FC387C3800000800F
      E787C3800000C01FFFFFFFFF0000F07FFFFFFFFFFFFFFFFF0000000000000187
      000000000000018700000000000001870000000000000187000000000000FFFF
      000000000000C183000000000000C183000000000000C183000000000000C183
      000000000000FFFF000000000000E180000000000000E180000000000000E180
      000000000000E180000000000000FFFFFFE3FFE3FFE3FFE30000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFE3FFE3FFE3FFFF0000FFC18001FC3F
      0000FF808000F00F0000FF808000E0070000F3808000C0030000E1818001C003
      0000C18380018001000083C180018001000007E080018001000007E080018001
      000083C18001C0030000C1838001C0030000E1878001E0070000F3CF8001F00F
      0000FFFF8001FC3F0000FFFFF3CFFFFFFFFFFFFFFFFFFFFFFC00FC00D555FC3F
      FC0000000001F00FFC0000008000E007000000000001C003000000008000C003
      0000000000018001000000008000800100000000000180010000000080008001
      000000000001C003000100018000C003000300030001E007003F001F8000F00F
      007F001F0001FC3F00FFF1FFD555FFFFFFFFE7FFFFFFFFFF0007C7FFF001F1FF
      0007800FC001F5FF000000038001F5E3000000018001F1CB0000800107FFF993
      0000C7E00FFFFC070000E7F00FFFFC7F0000FFF00FE7F8FF0000FFF007E3F0FF
      0000FFE08001E0FF000080018000C4FF00078001C000CCFF000F8003F001DCFF
      001F800FFFE3FCFF003FFFFFFFE7FDFFFFFFFFFFFFFFFFFFFFFFF00F0001FFFC
      FF80F00F00000000FF8000000000E000FF8000000001E000018000000003E000
      0180000000030000008700000003000000800000000300000180000000070000
      018000000007E0000F8000000007E000FF80E0070007E000FF87F00F000FE000
      FFFFF00F001FE000FFFFF00F003FFFFCFFFFFFFFFFFFFFFFF800FC00FFFFF000
      0000FC000000F0000000FC000000F0000000E0000000F0000000E0000000F000
      0000000000000000000000000000000000030000000000000003000000000000
      000300000000000F000300070000000F000300070000000F000300070000000F
      0003003F01FF000F0003003FFFFF03FFFFFFFFFFFE7FFFFF0001FC7FFC7F0000
      0000E001C0030000000080010001000000008001000000000000800100080000
      0000800100060000000180010003000000078001000100000007800100000000
      000780010001000000078001000300000007800300070000000F8007001F0000
      001F800F001F0000003F800F001F000000000000000000000000000000000000
      000000000000}
  end
  object ApplicationEvents: TApplicationEvents
    OnActivate = ApplicationEventsActivate
    OnHint = ApplicationEventsHint
    OnMessage = ApplicationEventsMessage
    Left = 300
    Top = 140
  end
  object DocumentPopupMenu: TBCPopupMenu
    Images = ImageList
    Left = 296
    Top = 252
    object FileCloseMenuItem: TMenuItem
      Action = FileCloseAction
    end
    object FileCloseAllMenuItem: TMenuItem
      Action = FileCloseAllAction
    end
    object Separator3MenuItem: TMenuItem
      Caption = '-'
    end
    object CloseAllOtherPages1: TMenuItem
      Action = FileCloseAllOtherPagesAction
    end
    object Separator1MenuItem: TMenuItem
      Caption = '-'
    end
    object SaveMenuItem: TMenuItem
      Action = FileSaveAction
    end
    object SaveAsMenuItem: TMenuItem
      Action = FileSaveAsAction
    end
    object Separator2MenuItem: TMenuItem
      Caption = '-'
    end
    object PrintMenuItem: TMenuItem
      Action = FilePrintAction
    end
    object PrintPreviewMenuItem: TMenuItem
      Action = FilePrintPreviewAction
    end
    object Separator4MenuItem: TMenuItem
      Caption = '-'
    end
    object SelectforCompareMenuItem: TMenuItem
      Action = ToolsSelectForCompareAction
    end
    object Separator5MenuItem: TMenuItem
      Caption = '-'
    end
    object PropertiesMenuItem: TMenuItem
      Action = FilePropertiesAction
    end
  end
  object AppInstances: TJvAppInstances
    OnCmdLineReceived = AppInstancesCmdLineReceived
    Left = 180
    Top = 100
  end
  object DragDrop: TJvDragDrop
    DropTarget = Owner
    OnDrop = DragDropDrop
    Left = 512
    Top = 276
  end
  object HTMLErrorTimer: TTimer
    OnTimer = HTMLErrorTimerTimer
    Left = 564
    Top = 220
  end
  object ToolbarPopupMenu: TBCPopupMenu
    Left = 302
    Top = 76
    object NewOpenMenuItem: TMenuItem
      Action = PopupMenuStandardAction
    end
    object Print2MenuItem: TMenuItem
      Action = PopupMenuPrintAction
    end
    object DirectoryMenuItem: TMenuItem
      Action = PopupMenuDirectoryAction
    end
    object IndentMenuItem: TMenuItem
      Action = PopupMenuIndentAction
    end
    object SortMenuItem: TMenuItem
      Action = PopupMenuSortAction
    end
    object CaseMenuItem: TMenuItem
      Action = PopupMenuCaseAction
    end
    object UndoandRedoMenuItem: TMenuItem
      Action = PopupMenuCommandAction
    end
    object SearchMenuItem: TMenuItem
      Action = PopupMenuSearchAction
    end
    object ModeMenuItem: TMenuItem
      Action = PopupMenuModeAction
    end
    object ToolsMenuItem: TMenuItem
      Action = PopupMenuToolsAction
    end
    object MacroMenuItem: TMenuItem
      Action = PopupMenuMacroAction
    end
    object DocumentMenuItem: TMenuItem
      Action = PopupMenuDocumentAction
    end
  end
end
