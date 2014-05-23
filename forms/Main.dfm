object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'EditBone'
  ClientHeight = 560
  ClientWidth = 1100
  Color = clWindow
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
    DoubleBuffered = True
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
    ParentColor = True
    ParentDoubleBuffered = False
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
      ParentBackground = True
      ParentShowHint = False
      ShowHint = True
      Spacing = 1
    end
    object EncodingComboBox: TBCComboBox
      Left = 834
      Top = 2
      Width = 130
      Height = 22
      Align = alRight
      Style = csOwnerDrawFixed
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
        Height = 22
        Align = alRight
        Style = csOwnerDrawFixed
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
    DoubleBuffered = False
    Padding.Left = 2
    Padding.Top = 2
    Padding.Right = 2
    ParentColor = True
    ParentDoubleBuffered = False
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
      ParentBackground = True
      ParentFont = False
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
      Color = clWindow
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
      Color = clWindow
      DoubleBuffered = False
      Padding.Top = 2
      Padding.Right = 3
      Padding.Bottom = 3
      ParentDoubleBuffered = False
      TabOrder = 2
    end
  end
  object ActionManager: TActionManager
    ActionBars = <
      item
        Items = <
          item
            Items = <
              item
                Action = FileNewAction
                ImageIndex = 66
                ShortCut = 16462
              end
              item
                Action = FileOpenAction
                ImageIndex = 135
                ShortCut = 16463
              end
              item
                Action = FileReopenAction
                ImageIndex = 162
              end
              item
                Caption = '-'
              end
              item
                Action = FileSaveAction
                ImageIndex = 167
                ShortCut = 16467
              end
              item
                Action = FileSaveAsAction
                ImageIndex = 169
                ShortCut = 49235
              end
              item
                Action = FileSaveAllAction
                ImageIndex = 168
                ShortCut = 24659
              end
              item
                Action = FileCloseAction
                ImageIndex = 85
                ShortCut = 16499
              end
              item
                Action = FileCloseAllAction
                ImageIndex = 86
              end
              item
                Action = FileCloseAllOtherPagesAction
                ImageIndex = 87
                ShortCut = 24691
              end
              item
                Caption = '-'
              end
              item
                Action = FilePrintAction
                ImageIndex = 150
                ShortCut = 16464
              end
              item
                Action = FilePrintPreviewAction
                ImageIndex = 148
              end
              item
                Caption = '-'
              end
              item
                Action = FileExitAction
                ImageIndex = 76
                ShortCut = 32883
              end>
            Caption = '&File'
          end
          item
            Items = <
              item
                Action = EditUndoAction
                ImageIndex = 223
                ShortCut = 16474
              end
              item
                Action = EditRedoAction
                ImageIndex = 160
                ShortCut = 24666
              end
              item
                Caption = '-'
              end
              item
                Action = EditCutAction
                ImageIndex = 43
                ShortCut = 16472
              end
              item
                Action = EditCopyAction
                ImageIndex = 40
                ShortCut = 16451
              end
              item
                Action = EditPasteAction
                ImageIndex = 142
                ShortCut = 16470
              end
              item
                Action = EditSelectAllAction
                ImageIndex = 172
                ShortCut = 16449
              end
              item
                Caption = '-'
              end
              item
                Items = <
                  item
                    Action = EditInsertLineAction
                    ImageIndex = 109
                    ShortCut = 16397
                  end
                  item
                    Action = EditInsertTagAction
                    ImageIndex = 207
                    ShortCut = 24660
                  end
                  item
                    Action = EditInsertDateTimeAction
                    ImageIndex = 55
                    ShortCut = 41028
                  end>
                Action = EditInsertAction
                ImageIndex = 0
                UsageCount = 1
              end
              item
                Items = <
                  item
                    Action = EditDeleteLineAction
                    ImageIndex = 61
                    ShortCut = 16473
                  end
                  item
                    Action = EditDeleteEOLAction
                    ImageIndex = 60
                    ShortCut = 24665
                  end
                  item
                    Action = EditDeleteWordAction
                    ImageIndex = 63
                    ShortCut = 16468
                  end
                  item
                    Caption = '-'
                  end
                  item
                    Action = EditRemoveWhiteSpaceAction
                    ImageIndex = 59
                  end>
                Action = EditDeleteAction
                ImageIndex = 58
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
                    ImageIndex = 100
                    ShortCut = 24649
                  end
                  item
                    Action = EditDecreaseIndentAction
                    ImageIndex = 101
                    ShortCut = 24661
                  end>
                Action = EditIndentAction
                ImageIndex = 99
                UsageCount = 1
              end
              item
                Items = <
                  item
                    Action = EditSortAscAction
                    ImageIndex = 180
                    ShortCut = 24641
                  end
                  item
                    Action = EditSortDescAction
                    Caption = '&Descending'
                    ImageIndex = 181
                    ShortCut = 24644
                  end>
                Action = EditSortAction
                ImageIndex = 178
                UsageCount = 1
              end
              item
                Caption = '-'
              end
              item
                Action = EditToggleCaseAction
                ImageIndex = 25
                ShortCut = 24643
              end>
            Caption = '&Edit'
          end
          item
            Items = <
              item
                Action = SearchAction
                ImageIndex = 81
                ShortCut = 16454
              end
              item
                Action = SearchReplaceAction
                ImageIndex = 163
                ShortCut = 16466
              end
              item
                Action = SearchFindInFilesAction
                ImageIndex = 82
                ShortCut = 24646
              end
              item
                Caption = '-'
              end
              item
                Action = SearchFindNextAction
                ImageIndex = 84
                ShortCut = 114
              end
              item
                Action = SearchFindPreviousAction
                ImageIndex = 83
                ShortCut = 8306
              end
              item
                Caption = '-'
              end
              item
                Action = SearchToggleBookmarkAction
                ImageIndex = 21
                ShortCut = 16497
              end
              item
                Items = <
                  item
                    Action = ToggleBookmarks1Action
                    ImageIndex = 12
                    ShortCut = 24625
                  end
                  item
                    Action = ToggleBookmarks2Action
                    ImageIndex = 13
                    ShortCut = 24626
                  end
                  item
                    Action = ToggleBookmarks3Action
                    ImageIndex = 14
                    ShortCut = 24627
                  end
                  item
                    Action = ToggleBookmarks4Action
                    ImageIndex = 15
                    ShortCut = 24628
                  end
                  item
                    Action = ToggleBookmarks5Action
                    ImageIndex = 16
                    ShortCut = 24629
                  end
                  item
                    Action = ToggleBookmarks6Action
                    ImageIndex = 17
                    ShortCut = 24630
                  end
                  item
                    Action = ToggleBookmarks7Action
                    ImageIndex = 18
                    ShortCut = 24631
                  end
                  item
                    Action = ToggleBookmarks8Action
                    ImageIndex = 19
                    ShortCut = 24632
                  end
                  item
                    Action = ToggleBookmarks9Action
                    ImageIndex = 20
                    ShortCut = 24633
                  end>
                Action = SearchToggleBookmarksAction
                ImageIndex = 24
                UsageCount = 1
              end
              item
                Items = <
                  item
                    Action = GotoBookmarks1Action
                    ImageIndex = 12
                    ShortCut = 16433
                  end
                  item
                    Action = GotoBookmarks2Action
                    ImageIndex = 13
                    ShortCut = 16434
                  end
                  item
                    Action = GotoBookmarks3Action
                    ImageIndex = 14
                    ShortCut = 16435
                  end
                  item
                    Action = GotoBookmarks4Action
                    ImageIndex = 15
                    ShortCut = 16436
                  end
                  item
                    Action = GotoBookmarks5Action
                    ImageIndex = 16
                    ShortCut = 16437
                  end
                  item
                    Action = GotoBookmarks6Action
                    ImageIndex = 17
                    ShortCut = 16438
                  end
                  item
                    Action = GotoBookmarks7Action
                    ImageIndex = 18
                    ShortCut = 16439
                  end
                  item
                    Action = GotoBookmarks8Action
                    ImageIndex = 19
                    ShortCut = 16440
                  end
                  item
                    Action = GotoBookmarks9Action
                    ImageIndex = 20
                    ShortCut = 16441
                  end>
                Action = SearchGotoBookmarksAction
                Caption = '&Go to bookmarks'
                ImageIndex = 23
                UsageCount = 1
              end
              item
                Action = SearchClearBookmarksAction
                ImageIndex = 22
              end
              item
                Caption = '-'
              end
              item
                Action = SearchGotoLineAction
                ImageIndex = 97
                ShortCut = 16455
              end>
            Caption = '&Search'
          end
          item
            Items = <
              item
                Action = ViewOpenDirectoryAction
                ImageIndex = 215
                ShortCut = 16452
              end
              item
                Action = ViewCloseDirectoryAction
                ImageIndex = 216
                ShortCut = 24644
              end
              item
                Action = ViewEditDirectoryAction
                ImageIndex = 217
                ShortCut = 24645
              end
              item
                Action = ViewSearchForFilesAction
                ImageIndex = 65
                ShortCut = 16507
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
                ImageIndex = 117
              end
              item
                Action = ViewStyleAction
                ImageIndex = 186
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
                ImageIndex = 194
                ShortCut = 16393
              end
              item
                Action = ViewPreviousPageAction
                ImageIndex = 193
                ShortCut = 24585
              end>
            Caption = '&View'
          end
          item
            Items = <
              item
                Action = ToolsWordCountAction
                ImageIndex = 70
              end
              item
                Action = FormatXMLAction
                ImageIndex = 91
              end
              item
                Caption = '-'
              end
              item
                Items = <
                  item
                    Action = MacroRecordPauseAction
                    ImageIndex = 158
                    ShortCut = 24658
                  end
                  item
                    Action = MacroStopAction
                    ImageIndex = 185
                    ShortCut = 24659
                  end
                  item
                    Action = MacroPlaybackAction
                    ImageIndex = 146
                    ShortCut = 24656
                  end
                  item
                    Caption = '-'
                  end
                  item
                    Action = MacroOpenAction
                    ImageIndex = 128
                  end
                  item
                    Action = MacroSaveAsAction
                    ImageIndex = 129
                  end>
                Action = MacroMenuAction
                ImageIndex = 127
                UsageCount = 1
              end
              item
                Caption = '-'
              end
              item
                Action = ViewInBrowserAction
                ImageIndex = 236
                ShortCut = 32834
              end>
            Caption = '&Document'
          end
          item
            Items = <
              item
                Action = ToolsOptionsAction
                ImageIndex = 136
              end
              item
                Caption = '-'
              end
              item
                Action = CompareFilesAction
                ImageIndex = 31
              end
              item
                Action = ToolsConvertAction
                ImageIndex = 39
              end
              item
                Action = ToolsDuplicateCheckerAction
                ImageIndex = 73
              end
              item
                Action = ToolsMapVirtualDrivesAction
                ImageIndex = 248
              end
              item
                Action = ToolsUnicodeCharacterMapAction
                ImageIndex = 116
              end
              item
                Caption = '-'
              end
              item
                Action = ToolsLanguageEditorAction
                ImageIndex = 117
              end>
            Caption = '&Tools'
          end
          item
            Items = <
              item
                Action = HelpCheckForUpdatesMenuAction
                ImageIndex = 72
              end
              item
                Caption = '-'
              end
              item
                Action = HelpHomeAction
                ImageIndex = 98
              end
              item
                Caption = '-'
              end
              item
                Action = HelpAboutAction
                ImageIndex = 107
              end>
            Caption = '&Help'
          end>
        ActionBar = ActionMainMenuBar
      end
      item
        Items = <
          item
            Action = FileNewAction
            ImageIndex = 66
            ShowCaption = False
            ShortCut = 16462
          end
          item
            Action = FileOpenAction
            ImageIndex = 135
            ShowCaption = False
            ShortCut = 16463
          end
          item
            Caption = '-'
          end
          item
            Action = FileSaveAction
            ImageIndex = 167
            ShowCaption = False
            ShortCut = 16467
          end
          item
            Action = FileSaveAsAction
            ImageIndex = 169
            ShowCaption = False
            ShortCut = 49235
          end
          item
            Action = FileSaveAllAction
            ImageIndex = 168
            ShowCaption = False
            ShortCut = 24659
          end
          item
            Action = FileCloseAction
            ImageIndex = 85
            ShowCaption = False
            ShortCut = 16499
          end
          item
            Action = FileCloseAllAction
            Caption = 'Close All'
            ImageIndex = 86
            ShowCaption = False
          end
          item
            Caption = '-'
          end
          item
            Action = FilePrintAction
            ImageIndex = 150
            ShowCaption = False
            ShortCut = 16464
          end
          item
            Action = FilePrintPreviewAction
            ImageIndex = 148
            ShowCaption = False
          end
          item
            Caption = '-'
          end
          item
            Action = ViewOpenDirectoryAction
            Caption = 'Open Direc&tory'
            ImageIndex = 215
            ShowCaption = False
            ShortCut = 16452
          end
          item
            Action = ViewCloseDirectoryAction
            Caption = 'Close Director&y'
            ImageIndex = 216
            ShowCaption = False
            ShortCut = 24644
          end
          item
            Action = ViewEditDirectoryAction
            ImageIndex = 217
            ShowCaption = False
            ShortCut = 24645
          end
          item
            Caption = '-'
          end
          item
            Action = EditIncreaseIndentAction
            ImageIndex = 100
            ShowCaption = False
            ShortCut = 24649
          end
          item
            Action = EditDecreaseIndentAction
            ImageIndex = 101
            ShowCaption = False
            ShortCut = 24661
          end
          item
            Caption = '-'
          end
          item
            Action = EditSortAscAction
            Caption = 'Sort Ascendin&g'
            ImageIndex = 180
            ShowCaption = False
            ShortCut = 24641
          end
          item
            Action = EditSortDescAction
            Caption = 'Sort Descending'
            ImageIndex = 181
            ShowCaption = False
            ShortCut = 24644
          end
          item
            Caption = '-'
          end
          item
            Action = EditToggleCaseAction
            Caption = 'Togg&le Case'
            ImageIndex = 25
            ShowCaption = False
            ShortCut = 24643
          end
          item
            Caption = '-'
          end
          item
            Action = EditUndoAction
            ImageIndex = 223
            ShowCaption = False
            ShortCut = 16474
          end
          item
            Action = EditRedoAction
            ImageIndex = 160
            ShowCaption = False
            ShortCut = 24666
          end
          item
            Caption = '-'
          end
          item
            Action = SearchAction
            Caption = 'Searc&h...'
            ImageIndex = 81
            ShowCaption = False
            ShortCut = 16454
          end
          item
            Action = SearchReplaceAction
            Caption = 'Replace...'
            ImageIndex = 163
            ShowCaption = False
            ShortCut = 16466
          end
          item
            Action = SearchFindInFilesAction
            ImageIndex = 82
            ShowCaption = False
            ShortCut = 24646
          end
          item
            Caption = '-'
          end
          item
            Action = ViewWordWrapAction
            CommandStyle = csCheckBox
            ImageIndex = 237
            ShowCaption = False
            CommandProperties.Width = -1
          end
          item
            Action = ViewLineNumbersAction
            Caption = 'Line Nu&mbers'
            CommandStyle = csCheckBox
            ImageIndex = 119
            ShowCaption = False
            CommandProperties.Width = -1
          end
          item
            Action = ViewSpecialCharsAction
            Caption = 'Special Chars'
            CommandStyle = csCheckBox
            ImageIndex = 144
            ShowCaption = False
            CommandProperties.Width = -1
          end
          item
            Action = ViewSelectionModeAction
            Caption = 'Column Mode'
            CommandStyle = csCheckBox
            ImageIndex = 29
            ShowCaption = False
            CommandProperties.Width = -1
          end
          item
            Caption = '-'
          end
          item
            Action = CompareFilesAction
            Caption = 'Compare Files...'
            ImageIndex = 31
            ShowCaption = False
          end
          item
            Caption = '-'
          end
          item
            Action = MacroRecordPauseAction
            Caption = 'Record'
            ImageIndex = 158
            ShowCaption = False
            ShortCut = 24658
          end
          item
            Action = MacroStopAction
            Caption = 'Stop'
            ImageIndex = 185
            ShowCaption = False
            ShortCut = 24659
          end
          item
            Action = MacroPlaybackAction
            Caption = 'Play&back'
            ImageIndex = 146
            ShowCaption = False
            ShortCut = 24656
          end
          item
            Action = MacroOpenAction
            Caption = 'Open...'
            ImageIndex = 128
            ShowCaption = False
          end
          item
            Action = MacroSaveAsAction
            Caption = 'Save as...'
            ImageIndex = 129
            ShowCaption = False
          end
          item
            Caption = '-'
          end
          item
            Action = ToolsWordCountAction
            Caption = 'Line, Word and Character Count...'
            ImageIndex = 70
            ShowCaption = False
          end
          item
            Action = ViewInBrowserAction
            Caption = 'View in Browser'
            ImageIndex = 236
            ShowCaption = False
            ShortCut = 32834
          end>
        ActionBar = ActionToolBar
      end>
    Images = ImagesDataModule.ImageList
    Left = 154
    Top = 72
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
      ImageIndex = 66
      ShortCut = 16462
      OnExecute = FileNewActionExecute
    end
    object FileOpenAction: TAction
      Category = '&File'
      Caption = '&Open...'
      Hint = 'Open an existing document'
      ImageIndex = 135
      ShortCut = 16463
      OnExecute = FileOpenActionExecute
    end
    object FileReopenAction: TAction
      Category = '&File'
      Caption = '&Reopen'
      ImageIndex = 162
      OnExecute = FileReopenActionExecute
    end
    object FileSaveAction: TAction
      Category = '&File'
      Caption = '&Save'
      Hint = 'Save the active document'
      ImageIndex = 167
      ShortCut = 16467
      OnExecute = FileSaveActionExecute
    end
    object FileSaveAsAction: TAction
      Category = '&File'
      Caption = 'S&ave as...'
      Hint = 'Save the active document with a new name'
      ImageIndex = 169
      ShortCut = 49235
      OnExecute = FileSaveAsActionExecute
    end
    object FileSaveAllAction: TAction
      Category = '&File'
      Caption = 'Sa&ve all'
      Hint = 'Save all documents'
      ImageIndex = 168
      ShortCut = 24659
      OnExecute = FileSaveAllActionExecute
    end
    object FileCloseAction: TAction
      Category = '&File'
      Caption = '&Close'
      Hint = 'Close the active document'
      ImageIndex = 85
      ShortCut = 16499
      OnExecute = FileCloseActionExecute
    end
    object FileCloseAllAction: TAction
      Category = '&File'
      Caption = 'C&lose all'
      Hint = 'Close all open files'
      ImageIndex = 86
      OnExecute = FileCloseAllActionExecute
    end
    object FileCloseAllOtherPagesAction: TAction
      Category = '&File'
      Caption = 'Clos&e all other'
      Hint = 'Close all other pages'
      ImageIndex = 87
      ShortCut = 24691
      OnExecute = FileCloseAllOtherPagesActionExecute
    end
    object FilePrintAction: TAction
      Category = '&File'
      Caption = '&Print...'
      Hint = 'Print the active document'
      ImageIndex = 150
      ShortCut = 16464
      OnExecute = FilePrintActionExecute
    end
    object FilePrintPreviewAction: TAction
      Category = '&File'
      Caption = 'Pr&int preview...'
      Hint = 'Preview the active document'
      ImageIndex = 148
      OnExecute = FilePrintPreviewActionExecute
    end
    object FileExitAction: TAction
      Category = '&File'
      Caption = 'E&xit'
      Hint = 'Quit the application'
      ImageIndex = 76
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
      ImageIndex = 223
      ShortCut = 16474
      OnExecute = EditUndoActionExecute
    end
    object EditRedoAction: TAction
      Category = '&Edit'
      Caption = '&Redo'
      Hint = 'Redo the previously undone action'
      ImageIndex = 160
      ShortCut = 24666
      OnExecute = EditRedoActionExecute
    end
    object EditCutAction: TAction
      Category = '&Edit'
      Caption = '&Cut'
      Hint = 'Cut the selection and put it on the Clipboard'
      ImageIndex = 43
      ShortCut = 16472
      OnExecute = EditCutActionExecute
    end
    object EditCopyAction: TAction
      Category = '&Edit'
      Caption = 'C&opy'
      Hint = 'Copy the selection and put it on the Clipboard'
      ImageIndex = 40
      ShortCut = 16451
      OnExecute = EditCopyActionExecute
    end
    object EditPasteAction: TAction
      Category = '&Edit'
      Caption = '&Paste'
      Hint = 'Insert Clipboard contents'
      ImageIndex = 142
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
      ImageIndex = 81
      ShortCut = 16454
      OnExecute = SearchActionExecute
    end
    object SearchReplaceAction: TAction
      Category = '&Search'
      Caption = '&Replace...'
      Hint = 'Replace the specified text with different text'
      ImageIndex = 163
      ShortCut = 16466
      OnExecute = SearchReplaceActionExecute
    end
    object SearchFindInFilesAction: TAction
      Category = '&Search'
      Caption = '&Find in files...'
      Hint = 'Search for a string in multiple files'
      ImageIndex = 82
      ShortCut = 24646
      OnExecute = SearchFindInFilesActionExecute
    end
    object SearchFindNextAction: TAction
      Category = '&Search'
      Caption = 'Find &next'
      Hint = 'Find the next matching text'
      ImageIndex = 84
      ShortCut = 114
      OnExecute = SearchFindNextActionExecute
    end
    object SearchFindPreviousAction: TAction
      Category = '&Search'
      Caption = 'Find &previous'
      Hint = 'Find the previous matching text'
      ImageIndex = 83
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
      Caption = '&Open directory...'
      Hint = 'Open a new directory'
      ImageIndex = 215
      ShortCut = 16452
      OnExecute = ViewOpenDirectoryActionExecute
    end
    object ViewCloseDirectoryAction: TAction
      Category = '&View'
      Caption = '&Close directory'
      Hint = 'Close the active directory'
      ImageIndex = 216
      ShortCut = 24644
      OnExecute = ViewCloseDirectoryActionExecute
    end
    object ViewEditDirectoryAction: TAction
      Category = '&View'
      Caption = '&Edit directory...'
      Hint = 'Edit the active directory'
      ImageIndex = 217
      ShortCut = 24645
      OnExecute = ViewEditDirectoryActionExecute
    end
    object ViewSearchForFilesAction: TAction
      Category = '&View'
      Caption = '&Files...'
      Hint = 'Search files from the selected directory and its subdirectories'
      ImageIndex = 65
      ShortCut = 16507
      OnExecute = ViewSearchForFilesActionExecute
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
      Caption = 'Minim&ap'
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
      Caption = '&Split'
      Hint = 'Split the document'
      OnExecute = ViewSplitActionExecute
    end
    object ViewStatusBarAction: TAction
      Category = '&View'
      Caption = 'S&tatus bar'
      Checked = True
      Hint = 'Show or hide the status bar'
      OnExecute = ViewStatusBarActionExecute
    end
    object ViewToolbarAction: TAction
      Category = '&View'
      Caption = 'Too&lbar'
      Checked = True
      Hint = 'Show or hide the toolbar'
      OnExecute = ViewToolbarActionExecute
    end
    object ViewXMLTreeAction: TAction
      Category = '&View'
      Caption = '&XML tree'
      Hint = 'Show or hide the XML tree'
      OnExecute = ViewXMLTreeActionExecute
    end
    object ViewLanguageAction: TAction
      Category = '&View'
      Caption = 'La&nguage'
      ImageIndex = 117
      OnExecute = DummyActionExecute
    end
    object ViewStyleAction: TAction
      Category = '&View'
      Caption = 'St&yle'
      ImageIndex = 186
      OnExecute = DummyActionExecute
    end
    object ViewNextPageAction: TAction
      Category = '&View'
      Caption = 'Next &page'
      Hint = 'Go to next page'
      ImageIndex = 194
      ShortCut = 16393
      OnExecute = ViewNextPageActionExecute
    end
    object ViewPreviousPageAction: TAction
      Category = '&View'
      Caption = 'P&revious page'
      Hint = 'Go to previous page'
      ImageIndex = 193
      ShortCut = 24585
      OnExecute = ViewPreviousPageActionExecute
    end
    object ViewWordWrapAction: TAction
      Category = '&View'
      Caption = '&Word wrap'
      Hint = 'Toggle word wrap'
      ImageIndex = 237
      OnExecute = ViewWordWrapActionExecute
    end
    object ViewLineNumbersAction: TAction
      Category = '&View'
      Caption = 'Line num&bers'
      Checked = True
      Hint = 'Toggle line numbers'
      ImageIndex = 119
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
      Caption = '&Check for updates'
      Hint = 'Check for updates'
      ImageIndex = 72
      OnExecute = HelpCheckForUpdatesMenuActionExecute
    end
    object HelpHomeAction: TAction
      Category = '&Help'
      Caption = '&Visit homepage'
      Hint = 'Visit EditBone homepage - http://www.bonecode.com/'
      ImageIndex = 98
      OnExecute = HelpHomeActionExecute
    end
    object HelpAboutAction: TAction
      Category = '&Help'
      Caption = '&About EditBone'
      Hint = 'Display information about EditBone'
      ImageIndex = 107
      OnExecute = HelpAboutActionExecute
    end
    object ViewSpecialCharsAction: TAction
      Category = '&View'
      Caption = 'Spec&ial chars'
      GroupIndex = 1
      Hint = 'Toggle special characters'
      ImageIndex = 144
      OnExecute = ViewSpecialCharsActionExecute
    end
    object OutputDblClickAction: TAction
      Caption = 'OutputDblClickAction'
      OnExecute = OutputDblClickActionExecute
    end
    object FileTreeViewClickAction: TAction
      Caption = 'FileTreeViewClickAction'
      OnExecute = FileTreeViewClickActionExecute
    end
    object FileTreeViewDblClickAction: TAction
      Caption = 'FileTreeViewDblClickAction'
      OnExecute = FileTreeViewDblClickActionExecute
    end
    object CompareFilesAction: TAction
      Category = '&Tools'
      Caption = '&Compare files...'
      Hint = 'Compare files'
      ImageIndex = 31
      OnExecute = CompareFilesActionExecute
    end
    object DocumentMenuAction: TAction
      Category = '&Document'
      Caption = '&Document'
      OnExecute = DummyActionExecute
    end
    object ToolsWordCountAction: TAction
      Category = '&Document'
      Caption = '&Line, word, and character count...'
      Hint = 'Line, word and character count'
      ImageIndex = 70
      OnExecute = ToolsWordCountActionExecute
    end
    object FormatXMLAction: TAction
      Category = '&Document'
      Caption = '&Format XML'
      Hint = 'Format XML'
      ImageIndex = 91
      OnExecute = FormatXMLActionExecute
    end
    object ViewInBrowserAction: TAction
      Category = '&Document'
      Caption = '&View in browser'
      Hint = 'View current document in default browser'
      ImageIndex = 236
      ShortCut = 32834
      OnExecute = ViewInBrowserActionExecute
    end
    object ViewSelectionModeAction: TAction
      Category = '&View'
      Caption = 'Selection &mode'
      Hint = 
        'Toggle selection mode. Also pressing Alt on editor will toggle s' +
        'election mode.'
      ImageIndex = 29
      OnExecute = ViewSelectionModeActionExecute
    end
    object SearchToggleBookmarkAction: TAction
      Category = '&Search'
      Caption = '&Toggle bookmark'
      Hint = 
        'Set or clear bookmark at current line. Bookmarks can be also set' +
        ' by using Ctrl+Shift+0..9. Go to bookmark by using Ctrl+0..9.'
      ImageIndex = 21
      ShortCut = 16497
      OnExecute = SearchToggleBookmarkActionExecute
    end
    object EditSelectAllAction: TAction
      Category = '&Edit'
      Caption = '&Select all'
      Hint = 'Select all'
      ImageIndex = 172
      ShortCut = 16449
      OnExecute = EditSelectAllActionExecute
    end
    object EditInsertAction: TAction
      Category = '&Insert'
      Caption = '&Insert'
      ImageIndex = 0
      OnExecute = DummyActionExecute
    end
    object EditInsertLineAction: TAction
      Category = '&Insert'
      Caption = '&Insert line'
      Hint = 'Insert line'
      ImageIndex = 109
      ShortCut = 16397
      OnExecute = EditInsertLineActionExecute
    end
    object EditDeleteAction: TAction
      Category = '&Delete'
      Caption = 'D&elete'
      ImageIndex = 58
      OnExecute = DummyActionExecute
    end
    object EditDeleteEOLAction: TAction
      Category = '&Delete'
      Caption = '&End of line'
      Hint = 'Delete end of line'
      ImageIndex = 60
      ShortCut = 24665
      OnExecute = EditDeleteEOLActionExecute
    end
    object EditDeleteLineAction: TAction
      Category = '&Delete'
      Caption = '&Line'
      Hint = 'Delete line'
      ImageIndex = 61
      ShortCut = 16473
      OnExecute = EditDeleteLineActionExecute
    end
    object EditDeleteWordAction: TAction
      Category = '&Delete'
      Caption = '&Word'
      Hint = 'Delete word'
      ImageIndex = 63
      ShortCut = 16468
      OnExecute = EditDeleteWordActionExecute
    end
    object EditIndentAction: TAction
      Category = '&Indent'
      Caption = 'I&ndent'
      ImageIndex = 99
      OnExecute = DummyActionExecute
    end
    object EditIncreaseIndentAction: TAction
      Category = '&Indent'
      Caption = 'Increase'
      Hint = 'Increase indent'
      ImageIndex = 100
      SecondaryShortCuts.Strings = (
        'Tab')
      ShortCut = 24649
      OnExecute = EditIncreaseIndentActionExecute
    end
    object EditDecreaseIndentAction: TAction
      Category = '&Indent'
      Caption = '&Decrease'
      Hint = 'Decrease indent'
      ImageIndex = 101
      SecondaryShortCuts.Strings = (
        'Shift+Tab')
      ShortCut = 24661
      OnExecute = EditDecreaseIndentActionExecute
    end
    object EditSortAction: TAction
      Category = '&Sort'
      Caption = 'Sor&t'
      ImageIndex = 178
      OnExecute = DummyActionExecute
    end
    object EditSortAscAction: TAction
      Category = '&Sort'
      Caption = '&Ascending'
      Hint = 'Sort ascending'
      ImageIndex = 180
      ShortCut = 24641
      OnExecute = EditSortAscActionExecute
    end
    object EditSortDescAction: TAction
      Category = '&Sort'
      Caption = 'Descending'
      Hint = 'Sort descending'
      ImageIndex = 181
      ShortCut = 24644
      OnExecute = EditSortDescActionExecute
    end
    object EditToggleCaseAction: TAction
      Category = '&Edit'
      Caption = 'To&ggle case'
      Hint = 'Toggle case'
      ImageIndex = 25
      ShortCut = 24643
      OnExecute = EditToggleCaseActionExecute
    end
    object SearchToggleBookmarksAction: TAction
      Category = 'T&oggle Bookmarks'
      Caption = 'T&oggle bookmarks'
      ImageIndex = 24
      OnExecute = DummyActionExecute
    end
    object SearchGotoBookmarksAction: TAction
      Category = 'Go to Bookmarks'
      Caption = 'Go to bookmarks'
      ImageIndex = 23
      OnExecute = DummyActionExecute
    end
    object SearchClearBookmarksAction: TAction
      Category = '&Search'
      Caption = 'Clear &bookmarks'
      Hint = 'Clear all bookmarks'
      ImageIndex = 22
      OnExecute = SearchClearBookmarksActionExecute
    end
    object MacroMenuAction: TAction
      Category = '&Macro'
      Caption = '&Macro'
      ImageIndex = 127
      OnExecute = DummyActionExecute
    end
    object MacroRecordPauseAction: TAction
      Category = '&Macro'
      Caption = '&Record'
      Hint = 'Record or pause a macro'
      ImageIndex = 158
      ShortCut = 24658
      OnExecute = MacroRecordPauseActionExecute
    end
    object MacroStopAction: TAction
      Category = '&Macro'
      Caption = '&Stop'
      Hint = 'Stop the macro recording'
      ImageIndex = 185
      ShortCut = 24659
      OnExecute = MacroStopActionExecute
    end
    object MacroPlaybackAction: TAction
      Category = '&Macro'
      Caption = '&Playback'
      Hint = 'Playback the macro'
      ImageIndex = 146
      ShortCut = 24656
      OnExecute = MacroPlaybackActionExecute
    end
    object MacroOpenAction: TAction
      Category = '&Macro'
      Caption = '&Open...'
      Hint = 'Open an existing macro'
      ImageIndex = 128
      OnExecute = MacroOpenActionExecute
    end
    object MacroSaveAsAction: TAction
      Category = '&Macro'
      Caption = 'S&ave as...'
      Hint = 'Save the macro with a new name'
      ImageIndex = 129
      OnExecute = MacroSaveAsActionExecute
    end
    object ToolsSelectForCompareAction: TAction
      Category = '&Tools'
      Caption = 'Select for compare...'
      Hint = 'Select document for compare'
      ImageIndex = 31
      OnExecute = ToolsSelectForCompareActionExecute
    end
    object SelectStyleAction: TAction
      OnExecute = SelectStyleActionExecute
    end
    object ToolsConvertAction: TAction
      Category = '&Tools'
      Caption = 'C&onvert...'
      Hint = 'Convert between numerical units'
      ImageIndex = 39
      OnExecute = ToolsConvertActionExecute
    end
    object ToolsDuplicateCheckerAction: TAction
      Category = '&Tools'
      Caption = '&Duplicate checker...'
      Hint = 'Check duplicate text blocks'
      ImageIndex = 73
      OnExecute = ToolsDuplicateCheckerActionExecute
    end
    object ToolsUnicodeCharacterMapAction: TAction
      Category = '&Tools'
      Caption = '&Unicode character map...'
      Hint = 
        'Insert unicode characters to active document by double clicking ' +
        'a character'
      ImageIndex = 116
      OnExecute = ToolsUnicodeCharacterMapActionExecute
    end
    object ToolsLanguageEditorAction: TAction
      Category = '&Tools'
      Caption = '&Language editor...'
      Hint = 'Language editor'
      ImageIndex = 117
      OnExecute = ToolsLanguageEditorActionExecute
    end
    object ToolsOptionsAction: TAction
      Category = '&Tools'
      Caption = 'O&ptions...'
      Hint = 'Set options'
      ImageIndex = 136
      OnExecute = ToolsOptionsActionExecute
    end
    object SelectLanguageAction: TAction
      OnExecute = SelectLanguageActionExecute
    end
    object ToggleBookmarks1Action: TAction
      Tag = 1
      Category = 'T&oggle Bookmarks'
      Caption = 'Bookmark &1'
      ImageIndex = 12
      ShortCut = 24625
      OnExecute = ToggleBookmarksActionExecute
    end
    object GotoBookmarks1Action: TAction
      Tag = 1
      Category = 'Go to Bookmarks'
      Caption = 'Bookmark &1'
      ImageIndex = 12
      ShortCut = 16433
      OnExecute = GotoBookmarksActionExecute
    end
    object ToggleBookmarks2Action: TAction
      Tag = 2
      Category = 'T&oggle Bookmarks'
      Caption = 'Bookmark &2'
      ImageIndex = 13
      ShortCut = 24626
      OnExecute = ToggleBookmarksActionExecute
    end
    object ToggleBookmarks3Action: TAction
      Tag = 3
      Category = 'T&oggle Bookmarks'
      Caption = 'Bookmark &3'
      ImageIndex = 14
      ShortCut = 24627
      OnExecute = ToggleBookmarksActionExecute
    end
    object ToggleBookmarks4Action: TAction
      Tag = 4
      Category = 'T&oggle Bookmarks'
      Caption = 'Bookmark &4'
      ImageIndex = 15
      ShortCut = 24628
      OnExecute = ToggleBookmarksActionExecute
    end
    object ToggleBookmarks5Action: TAction
      Tag = 5
      Category = 'T&oggle Bookmarks'
      Caption = 'Bookmark &5'
      ImageIndex = 16
      ShortCut = 24629
      OnExecute = ToggleBookmarksActionExecute
    end
    object ToggleBookmarks6Action: TAction
      Tag = 6
      Category = 'T&oggle Bookmarks'
      Caption = 'Bookmark &6'
      ImageIndex = 17
      ShortCut = 24630
      OnExecute = ToggleBookmarksActionExecute
    end
    object ToggleBookmarks7Action: TAction
      Tag = 7
      Category = 'T&oggle Bookmarks'
      Caption = 'Bookmark &7'
      ImageIndex = 18
      ShortCut = 24631
      OnExecute = ToggleBookmarksActionExecute
    end
    object ToggleBookmarks8Action: TAction
      Tag = 8
      Category = 'T&oggle Bookmarks'
      Caption = 'Bookmark &8'
      ImageIndex = 19
      ShortCut = 24632
      OnExecute = ToggleBookmarksActionExecute
    end
    object ToggleBookmarks9Action: TAction
      Tag = 9
      Category = 'T&oggle Bookmarks'
      Caption = 'Bookmark &9'
      ImageIndex = 20
      ShortCut = 24633
      OnExecute = ToggleBookmarksActionExecute
    end
    object GotoBookmarks2Action: TAction
      Tag = 2
      Category = 'Go to Bookmarks'
      Caption = 'Bookmark &2'
      ImageIndex = 13
      ShortCut = 16434
      OnExecute = GotoBookmarksActionExecute
    end
    object GotoBookmarks3Action: TAction
      Tag = 3
      Category = 'Go to Bookmarks'
      Caption = 'Bookmark &3'
      ImageIndex = 14
      ShortCut = 16435
      OnExecute = GotoBookmarksActionExecute
    end
    object GotoBookmarks4Action: TAction
      Tag = 4
      Category = 'Go to Bookmarks'
      Caption = 'Bookmark &4'
      ImageIndex = 15
      ShortCut = 16436
      OnExecute = GotoBookmarksActionExecute
    end
    object GotoBookmarks5Action: TAction
      Tag = 5
      Category = 'Go to Bookmarks'
      Caption = 'Bookmark &5'
      ImageIndex = 16
      ShortCut = 16437
      OnExecute = GotoBookmarksActionExecute
    end
    object GotoBookmarks6Action: TAction
      Tag = 6
      Category = 'Go to Bookmarks'
      Caption = 'Bookmark &6'
      ImageIndex = 17
      ShortCut = 16438
      OnExecute = GotoBookmarksActionExecute
    end
    object GotoBookmarks7Action: TAction
      Tag = 7
      Category = 'Go to Bookmarks'
      Caption = 'Bookmark &7'
      ImageIndex = 18
      ShortCut = 16439
      OnExecute = GotoBookmarksActionExecute
    end
    object GotoBookmarks8Action: TAction
      Tag = 8
      Category = 'Go to Bookmarks'
      Caption = 'Bookmark &8'
      ImageIndex = 19
      ShortCut = 16440
      OnExecute = GotoBookmarksActionExecute
    end
    object GotoBookmarks9Action: TAction
      Tag = 9
      Category = 'Go to Bookmarks'
      Caption = 'Bookmark &9'
      ImageIndex = 20
      ShortCut = 16441
      OnExecute = GotoBookmarksActionExecute
    end
    object EditRemoveWhiteSpaceAction: TAction
      Category = '&Delete'
      Caption = 'W&hitespace'
      Hint = 'Remove all whitespace from selected text'
      ImageIndex = 59
      OnExecute = EditRemoveWhiteSpaceActionExecute
    end
    object FilePropertiesAction: TAction
      Category = '&File'
      Caption = 'Pr&operties'
      Hint = 'See the file properties'
      ImageIndex = 157
      OnExecute = FilePropertiesActionExecute
    end
    object SearchGotoLineAction: TAction
      Category = '&Search'
      Caption = 'Go to &line'
      Hint = 'Go to Line'
      ImageIndex = 97
      ShortCut = 16455
      OnExecute = SearchGotoLineActionExecute
    end
    object FileReopenClearAction: TAction
      Category = '&Reopen'
      Caption = '&Clear'
      ImageIndex = 58
      OnExecute = FileReopenClearActionExecute
    end
    object SelectReopenFileAction: TAction
      OnExecute = SelectReopenFileActionExecute
    end
    object EditInsertTagAction: TAction
      Category = '&Insert'
      Caption = '&HTML/XML tags...'
      Hint = 'Insert HTML/XML tags'
      ImageIndex = 207
      ShortCut = 24660
      OnExecute = EditInsertTagActionExecute
    end
    object EditInsertDateTimeAction: TAction
      Category = '&Insert'
      Caption = '&Date and time'
      Hint = 'Insert date and time'
      ImageIndex = 55
      ShortCut = 41028
      OnExecute = EditInsertDateTimeActionExecute
    end
    object FileSelectFromDirectoryAction: TAction
      Category = '&File'
      Caption = 'Select from directory'
      Hint = 'Select the file from the active directory'
      ImageIndex = 214
      OnExecute = FileSelectFromDirectoryActionExecute
    end
    object DirectorySearchFindInFilesAction: TAction
      Category = '&Search'
      Caption = '<directory find in files action>'
      OnExecute = DirectorySearchFindInFilesActionExecute
    end
    object ToolsMapVirtualDrivesAction: TAction
      Category = '&Tools'
      Caption = '&Map virtual drives...'
      ImageIndex = 248
      OnExecute = ToolsMapVirtualDrivesActionExecute
    end
    object FormatSQLAction: TAction
      Category = '&Document'
      Caption = 'Format SQL'
      Hint = 'Format SQL'
      ImageIndex = 91
      OnExecute = FormatSQLActionExecute
    end
  end
  object ApplicationEvents: TApplicationEvents
    OnActivate = ApplicationEventsActivate
    OnHint = ApplicationEventsHint
    OnMessage = ApplicationEventsMessage
    Left = 24
    Top = 188
  end
  object DocumentPopupMenu: TBCPopupMenu
    Images = ImagesDataModule.ImageList
    Left = 154
    Top = 134
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
    object SelectfromDirectory1: TMenuItem
      Action = FileSelectFromDirectoryAction
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
    Left = 26
    Top = 70
  end
  object DragDrop: TJvDragDrop
    DropTarget = Owner
    OnDrop = DragDropDrop
    Left = 24
    Top = 126
  end
  object HTMLErrorTimer: TTimer
    OnTimer = HTMLErrorTimerTimer
    Left = 154
    Top = 194
  end
  object Taskbar: TTaskbar
    TaskBarButtons = <>
    ProgressMaxValue = 100
    TabProperties = []
    Left = 408
    Top = 235
  end
end
