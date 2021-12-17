unit Variaveis;

interface

//Declarando vari�veis que podem ser visualizadas em outras units
var
  GsString: string;

implementation
var
  {Inteiros e ordinais}
  LBoolean:  Boolean;        // True e False
  LShorInt:  ShortInt;       // Signed (8 bits) (-128 to 127)
  LByte:     Byte;           // Unsigned (8 bits) (0 to 255)
  LSmallInt: SmallInt;       // Signed (16 bits) (-32767 to 32768)
  LWord:     Word;           // Usigned (16 bits) (0 to 65535)
  LInteger:  Integer;        // Signed variable (32 bits) (-2.147.483.648 to 2.147.483.647)
  LCardinal: Cardinal;       // Unsigned variable (32 bits) (0 to 4.294.967.295)
  LLongInt:  LongInt;        // Signed fixed (32 bits) (-2.147.483.648 to 2.147.483.647)
  LLongWord: LongWord;       // Unsigned fixed (32 bits) (0 to 4.294.967.295)
  LInt64:    Int64;          // Signed fixed 64 bits (-9.223.372.036.854.775.808 to 9.223.372.036.854.775.807)

  {Ponto flutuante}

  LSingle:   Single;         // Aplica��o m�nima, 7 d�gitos (32 bits), Maior performance e menor capacidade/precis�o e uso de mem�ria.
  LCurrency: Currency;       // Aplica��es financeiras, 4 casas, Arredonda �ltima casa a depender do valor da casa seguinte
  LDouble:   Double;         // Aplica��o geral, 15 d�gitos, equilibra capacidade/precis�o e performance/mem�ria
  LExtended: Extended;       // Aplica��o focada em precis�o, 19 d�gitos, Maior capacidade/precis�o e menor performance e maior uso de mem�ria

  //A fun��o Max em tipos de ponto flutuante retorna INF (Infinity)

  {Strings e char}

  LAnsiChar:    AnsiChar;    // Fixed (8 bits)
  LAnsiString:  AnsiString;  // Sequ�ncias de AnsiChars (tamanho vari�vel, limitado apenas pela mem�ria)
  LChar:        Char;        // Vari�vel (Pode ocupar mais que 8 bits)
  LShortString: ShortString; // Fixed Sequ�ncias de caracteres (255)
  LString:      String;      // Tratada como AnsiString by default, tratada como ShortString se a diretiva $LongStrings estiver marcada para Off. Por padr�o vem marcada como ON.
  LFixedString: String[10];  // String fixada a 10 caracteres
  LWideChar:    WideChar;    // Fixed (16 bits) Caracter �nico que suporta sets internacionais
  LWideString:  WideString;  // Sequ�ncias de WideChars

  // O primeiro campo de strings � [1].

  {Ponteiros}
  P01:         PAnsiChar;
  P02:         PAnsiString;
  P03:         PChar;
  P04:         PCurrency;
  P05:         PDateTime;
  P06:         PExtended;
  P07:         PInt64;
  P08:         Pointer;      //Uso geral
  P09:         PShortString;
  P10:         PString;
  P11:         PVariant;
  P12:         PWideChar;
  P13:         PWideString;

end.
