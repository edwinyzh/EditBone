unit EditBone.Forms.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BCCommon.Forms.Base, System.Actions, Vcl.ActnList, Vcl.AppEvnts, Vcl.Menus,
  sSkinProvider, BCComponents.SkinProvider, acTitleBar, BCComponents.TitleBar, sSkinManager, BCComponents.SkinManager,
  Vcl.ComCtrls, sStatusBar, BCControls.StatusBar, Vcl.ExtCtrls, sPanel, BCControls.Panel, sSplitter, BCControls.Splitter,
  sPageControl, BCControls.PageControl, BCCommon.Images, BCControls.SpeedButton, Vcl.Buttons, sSpeedButton,
  EditBone.Frames.Directory, EditBone.Frames.Document, EditBone.Frames.Output, VirtualTrees,
  System.Win.TaskbarCore, Vcl.Taskbar, Vcl.ActnMan, Vcl.ActnMenus, BCComponents.DragDrop,
  Vcl.PlatformDefaultStyleActnCtrls, Vcl.StdCtrls, JvAppInst, acPNG, acImage, System.ImageList, Vcl.ImgList,
  acAlphaImageList;

type
  TMainForm = class(TBCForm)
    ActionDirectorySearchFindInFiles: TAction;
    ActionDocument: TAction;
    ActionDocumentFormat: TAction;
    ActionDocumentFormatSQL: TAction;
    ActionDocumentFormatXML: TAction;
    ActionDocumentInfo: TAction;
    ActionDocumentViewInBrowser: TAction;
    ActionEdit: TAction;
    ActionEditCopy: TAction;
    ActionEditCut: TAction;
    ActionEditDelete: TAction;
    ActionEditDeleteEndOfLine: TAction;
    ActionEditDeleteLine: TAction;
    ActionEditDeleteWhitespace: TAction;
    ActionEditDeleteWord: TAction;
    ActionEditIndent: TAction;
    ActionEditIndentDecrease: TAction;
    ActionEditIndentIncrease: TAction;
    ActionEditInsert: TAction;
    ActionEditInsertDateTime: TAction;
    ActionEditInsertLine: TAction;
    ActionEditInsertTag: TAction;
    ActionEditPaste: TAction;
    ActionEditRedo: TAction;
    ActionEditSelectAll: TAction;
    ActionEditSort: TAction;
    ActionEditSortAsc: TAction;
    ActionEditSortDesc: TAction;
    ActionEditToggleCase: TAction;
    ActionEditUndo: TAction;
    ActionFile: TAction;
    ActionFileClose: TAction;
    ActionFileCloseAll: TAction;
    ActionFileCloseAllOther: TAction;
    ActionFileNew: TAction;
    ActionFileOpen: TAction;
    ActionFilePrint: TAction;
    ActionFilePrintPreview: TAction;
    ActionFileProperties: TAction;
    ActionFileReopen: TAction;
    ActionFileReopenClear: TAction;
    ActionFileSave: TAction;
    ActionFileSaveAll: TAction;
    ActionFileSaveAs: TAction;
    ActionFileSelectFromDirectory: TAction;
    ActionGotoBookmarks1: TAction;
    ActionGotoBookmarks2: TAction;
    ActionGotoBookmarks3: TAction;
    ActionGotoBookmarks4: TAction;
    ActionGotoBookmarks5: TAction;
    ActionGotoBookmarks6: TAction;
    ActionGotoBookmarks7: TAction;
    ActionGotoBookmarks8: TAction;
    ActionGotoBookmarks9: TAction;
    ActionHelp: TAction;
    ActionHelpAboutEditBone: TAction;
    ActionHelpCheckForUpdates: TAction;
    ActionHelpVisitHomepage: TAction;
    ActionMacroOpen: TAction;
    ActionMacroPlayback: TAction;
    ActionMacroRecordPause: TAction;
    ActionMacroSaveAs: TAction;
    ActionMacroStop: TAction;
    ActionMenuDocument: TAction;
    ActionMenuEdit: TAction;
    ActionMenuFile: TAction;
    ActionMenuHelp: TAction;
    ActionMenuSearch: TAction;
    ActionMenuTools: TAction;
    ActionMenuView: TAction;
    ActionSearch: TAction;
    ActionSearchClearBookmarks: TAction;
    ActionSearchFindInFiles: TAction;
    ActionSearchFindNext: TAction;
    ActionSearchFindPrevious: TAction;
    ActionSearchGoToBookmarks: TAction;
    ActionSearchGoToLine: TAction;
    ActionSearchReplace: TAction;
    ActionSearchSearch: TAction;
    ActionSearchToggleBookmark: TAction;
    ActionSearchToggleBookmarks: TAction;
    ActionSelectEncoding: TAction;
    ActionSelectHighlighter: TAction;
    ActionSelectHighlighterColor: TAction;
    ActionSelectReopenFile: TAction;
    ActionToggleBookmarks1: TAction;
    ActionToggleBookmarks2: TAction;
    ActionToggleBookmarks3: TAction;
    ActionToggleBookmarks4: TAction;
    ActionToggleBookmarks5: TAction;
    ActionToggleBookmarks6: TAction;
    ActionToggleBookmarks7: TAction;
    ActionToggleBookmarks8: TAction;
    ActionToggleBookmarks9: TAction;
    ActionToolBarMenuLanguage: TAction;
    ActionToolBarMenuSkin: TAction;
    ActionToolBarMenuView: TAction;
    ActionTools: TAction;
    ActionToolsCharacterMap: TAction;
    ActionToolsCompareFiles: TAction;
    ActionToolsConvert: TAction;
    ActionToolsLanguageEditor: TAction;
    ActionToolsOptions: TAction;
    ActionToolsSelectForCompare: TAction;
    ActionView: TAction;
    ActionViewCloseDirectory: TAction;
    ActionViewDirectory: TAction;
    ActionViewEditDirectory: TAction;
    ActionViewEncodingSelection: TAction;
    ActionViewFiles: TAction;
    ActionViewColorSelection: TAction;
    ActionViewHighlighterSelection: TAction;
    ActionViewLineNumbers: TAction;
    ActionViewMainMenu: TAction;
    ActionViewMenuBar: TAction;
    ActionViewMinimap: TAction;
    ActionViewNextPage: TAction;
    ActionViewOpenDirectory: TAction;
    ActionViewOutput: TAction;
    ActionViewPreviousPage: TAction;
    ActionViewSelectionMode: TAction;
    ActionViewSpecialChars: TAction;
    ActionViewSplit: TAction;
    ActionViewStatusBar: TAction;
    ActionViewToolbar: TAction;
    ActionViewWordWrap: TAction;
    ActionViewXMLTree: TAction;
    DragDrop: TBCDragDrop;
    MenuItemClearBookmarks: TMenuItem;
    MenuItemCopy: TMenuItem;
    MenuItemCut: TMenuItem;
    MenuItemDateandTime: TMenuItem;
    MenuItemDecreaseIndent: TMenuItem;
    MenuItemDelete: TMenuItem;
    MenuItemDeleteEndOfLine: TMenuItem;
    MenuItemDeleteLine: TMenuItem;
    MenuItemDeleteWord: TMenuItem;
    MenuItemDocumentFormatSQL: TMenuItem;
    MenuItemDocumentFormatXML: TMenuItem;
    MenuItemEditDeleteEndOfLine: TMenuItem;
    MenuItemEditDeleteLine: TMenuItem;
    MenuItemEditDeleteWhitespace: TMenuItem;
    MenuItemEditDeleteWord: TMenuItem;
    MenuItemEditIndentDecrease: TMenuItem;
    MenuItemEditIndentIncrease: TMenuItem;
    MenuItemEditInsertDate: TMenuItem;
    MenuItemEditInsertLine: TMenuItem;
    MenuItemEditInsertTags: TMenuItem;
    MenuItemEditSortAscending: TMenuItem;
    MenuItemEditSortDescending: TMenuItem;
    MenuItemEncodingANSI: TMenuItem;
    MenuItemEncodingASCII: TMenuItem;
    MenuItemEncodingBigEndianUnicode: TMenuItem;
    MenuItemEncodingUnicode: TMenuItem;
    MenuItemEncodingUTF7: TMenuItem;
    MenuItemEncodingUTF8: TMenuItem;
    MenuItemEncodingUTF8WithoutBOM: TMenuItem;
    MenuItemFileClose: TMenuItem;
    MenuItemFileCloseAll: TMenuItem;
    MenuItemFileCloseAllOther: TMenuItem;
    MenuItemFilePrint: TMenuItem;
    MenuItemFilePrintPreview: TMenuItem;
    MenuItemFileSave: TMenuItem;
    MenuItemFileSaveAs: TMenuItem;
    MenuItemFormat: TMenuItem;
    MenuItemFormatSQL: TMenuItem;
    MenuItemFormatXML: TMenuItem;
    MenuItemGotoBookmark1: TMenuItem;
    MenuItemGotoBookmark2: TMenuItem;
    MenuItemGotoBookmark3: TMenuItem;
    MenuItemGotoBookmark4: TMenuItem;
    MenuItemGotoBookmark5: TMenuItem;
    MenuItemGotoBookmark6: TMenuItem;
    MenuItemGotoBookmark7: TMenuItem;
    MenuItemGotoBookmark8: TMenuItem;
    MenuItemGotoBookmark9: TMenuItem;
    MenuItemGotoBookmarks: TMenuItem;
    MenuItemIncreaseIndent: TMenuItem;
    MenuItemIndent: TMenuItem;
    MenuItemInsert: TMenuItem;
    MenuItemInsertLine: TMenuItem;
    MenuItemInsertTag: TMenuItem;
    MenuItemMainMenu: TMenuItem;
    MenuItemMainMenuDocument: TMenuItem;
    MenuItemMainMenuDocumentFormat: TMenuItem;
    MenuItemMainMenuDocumentFormatSQL: TMenuItem;
    MenuItemMainMenuDocumentFormatXML: TMenuItem;
    MenuItemMainMenuDocumentInfo: TMenuItem;
    MenuItemMainMenuDocumentViewInBrowser: TMenuItem;
    MenuItemMainMenuEdit: TMenuItem;
    MenuItemMainMenuEditCopy: TMenuItem;
    MenuItemMainMenuEditCut: TMenuItem;
    MenuItemMainMenuEditDelete: TMenuItem;
    MenuItemMainMenuEditDeleteEndOfLine: TMenuItem;
    MenuItemMainMenuEditDeleteLine: TMenuItem;
    MenuItemMainMenuEditDeleteWhitespace: TMenuItem;
    MenuItemMainMenuEditDeleteWord: TMenuItem;
    MenuItemMainMenuEditDivider1: TMenuItem;
    MenuItemMainMenuEditDivider2: TMenuItem;
    MenuItemMainMenuEditDivider3: TMenuItem;
    MenuItemMainMenuEditDivider4: TMenuItem;
    MenuItemMainMenuEditIndent: TMenuItem;
    MenuItemMainMenuEditIndentDecrease: TMenuItem;
    MenuItemMainMenuEditIndentIncrease: TMenuItem;
    MenuItemMainMenuEditInsert: TMenuItem;
    MenuItemMainMenuEditInsertDateAndTime: TMenuItem;
    MenuItemMainMenuEditInsertHTMLXMLTags: TMenuItem;
    MenuItemMainMenuEditInsertLine: TMenuItem;
    MenuItemMainMenuEditPaste: TMenuItem;
    MenuItemMainMenuEditRedo: TMenuItem;
    MenuItemMainMenuEditSelectAll: TMenuItem;
    MenuItemMainMenuEditSort: TMenuItem;
    MenuItemMainMenuEditSortAscending: TMenuItem;
    MenuItemMainMenuEditSortDescending: TMenuItem;
    MenuItemMainMenuEditToggleCase: TMenuItem;
    MenuItemMainMenuEditUndo: TMenuItem;
    MenuItemMainMenuFile: TMenuItem;
    MenuItemMainMenuFileClose: TMenuItem;
    MenuItemMainMenuFileCloseAll: TMenuItem;
    MenuItemMainMenuFileCloseAllOther: TMenuItem;
    MenuItemMainMenuFileDivider1: TMenuItem;
    MenuItemMainMenuFileDivider2: TMenuItem;
    MenuItemMainMenuFileDivider3: TMenuItem;
    MenuItemMainMenuFileExit: TMenuItem;
    MenuItemMainMenuFileNew: TMenuItem;
    MenuItemMainMenuFileOpen: TMenuItem;
    MenuItemMainMenuFilePrint: TMenuItem;
    MenuItemMainMenuFilePrintPreview: TMenuItem;
    MenuItemMainMenuFileReopen: TMenuItem;
    MenuItemMainMenuFileSave: TMenuItem;
    MenuItemMainMenuFileSaveAll: TMenuItem;
    MenuItemMainMenuFileSaveAs: TMenuItem;
    MenuItemMainMenuHelp: TMenuItem;
    MenuItemMainMenuHelpAboutEditBone: TMenuItem;
    MenuItemMainMenuHelpCheckForUpdates: TMenuItem;
    MenuItemMainMenuHelpDivider1: TMenuItem;
    MenuItemMainMenuHelpDivider2: TMenuItem;
    MenuItemMainMenuHelpVisitHomepage: TMenuItem;
    MenuItemMainMenuSearch: TMenuItem;
    MenuItemMainMenuSearchClearBookmarks: TMenuItem;
    MenuItemMainMenuSearchDivider1: TMenuItem;
    MenuItemMainMenuSearchDivider2: TMenuItem;
    MenuItemMainMenuSearchFindInFiles: TMenuItem;
    MenuItemMainMenuSearchGoToBookmarks: TMenuItem;
    MenuItemMainMenuSearchGoToBookmarksBookmark1: TMenuItem;
    MenuItemMainMenuSearchGoToBookmarksBookmark2: TMenuItem;
    MenuItemMainMenuSearchGoToBookmarksBookmark3: TMenuItem;
    MenuItemMainMenuSearchGoToBookmarksBookmark4: TMenuItem;
    MenuItemMainMenuSearchGoToBookmarksBookmark5: TMenuItem;
    MenuItemMainMenuSearchGoToBookmarksBookmark6: TMenuItem;
    MenuItemMainMenuSearchGoToBookmarksBookmark7: TMenuItem;
    MenuItemMainMenuSearchGoToBookmarksBookmark8: TMenuItem;
    MenuItemMainMenuSearchGoToBookmarksBookmark9: TMenuItem;
    MenuItemMainMenuSearchGoToLine: TMenuItem;
    MenuItemMainMenuSearchReplace: TMenuItem;
    MenuItemMainMenuSearchSearch: TMenuItem;
    MenuItemMainMenuSearchToggleBookmark: TMenuItem;
    MenuItemMainMenuSearchToggleBookmarks: TMenuItem;
    MenuItemMainMenuSearchToggleBookmarksBookmark11: TMenuItem;
    MenuItemMainMenuSearchToggleBookmarksBookmark2: TMenuItem;
    MenuItemMainMenuSearchToggleBookmarksBookmark3: TMenuItem;
    MenuItemMainMenuSearchToggleBookmarksBookmark4: TMenuItem;
    MenuItemMainMenuSearchToggleBookmarksBookmark5: TMenuItem;
    MenuItemMainMenuSearchToggleBookmarksBookmark6: TMenuItem;
    MenuItemMainMenuSearchToggleBookmarksBookmark7: TMenuItem;
    MenuItemMainMenuSearchToggleBookmarksBookmark8: TMenuItem;
    MenuItemMainMenuSearchToggleBookmarksBookmark9: TMenuItem;
    MenuItemMainMenuTools: TMenuItem;
    MenuItemMainMenuToolsCharacterMap: TMenuItem;
    MenuItemMainMenuToolsCompareFiles: TMenuItem;
    MenuItemMainMenuToolsConvert: TMenuItem;
    MenuItemMainMenuToolsDivider1: TMenuItem;
    MenuItemMainMenuToolsDivider2: TMenuItem;
    MenuItemMainMenuToolsLanguageEditor: TMenuItem;
    MenuItemMainMenuToolsOptions: TMenuItem;
    MenuItemMainMenuView: TMenuItem;
    MenuItemMainMenuViewCloseDirectory: TMenuItem;
    MenuItemMainMenuViewDivider1: TMenuItem;
    MenuItemMainMenuViewDivider2: TMenuItem;
    MenuItemMainMenuViewDivider3: TMenuItem;
    MenuItemMainMenuViewEditDirectory: TMenuItem;
    MenuItemMainMenuViewFiles: TMenuItem;
    MenuItemMainMenuViewLineNumbers: TMenuItem;
    MenuItemMainMenuViewMinimap: TMenuItem;
    MenuItemMainMenuViewNextPage: TMenuItem;
    MenuItemMainMenuViewOpenDirectory: TMenuItem;
    MenuItemMainMenuViewPreviousPage: TMenuItem;
    MenuItemMainMenuViewSelectionMode: TMenuItem;
    MenuItemMainMenuViewSpecialChars: TMenuItem;
    MenuItemMainMenuViewSplit: TMenuItem;
    MenuItemMainMenuViewWordWrap: TMenuItem;
    MenuItemMainMenuViewXMLTree: TMenuItem;
    MenuItemPaste: TMenuItem;
    MenuItemPopupMenuDocumentDivider1: TMenuItem;
    MenuItemPopupMenuDocumentDivider2: TMenuItem;
    MenuItemPopupMenuDocumentDivider3: TMenuItem;
    MenuItemPopupMenuDocumentDivider4: TMenuItem;
    MenuItemRedo: TMenuItem;
    MenuItemDeleteWhiteSpace: TMenuItem;
    MenuItemSearchGotoBookmark1: TMenuItem;
    MenuItemSearchGotoBookmark2: TMenuItem;
    MenuItemSearchGotoBookmark3: TMenuItem;
    MenuItemSearchGotoBookmark4: TMenuItem;
    MenuItemSearchGotoBookmark5: TMenuItem;
    MenuItemSearchGotoBookmark6: TMenuItem;
    MenuItemSearchGotoBookmark7: TMenuItem;
    MenuItemSearchGotoBookmark8: TMenuItem;
    MenuItemSearchGotoBookmark9: TMenuItem;
    MenuItemSearchToggleBookmark1: TMenuItem;
    MenuItemSearchToggleBookmark2: TMenuItem;
    MenuItemSearchToggleBookmark3: TMenuItem;
    MenuItemSearchToggleBookmark4: TMenuItem;
    MenuItemSearchToggleBookmark5: TMenuItem;
    MenuItemSearchToggleBookmark6: TMenuItem;
    MenuItemSearchToggleBookmark7: TMenuItem;
    MenuItemSearchToggleBookmark8: TMenuItem;
    MenuItemSearchToggleBookmark9: TMenuItem;
    MenuItemSelectAll: TMenuItem;
    MenuItemSeparator1: TMenuItem;
    MenuItemSeparator2: TMenuItem;
    MenuItemSeparator3: TMenuItem;
    MenuItemSeparator4: TMenuItem;
    MenuItemSeparator5: TMenuItem;
    MenuItemSeparator6: TMenuItem;
    MenuItemSort: TMenuItem;
    MenuItemSortAscending: TMenuItem;
    MenuItemSortDescending: TMenuItem;
    MenuItemToggleBookmark1: TMenuItem;
    MenuItemToggleBookmark2: TMenuItem;
    MenuItemToggleBookmark3: TMenuItem;
    MenuItemToggleBookmark4: TMenuItem;
    MenuItemToggleBookmark5: TMenuItem;
    MenuItemToggleBookmark6: TMenuItem;
    MenuItemToggleBookmark7: TMenuItem;
    MenuItemToggleBookmark8: TMenuItem;
    MenuItemToggleBookmark9: TMenuItem;
    MenuItemToolBarMenuLanguage: TMenuItem;
    MenuItemToolBarMenuSkin: TMenuItem;
    MenuItemToolBarMenuView: TMenuItem;
    MenuItemToolBarMenuViewColor: TMenuItem;
    MenuItemToolBarMenuViewDirectory: TMenuItem;
    MenuItemToolBarMenuViewEncoding: TMenuItem;
    MenuItemToolBarMenuViewHighlighter: TMenuItem;
    MenuItemToolBarMenuViewMenuBar: TMenuItem;
    MenuItemToolBarMenuViewOutput: TMenuItem;
    MenuItemToolBarMenuViewStatusBar: TMenuItem;
    MenuItemToolBarMenuViewToolbar: TMenuItem;
    MenuItemUndo: TMenuItem;
    PageControlToolBar: TBCPageControl;
    PanelDirectory: TBCPanel;
    PanelDocument: TBCPanel;
    PanelDocumentButtons: TBCPanel;
    PanelEditButtons: TBCPanel;
    PanelFileButtons: TBCPanel;
    PanelHelpButtons: TBCPanel;
    PanelMenuBar: TBCPanel;
    PanelMiddle: TBCPanel;
    PanelOutput: TBCPanel;
    PanelSearchButtons: TBCPanel;
    PanelToolBar: TBCPanel;
    PanelToolsButtons: TBCPanel;
    PanelViewButtons: TBCPanel;
    PopupMenuColors: TPopupMenu;
    PopupMenuDocument: TPopupMenu;
    PopupMenuDocumentFormat: TPopupMenu;
    PopupMenuEditDelete: TPopupMenu;
    PopupMenuEditIndent: TPopupMenu;
    PopupMenuEditInsert: TPopupMenu;
    PopupMenuEditor: TPopupMenu;
    PopupMenuEditSort: TPopupMenu;
    PopupMenuEncoding: TPopupMenu;
    PopupMenuFileReopen: TPopupMenu;
    PopupMenuHighlighters: TPopupMenu;
    PopupMenuSearchGotoBookmarks: TPopupMenu;
    PopupMenuSearchToggleBookmarks: TPopupMenu;
    PopupMenuToolBar: TPopupMenu;
    SpeedButtonClose: TBCSpeedButton;
    SpeedButtonCloseAll: TBCSpeedButton;
    SpeedButtonCloseAllOther: TBCSpeedButton;
    SpeedButtonDocumentDivider1: TBCSpeedButton;
    SpeedButtonDocumentDivider2: TBCSpeedButton;
    SpeedButtonDocumentFormat: TBCSpeedButton;
    SpeedButtonDocumentInfo: TBCSpeedButton;
    SpeedButtonDocumentViewInBrowser: TBCSpeedButton;
    SpeedButtonEditCopy: TBCSpeedButton;
    SpeedButtonEditCut: TBCSpeedButton;
    SpeedButtonEditDelete: TBCSpeedButton;
    SpeedButtonEditDivider1: TBCSpeedButton;
    SpeedButtonEditDivider2: TBCSpeedButton;
    SpeedButtonEditDivider3: TBCSpeedButton;
    SpeedButtonEditDivider4: TBCSpeedButton;
    SpeedButtonEditIndent: TBCSpeedButton;
    SpeedButtonEditInsert: TBCSpeedButton;
    SpeedButtonEditPaste: TBCSpeedButton;
    SpeedButtonEditRedo: TBCSpeedButton;
    SpeedButtonEditSelectAll: TBCSpeedButton;
    SpeedButtonEditSort: TBCSpeedButton;
    SpeedButtonEditToggleCase: TBCSpeedButton;
    SpeedButtonEditUndo: TBCSpeedButton;
    SpeedButtonFileDivider1: TBCSpeedButton;
    SpeedButtonFileDivider2: TBCSpeedButton;
    SpeedButtonFileDivider3: TBCSpeedButton;
    SpeedButtonFileExit: TBCSpeedButton;
    SpeedButtonFileNew: TBCSpeedButton;
    SpeedButtonFileOpen: TBCSpeedButton;
    SpeedButtonFilePrint: TBCSpeedButton;
    SpeedButtonFilePrintPreview: TBCSpeedButton;
    SpeedButtonFileReopen: TBCSpeedButton;
    SpeedButtonFileSave: TBCSpeedButton;
    SpeedButtonFileSaveAll: TBCSpeedButton;
    SpeedButtonFileSaveAs: TBCSpeedButton;
    SpeedButtonHelpAboutEditBone: TBCSpeedButton;
    SpeedButtonHelpCheckForUpdates: TBCSpeedButton;
    SpeedButtonHelpDivider1: TBCSpeedButton;
    SpeedButtonHelpDivider2: TBCSpeedButton;
    SpeedButtonHelpVisitHomepage: TBCSpeedButton;
    SpeedButtonMacroPlay: TBCSpeedButton;
    SpeedButtonMacroRecordPause: TBCSpeedButton;
    SpeedButtonMacroStop: TBCSpeedButton;
    SpeedButtonSearchClearBookmarks: TBCSpeedButton;
    SpeedButtonSearchDivider1: TBCSpeedButton;
    SpeedButtonSearchDivider2: TBCSpeedButton;
    SpeedButtonSearchFindInFiles: TBCSpeedButton;
    SpeedButtonSearchGoToBookmarks: TBCSpeedButton;
    SpeedButtonSearchGoToLine: TBCSpeedButton;
    SpeedButtonSearchReplace: TBCSpeedButton;
    SpeedButtonSearchSearch: TBCSpeedButton;
    SpeedButtonSearchToggleBookmark: TBCSpeedButton;
    SpeedButtonSearchToggleBookmarks: TBCSpeedButton;
    SpeedButtonToolbarDivider1: TBCSpeedButton;
    SpeedButtonToolbarDivider10: TBCSpeedButton;
    SpeedButtonToolbarDivider11: TBCSpeedButton;
    SpeedButtonToolbarDivider2: TBCSpeedButton;
    SpeedButtonToolbarDivider3: TBCSpeedButton;
    SpeedButtonToolbarDivider4: TBCSpeedButton;
    SpeedButtonToolbarDivider5: TBCSpeedButton;
    SpeedButtonToolbarDivider6: TBCSpeedButton;
    SpeedButtonToolbarDivider7: TBCSpeedButton;
    SpeedButtonToolbarDivider8: TBCSpeedButton;
    SpeedButtonToolbarDivider9: TBCSpeedButton;
    SpeedButtonToolbarDocumentInfo: TBCSpeedButton;
    SpeedButtonToolbarDocumentViewInBrowser: TBCSpeedButton;
    SpeedButtonToolbarEditIndentDecrease: TBCSpeedButton;
    SpeedButtonToolbarEditIndentIncrease: TBCSpeedButton;
    SpeedButtonToolbarEditRedo: TBCSpeedButton;
    SpeedButtonToolbarEditSortAsc: TBCSpeedButton;
    SpeedButtonToolbarEditSortDesc: TBCSpeedButton;
    SpeedButtonToolbarEditToggleCase: TBCSpeedButton;
    SpeedButtonToolbarEditUndo: TBCSpeedButton;
    SpeedButtonToolbarFileClose: TBCSpeedButton;
    SpeedButtonToolbarFileCloseAll: TBCSpeedButton;
    SpeedButtonToolbarFileNew: TBCSpeedButton;
    SpeedButtonToolbarFileOpen: TBCSpeedButton;
    SpeedButtonToolbarFilePrint: TBCSpeedButton;
    SpeedButtonToolbarFilePrintPreview: TBCSpeedButton;
    SpeedButtonToolbarFileSave: TBCSpeedButton;
    SpeedButtonToolbarFileSaveAll: TBCSpeedButton;
    SpeedButtonToolbarFileSaveAs: TBCSpeedButton;
    SpeedButtonToolbarSearchFindInFiles: TBCSpeedButton;
    SpeedButtonToolbarSearchReplace: TBCSpeedButton;
    SpeedButtonToolbarSearchSearch: TBCSpeedButton;
    SpeedButtonToolbarToolsCompareFiles: TBCSpeedButton;
    SpeedButtonToolbarViewCloseDirectory: TBCSpeedButton;
    SpeedButtonToolbarViewEditDirectory: TBCSpeedButton;
    SpeedButtonToolbarViewLineNumbers: TBCSpeedButton;
    SpeedButtonToolbarViewMinimap: TBCSpeedButton;
    SpeedButtonToolbarViewOpenDirectory: TBCSpeedButton;
    SpeedButtonToolbarViewSelectionMode: TBCSpeedButton;
    SpeedButtonToolbarViewSpecialChars: TBCSpeedButton;
    SpeedButtonToolbarViewSplit: TBCSpeedButton;
    SpeedButtonToolbarViewWordWrap: TBCSpeedButton;
    SpeedButtonToolsCharacterMap: TBCSpeedButton;
    SpeedButtonToolsCompareFiles: TBCSpeedButton;
    SpeedButtonToolsConvert: TBCSpeedButton;
    SpeedButtonToolsDivider1: TBCSpeedButton;
    SpeedButtonToolsDivider2: TBCSpeedButton;
    SpeedButtonToolsLanguageEditor: TBCSpeedButton;
    SpeedButtonToolsOptions: TBCSpeedButton;
    SpeedButtonViewCloseDirectory: TBCSpeedButton;
    SpeedButtonViewDivider1: TBCSpeedButton;
    SpeedButtonViewDivider2: TBCSpeedButton;
    SpeedButtonViewDivider3: TBCSpeedButton;
    SpeedButtonViewEditDirectory: TBCSpeedButton;
    SpeedButtonViewFiles: TBCSpeedButton;
    SpeedButtonViewLineNumbers: TBCSpeedButton;
    SpeedButtonViewMinimap: TBCSpeedButton;
    SpeedButtonViewNextPage: TBCSpeedButton;
    SpeedButtonViewOpenDirectory: TBCSpeedButton;
    SpeedButtonViewPreviousPage: TBCSpeedButton;
    SpeedButtonViewSelectionMode: TBCSpeedButton;
    SpeedButtonViewSpecialChars: TBCSpeedButton;
    SpeedButtonViewSplit: TBCSpeedButton;
    SpeedButtonViewWordWrap: TBCSpeedButton;
    SpeedButtonXMLTree: TBCSpeedButton;
    SplitterHorizontal: TBCSplitter;
    SplitterVertical: TBCSplitter;
    TabSheetButton: TsTabSheet;
    TabSheetDocument: TsTabSheet;
    TabSheetEdit: TsTabSheet;
    TabSheetFile: TsTabSheet;
    TabSheetHelp: TsTabSheet;
    TabSheetSearch: TsTabSheet;
    TabSheetTools: TsTabSheet;
    TabSheetView: TsTabSheet;
    MenuItemToggleBookmark: TMenuItem;
    MenuItemToggleBookmarks: TMenuItem;
    MenuItemToggleCase: TMenuItem;
    MenuItemToolsSelectForCompare: TMenuItem;
    MenuItemFileSelectFromDirectory: TMenuItem;
    MenuItemPopupMenuDocumentDivider5: TMenuItem;
    MenuItemFileProperties: TMenuItem;
    ActionEncodingASCII: TAction;
    ActionEncodingANSI: TAction;
    ActionEncodingBigEndianUnicode: TAction;
    ActionEncodingUnicode: TAction;
    ActionEncodingUTF7: TAction;
    ActionEncodingUTF8: TAction;
    ActionEncodingUTF8WithoutBOM: TAction;
    PopupMenuToggleCase: TPopupMenu;
    ActionEditToggleCaseUpper: TAction;
    ActionEditToggleCaseLower: TAction;
    ActionEditToggleCaseAlternating: TAction;
    ActionEditToggleCaseSentence: TAction;
    ActionEditToggleCaseTitle: TAction;
    Upper1: TMenuItem;
    Lower1: TMenuItem;
    Alternating1: TMenuItem;
    Sentence1: TMenuItem;
    itle1: TMenuItem;
    AppInstances: TJvAppInstances;
    AlphaImageListStatusBar: TsAlphaImageList;
    procedure ActionFileNewExecute(Sender: TObject);
    procedure ActionFileOpenExecute(Sender: TObject);
    procedure ActionFileSaveAllExecute(Sender: TObject);
    procedure ActionFileSaveAsExecute(Sender: TObject);
    procedure ActionFileSaveExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ActionFileCloseExecute(Sender: TObject);
    procedure ActionFileCloseAllExecute(Sender: TObject);
    procedure ActionFileCloseAllOtherExecute(Sender: TObject);
    procedure ActionFilePrintExecute(Sender: TObject);
    procedure ActionFilePrintPreviewExecute(Sender: TObject);
    procedure ActionEditUndoExecute(Sender: TObject);
    procedure ActionEditRedoExecute(Sender: TObject);
    procedure ActionEditCutExecute(Sender: TObject);
    procedure ActionEditCopyExecute(Sender: TObject);
    procedure ActionEditPasteExecute(Sender: TObject);
    procedure ActionEditSelectAllExecute(Sender: TObject);
    procedure ActionEditToggleCaseExecute(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure ActionEditInsertLineExecute(Sender: TObject);
    procedure ActionEditInsertTagExecute(Sender: TObject);
    procedure ActionEditInsertDateTimeExecute(Sender: TObject);
    procedure ApplicationEventsHint(Sender: TObject);
    procedure ActionSearchSearchExecute(Sender: TObject);
    procedure ActionSearchReplaceExecute(Sender: TObject);
    procedure ActionSearchFindInFilesExecute(Sender: TObject);
    procedure ActionSearchFindNextExecute(Sender: TObject);
    procedure ActionSearchFindPreviousExecute(Sender: TObject);
    procedure ActionSearchToggleBookmarkExecute(Sender: TObject);
    procedure ActionSearchClearBookmarksExecute(Sender: TObject);
    procedure ActionSearchGoToLineExecute(Sender: TObject);
    procedure ActionViewOpenDirectoryExecute(Sender: TObject);
    procedure ActionViewCloseDirectoryExecute(Sender: TObject);
    procedure ActionViewEditDirectoryExecute(Sender: TObject);
    procedure ActionViewFilesExecute(Sender: TObject);
    procedure ActionViewWordWrapExecute(Sender: TObject);
    procedure ActionViewLineNumbersExecute(Sender: TObject);
    procedure ActionViewSpecialCharsExecute(Sender: TObject);
    procedure ActionViewSelectionModeExecute(Sender: TObject);
    procedure ActionViewPreviousPageExecute(Sender: TObject);
    procedure ActionViewNextPageExecute(Sender: TObject);
    procedure ActionDocumentInfoExecute(Sender: TObject);
    procedure ActionDocumentViewInBrowserExecute(Sender: TObject);
    procedure ActionMenuFileExecute(Sender: TObject);
    procedure ActionMenuEditExecute(Sender: TObject);
    procedure ActionMenuSearchExecute(Sender: TObject);
    procedure ActionMenuViewExecute(Sender: TObject);
    procedure ActionMenuDocumentExecute(Sender: TObject);
    procedure ActionMenuHelpExecute(Sender: TObject);
    procedure ActionMenuToolsExecute(Sender: TObject);
    procedure ActionToolsOptionsExecute(Sender: TObject);
    procedure ActionToolsCompareFilesExecute(Sender: TObject);
    procedure ActionToolsConvertExecute(Sender: TObject);
    procedure ActionToolsCharacterMapExecute(Sender: TObject);
    procedure ActionHelpCheckForUpdatesExecute(Sender: TObject);
    procedure ActionHelpVisitHomepageExecute(Sender: TObject);
    procedure ActionHelpAboutEditBoneExecute(Sender: TObject);
    procedure ActionDummyExecute(Sender: TObject);
    procedure SkinManagerGetMenuExtraLineData(FirstItem: TMenuItem; var SkinSection, Caption: string;
      var Glyph: TBitmap; var LineVisible: Boolean);
    procedure LanguageMenuClick(Sender: TObject);
    procedure OutputDblClickActionExecute(Sender: TObject);
    procedure ActionViewXMLTreeExecute(Sender: TObject);
    procedure FileTreeViewClickActionExecute(Sender: TObject);
    procedure FileTreeViewDblClickActionExecute(Sender: TObject);
    procedure ActionSelectReopenFileExecute(Sender: TObject);
    procedure ActionFileReopenClearExecute(Sender: TObject);
    procedure DragDropDrop(Sender: TObject; Pos: TPoint; Value: TStrings);
    procedure ActionToggleBookmarksExecute(Sender: TObject);
    procedure ActionGotoBookmarksExecute(Sender: TObject);
    procedure ActionViewEncodingSelectionExecute(Sender: TObject);
    procedure ApplicationEventsActivate(Sender: TObject);
    procedure ApplicationEventsMessage(var Msg: tagMSG; var Handled: Boolean);
    procedure ActionMacroPlaybackExecute(Sender: TObject);
    procedure ActionMacroRecordPauseExecute(Sender: TObject);
    procedure ActionMacroStopExecute(Sender: TObject);
    procedure ActionFileSelectFromDirectoryExecute(Sender: TObject);
    procedure ActionFilePropertiesExecute(Sender: TObject);
    procedure ActionFileReopenExecute(Sender: TObject);
    procedure ActionDocumentFormatSQLExecute(Sender: TObject);
    procedure ActionDocumentFormatXMLExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ActionMacroOpenExecute(Sender: TObject);
    procedure ActionMacroSaveAsExecute(Sender: TObject);
    procedure ActionDirectorySearchFindInFilesExecute(Sender: TObject);
    procedure ActionViewSplitExecute(Sender: TObject);
    procedure ActionViewStatusBarExecute(Sender: TObject);
    procedure ActionEditDeleteWhitespaceExecute(Sender: TObject);
    procedure ActionEditSortAscExecute(Sender: TObject);
    procedure ActionEditSortDescExecute(Sender: TObject);
    procedure ActionEditIndentDecreaseExecute(Sender: TObject);
    procedure ActionEditDeleteEndOfLineExecute(Sender: TObject);
    procedure ActionEditDeleteLineExecute(Sender: TObject);
    procedure ActionEditDeleteWordExecute(Sender: TObject);
    procedure ActionEditIndentIncreaseExecute(Sender: TObject);
    procedure ActionToolsLanguageEditorExecute(Sender: TObject);
    procedure ActionToolsSelectForCompareExecute(Sender: TObject);
    procedure ActionViewDirectoryExecute(Sender: TObject);
    procedure ActionViewMinimapExecute(Sender: TObject);
    procedure ActionViewOutputExecute(Sender: TObject);
    procedure ActionViewToolbarExecute(Sender: TObject);
    procedure ActionViewMenuBarExecute(Sender: TObject);
    procedure ActionViewMainMenuExecute(Sender: TObject);
    procedure ActionSelectHighlighterColorExecute(Sender: TObject);
    procedure ActionSelectHighlighterExecute(Sender: TObject);
    procedure ActionSelectEncodingExecute(Sender: TObject);
    procedure TitleBarItems4MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure TitleBarItems6MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure TitleBarItems2MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ActionViewHighlighterSelectionExecute(Sender: TObject);
    procedure ActionViewColorSelectionExecute(Sender: TObject);
    procedure ChangeSkin(Sender: TObject);
    procedure ActionEditToggleCaseUpperExecute(Sender: TObject);
    procedure ActionEditToggleCaseLowerExecute(Sender: TObject);
    procedure ActionEditToggleCaseAlternatingExecute(Sender: TObject);
    procedure ActionEditToggleCaseSentenceExecute(Sender: TObject);
    procedure ActionEditToggleCaseTitleExecute(Sender: TObject);
    procedure AppInstancesCmdLineReceived(Sender: TObject; CmdLine: TStrings);
    procedure FormDestroy(Sender: TObject);
    procedure StatusBarDrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel; const Rect: TRect);
    procedure ActionEditSortExecute(Sender: TObject);
  private
    FNoIni: Boolean;
    FDirectoryFrame: TDirectoryFrame;
    FDocumentFrame: TDocumentFrame;
    FImageListCount: Integer;
    FOutputFrame: TOutputFrame;
    FProcessingEventHandler: Boolean;
    FEncoding: TEncoding;
    FSQLFormatterDLLFound: Boolean;
    function GetHighlighterColor: string;
    function GetStringList(AFilename: string): TStringList; overload;
    function GetStringList(APopupMenu: TPopupMenu): TStringList; overload;
    function Processing: Boolean;
    procedure CreateFrames;
    procedure CreateLanguageMenu(AMenuItem: TMenuItem);
    procedure CreateToolBar(ACreate: Boolean = False);
    procedure FindInFiles(AOutputTreeView: TVirtualDrawTree; AFindWhatText, AFileTypeText, AFolderText: string; ASearchCaseSensitive, ALookInSubfolders: Boolean);
    procedure ReadIniOptions;
    procedure ReadIniSizePositionAndState;
    procedure ReadLanguageFile(ALanguage: string);
    procedure SearchFindInFiles(AFolder: string = '');
    procedure SetFields;
    procedure SetImages;
    procedure SetMargins;
    procedure SetOptions;
    procedure UpdateMenuBarLanguage;
    procedure WriteIniFile;
    procedure GetHighlighters;
    procedure GetHighlighterColors;
  public
    procedure CreateFileReopenList;
    procedure SetBookmarks;
    procedure SetTitleBarMenus;
    property HighlighterColor: string read GetHighlighterColor;
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

uses
  Winapi.CommCtrl, Winapi.ShellAPI, System.Math, System.IOUtils, EditBone.Consts, BCCommon.FileUtils,
  BCCommon.Language.Utils, BCCommon.Language.Strings, BCEditor.Editor.Bookmarks, Vcl.Clipbrd, System.Types,
  BigIni, BCEditor.Editor, BCCommon.Options.Container, BCCommon.Options.Container.SQL.Formatter, BCCommon.Consts,
  BCCommon.Utils, BCControls.ImageList, BCControls.Utils, BCCommon.Dialogs.FindInFiles, BCEditor.Editor.Utils,
  BCEditor.Encoding, EditBone.Forms.UnicodeCharacterMap, EditBone.Dialogs.About, BCCommon.Dialogs.DownloadURL,
  BCCommon.Forms.Convert, EditBone.Forms.LanguageEditor, BCCommon.Messages, BCCommon.Forms.SearchForFiles,
  BCCommon.StringUtils, BCEditor.Types, sGraphUtils, sConst;

function TMainForm.Processing: Boolean;
begin
  Result := True;
  if FProcessingEventHandler then
    Exit;
  if not Assigned(FDocumentFrame) then
    Exit;
  if FDocumentFrame.Processing then
    Exit;
  Result := False;
end;

procedure TMainForm.ActionDocumentViewInBrowserExecute(Sender: TObject);
begin
  BrowseURL(FormatFileName(FDocumentFrame.ActiveDocumentName));
end;

procedure TMainForm.ActionFileReopenClearExecute(Sender: TObject);
begin
  with TBigIniFile.Create(GetIniFilename) do
  try
    EraseSection('FileReopenFiles');
  finally
    Free;
  end;
  CreateFileReopenList;
end;

procedure TMainForm.ActionFileReopenExecute(Sender: TObject);
begin
  { dummy action }
end;

procedure TMainForm.ActionDirectorySearchFindInFilesExecute(Sender: TObject);
begin
  SearchFindInFiles(FDirectoryFrame.SelectedPath);
end;

procedure TMainForm.ActionDocumentFormatSQLExecute(Sender: TObject);
begin
  FDocumentFrame.FormatSQL;
end;

procedure TMainForm.ActionDocumentFormatXMLExecute(Sender: TObject);
begin
  FDocumentFrame.FormatXML;
end;

procedure TMainForm.ActionDocumentInfoExecute(Sender: TObject);
begin
  FDocumentFrame.ShowInfo;
end;

procedure TMainForm.ActionEditCopyExecute(Sender: TObject);
begin
  FDocumentFrame.Copy;
end;

procedure TMainForm.ActionEditCutExecute(Sender: TObject);
begin
  FDocumentFrame.Cut;
end;

procedure TMainForm.ActionEditDeleteEndOfLineExecute(Sender: TObject);
begin
  FDocumentFrame.DeleteEndOfLine;
end;

procedure TMainForm.ActionEditDeleteLineExecute(Sender: TObject);
begin
  FDocumentFrame.DeleteLine;
end;

procedure TMainForm.ActionEditDeleteWhitespaceExecute(Sender: TObject);
begin
  FDocumentFrame.DeleteWhiteSpace;
end;

procedure TMainForm.ActionEditDeleteWordExecute(Sender: TObject);
begin
  FDocumentFrame.DeleteWord;
end;

procedure TMainForm.ActionEditIndentDecreaseExecute(Sender: TObject);
begin
  FDocumentFrame.DecreaseIndent;
end;

procedure TMainForm.ActionEditIndentIncreaseExecute(Sender: TObject);
begin
  FDocumentFrame.IncreaseIndent;
end;

procedure TMainForm.ActionEditInsertDateTimeExecute(Sender: TObject);
begin
  FDocumentFrame.InsertDateAndTime;
end;

procedure TMainForm.ActionEditInsertLineExecute(Sender: TObject);
begin
  FDocumentFrame.InsertLine;
end;

procedure TMainForm.ActionEditInsertTagExecute(Sender: TObject);
begin
  FDocumentFrame.InsertTag;
end;

procedure TMainForm.ActionEditPasteExecute(Sender: TObject);
begin
  FDocumentFrame.Paste;
end;

procedure TMainForm.ActionEditRedoExecute(Sender: TObject);
begin
  FDocumentFrame.Redo;
end;

procedure TMainForm.ActionEditSelectAllExecute(Sender: TObject);
begin
  FDocumentFrame.SelectAll;
end;

procedure TMainForm.ActionEditSortAscExecute(Sender: TObject);
begin
  FDocumentFrame.Sort(soAsc);
end;

procedure TMainForm.ActionEditSortDescExecute(Sender: TObject);
begin
  FDocumentFrame.Sort(soDesc);
end;

procedure TMainForm.ActionEditSortExecute(Sender: TObject);
begin
  inherited;
  FDocumentFrame.Sort;
end;

procedure TMainForm.ActionEditToggleCaseExecute(Sender: TObject);
begin
  FDocumentFrame.ToggleCase;
end;

procedure TMainForm.ActionEditUndoExecute(Sender: TObject);
begin
  FDocumentFrame.Undo;
end;

procedure TMainForm.ActionFileCloseAllExecute(Sender: TObject);
begin
  FDocumentFrame.CloseAll;
end;

procedure TMainForm.ActionFileCloseAllOtherExecute(Sender: TObject);
begin
  FDocumentFrame.CloseAllOtherPages;
end;

procedure TMainForm.ActionFileCloseExecute(Sender: TObject);
begin
  FDocumentFrame.Close;
end;

procedure TMainForm.ActionMacroOpenExecute(Sender: TObject);
begin
  FDocumentFrame.LoadMacro;
end;

procedure TMainForm.ActionMacroPlaybackExecute(Sender: TObject);
begin
  FDocumentFrame.PlaybackMacro;
end;

procedure TMainForm.ActionMacroRecordPauseExecute(Sender: TObject);
begin
  FDocumentFrame.RecordMacro;
  SpeedButtonMacroRecordPause.ImageIndex := FDocumentFrame.GetMacroRecordPauseImageIndex;
end;

procedure TMainForm.ActionMacroSaveAsExecute(Sender: TObject);
begin
  FDocumentFrame.SaveMacro;
end;

procedure TMainForm.ActionMacroStopExecute(Sender: TObject);
begin
  FDocumentFrame.StopMacro;
end;

procedure TMainForm.ActionMenuDocumentExecute(Sender: TObject);
begin
  inherited;
  PageControlToolBar.ActivePage := TabSheetDocument;
end;

procedure TMainForm.ActionMenuEditExecute(Sender: TObject);
begin
  inherited;
  PageControlToolBar.ActivePage := TabSheetEdit;
end;

procedure TMainForm.ActionMenuFileExecute(Sender: TObject);
begin
  inherited;
  PageControlToolBar.ActivePage := TabSheetFile;
end;

procedure TMainForm.ActionMenuHelpExecute(Sender: TObject);
begin
  inherited;
  PageControlToolBar.ActivePage := TabSheetHelp;
end;

procedure TMainForm.ActionMenuSearchExecute(Sender: TObject);
begin
  inherited;
  PageControlToolBar.ActivePage := TabSheetSearch;
end;

procedure TMainForm.ActionMenuToolsExecute(Sender: TObject);
begin
  inherited;
  PageControlToolBar.ActivePage := TabSheetTools;
end;

procedure TMainForm.ActionMenuViewExecute(Sender: TObject);
begin
  inherited;
  PageControlToolBar.ActivePage := TabSheetView;
end;

procedure TMainForm.ActionFileNewExecute(Sender: TObject);
begin
  FDocumentFrame.New;
end;

procedure TMainForm.ActionFileOpenExecute(Sender: TObject);
begin
  FDocumentFrame.Open;
end;

procedure TMainForm.ActionFilePrintExecute(Sender: TObject);
begin
  FDocumentFrame.Print;
end;

procedure TMainForm.ActionFilePrintPreviewExecute(Sender: TObject);
begin
  FDocumentFrame.PrintPreview;
end;

procedure TMainForm.ActionFilePropertiesExecute(Sender: TObject);
begin
  FDocumentFrame.FileProperties;
end;

procedure TMainForm.ActionFileSaveAllExecute(Sender: TObject);
begin
  FDocumentFrame.SaveAll;
end;

procedure TMainForm.ActionFileSaveAsExecute(Sender: TObject);
begin
  FDocumentFrame.SaveAs;
end;

procedure TMainForm.ActionFileSaveExecute(Sender: TObject);
begin
  FDocumentFrame.Save;
end;

procedure TMainForm.ActionFileSelectFromDirectoryExecute(Sender: TObject);
begin
  if FDocumentFrame.ActiveDocumentName <> '' then
    if Assigned(FDirectoryFrame) then
      if FDirectoryFrame.IsAnyDirectory then
        FDirectoryFrame.OpenPath(ExtractFileDrive(FDocumentFrame.ActiveDocumentName), FormatFileName(FDocumentFrame.ActiveDocumentName),
          FDirectoryFrame.ExcludeOtherBranches);
end;

procedure TMainForm.ActionHelpAboutEditBoneExecute(Sender: TObject);
begin
  TAboutDialog.ClassShowModal(Self);
end;

procedure TMainForm.ActionHelpCheckForUpdatesExecute(Sender: TObject);
begin
  CheckForUpdates(Application.Title, GetFileVersion(Application.ExeName));
end;

procedure TMainForm.ActionHelpVisitHomepageExecute(Sender: TObject);
begin
  BrowseURL(BONECODE_URL);
end;

procedure TMainForm.ActionSearchClearBookmarksExecute(Sender: TObject);
begin
  FDocumentFrame.ClearBookmarks;
end;

procedure TMainForm.ActionSearchFindInFilesExecute(Sender: TObject);
begin
  inherited;
  if TControl(Sender).Name = 'ActionDirectoryFindInFiles' then
    SearchFindInFiles(FDirectoryFrame.SelectedPath)
  else
    SearchFindInFiles;
end;

procedure TMainForm.ActionSearchFindNextExecute(Sender: TObject);
begin
  FDocumentFrame.FindNext;
end;

procedure TMainForm.ActionSearchFindPreviousExecute(Sender: TObject);
begin
  FDocumentFrame.FindPrevious;
end;

procedure TMainForm.ActionSearchGoToLineExecute(Sender: TObject);
begin
  FDocumentFrame.GotoLine;
end;

procedure TMainForm.ActionSearchReplaceExecute(Sender: TObject);
begin
  FDocumentFrame.Replace;
end;

procedure TMainForm.ActionSearchSearchExecute(Sender: TObject);
begin
  FDocumentFrame.Search;
end;

procedure TMainForm.ActionSearchToggleBookmarkExecute(Sender: TObject);
var
  LEditor: TBCEditor;
begin
  LEditor := FDocumentFrame.GetActiveEditor;
  if Assigned(LEditor) then
    LEditor.ToggleBookMark
  else
  begin
    LEditor := FDocumentFrame.GetActiveSplitEditor;
    if Assigned(LEditor) then
      LEditor.ToggleBookMark
  end;
end;

procedure TMainForm.ActionSelectEncodingExecute(Sender: TObject);
begin
  TitleBar.Items[2].Caption := TAction(Sender).Caption; // TODO: const for item
  TAction(Sender).Checked := True;
  FDocumentFrame.SetActiveEncoding(TAction(Sender).Tag);
end;

procedure TMainForm.ActionSelectHighlighterColorExecute(Sender: TObject);
begin
  TitleBar.Items[6].Caption := TAction(Sender).Caption; // TODO: const for item
  TAction(Sender).Checked := True;
  FDocumentFrame.SetHighlighterColor(TAction(Sender).Caption);
end;

procedure TMainForm.ActionSelectHighlighterExecute(Sender: TObject);
begin
  TitleBar.Items[4].Caption := TAction(Sender).Caption; // TODO: const for item
  TAction(Sender).Checked := True;
  FDocumentFrame.SetHighlighter(TAction(Sender).Caption);
end;

procedure TMainForm.ActionSelectReopenFileExecute(Sender: TObject);
var
  FileName: string;
  Action: TAction;
begin
  Action := Sender as TAction;
  FileName := System.Copy(Action.Caption, Pos(' ', Action.Caption) + 1, Length(Action.Caption));
  FDocumentFrame.Open(FileName);
end;

procedure TMainForm.ChangeSkin(Sender: TObject);
begin
  FDocumentFrame.UpdateHighlighterColors;
end;

procedure TMainForm.ActionToolsCompareFilesExecute(Sender: TObject);
begin
  FDocumentFrame.CompareFiles;
end;

procedure TMainForm.ActionToolsConvertExecute(Sender: TObject);
begin
  ConvertForm.Open;
end;

procedure TMainForm.ActionToolsLanguageEditorExecute(Sender: TObject);
begin
  LanguageEditorForm.Open;
  Self.ReadLanguageFile(GetSelectedLanguage('English'));
end;

procedure TMainForm.CreateToolBar(ACreate: Boolean = False);
var
  i, LLeft: Integer;
  s: string;
  LToolBarItems: TStrings;
  LIsChanged: Boolean;
  LSpeedButton: TBCSpeedButton;

  function FindItemByName(ItemName: string): TContainedAction;
  var
    j: Integer;
  begin
    Result := nil;
    for j := 0 to ActionList.ActionCount - 1 do
      if ActionList.Actions[j].Name = ItemName then
        Exit(ActionList.Actions[j]);
  end;

begin
  LLeft := 0;
  LToolBarItems := TStringList.Create;
  with TBigIniFile.Create(GetIniFilename) do
  try
    { update if changed }
    LIsChanged := ReadBool('ToolBarItemsChanged', 'Changed', False);
    EraseSection('ToolBarItemsChanged');

    if LIsChanged or ACreate then
    begin
      { read items from ini }
      ReadSectionValues('ToolBarItems', LToolBarItems);
      if LToolBarItems.Count > 0 then
      begin
        { add items to action bar }
        while PanelToolBar.ControlCount > 0 do
          PanelToolBar.Controls[0].Destroy;

        for i := 0 to LToolBarItems.Count - 1 do
        begin
          LSpeedButton := TBCSpeedButton.Create(PanelToolBar);
          LSpeedButton.Flat := True;
          LSpeedButton.Images := ImagesDataModule.ImageListSmall;
          LSpeedButton.SkinData.SkinSection := 'TOOLBUTTON';
          LSpeedButton.Layout := Vcl.Buttons.blGlyphTop;

          s := GetTokenAfter('=', LToolBarItems.Strings[i]);
          if s <> '-' then
          begin
            LSpeedButton.Action := FindItemByName(s);
            LSpeedButton.ShowCaption := False;
            if Assigned(LSpeedButton.Action) and TAction(LSpeedButton.Action).AutoCheck then
            begin
              LSpeedButton.AllowAllUp := True;
              LSpeedButton.Down := TAction(LSpeedButton.Action).Checked;
            end
            else
              LSpeedButton.ButtonStyle := tbsTextButton;
            LSpeedButton.Width := 26;
          end
          else
          begin
            LSpeedButton.ButtonStyle := tbsDivider;
            LSpeedButton.Width := 10;
            LSpeedButton.Margins.Top := 2;
            LSpeedButton.Margins.Left := 0;
            LSpeedButton.Margins.Right := 0;
            LSpeedButton.Margins.Bottom := 2;
            LSpeedButton.AlignWithMargins := True;
          end;

          LSpeedButton.Parent := PanelToolBar;
          LSpeedButton.Left := LLeft;
          LSpeedButton.Align := alLeft;

          LLeft := LLeft + LSpeedButton.Width;
        end;
      end;
    end
  finally
    Free;
    LToolBarItems.Free;
  end;
end;

procedure TMainForm.ActionToolsOptionsExecute(Sender: TObject);
begin
  if FDocumentFrame.Options(ActionList) then
  begin
    SetOptions;
    SetMargins;
    CreateToolbar;
  end;
end;

procedure TMainForm.ActionToolsSelectForCompareExecute(Sender: TObject);
begin
 FDocumentFrame.SelectForCompare;
end;

procedure TMainForm.ActionDummyExecute(Sender: TObject);
begin
  inherited;
  { Dummy }
end;

procedure TMainForm.ActionToggleBookmarksExecute(Sender: TObject);
var
  Action: TAction;
begin
  Action := Sender as TAction;
  FDocumentFrame.ToggleBookMark(Action.Tag);
end;

procedure TMainForm.ActionEditToggleCaseAlternatingExecute(Sender: TObject);
begin
  inherited;
  FDocumentFrame.ToggleCase(cAlternating);
end;

procedure TMainForm.ActionEditToggleCaseLowerExecute(Sender: TObject);
begin
  inherited;
  FDocumentFrame.ToggleCase(cLower);
end;

procedure TMainForm.ActionEditToggleCaseSentenceExecute(Sender: TObject);
begin
  inherited;
  FDocumentFrame.ToggleCase(cSentence);
end;

procedure TMainForm.ActionEditToggleCaseTitleExecute(Sender: TObject);
begin
  inherited;
  FDocumentFrame.ToggleCase(cTitle);
end;

procedure TMainForm.ActionEditToggleCaseUpperExecute(Sender: TObject);
begin
  inherited;
  FDocumentFrame.ToggleCase(cUpper);
end;

procedure TMainForm.ActionGotoBookmarksExecute(Sender: TObject);
var
  Action: TAction;
begin
  Action := Sender as TAction;
  FDocumentFrame.GotoBookMarks(Action.Tag);
end;

procedure TMainForm.ActionToolsCharacterMapExecute(Sender: TObject);
begin
  UnicodeCharacterMapForm.Open(FDocumentFrame);
end;

procedure TMainForm.ActionViewCloseDirectoryExecute(Sender: TObject);
begin
  FDirectoryFrame.CloseDirectory;
end;

procedure TMainForm.ActionViewDirectoryExecute(Sender: TObject);
begin
   with PanelDirectory do
  begin
    if not Visible then
      SplitterVertical.Show { vertical splitter must be shown at first or the order goes wrong! }
    else
      SplitterVertical.Hide;
    Visible := not Visible;
  end;
end;

procedure TMainForm.ActionViewEditDirectoryExecute(Sender: TObject);
begin
  FDirectoryFrame.EditDirectory;
end;

procedure TMainForm.ActionViewEncodingSelectionExecute(Sender: TObject);
begin
  ActionViewEncodingSelection.Checked := not ActionViewEncodingSelection.Checked
end;

procedure DoSearchForFilesOpenFile(var FileName: string);
begin
  MainForm.FDocumentFrame.Open(FileName);
end;

procedure TMainForm.ActionViewFilesExecute(Sender: TObject);
begin
  with SearchForFilesForm do
  begin
    OnOpenFile := DoSearchForFilesOpenFile;
    Open(FDirectoryFrame.SelectedPath);
  end;
end;

procedure TMainForm.ActionViewColorSelectionExecute(Sender: TObject);
begin
  ActionViewColorSelection.Checked := not ActionViewColorSelection.Checked
end;

procedure TMainForm.ActionViewHighlighterSelectionExecute(Sender: TObject);
begin
  ActionViewHighlighterSelection.Checked := not ActionViewHighlighterSelection.Checked
end;

procedure TMainForm.ActionViewLineNumbersExecute(Sender: TObject);
begin
  ActionViewLineNumbers.Checked := FDocumentFrame.ToggleLineNumbers;
end;

procedure TMainForm.ActionViewMainMenuExecute(Sender: TObject);
begin
  OptionsContainer.MainMenuVisible := not OptionsContainer.MainMenuVisible;
  if OptionsContainer.MainMenuVisible then
  begin
    Menu := MainMenu;
    Height := Height + 1;
    Height := Height - 1;
  end
  else
    Menu := nil;
  if PanelMenubar.Visible and Assigned(Menu) then
  begin
    OptionsContainer.MenuBarVisible := False;
    PanelMenuBar.Visible := False;
  end;
end;

procedure TMainForm.ActionViewMenuBarExecute(Sender: TObject);
begin
  OptionsContainer.MenubarVisible := not OptionsContainer.MenubarVisible;
  PanelMenubar.Visible := OptionsContainer.MenubarVisible;
  if PanelMenubar.Visible then
    ActionList.Images := ImagesDataModule.ImageList
  else
    ActionList.Images := ImagesDataModule.ImageListSmall;
  if PanelMenubar.Visible and PanelToolBar.Visible then
  begin
    OptionsContainer.ToolBarVisible := False;
    PanelToolBar.Visible := False;
  end;
  if PanelMenubar.Visible and Assigned(Menu) then
  begin
    OptionsContainer.MainMenuVisible := False;
    Menu := nil;
  end;
end;

procedure TMainForm.ActionViewMinimapExecute(Sender: TObject);
begin
  FDocumentFrame.ToggleMiniMap;
end;

procedure TMainForm.ActionViewNextPageExecute(Sender: TObject);
begin
  FDocumentFrame.NextPage;
end;

procedure TMainForm.ActionViewOpenDirectoryExecute(Sender: TObject);
begin
  FDirectoryFrame.OpenDirectory;
  if not PanelDirectory.Visible then
  begin
    PanelDirectory.Visible := True;
    SplitterVertical.Visible := True;
  end;
end;

procedure TMainForm.ActionViewOutputExecute(Sender: TObject);
begin
  PanelOutput.Visible := not PanelOutput.Visible;
end;

procedure TMainForm.ActionViewPreviousPageExecute(Sender: TObject);
begin
  FDocumentFrame.PreviousPage;
end;

procedure TMainForm.ActionViewSelectionModeExecute(Sender: TObject);
begin
  FDocumentFrame.ToggleSelectionMode;
end;

procedure TMainForm.ActionViewSpecialCharsExecute(Sender: TObject);
begin
  ActionViewSpecialChars.Checked := FDocumentFrame.ToggleSpecialChars;
end;

procedure TMainForm.ActionViewSplitExecute(Sender: TObject);
begin
  FDocumentFrame.ToggleSplit;
end;

procedure TMainForm.ActionViewStatusBarExecute(Sender: TObject);
begin
  with StatusBar do
  Visible := not Visible;
end;

procedure TMainForm.ActionViewToolbarExecute(Sender: TObject);
begin
  OptionsContainer.ToolBarVisible := not OptionsContainer.ToolBarVisible;
  PanelToolBar.Visible := OptionsContainer.ToolBarVisible;
  if PanelToolBar.Visible then
    ActionList.Images := ImagesDataModule.ImageListSmall
  else
    ActionList.Images := ImagesDataModule.ImageList;
  if PanelMenubar.Visible and PanelToolBar.Visible then
  begin
    OptionsContainer.MenuBarVisible := False;
    PanelMenuBar.Visible := False;
  end;
end;

procedure TMainForm.ActionViewWordWrapExecute(Sender: TObject);
begin
  ActionViewWordWrap.Checked := FDocumentFrame.ToggleWordWrap;
end;

procedure TMainForm.ActionViewXMLTreeExecute(Sender: TObject);
begin
  ActionViewXMLTree.Checked := FDocumentFrame.ToggleXMLTree;
end;

procedure TMainForm.AppInstancesCmdLineReceived(Sender: TObject; CmdLine: TStrings);
var
  i: Integer;
begin
  for i := 0 to CmdLine.Count - 1 do
    FDocumentFrame.Open(CmdLine.Strings[i]);
end;

procedure TMainForm.ApplicationEventsActivate(Sender: TObject);
begin
  if Processing then
    Exit;
  FDocumentFrame.CheckFileDateTimes;
end;

procedure TMainForm.ApplicationEventsHint(Sender: TObject);
begin
  inherited;
  StatusBar.Panels[BCEDITOR_STATUSBAR_HINT_PANEL].Text := Application.Hint;
end;

procedure TMainForm.ApplicationEventsMessage(var Msg: tagMSG; var Handled: Boolean);
begin
  if Processing then
    Exit;
  SetFields;
  SetImages;
end;

procedure TMainForm.SetImages;
var
  i: Integer;
  LSpeedButton: TBCSpeedButton;
begin
  SpeedButtonMacroPlay.Images := ImagesDataModule.ImageListSmall;
  SpeedButtonMacroRecordPause.Images := ImagesDataModule.ImageListSmall;
  SpeedButtonMacroStop.Images := ImagesDataModule.ImageListSmall;
  PopupMenuEditor.Images := ImagesDataModule.ImageListSmall;

  for i := 0 to PanelToolBar.ControlCount - 1 do
  if PanelToolBar.Controls[i] is TBCSpeedButton then
  begin
    LSpeedButton := TBCSpeedButton(PanelToolBar.Controls[i]);
    LSpeedButton.Images := ImagesDataModule.ImageListSmall;
  end;
end;

procedure TMainForm.SetFields;
var
  ActiveDocumentName: string;
  ActiveDocumentFound: Boolean;
  InfoText: string;
  KeyState: TKeyboardState;
  SelectionFound: Boolean;
  IsSQLDocument: Boolean;
  IsXMLDocument: Boolean;
begin
  FProcessingEventHandler := True;
  try
    ActiveDocumentFound := FDocumentFrame.ActiveDocumentFound;
    SelectionFound := FDocumentFrame.SelectionFound;
    IsSQLDocument := FDocumentFrame.IsSQLDocument;
    IsXMLDocument := FDocumentFrame.IsXMLDocument;

    ActionViewMainMenu.Checked := Assigned(Menu);
    ActionViewToolbar.Checked := PanelToolBar.Visible;
    ActionViewMenuBar.Checked := PanelMenuBar.Visible;
    ActionViewStatusbar.Checked := StatusBar.Visible;
    ActionViewOutput.Checked := PanelOutput.Visible;
    ActionViewDirectory.Enabled := FDirectoryFrame.IsAnyDirectory;
    ActionViewDirectory.Checked := PanelDirectory.Visible;
    SplitterHorizontal.Visible := PanelOutput.Visible;

    SetMargins;

    TitleBar.Items[2].Visible := ActionViewEncodingSelection.Checked;
    TitleBar.Items[3].Visible := TitleBar.Items[2].Visible;
    TitleBar.Items[4].Visible := ActionViewHighlighterSelection.Checked;
    TitleBar.Items[5].Visible := TitleBar.Items[4].Visible;
    TitleBar.Items[6].Visible := ActionViewColorSelection.Checked;
    TitleBar.Items[7].Visible := TitleBar.Items[6].Visible;

    ActionViewXMLTree.Enabled := ActiveDocumentFound and IsXMLDocument;
    if ActionViewXMLTree.Enabled then
     ActionViewXMLTree.Checked := FDocumentFrame.XMLTreeVisible;

    ActiveDocumentName := FDocumentFrame.ActiveDocumentName;
    if ActiveDocumentName = '' then
      ActiveDocumentName := FDocumentFrame.ActiveTabSheetCaption;

    if ActiveDocumentName = '' then
      TitleBar.Items[1].Caption := Application.Title
    else
      TitleBar.Items[1].Caption := Format(Application.Title + MAIN_CAPTION_DOCUMENT, [ActiveDocumentName]);
    ActionFileProperties.Enabled := ActiveDocumentFound and (ActiveDocumentName <> '');

    ActionFileReopen.Enabled := PopupMenuFileReopen.Items.Count > 0;
    ActionFileClose.Enabled := FDocumentFrame.OpenTabSheetCount > 0;
    ActionFileCloseAll.Enabled := ActionFileClose.Enabled;
    ActionFileCloseAllOther.Enabled := ActionFileClose.Enabled;
    ActionViewNextPage.Enabled := FDocumentFrame.OpenTabSheetCount > 1;
    ActionViewPreviousPage.Enabled := ActionViewNextPage.Enabled;
    ActionFileSaveAs.Enabled := ActionFileClose.Enabled and ActiveDocumentFound;
    ActionFileSave.Enabled := FDocumentFrame.ActiveDocumentModified and ActiveDocumentFound;
    ActionFileSaveAll.Enabled := FDocumentFrame.ModifiedDocuments and ActiveDocumentFound;
    ActionFilePrint.Enabled := ActionFileClose.Enabled and ActiveDocumentFound;
    ActionFilePrintPreview.Enabled := ActionFileClose.Enabled and ActiveDocumentFound;
    ActionFileSelectFromDirectory.Enabled := PanelDirectory.Visible and ActiveDocumentFound and FDirectoryFrame.IsAnyDirectory;
    ActionEditUndo.Enabled := ActionFileClose.Enabled and FDocumentFrame.CanUndo and ActiveDocumentFound;
    ActionEditRedo.Enabled := ActionFileClose.Enabled and FDocumentFrame.CanRedo and ActiveDocumentFound;
    ActionEditCut.Enabled := SelectionFound and ActiveDocumentFound;
    ActionEditCopy.Enabled := ActionEditCut.Enabled and ActiveDocumentFound;
    ActionEditSelectAll.Enabled := ActiveDocumentFound;
    ActionEditIndentIncrease.Enabled := SelectionFound;
    ActionEditIndentDecrease.Enabled := SelectionFound;
    ActionEditToggleCase.Enabled := SelectionFound;
    ActionEditInsertTag.Enabled := ActiveDocumentFound;
    ActionEditInsertDateTime.Enabled := ActiveDocumentFound;
    ActionEditInsertLine.Enabled := ActiveDocumentFound;
    ActionEditDeleteWord.Enabled := ActiveDocumentFound;
    ActionEditDeleteLine.Enabled := ActiveDocumentFound;
    ActionEditDeleteEndOfLine.Enabled := ActiveDocumentFound;

    ActionEditPaste.Enabled := Clipboard.HasFormat(CF_TEXT) and ActiveDocumentFound;

    ActionViewSelectionMode.Enabled := ActiveDocumentFound;
    ActionViewSelectionMode.Checked := ActiveDocumentFound and FDocumentFrame.SelectionModeChecked;
    ActionViewSplit.Enabled := False; // TODO: not implemented ActiveDocumentFound;
    ActionViewSplit.Checked := False; // TODO: not implemented ActiveDocumentFound and FDocumentFrame.SplitChecked;
    ActionViewMinimap.Enabled := ActiveDocumentFound;
    ActionViewMinimap.Checked := ActiveDocumentFound and FDocumentFrame.MinimapChecked;

    ActionSearchSearch.Enabled := ActiveDocumentFound;
    ActionSearchGotoLine.Enabled := ActiveDocumentFound;
    ActionSearchReplace.Enabled := ActiveDocumentFound;
    ActionSearchFindInFiles.Enabled := Assigned(FOutputFrame) and not FOutputFrame.ProcessingTabSheet;
    ActionSearchFindNext.Enabled := ActiveDocumentFound;
    ActionSearchFindPrevious.Enabled := ActiveDocumentFound;
    ActionSearchToggleBookmark.Enabled := OptionsContainer.LeftMarginShowBookmarks and ActiveDocumentFound;
    ActionSearchToggleBookmarks.Enabled := ActionSearchToggleBookmark.Enabled;
    ActionSearchGotoBookmarks.Enabled := ActionSearchToggleBookmark.Enabled;
    ActionSearchClearBookmarks.Enabled := ActionSearchToggleBookmark.Enabled;

    ActionViewWordWrap.Enabled := ActiveDocumentFound;
    ActionViewLineNumbers.Enabled := Assigned(FDocumentFrame) and (FDocumentFrame.OpenTabSheetCount > 0);
    ActionViewSpecialChars.Enabled := ActionViewLineNumbers.Enabled;
    ActionDocumentInfo.Enabled := ActiveDocumentFound;
    ActionToolsSelectForCompare.Enabled := False; // TODO: not implemented ActiveDocumentFound and not FDocumentFrame.ActiveDocumentModified;
    ActionToolsCompareFiles.Enabled := False; // TODO: not implemented
    ActionDocumentFormatSQL.Enabled := FSQLFormatterDLLFound and ActiveDocumentFound and IsSQLDocument;
    ActionDocumentFormatXML.Enabled := ActiveDocumentFound and IsXMLDocument;

    ActionViewOutput.Enabled := FOutputFrame.IsAnyOutput;
    if not ActionViewOutput.Enabled then { if there's no output then hide panel }
      PanelOutput.Visible := False;

    if not FDirectoryFrame.IsAnyDirectory then
    begin
      SplitterVertical.Visible := False;
      PanelDirectory.Visible := False;
    end;

    ActionViewEditDirectory.Enabled := PanelDirectory.Visible;
    ActionViewCloseDirectory.Enabled := PanelDirectory.Visible;
    ActionViewFiles.Enabled := FDirectoryFrame.IsAnyDirectory and (FDirectoryFrame.SelectedPath <> '');

    if ActiveDocumentFound then
    begin
      //InfoText := FDocumentFrame.GetCaretInfo;
      //if StatusBar.Panels[1].Text <> InfoText then
      //  StatusBar.Panels[1].Text := InfoText;

      InfoText := FDocumentFrame.GetModifiedInfo;
      if StatusBar.Panels[3].Text <> InfoText then
        StatusBar.Panels[3].Text := InfoText;
    end
    else
    begin
      //StatusBar.Panels[1].Text := '';
      StatusBar.Panels[3].Text := '';
    end;
    GetKeyboardState(KeyState);
    if KeyState[VK_INSERT] = 0 then
      if StatusBar.Panels[2].Text <> LanguageDataModule.GetConstant('Insert') then
        StatusBar.Panels[2].Text := LanguageDataModule.GetConstant('Insert');
    if KeyState[VK_INSERT] = 1 then
      if StatusBar.Panels[2].Text <> LanguageDataModule.GetConstant('Overwrite') then
        StatusBar.Panels[2].Text := LanguageDataModule.GetConstant('Overwrite');
    { Macro }
    ActionMacroRecordPause.Enabled := ActiveDocumentFound;
    ActionMacroStop.Enabled := ActiveDocumentFound and FDocumentFrame.IsRecordingMacro;
    ActionMacroPlayback.Enabled := ActiveDocumentFound and FDocumentFrame.IsMacroStopped;
    ActionMacroOpen.Enabled := ActiveDocumentFound;
    ActionMacroSaveAs.Enabled := ActionMacroPlayback.Enabled;
    TitleBar.Items[0].Visible := not PanelMenubar.Visible;
    FProcessingEventHandler := False;
  except
    { intentionally silent }
  end;
end;

procedure TMainForm.SetBookmarks;
var
  i: Integer;
  BookmarkList: TBCEditorBookmarkList;
  LActionGotoBookmarks, LActionToggleBookmarks: TAction;
begin
  if OptionsContainer.LeftMarginShowBookmarks then
  begin
    BookmarkList := FDocumentFrame.GetActiveBookmarkList;
    { Bookmarks }
    for i := 1 to 9 do
    begin
      LActionGotoBookmarks := TAction(FindComponent(Format('ActionGotoBookmarks%d', [i])));
      if Assigned(LActionGotoBookmarks) then
      begin
        LActionGotoBookmarks.Enabled := False;
        LActionGotoBookmarks.Caption := Format('%s &%d', [LanguageDataModule.GetConstant('Bookmark'), i]);
      end;
      LActionToggleBookmarks := TAction(FindComponent(Format('ActionToggleBookmarks%d', [i])));
      if Assigned(LActionToggleBookmarks) then
        LActionToggleBookmarks.Caption := Format('%s &%d', [LanguageDataModule.GetConstant('Bookmark'), i]);
    end;
    if Assigned(BookmarkList) then
    for i := 0 to BookmarkList.Count - 1 do
    begin
      LActionGotoBookmarks := TAction(FindComponent(Format('ActionGotoBookmarks%d', [BookmarkList.Items[i].Index + 1])));
      if Assigned(LActionGotoBookmarks) then
      begin
        LActionGotoBookmarks.Enabled := True;
        LActionGotoBookmarks.Caption := Format('%s &%d: %s %d', [LanguageDataModule.GetConstant('Bookmark'),
          BookmarkList.Items[i].Index + 1, LanguageDataModule.GetConstant('Line'), BookmarkList.Items[i].Line]);
      end;
      LActionToggleBookmarks := TAction(FindComponent(Format('ActionToggleBookmarks%d', [BookmarkList.Items[i].Index + 1])));
      if Assigned(LActionToggleBookmarks) then
        LActionToggleBookmarks.Caption := Format('%s &%d: %s %d', [LanguageDataModule.GetConstant('Bookmark'),
          BookmarkList.Items[i].Index + 1, LanguageDataModule.GetConstant('Line'), BookmarkList.Items[i].Line]);
    end;
  end;
end;

procedure TMainForm.CreateLanguageMenu(AMenuItem: TMenuItem);
var
  LanguagePath, FileName, ExtractedFileName, LanguageName: string;
  LMenuItem: TMenuItem;
begin
  ActionToolBarMenuLanguage.Enabled := False;
  AMenuItem.Clear;

  LanguagePath := IncludeTrailingPathDelimiter(Format('%s%s', [ExtractFilePath(ParamStr(0)), 'Languages']));
  if not DirectoryExists(LanguagePath) then
    Exit;

  LanguageName := GetSelectedLanguage('English');
  for FileName in TDirectory.GetFiles(LanguagePath, '*.lng') do
  begin
    LMenuItem := TMenuItem.Create(Application);
    ExtractedFileName := ExtractFilename(ChangeFileExt(FileName, ''));
    LMenuItem.Caption := ExtractedFileName;
    LMenuItem.OnClick := LanguageMenuClick;
    LMenuItem.Checked := LanguageName = ExtractedFileName;
    LMenuItem.RadioItem := True;
    AMenuItem.Add(LMenuItem);
  end;
  ActionToolBarMenuLanguage.Enabled := AMenuItem.Count > 0;
end;

procedure TMainForm.DragDropDrop(Sender: TObject; Pos: TPoint; Value: TStrings);
var
  i, j: Integer;
begin
  Screen.Cursor := crHourGlass;
  try
    j := Value.Count;
    ProgressBar.Count := j;
    ProgressBar.Show;
    if FDocumentFrame.IsCompareFilesActivePage then
    begin
      if j > 1 then
        for i := 0 to j - 1 do
        begin
          ProgressBar.StepIt;
          FDocumentFrame.CompareFiles(Value.Strings[i]);
        end
      else
        FDocumentFrame.CompareFiles(Value.Strings[0], True)
    end
    else
    for i := 0 to j - 1 do
    begin
      ProgressBar.StepIt;
      FDocumentFrame.Open(Value.Strings[i]);
    end;
  finally
    ProgressBar.Hide;
    Screen.Cursor := crDefault;
  end;
end;

procedure TMainForm.LanguageMenuClick(Sender: TObject);
var
  LCaption: string;
begin
  LCaption := StringReplace(TMenuItem(Sender).Caption, '&', '', [rfReplaceAll]);

  with TBigIniFile.Create(GetIniFilename) do
  try
    WriteString('Options', 'Language', LCaption);
  finally
    Free;
  end;

  TMenuItem(Sender).Checked := True;

  Self.ReadLanguageFile(LCaption);
end;

procedure TMainForm.ReadLanguageFile(ALanguage: string);
begin
  if ALanguage = '' then
    Exit;

  { language constants }
  BCCommon.Language.Strings.ReadLanguageFile(ALanguage);
  { mainform }
  UpdateLanguage(Self, ALanguage);
  { frames }
  UpdateLanguage(TForm(FDirectoryFrame), ALanguage);
  FDocumentFrame.UpdateLanguage(ALanguage);
  UpdateLanguage(TForm(FOutputFrame), ALanguage);
  { menubar }
  UpdateMenuBarLanguage;
  SendMessage(Application.MainForm.Handle, WM_SIZE, 0, 0);
end;

procedure TMainForm.UpdateMenuBarLanguage;

  procedure InitializeSpeedButtons(Panels: array of TBCPanel);
  var
    i, j: Integer;
    s: string;
    LSpeedButton: TBCSpeedButton;
    LTextWidth: Integer;
    LAction: TBasicAction;
  begin
    for j := 0 to Length(Panels) - 1 do
      for i := 0 to Panels[j].ControlCount - 1 do
      if Panels[j].Controls[i] is TBCSpeedButton then
      begin
        LSpeedButton := TBCSpeedButton(Panels[j].Controls[i]);
        LSpeedButton.Images := ImagesDataModule.ImageList;
        if LSpeedButton.ButtonStyle <> tbsDivider then
        begin
          { Menubar items are not updated, if the action is not set }
          LAction := LSpeedButton.Action;
          LSpeedButton.Action := nil;
          LSpeedButton.Action := LAction;

          s := LSpeedButton.Caption;
          s := StringReplace(s, '.', '', [rfReplaceAll]);
          s := StringReplace(s, '&', '', [rfReplaceAll]);
          LSpeedButton.Caption := s;
          LTextWidth := LSpeedButton.Canvas.TextWidth(s);
          LSpeedButton.Width := Max(60, LTextWidth + 8);
          if LSpeedButton.ButtonStyle = tbsDropDown then
            LSpeedButton.Width := LSpeedButton.Width + 12;
          LSpeedButton.Width := LSpeedButton.Width - s.CountChar(',') * LSpeedButton.Canvas.TextWidth(',');
        end;
      end;
  end;

  function RemoveShortCut(AText: string): string;
  begin
    Result := StringReplace(AText, '&', '', [rfReplaceAll]);
  end;

begin
  { Captions }
  TabSheetFile.Caption := RemoveShortCut(ActionFile.Caption);
  TabSheetEdit.Caption := RemoveShortCut(ActionEdit.Caption);
  TabSheetSearch.Caption := RemoveShortCut(ActionSearch.Caption);
  TabSheetView.Caption := RemoveShortCut(ActionView.Caption);
  TabSheetDocument.Caption := RemoveShortCut(ActionDocument.Caption);
  TabSheetTools.Caption := RemoveShortCut(ActionTools.Caption);
  TabSheetHelp.Caption := RemoveShortCut(ActionHelp.Caption);
  { Buttons }
  InitializeSpeedButtons([PanelFileButtons, PanelEditButtons, PanelSearchButtons, PanelViewButtons,
    PanelDocumentButtons, PanelToolsButtons, PanelHelpButtons]);
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
  Rslt: Integer;
begin
  if FOutputFrame.ProcessingTabSheet then
    FOutputFrame.CloseTabSheet;
  if FDocumentFrame.ModifiedDocuments then
  begin
    Rslt := SaveChanges;
    if Rslt = mrYes then
      FDocumentFrame.SaveAll;
    if Rslt = mrCancel then
    begin
      Action := caNone;
      Exit;
    end;
  end;
end;

function TMainForm.GetStringList(APopupMenu: TPopupMenu): TStringList;
var
  i: Integer;
begin
  Result := TStringList.Create;
  for i := 0 to APopupMenu.Items.Count - 1 do
    Result.Add(APopupMenu.Items[i].Caption);
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  inherited;

  PageControlToolBar.ActivePage := TabSheetFile;

  FImageListCount := ImagesDataModule.ImageListSmall.Count; { System images are appended after menu icons for file reopen }
  ReadIniOptions;
  CreateToolBar(True);
  CreateFrames;
  ReadIniSizePositionAndState;
  SetOptions;
  SetMargins;

  FSQLFormatterDLLFound := FileExists(GetSQLFormatterDLLFilename);

  CreateLanguageMenu(MenuItemToolBarMenuLanguage);
  CreateSkinsMenu(MenuItemToolBarMenuSkin);
  GetHighlighters;
  GetHighlighterColors;

  OptionsContainer.EncodingStrings := GetStringList(PopupMenuEncoding);
  OptionsContainer.HighlighterStrings := GetStringList(PopupMenuHighlighters);
  OptionsContainer.ColorStrings := GetStringList(PopupMenuColors);

  MainMenu.Images := ImagesDataModule.ImageListSmall;
  OnSkinChange := ChangeSkin;
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  if not FNoIni then
  begin
    OptionsContainer.WriteIniFile;
    FDocumentFrame.WriteIniFile;
    FDirectoryFrame.WriteIniFile;
    FOutputFrame.WriteOutputFile;
    WriteIniFile;
  end;
  OptionsContainer.Free;
  inherited;
end;

procedure TMainForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Shift = [ssCtrl]) and (Key = 9) then
    FDocumentFrame.NextPage;
end;

procedure TMainForm.SetMargins;
begin
  if PanelToolBar.Visible then
  begin
    PanelDirectory.Margins.Top := 1;
    PanelDocument.Margins.Top := 1;
  end
  else
  begin
    PanelDirectory.Margins.Top := 5;
    PanelDocument.Margins.Top := 5;
  end;
  if PanelOutput.Visible then
  begin
    PanelDirectory.Margins.Bottom := 0;
    PanelDocument.Margins.Bottom := 0;
  end
  else
  begin
    PanelDirectory.Margins.Bottom := 5;
    PanelDocument.Margins.Bottom := 5;
  end;
end;

procedure TMainForm.SetOptions;
var
  PanelWidth: Integer;
begin
  TitleBar.Items[6].Caption := OptionsContainer.DefaultHighlighterColor;

  PanelToolbar.Visible := OptionsContainer.ToolbarVisible;
  PanelMenuBar.Visible := OptionsContainer.MenuBarVisible;
  if OptionsContainer.MainMenuVisible then
    Menu := MainMenu
  else
    Menu := nil;
  { MainMenu }
  if OptionsContainer.MainMenuUseSystemFont then
  begin
    Screen.MenuFont.Name := OptionsContainer.MainMenuSystemFontName;
    Screen.MenuFont.Size := OptionsContainer.MainMenuSystemFontSize;
  end
  else
  begin
    Screen.MenuFont.Name := OptionsContainer.MainMenuFontName;
    Screen.MenuFont.Size := OptionsContainer.MainMenuFontSize;
  end;
  { StatusBar }
  StatusBar.Panels[3].Width := STATUS_BAR_PANEL_WIDTH;
  PanelWidth := StatusBar.Canvas.TextWidth(StatusBar.Panels[3].Text) + 10;
  if PanelWidth > STATUS_BAR_PANEL_WIDTH then
    StatusBar.Panels[3].Width := PanelWidth;
  OptionsContainer.AssignTo(StatusBar);
  { Output }
  if Assigned(FOutputFrame) then
    FOutputFrame.SetOptions;
  { Directory }
  if Assigned(FDirectoryFrame) then
  begin
    FDirectoryFrame.SetOptions;
    FDirectoryFrame.ActionDirectoryRefresh.Execute;
  end;
end;

procedure TMainForm.FormShow(Sender: TObject);
var
  i: Integer;
  Editor: TBCEditor;
begin
  inherited;

  if not FDocumentFrame.ReadIniOpenFiles and (ParamCount = 0) or
    (ParamCount = 1) and (ParamStr(1) = PARAM_NO_INI) then
    FDocumentFrame.New;

  FNoIni := False;
  if ParamCount > 0 then
  for i := 1 to ParamCount do
  begin
    if ParamStr(i) = PARAM_NO_INI then
      FNoIni := True
    else
    if ParamStr(i) = PARAM_NO_SKIN then
      SkinManager.Active := False
    else
      FDocumentFrame.Open(ParamStr(i), nil, 0, 0, True);
  end;

  Self.ReadLanguageFile(GetSelectedLanguage('English'));

  CreateFileReopenList;

  Editor := FDocumentFrame.GetActiveEditor;
  if Assigned(Editor) then
    if Editor.CanFocus then
      Editor.SetFocus;
end;

procedure TMainForm.SkinManagerGetMenuExtraLineData(FirstItem: TMenuItem; var SkinSection, Caption: string;
  var Glyph: TBitmap; var LineVisible: Boolean);
begin
  inherited;

  if FirstItem = PopupMenuHighlighters.Items[0] then
  begin
    LineVisible := True;
    Caption :=  LanguageDataModule.GetConstant('Highlighter');
  end
  else
  if FirstItem = PopupMenuColors.Items[0] then
  begin
    LineVisible := True;
    Caption := LanguageDataModule.GetConstant('Color');
  end
  else
  if FirstItem = PopupMenuEncoding.Items[0] then
  begin
    LineVisible := True;
    Caption := LanguageDataModule.GetConstant('Encoding');
  end
  else
    LineVisible := False;
end;

procedure TMainForm.StatusBarDrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel; const Rect: TRect);
var
  LRect: TRect;
begin
  inherited;
  if Panel.Index = 1 then
  begin
    AlphaImageListStatusBar.Draw(StatusBar.Canvas, Rect.Left, Rect.Top + 1, 0);

    LRect := Rect;
    LRect.Left := LRect.Left + AlphaImageListStatusBar.Width + 4;

    if SkinManager.Active then
      acWriteTextEx(StatusBar.Canvas, PACChar(FDocumentFrame.CaretInfo), True, LRect, DT_SINGLELINE or DT_VCENTER,
        SkinProvider.SkinData, True)
    else
    begin
      StatusBar.Canvas.Brush.Style := bsClear;
      StatusBar.Canvas.Font.Assign(StatusBar.Font);
      StatusBar.Canvas.TextOut(LRect.Left, LRect.Top + 6, FDocumentFrame.CaretInfo);
    end;
  end;
end;

procedure TMainForm.TitleBarItems2MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  LMenuItem: TMenuItem;
begin
  LMenuItem := PopupMenuEncoding.Items.Find(TitleBar.Items[2].Caption);
  if Assigned(LMenuItem) then
    LMenuItem.Checked := True;
end;

procedure TMainForm.TitleBarItems4MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  LMenuItem: TMenuItem;
begin
  LMenuItem := PopupMenuHighlighters.Items.Find(TitleBar.Items[4].Caption);
  if Assigned(LMenuItem) then
    LMenuItem.Checked := True;
end;

procedure TMainForm.TitleBarItems6MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  LMenuItem: TMenuItem;
begin
  LMenuItem := PopupMenuColors.Items.Find(TitleBar.Items[6].Caption);
  if Assigned(LMenuItem) then
    LMenuItem.Checked := True;
end;

procedure TMainForm.ReadIniOptions;
var
  i: Integer;
begin
  OptionsContainer.ReadIniFile;
  SQLFormatterOptionsContainer.ReadIniFile;

  with TBigIniFile.Create(GetIniFilename) do
  try
    { Options }
    StatusBar.Visible := ReadBool('Options', 'ShowStatusbar', True);
    PanelDirectory.Visible := ReadBool('Options', 'ShowDirectory', True);
    TitleBar.Items[2].Visible := ReadBool('Options', 'ShowEncodingSelection', True);
    TitleBar.Items[4].Visible := ReadBool('Options', 'ShowHighlighterSelection', True);
    TitleBar.Items[6].Visible := ReadBool('Options', 'ShowHighlighterColorSelection', True);
    SplitterVertical.Visible := PanelDirectory.Visible;

    ActionViewXMLTree.Checked := OptionsContainer.ShowXMLTree;
    ActionViewWordWrap.Checked := OptionsContainer.EnableWordWrap;
    ActionViewLineNumbers.Checked := OptionsContainer.EnableLineNumbers;
    ActionViewSpecialChars.Checked := OptionsContainer.EnableSpecialChars;
    ActionViewSelectionMode.Checked := OptionsContainer.EnableSelectionMode;
    ActionViewEncodingSelection.Checked := TitleBar.Items[2].Visible;
    ActionViewHighlighterSelection.Checked := TitleBar.Items[4].Visible;
    ActionViewColorSelection.Checked := TitleBar.Items[6].Visible;

    { if items doesn't exist in ini, create them }
    if not SectionExists('ToolBarItems') then
      for i := 1 to Length(ToolBarItemsArray) do
         WriteString('ToolBarItems', IntToStr(i - 1), ToolBarItemsArray[i]);
    SkinManager.SkinName := ReadString('Options', 'SelectedSkin', 'MetroUI');
  finally
    Free;
  end;
end;

procedure OutputOpenAllEvent(var FileNames: TStrings);
var
  i, j: Integer;
begin
  Screen.Cursor := crHourGlass;
  try
    j := FileNames.Count;
    MainForm.ProgressBar.Count := j;
    MainForm.ProgressBar.Show;
    for i := 0 to j - 1 do
    begin
      MainForm.ProgressBar.StepIt;
      MainForm.FDocumentFrame.Open(FileNames.Strings[i]);
    end;
    MainForm.ProgressBar.Hide;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TMainForm.CreateFrames;
begin
  { TOutputFrame }
  FOutputFrame := TOutputFrame.Create(PanelOutput);
  FOutputFrame.Parent := PanelOutput;
  FOutputFrame.OnTabsheetDblClick := OutputDblClickActionExecute;
  FOutputFrame.OnOpenAll := OutputOpenAllEvent;
  FOutputFrame.ReadOutputFile;
  PanelOutput.Visible := FOutputFrame.IsAnyOutput;
  { TDocumentFrame }
  FDocumentFrame := TDocumentFrame.Create(PanelDocument);
  FDocumentFrame.Parent := PanelDocument;
  FDocumentFrame.PopupMenu := PopupMenuDocument;
  FDocumentFrame.ProgressBar := ProgressBar;
  FDocumentFrame.StatusBar := StatusBar;
  { TDirectoryFrame }
  FDirectoryFrame := TDirectoryFrame.Create(PanelDirectory);
  FDirectoryFrame.Parent := PanelDirectory;
  FDirectoryFrame.OnFileTreeViewClick := FileTreeViewClickActionExecute;
  FDirectoryFrame.OnFileTreeViewDblClick := FileTreeViewDblClickActionExecute;
  FDirectoryFrame.OnSearchForFilesOpenFile := DoSearchForFilesOpenFile;
  FDirectoryFrame.ActionSearchForFiles := ActionSearchFindInFiles;
end;

procedure TMainForm.ReadIniSizePositionAndState;
var
  State: Integer;
begin
  with TBigIniFile.Create(GetIniFilename) do
  try
    { Size }
    Width := ReadInteger('Size', 'Width', Round(Screen.Width * 0.8));
    Height := ReadInteger('Size', 'Height', Round(Screen.Height * 0.8));
    { Position }
    Left := ReadInteger('Position', 'Left', (Screen.Width - Width) div 2);
    Top := ReadInteger('Position', 'Top', (Screen.Height - Height) div 2);
    { Check if the form is outside the workarea }
    Left := SetFormInsideWorkArea(Left, Width);
    { Directory }
    PanelDirectory.Width := ReadInteger('Options', 'DirectoryWidth', 288);
    Application.ProcessMessages;
    { State }
    State := ReadInteger('Size', 'State', 0);
    case State of
      0: WindowState := wsNormal;
      1: WindowState := wsMinimized;
      2: WindowState := wsMaximized;
    end;
  finally
    Free;
  end;
end;

procedure TMainForm.CreateFileReopenList;
var
  i, j, ImageIndex: Integer;
  s: string;
  Files: TStrings;
  LMenuItem, LMenuItem2: TMenuItem;
  LSystemImageList: TBCImageList;
  LSysImageList: THandle;
  Icon: TIcon;
begin
  LSystemImageList := TBCImageList.Create(nil);
  try
    LSysImageList := GetSysImageList;
    if LSysImageList <> 0 then
      LSystemImageList.Handle := LSysImageList;
    { Remove added images from imagelist }
    while FImageListCount < ImagesDataModule.ImageListSmall.Count do
      ImageList_Remove(ImagesDataModule.ImageListSmall.Handle, FImageListCount);

    PopupMenuFileReopen.Items.Clear;
    MenuItemMainMenuFileReopen.Clear;

    Files := TStringList.Create;
    with TBigIniFile.Create(GetIniFilename) do
    try
      ReadSectionValues('FileReopenFiles', Files);
      { Files }
      j := 0;
      for i := 0 to Files.Count - 1 do
      begin
        s := System.Copy(Files.Strings[i], Pos('=', Files.Strings[i]) + 1, Length(Files.Strings[i]));
        if FileExists(s) then
        begin
          LMenuItem := TMenuItem.Create(PopupMenuFileReopen);
          LMenuItem2 :=  TMenuItem.Create(MainMenu);
          LMenuItem.Action := ActionSelectReopenFile;
          LMenuItem2.Action := ActionSelectReopenFile;
          LMenuItem.Caption := Format('%d %s', [j, s]);
          LMenuItem2.Caption := Format('%d %s', [j, s]);
          { Add image to imagelist }
          Icon := TIcon.Create;
          try
            ImageIndex := GetIconIndex(s, SHGFI_ICON or SHGFI_ADDOVERLAYS);
            LSystemImageList.GetIcon(ImageIndex, Icon);
            ImageIndex := ImageList_AddIcon(ImagesDataModule.ImageListSmall.Handle, Icon.Handle);
          finally
            Icon.Free;
          end;
          LMenuItem.ImageIndex := ImageIndex;
          LMenuItem2.ImageIndex := ImageIndex;
          Inc(j);

          PopupMenuFileReopen.Items.Add(LMenuItem);
          MenuItemMainMenuFileReopen.Add(LMenuItem2);
        end;
      end;

      { Divider }
      if Files.Count > 0 then
      begin
        LMenuItem := TMenuItem.Create(PopupMenuFileReopen);
        LMenuItem.Caption := '-';
        PopupMenuFileReopen.Items.Add(LMenuItem);
        LMenuItem := TMenuItem.Create(MainMenu);
        LMenuItem.Caption := '-';
        MenuItemMainMenuFileReopen.Add(LMenuItem);
        { Clear }
        LMenuItem := TMenuItem.Create(PopupMenuFileReopen);
        LMenuItem.Action := ActionFileReopenClear;
        PopupMenuFileReopen.Items.Add(LMenuItem);
        LMenuItem := TMenuItem.Create(MainMenu);
        LMenuItem.Action := ActionFileReopenClear;
        MenuItemMainMenuFileReopen.Add(LMenuItem);
      end;
    finally
      Free;
      Files.Free;
    end;
  finally
    LSystemImageList.Free;
  end;
end;

procedure TMainForm.OutputDblClickActionExecute(Sender: TObject);
var
  Filename: string;
  Ln, Ch: LongWord;
begin
  if FOutputFrame.SelectedLine(Filename, Ln, Ch) then
    FDocumentFrame.Open(Filename, nil, Ln, Ch);
end;

procedure TMainForm.FileTreeViewClickActionExecute(Sender: TObject);
begin
  if Assigned(FDirectoryFrame) then
    StatusBar.Panels[4].Text := FDirectoryFrame.SelectedFile;
end;

procedure TMainForm.FileTreeViewDblClickActionExecute(Sender: TObject);
var
  Filename: string;
begin
  Filename := '';
  if Assigned(FDirectoryFrame) then
    Filename := FDirectoryFrame.SelectedFile;
  if Filename <> '' then
    FDocumentFrame.Open(Filename);
end;

procedure TMainForm.SearchFindInFiles(AFolder: string = '');
var
  T1, T2: TTime;
  LEditor: TBCEditor;
  Min, Secs: Integer;
  TimeDifference: string;
  OutputTreeView: TVirtualDrawTree;
  Root: PVirtualNode;
begin
  OutputTreeView := nil;
  with FindInFilesDialog do
  begin
    if AFolder <> '' then
      FolderText := AFolder;
    LEditor := FDocumentFrame.GetActiveEditor;
    if Assigned(LEditor) then
      if LEditor.SelectionAvailable then
        ComboBoxTextToFind.Text := LEditor.SelectedText;
    if ShowModal = mrOk then
    begin
      Screen.Cursor := crHourGlass;
      try
        StatusBar.Panels[4].Text := LanguageDataModule.GetConstant('CountingFiles');
        Application.ProcessMessages;
        ProgressBar.Count := CountFilesInFolder(FolderText);
      finally
        Screen.Cursor := crDefault;
        StatusBar.Panels[4].Text := '';
      end;
      ProgressBar.Show;
      T1 := Now;
      try
        PanelOutput.Visible := True;
        OutputTreeView := FOutputFrame.AddTreeView(Format(LanguageDataModule.GetConstant('SearchFor'), [FindWhatText]));
        FOutputFrame.ProcessingTabSheet := True;
        Application.ProcessMessages;
        FindInFiles(OutputTreeView, FindWhatText, FileTypeText, FolderText, SearchCaseSensitive, LookInSubfolders);
      finally
        ProgressBar.Hide;
        T2 := Now;
        if not FOutputFrame.CancelSearch then
        begin
          if FOutputFrame.IsEmpty then
          begin
            Root := nil;
            FOutputFrame.AddTreeViewLine(OutputTreeView, Root, '', -1, 0,
              Format(LanguageDataModule.GetMessage('CannotFindString'), [FindWhatText]));
            StatusBar.Panels[3].Text := '';
          end;
          Min := StrToInt(FormatDateTime('n', T2 - T1));
          Secs := Min * 60 + StrToInt(FormatDateTime('s', T2 - T1));
          if Secs < 60 then
            TimeDifference := FormatDateTime(Format('s.zzz "%s"', [LanguageDataModule.GetConstant('Second')]), T2 - T1)
          else
            TimeDifference := FormatDateTime(Format('n "%s" s.zzz "%s"', [LanguageDataModule.GetConstant('Minute'), LanguageDataModule.GetConstant('Second')]), T2 - T1);
          StatusBar.Panels[4].Text := Format(LanguageDataModule.GetConstant('OccurencesFound'), [FOutputFrame.Count, TimeDifference])
        end;
        FOutputFrame.PageControl.EndDrag(False); { if close button pressed and search canceled, dragging will stay... }
        FOutputFrame.ProcessingTabSheet := False;
        SetFields;
      end;
    end;
  end;
end;

{ Recursive method to find files. }
procedure TMainForm.FindInFiles(AOutputTreeView: TVirtualDrawTree; AFindWhatText, AFileTypeText, AFolderText: String; ASearchCaseSensitive, ALookInSubfolders: Boolean);
var
  shFindFile: THandle;
  sWin32FD: TWin32FindData;
  S, Line: WideString;
  FName: string;
  Ln, Ch, ChPos: LongWord;
  Found: Boolean;
  StringList: TStringList;
  Root: PVirtualNode;

  function IsDirectory(dWin32FD: TWin32FindData): Boolean;
  var
    TmpAttr: DWORD;
  begin
    with dWin32FD do
    begin
      TmpAttr := dwFileAttributes and (FILE_ATTRIBUTE_READONLY or FILE_ATTRIBUTE_HIDDEN or FILE_ATTRIBUTE_SYSTEM or FILE_ATTRIBUTE_ARCHIVE or FILE_ATTRIBUTE_NORMAL or FILE_ATTRIBUTE_DIRECTORY);

      Result := (TmpAttr and FILE_ATTRIBUTE_DIRECTORY = FILE_ATTRIBUTE_DIRECTORY);
    end;
  end;
begin
  {$WARNINGS OFF} { IncludeTrailingBackslash is specific to a platform }
  shFindFile := FindFirstFile(PChar(IncludeTrailingBackslash(AFolderText) + '*.*'), sWin32FD);
  {$WARNINGS ON}
  if shFindFile <> INVALID_HANDLE_VALUE then
  try
    repeat
      if FOutputFrame.CancelSearch then
        Exit;
      FName := StrPas(sWin32FD.cFileName);

      if (FName <> '.') and (FName <> '..') then
      begin
        if ALookInSubfolders and IsDirectory(sWin32FD) then
          {$WARNINGS OFF} { IncludeTrailingBackslash is specific to a platform }
          FindInFiles(AOutputTreeView, AFindWhatText, AFileTypeText, IncludeTrailingBackslash(AFolderText) + FName, ASearchCaseSensitive, ALookInSubfolders)
          {$WARNINGS ON}
        else
        begin
          ProgressBar.StepIt;
          Application.ProcessMessages;

          //if IsExtInFileType(ExtractFileExt(FName), OptionsContainer.SupportedFileExts) then
          if (AFileTypeText = '*.*') and IsExtInFileType(ExtractFileExt(FName), OptionsContainer.SupportedFileExts) or
            IsExtInFileType(ExtractFileExt(FName), AFileTypeText) then
          begin
            {$WARNINGS OFF} { IncludeTrailingBackslash is specific to a platform }
            StringList := GetStringList(IncludeTrailingBackslash(AFolderText) + FName);
            {$WARNINGS ON}
            try
              try
                Root := nil;
                if Trim(StringList.Text) <> '' then
                for Ln := 0 to StringList.Count - 1 do
                begin
                  Found := True;
                  Line := StringList.Strings[Ln];
                  S := Line;
                  ChPos := 0;
                  while Found do
                  begin
                    if ASearchCaseSensitive then
                      Ch := Pos(WideString(AFindWhatText), S)
                    else
                      Ch := Pos(WideUpperCase(WideString(AFindWhatText)), WideUpperCase(S));
                    if Ch <> 0 then
                    begin
                      Found := True;
                      ChPos := ChPos + Ch;
                      if FOutputFrame.CancelSearch then
                        Break;
                      {$WARNINGS OFF} { IncludeTrailingBackslash is specific to a platform }
                      FOutputFrame.AddTreeViewLine(AOutputTreeView, Root, IncludeTrailingBackslash(AFolderText) + FName, Ln + 1, ChPos, Line, AFindWhatText);
                      {$WARNINGS ON}
                      S := Copy(S, Ch + LongWord(Length(AFindWhatText)), Length(S));
                      ChPos := ChPos + LongWord(Length(AFindWhatText)) - 1;
                    end
                    else
                      Found := False;
                  end;
                end
              except
                {$WARNINGS OFF}
                { IncludeTrailingBackslash is specific to a platform }
                FOutputFrame.AddTreeViewLine(AOutputTreeView, Root, '', -1, 0,
                  Format(LanguageDataModule.GetWarningMessage('FileAccessError'), [IncludeTrailingBackslash(AFolderText) + FName]), '');
                {$WARNINGS ON}
              end;
            finally
              StringList.Free;
            end;
          end;
        end;
      end;
    until not FindNextFile(shFindFile, sWin32FD);
  finally
    Winapi.Windows.FindClose(shFindFile);
  end;
end;

function TMainForm.GetStringList(AFilename: string): TStringList;
var
  LFileStream: TFileStream;
  LBuffer: TBytes;
  WithBom: Boolean;
begin
  Result := TStringList.Create;
  FEncoding := nil;
  LFileStream := TFileStream.Create(AFileName, fmOpenRead);
  try
    // Identify encoding
    if IsUTF8(LFileStream, WithBom) then
    begin
      if WithBom then
        FEncoding := TEncoding.UTF8
      else
        FEncoding := BCEditor.Encoding.TEncoding.UTF8WithoutBOM;
    end
    else
    begin
      // Read file into buffer
      SetLength(LBuffer, LFileStream.Size);
      LFileStream.ReadBuffer(Pointer(LBuffer)^, Length(LBuffer));
      TEncoding.GetBufferEncoding(LBuffer, FEncoding);
    end;
  finally
    LFileStream.Free;
  end;
  Result.LoadFromFile(AFileName, FEncoding);
end;

procedure TMainForm.WriteIniFile;
begin
  with TBigIniFile.Create(GetIniFilename) do
  try
    WriteString(Application.Title, 'Version', GetFileVersion(Application.ExeName));
    if WindowState = wsNormal  then
    begin
      { Position }
      WriteInteger('Position', 'Left', Left);
      WriteInteger('Position', 'Top', Top);
      { Size }
      WriteInteger('Size', 'Width', Width);
      WriteInteger('Size', 'Height', Height);
    end;
    WriteInteger('Size', 'State', Ord(WindowState));
    { Options }
    WriteInteger('Options', 'DirectoryWidth', PanelDirectory.Width);
    WriteBool('Options', 'ShowToolBar', PanelToolBar.Visible);
    WriteBool('Options', 'ShowStatusbar', StatusBar.Visible);
    WriteBool('Options', 'ShowDirectory', PanelDirectory.Visible);
    WriteBool('Options', 'ShowEncodingSelection', TitleBar.Items[2].Visible);
    WriteBool('Options', 'ShowHighlighterSelection', TitleBar.Items[4].Visible);
    WriteBool('Options', 'ShowHighlighterColorSelection', TitleBar.Items[6].Visible);
    WriteString('Options', 'SelectedSkin', SkinManager.SkinName);
  finally
    Free;
  end;
end;

procedure TMainForm.GetHighlighters;
var
  FindFileHandle: THandle;
  Win32FindData: TWin32FindData;
  FileName: string;
  LMenuItem: TMenuItem;
  LAction: TAction;
begin
  PopupMenuHighlighters.Items.Clear;
{$WARNINGS OFF}
  FindFileHandle := FindFirstFile(PChar(IncludeTrailingBackSlash(ExtractFilePath(Application.ExeName)) +
    'Highlighters\*.json'), Win32FindData);
{$WARNINGS ON}
  if FindFileHandle <> INVALID_HANDLE_VALUE then
  try
    //i := 1;
    repeat
      FileName := ExtractFileName(StrPas(Win32FindData.cFileName));
      FileName := Copy(FileName, 1, Pos('.', FileName) - 1);

      LAction := TAction.Create(Self);
      LAction.Caption := FileName;
      LAction.OnExecute := ActionSelectHighlighterExecute;
      LMenuItem := TMenuItem.Create(PopupMenuHighlighters);
      LMenuItem.Action := LAction;
      LMenuItem.RadioItem := True;
      LMenuItem.AutoCheck := True;
      //if i mod 20 = 0 then
      //  LMenuItem.Break := mbBreak;
      //Inc(i);
      PopupMenuHighlighters.Items.Add(LMenuItem);
    until not FindNextFile(FindFileHandle, Win32FindData);
  finally
    Winapi.Windows.FindClose(FindFileHandle);
  end;
end;

procedure TMainForm.GetHighlighterColors;
var
  FindFileHandle: THandle;
  Win32FindData: TWin32FindData;
  FileName: string;
  LMenuItem: TMenuItem;
  LAction: TAction;
begin
  PopupMenuColors.Items.Clear;
{$WARNINGS OFF}
  FindFileHandle := FindFirstFile(PChar(IncludeTrailingBackSlash(ExtractFilePath(Application.ExeName)) +
    'Colors\*.json'), Win32FindData);
{$WARNINGS ON}
  if FindFileHandle <> INVALID_HANDLE_VALUE then
  try
    repeat
      FileName := ExtractFileName(StrPas(Win32FindData.cFileName));
      FileName := Copy(FileName, 1, Pos('.', FileName) - 1);
      LAction := TAction.Create(Self);
      LAction.Caption := FileName;
      LAction.OnExecute := ActionSelectHighlighterColorExecute;
      LMenuItem := TMenuItem.Create(PopupMenuColors);
      LMenuItem.Action := LAction;
      LMenuItem.RadioItem := True;
      LMenuItem.AutoCheck := True;
      PopupMenuColors.Items.Add(LMenuItem);
    until not FindNextFile(FindFileHandle, Win32FindData);
  finally
    Winapi.Windows.FindClose(FindFileHandle);
  end;
end;

function TMainForm.GetHighlighterColor: string;
begin
  Result := TitleBar.Items[6].Caption;
end;

procedure TMainForm.SetTitleBarMenus;
var
  LEditor: TBCEditor;
begin
  LEditor := FDocumentFrame.GetActiveEditor;
  if Assigned(LEditor) then
  begin
    { Encoding }
    if LEditor.Encoding = TEncoding.ASCII then
      TitleBar.Items[2].Caption := 'ASCII'
    else
    if LEditor.Encoding = TEncoding.BigEndianUnicode then
      TitleBar.Items[2].Caption := 'Big Endian Unicode'
    else
    if LEditor.Encoding = TEncoding.Unicode then
      TitleBar.Items[2].Caption := 'Unicode'
    else
    if LEditor.Encoding = TEncoding.UTF7 then
      TitleBar.Items[2].Caption := 'UTF-7'
    else
    if LEditor.Encoding = TEncoding.UTF8 then
      TitleBar.Items[2].Caption := 'UTF-8'
    else
    if LEditor.Encoding = BCEditor.Encoding.TEncoding.UTF8WithoutBOM then
      TitleBar.Items[2].Caption := 'UTF-8 without BOM'
    else
      TitleBar.Items[2].Caption := 'ANSI';
    { Highlighter }
    TitleBar.Items[4].Caption := LEditor.Highlighter.Name;
    { Color }
    TitleBar.Items[6].Caption := LEditor.Highlighter.Colors.Name;
  end;
end;


{
procedure TMainForm.ToolsDuplicateCheckerActionExecute(Sender: TObject);
var
  DuplicateChecker: TDuplicateChecker;
begin
  with DuplicateCheckerOptionsDialog do
  try
    Extensions := OptionsContainer.Extensions;
    if Open then
    begin
      DuplicateChecker := TDuplicateChecker.Create(InputFolderName, FileTypeText, OutputFileName, MinBlockSize, MinChars, RemoveComments);
      try
        DuplicateChecker.Run;
        if LaunchAfterCreation then
          FDocumentFrame.Open(OutputFileName);
      finally
        DuplicateChecker.Free;
      end;
    end;
  finally
    Free;
  end;
end;

procedure TMainForm.ToolsMapVirtualDrivesActionExecute(Sender: TObject);
begin
  MapVirtualDrivesForm.Open;
  FDirectoryFrame.Refresh;
end;
}

end.
