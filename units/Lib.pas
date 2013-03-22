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
    Ln: LongWord;
    Ch: LongWord;
    TextCh: LongWord;
    Text: WideString;
    SearchString: WideString;
  end;

const
  IMAGEINDEX_RECORD = 54;
  IMAGEINDEX_PAUSE = 55;
  CAPTION_ERRORS = 'Errors';

  TSQLDialectStr: array[Low(TSQLDialect)..High(TSQLDialect)] of String =
    ('Standard', 'Interbase 6', 'MSSQL 7', 'MySQL', 'Oracle', 'Sybase', 'Ingres', 'MSSQL 2K', 'Postgres', 'Nexus');
  TCPASHighlighterStr: array[Low(TCPASHighlighter)..High(TCPASHighlighter)] of String =
    ('Classic', 'Default', 'Twilight');

implementation

end.
