unit EditBone.Types;

interface

type
  TBCCase = (cNone=-1, cUpper=0, cLower=1, cAlternating=2, cSentence=3, cTitle=4, cOriginal=5);

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
