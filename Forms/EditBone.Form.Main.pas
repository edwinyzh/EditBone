
unit EditBone.Form.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BCCommon.Forms.Base, System.Actions, Vcl.ActnList, Vcl.AppEvnts, Vcl.Menus,
  sSkinProvider, BCComponents.SkinProvider, acTitleBar, BCComponents.TitleBar, sSkinManager, BCComponents.SkinManager,
  Vcl.ComCtrls, sStatusBar, BCControls.StatusBar, Vcl.ExtCtrls, sPanel, BCControls.Panel, sSplitter, BCControls.Splitter,
  sPageControl, BCControls.PageControl, BCCommon.Images, BCControls.SpeedButton, Vcl.Buttons, sSpeedButton,
  EditBone.Directory, EditBone.Document, EditBone.Frame.Output, VirtualTrees, BCEditor.Print.Types,
  Vcl.ActnMan, Vcl.ActnMenus, BCComponents.DragDrop, System.Diagnostics,
  Vcl.PlatformDefaultStyleActnCtrls, JvAppInst, System.ImageList, Vcl.ImgList,
  acAlphaImageList, BCControls.ProgressBar, EditBone.FindInFiles, BCEditor.MacroRecorder, BCEditor.Print, sDialogs,
  System.Generics.Collections, Vcl.StdCtrls, System.Win.TaskbarCore, Vcl.Taskbar;

type
  TMainForm = class(TBCBaseForm)
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
    ActionMacroRecord: TAction;
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
    SpeedButtonDocumentMacro: TBCSpeedButton;
    ActionMacro: TAction;
    PopupMenuDocumentMacro: TPopupMenu;
    MenuItemMacroPlayback: TMenuItem;
    MenuItemMacroRecordPause: TMenuItem;
    MenuItemMacroStop: TMenuItem;
    N1: TMenuItem;
    MenuItemMacroOpen: TMenuItem;
    MenuItemMacroSaveAs: TMenuItem;
    ActionMacroPause: TAction;
    N2: TMenuItem;
    N3: TMenuItem;
    Macro1: TMenuItem;
    Playback1: TMenuItem;
    MenuItemMainMenuMacroRecordPause: TMenuItem;
    Saveas1: TMenuItem;
    N5: TMenuItem;
    Open1: TMenuItem;
    Saveas2: TMenuItem;
    PageControlDocument: TBCPageControl;
    OpenDialog: TsOpenDialog;
    SaveDialog: TsSaveDialog;
    PrintDialog: TPrintDialog;
    EditorPrint: TBCEditorPrint;
    EditorMacroRecorder: TBCEditorMacroRecorder;
    Timer: TTimer;
    ActionSelectionBoxDown: TAction;
    ActionSelectionBoxLeft: TAction;
    ActionSelectionBoxRight: TAction;
    ActionSelectionBoxUp: TAction;
    ActionXMLTreeRefresh: TAction;
    PopupMenuXMLTree: TPopupMenu;
    MenuItemXMLRefresh: TMenuItem;
    ActionSearchOptions: TAction;
    ActionSearchClose: TAction;
    PanelOutput: TBCPanel;
    PageControlDirectory: TBCPageControl;
    TabSheetOpen: TsTabSheet;
    TabSheetNew: TsTabSheet;
    PopupMenuFileTreeView: TPopupMenu;
    MenuItemOpenDirectory: TMenuItem;
    MenuItemCloseDirectory: TMenuItem;
    MenuItemEditDirectory: TMenuItem;
    MenuItemDirectorySeparator1: TMenuItem;
    MenuItemFiles: TMenuItem;
    MenuItemFindinFiles: TMenuItem;
    MenuItemDirectorySeparator2: TMenuItem;
    MenuItemRefresh: TMenuItem;
    MenuItemDirectorySeparator3: TMenuItem;
    MenuItemRename: TMenuItem;
    MenuItemDirectoryDelete: TMenuItem;
    MenuItemDirectorySeparator4: TMenuItem;
    MenuItemContextMenu: TMenuItem;
    MenuItemProperties: TMenuItem;
    ActionDirectoryRefresh: TAction;
    ActionDirectoryRename: TAction;
    ActionDirectoryDelete: TAction;
    ActionDirectoryProperties: TAction;
    ActionDirectoryContextMenu: TAction;
    ActionDirectoryFindInFiles: TAction;
    J1: TMenuItem;
    ActionDocumentFormatJSON: TAction;
    MenuItemMainMenuDocumentFormatJSON: TMenuItem;
    MenuItemFormatJSON: TMenuItem;
    MenuItemFormatJSONMinify: TMenuItem;
    MenuItemFormatJSONIndent2: TMenuItem;
    MenuItemFormatJSONIndent3: TMenuItem;
    MenuItemFormatJSONIndent4: TMenuItem;
    ActionDocumentFormatJSONMinify: TAction;
    ActionDocumentFormatJSONIndent2: TAction;
    ActionDocumentFormatJSONIndent3: TAction;
    ActionDocumentFormatJSONIndent4: TAction;
    MenuItemDocumentFormatJSONMinify: TMenuItem;
    MenuItemDocumentFormatJSONIndent2: TMenuItem;
    MenuItemDocumentFormatJSONIndent3: TMenuItem;
    MenuItemDocumentFormatJSONIndent4: TMenuItem;
    MenuItemMainMenuDocumentFormatJSONMinify: TMenuItem;
    MenuItemMainMenuDocumentFormatJSONIndent2: TMenuItem;
    MenuItemMainMenuDocumentFormatJSONIndent3: TMenuItem;
    MenuItemMainMenuDocumentFormatJSONIndent4: TMenuItem;
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
    procedure ActionMacroRecordExecute(Sender: TObject);
    procedure ActionMacroStopExecute(Sender: TObject);
    procedure ActionFileSelectFromDirectoryExecute(Sender: TObject);
    procedure ActionFilePropertiesExecute(Sender: TObject);
    procedure ActionFileReopenExecute(Sender: TObject);
    procedure ActionDocumentFormatSQLExecute(Sender: TObject);
    procedure ActionDocumentFormatXMLExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ActionMacroOpenExecute(Sender: TObject);
    procedure ActionMacroSaveAsExecute(Sender: TObject);
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
    procedure OnTerminateFindInFiles(Sender: TObject);
    procedure OnProgressBarStepFindInFiles(Sender: TObject);
    procedure OnAddTreeViewLine(Sender: TObject; Filename: WideString; Ln, Ch: LongInt; Text: WideString; SearchString: WideString = '');
    procedure ActionToolBarMenuSkinExecute(Sender: TObject);
    procedure ActionMacroPauseExecute(Sender: TObject);
    procedure PageControlDocumentChange(Sender: TObject);
    procedure PageControlDocumentCloseBtnClick(Sender: TComponent; TabIndex: Integer; var CanClose: Boolean;
      var Action: TacCloseAction);
    procedure PageControlDocumentDblClick(Sender: TObject);
    procedure PageControlDocumentMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure TimerTimer(Sender: TObject);
    procedure ActionSelectionBoxDownExecute(Sender: TObject);
    procedure ActionSelectionBoxLeftExecute(Sender: TObject);
    procedure ActionSelectionBoxRightExecute(Sender: TObject);
    procedure ActionSelectionBoxUpExecute(Sender: TObject);
    procedure ActionXMLTreeRefreshExecute(Sender: TObject);
    procedure EditorPrintPrintStatus(Sender: TObject; Status: TBCEditorPrintStatus; PageNumber: Integer;
      var Abort: Boolean);
    procedure ActionSearchOptionsExecute(Sender: TObject);
    procedure ActionSearchCloseExecute(Sender: TObject);
    procedure ActionDirectoryFindInFilesExecute(Sender: TObject);
    procedure ActionDirectoryRefreshExecute(Sender: TObject);
    procedure ActionDirectoryRenameExecute(Sender: TObject);
    procedure ActionDirectoryDeleteExecute(Sender: TObject);
    procedure ActionDirectoryContextMenuExecute(Sender: TObject);
    procedure ActionDirectoryPropertiesExecute(Sender: TObject);
    procedure PageControlDirectoryCloseBtnClick(Sender: TComponent; TabIndex: Integer; var CanClose: Boolean;
      var Action: TacCloseAction);
    procedure PageControlDirectoryDblClick(Sender: TObject);
    procedure PageControlDirectoryMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure PopupMenuFileTreeViewPopup(Sender: TObject);
    procedure TabSheetOpenClickBtn(Sender: TObject);
    procedure ActionDocumentFormatJSONExecute(Sender: TObject);
    procedure ActionDocumentFormatJSONMinifyExecute(Sender: TObject);
    procedure ActionDocumentFormatJSONIndent2Execute(Sender: TObject);
    procedure ActionDocumentFormatJSONIndent3Execute(Sender: TObject);
    procedure ActionDocumentFormatJSONIndent4Execute(Sender: TObject);
  private
    FNoIni: Boolean;
    FDirectory: TEBDirectory;
    FDocument: TEBDocument;
    FImageListCount: Integer;
    FOutputFrame: TOutputFrame;
    FProcessingEventHandler: Boolean;
    FFindInFilesThread: TFindInFilesThread;
    FSQLFormatterDLLFound: Boolean;
    FStopWatch: TStopWatch;
    FOutputTreeView: TVirtualDrawTree;
    function GetActionList: TObjectList<TAction>;
    function OnCancelSearch: Boolean;
    function GetHighlighterColor: string;
    function GetStringList(APopupMenu: TPopupMenu): TStringList;
    function Processing: Boolean;
    procedure CreateObjects;
    procedure CreateLanguageMenu(AMenuItem: TMenuItem);
    procedure CreateToolBar(ACreate: Boolean = False);
    procedure ReadIniOptions;
    procedure ReadIniSizePositionAndState;
    procedure ReadLanguageFile(ALanguage: string);
    procedure SearchFindInFiles(AFolder: string = '');
    procedure SetFields;
    procedure SetImages;
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
  BCCommon.Utils, BCControls.Utils, BCCommon.Dialogs.FindInFiles,
  BCEditor.Encoding, EditBone.Form.UnicodeCharacterMap, EditBone.Dialog.About, BCCommon.Dialogs.DownloadURL,
  BCCommon.Forms.Convert, EditBone.Form.LanguageEditor, BCCommon.Messages, BCCommon.Forms.SearchForFiles,
  BCCommon.StringUtils, BCEditor.Types, BCCommon.Dialogs.SkinSelect, sGraphUtils, sConst,
  BCCommon.Forms.Print.Preview, EditBone.DataModule.Images;


procedure TMainForm.PageControlDirectoryCloseBtnClick(Sender: TComponent; TabIndex: Integer; var CanClose: Boolean;
  var Action: TacCloseAction);
begin
  inherited;
  if FDirectory.CloseDirectory(False, TabIndex) then
    Action := acaFree
  else
    CanClose := False;
end;

procedure TMainForm.PageControlDirectoryDblClick(Sender: TObject);
begin
  inherited;
  if OptionsContainer.DirCloseTabByDblClick then
    ActionViewCloseDirectory.Execute;
end;

procedure TMainForm.PageControlDocumentChange(Sender: TObject);
var
  LEditor: TBCEditor;
begin
  if Processing then
    Exit;
  SetBookmarks;
  SetTitleBarMenus;
  LEditor := FDocument.GetActiveEditor;
  if Assigned(LEditor) then
  begin
    if LEditor.CanFocus then
      LEditor.SetFocus;
  end;
end;

procedure TMainForm.PageControlDocumentCloseBtnClick(Sender: TComponent; TabIndex: Integer; var CanClose: Boolean;
  var Action: TacCloseAction);
begin
  inherited;
  if FDocument.Close(False, TabIndex) <> mrCancel then
    Action := acaFree
  else
    CanClose := False;
end;

procedure TMainForm.PageControlDocumentDblClick(Sender: TObject);
begin
  inherited;
  if OptionsContainer.DocCloseTabByDblClick then
    FDocument.Close;
end;

procedure TMainForm.PageControlDocumentMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if (Button = mbMiddle) and OptionsContainer.DocCloseTabByMiddleClick then
    FDocument.Close;
end;

procedure TMainForm.PageControlDirectoryMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if (Button = mbMiddle) and OptionsContainer.DirCloseTabByMiddleClick then
    ActionViewCloseDirectory.Execute;
end;

procedure TMainForm.PopupMenuFileTreeViewPopup(Sender: TObject);
begin
  inherited;
  ActionDirectoryProperties.Enabled := FileExists(FDirectory.SelectedFile);
end;

function TMainForm.Processing: Boolean;
begin
  Result := True;
  if FProcessingEventHandler then
    Exit;
  if not Assigned(FDocument) then
    Exit;
  if FDocument.Processing then
    Exit;
  Result := False;
end;

procedure TMainForm.ActionDocumentViewInBrowserExecute(Sender: TObject);
begin
  BrowseURL(FormatFileName(FDocument.ActiveDocumentName));
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

procedure TMainForm.ActionDirectoryContextMenuExecute(Sender: TObject);
var
  s: string;
begin
  s := FDirectory.SelectedFile;
  if s = '' then
    s :=  FDirectory.SelectedPath;
  DisplayContextMenu(Handle, s, ScreenToClient(Mouse.CursorPos));
end;

procedure TMainForm.ActionDirectoryDeleteExecute(Sender: TObject);
begin
  inherited;
  FDirectory.DeleteSelected;
end;

procedure TMainForm.ActionDirectoryFindInFilesExecute(Sender: TObject);
begin
  inherited;
  SearchFindInFiles(FDirectory.SelectedPath);
end;

procedure TMainForm.ActionDirectoryPropertiesExecute(Sender: TObject);
begin
  inherited;
  FDirectory.FileProperties;
end;

procedure TMainForm.ActionDirectoryRefreshExecute(Sender: TObject);
begin
  inherited;
  FDirectory.Refresh;
end;

procedure TMainForm.ActionDirectoryRenameExecute(Sender: TObject);
begin
  inherited;
  FDirectory.Rename;
end;

procedure TMainForm.ActionDocumentFormatJSONExecute(Sender: TObject);
begin
  inherited;
  { Dummy action }
end;

procedure TMainForm.ActionDocumentFormatJSONIndent2Execute(Sender: TObject);
begin
  inherited;
  FDocument.FormatJSON(2);
end;

procedure TMainForm.ActionDocumentFormatJSONIndent3Execute(Sender: TObject);
begin
  inherited;
  FDocument.FormatJSON(3);
end;

procedure TMainForm.ActionDocumentFormatJSONIndent4Execute(Sender: TObject);
begin
  inherited;
  FDocument.FormatJSON(4);
end;

procedure TMainForm.ActionDocumentFormatJSONMinifyExecute(Sender: TObject);
begin
  inherited;
  FDocument.FormatJSON(-1);
end;

procedure TMainForm.ActionDocumentFormatSQLExecute(Sender: TObject);
begin
  FDocument.FormatSQL;
end;

procedure TMainForm.ActionDocumentFormatXMLExecute(Sender: TObject);
begin
  FDocument.FormatXML;
end;

procedure TMainForm.ActionDocumentInfoExecute(Sender: TObject);
begin
  FDocument.ShowInfo;
end;

procedure TMainForm.ActionEditCopyExecute(Sender: TObject);
begin
  if FDirectory.Focused then
    FDirectory.Copy
  else
    FDocument.Copy;
end;

procedure TMainForm.ActionEditCutExecute(Sender: TObject);
begin
  if FDirectory.Focused then
    FDirectory.Cut
  else
    FDocument.Cut;
end;

procedure TMainForm.ActionEditDeleteEndOfLineExecute(Sender: TObject);
begin
  FDocument.DeleteEndOfLine;
end;

procedure TMainForm.ActionEditDeleteLineExecute(Sender: TObject);
begin
  FDocument.DeleteLine;
end;

procedure TMainForm.ActionEditDeleteWhitespaceExecute(Sender: TObject);
begin
  FDocument.DeleteWhiteSpace;
end;

procedure TMainForm.ActionEditDeleteWordExecute(Sender: TObject);
begin
  FDocument.DeleteWord;
end;

procedure TMainForm.ActionEditIndentDecreaseExecute(Sender: TObject);
begin
  FDocument.DecreaseIndent;
end;

procedure TMainForm.ActionEditIndentIncreaseExecute(Sender: TObject);
begin
  FDocument.IncreaseIndent;
end;

procedure TMainForm.ActionEditInsertDateTimeExecute(Sender: TObject);
begin
  FDocument.InsertDateAndTime;
end;

procedure TMainForm.ActionEditInsertLineExecute(Sender: TObject);
begin
  FDocument.InsertLine;
end;

procedure TMainForm.ActionEditInsertTagExecute(Sender: TObject);
begin
  FDocument.InsertTag;
end;

procedure TMainForm.ActionEditPasteExecute(Sender: TObject);
begin
  if FDirectory.Focused then
    FDirectory.Paste
  else
    FDocument.Paste;
end;

procedure TMainForm.ActionEditRedoExecute(Sender: TObject);
begin
  FDocument.Redo;
end;

procedure TMainForm.ActionEditSelectAllExecute(Sender: TObject);
begin
  FDocument.SelectAll;
end;

procedure TMainForm.ActionEditSortAscExecute(Sender: TObject);
begin
  FDocument.Sort(soAsc);
end;

procedure TMainForm.ActionEditSortDescExecute(Sender: TObject);
begin
  FDocument.Sort(soDesc);
end;

procedure TMainForm.ActionEditToggleCaseExecute(Sender: TObject);
begin
  FDocument.ToggleCase;
end;

procedure TMainForm.ActionEditUndoExecute(Sender: TObject);
begin
  FDocument.Undo;
end;

procedure TMainForm.ActionFileCloseAllExecute(Sender: TObject);
begin
  FDocument.CloseAll;
end;

procedure TMainForm.ActionFileCloseAllOtherExecute(Sender: TObject);
begin
  FDocument.CloseAllOtherPages;
end;

procedure TMainForm.ActionFileCloseExecute(Sender: TObject);
begin
  FDocument.Close;
end;

procedure TMainForm.ActionMacroOpenExecute(Sender: TObject);
begin
  FDocument.LoadMacro;
end;

procedure TMainForm.ActionMacroPauseExecute(Sender: TObject);
begin
  inherited;
  FDocument.RecordMacro;
  SpeedButtonMacroRecordPause.Images := nil;
  SpeedButtonMacroRecordPause.Action := ActionMacroRecord;
  SpeedButtonMacroRecordPause.Images := ImagesDataModule.ImageListSmall;
  MenuItemMacroRecordPause.Action := ActionMacroRecord;
  MenuItemMainMenuMacroRecordPause.Action := ActionMacroRecord;
end;

procedure TMainForm.ActionMacroPlaybackExecute(Sender: TObject);
begin
  FDocument.PlaybackMacro;
end;

procedure TMainForm.ActionMacroRecordExecute(Sender: TObject);
begin
  FDocument.RecordMacro;
  SpeedButtonMacroRecordPause.Images := nil;
  SpeedButtonMacroRecordPause.Action := ActionMacroPause;
  SpeedButtonMacroRecordPause.Images := ImagesDataModule.ImageListSmall;
  MenuItemMacroRecordPause.Action := ActionMacroPause;
  MenuItemMainMenuMacroRecordPause.Action := ActionMacroPause;
end;

procedure TMainForm.ActionMacroSaveAsExecute(Sender: TObject);
begin
  FDocument.SaveMacro;
end;

procedure TMainForm.ActionMacroStopExecute(Sender: TObject);
begin
  FDocument.StopMacro;
  SpeedButtonMacroRecordPause.Images := nil;
  SpeedButtonMacroRecordPause.Action := ActionMacroRecord;
  SpeedButtonMacroRecordPause.Images := ImagesDataModule.ImageListSmall;
  MenuItemMacroRecordPause.Action := ActionMacroRecord;
  MenuItemMainMenuMacroRecordPause.Action := ActionMacroRecord;
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
  FDocument.New;
end;

procedure TMainForm.ActionFileOpenExecute(Sender: TObject);
begin
  FDocument.Open;
end;

procedure TMainForm.ActionFilePrintExecute(Sender: TObject);
begin
  if PrintDialog.Execute(Handle) then
  begin
    FDocument.InitializeEditorPrint(EditorPrint);
    EditorPrint.Copies := PrintDialog.Copies;
    EditorPrint.SelectedOnly := PrintDialog.PrintRange = prSelection;
    EditorPrint.UpdatePages(PrintPreviewDialog.Canvas); // TODO: needed?

    ProgressBar.Show(PageControlDocument.PageCount - 1);
    if PrintDialog.PrintRange = prPageNums then
      EditorPrint.PrintRange(PrintDialog.FromPage, PrintDialog.ToPage)
    else
      EditorPrint.Print;
    ProgressBar.Hide;
  end;
end;

procedure TMainForm.ActionFilePrintPreviewExecute(Sender: TObject);
begin
  FDocument.PrintPreview;
end;

procedure TMainForm.ActionFilePropertiesExecute(Sender: TObject);
begin
  FDocument.FileProperties;
end;

procedure TMainForm.ActionFileSaveAllExecute(Sender: TObject);
begin
  FDocument.SaveAll;
end;

procedure TMainForm.ActionFileSaveAsExecute(Sender: TObject);
begin
  FDocument.SaveAs;
end;

procedure TMainForm.ActionFileSaveExecute(Sender: TObject);
begin
  FDocument.Save;
end;

procedure TMainForm.ActionFileSelectFromDirectoryExecute(Sender: TObject);
begin
  if FDocument.ActiveDocumentName <> '' then
    if Assigned(FDirectory) then
      if FDirectory.IsAnyDirectory then
        FDirectory.OpenPath(ExtractFileDrive(FDocument.ActiveDocumentName), FormatFileName(FDocument.ActiveDocumentName),
          FDirectory.ExcludeOtherBranches);
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
  FDocument.ClearBookmarks;
end;

procedure TMainForm.ActionSearchCloseExecute(Sender: TObject);
begin
  FDocument.SearchClose;
end;

procedure TMainForm.ActionSearchFindInFilesExecute(Sender: TObject);
begin
  inherited;
  SearchFindInFiles;
end;

procedure TMainForm.ActionSearchFindNextExecute(Sender: TObject);
begin
  FDocument.FindNext;
end;

procedure TMainForm.ActionSearchFindPreviousExecute(Sender: TObject);
begin
  FDocument.FindPrevious;
end;

procedure TMainForm.ActionSearchGoToLineExecute(Sender: TObject);
begin
  FDocument.GotoLine;
end;

procedure TMainForm.ActionSearchOptionsExecute(Sender: TObject);
begin
  FDocument.SearchOptions;
end;

procedure TMainForm.ActionSearchReplaceExecute(Sender: TObject);
begin
  FDocument.Replace;
end;

procedure TMainForm.ActionSearchSearchExecute(Sender: TObject);
begin
  FDocument.Search;
end;

procedure TMainForm.ActionSearchToggleBookmarkExecute(Sender: TObject);
var
  LEditor: TBCEditor;
begin
  LEditor := FDocument.GetActiveEditor;
  if Assigned(LEditor) then
    LEditor.ToggleBookMark
 { else
  begin
    LEditor := FDocument.GetActiveSplitEditor;
    if Assigned(LEditor) then
      LEditor.ToggleBookMark
  end;  }
end;

procedure TMainForm.ActionSelectEncodingExecute(Sender: TObject);
begin
  TitleBar.Items[2].Caption := TAction(Sender).Caption; // TODO: const for item
  TAction(Sender).Checked := True;
  FDocument.SetEncoding(FDocument.GetActiveEditor, TAction(Sender).Tag);
end;

procedure TMainForm.ActionSelectHighlighterColorExecute(Sender: TObject);
begin
  TitleBar.Items[6].Caption := TAction(Sender).Caption; // TODO: const for item
  TAction(Sender).Checked := True;
  FDocument.SetHighlighterColor(FDocument.GetActiveEditor, TAction(Sender).Caption);
end;

procedure TMainForm.ActionSelectHighlighterExecute(Sender: TObject);
begin
  TitleBar.Items[4].Caption := TAction(Sender).Caption; // TODO: const for item
  TAction(Sender).Checked := True;
  FDocument.SetHighlighter(FDocument.GetActiveEditor, TAction(Sender).Caption);
end;

procedure TMainForm.ActionSelectionBoxDownExecute(Sender: TObject);

  procedure BoxDown(Editor: TBCEditor);
  begin
    if Assigned(Editor) then
      if Editor.Focused then
      begin
        OptionsContainer.EnableSelectionMode := True;
        Editor.Selection.Options := Editor.Selection.Options + [soALTSetsColumnMode];
        Editor.Selection.Mode := smColumn;
        Keybd_Event(VK_SHIFT, MapVirtualKey(VK_SHIFT, 0), 0, 0);
        Keybd_Event(VK_DOWN, MapVirtualKey(VK_DOWN, 0), 0, 0);
        Keybd_Event(VK_DOWN, MapVirtualKey(VK_DOWN, 0), KEYEVENTF_KEYUP, 0);
        Keybd_Event(VK_MENU, MapVirtualKey(VK_MENU, 0), KEYEVENTF_KEYUP, 0);
      end;
  end;

begin
  BoxDown(FDocument.GetActiveEditor);
  BoxDown(FDocument.GetActiveSplitEditor);
end;

procedure TMainForm.ActionSelectionBoxLeftExecute(Sender: TObject);
  procedure BoxLeft(Editor: TBCEditor);
  begin
    if Assigned(Editor) then
      if Editor.Focused then
      begin
        OptionsContainer.EnableSelectionMode := True;
        Editor.Selection.Options := Editor.Selection.Options + [soALTSetsColumnMode];
        Editor.Selection.Mode := smColumn;
        Keybd_Event(VK_SHIFT, MapVirtualKey(VK_SHIFT, 0), 0, 0);
        Keybd_Event(VK_LEFT, MapVirtualKey(VK_LEFT, 0), 0, 0);
        Keybd_Event(VK_LEFT, MapVirtualKey(VK_LEFT, 0), KEYEVENTF_KEYUP, 0);
        Keybd_Event(VK_MENU, MapVirtualKey(VK_MENU, 0), KEYEVENTF_KEYUP, 0);
      end;
  end;

begin
  BoxLeft(FDocument.GetActiveEditor);
  BoxLeft(FDocument.GetActiveSplitEditor);
end;

procedure TMainForm.ActionSelectionBoxRightExecute(Sender: TObject);
  procedure BoxRight(Editor: TBCEditor);
  begin
    if Assigned(Editor) then
      if Editor.Focused then
      begin
        OptionsContainer.EnableSelectionMode := True;
        Editor.Selection.Options := Editor.Selection.Options + [soALTSetsColumnMode];
        Editor.Selection.Mode := smColumn;
        Keybd_Event(VK_SHIFT, MapVirtualKey(VK_SHIFT, 0), 0, 0);
        Keybd_Event(VK_RIGHT, MapVirtualKey(VK_RIGHT, 0), 0, 0);
        Keybd_Event(VK_RIGHT, MapVirtualKey(VK_RIGHT, 0), KEYEVENTF_KEYUP, 0);
        Keybd_Event(VK_MENU, MapVirtualKey(VK_MENU, 0), KEYEVENTF_KEYUP, 0);
      end;
  end;

begin
  BoxRight(FDocument.GetActiveEditor);
  BoxRight(FDocument.GetActiveSplitEditor);
end;

procedure TMainForm.ActionSelectionBoxUpExecute(Sender: TObject);
  procedure BoxUp(Editor: TBCEditor);
  begin
    if Assigned(Editor) then
      if Editor.Focused then
      begin
        OptionsContainer.EnableSelectionMode := True;
        Editor.Selection.Options := Editor.Selection.Options + [soALTSetsColumnMode];
        Editor.Selection.Mode := smColumn;
        Keybd_Event(VK_SHIFT, MapVirtualKey(VK_SHIFT, 0), 0, 0);
        Keybd_Event(VK_UP, MapVirtualKey(VK_UP, 0), 0, 0);
        Keybd_Event(VK_UP, MapVirtualKey(VK_UP, 0), KEYEVENTF_KEYUP, 0);
        Keybd_Event(VK_MENU, MapVirtualKey(VK_MENU, 0), KEYEVENTF_KEYUP, 0);
      end;
  end;

begin
  BoxUp(FDocument.GetActiveEditor);
  BoxUp(FDocument.GetActiveSplitEditor);
end;

procedure TMainForm.ActionSelectReopenFileExecute(Sender: TObject);
var
  FileName: string;
  LMenuItem: TMenuItem;
begin
  LMenuItem := Sender as TMenuItem;
  FileName := System.Copy(LMenuItem.Caption, Pos(' ', LMenuItem.Caption) + 1, Length(LMenuItem.Caption));
  FDocument.Open(FileName);
end;

procedure TMainForm.ChangeSkin(Sender: TObject);
begin
  FDocument.UpdateHighlighterColors;
end;

procedure TMainForm.ActionToolsCompareFilesExecute(Sender: TObject);
begin
  //FDocument.CompareFiles;
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
        if OptionsContainer.ToolbarIconSizeSmall then
          PanelToolBar.Height := 28
        else
          PanelToolBar.Height := 36;

        { add items to action bar }
        while PanelToolBar.ControlCount > 0 do
          PanelToolBar.Controls[0].Destroy;

        for i := 0 to LToolBarItems.Count - 1 do
        begin
          LSpeedButton := TBCSpeedButton.Create(PanelToolBar);
          LSpeedButton.Flat := True;
          if OptionsContainer.ToolbarIconSizeSmall then
            LSpeedButton.Images := ImagesDataModule.ImageListSmall
          else
            LSpeedButton.Images := ImagesDataModule.ImageList;
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
            if OptionsContainer.ToolbarIconSizeSmall then
              LSpeedButton.Width := 26
            else
              LSpeedButton.Width := 36
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
  if FDocument.Options(ActionList) then
  begin
    SetOptions;
    CreateToolbar;
    SetTitleBarMenus;
  end;
end;

procedure TMainForm.ActionToolsSelectForCompareExecute(Sender: TObject);
begin
 FDocument.SelectForCompare;
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
  FDocument.ToggleBookMark(Action.Tag);
end;

procedure TMainForm.ActionEditToggleCaseAlternatingExecute(Sender: TObject);
begin
  inherited;
  FDocument.ToggleCase(cAlternating);
end;

procedure TMainForm.ActionEditToggleCaseLowerExecute(Sender: TObject);
begin
  inherited;
  FDocument.ToggleCase(cLower);
end;

procedure TMainForm.ActionEditToggleCaseSentenceExecute(Sender: TObject);
begin
  inherited;
  FDocument.ToggleCase(cSentence);
end;

procedure TMainForm.ActionEditToggleCaseTitleExecute(Sender: TObject);
begin
  inherited;
  FDocument.ToggleCase(cTitle);
end;

procedure TMainForm.ActionEditToggleCaseUpperExecute(Sender: TObject);
begin
  inherited;
  FDocument.ToggleCase(cUpper);
end;

procedure TMainForm.ActionGotoBookmarksExecute(Sender: TObject);
var
  Action: TAction;
begin
  Action := Sender as TAction;
  FDocument.GotoBookMarks(Action.Tag);
end;

procedure TMainForm.ActionToolBarMenuSkinExecute(Sender: TObject);
begin
  inherited;
  TSkinSelectDialog.ClassShowModal(SkinManager);
end;

procedure TMainForm.ActionToolsCharacterMapExecute(Sender: TObject);
begin
  UnicodeCharacterMapForm.Open(FDocument.GetActiveEditor);
end;

procedure TMainForm.ActionViewCloseDirectoryExecute(Sender: TObject);
begin
  FDirectory.CloseDirectory;
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
  FDirectory.EditDirectory;
end;

procedure TMainForm.ActionViewEncodingSelectionExecute(Sender: TObject);
begin
  ActionViewEncodingSelection.Checked := not ActionViewEncodingSelection.Checked
end;

procedure DoSearchForFilesOpenFile(var FileName: string);
begin
  MainForm.FDocument.Open(FileName);
end;

procedure TMainForm.ActionViewFilesExecute(Sender: TObject);
begin
  with SearchForFilesForm do
  begin
    OnOpenFile := DoSearchForFilesOpenFile;
    Open(FDirectory.SelectedPath);
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
  ActionViewLineNumbers.Checked := FDocument.ToggleLineNumbers;
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
  FDocument.ToggleMiniMap;
end;

procedure TMainForm.ActionViewNextPageExecute(Sender: TObject);
begin
  FDocument.NextPage;
end;

procedure TMainForm.ActionViewOpenDirectoryExecute(Sender: TObject);
begin
  FDirectory.OpenDirectory;
  if not PanelDirectory.Visible then
  begin
    PanelDirectory.Visible := True;
    SplitterVertical.Visible := True;
  end;
end;

procedure TMainForm.ActionViewOutputExecute(Sender: TObject);
begin
  PanelOutput.Visible := not PanelOutput.Visible;
  PanelOutput.Top := StatusBar.Top - PanelOutput.Height; { always top of statusbar }
end;

procedure TMainForm.ActionViewPreviousPageExecute(Sender: TObject);
begin
  FDocument.PreviousPage;
end;

procedure TMainForm.ActionViewSelectionModeExecute(Sender: TObject);
begin
  FDocument.ToggleSelectionMode;
end;

procedure TMainForm.ActionViewSpecialCharsExecute(Sender: TObject);
begin
  ActionViewSpecialChars.Checked := FDocument.ToggleSpecialChars;
end;

procedure TMainForm.ActionViewSplitExecute(Sender: TObject);
begin
  FDocument.ToggleSplit;
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
  ActionViewWordWrap.Checked := FDocument.ToggleWordWrap;
end;

procedure TMainForm.ActionViewXMLTreeExecute(Sender: TObject);
begin
  ActionViewXMLTree.Checked := FDocument.ToggleXMLTree;
end;

procedure TMainForm.ActionXMLTreeRefreshExecute(Sender: TObject);
begin
  FDocument.RefreshXMLTree;
end;

procedure TMainForm.AppInstancesCmdLineReceived(Sender: TObject; CmdLine: TStrings);
var
  i: Integer;
begin
  PageControlDocument.Visible := False;
  for i := 0 to CmdLine.Count - 1 do
    FDocument.Open(CmdLine.Strings[i], True);
  PageControlDocument.Visible := True;
end;

procedure TMainForm.ApplicationEventsActivate(Sender: TObject);
begin
  if Processing then
    Exit;
  FDocument.CheckFileDateTimes;
end;

procedure TMainForm.ApplicationEventsHint(Sender: TObject);
begin
  inherited;
  StatusBar.Panels[EDITBONE_STATUS_BAR_HINT_PANEL].Text := Application.Hint;
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
  PopupMenuDocument.Images := ImagesDataModule.ImageListSmall;
  PopupMenuFileTreeView.Images := ImagesDataModule.ImageListSmall;

  for i := 0 to PanelToolBar.ControlCount - 1 do
  if PanelToolBar.Controls[i] is TBCSpeedButton then
  begin
    LSpeedButton := TBCSpeedButton(PanelToolBar.Controls[i]);
    if OptionsContainer.ToolbarIconSizeSmall then
      LSpeedButton.Images := ImagesDataModule.ImageListSmall
    else
      LSpeedButton.Images := ImagesDataModule.ImageList
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
  IsJSONDocument: Boolean;
begin
  FProcessingEventHandler := True;
  try
    ActiveDocumentFound := FDocument.ActiveDocumentFound;
    SelectionFound := FDocument.SelectionFound;
    IsSQLDocument := FDocument.IsSQLDocument;
    IsXMLDocument := FDocument.IsXMLDocument;
    IsJSONDocument := FDocument.IsJSONDocument;

    ActionViewMainMenu.Checked := Assigned(Menu);
    ActionViewToolbar.Checked := PanelToolBar.Visible;
    ActionViewMenuBar.Checked := PanelMenuBar.Visible;
    ActionViewStatusbar.Checked := StatusBar.Visible;
    ActionViewOutput.Checked := PanelOutput.Visible;
    ActionViewDirectory.Enabled := FDirectory.IsAnyDirectory;
    ActionViewDirectory.Checked := PanelDirectory.Visible;
    SplitterHorizontal.Visible := PanelOutput.Visible;
    SplitterHorizontal.Top := PanelOutput.Top - SplitterHorizontal.Height; { always top of panel output }

    TitleBar.Items[2].Visible := ActionViewEncodingSelection.Checked;
    TitleBar.Items[3].Visible := TitleBar.Items[2].Visible;
    TitleBar.Items[4].Visible := ActionViewHighlighterSelection.Checked;
    TitleBar.Items[5].Visible := TitleBar.Items[4].Visible;
    TitleBar.Items[6].Visible := ActionViewColorSelection.Checked;
    TitleBar.Items[7].Visible := TitleBar.Items[6].Visible;

    ActionViewXMLTree.Enabled := ActiveDocumentFound and IsXMLDocument;
    if ActionViewXMLTree.Enabled then
     ActionViewXMLTree.Checked := FDocument.XMLTreeVisible;

    ActiveDocumentName := FDocument.ActiveDocumentName;
    if ActiveDocumentName = '' then
      ActiveDocumentName := FDocument.ActiveTabSheetCaption;

    if ActiveDocumentName = '' then
      TitleBar.Items[1].Caption := Application.Title
    else
      TitleBar.Items[1].Caption := Format(Application.Title + EDITBONE_MAIN_CAPTION_DOCUMENT, [ActiveDocumentName]);
    ActionFileProperties.Enabled := ActiveDocumentFound and (ActiveDocumentName <> '');

    ActionFileReopen.Enabled := PopupMenuFileReopen.Items.Count > 0;
    ActionFileClose.Enabled := FDocument.OpenTabSheetCount > 0;
    ActionFileCloseAll.Enabled := ActionFileClose.Enabled;
    ActionFileCloseAllOther.Enabled := ActionFileClose.Enabled;
    ActionViewNextPage.Enabled := FDocument.OpenTabSheetCount > 1;
    ActionViewPreviousPage.Enabled := ActionViewNextPage.Enabled;
    ActionFileSaveAs.Enabled := ActionFileClose.Enabled and ActiveDocumentFound;
    ActionFileSave.Enabled := FDocument.ActiveDocumentModified and ActiveDocumentFound;
    ActionFileSaveAll.Enabled := FDocument.ModifiedDocuments and ActiveDocumentFound;
    ActionFilePrint.Enabled := ActionFileClose.Enabled and ActiveDocumentFound;
    ActionFilePrintPreview.Enabled := ActionFileClose.Enabled and ActiveDocumentFound;
    ActionFileSelectFromDirectory.Enabled := PanelDirectory.Visible and ActiveDocumentFound and FDirectory.IsAnyDirectory;
    ActionEditUndo.Enabled := ActionFileClose.Enabled and FDocument.CanUndo and ActiveDocumentFound;
    ActionEditRedo.Enabled := ActionFileClose.Enabled and FDocument.CanRedo and ActiveDocumentFound;
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
    ActionViewSelectionMode.Checked := ActiveDocumentFound and FDocument.SelectionModeChecked;
    ActionViewSplit.Enabled := ActiveDocumentFound;
    ActionViewSplit.Checked := ActiveDocumentFound and FDocument.SplitChecked;
    ActionViewMinimap.Enabled := ActiveDocumentFound;
    ActionViewMinimap.Checked := ActiveDocumentFound and FDocument.MinimapChecked;

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
    ActionViewLineNumbers.Enabled := Assigned(FDocument) and (FDocument.OpenTabSheetCount > 0);
    ActionViewSpecialChars.Enabled := ActionViewLineNumbers.Enabled;
    ActionDocumentInfo.Enabled := ActiveDocumentFound;
    ActionToolsSelectForCompare.Enabled := False; // TODO: not implemented ActiveDocumentFound and not FDocument.ActiveDocumentModified;
    ActionToolsCompareFiles.Enabled := False; // TODO: not implemented
    ActionDocumentFormatJSON.Enabled := ActiveDocumentFound and IsJSONDocument;
    ActionDocumentFormatSQL.Enabled := FSQLFormatterDLLFound and ActiveDocumentFound and IsSQLDocument;
    ActionDocumentFormatXML.Enabled := ActiveDocumentFound and IsXMLDocument;

    ActionViewOutput.Enabled := FOutputFrame.IsAnyOutput;
    if not ActionViewOutput.Enabled then { if there's no output then hide panel }
      PanelOutput.Visible := False;

    if not FDirectory.IsAnyDirectory then
    begin
      SplitterVertical.Visible := False;
      PanelDirectory.Visible := False;
    end;

    ActionViewEditDirectory.Enabled := PanelDirectory.Visible;
    ActionViewCloseDirectory.Enabled := PanelDirectory.Visible;
    //ActionViewFiles.Enabled := FDirectory.IsAnyDirectory and (FDirectory.SelectedPath <> '');

    if ActiveDocumentFound and OptionsContainer.StatusBarShowModified then
    begin
      InfoText := FDocument.GetModifiedInfo;
      if StatusBar.Panels[3].Text <> InfoText then
        StatusBar.Panels[3].Text := InfoText;
    end
    else
      StatusBar.Panels[3].Text := '';
    GetKeyboardState(KeyState);
    if OptionsContainer.StatusBarShowKeyState then
    begin
      if KeyState[VK_INSERT] = 0 then
        if StatusBar.Panels[2].Text <> LanguageDataModule.GetConstant('Insert') then
          StatusBar.Panels[2].Text := LanguageDataModule.GetConstant('Insert');
      if KeyState[VK_INSERT] = 1 then
        if StatusBar.Panels[2].Text <> LanguageDataModule.GetConstant('Overwrite') then
          StatusBar.Panels[2].Text := LanguageDataModule.GetConstant('Overwrite');
    end
    else
      StatusBar.Panels[2].Text := '';
    { Macro }
    ActionMacroRecord.Enabled := ActiveDocumentFound;
    ActionMacroPause.Enabled := ActiveDocumentFound;
    ActionMacroStop.Enabled := ActiveDocumentFound and FDocument.IsRecordingMacro;
    ActionMacroPlayback.Enabled := ActiveDocumentFound and FDocument.IsMacroStopped;
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
    BookmarkList := FDocument.GetActiveBookmarkList;
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
begin
  FDocument.DropFiles(Sender, Pos, Value);
end;

procedure TMainForm.EditorPrintPrintStatus(Sender: TObject; Status: TBCEditorPrintStatus; PageNumber: Integer;
  var Abort: Boolean);
begin
  inherited;
  ProgressBar.StepIt;
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
  UpdateLanguage(TForm(FOutputFrame), ALanguage); // TODO: Remove when frames is removed
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
  begin
    if AskYesOrNo(LanguageDataModule.GetYesOrNoMessage('CancelSearch')) then
      FOutputFrame.CancelSearch := True;
    Action := caNone;
    Exit;
  end;

  if FDocument.ModifiedDocuments then
  begin
    Rslt := SaveChanges;
    if Rslt = mrYes then
      FDocument.SaveAll;
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
  CreateObjects;
  ReadIniSizePositionAndState;
  SetOptions;

  FSQLFormatterDLLFound := FileExists(GetSQLFormatterDLLFilename);

  CreateLanguageMenu(MenuItemToolBarMenuLanguage);
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
    FDocument.WriteIniFile;
    FDirectory.WriteIniFile;
    FOutputFrame.WriteOutputFile;
    WriteIniFile;
  end;
  FDocument.Free;
  FDirectory.Free;
  OptionsContainer.Free;
  SQLFormatterOptionsContainer.Free;

  inherited;
end;

procedure TMainForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Shift = [ssCtrl]) and (Key = 9) then
    FDocument.NextPage;
end;

procedure TMainForm.SetOptions;
var
  PanelWidth: Integer;
begin
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
  // TODO: use consts instead of numbers
  if OptionsContainer.StatusBarShowMacro then
    StatusBar.Panels[0].Width := 60
  else
    StatusBar.Panels[0].Width := 0;
  SpeedButtonMacroPlay.Visible := OptionsContainer.StatusBarShowMacro;
  SpeedButtonMacroRecordPause.Visible := OptionsContainer.StatusBarShowMacro;
  SpeedButtonMacroStop.Visible := OptionsContainer.StatusBarShowMacro;

  if OptionsContainer.StatusBarShowCaretPosition then
    StatusBar.Panels[1].Width := 90
  else
    StatusBar.Panels[1].Width := 0;

  if OptionsContainer.StatusBarShowKeyState then
    StatusBar.Panels[2].Width := 90
  else
    StatusBar.Panels[2].Width := 0;

  if OptionsContainer.StatusBarShowModified then
  begin
    StatusBar.Panels[3].Width := EDITBONE_STATUS_BAR_PANEL_WIDTH;
    PanelWidth := StatusBar.Canvas.TextWidth(StatusBar.Panels[3].Text) + 10;
    if PanelWidth > EDITBONE_STATUS_BAR_PANEL_WIDTH then
      StatusBar.Panels[3].Width := PanelWidth;
  end
  else
    StatusBar.Panels[3].Width := 0;

  OptionsContainer.AssignTo(StatusBar);
  { Output }
  if Assigned(FOutputFrame) then
    FOutputFrame.SetOptions;
  { Directory }
  if Assigned(FDirectory) then
  begin
    FDirectory.SetOptions;
    ActionDirectoryRefresh.Execute;
  end;
end;

procedure TMainForm.FormShow(Sender: TObject);
var
  i: Integer;
  Editor: TBCEditor;
begin
  inherited;

  if not FDocument.ReadIniOpenFiles and (ParamCount = 0) or
    (ParamCount = 1) and (ParamStr(1) = PARAM_NO_INI) then
    FDocument.New;

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
      FDocument.Open(ParamStr(i), nil, 0, 0, True);
  end;

  Self.ReadLanguageFile(GetSelectedLanguage('English'));

  CreateFileReopenList;
  FOutputFrame.ReadOutputFile;
  PanelOutput.Visible := FOutputFrame.IsAnyOutput;
  if PanelOutput.Visible then
    PanelOutput.Top := StatusBar.Top - PanelOutput.Height; { always top of status bar }
  //SetMargins;

  Editor := FDocument.GetActiveEditor;
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
  if (Panel.Index = 1) and OptionsContainer.StatusBarShowCaretPosition then
  begin
    EBDataModuleImages.ImageListStatusBar.Draw(StatusBar.Canvas, Rect.Left, Rect.Top + 1, 0);

    LRect := Rect;
    LRect.Left := LRect.Left + EBDataModuleImages.ImageListStatusBar.Width + 4;

    if SkinManager.Active then
      acWriteTextEx(StatusBar.Canvas, PACChar(FDocument.CaretInfo), True, LRect, DT_SINGLELINE or DT_VCENTER,
        SkinProvider.SkinData, True)
    else
    begin
      StatusBar.Canvas.Brush.Style := bsClear;
      StatusBar.Canvas.Font.Assign(StatusBar.Font);
      StatusBar.Canvas.TextOut(LRect.Left, LRect.Top + 6, FDocument.CaretInfo);
    end;
  end;
end;

procedure TMainForm.TabSheetOpenClickBtn(Sender: TObject);
begin
  inherited;
  ActionViewOpenDirectory.Execute;
end;

procedure TMainForm.TimerTimer(Sender: TObject);
begin
  inherited;
  FDocument.CheckFileDateTimes;
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

    //ActionViewXMLTree.Checked := OptionsContainer.ShowXMLTree;
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
    SkinManager.SkinName := ReadString('Options', 'SelectedSkin', 'Windows 10');
  finally
    Free;
  end;
end;

procedure OutputOpenAllEvent(var FileNames: TStrings);
var
  i, j: Integer;
  LActivePageIndex: Integer;
begin
  Screen.Cursor := crHourGlass;
  try
    j := FileNames.Count;
    LActivePageIndex := MainForm.PageControlDocument.ActivePageIndex;
    MainForm.ProgressBar.Show(j);
    MainForm.PageControlDocument.Visible := False;
    Application.ProcessMessages;
    for i := 0 to j - 1 do
    begin
      MainForm.ProgressBar.StepIt;
      MainForm.FDocument.Open(FileNames.Strings[i], False);
      if LActivePageIndex = -1 then
        MainForm.PageControlDocument.ActivePageIndex := 0;
    end;
    MainForm.PageControlDocument.Visible := True;
    MainForm.ProgressBar.Hide;
  finally
    Screen.Cursor := crDefault;
  end;
end;

function TMainForm.GetActionList: TObjectList<TAction>;
var
  i: Integer;
  Action: TAction;
begin
  Result := TObjectList<TAction>.Create;
  for i := 0 to ActionList.ActionCount - 1 do
    if (ActionList.Actions[i].ImageIndex <> -1) and (ActionList.Actions[i].Hint <> '') then
    begin
      Action := TAction.Create(nil);
      Action.Name := ActionList.Actions[i].Name;
      Action.Caption := StringReplace(ActionList.Actions[i].Caption, '&', '', []);
      Action.ImageIndex := ActionList.Actions[i].ImageIndex;
      Result.Add(Action);
    end;
end;

procedure TMainForm.CreateObjects;
begin
  { TOutputFrame }
  FOutputFrame := TOutputFrame.Create(PanelOutput);
  FOutputFrame.Parent := PanelOutput;
  FOutputFrame.OnTabsheetDblClick := OutputDblClickActionExecute;
  FOutputFrame.OnOpenAll := OutputOpenAllEvent;
  { TDocumentFrame }
  FDocument := TEBDocument.Create(PageControlDocument);
  FDocument.PopupMenuEditor := PopupMenuEditor;
  FDocument.PopupMenuXMLTree := PopupMenuXMLTree;
  FDocument.SetBookmarks := SetBookmarks;
  FDocument.SetTitleBarMenus := SetTitleBarMenus;
  FDocument.OpenDialog := OpenDialog;
  FDocument.SaveDialog := SaveDialog;
  FDocument.CreateFileReopenList := CreateFileReopenList;
  FDocument.GetActionList := GetActionList;
  FDocument.SkinManager := SkinManager;
  FDocument.StatusBar := StatusBar;
  FDocument.ActionSearchFindPrevious := ActionSearchFindPrevious;
  FDocument.ActionSearchFindNext := ActionSearchFindNext;
  FDocument.ActionSearchOptions := ActionSearchOptions;
  FDocument.ActionSearchClose := ActionSearchClose;
  FDocument.ProgressBar := ProgressBar;
  { TEBDirectory }
  FDirectory := TEBDirectory.Create(PageControlDirectory);
  FDirectory.OnFileTreeViewClick := FileTreeViewClickActionExecute;
  FDirectory.OnFileTreeViewDblClick := FileTreeViewDblClickActionExecute;
  FDirectory.OnSearchForFilesOpenFile := DoSearchForFilesOpenFile;
  FDirectory.PopupMenuFileTreeView := PopupMenuFileTreeView;
  FDirectory.SkinManager := SkinManager;
  FDirectory.ReadIniFile;
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
    PanelDirectory.Width := ReadInteger('Options', 'DirectoryWidth', 321);
    Application.ProcessMessages;
    { State }
    State := ReadInteger('Size', 'State', 0);
    case State of
      0: WindowState := wsNormal;
      1: WindowState := wsMinimized;
      2:
        { This does not work WindowState := wsMaximized; }
        ShowWindowAsync(Handle, SW_MAXIMIZE);
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
  LSystemImageList: TImageList;
  LSysImageList: THandle;
  Icon: TIcon;
begin
  LSystemImageList := TImageList.Create(nil);
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
          LMenuItem.OnClick := ActionSelectReopenFileExecute;
          LMenuItem2.OnClick := ActionSelectReopenFileExecute;
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
    FDocument.Open(Filename, Ln, Ch);
end;

procedure TMainForm.FileTreeViewClickActionExecute(Sender: TObject);
begin
  if Assigned(FDirectory) then
  begin
    StatusBar.Panels[4].Text := FDirectory.SelectedFile;
    ActionViewFiles.Enabled := FDirectory.IsAnyDirectory and (FDirectory.SelectedPath <> '');
  end;
end;

procedure TMainForm.FileTreeViewDblClickActionExecute(Sender: TObject);
var
  Filename: string;
begin
  Filename := '';
  if Assigned(FDirectory) then
    Filename := FDirectory.SelectedFile;
  if Filename <> '' then
    FDocument.Open(Filename);
end;

procedure TMainForm.OnAddTreeViewLine(Sender: TObject; Filename: WideString; Ln, Ch: LongInt; Text: WideString; SearchString: WideString);
begin
  FOutputFrame.AddTreeViewLine(FOutputTreeView, Filename, Ln, Ch, Text, SearchString);
end;

procedure TMainForm.OnProgressBarStepFindInFiles(Sender: TObject);
begin
  ProgressBar.StepIt;
end;

procedure TMainForm.SearchFindInFiles(AFolder: string = '');
var
  LEditor: TBCEditor;
  LFileExtensions: string;
  LCount: Integer;
begin
  FOutputTreeView := nil;
  with FindInFilesDialog do
  begin
    if AFolder <> '' then
      FolderText := AFolder;
    LEditor := FDocument.GetActiveEditor;
    if Assigned(LEditor) then
      if LEditor.SelectionAvailable then
        FindWhatText := LEditor.SelectedText;
    if ShowModal = mrOk then
    begin
      Screen.Cursor := crHourGlass;
      try
        StatusBar.Panels[4].Text := LanguageDataModule.GetConstant('CountingFiles');
        Application.ProcessMessages;
        LCount := CountFilesInFolder(FolderText);
      finally
        Screen.Cursor := crDefault;
        StatusBar.Panels[4].Text := '';
      end;
      ProgressBar.Show(LCount);
      FStopWatch.Reset;
      FStopWatch.Start;
      FOutputTreeView := FOutputFrame.AddTreeView(Format(LanguageDataModule.GetConstant('SearchFor'), [FindWhatText]));
      FOutputFrame.ProcessingTabSheet := True;
      PanelOutput.Visible := True;
      PanelOutput.Top := StatusBar.Top - PanelOutput.Height; { always top of status bar }
      Application.ProcessMessages;
      LFileExtensions := GetFileExtensions(OptionsContainer.SupportedFileExtensions);
      FFindInFilesThread := TFindInFilesThread.Create(FindWhatText, FileTypeText, FolderText, SearchCaseSensitive,
        LookInSubfolders, LFileExtensions);
      FFindInFilesThread.OnTerminate := OnTerminateFindInFiles;
      FFindInFilesThread.OnProgressBarStep := OnProgressBarStepFindInFiles;
      FFindInFilesThread.OnCancelSearch := OnCancelSearch;
      FFindInFilesThread.OnAddTreeViewLine := OnAddTreeViewLine;
      FFindInFilesThread.Start;
    end;
  end;
end;

procedure TMainForm.OnTerminateFindInFiles(Sender: TObject);
var
  TimeDifference: string;
begin
  ProgressBar.Hide;
  FStopWatch.Stop;
  if not FOutputFrame.CancelSearch then
  begin
    if FOutputFrame.IsEmpty then
    begin
      FOutputFrame.AddTreeViewLine(FOutputTreeView, '', -1, 0,
        Format(LanguageDataModule.GetMessage('CannotFindString'), [FFindInFilesThread.FindWhatText]));
      StatusBar.Panels[3].Text := '';
    end;
    if StrToInt(FormatDateTime('n', FStopWatch.ElapsedMilliseconds / MSecsPerDay)) < 1 then
      TimeDifference := FormatDateTime(Format('s.zzz "%s"', [LanguageDataModule.GetConstant('Second')]), FStopWatch.ElapsedMilliseconds / MSecsPerDay)
    else
      TimeDifference := FormatDateTime(Format('n "%s" s.zzz "%s"', [LanguageDataModule.GetConstant('Minute'), LanguageDataModule.GetConstant('Second')]), FStopWatch.ElapsedMilliseconds / MSecsPerDay);
    StatusBar.Panels[4].Text := Format(LanguageDataModule.GetConstant('OccurencesFound'), [FOutputFrame.Count, TimeDifference])
  end;
  FOutputFrame.PageControl.EndDrag(False); { if close button pressed and search canceled, dragging will stay... }
  FOutputFrame.ProcessingTabSheet := False;
  FFindInFilesThread := nil;
  SetFields;
end;

function TMainForm.OnCancelSearch: Boolean;
begin
  Result := FOutputFrame.CancelSearch;
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
  i: Integer;
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
    i := 0;
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
      if (i <> 0) and (i mod 40 = 0) then
        LMenuItem.Break := mbBreak;
      Inc(i);
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
  LEditor := FDocument.GetActiveEditor;
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
          FDocument.Open(OutputFileName);
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
  FDirectory.Refresh;
end;
}

end.
