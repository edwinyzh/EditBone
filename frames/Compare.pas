unit Compare;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms,
  Diff, Vcl.Dialogs, Grids, ExtCtrls, StdCtrls, JvExStdCtrls, Mask, JvExMask, JvToolEdit,
  Buttons, JvExControls, JvSpeedButton, JvEdit, JvStringGrid,
  ActnList, JvScrollBar, JvExForms, JvExExtCtrls, JvSplitter, JvExtComponent,
  JvContentScroller, JvExGrids, XPMan, BCEdit, JvCombobox, BCComboBox, BCFilenameEdit;

type


  TGridEventType = (etNone, etMouse, etKey);

   TSyncKind = (skBoth, skVScroll, skHScroll);

  (*TJvStringGrid = class(JvStringGrid.TJvStringGrid)
  private
    FInSync: Boolean;
    FSyncGrid: TJvStringGrid;
    FSyncKind: TSyncKind;
    { Private declarations }
    procedure WMVScroll(var Msg: TMessage); message WM_VSCROLL;
    procedure WMHScroll(var Msg: TMessage); message WM_HSCROLL;
  protected
    { Protected declarations }
  public
    { Public declarations }
    procedure DoSync(Msg, wParam: Integer; lParam: Longint); virtual;
  published
    { Published declarations }
    property SyncGrid: TJvStringGrid read FSyncGrid write FSyncGrid;
    property SyncKind: TSyncKind read FSyncKind write FSyncKind default skBoth;
  end;    *)

  TCompareFrame = class(TFrame)
    LeftPanel: TPanel;
    BottomPanel: TPanel;
    LeftEdit: TBCEdit;
    RightEdit: TBCEdit;
    LeftLabel: TLabel;
    RightLabel: TLabel;
    ActionList: TActionList;
    RefreshAction: TAction;
    SaveLeftGridAction: TAction;
    SaveRightGridAction: TAction;
    LeftGridOnChangeAction: TAction;
    RightGridOnChangeAction: TAction;
    RightPanel: TPanel;
    RightTopPanel: TPanel;
    FilenameEditRight: TBCFilenameEdit;
    SaveSpeedButton2: TJvSpeedButton;
    LeftTopPanel: TPanel;
    SaveSpeedButton1: TJvSpeedButton;
    FilenameEditLeft: TBCFilenameEdit;
    FindNextDifferenceAction: TAction;
    CopyRightSpeedButton: TJvSpeedButton;
    CopyLeftSpeedButton: TJvSpeedButton;
    CopySelectionRightAction: TAction;
    CopySelectionLeftAction: TAction;
    UpdateLeftSpeedButton: TJvSpeedButton;
    CancelLeftSpeedButton: TJvSpeedButton;
    CancelRightSpeedButton: TJvSpeedButton;
    UpdateRightSpeedButton: TJvSpeedButton;
    UpdateLeftRowAction: TAction;
    UpdateRightRowAction: TAction;
    CancelLeftRowAction: TAction;
    CancelRightRowAction: TAction;
    LeftScrollBox: TScrollBox;
    LeftGrid: TJvStringGrid;
    DrawBarPanel: TPanel;
    RightScrollBox: TScrollBox;
    RightGrid: TJvStringGrid;
    TopLeftPanel: TPanel;
    FindNextDifferenceSpeedButton: TJvSpeedButton;
    RefreshSpeedButton: TJvSpeedButton;
    DrawGrid: TJvStringGrid;
    LeftComboBox: TBCComboBox;
    LeftComboBoxChangeAction: TAction;
    RightComboBoxChangeAction: TAction;
    RightComboBox: TBCComboBox;
    OpenDocumentsLeftSpeedButton: TJvSpeedButton;
    OpenDocumentsRightSpeedButton: TJvSpeedButton;
    OpenDocumentsLeftAction: TAction;
    OpenDocumentsRightAction: TAction;
    procedure DrawGridDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure FilenameEditLeftAfterDialog(Sender: TObject; var AName: string;
      var AAction: Boolean);
    procedure FilenameEditRightAfterDialog(Sender: TObject; var AName: string;
      var AAction: Boolean);
    procedure RefreshActionExecute(Sender: TObject);
    procedure SaveLeftGridActionExecute(Sender: TObject);
    procedure SaveRightGridActionExecute(Sender: TObject);
    procedure LeftGridDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure RightGridDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure FrameResize(Sender: TObject);
    procedure DrawGridMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure DrawGridMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure RightGridMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure RightGridMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure LeftGridMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure LeftGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure LeftGridMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure LeftGridKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure RightGridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure RightGridKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DrawGridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FindNextDifferenceActionExecute(Sender: TObject);
    procedure LeftEditKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure RightEditKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FilenameEditRightKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FilenameEditLeftKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure CopySelectionRightActionExecute(Sender: TObject);
    procedure CopySelectionLeftActionExecute(Sender: TObject);
    procedure UpdateLeftRowActionExecute(Sender: TObject);
    procedure UpdateRightRowActionExecute(Sender: TObject);
    procedure CancelLeftRowActionExecute(Sender: TObject);
    procedure CancelRightRowActionExecute(Sender: TObject);
    procedure VerticalScrollBarScroll(Sender: TObject; ScrollCode: TScrollCode; var ScrollPos: Integer);
    procedure LeftComboBoxChangeActionExecute(Sender: TObject);
    procedure RightComboBoxChangeActionExecute(Sender: TObject);
    procedure LeftComboBoxKeyPress(Sender: TObject; var Key: Char);
    procedure OpenDocumentsLeftActionExecute(Sender: TObject);
    procedure OpenDocumentsRightActionExecute(Sender: TObject);
  private
    { Private declarations }
    FDiff: TDiff;
    FSourceLeft, FSourceRight: TStringList;
    FResultLeft, FResultRight: TStringList;
    FHashListLeft, FHashListRight: TList;
    //FGridVisibleRows: Integer;
    //FDrawGridVisibleRows: Integer;
    FPreviousRow: Integer;
    //FGridVisibleTop: Integer;
    //FGridVisibleBottom: Integer;

    OldLeftGridProc, OldRightGridProc, OldDrawGridProc, OldLeftScrollBoxProc, OldRightScrollBoxProc: TWndMethod;
    procedure SetHistoryList(Value: TStringList);
    procedure LeftGridWindowProc(var Message: TMessage);
    procedure RightGridWindowProc(var Message: TMessage);
    procedure DrawGridWindowProc(var Message: TMessage);
//    procedure ScrollGridWindowProc(var Message: TMessage);
    procedure LeftScrollBoxWindowProc(var Message: TMessage);
    procedure RightScrollBoxWindowProc(var Message: TMessage);

    procedure OpenFileToLeftGrid(Filename: string);
    procedure OpenFileToRightGrid(Filename: string);
    function CheckIfFileExists(Filename: string): Boolean;
    procedure ClearLeftGrid;
    procedure ClearRightGrid;
    procedure BuildHashListLeft;
    procedure BuildHashListRight;
    procedure SetMaxCounts;
    procedure FillLeftGridFromSource;
    procedure FillRightGridFromSource;
    procedure Compare;
//    procedure ScrollDrawGrid;
    procedure ScrollGrids(Row: Integer; EventType: TGridEventType = etNone);
    //procedure SetGridVisibleRange(Row: Integer; EventType: TGridEventType = etNone);
    procedure SaveGridChanges;
//    procedure SetScrollBarMax;
  //protected
    //property HistoryList: TStringList read FHistoryList write FHistoryList;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property HistoryList: TStringList write SetHistoryList;
  end;

implementation

{$R *.dfm}

uses
  Common, Hash, Math, Types;
         {
procedure TJvStringGrid.WMVScroll(var Msg: TMessage);
begin
  if not FInSync and
    Assigned(FSyncGrid) and
    (FSyncKind in [skBoth, skVScroll]) then
    FSyncGrid.DoSync(WM_VSCROLL, Msg.wParam, Msg.lParam);
  inherited;
end;

procedure TJvStringGrid.WMHScroll(var Msg: TMessage);
begin
  if not FInSync and
    Assigned(FSyncGrid) and
    (FSyncKind in [skBoth, skHScroll]) then
    FSyncGrid.DoSync(WM_HSCROLL, Msg.wParam, Msg.lParam);
  inherited;
end;

procedure TJvStringGrid.DoSync(Msg, wParam: Integer; lParam: Longint);
begin
  FInSync := True;
  Perform(Msg, wParam, lParam);
  FinSync := False;
end;                }

procedure TCompareFrame.LeftScrollBoxWindowProc(var Message: TMessage);
begin
  OldLeftScrollBoxProc(Message);
  if  (Message.Msg = WM_HSCROLL) or (Message.msg = WM_Mousewheel) then
    OldRightScrollBoxProc(Message);
end;

procedure TCompareFrame.RightScrollBoxWindowProc(var Message: TMessage);
begin
  OldRightScrollBoxProc(Message);
  if  (Message.Msg = WM_HSCROLL) or (Message.msg = WM_Mousewheel) then
    OldLeftScrollBoxProc(Message);
end;

procedure TCompareFrame.LeftGridWindowProc(var Message: TMessage);
begin
  OldLeftGridProc(Message);
  if ((Message.Msg = WM_VSCROLL) or //(Message.Msg = WM_HSCROLL) or
      (Message.msg = WM_Mousewheel)) then
  begin
    OldRightGridProc(Message);
    //OldDrawGridProc(Message);
    //DrawGrid.Invalidate;

  end;
end;

procedure TCompareFrame.RightGridWindowProc(var Message: TMessage);
begin
  OldRightGridProc(Message);
  if ((Message.Msg = WM_VSCROLL) or // (Message.Msg = WM_HSCROLL) or
     (Message.msg = WM_Mousewheel)) then
  begin
    OldLeftGridProc(Message);
    //OldDrawGridProc(Message);
    //DrawGrid.Invalidate;
  end;
end;

procedure TCompareFrame.DrawGridWindowProc(var Message: TMessage);
begin
  OldDrawGridProc(Message);
  if ((Message.Msg = WM_VSCROLL) or //(Message.Msg = WM_HSCROLL) or
     (Message.msg = WM_Mousewheel)) then
  begin
    OldLeftGridProc(Message);
    OldRightGridProc(Message);
    //OldScrollGridProc(Message);
    DrawGrid.Invalidate;
  end;
end;

{procedure TCompareFrame.ScrollGridWindowProc(var Message: TMessage);
begin
  OldScrollGridProc(Message);
  if ((Message.Msg = WM_VSCROLL) or //(Message.Msg = WM_HSCROLL) or
     (Message.msg = WM_Mousewheel)) then
  begin
    OldLeftGridProc(Message);
    OldRightGridProc(Message);
    OldDrawGridProc(Message);

    DrawGrid.Invalidate;
  end;
end;
 }
constructor TCompareFrame.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FDiff := TDiff.Create(self);
  FSourceLeft := TStringList.Create;
  FSourceRight := TStringList.Create;
  FResultLeft := TStringList.Create;
  FResultRight := TStringList.Create;
  FHashListLeft := TList.Create;
  FHashListRight := TList.Create;

  OldLeftGridProc := LeftGrid.WindowProc;
  OldRightGridProc := RightGrid.WindowProc;
  OldDrawGridProc := DrawGrid.WindowProc;
  //OldScrollGridProc := ScrollGrid.WindowProc;
  LeftGrid.WindowProc := LeftGridWindowProc;
  RightGrid.WindowProc := RightGridWindowProc;
  DrawGrid.WindowProc := DrawGridWindowProc;
  //ScrollGrid.WindowProc := ScrollGridWindowProc;
  OldLeftScrollBoxProc := LeftScrollBox.WindowProc;
  OldRightScrollBoxProc := RightScrollBox.WindowProc;
  LeftScrollBox.WindowProc := LeftScrollBoxWindowProc;
  RightScrollBox.WindowProc := RightScrollBoxWindowProc;
end;

destructor TCompareFrame.Destroy;
begin
  SaveGridChanges;
  inherited Destroy;
  FSourceLeft.Free;
  FSourceRight.Free;
  FResultLeft.Free;
  FResultRight.Free;
  FHashListLeft.Free;
  FHashListRight.Free;
end;

procedure TCompareFrame.DrawGridDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
const
  PaleGreen: TColor = $77CC77;
  PaleRed: TColor = $7777CC;
  PaleBlue: TColor = $CC7777;
  PaleGray: TColor = $D0D0D0;
var
  lclr, rclr: TColor;
begin
  lclr := clNone;
  rclr := clNone;
  if FDiff.Count = 0 then
    with DrawGrid.Canvas do
    begin
      Brush.Color := clBtnFace;
      FillRect(Rect);
    end
    else
    begin
      if (ARow < FDiff.Count) then
        case FDiff.Compares[ARow].Kind of
          ckNone:
            begin
              lclr := clSilver;
              rclr := clSilver;

              //if (ARow < FGridVisibleBottom) and (ARow >= FGridVisibleTop) then
              if (ARow < LeftGrid.TopRow + LeftGrid.VisibleRowCount) and (ARow >= LeftGrid.TopRow) then
              begin
                lclr := clWhite;
                rclr := clWhite;
              end;
            end;
          ckModify:
            begin
              lclr := clRed;
              rclr := clRed;
             // if (ARow < FGridVisibleBottom) and (ARow >= FGridVisibleTop) then
              if (ARow < LeftGrid.TopRow + LeftGrid.VisibleRowCount) and (ARow >= LeftGrid.TopRow) then
              begin
                lclr := PaleRed;
                rclr := PaleRed;
              end;
            end;
          ckDelete:
            begin
              rclr := clBtnShadow;
              lclr := clBlue;
             // if (ARow < FGridVisibleBottom) and (ARow >= FGridVisibleTop) then
              if (ARow < LeftGrid.TopRow + LeftGrid.VisibleRowCount) and (ARow >= LeftGrid.TopRow) then
              begin
                lclr := PaleBlue;
                rclr := PaleGray;
              end;
            end; // PaleBlue; //PaleBlue;
          ckAdd:
            begin
              lclr := clBtnShadow;
              rclr := clBlue;
              //if (ARow < FGridVisibleBottom) and (ARow >= FGridVisibleTop) then
              if (ARow < LeftGrid.TopRow + LeftGrid.VisibleRowCount) and (ARow >= LeftGrid.TopRow) then
              begin
                lclr := PaleGray;
                rclr := PaleBlue;
              end;
            end; // PaleRed; //PaleGreen;
        end;

      with DrawGrid.Canvas do
      begin
        //if (ARow < FGridVisibleBottom) and (ARow >= FGridVisibleTop) then
        if (ARow < LeftGrid.TopRow + LeftGrid.VisibleRowCount) and (ARow >= LeftGrid.TopRow) then
        begin
          Brush.Color := clBlack;
          FillRect(Types.Rect(0, Rect.top, 1, Rect.bottom));
          Brush.Color := clBlack;
          FillRect(Types.Rect(21, Rect.top, 22, Rect.bottom));
        end;

        { Draw grids }
        Brush.Color := lclr;
        FillRect(Types.Rect(1, Rect.top, 11, Rect.bottom));
        Brush.Color := rclr;
        FillRect(Types.Rect(11, Rect.top, 21, Rect.bottom));
        if ARow = LeftGrid.Row then
        begin
          Brush.Color := PaleGreen;
          FillRect(Types.Rect(1, Rect.top, 21, Rect.bottom));
        end;

        { Draw a rectangle around visible area }
        //if FGridVisibleBottom = ARow then
        if LeftGrid.TopRow + LeftGrid.VisibleRowCount = ARow then
        begin
          Brush.Color := clBlack;
          FillRect(Types.Rect(0, Rect.top, 22, Rect.bottom));
        end;
        //if FGridVisibleTop - 1 = ARow then
        if LeftGrid.TopRow - 1 = ARow then
        begin
          Brush.Color := clBlack;
          FillRect(Types.Rect(0, Rect.top, 22, Rect.bottom));
        end;

        { Draw an arrow:
          **
          * **
          *   **
          *     *
          *   **
          * **
          ** }

      end;
    end;
end;

procedure TCompareFrame.DrawGridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_UP) or (Key = VK_DOWN) then
    ScrollGrids(DrawGrid.Row);
end;

procedure TCompareFrame.VerticalScrollBarScroll(Sender: TObject; ScrollCode: TScrollCode;
  var ScrollPos: Integer);
begin
  if (LeftGrid.RowCount = 1) and (RightGrid.RowCount = 1) then
    Exit;

  DrawGrid.Row := ScrollPos;
  DrawGrid.Invalidate;
  LeftGrid.Row := ScrollPos;
  RightGrid.Row := ScrollPos;
end;

procedure TCompareFrame.ScrollGrids(Row: Integer; EventType: TGridEventType);
//var
//  ScoPos: Integer;
begin
  if Row = FPreviousRow then
    Exit;
  if LeftGrid.RowCount <> RightGrid.RowCount then
    Exit;

  LeftGrid.Row := Row;
  RightGrid.Row := Row;
  DrawGrid.Row := Row;
  //VerticalScrollBar.Position := Row;
//  ScrollGrid.Row := Row;
  LeftEdit.Text := LeftGrid.Cells[1, Row];
  RightEdit.Text := RightGrid.Cells[1, Row];
  (*
    if (Row >= FGridVisibleBottom) or (Row <= FGridVisibleTop) then
    begin

      if EventType = etKey then
        ScoPos := (Row div FGridVisibleRows) * FGridVisibleRows *
          Round(LeftScrollBox.VertScrollBar.Range / DrawGrid.RowCount)
      else
      if (Row = FGridVisibleBottom) then
        ScoPos := Round((Row / FGridVisibleRows) * FGridVisibleRows) *
          Round(LeftScrollBox.VertScrollBar.Range / DrawGrid.RowCount)
        // direction down
      else
        ScoPos := Row * Round(LeftScrollBox.VertScrollBar.Range / DrawGrid.RowCount); // direction up
      if ScoPos <= LeftScrollBox.VertScrollBar.Range then
      begin
        LeftScrollBox.VertScrollBar.Position := ScoPos;
        RightScrollBox.VertScrollBar.Position := ScoPos;
      end;
    end;
   *)
  //SetGridVisibleRange(Row, EventType);

  DrawGrid.Invalidate;
  FPreviousRow := Row;
end;

(*procedure TCompareFrame.SetGridVisibleRange(Row: Integer; EventType: TGridEventType);
var
  ARow: Integer;
begin
  ARow := Row;

  if (ARow < FGridVisibleBottom) and (ARow > FGridVisibleTop) then
    Exit;

  if ARow < 1 then
    ARow := 0;

  if (ARow > DrawGrid.RowCount - FGridVisibleRows) then
  begin
    FGridVisibleTop := DrawGrid.RowCount - FGridVisibleRows;
    FGridVisibleBottom := DrawGrid.RowCount;
  end
  else
  if (EventType = etKey) or (EventType = etMouse) then
  begin
    { visible rows on left (or right) grid }
    FGridVisibleTop := (ARow div FGridVisibleRows) * FGridVisibleRows;
    FGridVisibleBottom := (ARow div FGridVisibleRows)
        * FGridVisibleRows + FGridVisibleRows;
  end
  else
  if (ARow = FGridVisibleBottom) then
  begin
    FGridVisibleTop := Round((ARow / FGridVisibleRows) * FGridVisibleRows);
    FGridVisibleBottom := Round((ARow / FGridVisibleRows)
        * FGridVisibleRows + FGridVisibleRows);
  end
  else
  begin
    FGridVisibleTop := ARow;
    FGridVisibleBottom := ARow + FGridVisibleRows;
  end;
end;
*)
procedure TCompareFrame.DrawGridMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if (LeftGrid.RowCount = 1) and (RightGrid.RowCount = 1) then
    Exit;
  ScrollGrids(DrawGrid.Row);
end;

procedure TCompareFrame.DrawGridMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if (LeftGrid.RowCount = 1) and (RightGrid.RowCount = 1) then
    Exit;
  if Shift = [ssLeft] then
    ScrollGrids(DrawGrid.Row);
end;

procedure TCompareFrame.FilenameEditLeftAfterDialog
  (Sender: TObject; var AName: string; var AAction: Boolean);
begin
  OpenFileToLeftGrid(AName);
end;

procedure TCompareFrame.FilenameEditLeftKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    OpenFileToLeftGrid(FilenameEditLeft.Text);
end;

procedure TCompareFrame.FilenameEditRightAfterDialog
  (Sender: TObject; var AName: string; var AAction: Boolean);
begin
  OpenFileToRightGrid(AName);
end;

procedure TCompareFrame.FilenameEditRightKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    OpenFileToRightGrid(FilenameEditRight.Text);
end;

procedure TCompareFrame.LeftComboBoxChangeActionExecute(Sender: TObject);
begin
  FilenameEditLeft.Text := LeftComboBox.Text;
  OpenFileToLeftGrid(FilenameEditLeft.Text);
end;

procedure TCompareFrame.LeftComboBoxKeyPress(Sender: TObject; var Key: Char);
begin
   Key := #0;
end;

procedure TCompareFrame.LeftEditKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if AnsiCompareStr(LeftGrid.Cells[1, LeftGrid.Row], LeftEdit.Text)<> 0 then
  begin
    UpdateLeftRowAction.Enabled := True;
    CancelLeftRowAction.Enabled := True;

    if Key = VK_RETURN then
      UpdateLeftRowAction.Execute;
  end;
end;

procedure TCompareFrame.LeftGridDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
const
  PaleGreen: TColor = $AAFFAA;
  PaleRed: TColor = $AAAAFF;
  PaleBlue: TColor = $FFAAAA;
var
  clr: TColor;
begin
  if FDiff.Count = 0 then
    clr := clWhite
  else
    clr := clBtnFace;

  if (ACol = 1) and (ARow < FDiff.Count) then
    case FDiff.Compares[ARow].Kind of
      ckNone:
        clr := clWhite;
      ckModify:
        clr := PaleRed;
      ckDelete:
        clr := PaleBlue; // PaleBlue;
      ckAdd:
        clr := clBtnFace; // PaleRed; //PaleGreen; 
    end;

  with LeftGrid.Canvas do
  begin
    if (gdSelected in State) then
      Brush.Color := PaleGreen
    else
      Brush.Color := clr;
    FillRect(Rect);
    TextRect(Rect, Rect.Left + 3, Rect.top + 2, LeftGrid.Cells[ACol, ARow]);

    if FSourceLeft.Count = 0 then
      Exit;

    if ACol = 0 then
    begin
      Pen.Color := clWhite;
      MoveTo(Rect.Right - 1, 0);
      LineTo(Rect.Right - 1, Rect.bottom);
    end
    else
    begin
      if (ACol = 1) then
      begin
        Pen.Color := $333333;
        MoveTo(Rect.Right - 1, 0);
        LineTo(Rect.Right - 1, Rect.bottom);
      end;
      Pen.Color := clSilver;
      MoveTo(Rect.Left, 0);
      LineTo(Rect.Left, Rect.bottom);
    end;
  end;
end;

procedure TCompareFrame.LeftGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_PRIOR then
    //LeftGrid.Row := Max(LeftGrid.Row - FGridVisibleRows, 0);
    LeftGrid.Row := Max(LeftGrid.Row - LeftGrid.VisibleRowCount, 0);
  if Key = VK_NEXT then
   // LeftGrid.Row := Min(LeftGrid.Row + FGridVisibleRows, LeftGrid.RowCount - 1);
    LeftGrid.Row := Min(LeftGrid.Row + LeftGrid.VisibleRowCount, LeftGrid.RowCount - 1);
  if (Key = VK_PRIOR) or (Key = VK_NEXT) then 
    Key := 0;
  if (Key = VK_UP) or (Key = VK_DOWN) or (Key = VK_PRIOR) or (Key = VK_NEXT) then  
    ScrollGrids(LeftGrid.Row, etKey);
end;

procedure TCompareFrame.LeftGridKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_UP) or (Key = VK_DOWN) or (Key = VK_PRIOR) or (Key = VK_NEXT) then 
    ScrollGrids(LeftGrid.Row, etKey);
end;

procedure TCompareFrame.LeftGridMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ScrollGrids(LeftGrid.Row, etMouse);
end;

procedure TCompareFrame.LeftGridMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if Shift = [ssLeft] then
    ScrollGrids(LeftGrid.Row, etMouse);
end;

procedure TCompareFrame.RightEditKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if AnsiCompareStr(RightGrid.Cells[1, RightGrid.Row], RightEdit.Text)<> 0 then
  begin
    UpdateRightRowAction.Enabled := True;
    CancelRightRowAction.Enabled := True;

    if Key = VK_RETURN then
      UpdateRightRowAction.Execute;
  end;
end;

procedure TCompareFrame.RightGridDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
const
  PaleGreen: TColor = $AAFFAA;
  PaleRed: TColor = $AAAAFF;
  PaleBlue: TColor = $FFAAAA;
var
  clr: TColor;
begin
  if FDiff.Count = 0 then
    clr := clWhite
  else
    clr := clBtnFace;

  if (ACol in [1, 3]) and (ARow < FDiff.Count) then
    case FDiff.Compares[ARow].Kind of
      ckNone:
        clr := clWhite;
      ckModify:
        clr := PaleRed;
      ckDelete:
        clr := clBtnFace;
      ckAdd:
        clr := PaleBlue;
    end;

  with RightGrid.Canvas do
  begin
    if (gdSelected in State) then
      Brush.Color := PaleGreen
    else
      Brush.Color := clr;
    FillRect(Rect);
    TextRect(Rect, Rect.Left + 3, Rect.top + 2, RightGrid.Cells[ACol, ARow]);

    if FSourceRight.Count = 0 then
      Exit;

    if ACol = 0 then
    begin
      Pen.Color := clWhite;
      MoveTo(Rect.Right - 1, 0);
      LineTo(Rect.Right - 1, Rect.bottom);
    end
    else
    begin
      if (ACol = 1) then
      begin
        Pen.Color := $333333;
        MoveTo(Rect.Right - 1, 0);
        LineTo(Rect.Right - 1, Rect.bottom);
      end;
      Pen.Color := clSilver;
      MoveTo(Rect.Left, 0);
      LineTo(Rect.Left, Rect.bottom);
    end;
  
  end;
end;

procedure TCompareFrame.RightGridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_PRIOR then
    RightGrid.Row := Max(RightGrid.Row - RightGrid.VisibleRowCount, 0);
  if Key = VK_NEXT then
    RightGrid.Row := Min(RightGrid.Row + RightGrid.VisibleRowCount, RightGrid.RowCount - 1);
  if (Key = VK_PRIOR) or (Key = VK_NEXT) then 
    Key := 0;
  if (Key = VK_UP) or (Key = VK_DOWN) or (Key = VK_PRIOR) or (Key = VK_NEXT) then 
    ScrollGrids(RightGrid.Row, etKey);
end;

procedure TCompareFrame.RightGridKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_UP) or (Key = VK_DOWN) or (Key = VK_PRIOR) or (Key = VK_NEXT) then 
    ScrollGrids(RightGrid.Row, etKey);
end;

procedure TCompareFrame.RightGridMouseDown
  (Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ScrollGrids(RightGrid.Row, etMouse);
end;

procedure TCompareFrame.RightGridMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if Shift = [ssLeft] then
    ScrollGrids(RightGrid.Row, etMouse); 
end;

(*procedure TCompareFrame.ScrollDrawGrid;
begin
  FGridVisibleTop := LeftGrid.TopRow; //  Round( LeftScrollBox.VertScrollBar.Position / LeftGrid.DefaultRowHeight);
  FGridVisibleBottom := LeftGrid.TopRow + LeftGrid.VisibleRowCount; // FGridVisibleTop + FGridVisibleRows;
  DrawGrid.Row := FGridVisibleTop;
  if (FGridVisibleTop > DrawGrid.RowCount - FGridVisibleRows) then
  begin
    FGridVisibleTop := DrawGrid.RowCount - FGridVisibleRows;
    FGridVisibleBottom := DrawGrid.RowCount;
    DrawGrid.Row := DrawGrid.RowCount - 1;
  end;
  DrawGrid.Invalidate;
end;*)

procedure TCompareFrame.SaveGridChanges;
begin
  if SaveLeftGridAction.Enabled then
    if SaveChanges(False) = mrYes then
      SaveLeftGridAction.Execute;
  if SaveRightGridAction.Enabled then
    if SaveChanges(False) = mrYes then
      SaveRightGridAction.Execute;
end;

procedure TCompareFrame.RefreshActionExecute(Sender: TObject);
begin
  SaveGridChanges;
  OpenFileToLeftGrid(FilenameEditLeft.Text);
  OpenFileToRightGrid(FilenameEditRight.Text);
end;

procedure TCompareFrame.SaveLeftGridActionExecute(Sender: TObject);
begin
  FSourceLeft.SaveToFile(FilenameEditLeft.FileName);
  SaveLeftGridAction.Enabled := False;
end;

procedure TCompareFrame.SaveRightGridActionExecute(Sender: TObject);
begin
  FSourceRight.SaveToFile(FilenameEditRight.FileName);
  SaveRightGridAction.Enabled := False;
end;

procedure TCompareFrame.CancelLeftRowActionExecute(Sender: TObject);
begin
  LeftEdit.Text := LeftGrid.Cells[1, LeftGrid.Row];
  UpdateLeftRowAction.Enabled := False;
  CancelLeftRowAction.Enabled := False;
end;

procedure TCompareFrame.CancelRightRowActionExecute(Sender: TObject);
begin
  RightEdit.Text := RightGrid.Cells[1, RightGrid.Row];
  UpdateRightRowAction.Enabled := False;
  CancelRightRowAction.Enabled := False;
end;

function TCompareFrame.CheckIfFileExists(Filename: string): Boolean;
begin
  Result := FileExists(Filename);
  if not Result then
    ShowErrorMessage(Format('File ''%s'' not found.', [Filename]))
end;

//procedure TCompareFrame.SetScrollBarMax;
//begin
  //VerticalScrollBar.Position := 0;
  //VerticalScrollBar.Max := Max(LeftGrid.RowCount - 1, RightGrid.RowCount - 1);
//end;

procedure TCompareFrame.OpenDocumentsLeftActionExecute(Sender: TObject);
begin
  LeftComboBox.DroppedDown := not LeftComboBox.DroppedDown;
end;

procedure TCompareFrame.OpenDocumentsRightActionExecute(Sender: TObject);
begin
  RightComboBox.DroppedDown := not RightComboBox.DroppedDown;
end;

procedure TCompareFrame.OpenFileToLeftGrid(Filename: string);
var
  FName: string;
begin
  ClearLeftGrid;

  FName := SysUtils.StringReplace(Filename, '"', '', [rfReplaceAll]);
  if Trim(FName) = '' then
    Exit;

  if not CheckIfFileExists(FName) then
    Exit;

  FSourceLeft.LoadFromFile(FName);
  BuildHashListLeft;
  SetMaxCounts;
  FillLeftGridFromSource;
  if LeftComboBox.Items.IndexOf(FName) = -1 then
    LeftComboBox.Items.Add(FName);
  Compare;
  FindNextDifferenceAction.Enabled := ((FDiff.DiffStats.adds <> 0) or
    (FDiff.DiffStats.deletes <> 0) or (FDiff.DiffStats.modifies <> 0)) and
    (FSourceRight.Count <> 0) and (FSourceLeft.Count <> 0);
  RefreshAction.Enabled := (FSourceRight.Count <> 0) and (FSourceLeft.Count <> 0);
  CopySelectionRightAction.Enabled := (FSourceRight.Count <> 0) and (FSourceLeft.Count <> 0);
  CopySelectionLeftAction.Enabled := (FSourceRight.Count <> 0) and (FSourceLeft.Count <> 0);
  AutoSizeCol(LeftGrid);
  if FSourceRight.Count <> 0 then
    AutoSizeCol(RightGrid);

  LeftEdit.Enabled := True;
  LeftEdit.Text := LeftGrid.Cells[1, 0];

//   LeftScrollBox.VertScrollBar.Range := FSourceLeft.Count * 19;

  DrawGrid.Enabled := True;
  DrawGrid.RowCount := LeftGrid.RowCount;
  DrawGrid.Invalidate;

  //SetScrollBarMax;
end;

procedure TCompareFrame.OpenFileToRightGrid(Filename: string);
var
  FName: string;
begin
  ClearRightGrid;

  FName := SysUtils.StringReplace(Filename, '"', '', [rfReplaceAll]);
  if Trim(FName) = '' then
    Exit;

  if not CheckIfFileExists(FName) then
    Exit;

  FSourceRight.LoadFromFile(FName);
  BuildHashListRight;
  SetMaxCounts;
  FillRightGridFromSource;
  if RightComboBox.Items.IndexOf(FName) = -1 then
    RightComboBox.Items.Add(FName);
  Compare;
  FindNextDifferenceAction.Enabled := ((FDiff.DiffStats.adds <> 0) or
    (FDiff.DiffStats.deletes <> 0) or (FDiff.DiffStats.modifies <> 0)) and
    (FSourceRight.Count <> 0) and (FSourceLeft.Count <> 0);
  RefreshAction.Enabled := (FSourceRight.Count <> 0) and (FSourceLeft.Count <> 0);
  CopySelectionRightAction.Enabled := (FSourceRight.Count <> 0) and (FSourceLeft.Count <> 0);
  CopySelectionLeftAction.Enabled := (FSourceRight.Count <> 0) and (FSourceLeft.Count <> 0);
  AutoSizeCol(RightGrid);

  if FSourceLeft.Count <> 0 then
    AutoSizeCol(LeftGrid);

  RightEdit.Enabled := True;
  RightEdit.Text := RightGrid.Cells[1, 0];

  DrawGrid.Enabled := True;
  DrawGrid.RowCount := LeftGrid.RowCount;
  DrawGrid.Invalidate;

  //SetScrollBarMax;
end;

procedure TCompareFrame.ClearLeftGrid;
begin
  FSourceLeft.Clear;
  FResultLeft.Clear;
  FHashListLeft.Clear;
  LeftGrid.Clear;
  LeftGrid.RowCount := 0;
  SaveLeftGridAction.Enabled := False;
  CopySelectionRightAction.Enabled := False;
  UpdateLeftRowAction.Enabled := False;
  CancelLeftRowAction.Enabled := False;
  FDiff.Clear;
  FindNextDifferenceAction.Enabled := False;
  RefreshAction.Enabled := False;
  LeftEdit.Text := '';
  LeftEdit.Enabled := False;
end;

procedure TCompareFrame.ClearRightGrid;
begin
  FSourceRight.Clear;
  FResultRight.Clear;
  FHashListRight.Clear;
  RightGrid.Clear;
  RightGrid.RowCount := 0;
  SaveRightGridAction.Enabled := False;
  CopySelectionLeftAction.Enabled := False;
  UpdateRightRowAction.Enabled := False;
  CancelRightRowAction.Enabled := False;
  FDiff.Clear;
  FindNextDifferenceAction.Enabled := False;
  RefreshAction.Enabled := False;
  RightEdit.Text := '';
  RightEdit.Enabled := False;
end;

procedure TCompareFrame.RightComboBoxChangeActionExecute(Sender: TObject);
begin
  FilenameEditRight.Text := RightComboBox.Text;
  OpenFileToRightGrid(FilenameEditRight.Text);
end;

procedure TCompareFrame.BuildHashListLeft;
var
  i: Integer;
begin
  FHashListLeft.Clear;
  for i := 0 to FSourceLeft.Count - 1 do
    FHashListLeft.Add(HashLine(FSourceLeft[i], True, True));
end;

procedure TCompareFrame.BuildHashListRight;
var
  i: Integer;
begin
  FHashListRight.Clear;
  for i := 0 to FSourceRight.Count - 1 do
    FHashListRight.Add(HashLine(FSourceRight[i], True, True));
end;

procedure TCompareFrame.SetMaxCounts;
begin
  LeftGrid.RowCount := Max(FSourceLeft.Count, FSourceRight.Count);
  RightGrid.RowCount := LeftGrid.RowCount;
  DrawGrid.RowCount := LeftGrid.RowCount;
end;

procedure TCompareFrame.UpdateLeftRowActionExecute(Sender: TObject);
var
  i: Integer;
begin
  SaveLeftGridAction.Enabled := True;
  LeftGrid.Cells[1, LeftGrid.Row] := LeftEdit.Text;
  if LeftGrid.Cells[0, LeftGrid.Row] = '' then
    LeftGrid.Cells[0, LeftGrid.Row] := '+';

  FSourceLeft.Clear;
  for i := 0 to LeftGrid.RowCount - 1 do
  begin
    if LeftGrid.Cells[0, i] <> '' then
      FSourceLeft.Add(LeftGrid.Cells[1, i]);
  end;
  BuildHashListLeft;
  Compare;
  DrawGrid.Invalidate;

  UpdateLeftRowAction.Enabled := False;
  CancelLeftRowAction.Enabled := False;
end;

procedure TCompareFrame.UpdateRightRowActionExecute(Sender: TObject);
var
  i: Integer;
begin
  SaveRightGridAction.Enabled := True;
  RightGrid.Cells[1, RightGrid.Row] := RightEdit.Text;
  if RightGrid.Cells[0, RightGrid.Row] = '' then
    RightGrid.Cells[0, RightGrid.Row] := '+';

  FSourceRight.Clear;
  for i := 0 to RightGrid.RowCount - 1 do
  begin
    if RightGrid.Cells[0, i] <> '' then
      FSourceRight.Add(RightGrid.Cells[1, i]);
  end;
  BuildHashListRight;
  Compare;
  DrawGrid.Invalidate;

  UpdateRightRowAction.Enabled := False;
  CancelRightRowAction.Enabled := False;
end;

procedure TCompareFrame.FillLeftGridFromSource;
var
  i: Integer;
begin
  for i := 0 to 1 do
    LeftGrid.Cols[i].BeginUpdate;
  try
    for i := 0 to FSourceLeft.Count - 1 do
    begin
      LeftGrid.Cells[0, i] := IntToStr(i + 1);
      LeftGrid.Cells[1, i] := FSourceLeft[i];
    end;
  finally
    for i := 0 to 1 do
      LeftGrid.Cols[i].EndUpdate;
  end;
end;

procedure TCompareFrame.FillRightGridFromSource;
var
  i: Integer;
begin
  for i := 0 to 1 do
    RightGrid.Cols[i].BeginUpdate;
  try
    for i := 0 to FSourceRight.Count - 1 do
    begin
      RightGrid.Cells[0, i] := IntToStr(i + 1);
      RightGrid.Cells[1, i] := FSourceRight[i];
    end;
  finally
    for i := 0 to 1 do
      RightGrid.Cols[i].EndUpdate;
  end;
end;

procedure TCompareFrame.FindNextDifferenceActionExecute(Sender: TObject);
var
  Row: Integer;
begin
  if (FDiff.DiffStats.adds = 0) and
     (FDiff.DiffStats.deletes = 0) and
     (FDiff.DiffStats.modifies = 0)then
    Exit;
  Row := Min(LeftGrid.Row + 1, LeftGrid.RowCount - 1);
  while (Row < LeftGrid.RowCount - 1) and (FDiff.Compares[Row].Kind = ckNone) do
    Inc(Row);
  if FDiff.Compares[Row].Kind <> ckNone then
    ScrollGrids(Row, etMouse);
end;

procedure TCompareFrame.FrameResize(Sender: TObject);
begin
  LeftPanel.Width := ((Width - DrawBarPanel.Width) div 2);
  RightPanel.Width := LeftPanel.Width;
  if Width mod 2 <> 0 then
    RightPanel.Width := RightPanel.Width - 1;
 // FGridVisibleRows := LeftGrid.VisibleRowCount; // Round(LeftScrollBox.ClientHeight /
    //  LeftGrid.DefaultRowHeight);
  //FDrawGridVisibleRows := DrawGrid.VisibleRowCount; // Round
   // (DrawGrid.ClientHeight / DrawGrid.DefaultRowHeight);
  //SetGridVisibleRange(DrawGrid.Row);
  DrawGrid.Invalidate;
end;

procedure TCompareFrame.Compare;
var
  i: Integer;
begin
  if (FHashListLeft.Count = 0) or (FHashListRight.Count = 0) then
    Exit;
  FDiff.Clear;
  Screen.Cursor := crHourGlass;
  try
    FDiff.Execute(PInteger(FHashListLeft.List), PInteger(FHashListRight.List),
      FHashListLeft.Count, FHashListRight.Count);

    if FDiff.Cancelled then
      Exit;

    { fill ResultGrid with the differences }
    for i := 0 to 1 do
    begin
      LeftGrid.Cols[i].BeginUpdate;
      LeftGrid.Cols[i].Clear;
      RightGrid.Cols[i].BeginUpdate;
      RightGrid.Cols[i].Clear;
    end;
    try
      LeftGrid.RowCount := FDiff.Count;
      RightGrid.RowCount := FDiff.Count;
      for i := 0 to FDiff.Count - 1 do
        with FDiff.Compares[i] do
        begin
          if Kind <> ckAdd then
          begin
            LeftGrid.Cells[0, i] := IntToStr(oldIndex1 + 1);
            LeftGrid.Cells[1, i] := FSourceLeft[oldIndex1];
          end;
          if Kind <> ckDelete then
          begin
            RightGrid.Cells[0, i] := IntToStr(oldIndex2 + 1);
            RightGrid.Cells[1, i] := FSourceRight[oldIndex2];
          end;
        end;
    finally
      for i := 0 to 1 do
      begin
        LeftGrid.Cols[i].EndUpdate;
        RightGrid.Cols[i].EndUpdate;
      end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TCompareFrame.CopySelectionLeftActionExecute(Sender: TObject);
var
  i: Integer;
begin
  SaveLeftGridAction.Enabled := True;
  for i := RightGrid.Selection.bottom downto RightGrid.Selection.top do
  begin
    case FDiff.Compares[i].Kind of
      ckNone, ckModify:
        LeftGrid.Cells[1, i] := RightGrid.Cells[1, i];
      ckAdd:
      begin
        LeftGrid.Cells[0, i] := '+';
        LeftGrid.Cells[1, i] := RightGrid.Cells[1, i];
      end;
      ckDelete:
        LeftGrid.RemoveRow(i);
    end;
  end;
  FSourceLeft.Clear;
  for i := 0 to LeftGrid.RowCount - 1 do
  begin
    if LeftGrid.Cells[0, i] <> '' then
      FSourceLeft.Add(LeftGrid.Cells[1, i]);
  end;
  BuildHashListLeft;
  SetMaxCounts;
  Compare;
  AutoSizeCol(LeftGrid);
  LeftEdit.Text := LeftGrid.Cells[1, LeftGrid.Row];
  DrawGrid.Invalidate;
end;

procedure TCompareFrame.CopySelectionRightActionExecute(Sender: TObject);
var
  i: Integer;
begin
  SaveRightGridAction.Enabled := True;
  for i := LeftGrid.Selection.Bottom downto LeftGrid.Selection.Top do
  begin
    case FDiff.Compares[i].Kind of
      ckNone, ckModify:
        RightGrid.Cells[1, i] := LeftGrid.Cells[1, i];
      ckDelete:
      begin
        RightGrid.Cells[0, i] := '+';
        RightGrid.Cells[1, i] := LeftGrid.Cells[1, i];
      end;
      ckAdd:
        RightGrid.RemoveRow(i);
    end;
  end;
  FSourceRight.Clear;
  for i := 0 to RightGrid.RowCount - 1 do
  begin
    if RightGrid.Cells[0, i] <> '' then
      FSourceRight.Add(RightGrid.Cells[1, i]);
  end;
  BuildHashListRight;
  SetMaxCounts;
  Compare;
  AutoSizeCol(RightGrid);
  RightEdit.Text := RightGrid.Cells[1, RightGrid.Row];
  DrawGrid.Invalidate;
end;

procedure TCompareFrame.SetHistoryList(Value: TStringList);
begin
  LeftComboBox.Items := Value;
  RightComboBox.Items := Value;
end;

end.
