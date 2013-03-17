object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'EditBone'
  ClientHeight = 560
  ClientWidth = 1041
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
    Width = 1041
    Height = 19
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
  end
  object MainMenuPanel: TPanel
    Left = 0
    Top = 0
    Width = 1041
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
      Width = 833
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
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentShowHint = False
      ShowHint = True
      Spacing = 1
    end
    object HighlighterComboBox: TBCComboBox
      Left = 909
      Top = 2
      Width = 130
      Height = 21
      Align = alRight
      DropDownCount = 57
      ItemHeight = 13
      ReadOnly = True
      TabOrder = 1
      Text = '<highlighter>'
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
        'x86 Assembly'
        'XML')
      EditColor = clWindow
      DeniedKeyStrokes = True
      DropDownFixedWidth = 0
    end
    object EncodingComboBox: TBCComboBox
      Left = 779
      Top = 2
      Width = 130
      Height = 21
      Align = alRight
      DropDownCount = 57
      ItemHeight = 13
      ReadOnly = True
      TabOrder = 2
      Text = '<encoding>'
      OnChange = EncodingComboBoxChange
      Items.Strings = (
        'ASCII'
        'ANSI'
        'Big Endian Unicode'
        'Unicode '
        'UTF-7'
        'UTF-8'
        'UTF-8 Without BOM')
      EditColor = clWindow
      DeniedKeyStrokes = True
      DropDownFixedWidth = 0
    end
  end
  object ToolBarPanel: TPanel
    Left = 0
    Top = 24
    Width = 1041
    Height = 28
    Align = alTop
    AutoSize = True
    BevelOuter = bvNone
    Padding.Left = 2
    Padding.Top = 2
    Padding.Right = 2
    ParentColor = True
    TabOrder = 1
    object ActionToolBar: TActionToolBar
      Left = 2
      Top = 2
      Width = 1037
      Height = 26
      ActionManager = ActionManager
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
    Width = 1041
    Height = 489
    Align = alClient
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 2
    object HorizontalSplitter: TSplitter
      Left = 0
      Top = 334
      Width = 1041
      Height = 3
      Cursor = crVSplit
      Align = alBottom
      AutoSnap = False
      Visible = False
      ExplicitTop = 343
      ExplicitWidth = 1034
    end
    object VerticalSplitter: TSplitter
      Left = 257
      Top = 0
      Height = 334
      AutoSnap = False
      MinSize = 100
      ResizeStyle = rsUpdate
      ExplicitHeight = 343
    end
    object OutputPanel: TPanel
      Left = 0
      Top = 337
      Width = 1041
      Height = 152
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
      Height = 334
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
      Width = 781
      Height = 334
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
                Items = <
                  item
                    Action = FileReopenClearAction
                    ImageIndex = 65
                  end>
                Action = FileReopenAction
                Caption = '&Reopen'
                UsageCount = 1
              end
              item
                Caption = '-'
              end
              item
                Action = FileSaveAction
                ImageIndex = 4
                ShortCut = 16467
              end
              item
                Action = FileSaveAsAction
                ImageIndex = 5
                ShortCut = 49235
              end
              item
                Action = FileSaveAllAction
                ImageIndex = 6
                ShortCut = 24659
              end
              item
                Action = FileCloseAction
                ImageIndex = 2
                ShortCut = 16499
              end
              item
                Action = FileCloseAllAction
                ImageIndex = 3
              end
              item
                Caption = '-'
              end
              item
                Action = FilePrintAction
                ImageIndex = 7
                ShortCut = 16464
              end
              item
                Action = FilePrintPreviewAction
                Caption = 'Pr&int Preview...'
                ImageIndex = 8
              end
              item
                Caption = '-'
              end
              item
                Action = FileExitAction
                ImageIndex = 9
                ShortCut = 32883
              end>
            Caption = '&File'
          end
          item
            Items = <
              item
                Action = EditUndoAction
                ImageIndex = 11
                ShortCut = 16474
              end
              item
                Action = EditRedoAction
                ImageIndex = 10
                ShortCut = 24666
              end
              item
                Caption = '-'
              end
              item
                Action = EditCutAction
                ImageIndex = 12
                ShortCut = 16472
              end
              item
                Action = EditCopyAction
                ImageIndex = 13
                ShortCut = 16451
              end
              item
                Action = EditPasteAction
                ImageIndex = 14
                ShortCut = 16470
              end
              item
                Action = EditSelectAllAction
                ImageIndex = 39
                ShortCut = 16449
              end
              item
                Caption = '-'
              end
              item
                Action = EditInsertLineAction
                ImageIndex = 51
                ShortCut = 16462
              end
              item
                Action = EditDeleteWordAction
                ShortCut = 16468
              end
              item
                Action = EditDeleteLineAction
                ImageIndex = 52
                ShortCut = 16473
              end
              item
                Action = EditDeleteEOLAction
                ShortCut = 24665
              end
              item
                Caption = '-'
              end
              item
                Action = EditIncreaseIndentAction
                ImageIndex = 35
                ShortCut = 24649
              end
              item
                Action = EditDecreaseIndentAction
                ImageIndex = 34
                ShortCut = 24661
              end
              item
                Caption = '-'
              end
              item
                Action = EditSortAscAction
                ImageIndex = 37
                ShortCut = 24641
              end
              item
                Action = EditSortDescAction
                ImageIndex = 38
                ShortCut = 24644
              end
              item
                Caption = '-'
              end
              item
                Action = EditToggleCaseAction
                ImageIndex = 36
                ShortCut = 24643
              end
              item
                Action = EditRemoveWhiteSpaceAction
              end>
            Caption = '&Edit'
          end
          item
            Items = <
              item
                Action = SearchAction
                ImageIndex = 15
                ShortCut = 16454
              end
              item
                Action = SearchReplaceAction
                ImageIndex = 16
                ShortCut = 16466
              end
              item
                Caption = '-'
              end
              item
                Action = SearchFindNextAction
                ImageIndex = 17
                ShortCut = 114
              end
              item
                Action = SearchFindPreviousAction
                ImageIndex = 18
                ShortCut = 8306
              end
              item
                Caption = '-'
              end
              item
                Action = SearchFindInFilesAction
                ImageIndex = 19
                ShortCut = 24646
              end
              item
                Caption = '-'
              end
              item
                Action = ToggleBookmarkAction
                ImageIndex = 32
                ShortCut = 16497
              end
              item
                Items = <
                  item
                    Action = GotoBookmarks0Action
                    ImageIndex = 40
                    ShortCut = 16432
                  end
                  item
                    Action = GotoBookmarks1Action
                    ImageIndex = 41
                    ShortCut = 16433
                  end
                  item
                    Action = GotoBookmarks2Action
                    ImageIndex = 42
                    ShortCut = 16434
                  end
                  item
                    Action = GotoBookmarks3Action
                    ImageIndex = 43
                    ShortCut = 16435
                  end
                  item
                    Action = GotoBookmarks4Action
                    ImageIndex = 44
                    ShortCut = 16436
                  end
                  item
                    Action = GotoBookmarks5Action
                    ImageIndex = 45
                    ShortCut = 16437
                  end
                  item
                    Action = GotoBookmarks6Action
                    ImageIndex = 46
                    ShortCut = 16438
                  end
                  item
                    Action = GotoBookmarks7Action
                    ImageIndex = 47
                    ShortCut = 16439
                  end
                  item
                    Action = GotoBookmarks8Action
                    ImageIndex = 48
                    ShortCut = 16440
                  end
                  item
                    Action = GotoBookmarks9Action
                    ImageIndex = 49
                    ShortCut = 16441
                  end>
                Action = GotoBookmarksAction
                Caption = 'Go to Boo&kmarks'
                UsageCount = 1
              end
              item
                Items = <
                  item
                    Action = ToggleBookmarks0Action
                    ImageIndex = 40
                    ShortCut = 24624
                  end
                  item
                    Action = ToggleBookmarks1Action
                    ImageIndex = 41
                    ShortCut = 24625
                  end
                  item
                    Action = ToggleBookmarks2Action
                    ImageIndex = 42
                    ShortCut = 24626
                  end
                  item
                    Action = ToggleBookmarks3Action
                    ImageIndex = 43
                    ShortCut = 24627
                  end
                  item
                    Action = ToggleBookmarks4Action
                    ImageIndex = 44
                    ShortCut = 24628
                  end
                  item
                    Action = ToggleBookmarks5Action
                    ImageIndex = 45
                    ShortCut = 24629
                  end
                  item
                    Action = ToggleBookmarks6Action
                    ImageIndex = 46
                    ShortCut = 24630
                  end
                  item
                    Action = ToggleBookmarks7Action
                    ImageIndex = 47
                    ShortCut = 24631
                  end
                  item
                    Action = ToggleBookmarks8Action
                    ImageIndex = 48
                    ShortCut = 24632
                  end
                  item
                    Action = ToggleBookmarks9Action
                    ImageIndex = 49
                    ShortCut = 24633
                  end>
                Action = ToggleBookmarksAction
                UsageCount = 1
              end
              item
                Action = ClearBookmarksAction
                ImageIndex = 50
              end
              item
                Caption = '-'
              end
              item
                Action = ViewGotoLineAction
                Caption = '&Go to Line'
                ImageIndex = 33
                ShortCut = 16455
              end>
            Caption = '&Search'
          end
          item
            Items = <
              item
                Action = ViewOpenDirectoryAction
                ImageIndex = 28
                ShortCut = 16452
              end
              item
                Action = ViewCloseDirectoryAction
                ImageIndex = 29
                ShortCut = 24644
              end
              item
                Action = ViewEditDirectoryAction
                ImageIndex = 60
                ShortCut = 24645
              end
              item
                Caption = '-'
              end
              item
                Action = ViewToolbarAction
              end
              item
                Action = ViewDirectoryAction
              end
              item
                Action = ViewSplitAction
              end
              item
                Action = ViewOutputAction
              end
              item
                Action = ViewHighlighterSelectionAction
              end
              item
                Action = ViewEncodingSelectionAction
              end
              item
                Action = ViewXMLTreeAction
              end
              item
                Caption = '-'
              end
              item
                Action = ViewLanguageAction
              end
              item
                Action = ViewStyleAction
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
                ImageIndex = 31
                ShortCut = 16393
              end
              item
                Action = ViewPreviousPageAction
                ImageIndex = 30
                ShortCut = 24585
              end>
            Caption = '&View'
          end
          item
            Items = <
              item
                Action = ToolsWordCountAction
                ImageIndex = 53
              end
              item
                Action = FormatXMLAction
                Caption = '&Format XML'
                ImageIndex = 63
              end
              item
                Caption = '-'
              end
              item
                Items = <
                  item
                    Action = MacroRecordPauseAction
                    ImageIndex = 54
                    ShortCut = 24658
                  end
                  item
                    Action = MacroStopAction
                    ImageIndex = 56
                    ShortCut = 24659
                  end
                  item
                    Action = MacroPlaybackAction
                    ImageIndex = 57
                    ShortCut = 24656
                  end
                  item
                    Caption = '-'
                  end
                  item
                    Action = MacroOpenAction
                    ImageIndex = 58
                  end
                  item
                    Action = MacroSaveAsAction
                    ImageIndex = 59
                  end>
                Action = MacroMenuAction
                UsageCount = 1
              end
              item
                Caption = '-'
              end
              item
                Action = ViewInBrowserAction
                ImageIndex = 33
                ShortCut = 32834
              end>
            Caption = '&Document'
          end
          item
            Items = <
              item
                Action = CompareFilesAction
                ImageIndex = 27
              end
              item
                Caption = '-'
              end
              item
                Action = ToolsLanguageEditorAction
                ImageIndex = 62
              end
              item
                Caption = '-'
              end
              item
                Action = ToolsOptionsAction
                ImageIndex = 20
              end>
            Caption = '&Tools'
          end
          item
            Items = <
              item
                Action = HelpCheckForUpdatesMenuAction
                ImageIndex = 61
              end
              item
                Caption = '-'
              end
              item
                Action = HelpHomeAction
                ImageIndex = 22
              end
              item
                Caption = '-'
              end
              item
                Action = HelpAboutAction
                ImageIndex = 21
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
            ImageIndex = 4
            ShowCaption = False
            ShortCut = 16467
          end
          item
            Action = FileSaveAsAction
            ImageIndex = 5
            ShowCaption = False
            ShortCut = 49235
          end
          item
            Action = FileSaveAllAction
            ImageIndex = 6
            ShowCaption = False
            ShortCut = 24659
          end
          item
            Action = FileCloseAction
            ImageIndex = 2
            ShowCaption = False
            ShortCut = 16499
          end
          item
            Action = FileCloseAllAction
            Caption = 'Close All'
            ImageIndex = 3
            ShowCaption = False
          end
          item
            Caption = '-'
          end
          item
            Action = FilePrintAction
            ImageIndex = 7
            ShowCaption = False
            ShortCut = 16464
          end
          item
            Action = FilePrintPreviewAction
            ImageIndex = 8
            ShowCaption = False
          end
          item
            Caption = '-'
          end
          item
            Action = ViewOpenDirectoryAction
            Caption = 'Open Direc&tory'
            ImageIndex = 28
            ShowCaption = False
            ShortCut = 16452
          end
          item
            Action = ViewCloseDirectoryAction
            Caption = 'Close Director&y'
            ImageIndex = 29
            ShowCaption = False
            ShortCut = 24644
          end
          item
            Action = ViewEditDirectoryAction
            ImageIndex = 60
            ShowCaption = False
            ShortCut = 24645
          end
          item
            Caption = '-'
          end
          item
            Action = EditIncreaseIndentAction
            Caption = '&Increase Indent'
            ImageIndex = 35
            ShowCaption = False
            ShortCut = 24649
          end
          item
            Action = EditDecreaseIndentAction
            ImageIndex = 34
            ShowCaption = False
            ShortCut = 24661
          end
          item
            Caption = '-'
          end
          item
            Action = EditSortAscAction
            Caption = 'Sort Ascendin&g'
            ImageIndex = 37
            ShowCaption = False
            ShortCut = 24641
          end
          item
            Action = EditSortDescAction
            Caption = 'Sort Descending'
            ImageIndex = 38
            ShowCaption = False
            ShortCut = 24644
          end
          item
            Caption = '-'
          end
          item
            Action = EditToggleCaseAction
            Caption = 'Togg&le Case'
            ImageIndex = 36
            ShowCaption = False
            ShortCut = 24643
          end
          item
            Caption = '-'
          end
          item
            Action = EditUndoAction
            ImageIndex = 11
            ShowCaption = False
            ShortCut = 16474
          end
          item
            Action = EditRedoAction
            Caption = 'Redo'
            ImageIndex = 10
            ShowCaption = False
            ShortCut = 24666
          end
          item
            Caption = '-'
          end
          item
            Action = SearchAction
            Caption = 'Searc&h...'
            ImageIndex = 15
            ShowCaption = False
            ShortCut = 16454
          end
          item
            Action = SearchReplaceAction
            Caption = 'Replace...'
            ImageIndex = 16
            ShowCaption = False
            ShortCut = 16466
          end
          item
            Action = SearchFindInFilesAction
            ImageIndex = 19
            ShowCaption = False
            ShortCut = 24646
          end
          item
            Caption = '-'
          end
          item
            Action = ViewWordWrapAction
            CommandStyle = csCheckBox
            ImageIndex = 24
            ShowCaption = False
            CommandProperties.Width = -1
          end
          item
            Action = ViewLineNumbersAction
            Caption = 'Line Nu&mbers'
            CommandStyle = csCheckBox
            ImageIndex = 23
            ShowCaption = False
            CommandProperties.Width = -1
          end
          item
            Action = ViewSpecialCharsAction
            Caption = 'Special Chars'
            CommandStyle = csCheckBox
            ImageIndex = 25
            ShowCaption = False
            CommandProperties.Width = -1
          end
          item
            Action = ViewSelectionModeAction
            Caption = 'Column Mode'
            CommandStyle = csCheckBox
            ImageIndex = 26
            ShowCaption = False
            CommandProperties.Width = -1
          end
          item
            Caption = '-'
          end
          item
            Action = CompareFilesAction
            Caption = 'Compare Files...'
            ImageIndex = 27
            ShowCaption = False
          end
          item
            Caption = '-'
          end
          item
            Action = MacroRecordPauseAction
            Caption = 'Record'
            ImageIndex = 54
            ShowCaption = False
            ShortCut = 24658
          end
          item
            Action = MacroStopAction
            Caption = 'Stop'
            ImageIndex = 56
            ShowCaption = False
            ShortCut = 24659
          end
          item
            Action = MacroPlaybackAction
            Caption = 'Play&back'
            ImageIndex = 57
            ShowCaption = False
            ShortCut = 24656
          end
          item
            Action = MacroOpenAction
            Caption = 'Open...'
            ImageIndex = 58
            ShowCaption = False
          end
          item
            Action = MacroSaveAsAction
            Caption = 'Save as...'
            ImageIndex = 59
            ShowCaption = False
          end
          item
            Caption = '-'
          end
          item
            Action = ToolsWordCountAction
            Caption = 'Line, Word and Character Count...'
            ImageIndex = 53
            ShowCaption = False
          end
          item
            Action = ViewInBrowserAction
            Caption = 'View in Browser'
            ImageIndex = 64
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
      OnExecute = FileReopenActionExecute
    end
    object FileSaveAction: TAction
      Category = '&File'
      Caption = '&Save'
      Hint = 'Save the active document'
      ImageIndex = 4
      ShortCut = 16467
      OnExecute = FileSaveActionExecute
    end
    object FileSaveAsAction: TAction
      Category = '&File'
      Caption = 'S&ave As...'
      Hint = 'Save the active document with a new name'
      ImageIndex = 5
      ShortCut = 49235
      OnExecute = FileSaveAsActionExecute
    end
    object FileSaveAllAction: TAction
      Category = '&File'
      Caption = 'Sa&ve All'
      Hint = 'Save all documents'
      ImageIndex = 6
      ShortCut = 24659
      OnExecute = FileSaveAllActionExecute
    end
    object FileCloseAction: TAction
      Category = '&File'
      Caption = '&Close'
      Hint = 'Close the active document'
      ImageIndex = 2
      ShortCut = 16499
      OnExecute = FileCloseActionExecute
    end
    object FileCloseAllAction: TAction
      Category = '&File'
      Caption = 'C&lose All'
      Hint = 'Close all open files'
      ImageIndex = 3
      OnExecute = FileCloseAllActionExecute
    end
    object FileCloseAllOtherPagesAction: TAction
      Category = '&File'
      Caption = 'Close All Other Pages'
      Hint = 'Close all other pages'
      ShortCut = 24691
      OnExecute = FileCloseAllOtherPagesActionExecute
    end
    object FilePrintAction: TAction
      Category = '&File'
      Caption = '&Print...'
      Hint = 'Print the active document'
      ImageIndex = 7
      ShortCut = 16464
      OnExecute = FilePrintActionExecute
    end
    object FilePrintPreviewAction: TAction
      Category = '&File'
      Caption = 'P&rint Preview...'
      Hint = 'Preview the active document'
      ImageIndex = 8
      OnExecute = FilePrintPreviewActionExecute
    end
    object FileExitAction: TAction
      Category = '&File'
      Caption = '&Exit'
      Hint = 'Quit the application'
      ImageIndex = 9
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
      ImageIndex = 11
      ShortCut = 16474
      OnExecute = EditUndoActionExecute
    end
    object EditRedoAction: TAction
      Category = '&Edit'
      Caption = '&Redo'
      Hint = 'Redo the previously undone action'
      ImageIndex = 10
      ShortCut = 24666
      OnExecute = EditRedoActionExecute
    end
    object EditCutAction: TAction
      Category = '&Edit'
      Caption = '&Cut'
      Hint = 'Cut the selection and put it on the Clipboard'
      ImageIndex = 12
      ShortCut = 16472
      OnExecute = EditCutActionExecute
    end
    object EditCopyAction: TAction
      Category = '&Edit'
      Caption = 'C&opy'
      Hint = 'Copy the selection and put it on the Clipboard'
      ImageIndex = 13
      ShortCut = 16451
      OnExecute = EditCopyActionExecute
    end
    object EditPasteAction: TAction
      Category = '&Edit'
      Caption = '&Paste'
      Hint = 'Insert Clipboard contents'
      ImageIndex = 14
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
      ImageIndex = 15
      ShortCut = 16454
      OnExecute = SearchActionExecute
    end
    object SearchReplaceAction: TAction
      Category = '&Search'
      Caption = '&Replace...'
      Hint = 'Replace the specified text with different text'
      ImageIndex = 16
      ShortCut = 16466
      OnExecute = SearchReplaceActionExecute
    end
    object SearchFindNextAction: TAction
      Category = '&Search'
      Caption = 'Find &Next'
      Hint = 'Find the next matching text'
      ImageIndex = 17
      ShortCut = 114
      OnExecute = SearchFindNextActionExecute
    end
    object SearchFindPreviousAction: TAction
      Category = '&Search'
      Caption = 'Find &Previous'
      Hint = 'Find the previous matching text'
      ImageIndex = 18
      ShortCut = 8306
      OnExecute = SearchFindPreviousActionExecute
    end
    object SearchFindInFilesAction: TAction
      Category = '&Search'
      Caption = '&Find in Files...'
      Hint = 'Search for a string in multiple files'
      ImageIndex = 19
      ShortCut = 24646
      OnExecute = SearchFindInFilesActionExecute
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
      ImageIndex = 28
      ShortCut = 16452
      OnExecute = ViewOpenDirectoryActionExecute
    end
    object ViewCloseDirectoryAction: TAction
      Category = '&View'
      Caption = '&Close Directory'
      Hint = 'Close the active directory'
      ImageIndex = 29
      ShortCut = 24644
      OnExecute = ViewCloseDirectoryActionExecute
    end
    object ViewEditDirectoryAction: TAction
      Category = '&View'
      Caption = '&Edit Directory'
      Hint = 'Edit the active directory'
      ImageIndex = 60
      ShortCut = 24645
      OnExecute = ViewEditDirectoryActionExecute
    end
    object ViewToolbarAction: TAction
      Category = '&View'
      Caption = '&Toolbar'
      Checked = True
      Hint = 'Show or hide the toolbar'
      OnExecute = ViewToolbarActionExecute
    end
    object ViewDirectoryAction: TAction
      Category = '&View'
      Caption = '&Directory'
      Checked = True
      Hint = 'Show or hide the directory'
      OnExecute = ViewDirectoryActionExecute
    end
    object ViewSplitAction: TAction
      Category = '&View'
      Caption = '&Split'
      Hint = 'Split the document'
      OnExecute = ViewSplitActionExecute
    end
    object ViewOutputAction: TAction
      Category = '&View'
      Caption = 'O&utput'
      Hint = 'Show or hide the output'
      OnExecute = ViewOutputActionExecute
    end
    object ViewHighlighterSelectionAction: TAction
      Category = '&View'
      Caption = '&Highlighter'
      Checked = True
      Hint = 'Show or hide the highlighter selection'
      OnExecute = ViewHighlighterSelectionActionExecute
    end
    object ViewEncodingSelectionAction: TAction
      Category = '&View'
      Caption = 'Encodin&g'
      Hint = 'Show or hide the encoding selection'
      OnExecute = ViewEncodingSelectionActionExecute
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
      OnExecute = DummyActionExecute
    end
    object ViewStyleAction: TAction
      Category = '&View'
      Caption = 'St&yle'
      OnExecute = DummyActionExecute
    end
    object ViewWordWrapAction: TAction
      Category = '&View'
      Caption = '&Word Wrap'
      Hint = 'Toggle word wrap'
      ImageIndex = 24
      OnExecute = ViewWordWrapActionExecute
    end
    object ViewLineNumbersAction: TAction
      Category = '&View'
      Caption = 'Line Num&bers'
      Checked = True
      Hint = 'Toggle line numbers'
      ImageIndex = 23
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
      ImageIndex = 61
      OnExecute = HelpCheckForUpdatesMenuActionExecute
    end
    object HelpHomeAction: TAction
      Category = '&Help'
      Caption = '&Visit Homepage...'
      Hint = 'Visit EditBone homepage - http://www.bonecode.com/'
      ImageIndex = 22
      OnExecute = HelpHomeActionExecute
    end
    object HelpAboutAction: TAction
      Category = '&Help'
      Caption = '&About EditBone...'
      Hint = 'Display information about EditBone'
      ImageIndex = 21
      OnExecute = HelpAboutActionExecute
    end
    object ViewSpecialCharsAction: TAction
      Category = '&View'
      Caption = 'Spec&ial Chars'
      GroupIndex = 1
      Hint = 'Toggle special characters'
      ImageIndex = 25
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
      ImageIndex = 27
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
      ImageIndex = 53
      OnExecute = ToolsWordCountActionExecute
    end
    object ViewInBrowserAction: TAction
      Category = '&Document'
      Caption = '&View in Browser'
      Hint = 'View current document in default browser'
      ImageIndex = 64
      ShortCut = 32834
      OnExecute = ViewInBrowserActionExecute
    end
    object ViewSelectionModeAction: TAction
      Category = '&View'
      Caption = 'Selection &Mode'
      Hint = 
        'Toggle selection mode. Also pressing Alt on editor will toggle s' +
        'election mode.'
      ImageIndex = 26
      OnExecute = ViewSelectionModeActionExecute
    end
    object ToggleBookmarkAction: TAction
      Category = '&Search'
      Caption = '&Toggle Bookmark'
      Hint = 
        'Set or clear bookmark at current line. Bookmarks can be also set' +
        ' by using Ctrl+Shift+0..9. Go to bookmark by using Ctrl+0..9.'
      ImageIndex = 32
      ShortCut = 16497
      OnExecute = ToggleBookmarkActionExecute
    end
    object ViewNextPageAction: TAction
      Category = '&View'
      Caption = '&Next Page'
      Hint = 'Go to next page'
      ImageIndex = 31
      ShortCut = 16393
      OnExecute = ViewNextPageActionExecute
    end
    object ViewPreviousPageAction: TAction
      Category = '&View'
      Caption = '&Previous Page'
      Hint = 'Go to previous page'
      ImageIndex = 30
      ShortCut = 24585
      OnExecute = ViewPreviousPageActionExecute
    end
    object EditSelectAllAction: TAction
      Category = '&Edit'
      Caption = '&Select All'
      Hint = 'Select all'
      ImageIndex = 39
      ShortCut = 16449
      OnExecute = EditSelectAllActionExecute
    end
    object EditInsertLineAction: TAction
      Category = '&Edit'
      Caption = '&Insert Line'
      Hint = 'Insert line'
      ImageIndex = 51
      ShortCut = 16462
      OnExecute = EditInsertLineActionExecute
    end
    object EditDeleteWordAction: TAction
      Category = '&Edit'
      Caption = 'D&elete Word'
      Hint = 'Delete word'
      ShortCut = 16468
      OnExecute = EditDeleteWordActionExecute
    end
    object EditDeleteLineAction: TAction
      Category = '&Edit'
      Caption = 'De&lete Line'
      Hint = 'Delete line'
      ImageIndex = 52
      ShortCut = 16473
      OnExecute = EditDeleteLineActionExecute
    end
    object EditDeleteEOLAction: TAction
      Category = '&Edit'
      Caption = 'Delete E&nd of Line'
      Hint = 'Delete end of line'
      ShortCut = 24665
      OnExecute = EditDeleteEOLActionExecute
    end
    object EditIncreaseIndentAction: TAction
      Category = '&Edit'
      Caption = 'Increase Indent'
      Hint = 'Increase indent'
      ImageIndex = 35
      ShortCut = 24649
      OnExecute = EditIncreaseIndentActionExecute
    end
    object EditDecreaseIndentAction: TAction
      Category = '&Edit'
      Caption = '&Decrease Indent'
      Hint = 'Decrease indent'
      ImageIndex = 34
      ShortCut = 24661
      OnExecute = EditDecreaseIndentActionExecute
    end
    object EditSortAscAction: TAction
      Category = '&Edit'
      Caption = 'Sort &Ascending'
      Hint = 'Sort ascending'
      ImageIndex = 37
      ShortCut = 24641
      OnExecute = EditSortAscActionExecute
    end
    object EditSortDescAction: TAction
      Category = '&Edit'
      Caption = 'Sor&t Descending'
      Hint = 'Sort descending'
      ImageIndex = 38
      ShortCut = 24644
      OnExecute = EditSortDescActionExecute
    end
    object EditToggleCaseAction: TAction
      Category = '&Edit'
      Caption = 'To&ggle Case'
      Hint = 'Toggle case'
      ImageIndex = 36
      ShortCut = 24643
      OnExecute = EditToggleCaseActionExecute
    end
    object ToggleBookmarksAction: TAction
      Category = '&Search'
      Caption = 'T&oggle Bookmarks'
      OnExecute = DummyActionExecute
    end
    object GotoBookmarksAction: TAction
      Category = '&Search'
      Caption = 'Go to Bookmarks'
      OnExecute = DummyActionExecute
    end
    object ClearBookmarksAction: TAction
      Category = '&Search'
      Caption = 'Clear &Bookmarks'
      Hint = 'Clear all bookmarks.'
      ImageIndex = 50
      OnExecute = ClearBookmarksActionExecute
    end
    object MacroMenuAction: TAction
      Category = '&Macro'
      Caption = '&Macro'
      OnExecute = DummyActionExecute
    end
    object MacroRecordPauseAction: TAction
      Category = '&Macro'
      Caption = '&Record'
      Hint = 'Record or pause a macro'
      ImageIndex = 54
      ShortCut = 24658
      OnExecute = MacroRecordPauseActionExecute
    end
    object MacroStopAction: TAction
      Category = '&Macro'
      Caption = '&Stop'
      Hint = 'Stop the macro recording'
      ImageIndex = 56
      ShortCut = 24659
      OnExecute = MacroStopActionExecute
    end
    object MacroPlaybackAction: TAction
      Category = '&Macro'
      Caption = '&Playback'
      Hint = 'Playback the macro'
      ImageIndex = 57
      ShortCut = 24656
      OnExecute = MacroPlaybackActionExecute
    end
    object MacroOpenAction: TAction
      Category = '&Macro'
      Caption = '&Open...'
      Hint = 'Open an existing macro'
      ImageIndex = 58
      OnExecute = MacroOpenActionExecute
    end
    object MacroSaveAsAction: TAction
      Category = '&Macro'
      Caption = 'S&ave as...'
      Hint = 'Save the macro with a new name'
      ImageIndex = 59
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
      ImageIndex = 27
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
    object ToolsLanguageEditorAction: TAction
      Category = '&Tools'
      Caption = '&Language Editor...'
      Hint = 'Language editor'
      ImageIndex = 62
      OnExecute = ToolsLanguageEditorActionExecute
    end
    object ToolsOptionsAction: TAction
      Category = '&Tools'
      Caption = '&Options...'
      Hint = 'Set options'
      ImageIndex = 20
      OnExecute = ToolsOptionsActionExecute
    end
    object SelectLanguageAction: TAction
      OnExecute = SelectLanguageActionExecute
    end
    object ToggleBookmarks0Action: TAction
      Category = 'T&oggle Bookmarks'
      Caption = 'Bookmark &0'
      ImageIndex = 40
      ShortCut = 24624
      OnExecute = ToggleBookmarks0ActionExecute
    end
    object GotoBookmarks0Action: TAction
      Category = 'Go to Bookmarks'
      Caption = 'Bookmark &0'
      ImageIndex = 40
      ShortCut = 16432
      OnExecute = GotoBookmarks0ActionExecute
    end
    object ToggleBookmarks1Action: TAction
      Tag = 1
      Category = 'T&oggle Bookmarks'
      Caption = 'Bookmark &1'
      ImageIndex = 41
      ShortCut = 24625
      OnExecute = ToggleBookmarks0ActionExecute
    end
    object GotoBookmarks1Action: TAction
      Tag = 1
      Category = 'Go to Bookmarks'
      Caption = 'Bookmark &1'
      ImageIndex = 41
      ShortCut = 16433
      OnExecute = GotoBookmarks0ActionExecute
    end
    object ToggleBookmarks2Action: TAction
      Tag = 2
      Category = 'T&oggle Bookmarks'
      Caption = 'Bookmark &2'
      ImageIndex = 42
      ShortCut = 24626
      OnExecute = ToggleBookmarks0ActionExecute
    end
    object ToggleBookmarks3Action: TAction
      Tag = 3
      Category = 'T&oggle Bookmarks'
      Caption = 'Bookmark &3'
      ImageIndex = 43
      ShortCut = 24627
      OnExecute = ToggleBookmarks0ActionExecute
    end
    object ToggleBookmarks4Action: TAction
      Tag = 4
      Category = 'T&oggle Bookmarks'
      Caption = 'Bookmark &4'
      ImageIndex = 44
      ShortCut = 24628
      OnExecute = ToggleBookmarks0ActionExecute
    end
    object ToggleBookmarks5Action: TAction
      Tag = 5
      Category = 'T&oggle Bookmarks'
      Caption = 'Bookmark &5'
      ImageIndex = 45
      ShortCut = 24629
      OnExecute = ToggleBookmarks0ActionExecute
    end
    object ToggleBookmarks6Action: TAction
      Tag = 6
      Category = 'T&oggle Bookmarks'
      Caption = 'Bookmark &6'
      ImageIndex = 46
      ShortCut = 24630
      OnExecute = ToggleBookmarks0ActionExecute
    end
    object ToggleBookmarks7Action: TAction
      Tag = 7
      Category = 'T&oggle Bookmarks'
      Caption = 'Bookmark &7'
      ImageIndex = 47
      ShortCut = 24631
      OnExecute = ToggleBookmarks0ActionExecute
    end
    object ToggleBookmarks8Action: TAction
      Tag = 8
      Category = 'T&oggle Bookmarks'
      Caption = 'Bookmark &8'
      ImageIndex = 48
      ShortCut = 24632
      OnExecute = ToggleBookmarks0ActionExecute
    end
    object ToggleBookmarks9Action: TAction
      Tag = 9
      Category = 'T&oggle Bookmarks'
      Caption = 'Bookmark &9'
      ImageIndex = 49
      ShortCut = 24633
      OnExecute = ToggleBookmarks0ActionExecute
    end
    object GotoBookmarks2Action: TAction
      Tag = 2
      Category = 'Go to Bookmarks'
      Caption = 'Bookmark &2'
      ImageIndex = 42
      ShortCut = 16434
      OnExecute = GotoBookmarks0ActionExecute
    end
    object GotoBookmarks3Action: TAction
      Tag = 3
      Category = 'Go to Bookmarks'
      Caption = 'Bookmark &3'
      ImageIndex = 43
      ShortCut = 16435
      OnExecute = GotoBookmarks0ActionExecute
    end
    object GotoBookmarks4Action: TAction
      Tag = 4
      Category = 'Go to Bookmarks'
      Caption = 'Bookmark &4'
      ImageIndex = 44
      ShortCut = 16436
      OnExecute = GotoBookmarks0ActionExecute
    end
    object GotoBookmarks5Action: TAction
      Tag = 5
      Category = 'Go to Bookmarks'
      Caption = 'Bookmark &5'
      ImageIndex = 45
      ShortCut = 16437
      OnExecute = GotoBookmarks0ActionExecute
    end
    object GotoBookmarks6Action: TAction
      Tag = 6
      Category = 'Go to Bookmarks'
      Caption = 'Bookmark &6'
      ImageIndex = 46
      ShortCut = 16438
      OnExecute = GotoBookmarks0ActionExecute
    end
    object GotoBookmarks7Action: TAction
      Tag = 7
      Category = 'Go to Bookmarks'
      Caption = 'Bookmark &7'
      ImageIndex = 47
      ShortCut = 16439
      OnExecute = GotoBookmarks0ActionExecute
    end
    object GotoBookmarks8Action: TAction
      Tag = 8
      Category = 'Go to Bookmarks'
      Caption = 'Bookmark &8'
      ImageIndex = 48
      ShortCut = 16440
      OnExecute = GotoBookmarks0ActionExecute
    end
    object GotoBookmarks9Action: TAction
      Tag = 9
      Category = 'Go to Bookmarks'
      Caption = 'Bookmark &9'
      ImageIndex = 49
      ShortCut = 16441
      OnExecute = GotoBookmarks0ActionExecute
    end
    object EditRemoveWhiteSpaceAction: TAction
      Category = '&Edit'
      Caption = 'Re&move Whitespace'
      Hint = 'Remove all whitespace from selected text'
      OnExecute = EditRemoveWhiteSpaceActionExecute
    end
    object FilePropertiesAction: TAction
      Category = '&File'
      Caption = 'Pr&operties'
      Hint = 'See the file/directory properties'
      OnExecute = FilePropertiesActionExecute
    end
    object FormatXMLAction: TAction
      Category = '&Document'
      Caption = 'Format XML'
      Hint = 'Format XML'
      ImageIndex = 63
      OnExecute = FormatXMLActionExecute
    end
    object ViewGotoLineAction: TAction
      Category = '&Search'
      Caption = 'Go to Line'
      Hint = 'Go to Line'
      ImageIndex = 33
      ShortCut = 16455
      OnExecute = ViewGotoLineActionExecute
    end
    object FileReopenClearAction: TAction
      Category = '&Reopen'
      Caption = '&Clear'
      ImageIndex = 65
      OnExecute = FileReopenClearActionExecute
    end
    object SelectReopenFileAction: TAction
      OnExecute = SelectReopenFileActionExecute
    end
  end
  object ImageList: TBCImageList
    Left = 408
    Top = 224
    Bitmap = {
      494C010142005C01780610001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001001000001002000000000000010
      0100000000000000000000000000000000000000000000000000000000000000
      0000000000000131020001420300025104000251040001420300013102000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000001877EA001574E00000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000142
      03000142030003790800029D0A00029D0A0003A00C00029D0A00037908000251
      0400014C04000000000000000000000000000000000000000000000000000000
      000000000000000000001776E6001573E700136FDC00126ED3000F6AC9000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000034F09000365
      090003A00C0003A00C0003A00C00029D0A0003A00C0003A00C0003A00C0003A0
      0C00026906000131020000000000000000000000000000000000000000000000
      0000000000001676CA00268BE500278CEB002184E300116CCF000C67C4000B64
      BB000962B400075CA90000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000034F0900066B11000AAB
      1F001BAF2A0008A01200029D0A00029D0A00029D0A00029D0A0003A00C0003A0
      0C0003A60C0002690600014C0400000000000000000000000000000000000000
      000000000000258BD8003EABEE0045B4F7002687DD003DAAF4001E80D5000F69
      BF00065BAA000458A00004579A00035495000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000034F090010AC30000DAB
      280070D080000AA31800029D0A00029D0A00029D0A0003A00C00029D0A0003A0
      0C0003A00C0003A00C00014C0400000000000000000000000000000000000000
      000001500A00319CF70039A4F4001B6DC40048B7FA002687DD0041ADFA003BA7
      F8001F81D400197ACC00065B9F00025291000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000025104000D82230017B641000DAB
      2800BCEAC20013A91E00029D0A0003A00C00029D0A00029D0A00029D0A00029D
      0A00029D0A0003A00C0003790800014203000000000000000000000000000B63
      4400185F690001500A00166AD4002581CE001160C0002889E30040ACFE00359E
      F2003CA6FF003CA6FF002D95EF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000251040017A3410018B54A0010AC
      3000EEFAEF003FBC490003A00C00029D0A0003A00C0034B73E0003A00C00029D
      0A0003A00C0003A00C00029D0A000142030000000000000000000663090025AC
      46001CB62F001CB62F001CB62F0001500A0001500A00196DA3002380E1002C8F
      EB0038A3FF0038A1FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000066B110021B151001EB7510021B1
      5100EEFAEF00D0F0D8002DB84E0017AF390010AC3000B1E6BC0095DC9A0005A1
      0E00029D0A0003A00C00029D0A00014C040000000000096D11001C9A310047F7
      790036E554001CB62F000E912D0012805B001CB62F001CB62F0001500A000150
      0A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000087412003EBD69002AB95C0021B1
      510097E0B200FFFFFF00E5F7ED0092DEB00081D89900DAF3DD00FFFFFF00A6E2
      AB0010A61B0003A00C00029D0A0002510400000000001C982F001890290035E0
      5D0021C239000CA015000086000000830000068E0F001DA657002D9197000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000379080054C57A0044C6740018B5
      4A0030BB6000C2EDD300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00B1E6BC0007A51800029D0A00014203000000000000000000035A06001799
      280011AA1D0001820200007B0000048A0B00005D0100005D0100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000037908004CBD690083DDA70021B1
      51001EB751002AB95C0089DAA700D0F0D800FFFFFF00FFFFFF00FFFFFF00DDF4
      E30038BB520007A51800038C0A00014C04000000000000000000138723002AD1
      490004880700005C0000005D0100046D0A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000021A33600AAE7C50068D0
      8E0016AF480018B54A0021B151002AB95C0057CA8100FFFFFF00C4EDCE0026B4
      41000BA420000AAB1F00066B110000000000000000000E7818002CD44D00068C
      0900005400000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000021A3360056C57300C5F0
      D80066CF8C0021B1510018B54A0021B1510030BB600099E1B50018B54A0010AC
      30000FB02D000A991F00066B11000000000008690E002BCE490007960D000058
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000139923006ACC
      8800D0F4E30099E1B50054C57A0038BD67002AB95C0030BB600030BB600023BC
      4F0011A330000365090000000000000000000D8217000C9D1500005E00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004BBF
      67004CBD690097E0B200BDEED400A7E7C40099E1B50078D99F0049C779001B9D
      3D001B9D3D000000000000000000000000000B89130000650100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001DA4350038B4540046BC660046BC66002BA64900138C2A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BD4C00000000
      0000000000000000000084240500842405008424050084240500842405000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000181818001818180000000000000000000000
      0000000000000000000000000000000000000000000000000000811E00000000
      000000000000811E000000000000811E0000811E0000811E0000000000000000
      000000000000811E0000811E0000000000000000000000000000BD4C0000BD4C
      0000BD4C0000C24F000084240500FFC17900E58E4000D36E1A00842405000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000555556005555
      5600555556003838380000000000000000000000000000000000000000000000
      000000000000000000000056000011401100706B6E0035353500181818000000
      0000000000000000000000000000000000000000000000000000811E00000000
      000000000000811E000000000000811E00000000000000000000811E00000000
      0000811E00000000000000000000811E00000000000000000000BD4C00000000
      0000000000000000000083230400842405008423050083230400842405000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000086380F0087310E007431100054351E002B2A2B00CAC9CC00A1A0
      A300928F9300928C91004F4B4C00000000000000000000000000000000000000
      00000000000000560000007F00002E562F00B4ABB200B0B0AF007E7E7E003838
      3700292929000000000000000000000000000000000000000000811E0000811E
      0000811E0000811E000000000000811E0000811E0000811E0000811E00000000
      0000811E00000000000000000000000000000000000000000000BD4C00000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B251
      0700B2510700B554060036574300278B1C00185E230083838800838187009C9C
      9E00817E81006863660048454600000000000000000000000000000000000000
      000000560000007F0000007F00001F411F00BBAFBA00B2B1B000B4B2B200BAB8
      B80084838300504F4F0023232300000000000000000000000000811E00000000
      000000000000811E00001280FF002567B8000000000000000000811E00000000
      0000811E00000000000000000000811E00000000000000000000BD4C00000000
      0000000000000000000084240500842405008424050084240500842405000000
      0000000000000000000000000000000000000000000000000000DD680100E66D
      0100F36D0100737E140003458E0001479D0026557E00B4A99C009F9792008884
      8B00696B770036373E0000000000000000000000000000000000000000000056
      0000007F000000840000004B0000004B000051594F00988C9700B8B6B700B5B4
      B400B8B8B700BBBBBA001818180021342100000000000000000000000000811E
      0000811E00001773D7001673E9000F74E9000B74E7003F425400000000000000
      000000000000811E0000811E0000000000000000000000000000BD4C0000BD4C
      0000BD4C0000BD4C000084240500FFC17900E58E4000D36E1A00842405000000
      00000000000000000000000000000000000000000000F0770300F47D0600F680
      0900F47F0C00BD831400094677000452BB00034EB200074999007A826900FBBD
      6400E6B77700CBAD8E007974740039383900000000000000000000560000007F
      000000830000004B00006BA56B00004B0000005B0000004B0000414D41008E87
      8C00B8B2B700C1C0C00018181800000000000000000000000000000000000000
      00001370C7002287DE002B93EF002084E200116CCE000768CC000367C7000363
      BC00000000000000000000000000000000000000000000000000BD4C00000000
      0000000000000000000083230400842405008423050083230400842405000000
      00000000000000000000000000000000000000000000F8871100F48B1C00D788
      2C006A604E001E4E6E00094D9E000F72E6000D7AFE000353BB000349A000FFA5
      2200FFA62400FFA72900F69C2800454545000000000000560000007F00000084
      0000004B00006BA56B00004B0000008300000087000000830000006A0000004B
      00003A4F39008781860018181800000000000000000000000000000000000000
      00002288D70039A7ED003CA7EF004ABAFA003DAAF3001F83D7000D67B8000559
      A5000455980000569D0000000000000000000000000000000000BD4C00000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F4891800FF972C00FF9F3E005B6A
      6F000D4F9F00146AC7002396FC001C87EF001687FF00034FB40076846E00FFC4
      5200FFC15000FFBB4100F69F22003D3D3D0000560000007F000003910A00004B
      00006BA56B00004B000001890500008601000080000000800000008200000088
      000000690000004B0000004B0000000000000000000000000000000000001448
      C1002884D9002982DC001C72CB003AA3ED003AA5F00046B5FF00359FF0002C92
      E6001574BF000354930000000000000000000000000000000000BD4C00000000
      0000000000000000000084240500842405008424050084240500842405000000
      000000000000000000000000000000000000FB952B007DA43000469741001057
      9D00187ADE001F80DE001560AF001667B6000D64C20007489800F7D06D00FFD9
      7900FFD57300FFCC5F00F4AF3B0034343400036208000DAA2800004B00006BA5
      6B00004B000003910C00038C0700078E0B008BCF8B0063BC6300008000000081
      0000008400000087000000690000004B00000000000000000000050997000E28
      B1002981E7002277D700206ACC002478D5001E6DCF002D8FE700349DF4003CA6
      FF003EA9FF000000000000000000000000000000000000000000BD4C0000BD4C
      0000BD4C0000BD4C000084240500FFC17900E58E4000D36E1A00842405000000
      000000000000000000000000000000000000F39F3C0034A52C00057E3F000C5A
      B5001573D70008498300077A3E0007425E00034CAA00818E7300FFEB8700FFFA
      A300FFEB9200FFDC7300EFB54B002B2A2B0007791500004B00006BA56B00004B
      00000FA01F00169D2100038C090088CF8A00FFFFFF0058B75800007E00000082
      000000830000007F0000004B0000000000000000000005099700192FCB002A4F
      EE001A40DE001547E0001F6BE500195DCC001E67D1001A64CB00277DE20039A4
      FF00000000000000000000000000000000000000000000000000BD4C00000000
      0000000000000000000083230400842405008423050083230400842405000000
      000000000000000000000000000000000000FAA64A00BFB55A00208945000950
      A5000A59A7000C7E3C0010A92300115F380016447E0089816E009A977B00A9A3
      8900C2AB7B00DCB76A00DEAF5800232323000D6311006BA56B00004B0000069F
      1A003BB54B00CFEED400CAEBCC00FFFFFF0054B6560000790000008100000082
      0000007B0000004B000000000000000000000000000005099700284BE9002A5A
      FF00163EFF000525FF000122F3000D44EA001650CF00103EB500000000000000
      0000000000000000000000000000000000008424050084240500842405008424
      0500842405000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFBC7700E3C695001353
      8C00095189000FA121000FA523001D8E27008F673D007F4F25006B461F005E4F
      2C0035573F00303D38003736390000000000125D1100004B00000FA92B000FA5
      2600099A18001BA3290068C57000D9EFDA00AADDAB001A981B0000800000007A
      0000004B000000000000000000000000000000000000000000000711A400133D
      F4000D35FF00011DEB000227EA000A40E70005169F0000000000000000000000
      00000000000000000000000000000000000084240500FFC17900E58E4000D36E
      1A00842405000000000000000000000000000000000000000000000000000000
      0000000000000008E10000000000000000000000000075AF4800FFCB93005879
      9F000D4789000A8B2D000FA1230011A524003EAF2F0045AC2A00FF8811006889
      100007A01F0000000000000000000000000000000000004B000006730F000A8B
      19000C9F1F0006991500028F0A000A92120044B24900098C0C0000760000004B
      00000000000000000000000000000000000000000000000181000321CC00113C
      FA000818C4000106950003047D00000000000000000000000000000000000000
      0000000000000000000000000000000000008323040084240500842305008323
      0400842405000000000000000000000000000000000000000000000000000000
      00000008E100000000000008E10000000000000000000000000067B14A00C7B0
      96002858820013972E000FA1220011A3230009A323002E9F2300FF800C004C96
      160000000000000000000000000000000000000000000000000000000000004B
      000003620600067E0F000795130005930C000186040001780400004B00000000
      00000000000000000000000000000000000000007E000523C4000E3FFF000C19
      AD00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000008E1000000000000000000000000007FB1
      4C0095B557000FA3230010A323000FA323000FA42400A5901A00FF7704000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000004B0000015702000375070003770700004B0000000000000000
      0000000000000000000000000000000000000316AD000C43FF000815B0000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000008E1000000000000000000000000000000
      00000000000011A3230011A323000CA4240068971F0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000004B0000004B000000000000000000000000
      000000000000000000000000000000000000010CA100040FAF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001E96CB001E96CB001E96
      CB00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AF3E3F008F5D5D00BCAC
      AA00EDE9E500DDDEDD008C3D3C008F2828000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000474F
      4C00474F4C00474F4C0000000000474F4C00474F4C0000000000000000000000
      0000000000000000000000000000000000001E96CB0097EBF70057D9F20047C6
      E6004AACE3001E96CB001E96CB000D8EC7000000000000000000000000000000
      000000000000000000000000000000000000B4565200BF4949008E4D4D00862D
      2C00DDCECC00FFFFFF00933E3D0090242300A141420000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000285C
      2E0009691000474F4C0000000000285C2E0009691000474F4C00000000000000
      0000000000000000000000000000000000001E96CB00B4F0F80080FFFF0083FE
      FF0080FAFF007BF4FF006BE3F8004FCEEB001E96CB001E96CB000D8EC7000000
      000000000000000000000000000000000000B2575300BC454600A15F5F00883B
      3A009D8A8900EDE7E500983E3F0090232300A141420000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000285C
      2E0009691000474F4C0000000000285C2E000969100009691000474F4C000000
      0000000000000000000000000000000000001E96CB0072CAE60093FFFF005FC7
      D00063C7D00077F3FF0079F3FF007DF6FF007BF4FF0077EFFF005ABFCC001E96
      CB0000000000000000000000000000000000B0545000B53F4000B8565600BC66
      6500B2575700BB5D5D00B7525200B84A4A009E3E3F0000000000000000000000
      0000000000000000000003050500030505000000000000000000000000000000
      0000AE2C4500A1342600A1342600A1342600A1342600A1342600A1342600AE2C
      450000000000000000000000000000000000000000000000000000000000285C
      2E0009691000474F4C0000000000285C2E00096910000969100009691000474F
      4C00000000000000000000000000000000000D8EC70028A3D300A1FAFE005ECA
      D00060C6CE0060C4CE005FC2CE005DC1CE005CC1CC005CC0CC005EC0CF004FB1
      CE001FA1D400000000000000000000000000A3484300C2848200E9D1D100E9D1
      CF00EACFCC00E9CCCB00EADAD800C67473009935350000000000000000000000
      0000000000000001000000010100020404000000000000000000000000000000
      0000A1342600933B0700933B0700933B0700933B0700933B0700933B0700A134
      260000000000000000000000000000000000000000000000000000000000285C
      2E0009691000474F4C0000000000285C2E000969100009691000096910000969
      1000474F4C000000000000000000000000000D8EC7001E96CB004EC0E0006CCF
      D0008AF6FF0068CCDE0069CEF40062C6ED0060C6EB005CBFDE0084EEFE0052B6
      D3001E96CB00000000000000000000000000A3484200DEBDBB00EFF6F400E3E1
      E100E5E3E200E5E5E300EEF3F200C576750098333400101129001F1F9E000D0D
      86000D0D860001034100FFFFFF00141818000000000000000000000000000000
      0000A1342600933B0700933B0700933B0700933B0700933B0700933B0700A134
      260000000000000000000000000000000000000000000000000000000000285C
      2E0009691000474F4C0000000000285C2E000969100009691000096910000969
      100009691000474F4C0000000000000000000D8EC7001E96CB005BBFE00082D0
      D00068D5DC0069D3E10070D9FE006BD1F8006DD5FA0064C7EA0067CCD9004BB0
      CF006EE7FC001E96CB000000000000000000A3484300DCB5B400DEE0DE00D0CB
      CB00D3CECE00D0CECC00E1E2E200C5757500983334001F2032005151CA003E3E
      CC004F50E6001F21820032342D000A0D0D000000000000000000000000000000
      0000A1342600933B0700933B0700933B0700933B0700933B0700933B0700A134
      260000000000000000000000000000000000000000000000000000000000285C
      2E0009691000474F4C0000000000285C2E000969100009691000096910000969
      1000096910000969100065426A00000000000D8EC7004ECBF3001E96CB0063A7
      BC0096E5F30079CAD9009DEDFC0084E7FB0072DDFC0065CAE90084EEFE0049AF
      D0007DF3FF001E96CB000000000000000000A4494300DEB7B700EAEAE900DCD8
      D700DED9D800DDD9D800EBEAE900C97876009833340037393900ABAAD8009292
      DE008B8AF00026287800FFFFFF00111515000000000000000000000000000000
      0000A1342600933B0700933B0700933B0700933B0700933B0700933B0700A134
      260000000000000000000000000000000000000000000000000000000000285C
      2E0009691000474F4C0000000000285C2E000969100009691000096910000969
      100009691000474F4C0000000000000000000D8EC70058D4F7004ECBF4001E96
      CB001E96CB001E96CB0030A0D00079BDE90080D8FB005CC6EB0065CEDC0044AD
      CE0075F0FF0062E0F3001E96CB000000000000000000C5A3A100DEE0E000D9D1
      D100D9D3D300D9D3D400DDDDDC00B16B6A0023232100282A3A007875E0004342
      D9003B39E90017188200383C32000A0E0E000000000000000000000000000000
      0000A1342600933B0700933B0700933B0700933B0700933B0700933B0700A134
      260000000000000000000000000000000000000000000000000000000000285C
      2E0009691000474F4C0000000000285C2E000969100009691000096910000969
      1000474F4C000000000000000000000000000D8EC70076F0FE0063E0FA000305
      0500FFFFFF0003050500030505001E96CB004B98B6007FBFCA00ABF6FF006EBB
      D3009CF6FF00A4FFFF001E96CB00000000000000000000000000000000000000
      000000000000000000000000000002030300B7B7B70002040400030505000305
      05000305050003050500FFFFFF00111414000000000000000000000000000000
      0000A1342600933B0700933B0700933B0700933B0700933B0700933B0700A134
      260000000000000000000000000000000000000000000000000000000000285C
      2E0009691000474F4C0000000000285C2E00096910000969100009691000474F
      4C00000000000000000000000000000000000D8EC70089FFFF007AFAFF000305
      050049474F0028431A0065CB2700429711001E96CB001896CA001896CA000A8A
      C5000A8AC5000A8AC5001E96CB00000000000000000000000000000000000000
      000000000000000000000000000002040400413F4500253F180063C726004296
      1100459813002355090044414A000C0F0F000000000000000000000000000000
      0000AE2C4500A1342600A1342600A1342600A1342600A1342600A1342600AE2C
      450000000000000000000000000000000000000000000000000000000000285C
      2E0009691000474F4C0000000000285C2E000969100009691000474F4C000000
      0000000000000000000000000000000000000D8EC7008CFFFF0079F8FF000305
      0500FFFFFF00424F4000ADED830093D46B00A7E97E0041772500FFFFFF001013
      13001E96CB000000000000000000000000000000000000000000000000000000
      000000000000000000000000000003050500F7F7F700414E3F00ACEB820093D4
      6B00A7E97E0041772500FFFFFF00101313000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000285C
      2E0009691000474F4C0000000000285C2E0009691000474F4C00000000000000
      0000000000000000000000000000000000000D8EC7009FF7FB0083FFFF000305
      05004D4E4F004F545200E1FEC900ADE18C00A4E67A0046782C0049474F000D11
      1100000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FE00FE00030505004D4E4F004F545200E1FEC900ADE1
      8C00A4E67A0046782C0049474F000D1111000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000474F
      4C00474F4C00474F4C0000000000474F4C00474F4C0000000000000000000000
      000000000000000000000000000000000000000000001896CA0080EAF7000305
      0500FFFFFF003849340099DC6F0068B8380065C030002F671300FFFFFF001013
      1300000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000003050500FFFFFF003849340099DC6F0068B8
      380065C030002F671300FFFFFF00101313000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001896CA000305
      0500030505000306050002040300010403000104030000000000030505000E12
      1200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000030505000305050003060500020403000104
      03000104030000000000030505000E1212000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000305
      0500000000000000000000000000000000000000000000000000000000000204
      0400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000030505000000000000000000000000000000
      0000000000000000000000000000020404000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000820000008200000082000000820000008200000082000000
      8200000082000000820000008200000082000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000008200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000082000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BD4C0000BD4C0000BD4C0000BD4C
      0000BD4C0000BD4C0000BD4C0000BD4C0000BD4C000000000000000000000000
      00000000000000000000000000000000000093655E009F6F60009F6F60009F6F
      60009F6F600000008200FFFFFF00FFFFFF0000008200FFFFFF00000082000000
      82000000820000008200FFFFFF00000082000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFEFB00FFFAF400FEF6EB00FFF2
      E100FFEBD800FEE7CE00FEE3C500FEE0BD00BD4C000000000000000000000000
      00000000000000000000000000000000000097675F00FAE5C600F2D7B500F0D1
      AA00EECCA00000008200FFFFFF00FFFFFF0000008200FFFFFF00FFFFFF000000
      8200FFFFFF00FFFFFF00FFFFFF00000082000000000000000000000000000000
      000000000000000000004000C8002000BE002000BE004000C800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFEFC00FFFBF700FFF7EF00FFF3
      E600FFEEDC00FEE9D100FEE5C700FEE1BF00BD4C000000000000000000000000
      0000000000000000000000000000000000009C6B6200FCEAD000F3DCBF00F2D7
      B400F0D1AA0000008200FFFFFF00FFFFFF0000008200FFFFFF00FFFFFF00FFFF
      FF0000008200FFFFFF00FFFFFF00000082000000000000000000000000000000
      00004101DC002000C3000000B5000000B5000000B5000000B5002000C3004101
      DC00000000000000000000000000000000000000000000000000000000000000
      00004000C8002000BE004000C80000000000000000004000C8002000BE004000
      C80000000000000000000000000000000000FFFFFF00FFFCFA00FFF8F200FEF4
      E900FEF0DE00FEEBD400FEE6CB00FEE2C200BD4C000000000000000000000000
      000000000000000000000000000000000000A1706400FEF0DD00D5812700F3DC
      BF00D581270000008200FFFFFF000000820000008200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000008200FFFFFF00000082000000000000000000000000000000
      00002000C3000000B5000000B5000000B5000000B5000000B5000000B5002000
      C300000000000000000000000000000000000000000000000000000000000000
      00002000BE000000B5002000BE0000000000000000002000BE000000B5002000
      BE0000000000000000000000000000000000811E0000811E0000811E0000811E
      0000811E0000811E0000811E0000811E0000811E0000811E0000811E0000BD4C
      000000000000004B00000000000000000000A7756600FFF6E700F7E6D300F6E1
      C900F3DCBF0000008200FFFFFF00FFFFFF0000008200FFFFFF00000082000000
      820000008200FFFFFF00FFFFFF00000082000000000000000000000000004000
      C8000000B5000000B5000000B5000000B5000000B5000000B5000000B5000000
      B5004000C8000000000000000000000000000000000000000000000000000000
      00002000BE000000B5002000BE0000000000000000002000BE000000B5002000
      BE0000000000000000000000000000000000FFFFFE00FFFBF800FFFAF200FFF6
      EB00FEF2E300FFEEDC00FEEAD400FEE7CC00FEE3C600FEE1BF00FEDEBA00BD4C
      000000000000004B0000004B000000000000AF7A6800FFFCF400D5812700D581
      2700D581270000008200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000082000000000000000000000000002000
      BE000000B5000000B5000000B5000000B5000000B5000000B5000000B5000000
      B5002000BE000000000000000000000000000000000000000000000000000000
      00002000BE000000B5002000BE0000000000000000002000BE000000B5002000
      BE0000000000000000000000000000000000FFFEFE00FFFCFA00FEFAF300FFF7
      EE00FFF3E600FFEFDE00FEEDD700FFE9CF00FEE5C700FEE1C100FEDEBB00BD4C
      000000000000004B00004BFE8200004B0000B7816B00FFFFFF00FBF2EB00F8ED
      DE00F7E6D3000000820000008200000082000000820000008200000082000000
      8200000082000000820000008200000082000000000000000000000000002000
      BE000000B5000000B5000000B5000000B5000000B5000000B5000000B5000000
      B5002000BE000000000000000000000000000000000000000000000000000000
      00002000BE000000B5002000BE0000000000000000002000BE000000B5002000
      BE0000000000000000000000000000000000FFFFFF00FFFCFB00FFFAF600FFF7
      EF00FEF4E700FFF0E000FFEDD900FEE9D100FEE5C900FEE2C200FEE0BC00BD4C
      000000000000004B0000004B000000000000BD876D00FFFFFF00FEFBF600FCF3
      EB00F8EDE000F7E7D300F6E1C900F3DCBC00F2D5B100EFCFA500F3D0A0009F6F
      6000000000000000000000000000000000000000000000000000000000004000
      C8000000B5000000B5000000B5000000B5000000B5000000B5000000B5000000
      B5004000C8000000000000000000000000000000000000000000000000000000
      00002000BE000000B5002000BE0000000000000000002000BE000000B5002000
      BE0000000000000000000000000000000000811E0000811E0000811E0000811E
      0000811E0000811E0000811E0000811E0000811E0000811E0000811E0000BD4C
      000000000000004B00000000000000000000C58B6F00FFFFFF00D5812700D581
      2700D5812700D5812700D5812700F6E1C500D5812700D5812700F2D1A3009F6F
      6000000000000000000000000000000000000000000000000000000000000000
      00002000C3000000B5000000B5000000B5000000B5000000B5000000B5002000
      C300000000000000000000000000000000000000000000000000000000000000
      00002000BE000000B5002000BE0000000000000000002000BE000000B5002000
      BE0000000000000000000000000000000000FFFFFF00FFFCFA00FFF8F200FFF4
      E700FFEEDD00FFEAD100FEE5C700FEE1BD00BD4C000000000000000000000000
      000000000000000000000000000000000000CB907200FFFFFF00FFFFFF00FFFF
      FF00FEFBF700FBF2EA00F8EDE000F7E9D400F6E1C700F3D9B800F4D7AD009F6F
      6000000000000000000000000000000000000000000000000000000000000000
      00004101DC002000C3000000B5000000B5000000B5000000B5002000C3004101
      DC00000000000000000000000000000000000000000000000000000000000000
      00004000C8002000BE004000C80000000000000000004000C8002000BE004000
      C80000000000000000000000000000000000FFFFFF00FFFEFE00FFFAF600FFF6
      EB00FFF0E100FEEBD500FFE6CB00FEE1C200BD4C000000000000000000000000
      000000000000000000000000000000000000D0957400FFFFFF00D5812700D581
      2700D5812700FEFBF700D5812700D5812700D5812700D5812700F6E0BD009F6F
      6000000000000000000000000000000000000000000000000000000000000000
      000000000000000000004000C8002000BE002000BE004000C800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFCF800FFF8
      F000FEF3E600FEEEDC00FEE9CF00FEE5C500BD4C000000000000000000000000
      000000000000000000000000000000000000D4987500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFEFA00FCF7F200FBF3E900F8EBD800FAE6CB009F6F
      6000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BD4C0000BD4C0000BD4C0000BD4C
      0000BD4C0000BD4C0000BD4C0000BD4C0000BD4C000000000000000000000000
      000000000000000000000000000000000000D4987500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFBF300FBF0E000FCEDD0009F6F
      6000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CF8E6800CF8E6800CF8E6800CF8E
      6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E68009F6F
      6000000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000434141004341
      4100434141004341410043414100434141004341410043414100434141004341
      4100434141004341410000000000000000000000000000000000434141004341
      4100434141004341410043414100434141004341410043414100434141004341
      4100434141004341410000000000000000000000000000000000434141004341
      41004341410043414100434141001877EA001574E00043414100434141004341
      410043414100434141000000000000000000BD4C0000BD4C0000BD4C0000BD4C
      0000BD4C0000BD4C0000BD4C0000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004D4A4A006D6767007367
      6700776666007D66640081646400866464008A6462008C6462008C6462008C64
      62008C6462008C6462004341410000000000000000004D4A4A006D6767007367
      6700776666007D66640081646400866464008A6462008C6462008C6462008C64
      62008C6462008C6462004341410000000000000000004D4A4A006D6767007367
      6700776666007D6664001776E6001573E700136FDC00126ED3000F6AC9008C64
      62008C6462008C6462004341410000000000FEFBF700FFF7ED00FFF0E000FEEA
      D100FEE3C500FEDEB800BD4C0000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004D4A4A00878484008981
      810090818100987F7F00A0807D00A77E7D00B07B7B00B77B7900BB7B7900BB7B
      7900BB7B79008C6462004341410000000000000000004D4A4A00878484008981
      810090818100987F7F00A0807D00A77E7D00B07B7B00B77B7900BB7B7900BB7B
      7900BB7B79008C6462004341410000000000000000004D4A4A00878484008981
      8100908181001676CA00268BE500278CEB002184E300116CCF000C67C4000B64
      BB000962B400075CA9004341410000000000FFFEFB00FFFAF200FFF3E600FEEE
      D900FEE6CB00FEE0C000BD4C0000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004D4A4A008C8C8C008886
      86008982820090818000FFFFFF00FFFFFF00FFFFFF00FFFFFF00D7B7B600BB7B
      7900BB7B79008C6462004341410000000000000000004D4A4A008C8C8C008886
      860089828200C2BABA00FFFFFF00FFFFFF00FFFFFF00D3B7B700B67B7A00BB7B
      7900BB7B79008C6462004341410000000000000000004D4A4A008C8C8C008886
      860089828200258BD8003EABEE0045B4F7002687DD003DAAF4001E80D5000F69
      BF00065BAA000458A00004579A0003549500FFFFFF00FFFBF800FFF6ED00FFF0
      E000FFE9D300FEE3C500BD4C0000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004D4A4A009A9A9A009090
      900089888800F0EFEF00FFFFFF00C6BABA009E7E7E00F3EEEE00FFFFFF00CAA0
      9F00BB7B79008C6462004341410000000000000000004D4A4A009A9A9A009090
      900089888800888181008F81800097808000E6DEDE00FFFFFF00D2B7B700B57B
      7A00BB7B79008C6462004341410000000000000000004D4A4A009A9A9A009090
      900001500A00319CF70039A4F4001B6DC40048B7FA002687DD0041ADFA003BA7
      F8001F81D400197ACC00065B9F0002529100811E0000811E0000811E0000811E
      0000811E0000811E0000BD4C0000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004D4A4A00ADADAD009D9D
      9D0092919100FFFFFF00FFFFFF008E81800096808000E6DFDF00FFFFFF00D2B7
      B600B47B7A008C6462004341410000000000000000004D4A4A00ADADAD009D9D
      9D009291910088888800878181008E81800096808000FFFFFF00F3EEEE00AC7B
      7A00B47B7A008C6462004341410000000000000000004D4A4A00ADADAD000B63
      4400185F690001500A00166AD4002581CE001160C0002889E30040ACFE00359E
      F2003CA6FF003CA6FF002D95EF00000000000000000000000000000000000000
      000000000000000000000000000000000000004B000000000000BD4C0000811E
      0000811E0000811E0000811E0000811E0000000000004D4A4A00C1C0C000ABAA
      AA009C9C9C00D4D3D300FFFFFF00E1DFDF00FFFFFF00FFFFFF00FFFFFF00A37F
      7D00AB7E7D00876463004341410000000000000000004D4A4A00C1C0C000ABAA
      AA009C9C9C00B0AFAF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BDA3
      A200AB7E7D00876463004341410000000000000000004D4A4A000663090025AC
      46001CB62F001CB62F001CB62F0001500A0001500A00196DA3002380E1002C8F
      EB0038A3FF0038A1FF0043414100000000000000000000000000000000000000
      0000000000000000000000000000004B0000004B000000000000BD4C0000FFF7
      ED00FFF0E000FEEAD100FEE3C500FEDEB800000000004D4A4A00CECECE00B7B6
      B600A5A5A500B6B6B600FFFFFF00FFFFFF00FFFFFF00FFFFFF00B1A4A400997F
      7F00A17F7D00826564004341410000000000000000004D4A4A00CECECE00B7B6
      B600A5A5A500F2F2F200FFFFFF00BEBEBE0087828200F0EFEF00FFFFFF00B6A3
      A300A17F7D0082656400434141000000000000000000096D11001C9A310047F7
      790036E554001CB62F000E912D0012805B001CB62F001CB62F0001500A000150
      0A00A17F7D008265640043414100000000000000000000000000000000000000
      00000000000000000000004B000031C75800004B000000000000BD4C0000FFFA
      F200FFF3E600FEEED900FEE6CB00FEE0C000000000004D4A4A00D7D5D500C0C0
      C000B1AFAF00E8E8E800FFFFFF00D4D4D40089898900EFEFEF00FFFFFF009281
      8100987F7F007B6664004341410000000000000000004D4A4A00D7D5D500C0C0
      C000B1AFAF00FFFFFF00FFFFFF009191910089898900EFEFEF00FFFFFF009281
      8100987F7F007B6664004341410000000000000000001C982F001890290035E0
      5D0021C239000CA015000086000000830000068E0F001DA657002D9197009281
      8100987F7F007B66640043414100000000000000000000000000000000000000
      0000000000000000000000000000004B0000004B000000000000BD4C0000FFFB
      F800FFF6ED00FFF0E000FFE9D300FEE3C500000000004D4A4A00DCDADA00CAC9
      C900BDBDBD00ECEBEB00FFFFFF00C9C9C90095959500FFFFFF00FFFFFF00AAA4
      A40090818100766666004341410000000000000000004D4A4A00DCDADA00CAC9
      C900BDBDBD00ECEBEB00FFFFFF00C9C9C900B3B3B300FFFFFF00F0EFEF008981
      810090818100766666004341410000000000000000004D4A4A00035A06001799
      280011AA1D0001820200007B0000048A0B00005D0100005D0100878484008981
      8100908181007666660043414100000000000000000000000000000000000000
      000000000000000000000000000000000000004B000000000000BD4C0000811E
      0000811E0000811E0000811E0000811E0000000000004D4A4A00E0E0E000D1D0
      D000C5C4C400BFBDBD00F5F5F500FFFFFF00FFFFFF00FFFFFF00C0C0C0008787
      870088818100706766004341410000000000000000004D4A4A00E0E0E000D1D0
      D000C5C4C400BFBDBD00F5F5F500FFFFFF00FFFFFF00FFFFFF008C8C8C008787
      870088818100706766004341410000000000000000004D4A4A00138723002AD1
      490004880700005C0000005D0100046D0A00A3A3A300979797008C8C8C008787
      870088818100706766004341410000000000811E0000811E0000811E0000811E
      0000811E0000811E0000BD4C0000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004D4A4A00E1E1E100DEDE
      DE00D8D7D700D3D1D100CACACA00BFBFBF00B4B4B400A4A4A400979797008E8E
      8E00878787006B6767004341410000000000000000004D4A4A00E1E1E100DEDE
      DE00D8D7D700D3D1D100CACACA00BFBFBF00B4B4B400A4A4A400979797008E8E
      8E00878787006B6767004341410000000000000000000E7818002CD44D00068C
      090000540000D3D1D100CACACA00BFBFBF00B4B4B400A4A4A400979797008E8E
      8E00878787006B6767004341410000000000FEFBF700FFF7ED00FFF0E000FEEA
      D100FEE3C500FEDEB800BD4C0000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004D4A4A00D8D7D700E1E1
      E100E2E2E200E0E0E000DADADA00D0CFCF00C0BFBF00B0ADAD009F9F9F009695
      95008E8E8E006B6B6B004341410000000000000000004D4A4A00D8D7D700E1E1
      E100E2E2E200E0E0E000DADADA00D0CFCF00C0BFBF00B0ADAD009F9F9F009695
      95008E8E8E006B6B6B00434141000000000008690E002BCE490007960D000058
      0000E2E2E200E0E0E000DADADA00D0CFCF00C0BFBF00B0ADAD009F9F9F009695
      95008E8E8E006B6B6B004341410000000000FFFEFB00FFFAF200FFF3E600FEEE
      D900FEE6CB00FEE0C000BD4C0000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000005B5A5A006A69
      69006C6B6B006C6B6B0068676700636262005B5A5A00535353004F4E4E004E4D
      4D004D4C4C004D4C4C00000000000000000000000000000000005B5A5A006A69
      69006C6B6B006C6B6B0068676700636262005B5A5A00535353004F4E4E004E4D
      4D004D4C4C004D4C4C0000000000000000000D8217000C9D1500005E00006A69
      69006C6B6B006C6B6B0068676700636262005B5A5A00535353004F4E4E004E4D
      4D004D4C4C004D4C4C000000000000000000FFFFFF00FFFBF800FFF6ED00FFF0
      E000FFE9D300FEE3C500BD4C0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000B89130000650100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BD4C0000BD4C0000BD4C0000BD4C
      0000BD4C0000BD4C0000BD4C0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000434141004341
      4100434141004341410043414100434141004341410043414100434141004341
      4100434141004341410000000000000000000000000000000000434141004341
      4100434141004341410043414100434141004341410043414100434141004341
      4100434141004341410000000000000000000000000000000000434141004341
      4100434141004341410043414100434141004341410043414100434141004341
      4100434141004341410000000000000000000000000000000000434141004341
      4100434141004341410043414100434141004341410043414100434141004341
      410043414100434141000000000000000000000000004D4A4A006D6767007367
      6700776666007D66640081646400866464008A6462008C6462008C6462008C64
      62008C6462008C6462004341410000000000000000004D4A4A006D6767007367
      6700776666007D66640081646400866464008A6462008C6462008C6462008C64
      62008C6462008C6462004341410000000000000000004D4A4A006D6767007367
      6700776666007D66640081646400866464008A6462008C6462008C6462008C64
      62008C6462008C6462004341410000000000000000004D4A4A006D6767007367
      6700776666007D66640081646400866464008A6462008C6462008C6462008C64
      62008C6462008C6462004341410000000000000000004D4A4A00878484008981
      810090818100987F7F00A0807D00A77E7D00B07B7B00B77B7900BB7B7900BB7B
      7900BB7B79008C6462004341410000000000000000004D4A4A00878484008981
      810090818100987F7F00A0807D00A77E7D00B07B7B00B77B7900BB7B7900BB7B
      7900BB7B79008C6462004341410000000000000000004D4A4A00878484008981
      810090818100987F7F00A0807D00A77E7D00B07B7B00B77B7900BB7B7900BB7B
      7900BB7B79008C6462004341410000000000000000004D4A4A00878484008981
      810090818100987F7F00A0807D00A77E7D00B07B7B00B77B7900BB7B7900BB7B
      7900BB7B79008C6462004341410000000000000000004D4A4A008C8C8C008886
      86008982820090818000987F7F009F807E00E8DEDE00FFFFFF00D7B7B600BB7B
      7900BB7B79008C6462004341410000000000000000004D4A4A008C8C8C008886
      8600E1DFDF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00AF7B7B00B67B7A00BB7B
      7900BB7B79008C6462004341410000000000000000004D4A4A008C8C8C008886
      86008982820090818000D7CDCD00FFFFFF00FFFFFF00FFFFFF00CBA09F00BB7B
      7900BB7B79008C6462004341410000000000000000004D4A4A008C8C8C008886
      860089828200C2BABA00FFFFFF00FFFFFF00A67E7D00AF7B7B00B67B7A00BB7B
      7900BB7B79008C6462004341410000000000000000004D4A4A009A9A9A009090
      900089888800888181008F81800097808000E6DEDE00FFFFFF00D2B7B700B57B
      7A00BB7B79008C6462004341410000000000000000004D4A4A009A9A9A009090
      9000E1E1E100A9A4A4008F818000B4A4A400FFFFFF00F3EEEE00AD7B7B00B57B
      7A00BB7B79008C6462004341410000000000000000004D4A4A009A9A9A009090
      900089888800BEBABA00FFFFFF00D6CDCD009E7E7E00FFFFFF00FFFFFF00B57B
      7A00BB7B79008C6462004341410000000000000000004D4A4A009A9A9A009090
      90008988880088818100E3DFDF00FFFFFF00D9CDCD00A57E7D00AD7B7B00B57B
      7A00BB7B79008C6462004341410000000000000000004D4A4A00ADADAD009D9D
      9D0092919100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DFCB
      CB00B47B7A008C6462004341410000000000000000004D4A4A00ADADAD009D9D
      9D009291910088888800878181008E818000F1EFEF00FFFFFF00BEA2A200AC7B
      7A00B47B7A008C6462004341410000000000000000004D4A4A00ADADAD009D9D
      9D0092919100E1E1E100FFFFFF00C1BABA0096808000E6DFDF00FFFFFF00D2B7
      B600B47B7A008C6462004341410000000000000000004D4A4A00ADADAD009D9D
      9D009291910088888800A9A4A400FFFFFF00FFFFFF009D7F7F00A47E7D00AC7B
      7A00B47B7A008C6462004341410000000000000000004D4A4A00C1C0C000ABAA
      AA009C9C9C00F1F1F100E1E1E10087818100E2DFDF00FFFFFF00C9B9B900A37F
      7D00AB7E7D00876463004341410000000000000000004D4A4A00C1C0C000ABAA
      AA009C9C9C00918F8F0087878700A9A4A400FFFFFF00FFFFFF009C7F7F00A37F
      7D00AB7E7D00876463004341410000000000000000004D4A4A00C1C0C000ABAA
      AA009C9C9C00F1F1F100FFFFFF00A9A4A4008C828100F1EFEF00FFFFFF00BDA3
      A200AB7E7D00876463004341410000000000000000004D4A4A00C1C0C000ABAA
      AA009C9C9C00918F8F0087878700E1DFDF00FFFFFF00D6CDCD009C7F7F00A37F
      7D00AB7E7D00876463004341410000000000000000004D4A4A00CECECE00B7B6
      B600A5A5A500B6B6B600FFFFFF00BEBEBE00E1DFDF00FFFFFF00C3BABA00997F
      7F00A17F7D00826564004341410000000000000000004D4A4A00CECECE00B7B6
      B600CECECE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0BABA0092818100997F
      7F00A17F7D00826564004341410000000000000000004D4A4A00CECECE00B7B6
      B600A5A5A500E5E5E500FFFFFF00FFFFFF00FFFFFF00FFFFFF00D4CECE00997F
      7F00A17F7D00826564004341410000000000000000004D4A4A00CECECE00B7B6
      B600A5A5A5009A99990090909000A9A9A900FFFFFF00FFFFFF0092818100997F
      7F00A17F7D00826564004341410000000000000000004D4A4A00D7D5D500C0C0
      C000B1AFAF00A3A3A300D7D7D700FFFFFF00E1E1E100FFFFFF00BEBABA009281
      8100987F7F007B6664004341410000000000000000004D4A4A00D7D5D500C0C0
      C000D4D3D300FFFFFF00E5E5E500919191008989890086838300898181009281
      8100987F7F007B6664004341410000000000000000004D4A4A00D7D5D500C0C0
      C000B1AFAF00DBDBDB00FFFFFF00D4D4D4008989890086838300898181009281
      8100987F7F007B6664004341410000000000000000004D4A4A00D7D5D500C0C0
      C000B1AFAF00A3A3A3009998980091919100E1E1E100FFFFFF00D1CECE009281
      8100987F7F007B6664004341410000000000000000004D4A4A00DCDADA00CAC9
      C900BDBDBD00B4B1B100A6A6A600E6E6E600FFFFFF00FFFFFF00BDBCBC008981
      810090818100766666004341410000000000000000004D4A4A00DCDADA00CAC9
      C900DBDBDB00FFFFFF00E8E8E8009D9C9C00959595008C8A8A00878484008981
      810090818100766666004341410000000000000000004D4A4A00DCDADA00CAC9
      C900BDBDBD00B4B1B100FFFFFF00FFFFFF00959595008C8A8A00878484008981
      810090818100766666004341410000000000000000004D4A4A00DCDADA00CAC9
      C900BDBDBD00B4B1B100A6A6A6009D9C9C00B3B3B300FFFFFF00FFFFFF008981
      810090818100766666004341410000000000000000004D4A4A00E0E0E000D1D0
      D000C5C4C400BFBDBD00B4B2B200ABAAAA00FFFFFF00FFFFFF00C0C0C0008787
      870088818100706766004341410000000000000000004D4A4A00E0E0E000D1D0
      D000DFDFDF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008C8C8C008787
      870088818100706766004341410000000000000000004D4A4A00E0E0E000D1D0
      D000C5C4C400BFBDBD00B4B2B200FFFFFF00FFFFFF00FFFFFF00E2E2E2008787
      870088818100706766004341410000000000000000004D4A4A00E0E0E000D1D0
      D000C5C4C400EFEEEE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A9A9
      A90088818100706766004341410000000000000000004D4A4A00E1E1E100DEDE
      DE00D8D7D700D3D1D100CACACA00BFBFBF00B4B4B400A4A4A400979797008E8E
      8E00878787006B6767004341410000000000000000004D4A4A00E1E1E100DEDE
      DE00D8D7D700D3D1D100CACACA00BFBFBF00B4B4B400A4A4A400979797008E8E
      8E00878787006B6767004341410000000000000000004D4A4A00E1E1E100DEDE
      DE00D8D7D700D3D1D100CACACA00BFBFBF00B4B4B400A4A4A400979797008E8E
      8E00878787006B6767004341410000000000000000004D4A4A00E1E1E100DEDE
      DE00D8D7D700D3D1D100CACACA00BFBFBF00B4B4B400A4A4A400979797008E8E
      8E00878787006B6767004341410000000000000000004D4A4A00D8D7D700E1E1
      E100E2E2E200E0E0E000DADADA00D0CFCF00C0BFBF00B0ADAD009F9F9F009695
      95008E8E8E006B6B6B004341410000000000000000004D4A4A00D8D7D700E1E1
      E100E2E2E200E0E0E000DADADA00D0CFCF00C0BFBF00B0ADAD009F9F9F009695
      95008E8E8E006B6B6B004341410000000000000000004D4A4A00D8D7D700E1E1
      E100E2E2E200E0E0E000DADADA00D0CFCF00C0BFBF00B0ADAD009F9F9F009695
      95008E8E8E006B6B6B004341410000000000000000004D4A4A00D8D7D700E1E1
      E100E2E2E200E0E0E000DADADA00D0CFCF00C0BFBF00B0ADAD009F9F9F009695
      95008E8E8E006B6B6B00434141000000000000000000000000005B5A5A006A69
      69006C6B6B006C6B6B0068676700636262005B5A5A00535353004F4E4E004E4D
      4D004D4C4C004D4C4C00000000000000000000000000000000005B5A5A006A69
      69006C6B6B006C6B6B0068676700636262005B5A5A00535353004F4E4E004E4D
      4D004D4C4C004D4C4C00000000000000000000000000000000005B5A5A006A69
      69006C6B6B006C6B6B0068676700636262005B5A5A00535353004F4E4E004E4D
      4D004D4C4C004D4C4C00000000000000000000000000000000005B5A5A006A69
      69006C6B6B006C6B6B0068676700636262005B5A5A00535353004F4E4E004E4D
      4D004D4C4C004D4C4C0000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000434141004341
      4100434141004341410043414100434141004341410043414100434141004341
      4100434141004341410000000000000000000000000000000000434141004341
      4100434141004341410043414100434141004341410043414100434141004341
      4100434141004341410000000000000000000000000000000000434141004341
      4100434141004341410043414100434141004341410043414100434141004341
      4100434141004341410000000000000000000000000000000000434141004341
      4100434141004341410043414100434141004341410043414100434141004341
      410043414100434141000000000000000000000000004D4A4A006D6767007367
      6700776666007D66640081646400866464008A6462008C6462008C6462008C64
      62008C6462008C6462004341410000000000000000004D4A4A006D6767007367
      6700776666007D66640081646400866464008A6462008C6462008C6462008C64
      62008C6462008C6462004341410000000000000000004D4A4A006D6767007367
      6700776666007D66640081646400866464008A6462008C6462008C6462008C64
      62008C6462008C6462004341410000000000000000004D4A4A006D6767007367
      6700776666007D66640081646400866464008A6462008C6462008C6462008C64
      62008C6462008C6462004341410000000000000000004D4A4A00878484008981
      810090818100987F7F00A0807D00A77E7D00B07B7B00B77B7900BB7B7900BB7B
      7900BB7B79008C6462004341410000000000000000004D4A4A00878484008981
      810090818100987F7F00A0807D00A77E7D00B07B7B00B77B7900BB7B7900BB7B
      7900BB7B79008C6462004341410000000000000000004D4A4A00878484008981
      810090818100987F7F00A0807D00A77E7D00B07B7B00B77B7900BB7B7900BB7B
      7900BB7B79008C6462004341410000000000000000004D4A4A00878484008981
      810090818100987F7F00A0807D00A77E7D00B07B7B00B77B7900BB7B7900BB7B
      7900BB7B79008C6462004341410000000000000000004D4A4A008C8C8C008886
      86008982820090818000E5DFDF00FFFFFF00FFFFFF00FFFFFF00B67B7A00BB7B
      7900BB7B79008C6462004341410000000000000000004D4A4A008C8C8C008886
      860089828200C2BABA00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BB7B
      7900BB7B79008C6462004341410000000000000000004D4A4A008C8C8C008886
      860089828200D4CECD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E4CB
      CB00BB7B79008C6462004341410000000000000000004D4A4A008C8C8C008886
      860089828200F1EFEF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B67B7A00BB7B
      7900BB7B79008C6462004341410000000000000000004D4A4A009A9A9A009090
      900089888800D1CECE00FFFFFF00D6CDCD00B9A2A200FFFFFF00F4EEEE00B57B
      7A00BB7B79008C6462004341410000000000000000004D4A4A009A9A9A009090
      900089888800888181008F818000E5DFDF00FFFFFF00DCCDCC00AD7B7B00B57B
      7A00BB7B79008C6462004341410000000000000000004D4A4A009A9A9A009090
      900089888800D1CECE00FFFFFF00FFFFFF00D9CDCD00A57E7D00AD7B7B00B57B
      7A00BB7B79008C6462004341410000000000000000004D4A4A009A9A9A009090
      900089888800F0EFEF00AFA4A40097808000B9A2A200FFFFFF00FFFFFF00B57B
      7A00BB7B79008C6462004341410000000000000000004D4A4A00ADADAD009D9D
      9D0092919100F0F0F000FFFFFF00AEA4A40096808000F2EFEF00FFFFFF00C3A0
      9F00B47B7A008C6462004341410000000000000000004D4A4A00ADADAD009D9D
      9D00929191008888880087818100E2DFDF00FFFFFF00D9CDCD00A47E7D00AC7B
      7A00B47B7A008C6462004341410000000000000000004D4A4A00ADADAD009D9D
      9D009291910088888800E1DFDF00FFFFFF00FFFFFF00E6DFDF00A47E7D00AC7B
      7A00B47B7A008C6462004341410000000000000000004D4A4A00ADADAD009D9D
      9D009291910088888800878181008E81800096808000F2EFEF00FFFFFF00C3A0
      9F00B47B7A008C6462004341410000000000000000004D4A4A00C1C0C000ABAA
      AA009C9C9C00F1F1F100FFFFFF00A9A4A4008C828100F1EFEF00FFFFFF00BDA3
      A200AB7E7D00876463004341410000000000000000004D4A4A00C1C0C000ABAA
      AA009C9C9C00918F8F0087878700E1DFDF00FFFFFF00D6CDCD009C7F7F00A37F
      7D00AB7E7D00876463004341410000000000000000004D4A4A00C1C0C000ABAA
      AA009C9C9C00918F8F0087878700D0CECE00FFFFFF00FFFFFF00D8CDCD00A37F
      7D00AB7E7D00876463004341410000000000000000004D4A4A00C1C0C000ABAA
      AA009C9C9C00918F8F0087878700878181008C828100FFFFFF00FFFFFF00A37F
      7D00AB7E7D00876463004341410000000000000000004D4A4A00CECECE00B7B6
      B600A5A5A500F2F2F200FFFFFF00A9A9A90087828200F0EFEF00FFFFFF00B6A3
      A300A17F7D00826564004341410000000000000000004D4A4A00CECECE00B7B6
      B600A5A5A5009A99990090909000E1E1E100FFFFFF00D2CECE0092818100997F
      7F00A17F7D00826564004341410000000000000000004D4A4A00CECECE00B7B6
      B600A5A5A5009A9999009090900088888800D0CECE00FFFFFF00F1EFEF00997F
      7F00A17F7D00826564004341410000000000000000004D4A4A00CECECE00B7B6
      B600A5A5A5009A99990090909000FFFFFF00FFFFFF00E2DFDF0092818100997F
      7F00A17F7D00826564004341410000000000000000004D4A4A00D7D5D500C0C0
      C000B1AFAF00F3F3F300FFFFFF00B0B0B00089898900EFEFEF00FFFFFF00B1A4
      A400987F7F007B6664004341410000000000000000004D4A4A00D7D5D500C0C0
      C000B1AFAF00A3A3A30099989800E3E3E300FFFFFF00D0CFCF00898181009281
      8100987F7F007B6664004341410000000000000000004D4A4A00D7D5D500C0C0
      C000B1AFAF00A3A3A300999898009191910089898900FFFFFF00FFFFFF009281
      8100987F7F007B6664004341410000000000000000004D4A4A00D7D5D500C0C0
      C000B1AFAF00A3A3A3009998980091919100AAAAAA00FFFFFF00F0EFEF009281
      8100987F7F007B6664004341410000000000000000004D4A4A00DCDADA00CAC9
      C900BDBDBD00E2E1E100FFFFFF00D9D8D800B3B3B300FFFFFF00F0EFEF008981
      810090818100766666004341410000000000000000004D4A4A00DCDADA00CAC9
      C900BDBDBD00D6D4D400FFFFFF00FFFFFF00FFFFFF00D2D1D100878484008981
      810090818100766666004341410000000000000000004D4A4A00DCDADA00CAC9
      C900BDBDBD00D6D4D400CECECE009D9C9C00B3B3B300FFFFFF00F0EFEF008981
      810090818100766666004341410000000000000000004D4A4A00DCDADA00CAC9
      C900BDBDBD00E2E1E100CECECE009D9C9C00B3B3B300FFFFFF00FFFFFF008981
      810090818100766666004341410000000000000000004D4A4A00E0E0E000D1D0
      D000C5C4C400BFBDBD00ECEBEB00FFFFFF00FFFFFF00FFFFFF008C8C8C008787
      870088818100706766004341410000000000000000004D4A4A00E0E0E000D1D0
      D000C5C4C400BFBDBD00B4B2B200DEDEDE00FFFFFF00D6D6D6008C8C8C008787
      870088818100706766004341410000000000000000004D4A4A00E0E0E000D1D0
      D000C5C4C400DCDBDB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ACACAC008787
      870088818100706766004341410000000000000000004D4A4A00E0E0E000D1D0
      D000C5C4C400E6E5E500FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C0008787
      870088818100706766004341410000000000000000004D4A4A00E1E1E100DEDE
      DE00D8D7D700D3D1D100CACACA00BFBFBF00B4B4B400A4A4A400979797008E8E
      8E00878787006B6767004341410000000000000000004D4A4A00E1E1E100DEDE
      DE00D8D7D700D3D1D100CACACA00BFBFBF00B4B4B400A4A4A400979797008E8E
      8E00878787006B6767004341410000000000000000004D4A4A00E1E1E100DEDE
      DE00D8D7D700D3D1D100CACACA00BFBFBF00B4B4B400A4A4A400979797008E8E
      8E00878787006B6767004341410000000000000000004D4A4A00E1E1E100DEDE
      DE00D8D7D700D3D1D100CACACA00BFBFBF00B4B4B400A4A4A400979797008E8E
      8E00878787006B6767004341410000000000000000004D4A4A00D8D7D700E1E1
      E100E2E2E200E0E0E000DADADA00D0CFCF00C0BFBF00B0ADAD009F9F9F009695
      95008E8E8E006B6B6B004341410000000000000000004D4A4A00D8D7D700E1E1
      E100E2E2E200E0E0E000DADADA00D0CFCF00C0BFBF00B0ADAD009F9F9F009695
      95008E8E8E006B6B6B004341410000000000000000004D4A4A00D8D7D700E1E1
      E100E2E2E200E0E0E000DADADA00D0CFCF00C0BFBF00B0ADAD009F9F9F009695
      95008E8E8E006B6B6B004341410000000000000000004D4A4A00D8D7D700E1E1
      E100E2E2E200E0E0E000DADADA00D0CFCF00C0BFBF00B0ADAD009F9F9F009695
      95008E8E8E006B6B6B00434141000000000000000000000000005B5A5A006A69
      69006C6B6B006C6B6B0068676700636262005B5A5A00535353004F4E4E004E4D
      4D004D4C4C004D4C4C00000000000000000000000000000000005B5A5A006A69
      69006C6B6B006C6B6B0068676700636262005B5A5A00535353004F4E4E004E4D
      4D004D4C4C004D4C4C00000000000000000000000000000000005B5A5A006A69
      69006C6B6B006C6B6B0068676700636262005B5A5A00535353004F4E4E004E4D
      4D004D4C4C004D4C4C00000000000000000000000000000000005B5A5A006A69
      69006C6B6B006C6B6B0068676700636262005B5A5A00535353004F4E4E004E4D
      4D004D4C4C004D4C4C0000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000CA680000CA68
      0000CA680000CA680000CA680000CA680000CA680000CA680000CA680000CA68
      0000CA680000CA680000000000000000000000000000000000000C4898000C48
      98000C4898000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000C48
      9800000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CA680000CA68
      0000CA680000CA680000CA680000CA680000CA680000CA680000CA680000CA68
      0000CA680000CA680000000000000000000000000000CA680000FFE9CF00FFE5
      C900FEE2C100FEDEBC00FEDAB500FED9B000FED5AA00FFD3A500FED0A000FECF
      9D00FECC9900FECB9600CA6800000000000000000000000000000C4898001F81
      FF000C4898000000000000000000000000000969100009691000096910000969
      10000969100009691000096910000969100000000000000000000C4898001F81
      FF000C4898000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CA680000FFF4E700FFE7
      CF00FFE5C900FFE2C200FFE0BD00FFDDB600FFDAB100FFD7AD00FFD5A900FFD4
      A5000527FF00FFD9B100CA6800000000000000000000CA680000FFEBD700FEE7
      CF00FFE5C900FEE2C200FEDEBB00FEDCB500FED9B000FED5AB00FED3A500FED0
      A000FECF9D00FECC9800CA6800000000000000000000000000000C4898001F81
      FF000C4898000000000000000000000000000969100009691000096910000969
      100009691000096910000969100009691000000000000C4898002284FF002082
      FF001F81FF000C48980000000000000000000969100009691000000000000000
      00000000000000000000000000000000000000000000CA680000FFEEDE003F3F
      3F003F3F3F00FEDDBA003F3F3F003F3F3F003F3F3F003F3F3F00FFD0A0000527
      FF000527FF000527FF00CA6800000000000000000000CA680000FFEEDC00FEEB
      D700FEE7CF00FEE5C900FEE2C100FFDEBB00FEDCB600FED9B000FED5AB00FED3
      A500FED1A000FECE9C00CA6800000000000000000000000000000C4898001F81
      FF000C4898000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000C4898000C4898000C489800288B
      FF000C4898000C4898000C489800000000000969100009691000000000000000
      00000000000000000000000000000000000000000000CA680000FFF2E5003F3F
      3F00FFE3C600FEE0C000FEDDBA00FEDAB400FED8AF00FED5A900FFD3A400FED0
      A0000527FF00FFD4A600CA6800000000000000000000CA680000FEF2E300BC4B
      0000BC4B0000BC4B0000BC4B0000FEE2C100FEDEBC0000008200000082000000
      8200FED3A500FED0A000CA6800000000000000000000000000000C4898001F81
      FF000C4898000000000000000000000000000969100009691000096910000969
      10000969100009691000000000000000000000000000000000000C4898003598
      FF000C4898000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CA680000FFF6EB00FEEA
      D100FEE6CB00D1987400983D1600A0472000C1784E0090310C00E3AB7E00FED3
      A500FED0A100FFD7AA00CA6800000000000000000000CA680000FFF4E900BC4B
      0000FEEFDD00FEEBD700FFE7CF00BC4B0000FEE2C20000008200FFDCB600FED9
      AF0000008200FED3A500CA6800000000000000000000000000000C4898001F81
      FF000C4898000000000000000000000000000969100009691000096910000969
      10000969100009691000000000000000000000000000000000000C48980044A6
      FF000C4898000000000000000000000000000969100009691000096910000969
      10000000000000000000000000000000000000000000CA680000FFFAF2003F3F
      3F00FFE9D100A0492300DAA68300FFE1C000C1795000A0471F00FED8B000FED5
      AA003F3F3F00FFD8AD00CA6800000000000000000000CA680000FFF7EE00BC4B
      0000FEF2E200FFEFDD00FFEBD700BC4B0000FFE5C90000008200FEDEBB00FEDC
      B60000008200FED5AA00CA6800000000000000000000000000000C4898002386
      FF000C4898000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000C48980055B6
      FF000C4898000000000000000000000000000969100009691000096910000969
      10000000000000000000000000000000000000000000CA680000FFFCF8003F3F
      3F00FEEDD900D39C7A0091330E00C17D5600C17B5300A0472000FEDCB500FED9
      AF003F3F3F00FFDAB400CA6800000000000000000000CA680000FFFAF400BC4B
      0000BC4B0000BC4B0000BC4B0000BC4B0000FFE9CF0000008200FFE1C100FEDE
      BC0000008200FED8AF00CA6800000000000000000000000000000C4898002D91
      FF000C4898000000000000000000000000000969100009691000096910000969
      10000000000000000000000000000000000000000000000000000C48980066C7
      FF000C4898000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CA680000FFFFFE003F3F
      3F00FFEFE000EDCCB400E5BA9E00DAA98800C17D5600A0482100FFDEBB00FEDC
      B5003F3F3F00FFDDBA00CA6800000000000000000000CA680000FFFBF800BC4B
      0000FFF7EF00FFF4E700FEF0E200BC4B0000FFEBD70000008200000082000000
      8200FEDEBC00FEDCB600CA6800000000000000000000000000000C4898003B9E
      FF000C4898000000000000000000000000000969100009691000096910000969
      10000000000000000000000000000000000000000000000000000C48980078D7
      FF000C4898000000000000000000000000000969100009691000096910000969
      10000969100009691000000000000000000000000000CA680000FFFFFF003F3F
      3F00FFF3E500E5BFA600A04B2600DCAB8C00B8704A00B0633B00FFE2C200FEDE
      BB003F3F3F00FFE0C000CA6800000000000000000000CA680000FFFCFB00BC4B
      0000FFFAF300FFF6EE00FEF3E900BC4B0000FFEFDD0000008200FEE7D000FEE5
      C900FFE1C200FFDEBB00CA6800000000000000000000000000000C4898004BAF
      FF000C4898000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000C48980088E3
      FF000C4898000000000000000000000000000969100009691000096910000969
      10000969100009691000000000000000000000000000CA680000FFFFFF00FFF8
      F000FFF4EB00FFF2E500DAB09300C1815E00CA8E6B00FEE7CE00FFE5C700FEE1
      C200FFDEBB00FFE3C500CA6800000000000000000000CA680000FFFFFF00BC4B
      0000BC4B0000BC4B0000BC4B0000FFF4E900FFF2E20000008200FFEAD700FEE9
      D000FEE5C900FEE1C200CA680000000000000C4898000C4898000C4898005EBF
      FF000C4898000C4898000C489800000000000969100009691000000000000000
      00000000000000000000000000000000000000000000000000000C48980093EF
      FF000C4898000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CA680000FFFFFF003F3F
      3F00FFF7F000FFF4EB00FEF3E600FEF0E000FFEEDA00FFEAD500FEE7CE00FEE5
      C7003F3F3F00FFE6CB00CA6800000000000000000000CA680000FFFFFF00FFFF
      FF00FFFEFB00FFFBF800FEFAF300FEF7EE00FEF4E700FEF2E200FFEEDD00FFEB
      D500FEE9CF00FFE5C900CA68000000000000000000000C4898007FDCFF0070D0
      FF0063C2FF000C48980000000000000000000969100009691000000000000000
      00000000000000000000000000000000000000000000000000000C48980096F0
      FF000C4898000000000000000000000000000969100009691000096910000969
      10000969100009691000096910000969100000000000CA680000FFFFFF003F3F
      3F003F3F3F00FFF8F0003F3F3F003F3F3F003F3F3F003F3F3F00FEEBD4003F3F
      3F003F3F3F00FFEAD300CA6800000000000000000000CA680000FFFFFF00FFFF
      FF00FFFFFF00FFFCFC00FFFCF700FFFAF300FFF7EE00FFF4E900FFF2E200FFEF
      DD00FFEBD500FEE9CF00CA6800000000000000000000000000000C48980081E0
      FF000C4898000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000C48980096F0
      FF000C4898000000000000000000000000000969100009691000096910000969
      10000969100009691000096910000969100000000000CA680000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFB00FFFBF400FFF7EF00FFF4
      E700FFF0E100FFF7EE00CA680000000000000000000000000000CA680000CA68
      0000CA680000CA680000CA680000CA680000CA680000CA680000CA680000CA68
      0000CA680000CA68000000000000000000000000000000000000000000000C48
      9800000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000C4898000C48
      98000C4898000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CA680000CA68
      0000CA680000CA680000CA680000CA680000CA680000CA680000CA680000CA68
      0000CA680000CA68000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000808080008080800080808000808080008080
      8000808080008080800080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C00080808000000000000000000000000000025604000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000969100009691000096910000969
      1000096910000969100009691000096910000969100009691000096910000969
      1000000000000000000000000000000000000969100009691000096910000969
      1000096910000969100009691000096910000969100009691000096910000969
      1000000000000000000000000000000000000000000000000000000000008080
      80008080800080808000FFFFFF00C0C0C000C0C0C00000000000000000000000
      0000C0C0C000C0C0C00080808000000000000000000002560400025604000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000969100009691000096910000969
      1000096910000969100009691000096910000969100009691000096910000969
      1000000000000000000000000000000000000969100009691000096910000969
      1000096910000969100009691000096910000969100009691000096910000969
      100000000000000000000000000000000000000000000000000000000000FFFF
      FF00C0C0C000C0C0C000FFFFFF00C0C0C00000000000C0C0C000C0C0C000C0C0
      C00000000000C0C0C00080808000000000000000000002590500025905000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000808080008080800080808000FFFF
      FF00C0C0C00000000000FFFFFF00C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C00000000000C0C0C00080808000000000000000000004620800096F11000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000C48
      9800000000000000000000000000004B0000004B0000004B0000004B0000004B
      0000004B000000000000000000000000000000000000000000000C4898000000
      0000000000000000000000000000004B0000004B0000004B0000004B0000004B
      0000004B0000000000000000000000000000FFFFFF00C0C0C000C0C0C000FFFF
      FF00C0C0C00000000000FFFFFF00C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C00000000000C0C0C00080808000000000000000000006680D0018932D000256
      0400000000000000000000000000000000000000000002560400000000000000
      00000000000000000000000000000000000000000000000000000C4898000C48
      9800000000000000000000000000004B000026AD440018992D000D8A1900057D
      0C00004B000000000000000000000000000000000000000000000C4898000C48
      9800000000000000000000000000004B000026AD440018992D000D8A1900057D
      0C00004B0000000000000000000000000000FFFFFF00C0C0C00000000000FFFF
      FF00C0C0C000C0C0C000FFFFFF00C0C0C000C0C0C000C0C0C000000000000000
      0000C0C0C000C0C0C00080808000000000000000000006680D002CB84F00096F
      1100000000000000000000000000000000000000000002560400025604000000
      000000000000000000000000000000000000000000000C48980041B1FE002F91
      E9000C4898000C48980000000000004B0000004B0000004B0000004B0000004B
      0000004B00000000000000000000000000000C4898000C489800258AE9002890
      FE000C4898000000000000000000004B0000004B0000004B0000004B0000004B
      0000004B0000000000000000000000000000FFFFFF00C0C0C000C0C0C000FFFF
      FF00C0C0C000C0C0C000FFFFFF00C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C00000000000C0C0C000808080000000000000000000025905002BB44C0024AA
      4200025604000000000000000000000000000000000002560400078110000256
      0400000000000000000000000000000000000C489800ACDAF60062C9FF003FB4
      FF003CB0FF000C48980000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000C48980096F0FF0063C5FF003BA4
      FF00207FED000C48980000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00C0C0C000C0C0C000FFFF
      FF00C0C0C000C0C0C000FFFFFF00C0C0C00000000000C0C0C000C0C0C000C0C0
      C00000000000C0C0C00080808000000000000000000000000000168A280042E2
      76001C9C3300025604000256040002560400025604000256040009981300047D
      0B0002560400000000000000000000000000000000000C489800B1DEF800398A
      D0000C4898000C48980000000000004B0000004B0000004B0000004B0000004B
      0000004B0000004B0000004B0000004B00000C4898000C489800609CD00057AD
      F2000C4898000000000000000000004B0000004B0000004B0000004B0000004B
      0000004B0000004B0000004B0000004B0000FFFFFF00C0C0C000C0C0C000FFFF
      FF00C0C0C000C0C0C000FFFFFF00C0C0C000C0C0C00000000000000000000000
      0000C0C0C000C0C0C00080808000000000000000000000000000025604002BB4
      4C003FE06F002BB44C0016982A0013982500169C28000E911C0009981300058F
      0E00047D0B0002560400000000000000000000000000000000000C4898000C48
      9800000000000000000000000000004B00002CB44E0029AF480025AA42001EA1
      3600169728000F8E1C0009881300015A030000000000000000000C4898000C48
      9800000000000000000000000000004B00002CB44E0029AF480025AA42001EA1
      3600169728000F8E1C0009881300015A0300FFFFFF00C0C0C000C0C0C000FFFF
      FF00C0C0C000C0C0C000FFFFFF00C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C00080808000000000000000000000000000000000000256
      040024AA420036D362002ECC540024BD42001BAF320013A325000C981800058F
      0E0006920E000781100002560400000000000000000000000000000000000C48
      9800000000000000000000000000004B0000004B0000004B0000004B0000004B
      0000004B0000004B0000004B0000004B000000000000000000000C4898000000
      0000000000000000000000000000004B0000004B0000004B0000004B0000004B
      0000004B0000004B0000004B0000004B0000FFFFFF00C0C0C00000000000FFFF
      FF00C0C0C000C0C0C000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0080808000000000000000000000000000000000000000
      000002560400096F11001FA5390023B43F001BAF320018AA2D000C9818000998
      13000A7F14000256040000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00C0C0C000C0C0C000FFFF
      FF00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0008080
      8000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000259050002590500046208000256040018AA2D00096F
      1100025604000000000000000000000000000969100009691000096910000969
      1000096910000969100009691000096910000969100009691000096910000969
      1000000000000000000000000000000000000969100009691000096910000969
      1000096910000969100009691000096910000969100009691000096910000969
      100000000000000000000000000000000000FFFFFF00C0C0C000C0C0C000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000002560400096F11000259
      0500000000000000000000000000000000000969100009691000096910000969
      1000096910000969100009691000096910000969100009691000096910000969
      1000000000000000000000000000000000000969100009691000096910000969
      1000096910000969100009691000096910000969100009691000096910000969
      100000000000000000000000000000000000FFFFFF00C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C0008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000002560400025604000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000002560400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BD4C00000000
      0000000000000000000084240500842405008424050084240500842405000000
      0000000000000000000000000000000000000000000000000000BD4C00000000
      0000000000000000000084240500842405008424050084240500842405000000
      0000000000000000000000000000000000000000000066666600666666006666
      6600666666006666660066666600666666006666660066666600666666006666
      6600666666006666660066666600000000000000000066666600666666006666
      6600666666006666660066666600666666006666660066666600666666006666
      6600666666006666660066666600000000000000000000000000BD4C0000BD4C
      0000BD4C0000C24F000084240500FFC17900E58E4000D36E1A00842405000000
      0000000000000000000000000000000000000000000000000000BD4C0000BD4C
      0000BD4C0000C24F000084240500FFC17900E58E4000D36E1A00842405000000
      00000000000000000000000000000000000066666600FFFFFF009CECFF009CEC
      FF009CECFF009CECFF009CECFF009CECFF009CECFF009CECFF009CECFF009CEC
      FF009CECFF009CECFF009CECFF0066666600666666009CECFF009CECFF009CEC
      FF009CECFF009CECFF009CECFF009CECFF009CECFF009CECFF009CECFF009CEC
      FF009CECFF009CECFF00FFFFFF00666666000000000000000000BD4C00000000
      0000000000000000000083230400842405008423050083230400842405000000
      0000000000000000000000000000000000000000000000000000BD4C00000000
      0000000000000000000083230400842405008423050083230400842405000000
      00000000000000000000000000000000000066666600FFFFFF00C3FAFF00C3FA
      FF00C3FAFF00C3FAFF00C3FAFF0001550300C3FAFF00C3FAFF00C3FAFF00C3FA
      FF00C3FAFF00C3FAFF009CECFF0066666600666666009CECFF00C3FAFF00C3FA
      FF00C3FAFF00C3FAFF00C3FAFF00C3FAFF0001550300C3FAFF00C3FAFF00C3FA
      FF00C3FAFF00C3FAFF00FFFFFF00666666000000000000000000BD4C00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BD4C00000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000066666600FFFFFF00C3FAFF00C3FA
      FF00C3FAFF00C3FAFF00015503000C881600C3FAFF00C3FAFF00C3FAFF00C3FA
      FF00C3FAFF00C3FAFF009CECFF0066666600666666009CECFF00C3FAFF00C3FA
      FF00C3FAFF00C3FAFF00C3FAFF00C3FAFF000C88160001550300C3FAFF00C3FA
      FF00C3FAFF00C3FAFF00FFFFFF00666666000000000000000000BD4C00000000
      0000000000000000000084240500842405008424050084240500842405000000
      0000000000000000000000000000000000000000000000000000BD4C00000000
      0000000000000000000084240500842405008424050084240500842405000000
      00000000000000000000000000000000000066666600FFFFFF00C3FAFF00C3FA
      FF00C3FAFF000155030022B63E00149A2600015503000155030001550300C3FA
      FF00C3FAFF00C3FAFF009CECFF0066666600666666009CECFF00C3FAFF00C3FA
      FF00C3FAFF00015503000155030001550300149A260022B63E0001550300C3FA
      FF00C3FAFF00C3FAFF00FFFFFF00666666000000000000000000BD4C0000BD4C
      0000BD4C0000BD4C000084240500FFC17900E58E4000D36E1A00842405000000
      0000000000000000000000000000000000000000000000000000BD4C0000BD4C
      0000BD4C0000BD4C000084240500FFC17900E58E4000D36E1A00842405000000
      00000000000000000000000000000000000066666600FFFFFF00C3FAFF00C3FA
      FF00015503002CC5580041E0750027BB450015A528000996130001550300C3FA
      FF00C3FAFF00C3FAFF009CECFF0066666600666666009CECFF00C3FAFF00C3FA
      FF00C3FAFF00015503000996130015A5280027BB450041E075002CC558000155
      0300C3FAFF00C3FAFF00FFFFFF00666666000000000000000000BD4C00000000
      0000000000000000000083230400842405008423050083230400842405000000
      0000000000000000000000000000000000000000000000000000BD4C00000000
      0000000000000000000083230400842405008423050083230400842405000000
      00000000000000000000000000000000000066666600FFFFFF00C3FAFF00C3FA
      FF00C3FAFF000155030030BD57001A922F00015503000360070001550300C3FA
      FF00C3FAFF00C3FAFF009CECFF0066666600666666009CECFF00C3FAFF00C3FA
      FF00C3FAFF000155030003600700015503001A922F0030BD570001550300C3FA
      FF00C3FAFF00C3FAFF00FFFFFF00666666000000000000000000BD4C00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BD4C00000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000066666600FFFFFF00C3FAFF00C3FA
      FF00C3FAFF00C3FAFF0001550300067F1400C3FAFF00C3FAFF00C3FAFF00C3FA
      FF00C3FAFF00C3FAFF009CECFF0066666600666666009CECFF00C3FAFF00C3FA
      FF00C3FAFF00C3FAFF00C3FAFF00C3FAFF00067F140001550300C3FAFF00C3FA
      FF00C3FAFF00C3FAFF00FFFFFF00666666000000000000000000BD4C00000000
      0000000000000000000084240500842405008424050084240500842405000000
      0000000000000000000000000000000000000000000000000000BD4C00000000
      0000000000000000000084240500842405008424050084240500842405000000
      00000000000000000000000000000000000066666600FFFFFF00C3FAFF00C3FA
      FF00C3FAFF00C3FAFF00C3FAFF0001550300C3FAFF00C3FAFF00C3FAFF00C3FA
      FF00C3FAFF00C3FAFF009CECFF0066666600666666009CECFF00C3FAFF00C3FA
      FF00C3FAFF00C3FAFF00C3FAFF00C3FAFF0001550300C3FAFF00C3FAFF00C3FA
      FF00C3FAFF00C3FAFF00FFFFFF00666666000000000000000000BD4C0000BD4C
      0000BD4C0000BD4C000084240500FFC17900E58E4000D36E1A00842405000000
      0000000000000000000000000000000000000000000000000000BD4C0000BD4C
      0000BD4C0000BD4C000084240500FFC17900E58E4000D36E1A00842405000000
      00000000000000000000000000000000000066666600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C3FAFF00C3FAFF00C3FAFF00C3FAFF00C3FA
      FF00C3FAFF00C3FAFF009CECFF0066666600666666009CECFF00C3FAFF00C3FA
      FF00C3FAFF00C3FAFF00C3FAFF00C3FAFF00C3FAFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00666666000000000000000000BD4C00000000
      0000000000000000000083230400842405008423050083230400842405000000
      000018640C001C620C0000000000000000000000000000000000BD4C00000000
      0000000000000000000083230400842405008423050083230400842405000000
      00000000000000000000000000000000000066666600FFFFFF00666666006666
      6600666666006666660066666600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF006666660066666600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0066666600666666006666
      66006666660066666600FFFFFF00666666008424050084240500842405008424
      0500842405000000000000000000000000000000000000000000000000000000
      00001C650D001C660E0000000000000000008424050084240500842405008424
      0500842405000000000000000000000000000000000000000000000000000000
      B5000000B500000000000000B5000000B5006666660066666600669999006699
      9900669999006699990066999900666666006666660066666600666666006666
      6600666666006666660066666600666666006666660066666600666666006666
      6600666666006666660066666600666666006666660066999900669999006699
      99006699990066999900666666006666660084240500FFC17900E58E4000D36E
      1A008424050000000000000000000000000000000000000000001B670F001874
      160018781800187617001A6D12001C650D0084240500FFC17900E58E4000D36E
      1A00842405000000000000000000000000000000000000000000000000000000
      B5000000B5000000B5000000B5000000B500666666006699990099CCCC0099CC
      CC0099CCCC0099CCCC0099CCCC00669999006666660099CCCC0099CCCC0099CC
      CC0099CCCC0099CCCC0099CCCC00666666006666660099CCCC0099CCCC0099CC
      CC0099CCCC0099CCCC0099CCCC00666666006699990099CCCC0099CCCC0099CC
      CC0099CCCC0099CCCC0066999900666666008323040084240500842305008323
      04008424050000000000000000000000000000000000000000001B670F001973
      1600187E1C00187B1B001A6C11001C650D008323040084240500842305008323
      0400842405000000000000000000000000000000000000000000000000000000
      00000000B5000000B5000000B500000000006666660099FFFF0033CCFF0033CC
      FF0033CCFF0033CCFF0033CCFF0033CCFF0066666600CCFFFF00CCFFFF00CCFF
      FF00CCFFFF00CCFFFF00CCFFFF006666660066666600CCFFFF00CCFFFF00CCFF
      FF00CCFFFF00CCFFFF00CCFFFF006666660033CCFF0033CCFF0033CCFF0033CC
      FF0033CCFF0033CCFF0099FFFF00666666000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000187919001879190000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      B5000000B5000000B5000000B5000000B500000000006666660099FFFF0099FF
      FF0099FFFF0099FFFF0033CCFF00666666000000000066666600CCFFFF00CCFF
      FF00CCFFFF00CCFFFF0066666600000000000000000066666600CCFFFF00CCFF
      FF00CCFFFF00CCFFFF0066666600000000006666660033CCFF0099FFFF0099FF
      FF0099FFFF0099FFFF0066666600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001B6910001B69100000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      B5000000B500000000000000B5000000B5000000000099999900666666006666
      6600666666006666660066666600999999000000000099999900666666006666
      6600666666006666660099999900000000000000000099999900666666006666
      6600666666006666660099999900000000009999990066666600666666006666
      6600666666006666660099999900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000A3666800A3666800A3666800A3666800A467
      6900A4676900A4676900A4676900A46769000000000000000000D6820000D682
      0000D6820000D6820000D6820000D6820000D6820000D6820000D6820000D682
      0000D6820000D682000000000000000000000000000000000000000000000000
      0000000000000000000000000000993300009933000000000000993300009933
      0000000000000000000000000000000000000000000000000000D6820000D682
      0000D6820000D6820000D6820000D6820000D6820000D6820000D6820000D682
      0000D6820000D682000000000000000000000000000000000000000000000000
      00000000000000000000000000009F646600F7E5C600F2D9B100EED1A100EECC
      9300F0C78700EFC58000F7D08300A467690000000000D6820000FFEEDA00FFEB
      D500FEE9CF00FEE6CB00FEE3C500FEE2C100FEDFBC00FFDDB800FEDBB400FEDA
      B100FED8AE00FED7AB00D6820000000000000000000000000000000000000000
      0000000000000000000000000000993300009933000000000000993300009933
      00000000000000000000000000000000000000000000D6820000FFEEDA00FFEB
      D500FEE9CF00FEE6CB00FEE3C500FEE2C100FEDFBC00FFDDB800FEDBB400FEDA
      B100FED8AE00FED7AB00D6820000000000000000000000000000000000000000
      00000000000000000000000000008E595B00D8CAB700D3C0A700D1B89A00DCBD
      9700E6C29200E7BF8400F0C68100A467690000000000D6820000FFF0E000FEED
      DA00FFEBD500FEE9D000FEE6CA00FEE4C500FEE2C100FEDFBD00FEDDB800FEDB
      B400FEDAB100FED8AD00D6820000000000000000000000000000000000000000
      0000000000000000000000000000993300009933000000000000993300009933
      00000000000000000000000000000000000000000000D6820000FFF0E000FEED
      DA00FFEBD500FEE9D000FEE6CA00FEE4C500FEE2C100FEDFBD00FEDDB800FEDB
      B400FEDAB100FED8AD00D6820000000000000000000000000000000000000000
      000000000000000000000000000076575100A19C93009E928400A0917F00C0A9
      8C00DABC9500E6C19000F0C98700A467690000000000D6820000FFF2E4000099
      0000009900000099000000990000009900000099000000990000009900000099
      000000990000FED9B000D6820000000000000000000000000000000000000000
      0000000000000000000000000000993300009933000000000000993300009933
      00000000000000000000000000000000000000000000D6820000FFF2E4000099
      0000009900000099000000990000FFE6CA00FEE4C60000990000009900000099
      000000990000FED9B000D6820000000000000000000000000000000000000000
      00000000000000000000005CFF0056413B006B696800005CFF00736A5F009688
      7600C0A98C00DDBD9600EECC9300A467690000000000D6820000FEF5EA00FEF2
      E500FEF0DF00FFEEDA00FFEBD500FEE9CF00FEE6CB00FEE3C600FEE1C000FEDF
      BC00FEDDB800FEDBB400D6820000000000000000000000000000000000000000
      0000000000000000000000000000993300009933000000000000993300009933
      00000000000000000000000000000000000000000000D6820000FEF5EA00FEF2
      E500FEF0DF00FFEEDA00FFEBD500FEE9CF00FEE6CB00FEE3C600FEE1C000FEDF
      BC00FEDDB800FEDBB400D682000000000000A5686A00A6696A00A4686900A066
      67008F5B5B006D454500005CFF00005CFF00005CFF00005CFF005B5652007269
      5F00A0927F00D1B69800F2D3A300A366680000000000D6820000FFF7EE000099
      0000009900000099000000990000009900000099000000990000009900000099
      000000990000FEDDB800D6820000000000000000000000000000000000000000
      000000000000993303009A340200993300009832000000000000993300009933
      00000000000000000000000000000000000000000000D6820000FFF7EE000099
      0000009900000099000000990000FEEBD500FEE9D00000990000009900000099
      000000990000FEDDB800D682000000000000A4676900FCE6C100EECFA600E7C5
      9600005CFF00005CFF00005CFF00005CFF00005CFF00005CFF00005CFF00005C
      FF009F928400DAC9AD00EAD8B200A366680000000000D6820000FFF9F200FFF7
      EE00FEF5E900FFF3E500FFF0E000FFEEDB00FFEBD500FFE8D000FEE6CA00FEE4
      C600FFE1C000FEDFBC00D6820000000000000000000000000000000000009F3A
      0700A8430700BA570700C561040099330000952F000000000000993300009933
      00000000000000000000000000000000000000000000D6820000FFF9F200FFF7
      EE00FEF5E900FFF3E500FFF0E000FFEEDB00FFEBD500FFE8D000FEE6CA00FEE4
      C600FFE1C000FEDFBC00D682000000000000A5686A00FEEED300F0D5B500EACB
      A300CEAD8300005CFF00005CFF005541330077777700005CFF00005CFF006B69
      6700A19990008C5B51009D665B00A366680000000000D6820000FFFBF7000099
      0000009900000099000000990000009900000099000000990000009900000099
      000000990000FEE1C000D682000000000000000000000000000000000000B14F
      0C00D7791600DB7A1100DB790C0099330000942D000000000000993300009933
      00000000000000000000000000000000000000000000D6820000FFFBF7000099
      0000009900000099000000990000FEF0E000FFEEDA0000990000009900000099
      000000990000FEE1C000D682000000000000A7756B00FFF7E300F3DDC400EAD1
      B100D0B59100005CFF00005CFF005441320060606000005CFF00005CFF007676
      7600A4A19F008C5B5100DA904400BD72470000000000D6820000FFFCFA00FFFB
      F600FFF9F300FFF7ED00FEF4E900FFF2E400FFF0E000FEEEDB00FEEBD500FEE8
      CF00FEE6CB00FEE4C600D6820000000000000000000000000000A13A0400D277
      1D00E8902600DD811D00E184190099330000932C000000000000993300009933
      00000000000000000000000000000000000000000000D6820000FFFCFA00FFFB
      F600FFF9F300FFF7ED00FEF4E900FFF2E400FFF0E000FEEEDB00FEEBD500FEE8
      CF00FEE6CB00FEE4C600D682000000000000A7756B00FFFEF700F7E7D400EFD9
      C100005CFF00005CFF00005CFF00005CFF00005CFF00005CFF00005CFF00005C
      FF00C0BABA0095605600C58460000000000000000000D6820000FFFDFC000099
      0000009900000099000000990000009900000099000000990000009900000099
      000000990000FFE6CA00D6820000000000000000000000000000A53F0700E18A
      2C00EE983100E58C2900E990260099330000932B000000000000993300009933
      00000000000000000000000000000000000000000000D6820000FFFDFC000099
      0000009900000099000000990000FFF5E900FFF3E50000990000009900000099
      000000990000FFE6CA00D682000000000000BC826800FFFFFF00FBEFE500F6E5
      D300EED9C000DDC4A600005CFF00005CFF00005CFF00005CFF00D1926D00D192
      6D00D1926D009D665B00000000000000000000000000D6820000FFFFFF00FFFE
      FD00FFFDF900FFFBF600FFF9F200FFF7EE00FFF5E900FFF3E500FFEFE000FEEE
      DB00FEEBD500FEE8D000D6820000000000000000000000000000A33E0700E18D
      3300F9A94000EC983400F19D330099330000922A000000000000993300009933
      00000000000000000000000000000000000000000000D6820000FFFFFF00FFFE
      FD00FFFDF900FFFBF600FFF9F200FFF7EE00FFF5E900FFF3E500FFEFE000FEEE
      DB00FEEBD500FEE8D000D682000000000000BC826800FFFFFF00FFFBF700FAF0
      E500F6E5D100EFD9C000005CFF00CFB692008C585A00005CFF00000000000000
      00000000000000000000000000000000000000000000D6820000FFFFFF000099
      0000009900000099000000990000009900000099000000990000009900000099
      000000990000FFEBD500D682000000000000000000000000000000000000C66B
      2200FEB34C00FBAE4700FCAF4300993300009029000000000000993300009933
      00000000000000000000000000000000000000000000D6820000FFFFFF000099
      0000009900000099000000990000FEF9F200FEF7ED0000990000009900000099
      000000990000FFEBD500D682000000000000D1926D00FFFFFF00FFFFFF00FEFB
      F700FBEFE500F7E5D100A1695D00A0685C009E63650000000000000000000000
      00000000000000000000000000000000000000000000D6820000FFFFFF00FFFF
      FF00FFFFFF00FFFDFD00FFFDF900FFFBF600FFF9F200FFF7EE00FFF5E900FFF3
      E500FFF0DF00FEEEDA00D6820000000000000000000000000000000000009933
      0000C2682100E99A3F00F4AE4900993300009933000099330000993300009933
      00009933000099330000000000000000000000000000D6820000FFFFFF00FFFF
      FF00FFFFFF00FFFDFD00FFFDF900FFFBF600FFF9F200FFF7EE00FFF5E900FFF3
      E500FFF0DF00FEEEDA00D682000000000000DA9D7500FFFFFF00FFFFFF00FFFF
      FF00FFFEFC00E5D3CC00A56B5F00CF834300AF6A540000000000000000000000
      0000000000000000000000000000000000000000000000000000D6820000D682
      0000D6820000D6820000D6820000D6820000D6820000D6820000D6820000D682
      0000D6820000D682000000000000000000000000000000000000000000000000
      0000000000009933000099330000993300009933000099330000993300009933
      0000993300009933000000000000000000000000000000000000D6820000D682
      0000D6820000D6820000D6820000D6820000D6820000D6820000D6820000D682
      0000D6820000D68200000000000000000000E7AB7900FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00E1D5D900A56B5F00D48E5A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7AB7900D1926D00D1926D00D192
      6D00D1926D00D1926D00A56B5F00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000006F6F6F00FFFF
      FF00FBFBFB00FBFBFB00FBFBFB00B9B9B9005353530000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000DFBCAD00CCB6AD00C4ABA200D5B2A400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008F8E8D009D9C9B009D9C9B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000005353
      5300FFFFFF00EAEAEA00EAEAEA00EAEAEA00B9B9B90053535300535353005353
      5300535353000000000000000000000000000000000000000000000000000000
      000000000000E1BCAC00D9CDCA00C7CACE00B2B0B400B3A39D00E1BCAC000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000918F8F00BDBCBC00EBEBEB00D2D2D1009D9C9B009D9C9B009D9C9B000000
      00000000000000000000000000000000000000000000811E0000811E00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000053535300FFFFFF00EAEAEA0053535300EAEAEA00B9B9B900B9B9B900B9B9
      B900B9B9B9005353530000000000000000000000000000000000000000000000
      0000E1C0AF00E8DCD900E3E5E800D0A79600C49B8A00B4AFB100B4A49F00D4B2
      A300000000000000000000000000000000000000000000000000000000009796
      9500C4C4C400FFFFFF00FAFAFA00EDEDED00F2EDEA008DB2C500116895003F73
      8E007F8B8F009D9C9B000000000000000000000000000000000000000000811E
      0000000000000969100009691000096910000969100009691000096910000969
      1000096910000969100009691000000000000000000000000000000000000000
      00000000000053535300FFFFFF00DADADA00DADADA00DADADA00DADADA00FFFF
      FF00FFFFFF00DADADA005353530000000000000000000000000000000000E1BC
      AC00EFE6E200F5FEFF00D3957800BA3C0800BC3D0A00C27F6300B6B3B600B2A1
      9E00E1BCAC00000000000000000000000000000000000000000099989700D1D0
      D000FFFFFF00FFFFFF00FBFBFB00F0F0F000F7F1EE0091B6C900006298000060
      980088ADBE00C7C3C1009D9C9B00797978000000000000000000811E00000000
      0000000000000969100009691000096910000969100009691000096910000969
      1000096910000969100009691000000000000000000000000000000000000000
      000000000000000000006F6F6F00FFFFFF00DADADA00DADADA00B9B9B9005353
      530053535300FFFFFF0053535300000000000000000000000000E1BCAC00F3E8
      E200FEFFFF00D99E8400C55C2E00E5B39A00E5B29900C85D2E00C1795A00B5B2
      B600B2A29E00D3B1A2000000000000000000000000009D9C9B00E0E0E000FFFF
      FF00FFFFFF00FFFFFF00FDFDFD00F6F6F600FDF7F40096BBCE00006398000061
      970091B2C200DBD8D600C3C3C3007777760000000000811E0000811E0000811E
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000006F6F6F00FFFFFF00DADADA00B9B9B900535353000000
      0000C9C9C90053535300535353000000000000000000E1BCAC00F5E9E500FFFF
      FF00DFA58B00BA421000BF502000F8EBE400F7E8E000BF502000BE461300C27C
      5E00B6B2B500B2A19E00E1BCAC0000000000000000009D9C9B00FDFDFD00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FCFCFC00FFFEFB009ABFD200006398000060
      970095B6C700DEDBDA00C4C4C300777776000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E3E3E3005F5F5F00E3E3
      E30000000000000000006F6F6F00FFFFFF00DADADA0053535300000000000000
      000000000000000000005353530000000000E1BCAB00F5E8E300FFFFFF00E8B9
      9F00C4552000C14F1F00C0501F00F5E1D800F4DED400BF4C1D00BE4A1B00BF46
      1300C1795A00B4ADB000AE9F9C00D4B2A200000000009D9C9B00FFFEFE00FFFF
      FF00B3C2CC00819CAE00D2DBE000FFFFFF00FFFFFF0097BFD30000599200005A
      920097BACA00E5E2E100C8C8C9007A78760000000000811E0000811E0000811E
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E3E3E3005F5F5F005F5F5F005F5F
      5F00E3E3E300000000006F6F6F00FFFFFF00DADADA0053535300000000000000
      000000000000000000000000000000000000E7C9BC00FFFFFF00F6E2D200D378
      3E00CE6F3800CA653000C65C2A00F6E4DA00F4DFD500BF4D1E00BE4B1C00BF4E
      1E00BF441200C4978400B3B2B500C2AAA200000000009D9C9B00EBEDEE006A8C
      A000015B8800005B8E00195D8200CBD5DA00FFFFFF00E1ECF20094BCD2005495
      B700ADC7D400E9E7E600D7D3D10054656E000000000000000000811E00000000
      0000000000000969100009691000096910000969100009691000096910000969
      1000096910000969100009691000000000005F5F5F005F5F5F00000000005F5F
      5F005F5F5F00E3E3E300000000006F6F6F00FFFFFF00DADADA0053535300B9B9
      B90000000000000000000000000000000000E7C9BC00FFFFFF00F8E6D700DD8F
      5000D8834800D3784000CE6F3800F8EAE100F5E3D900C0512000BE4B1B00BE4B
      1C00BD471500D0AC9E00C8CACE00CFB6AD00000000009D9C9B002A628300006D
      A0000097CC000092C60000679E001B5A7E00CCD5DA00FFFFFF00FFFFFF00F9F8
      F700EEEEEF00F2F0EF00CFCFCF00295369000000000000000000000000008E1B
      0000000000000969100009691000096910000969100009691000096910000969
      1000096910000969100009691000000000000000000000000000000000000000
      00005F5F5F005F5F5F00E3E3E300000000006F6F6F006F6F6F006F6F6F005353
      530000000000000000000000000000000000E1BCAB00F5E8E200FFFFFF00F3D7
      BA00DF955500D9894A00DD946100F5DECD00EDC9B300C8602D00C1511F00BC46
      1400D69F8700E3E8EB00DACBC600DFBAA90000000000126287000086BB00009D
      D0000097CA000095C800008DC10000669A001A587900CBD5DA00FFFFFF00FDFD
      FD00FFFFFF00C5CDD1002F6480000052800000000000811E0000811E00000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E3E3E3005F5F5F00E3E3
      E300FFFFFF005F5F5F005F5F5F00E3E3E3000000000000000000000000000000
      00000000000000000000000000000000000000000000E1BCAC00F3E5DF00FFFF
      FF00F6DEC300E4A16000DF965800E1A07000DB926300CE6F3700CA622B00E0AF
      9700F4FEFF00E7DAD500E1BCAC000000000000000000006EA200009FD3000099
      CC000097CA000094C7000091C400008BBE00006499001B577A00CED7DC00FFFF
      FF0099ACB8000B4B6E00005A8D00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E3E3E3005F5F5F005F5F5F005F5F
      5F00E3E3E300FFFFFF005F5F5F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E0BAA900F2E5
      DE00FFFFFF00F8E0C600E7A86500FBEFE300F9E7DB00D57E4000E8B79A00FEFF
      FF00EEE4E000E0BCAC00000000000000000000000000006EA200008FC300009B
      CE000097CA000094C7000090C300008DC0000087BB0000669A00215E7F005B7C
      8E00004870000063970000000000000000000000000000000000811E00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005F5F5F005F5F5F00000000005F5F
      5F005F5F5F00E3E3E300F0F0F000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E1BC
      AC00F2E3DB00FFFFFF00F8E4CA00F4D2A500EFC19200F0CBA900FFFFFF00F4E9
      E300E1BCAC000000000000000000000000000000000000000000006DA1000095
      C8000098CB000094C7000190C3000B96CA001FA9DF000084B80000679A00004E
      7C00006599000000000000000000000000000000000000000000811E00000000
      0000000000000969100009691000096910000969100009691000096910000969
      1000096910000969100009691000000000000000000000000000000000000000
      00005F5F5F005F5F5F00E3E3E300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E0B9A700F2E2DB00FFFFFF00FBEFDD00F8E7D300FFFFFF00F7EBE600E1BF
      AE00000000000000000000000000000000000000000000000000000000000075
      A9000092C5000096C9000291C4001FA9DE001FA9DF000087BB000071A5000000
      00000000000000000000000000000000000000000000811E0000811E00000000
      0000000000000969100009691000096910000969100009691000096910000969
      1000096910000969100009691000000000000000000000000000000000000000
      0000000000005F5F5F005F5F5F00E3E3E3000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E1BCAC00F2E2DA00FFFFFF00FFFFFF00F6ECE700E1BCAC000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000073A600008FC2000294C8000073A600058AB8000081B3000073A6000000
      0000000000000000000000000000000000000000000000000000811E00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000005F5F5F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000E1BCAB00E7C9BC00E7C9BC00E1BCAB00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000074A7000073A600000000000073A6000073A600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A1300000000000000000
      0000A1300000000000000000000000000000006D0300006D0300000000000000
      0000993300009933000099330000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000006600000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000066000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A1300000000000000000
      0000A130000000000000006D0300006D0300006D030029BA4400006D03000000
      0000993300000000000000000000993300000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000006600000066000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000066000000660000000000000000000031AED90043B8DF0031B1DC0017A1
      D300000000000000000000000000000000000000000000000000000000000000
      0000CDB8B60068758B00000000000000000000000000A1300000A1300000A130
      0000A130000000000000006D030058E0870058E087003CC95F001AAD2C00006D
      0300993300009933000099330000993300000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000006600000066
      00004DD777002ABA430000660000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000066
      00004DD777002ABA430000660000006600003BB0DA00B9F2F90086F0FA0078E2
      F40065D4ED0053C8E70036B4DE001FA7D6001FA7D5000000000000000000CDB8
      B60072809B00238FE90056A7E4000000000000000000A1300000000000000000
      0000A130000000000000006D0300006D0300006D03004CD77600006D03000000
      0000993300000000000000000000993300000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000066000058E0
      870058E087003CC95E0019AC2C00006600000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000066000058E0
      870058E087003CC95E0019AC2C00006600001AA3D400AEE5F300A2FFFF0098FD
      FF009AFCFF0097FBFF0092F6FF007FE8F90069D9F10056C9E7008EA7B4007680
      9900218AE1004CB5FF0042AFFE00000000000000000000000000A1300000A130
      000000000000000000000000000000000000006D0300006D0300000000000000
      0000993300009933000099330000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000006600000066
      000058E087004DD7760000660000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000066
      000058E087004DD77600006600000066000023ABD80074C9E600B3FEFF008EF9
      FF0091F8FF0090F5FD00A0E2E7009EE0E60094E9EF00A7CBCE006C82A000258A
      DF004AB4FF004AB2FC0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000006E757C007F7A
      8800000000000000000000000000000000000000000000000000000000000000
      00000066000000660000000000000000000000000000000000006E757C007F7A
      8800000000000000000000000000000000000000000000000000000000000000
      0000006600000066000000000000000000003DB8DE0063CFEC00B3F3FA0092F8
      FC009EE1E400C9D6CB00E3CBB800DBC5B200C0AFA30099938C005B92C0004BB6
      FF0057BEFE002FB0DE0000000000000000000000000000000000000000004A66
      7C009C8993000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000059A3DC002D87
      D5009C8993000000000000000000000000000000000000000000000000000000
      000000660000000000000000000000000000000000000000000059A3DC002D87
      D5009C8993000000000000000000000000000000000000000000000000000000
      0000000000000066000000000000000000003EC0E600A2ACB5009FDAE900A2DC
      DD00D7C4BF00F9F4E500FFFFE100FFFFE200FBFAD200DAC1A300D1BBB60068CF
      FD0070DBFC005BCFEA0000000000000000000000000000000000000000004AB3
      FF002B84D100A18A920000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004AB3
      FF002B84D100A18A920000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004AB3
      FF002B84D100A18A920000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003CC0E800BF8A850078CBE500C5B9
      B200F9F7F200FFFFFF00FFFFEA00FFFFDE00FFF9CF00FFECB800E1B49A0089DE
      F00074E0FC0082E9FA001DA6D500000000000000000000000000000000000000
      000046B2FF002984D0009186900000000000A8787500D5B6A700D0A59F000000
      0000000000000000000000000000000000000000000000000000000000000000
      000046B2FF002984D0009186900000000000A8787500D5B6A700D0A59F000000
      0000000000000000000000000000000000000000000000000000000000000000
      000046B2FF002984D0009186900000000000A8787500D5B6A700D0A59F000000
      0000000000000000000000000000000000003DC0E800C5908700B7DAE200D9C6
      B200FFFFEF00FFFFF600FFFFEF00FFFFE000F9E4BB00F8D59D00E8C8A700A7CE
      D4006EDDFC0096F6FF003FBCE100000000000000000000000000000000000000
      0000000000006AC1FF008F8B9000CAB09A00FEFDDA00FEFDD900FFFFEF00B48D
      8900000000000000000000000000000000000000000000000000000000000000
      0000000000006AC1FF008F8B9000CAB09A00FEFDDA00FEFDD900FFFFEF00B48D
      8900000000000000000000000000000000000000000000000000000000000000
      0000000000006AC1FF008F8B9000CAB09A00FEFDDA00FEFDD900FFFFEF00B48D
      89000000000000000000000000000000000040C1E700CB978800FFF7F000DFCB
      B500FFFFE500FFFFE500FFFFE700FFFBD600F3CC9900F7CC9000EDD1AF00A9CE
      D1006ADDFC0095F7FF0071DFF300000000000000000000000000000000000000
      000000000000A2ADC200EBC6A800FFF7CA00FFFFDE00FFFFE300FFFFF700FAF9
      E300C79C96000000000000000000000000000000000000000000000000000000
      000000000000A2ADC200EBC6A800FFF7CA00FFFFDE00FFFFE300FFFFF700FAF9
      E300C79C96000000000000000000000000000000000000000000000000000000
      000000000000A2ADC200EBC6A800FFF7CA00FFFFDE00FFFFE300FFFFF700FAF9
      E300C79C96000000000000000000000000003FC0E800D29F8A00FFFDFA00D6BC
      AE00FEFFD900FFFFD500FAE8BF00F4D4A300F6D6AB00FFF0C500DFC0AA00AFD5
      DD0093E7FE00B1FCFF00ABFAFF0039B5DD000000000000000000000000000000
      000000000000C6978F00F4D7A800F9E0B300FFFFDD00FFFFEF00FFFFFE00FAF9
      E300C79C96000000000000000000000000000000000000000000000000000000
      000000000000C6978F00F4D7A800F9E0B300FFFFDD00FFFFEF00FFFFFE00FAF9
      E300C79C96000000000000000000000000000000000000000000000000000000
      000000000000C6978F00F4D7A800F9E0B300FFFFDD00FFFFEF00FFFFFE00FAF9
      E300C79C96000000000000000000000000003FC1E800D9A78C00FFFBF900E1D1
      CC00E4D2B200FDEBBA00FBD49A00FCDBA200FFF9E700EDE4D900A3B8BC0085D5
      EC007ACBE7007BCAE60086D1EA0041B5DC000000000000000000000000000000
      000000000000E4C9B200F6D6A400F2C69100FEFBD300FFFFE500FFFFE700FFFF
      DE00C6AC9A000000000000000000000000000000000000000000000000000000
      000000000000E4C9B200F6D6A400F2C69100FEFBD300FFFFE500FFFFE700FFFF
      DE00C6AC9A000000000000000000000000000000000000000000000000000000
      000000000000E4C9B200F6D6A400F2C69100FEFBD300FFFFE500FFFFE700FFFF
      DE00C6AC9A0000000000000000000000000046C3E900DFAE8E00FFFAF600FDFC
      FB00EBDCD500EED6B900EDD2AE00E8D0AD00D8C5B300C2A29F008EEDFA0087F1
      FE002AB1DC000000000000000000000000000000000000000000000000000000
      000000000000CAA09800F6E2BA00F7D7AA00F5D6A600FCF0C900FFFFD800F8F5
      D100C8A298000000000000000000000000000000000000000000000000000000
      000000000000CAA09800F6E2BA00F7D7AA00F5D6A600FCF0C900FFFFD800F8F5
      D100C8A298000000000000000000000000000000000000000000000000000000
      000000000000CAA09800F6E2BA00F7D7AA00F5D6A600FCF0C900FFFFD800F8F5
      D100C8A2980000000000000000000000000035B5E200E5B49000FFFCF800FFFF
      FF00FFFFFF00FFFFFE00FCF7F000C49B9200CD916400C2896E006BCEEB006BD1
      ED0031B1DB000000000000000000000000000000000000000000000000000000
      00000000000000000000DCC4B400F8F6F200FBDDAC00F8D29B00FBE8B900BE9D
      8F00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000DCC4B400F8F6F200FBDDAC00F8D29B00FBE8B900BE9D
      8F00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000DCC4B400F8F6F200FBDDAC00F8D29B00FBE8B900BE9D
      8F000000000000000000000000000000000000000000E9B99100FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FAFBFD00C69E9300E9AE700000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000CAAD9600DDBFA900DCB8A800CAAD96000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000CAAD9600DDBFA900DCB8A800CAAD96000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000CAAD9600DDBFA900DCB8A800CAAD96000000
      00000000000000000000000000000000000000000000EDBD9200DCA88700DCA8
      8700DCA88700DCA88700DCA88700C49689000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A5420800A7440700A23F080000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A4787400A4787400A4787400A4787400A4787400A4787400A478
      7400A4787400A47874008C5D5C0000000000000000000000000000669A000066
      9A0000669A00A4787400A4787400A4787400A4787400A4787400A4787400A478
      7400A4787400A47874008C5D5C0000000000000000004A667C00BE9596000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A23F0800A5420800A23F0800A542080000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A87C7500FEE5CB00FFE2C400FFDFBE00FFDCB800FFD9B100FED6
      AC00FFD4A600FFD1A2008C5D5C00000000000000000000669A003CBEE30036BA
      E10030B6DF00B7818300FCEDDD00FAF2E400F8F1E000F7EEDD00F7EEDB00F7ED
      DB00F7ECDA00F8EDD9008C5D5C00000000006B9CC3001E89E8004B7AA300C896
      9300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A74407000000000000000000A23F0800A23F080000000000A23F
      0800A74407000000000000000000000000000000000000000000000000000000
      000000000000AD807800FFEAD400E5A65700E5A65700E5A65700E5A65700E5A6
      5700E5A65700FFD4A8008C5D5C00000000000000000000669A0045C4E6003FC0
      E40038BCE200B7818300F6E4DA00E4A85C00E4A75900E3A75900E3A75900E3A6
      5800E3A75900F0E3D0008C5D5C00000000004BB4FE0051B5FF002089E9004B7A
      A200C69592000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A74407000000000000000000A23F080000000000A23F0800A23F
      0800A23F0800A542080000000000000000000000000000000000000000000000
      000000000000B4867A00FEEEDD00FFEBD600FFE8CF00FFE4C900FEE1C200FEDD
      BB00FFDBB500FFD8AF008C5D5C00000000000000000000669A004DC9E90047C4
      E70041C0E500B9848400F8E8DF00F9E4CE00F9DBBD00F9DBBD00F9DBBD00F8D9
      B800F5DDC200F0E4D2008C5D5C00000000000000000051B7FE0051B3FF001D87
      E6004E7AA000CA97920000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A5420800A23F0800A23F0800A23F080000000000A23F08000000
      000000000000A64307000000000000000000A4787400A4787400A4787400A478
      7400A4787400BA8D7D00FEF2E500E5A65700E5A65700E5A65700E5A65700E5A6
      5700E5A65700FEDCB7008C5D5C00000000000000000000669A0056CDED0050C9
      EA004AC5E800BC878500F9EBE400E4A85C00E4A75800E4A75800E4A75800E4A6
      5700E3A75900F2E6D6008C5D5C0000000000000000000000000051B7FE004EB2
      FF001F89E6004E7BA200B9949700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A23F0800A7440700A5420800A23F0800A54208000000
      000000000000A23F08000000000000000000A87C7500FEE5CB00FFE2C400FFDF
      BE00FFDCB800C2958100FEF6EC00FEF3E600FEEFE100FFEDDA00FEE9D400FEE6
      CC00FFE2C600FEDFBF008C5D5C00000000000000000000669A005ED2F00058CF
      ED0052CBEB00C08B8500FAEFE900FAEDDE00FAE5D000F9E5CF00F9E3CD00F8E1
      CA00F5E4D000F3E8DB008C5D5C000000000000000000000000000000000052B8
      FE004BB1FF002787D9005F6A760000000000B0857F00C09F9400C09F9600BC98
      8E00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000009E410D00A14E2200A23F0800A7440700A542
      0800A5420800A23F08000000000000000000AD807800FFEAD400E5A65700E5A6
      5700E5A65700CA9B8300FFF9F300E5A65700E5A65700E5A65700E5A65700E5A6
      5700E5A65700FEE3C8008C5D5C00000000000000000000669A0066D7F30060D4
      F1005AD0EE00C4908600FCF4F000E5A95C00E5A65700E5A65700E4A65700E4A6
      5600E4A75A00F7EEE3008C5D5C00000000000000000000000000000000000000
      000055BDFF00B5D6ED00BF9D9200BB9B8C00E7DAC200FFFFE300FFFFE500FDFA
      DA00D8C3B300B58D850000000000000000000000000000000000000000000000
      0000000000000000000000000000957D75008D766C00A55E3900A23F0800A23F
      0800A23F0800000000000000000000000000B4867A00FEEEDD00FFEBD600FFE8
      CF00FFE4C900D1A28600FEFBF900FEF9F400FEF7EF00FEF5EA00FEF1E400FEEE
      DE00FEEBD700FEE8D0008C5D5C00000000000000000000669A006DDBF60067D8
      F30062D4F200C8948800FEF7F400FEF7F000FBF0E500FBEFE300FAEDE000FAEE
      E100F9F0E500E8E3DD008C5D5C00000000000000000000000000000000000000
      00000000000000000000CEA79500FDEEBE00FFFFD800FFFFDA00FFFFDB00FFFF
      E600FFFFFB00EADDDC00AE837F00000000000000000000000000000000000000
      000000000000000000008E7C7200AC928E008E7C72008E7C7200000000000000
      000000000000000000000000000000000000BA8D7D00FEF2E500E5A65700E5A6
      5700E5A65700D8A98A00FEFEFD00FEFCFA00FEFAF600FEF8F100FEF5EC00EBDF
      DB00D3C2C000BAA9AA008C5D5C00000000000000000000669A0074DFF8006FDC
      F6006ADAF400CC998900FEF8F500FFFFFF00FEFFFE00FCFAF900FBFBF900B481
      7600B4817600B4817600B4817600000000000000000000000000000000000000
      00000000000000000000C1A09100FBDCA800FEF7D000FFFFDB00FFFFE300FFFF
      F800FFFFFD00FFFFFD00C6A99C00000000000000000000000000000000000000
      0000000000008E7C7200D3BDBD008E7C7200AD938F008E7C7200000000000000
      000000000000000000000000000000000000C2958100FEF6EC00FEF3E600FEEF
      E100FFEDDA00DFB08D00FEFEFE00FEFEFE00FEFCFB00FEFBF700FEF8F200B481
      7600B4817600B4817600B17F7400000000000000000000669A007AE3FA0076E1
      F80070DDF600D09C8900FFFAF800FFFFFF00FFFFFF00FFFFFF00FFFFFF00B481
      7600E0A87000F7935B00FF00FE00000000000000000000000000000000000000
      000000000000C1A09100FEE3AC00F1C49100FCF2CA00FFFFDD00FFFFE400FFFF
      F700FFFFF700FFFFE900EEE5CB00B9948C000000000000000000000000000000
      00008E7C7200E9DEDE008E7C7200A9958F00D2BABA008E7C7200000000000000
      000000000000000000000000000000000000CA9B8300FFF9F300E5A65700E5A6
      5700E5A65700E4B58E00FEFEFE00FEFEFE00FEFEFE00FEFDFC00FEFBF800B481
      7600EBB56F00E49B420000000000000000000000000000669A007FE6FC007BE4
      FA0077E1F900D29F8A00DCA88700DCA88700DCA88700DCA88700DCA88700B481
      7600C7AF890000669A0000000000000000000000000000000000000000000000
      000000000000C2A19100FFE6AE00EEB58100F7DCAE00FEFDD800FFFFDF00FFFF
      E300FFFFE400FFFFE000F3ECD200BB968E000000000000000000000000008E7C
      7200FCFAFA008E7C7200000000008E7C7200DFCECE008E7C7200000000000000
      000000000000000000000000000000000000D1A28600FEFBF900FEF9F400FEF7
      EF00FEF5EA00E8B89000DCA88700DCA88700DCA88700DCA88700DCA88700B481
      7600F0B25E000000000000000000000000000000000000669A0083E8FE0080E6
      FC007DE5FC007DE5FC0078E2FA0072DFF8006BDAF50064D5F2005DD0EF0056CD
      ED0052CAEB0000669A0000000000000000000000000000000000000000000000
      000000000000BC978C00FBE7B700F4C79100F2C99400F8E5B900FEFCD800FFFF
      DD00FFFFDC00FFFFE000E2D2BA00B68E86000000000000000000000000008E7C
      72008E7C720000000000000000008E7C7200ECE2E2008E7C7200000000000000
      000000000000000000000000000000000000D8A98A00FEFEFD00FEFCFA00FEFA
      F600FEF8F100FEF5EC00EBDFDB00D3C2C000BAA9AA008C5D5C00000000000000
      0000000000000000000000000000000000000000000000669A0084E9FE0084E9
      FE007373730073737300737373007373730073737300737373007373730060D4
      F0005ACFEE0000669A0000000000000000000000000000000000000000000000
      00000000000000000000D9C3A900FFFEE500F7DCB800F2C99400F5D4A500FAE8
      BD00FDF4C900FDFBD600B6908900000000000000000000000000000000008E7C
      72000000000000000000000000008E7C7200F9F5F5008E7C7200000000000000
      000000000000000000000000000000000000DFB08D00FEFEFE00FEFEFE00FEFC
      FB00FEFBF700FEF8F200B4817600B4817600B4817600B17F7400000000000000
      0000000000000000000000000000000000000000000000669A0084E9FE0084E9
      FE0073737300CFC1BC00CFC1BB00CFC1BB00CFC1BB00CEBEB7007373730068D8
      F40062D4F10000669A0000000000000000000000000000000000000000000000
      00000000000000000000B58D8500E8DEDD00FFFEF200F9D8A300F4C48C00F9D4
      9F00FDEAB800D0B49F00B8908600000000000000000000000000000000000000
      00000000000000000000000000008E7C72008E7C720000000000000000000000
      000000000000000000000000000000000000E4B58E00FEFEFE00FEFEFE00FEFE
      FE00FEFDFC00FEFBF800B4817600EBB56F00E49B420000000000000000000000
      000000000000000000000000000000000000000000000000000000669A000066
      9A0073737300E2D8D300FAF9F800F9F8F700F9F8F700D0C5BF00737373000066
      9A0000669A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000AD827F00C9AA9E00EFE0B700EFDFB200E7CE
      AC00B8908600B890860000000000000000000000000000000000000000000000
      00000000000000000000000000008E7C72000000000000000000000000000000
      000000000000000000000000000000000000E8B89000DCA88700DCA88700DCA8
      8700DCA88700DCA88700B4817600F0B25E000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007373730073737300737373007373730073737300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BA968A00BB988C00B791
      8800000000000000000000000000000000000000000000000000B7818300B781
      8300B7818300B7818300B7818300B7818300B7818300B7818300B7818300B781
      8300B7818300B7818300B7818300000000000000000000000000000000000000
      00000000000000000000000000009A6666006933340000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007F40260081412500814125008141250081412500814125000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007F40260081412500814125008141250081412500814125000000
      0000000000000000000000000000000000000000000000000000636E7B00FEEE
      D400F7E3C500F6DFBC00F5DBB400F3D7AB00F3D3A200F1CF9A00F0CF9700F0CF
      9800F0CF9800F5D49A00B7818300000000000000000000000000000000000000
      00009A6666009A666600B9666600BB6868006933340000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008241
      250081412500CB660000CB660000CB660000CB660000CB660000CB6600008141
      2500814125000000000000000000000000000000000000000000000000008241
      250081412500CB660000CB660000CB660000CB660000CB660000CB6600008141
      250081412500000000000000000000000000000000005E98C7003489D0007F85
      9D00F6E3CB00F5DFC200F4DBBA00F2D7B200F1D4A900F1D0A200EECC9900EECC
      9700EECC9700F3D19900B78183000000000000000000000000009A6666009A66
      6600C66A6B00D06A6B00D2686900C3686900693334009A6666009A6666009A66
      66009A6666009A6666009A6666000000000000000000000000009B4E1800C562
      0300CA650000CA650000CA650000CA650000CA650000CB660000CB660000CB66
      0000C563030081412500000000000000000000000000000000009B4E1800C562
      0300CA650000CA650000CA650000CA650000CA650000CB660000CB660000CB66
      0000C563030081412500000000000000000000000000000000004BB6FF00288B
      E00085849800F5E3CB00F5DFC300F3DBBB00F2D7B200F1D4AB00F0D0A300EECC
      9A00EECC9700F3D19900B78183000000000000000000000000009A666600DE73
      7400D7707100D56F7000D56D6E00C76A6D0069333400FEA2A300FCAFB000FABC
      BD00F9C5C600F9C5C6009A6666000000000000000000994D1900C4620200C863
      0000C6610000C6610000C6610000C6610000C8630000C9640000CB660000CB66
      0000CB660000C5630300814125000000000000000000994D1900C4620200C863
      0000C6610000C6610000C6610000C6610000C8630000C9640000CB660000CB66
      0000CB660000C563030081412500000000000000000000000000B48176004DB5
      FF00278BDE0079819A00F6E3CA00F5DFC200F4DBB900F2D7B200F1D4AA00F0D0
      A100EFCD9900F3D19800B78183000000000000000000000000009A666600E077
      7800DB757600DA747500DA727300CC6E71006933340039C5650025CF630029CC
      630019CB5B00F9C5C6009A6666000000000000000000BB5D0600C6620100C460
      0200C25E0200C76F2200D18A4B00D6955B00D8965A00D4883F00C9640000CB66
      0000CB660000CB660000824125000000000000000000BB5D0600C6620100C460
      0200C25E0200BF5B0200CE833F00D6955A00D8975B00D68F4B00D0772000CB66
      0000CB660000CB66000082412500000000000000000000000000BA8E8500FFFC
      F4004CB9FF005A91BF00A4817900BE978E00AC7E7900BE958900D6B49B00F1D3
      AA00F0D0A100F3D29B00B78183000000000000000000000000009A666600E57D
      7E00E07A7B00DF797A00DF777800D07275006933340042C4680030CD670033CB
      670024CB6000F9C5C6009A66660000000000A8541100C9670700C7680A00C568
      0900D69A5C00FEFEFE00FEFEFE00FEFEFE00FEFEFE00E7C29F00C6610000C964
      0000CB660000CB660000CB6600007F402600A8541100C9670700C7680A00C568
      0900C2660800C1640500E7C3A000FEFEFE00FEFEFE00FEFEFE00FEFEFE00DB99
      5700CB660000CB660000CB6600007F4026000000000000000000BA8E8500FFFF
      FD00FBF4EC00BFA19F00C7A59C00E1C9B800F2DFC600E0C3AD00C59F9000D7B4
      9B00F0D4A900F5D5A300B78183000000000000000000000000009A666600EA82
      8300E57F8000E37D7E00E6808100D3747600693334003DC2640029CB63002FCA
      640020CA5E00F9C5C6009A66660000000000AC570F00CD711400CA721800C872
      1A00FEFEFE00E5BF9800CA7C2C00C7732000C36B1600C05F0800C35E0000C863
      0000CA650000CB660000CB66000082412500AC570F00CD711400CA721800C872
      1A00C7711A00C56F1700C56F1800C6711C00C46E1A00C56D1E00E4B78D00FEFE
      FE00CA650000CB660000CB660000824125000000000000000000CB9A8200FFFF
      FF00FEF9F500C09C9700E3CEC400F9EADA00F8E7D200FFFFF700E0C2AD00BE95
      8900F2D8B200F6D9AC00B78183000000000000000000000000009A666600F087
      8800E9818200EC969700FBDDDE00D8888A0069333400B8E1AC006BDC89005DD5
      800046D47300F9C5C6009A66660000000000AB581200D4843400CF7F2E00CD7E
      2D00FEFEFE00D0873C00CA782500C6701900C2680C00E6C3A000C15C0100C661
      0000CA650000CB660000CB66000082412500AB581200D4843400CF7F2E00CD7E
      2D00CD7F2F00CC7D2C00EACCAC00C6701900C2680C00BF600300C6691500FEFE
      FE00CA650000CB660000CB660000824125000000000000000000CB9A8200FFFF
      FF00FFFEFD00AC7F7B00F8EEE700F9EFE300F8EADA00FFFFF000F3DEC700AC7E
      7900F4DBB900F8DDB400B78183000000000000000000000000009A666600F58C
      8D00EE868700F0999A00FDDCDD00DA888A0069333400FFF5D800FFFFE000FFFF
      DE00ECFDD400F9C5C6009A66660000000000AC591500DEA26400D7934D00D38B
      4100FEFEFE00E2B48400D0853700CB7B2A00C6701900FEFEFE00E5BE9800C560
      0000CA650000CB660000CB66000082412500AC591500DEA26400D7934D00D38B
      4100D48D4400ECCFB100FEFEFE00CB7B2A00C6701900C3670B00D7985D00FEFE
      FE00CA650000CB660000CB660000824125000000000000000000DCA88700FFFF
      FF00FFFFFF00C19F9C00E6D6D100FBF3EB00FAEFE200FFFFDE00E2C8B800BE97
      8D00F7E1C200F0DAB700B78183000000000000000000000000009A666600FA91
      9200F48E8F00F28B8C00F48C8D00DC7F800069333400FDF3D400FFFFDF00FFFF
      DD00FFFFE000F9C5C6009A66660000000000AA571100E6B48200E3B17C00DA98
      5400EFD2B500FEFEFE00F5E6D700F4E4D300F7ECE100FEFEFE00FEFEFE00EDCF
      B200CA650000CB660000CB66000082412500AA571100E6B48200E3B17C00DA98
      5400F4E0CC00FEFEFE00FEFEFE00F8EEE300F3E1CF00F2DFCC00FEFEFE00E5B8
      8D00CA650000CB660000CB660000824125000000000000000000DCA88700FFFF
      FF00FFFFFF00DFCDCB00C9ACA900E6D6D100F8EEE600E3CEC400C7A59C00C3A3
      9400E6D9C400C6BCA900B78183000000000000000000000000009A666600FE97
      9800F9939400F8929300F9909200E085850069333400FDF3D400FFFFDF00FFFF
      DD00FFFFDF00F9C5C6009A66660000000000AA550E00E7B27D00F0D3B500E5B0
      7900E3AA6F00EAC39A00F0D6BB00EDD0B300F2DFCB00FEFEFE00FEFEFE00EBC8
      A600CA650000CB660000CB6600007F402600AA550E00E7B27D00F0D3B500E5B0
      7900F5E1CC00FEFEFE00FEFEFE00F4E2D000EBCBAB00E9C7A400DB9E6000C763
      0300CA650000CB660000CB6600007F4026000000000000000000E3B18E00FFFF
      FF00FFFFFF00FFFFFF00DFCDCB00C19F9C00AC7F7B00C09D9700D6BAB100B885
      7A00B8857A00B8857A00B78183000000000000000000000000009A666600FF9B
      9C00FD979800FC969700FE979800E388890069333400FDF3D400FFFFDF00FFFF
      DD00FFFFDF00F9C5C6009A6666000000000000000000AF622100F3D9BF00F4D9
      BE00EABB8B00E3AA6F00DC9B5A00D58E4500D0823200FEFEFE00E7BD9200CA66
      0400CA650000CB660000824125000000000000000000AF622100F3D9BF00F4D9
      BE00EABB8B00F2D8BD00FEFEFE00D58E4500D0823200CD772000CB6F1100CA66
      0400CA650000CB66000082412500000000000000000000000000E3B18E00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFC00FFFEF900E3CFC900B885
      7A00E8B27000ECA54A00C58768000000000000000000000000009A666600FF9F
      A000FF9A9B00FF999A00FF9A9B00E78C8D0069333400FDF3D400FFFFDF00FFFF
      DD00FFFFDF00F9C5C6009A6666000000000000000000AA550E00E9B78200F8E7
      D500F6DFC800E9BB8B00DE9F5E00D78F4500D3843300E7BC9000CF741700CB68
      0800CB660000C56303007D3F27000000000000000000AA550E00E9B78200F8E7
      D500F6DFC800E9BB8B00EFCFAE00D78F4500D3843300D07A2200CF741700CB68
      0800CB660000C56303007D3F2700000000000000000000000000EDBD9200FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E4D4D200B885
      7A00FAC57700CD937700000000000000000000000000000000009A6666009A66
      6600E98E8F00FE999A00FF9D9E00EB8F900069333400FBF0D200FDFCDC00FDFC
      DA00FDFCDC00F9C5C6009A666600000000000000000000000000AB561000EBB9
      8600F6E0CA00F7E6D400F0D1B100E8B98A00E3AA7100DFA06000D98F4400CE71
      1100C56303008F481E0000000000000000000000000000000000AB561000EBB9
      8600F6E0CA00F7E6D400F0D1B100E8B98A00E3AA7100DFA06000D98F4400CE71
      1100C56303008F481E0000000000000000000000000000000000EDBD9200FCF7
      F400FCF7F300FBF6F300FBF6F300FAF5F300F9F5F300F9F5F300E1D0CE00B885
      7A00CF9B86000000000000000000000000000000000000000000000000000000
      00009A666600B0717200D7868700DA888800693334009A6666009A6666009A66
      66009A6666009A6666009A66660000000000000000000000000000000000AC57
      0F00B3672800ECBC8B00F0CBA600EECAA400EABC8E00E1A26300D47E2800B05C
      150089452100000000000000000000000000000000000000000000000000AC57
      0F00B3672800ECBC8B00F0CBA600EECAA400EABC8E00E1A26300D47E2800B05C
      1500894521000000000000000000000000000000000000000000EDBD9200DCA8
      8700DCA88700DCA88700DCA88700DCA88700DCA88700DCA88700DCA88700B885
      7A00000000000000000000000000000000000000000000000000000000000000
      000000000000000000009A6666009A6666006933340000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000AE591100B05D1700B2611D00B1601A00B05B14009C5019000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000AE591100B05D1700B2611D00B1601A00B05B14009C5019000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C0585900A5787800CBBE
      BC00F1EDEB00E5E6E500A3575600A53F3F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0585900A5787800CBBEBC00F1EE
      EB00E5E6E500A3575600A53F3F00000000000000000000000000000000000000
      0000868484008684840000000000000000008684840086848400000000000000
      000000000000000000000000000000000000000000000000000097433F009743
      3F00B59A9B00B59A9B00B59A9B00B59A9B00B59A9B00B59A9B00B59A9B009330
      300097433F00000000000000000000000000C4716D00CD646400A46868009D45
      4400E5D9D800FEFEFE00A9585700A53F3F00B55C5D0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C4716D00CD646400A46868009D454400E5D9
      D800FFFFFF00A9585700A63B3A00B55C5D000000000000000000000000008684
      8400BCBABA00B5B3B300868484008684840086848400EBEAEA00868484008684
      8400868484000000000000000000000000000000000097433F00D6686800C660
      6000E5DEDF0092292A0092292A00E4E7E700E0E3E600D9DFE000CCC9CC008F20
      1F00AF46460097433F000000000000000000C4716D00CD646400B57A7A009F55
      5400B1A1A000F1EDEB0005720A0005720A00087F0F0005720A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C3726E00CB606100B57A7A009F555400B1A1
      A000F1EDEB00AD585900A6393A00B55C5D00000000000000000086848400E3E2
      E200B5B3B300B5B3B300B5B3B300515050004F4F4F0086878700CDCDCD00E8E9
      E900C7C6C6008684840086848400868484000000000097433F00D0656600C25F
      5F00E9E2E20092292A0092292A00E2E1E300E2E6E800DDE2E400CFCCCF008F22
      2200AD46460097433F000000000000000000C16F6B00C0585900C8717100CB80
      7F00C3727200CA787800C16F6B00CD64640005720A000C9918000A9114000572
      0A00000000000000000000000000000000000000000000000000000000000000
      0000C0585900A5787800CBBEBC00C16F6B00C5595A00C8717100CB807F00C372
      7200CA787800C76D6D00C8656500B25859000000000086848400DEDDDD00D6D6
      D600A4A3A300A4A3A300A4A3A300565555001615160012121200181818001212
      120093939300CACACA0086848400000000000000000097433F00D0656500C15D
      5D00ECE4E40092292A0092292A00DFDDDF00E1E6E800E0E5E700D3D0D2008A1E
      1E00AB44440097433F000000000000000000B7645E00D09C9A00EEDCDC00EEDC
      DC00EEDCDC00EED8D700EFE3E100D28E8D00AD4C4D0005720A000FA31B000A91
      140005720A00000000000000000000000000000000000000000000000000C471
      6D00CD646400A46868009D454400B6635E00D09C9A00EEDCDC00EEDCDA00EFDA
      D800EED8D700EFE3E100D38D8C00AE4E4F0086848400D6D6D600D6D6D600A4A3
      A300E0DEDE00D9D7D700CDCBCB00C2C0C000B6B4B4009F9D9D00797677001212
      12001414140013131300868484008F8C8C000000000097433F00D0656500C15B
      5C00EFE6E600EDE5E500E5DEDF00E0DDDF00DFE0E200E0E1E300D6D0D200962A
      2A00B24A4A0097433F000000000000000000B7645E00E6CCCA00F3F8F700EAE9
      E900EAE9E900EAE9E900F2F6F500D28E8D00AD4C4D00B781830005720A0011A9
      200005720A00B7818300B7818300B7818300000000000000000000000000C372
      6E00CB606100B57A7A009F555400B6635D00E6CCCA00F3F8F700EAE8E800EBEA
      E900EBEBEA00F2F6F500D28F8E00AD4C4D0086848400D6D6D600A4A3A300F3F2
      F200FFFEFE00FCFBFB00EAE7E800E6E6E600E6E5E500DAD9D900CCCBCB00BFBD
      BD00A2A0A00073717100939191008E8C8C000000000097433F00CD626300C860
      6000C9676700CC727200CA727100C6696900C4646400CC6D6C00CA666700C55D
      5D00CD65650097433F000000000000000000B7645E00E5C6C500E5E6E500DBD7
      D700DDD9D900DDD9D900EAE9E900D28E8D00AD4C4D00FAE7C60005720A001FB6
      350005720A00F3D29800F9DB9B00B7818300000000000000000000000000C16F
      6B00C5595A00C8717100CB807F00B6635E00E4C5C400E6E7E600DBD7D700DDD9
      D900DBD9D800E8E9E900D28E8E00AD4C4D0086848400A4A3A300FFFFFF00FEFD
      FD00FBFBFB00DFDEDF00ADA7A900B4ADAE00C3BDBE00D1CECF00E0E0E000E1E1
      E100D4D3D300C7C6C600A7A5A500868383000000000097433F00B6555300C27B
      7800D39D9C00D7A7A500D8A7A600D8A6A500D7A09F00D5A09F00D7A9A700D8AB
      AB00CC66670097433F000000000000000000B7645E00E5C6C500EAE9E900E5E6
      E500E5E6E500E5E6E500EFE3E100D5918F0005720A0005720A0005720A0033C5
      520005720A0005720A0005720A00B781830000000000C0585900A5787800B663
      5E00D09C9A00EEDCDC00EEDCDA00B7645E00E6C7C700EFEFEE00E4E1E000E6E2
      E100E5E2E100F0EFEE00D5918F00AD4C4D00000000008684840086848400F1F0
      F000C2B9BA0093898B00A19B9F00ABA8AA00ABA6A700B1ACAD00AFA9AA00B2AD
      AE00CAC9C900DCDCDC00D0D0D000868484000000000097433F00CC666700F9F9
      F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9
      F900CC66670097433F00000000000000000000000000D2B6B500EAE9E900E5D9
      D800E5D9D800E5D9D800EAE9E900C285840005720A0034B3510053DB800046D1
      6C002BBB45001EA5300005720A00B7818300C4716D00CD646400A4686800B663
      5D00E6CCCA00F3F8F700EAE8E800EBEAE900D2B6B500E6E7E700E2DCDC00E2DD
      DD00E2DDDE00E5E5E400C2858400000000000000000000000000000000008684
      8400CAA09700BA9E8700A2897E0095817B00897C7F00928C9200A5A2A400BBB6
      B700D7D6D600CFCFCF0086848400000000000000000097433F00CC666700F9F9
      F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9
      F900CC66670097433F0000000000000000000000000000000000000000000000
      0000000000000000000000000000CAA39800FDF9F50005720A0048CB700060ED
      940030B34B0005720A00F6DBAC00B7818300C3726E00CB606100B57A7A00B663
      5E00E4C5C400E6E7E600DBD7D700DDD9D900DBD9D800E8E9E900D28E8E00AD4C
      4D00000000000000000000000000000000000000000000000000000000000000
      0000CC9A9900FFEAC400FFDDB300EEC39900D5AE8C00C9A78600CC9A99009895
      9600868484008684840000000000000000000000000097433F00CC666700F9F9
      F900CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00F9F9
      F900CC66670097433F0000000000000000000000000000000000000000000000
      0000000000000000000000000000D1A69300FEFEFE00FDF9F50005720A003CBB
      5D0005720A00F5DDC100FBE2BA00B7818300C16F6B00C5595A00C8717100B764
      5E00E6C7C700EFEFEE00E4E1E000E6E2E100E5E2E100F0EFEE00D5918F00AD4C
      4D00000000000000000000000000000000000000000000000000000000000000
      0000CC9A9900FFE7C800FFDDBA00FFDBB100FFD9A600FFD39F00CC9A99000000
      0000000000000000000000000000000000000000000097433F00CC666700F9F9
      F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9
      F900CC66670097433F0000000000000000000000000000000000000000000000
      0000000000000000000000000000E2B89800FEFEFE00FEFEFE00FDF9F5000572
      0A00F9EAD900FDEDD500F4E6C700B7818300B6635E00D09C9A00EEDCDC00EEDC
      DA00D2B6B500E6E7E700E2DCDC00E2DDDD00E2DDDE00E5E5E400C28584000000
      000000000000000000000000000000000000000000000000000000000000CE9D
      9B00FFEDDA00FFE7CE00FFE2C300FFDDB800FFDBAE00CC9A9900000000000000
      0000000000000000000000000000000000000000000097433F00CC666700F9F9
      F900CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00CDCDCD00F9F9
      F900CC66670097433F0000000000000000000000000000000000000000000000
      0000000000000000000000000000E2B89800FEFEFE00FEFEFE00FEFEFE00FDF9
      F500FCF3E800B5837800B5837800B7818300B6635D00E6CCCA00F3F8F700EAE8
      E800EBEAE900EBEBEA00F2F6F500D28F8E00AD4C4D0000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CC9A
      9900FEF0E100FFECD800FFE6CC00FFE1C200FEDDB700CC9A9900000000000000
      0000000000000000000000000000000000000000000097433F00CC666700F9F9
      F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9
      F900CC66670097433F0000000000000000000000000000000000000000000000
      0000000000000000000000000000EBC39F00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FAF7F400B5837800E8AA6100CD8C6200B6635E00E4C5C400E6E7E600DBD7
      D700DDD9D900DBD9D800E8E9E900D28E8E00AD4C4D0000000000000000000000
      0000000000000000000000000000000000000000000000000000CC9A9900FFFF
      F500FFFFF500FFF0E100FFEBD600FFE8CC00F6D4BA00CC9A9900000000000000
      000000000000000000000000000000000000000000000000000097433F00F9F9
      F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9F900F9F9
      F90097433F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000F0C8A100FAF7F400FAF7F400FAF7F400FDF9
      F500F6F0EF00B5837800D59E7D0000000000B7645E00E6C7C700EFEFEE00E4E1
      E000E6E2E100E5E2E100F0EFEE00D5918F00AD4C4D0000000000000000000000
      0000000000000000000000000000000000000000000000000000CC9A9900CC9A
      9900CC9A9900FCF3E900FCEADA00FCE5D000CC9A990000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000EBC39F00DDAE9400E0B39600DCA88700DCA8
      8700DCA88700B5837800000000000000000000000000D2B6B500E6E7E700E2DC
      DC00E2DDDD00E2DDDE00E5E5E400C28584000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CC9A9900CC9A9900CC9A99000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C2A6A400C2A6
      A400C2A6A400C2A6A400C2A6A400C2A6A400C2A6A400C2A6A400C2A6A400C2A6
      A400C2A6A400C2A6A400000000000000000000000000078DBE00078DBE00078D
      BE00078DBE00078DBE00078DBE00078DBE00078DBE00078DBE00078DBE00078D
      BE00078DBE00078DBE00000000000000000000000000078DBE00078DBE00078D
      BE00078DBE00078DBE00078DBE00078DBE00078DBE00078DBE00078DBE00078D
      BE00078DBE00078DBE00000000000000000000000000078DBE00078DBE00078D
      BE00078DBE00078DBE00078DBE00078DBE00078DBE00078DBE00078DBE00078D
      BE00078DBE00078DBE0000000000000000000000000000000000C2A6A400FEFC
      FB00FEFCFB00FEFCFB00FEFCFB00FEFCFB00FEFCFB00FEFCFB00FEFCFB00FEFC
      FB00FEFCFB00C2A6A4000000000000000000078DBE0025A1D10072C7E70085D7
      FA0066CDF90065CDF90065CDF90065CDF90065CDF80065CDF90065CDF80066CE
      F90039ADD800078DBE000000000000000000078DBE0063CBF800078DBE00A3E1
      FB0063CBF80063CBF80063CBF80063CBF80063CBF80063CBF80063CBF80063CB
      F8003AADD800ACE7F500078DBE0000000000078DBE0063CBF800078DBE00A3E1
      FB0066CDF90065CDF80065CDF90065CDF90065CDF80065CDF90065CDF80066CD
      F8003AADD800ACE7F500078DBE00000000000000000000000000C2A6A400FEFC
      FB00FEFCFB00FEFCFB00FEFCFB00FEFCFB00FEFCFB00FEFCFB00FEFCFB00FEFC
      FB00FEFCFB00C2A6A4000000000000000000078DBE004CBCE70039A8D100A0E2
      FB006FD4FA006FD4F9006ED4FA006FD4F9006FD4FA006FD4FA006FD4FA006ED4
      F9003EB1D90084D7EB00078DBE0000000000078DBE006AD1F900078DBE00A8E5
      FC0072D6FA0072D6FA0072D6FA0072D6FA0072D6FA0005710A0072D6FA006AD1
      F9003EB1D900B1EAF500078DBE0000000000078DBE006AD1F900078DBE00A8E5
      FC006FD4FA006FD4F9006ED4FA006FD4F9006FD4FA006FD4FA006FD4FA006ED4
      F9003EB1D900B1EAF500078DBE00000000000000000000000000C2A6A400FEFA
      F500FEFCFB00FEFAF500FEFAF500FEFCFB00FEFAF500FEFAF500FEFCFB00FEFA
      F500FEFAF500C2A6A4000000000000000000078DBE0072D6FA00078DBE00AEEA
      FC0079DCFB0079DCFB0079DCFB0079DCFB0079DCFB007ADCFB0079DCFA0079DC
      FA0044B5D900AEF1F900078DBE0000000000078DBE0072D6FA00078DBE00AEEA
      FC0079DCFA0079DCFA0079DCFA0079DCFA0079DCFA0079DCFA0005710A0079DC
      FA003EB1D900BBF2F600078DBE0000000000078DBE0072D6FA00078DBE00AEEA
      FC0079DCFB0079DCFB0079DCFB0079DCFB0079DCFB007ADCFB0079DCFA0079DC
      FA0044B5D900B6EEF600078DBE00000000000000000000000000C2A6A400FEFA
      F500FEFAF500FEFAF500FEFAF500FEFAF500FEFAF500FEFAF500FEFAF500FEFA
      F500FEFAF500C2A6A4000000000000000000078DBE0079DDFB001899C7009ADF
      F30092E7FB0084E4FB0083E4FC0083E4FC0084E4FC0083E4FC0083E4FB0084E5
      FC0048B9DA00B3F4F900078DBE0000000000078DBE0079DCFA00078DBE00B5EE
      FD0083E4FB0083E4FB0083E4FB0083E4FB0083E4FB0083E4FB00289B4C000571
      0A004CBBDA00BBF2F600078DBE0000000000078DBE0079DDFB00078DBE00B5EE
      FD0083E4FB0084E4FB0083E4FC0083E4FC0084E4FC0083E4FC0083E4FB0084E5
      FC0048B9DA00BBF2F600078DBE00000000000000000000000000C2A6A400FEF7
      F000FEF7F000FEF7F000FEF7F000FEF7F000FEF7F000FEF7F000FEF7F000FEF7
      F000FEF7F000C2A6A4000000000000000000078DBE0082E3FC0043B7DC0065C3
      E000ACF0FD008DEBFC008DEBFC008DEBFD008DEBFD008DEBFC008DEBFD000C85
      18004CBBDA00B6F7F9006DCAE000078DBE00078DBE0083E4FB00078DBE00BAF3
      FD008DEBFC008DEBFC008DEBFC008DEBFC008DEBFC008DEBFC001E9435000571
      0A004CBBDA00BBF2F600078DBE0000000000078DBE0082E3FC00078DBE00BAF3
      FD008DEBFC008DEBFC008DEBFC008DEBFD008DEBFD008DEBFC008DEBFD008DEB
      FC004CBBDA00BEF4F700078DBE00000000000000000000000000C2A6A400FEF7
      F000FEF7F000FEF7F000FEF7F000FEF3E900FEF7F000FEF7F000FEF3E900FEF7
      F000FEF7F000C2A6A4000000000000000000078DBE008AEAFC0077DCF300229C
      C600FDFFFF00C8F7FE00C9F7FE00C9F7FE00C9F7FE00C8F7FE000C8518003CBC
      5D000C851800DEF9FB00D6F6F900078DBE00078DBE008DEBFC00078DBE00FEFE
      FE00C8F7FE00C8F7FE0005710A00C8F7FE00C8F7FE00C8F7FE001D9F2F000571
      0A009BD5E700DEF9FB00078DBE0000000000078DBE008AEAFC00078DBE00FFFF
      FF00C9F7FE00C8F7FE00C9F7FE00C9F7FE00C9F7FE00C8F7FE00C9F7FE00C8F7
      FE009BD5E700DEF9FB00078DBE00000000000000000000000000C2A6A400FEF3
      E900FEF3E900FEF3E900FEF3E900FEF3E900FEF3E900FEF3E900FEF3E900FEF3
      E900FEF3E900C2A6A4000000000000000000078DBE0093F0FE0093F0FD001697
      C500078DBE00078DBE00078DBE00078DBE00078DBE000C85180052D97F0062ED
      970041C465000C851800078DBE00078DBE00078DBE0093F0FE00078DBE00078D
      BE00078BB30005710A0005710A000789A700078DBE0005710A003CC95E001188
      3E00078DBE00078DBE00078DBE0000000000078DBE0093F0FE00078DBE00078D
      BE00078DBE00078DBE00078DBE00078DBE00078DBE00078DBE00078DBE00078D
      BE00078DBE00078DBE00078DBE00000000000000000000000000C2A6A400FFF0
      E200FFF0E200FEF3E900FFEEDE00FEF3E900FFEEDE00FEF3E900FFEEDE00FEF3
      E900FFEEDE00C2A6A4000000000000000000078DBE009BF5FE009AF6FE009AF6
      FE009BF5FD009BF6FE009AF6FE009BF5FE000C85180046CE6C0059E4880058E1
      880061EB940040C165000C85180000000000078DBE009AF5FE009AF5FE009AF5
      FE0005710A0014A2230017A0280005710A0005710A0043CF680005710A009AF5
      FE00078DBE00000000000000000000000000078DBE009BF5FE009AF6FE009AF6
      FE009BF5FD009BF6FE009AF6FE009BF5FE009AF6FD009BF5FE009AF6FE009AF6
      FE000989BA000000000000000000000000000000000000000000C2A6A400FEF3
      E900FFEEDE00FFF0E200FEF3E900FFEEDE00FFF0E200DDCFC200DDCFC200DDCF
      C200DDCFC200C2A6A4000000000000000000078DBE00FEFEFE00A0FBFF00A0FB
      FE00A0FBFE00A1FAFE00A1FBFE000C8518000C8518000C8518000C85180056E1
      840047CD6E000C8518000C8518000C851800078DBE00FEFEFE00A0FBFF000571
      0A00149A220022B338002DBD48003CC95E004AD5730005710A00A0FBFF00A0FB
      FF00078DBE00000000000000000000000000078DBE00FEFEFE00A0FBFF00A0FB
      FE00A0FBFE00A1FAFE00A1FBFE00A0FAFE00A1FBFE00A1FBFF00A0FBFF00A1FB
      FF000989BA000000000000000000000000000000000000000000C2A6A400FFEE
      DE00FFEEDE00FFEEDE00FFEEDE00FFEEDE00FFEEDE00C3B4A800C3B4A800C3B4
      A800C3B4A800C2A6A400000000000000000000000000078DBE00FEFEFE00A5FE
      FF00A5FEFF00A5FEFF00078CB60043B7DC0043B7DC0043B7DC000C8518004EDD
      790036BA54000C851800000000000000000000000000078DBE00FEFEFE00A0FB
      FF0005710A002DB7480042CE660005710A0005710A00078DBE00078DBE00078D
      BE000000000000000000000000000000000000000000078DBE00FEFEFE00A5FE
      FF00A5FEFF00A5FEFF00078DBE00078DBE00078DBE00078DBE00078DBE00078D
      BE00000000000000000000000000000000000000000000000000C2A6A400FFEE
      DE00FFEAD700FFEEDE00FFEAD700FFEAD700FFEEDE00B0A29600B0A29600B0A2
      9600B0A29600C2A6A40000000000000000000000000000000000078DBE00078D
      BE00078DBE00078DBE00000000000000000000000000000000000C85180040D0
      65000C8518000000000000000000000000000000000000000000078DBE00078D
      BE00078BB30005710A0005710A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000078DBE00078D
      BE00078DBE00078DBE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C2A6A400FFEA
      D700FFEAD700FFEAD700FFEAD700FFEAD700C9B9AC00FEFAF500FEF7F000E6DA
      D900C2A6A4000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000C8518002AB743002DBA
      49000C8518000000000000000000000000000000000000000000000000000000
      0000000000000000000005710A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C2A6A400FFEA
      D700FFE6D000FFEAD700FFE6D000FFEAD700C5B5A900FEFAF500DDCFC200C2A6
      A400000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000C85180021B538000C85
      1800000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C2A6A400FFE6
      D000FFE6D000FFE6D000FFE6D000FFE6D000C9B9AC00DDCFC200C2A6A4000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000C8518000C8518000C8518000C8518000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C2A6A400C2A6
      A400C2A6A400C2A6A400C2A6A400C2A6A400C2A6A400C2A6A400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000C8518000C8518000C8518000C85180000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100100000100010000000000800800000000000000000000
      000000000000000000000000FFFFFF00F81FFE7F00000000E007FC1F00000000
      C003F803000000008001F800000000008001F000000000000000E00100000000
      0000C003000000000000800F000000000000801F000000000000C03F00000000
      0000C0FF00000000800187FF0000000080010FFF00000000C0031FFF00000000
      E0073FFF00000000F81FFFFF00000000DC1FFFFFFE7FDA39C01FFFC3FC1FDAD6
      DC1FF801F807C217DFFFE001F001D8D6DC1FC003E000E039C01F8000C001F00F
      DC1F80008001F003DFFF00000001E003DC1F00000000C007C01F00000001800F
      DC1F00000003803F07E180010007C07F07E98007800F81FF07E5C00FE01F0FFF
      FFE0E01FF83F1FFFFFFEF87FFE7F3FFFFFFFFFFF8FFF80FFFFFFE27F00FF007F
      FFFFE23F001F007FFFFFE21F000F007CF00FE20F00070000F00FE20700070000
      F00FE20300030000F00FE20100030000F00FE20300018000F00FE2070001FE00
      F00FE20F0001FE00F00FE21F0007FE00FFFFE23F000FFC00FFFFE27F800FFE00
      FFFFFFFFC00FFE00FFFFFFFFE7CFFE7CFFFFF800FFFFFFFFFFFFF800FFFFFFFF
      007F0000FFFFFFFF007F0000FC3FFFFF007F0000F00FF18F007F0000F00FF18F
      000B0000E007F18F00090000E007F18F00080000E007F18F0009000FE007F18F
      000B000FF00FF18F007F000FF00FF18F007F000FFC3FFFFF007F000FFFFFFFFF
      007F000FFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFC003C003C00301FF
      80018001800101FF80018001800101FF80018001800001FF80018001800001FF
      800180018001FF40800180018001FE40800180018001FC40800180018001FE40
      800180018001FF4080018001800101FF80018001800101FF80018001000101FF
      C003C003000301FFFFFFFFFF3FFF01FFFFFFFFFFFFFFFFFFC003C003C003C003
      8001800180018001800180018001800180018001800180018001800180018001
      8001800180018001800180018001800180018001800180018001800180018001
      8001800180018001800180018001800180018001800180018001800180018001
      C003C003C003C003FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC003C003C003C003
      8001800180018001800180018001800180018001800180018001800180018001
      8001800180018001800180018001800180018001800180018001800180018001
      8001800180018001800180018001800180018001800180018001800180018001
      C003C003C003C003FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC003C7FFEFFFC003
      8001C700C7FF80018001C700833F80018001C7FF013F80018001C703C7FF8001
      8001C703C70F80018001C7FFC70F80018001C70FC7FF80018001C70FC7038001
      8001C7FFC70380018001013FC7FF80018001833FC70080018001C7FFC7008001
      C003EFFFC7FFC003FFFFFFFFFFFFFFFFFC01FFFFFFFFFFFFFC01DFFF000F000F
      E0019FFF000F000FE0019FFFFFFFFFFF00019FFFEE07DE0700018FBFCE07CE07
      00018F9F820706070001878F03FF03FF0001C007820006000001C003CE00CE00
      0001E001EE00DE000001F003FFFFFFFF000FFC07000F000F000FFF8F000F000F
      007FFF9FFFFFFFFF007FFFBFFFFFFFFFDC1FDC1F80018001C01FC01F00000000
      DC1FDC1F00000000DFFFDFFF00000000DC1FDC1F00000000C01FC01F00000000
      DC1FDC1F00000000DFFFDFFF00000000DC1FDC1F00000000C01FC01F00000000
      DC13DC1F0000000007F307E40000000007C007E00000000007C007F100000000
      FFF3FFE080818101FFF3FFE480818101FFFFFFFFFFFFFE00C003FE4FC003FE00
      8001FE4F8001FE008001FE4F8001FE008001FE4F8001FC008001FE4F80010000
      8001F84F800100008001E04F800100008001E04F800100008001C04F80010001
      8001C04F800100038001C04F8001003F8001E04F8001007F8001E0038001007F
      C003F803C00300FFFFFFFFFFFFFF01FFC07FFC3FF8FFFFFFE007F81FF01F9FFF
      F003F00FE003E801F801E007C000D801FC01C00380008FFFFC1180018000FFFF
      8C3D000080008FFF043F00008000D801220F00008000E801F10F000080009FFF
      80FF80018001FFFF01FFC0038003DFFF21FFE007C007D801F1FFF00FE01F9801
      F8FFF81FF01FDFFFFDFFFC3FF93FFFFFB731FFF7FFFBFFFFB416FFF3FFF30FF3
      8400FFC1FFE00061B416FFC0FFC00001CF31FFC1FFE00003FFFFCFF3CFF30003
      E7FFC7F7C7FB0003E3FFE3FFE3FF0001F11FF11FF11F0001F80FF80FF80F0001
      F807F807F8070000F807F807F8070000F807F807F8070007F807F807F8070007
      FC0FFC0FFC0F807FFE1FFE1FFE1F80FFFC7FF801C0019FFFF87FF80180010FFF
      FB27F801800107FFFB43F801800183FFF85B00018001C1FFFC1B00018001E10F
      FE0300018001F003FE0700018001FC01FC3F00018001FC01F83F00018001F800
      F03F00038003F800E23F00078003F800E63F003F8003FC01EE3F003F8003FC01
      FE7F007FC007FE03FEFF00FFF83FFF8FC001FE7FF81FF81FC001F07FE007E007
      8001C001C003C003C001C00180018001C001C00180018001C001C00100000000
      C001C00100000000C001C00100000000C001C00100000000C001C00100000000
      C001C00100000000C001C00180018001C001C00180018001C003C001C003C003
      C007F001E007E007C00FFC7FF81FF81FFFFF80FFFF01F33FC007007FFE00E007
      8003003FFE00C0008003000FF000800180030007E000000080030000E0000000
      80030000E00000008003000080008000800380000001E0018003FE00000FF003
      8003FE00000FF01F8003FE00001FE03F8003FE00007FE03F8003FE00007FC03F
      C007FE01007FC07FFFFFFE0380FFF8FFC003800380038003C003000300010001
      C003000100010001C003000100010001C003000100010001C003000000010001
      C003000000010001C003000000010001C003000100070007C003000000070007
      C0038003800F800FC003C3C7C1FFC3FFC007FF87FDFFFFFFC00FFF8FFFFFFFFF
      C01FFE1FFFFFFFFFC03FF87FFFFFFFFF00000000000000000000000000000000
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
    object N1: TMenuItem
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
    object N2: TMenuItem
      Caption = '-'
    end
    object SelectforCompareMenuItem: TMenuItem
      Action = ToolsSelectForCompareAction
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object Properties1: TMenuItem
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
    object NewOpen1: TMenuItem
      Action = PopupMenuStandardAction
    end
    object Print1: TMenuItem
      Action = PopupMenuPrintAction
    end
    object Directory1: TMenuItem
      Action = PopupMenuDirectoryAction
    end
    object Indent1: TMenuItem
      Action = PopupMenuIndentAction
    end
    object Sort1: TMenuItem
      Action = PopupMenuSortAction
    end
    object Case1: TMenuItem
      Action = PopupMenuCaseAction
    end
    object UndoandRedo1: TMenuItem
      Action = PopupMenuCommandAction
    end
    object Search1: TMenuItem
      Action = PopupMenuSearchAction
    end
    object Mode1: TMenuItem
      Action = PopupMenuModeAction
    end
    object ools1: TMenuItem
      Action = PopupMenuToolsAction
    end
    object Macro1: TMenuItem
      Action = PopupMenuMacroAction
    end
    object Document1: TMenuItem
      Action = PopupMenuDocumentAction
    end
  end
end
