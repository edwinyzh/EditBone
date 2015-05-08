unit EditBone.Types;

interface

type
  TOutputRec = packed record
    Level: Byte;
    Filename: string;
    Ln: LongInt;
    Ch: LongInt;
    TextCh: LongWord;
    Text: WideString;
    SearchString: WideString;
  end;
  POutputRec = ^TOutputRec;

implementation

end.
