unit OptionsEditorOptions;

interface

uses
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, BCControls.ComboBox,
  BCControls.CheckBox, BCControls.Edit, Vcl.ComCtrls, JvEdit;

type
  TEditorOptionsFrame = class(TFrame)
    Panel: TPanel;
    AutoIndentCheckBox: TBCCheckBox;
    TrimTrailingSpacesCheckBox: TBCCheckBox;
    ScrollPastEofCheckBox: TBCCheckBox;
    ScrollPastEolCheckBox: TBCCheckBox;
    LineSpacingLabel: TLabel;
    LineSpacingEdit: TBCEdit;
    TabWidthLabel: TLabel;
    TabWidthEdit: TBCEdit;
    BrightnessTrackBar: TTrackBar;
    ActiveLineColorBrightnessLabel: TLabel;
    TabsToSpacesCheckBox: TBCCheckBox;
    AutoSaveCheckBox: TBCCheckBox;
    InsertCaretLabel: TLabel;
    InsertCaretComboBox: TBCComboBox;
    UndoAfterSaveCheckBox: TBCCheckBox;
    SmartTabsCheckBox: TBCCheckBox;
    SmartTabDeleteCheckBox: TBCCheckBox;
    MinimapFontSizeLabel: TLabel;
    MinimapFontSizeTrackBar: TTrackBar;
    TripleClickRowSelectCheckBox: TBCCheckBox;
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
  end;

implementation

{$R *.dfm}

uses
  BCCommon.LanguageStrings;

constructor TEditorOptionsFrame.Create(AOwner: TComponent);
begin
  inherited;
  with InsertCaretComboBox.Items do
  begin
    Add(LanguageDatamodule.GetConstant('VerticalLine'));
    Add(LanguageDatamodule.GetConstant('HorizontalLine'));
    Add(LanguageDatamodule.GetConstant('HalfBlock'));
    Add(LanguageDatamodule.GetConstant('Block'));
  end;
end;

end.
