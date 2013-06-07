unit DuplicateCheckerOptions;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Dlg, Vcl.Dialogs, Vcl.ActnList, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, JvExStdCtrls,
  JvEdit, BCEdit, Vcl.Mask, JvExMask, JvSpin;

type
  TDuplicateCheckerOptionsDialog = class(TDialog)
    ButtonPanel: TPanel;
    OKButton: TButton;
    CancelButton: TButton;
    Panel1: TPanel;
    ActionList: TActionList;
    OKAction: TAction;
    ExcludeOtherBranchesAction: TAction;
    RootDirectoryClickAction: TAction;
    ContentPanel: TPanel;
    Content1Panel: TPanel;
    InputGroupBox: TGroupBox;
    Content3Panel: TPanel;
    OptionsGroupBox: TGroupBox;
    MinBlockSizeLabel: TLabel;
    Content2Panel: TPanel;
    OutputGroupBox: TGroupBox;
    FileLabel: TLabel;
    LaunchAfterCreationCheckBox: TCheckBox;
    FileEdit: TBCEdit;
    FileBitBtn: TBitBtn;
    FolderBitBtn: TBitBtn;
    FolderEdit: TBCEdit;
    FolderLabel: TLabel;
    MinCharsLabel: TLabel;
    MinBlockSizeSpinEdit: TJvSpinEdit;
    MinCharsSpinEdit: TJvSpinEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DuplicateCheckerOptionsDialog: TDuplicateCheckerOptionsDialog;

implementation

{$R *.dfm}

end.
