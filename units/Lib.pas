unit Lib;

interface

uses
  SynHighlighterSQL, Vcl.ActnMenus;

type
  TCPASHighlighter = (hClassic, hDefault, hTwilight);

  POutputRec = ^TOutputRec;
  TOutputRec = packed record
    Level: Byte;
    Filename: string;
    Ln: LongInt;
    Ch: LongInt;
    TextCh: LongWord;
    Text: WideString;
    SearchString: WideString;
  end;

const
  TSQLDialectStr: array[Low(TSQLDialect)..High(TSQLDialect)] of String =
    ('Standard', 'Interbase 6', 'MSSQL 7', 'MySQL', 'Oracle', 'Sybase', 'Ingres', 'MSSQL 2K', 'Postgres', 'Nexus');
  HKEY_DOS_DEVICES = '\SYSTEM\CurrentControlSet\Control\Session Manager\DOS Devices';

implementation

end.
