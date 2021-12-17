unit Variaveis;

interface

//Declarando variáveis que podem ser visualizadas em outras units
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

  LSingle:   Single;         // Aplicação mínima, 7 dígitos (32 bits), Maior performance e menor capacidade/precisão e uso de memória.
  LCurrency: Currency;       // Aplicações financeiras, 4 casas, Arredonda última casa a depender do valor da casa seguinte
  LDouble:   Double;         // Aplicação geral, 15 dígitos, equilibra capacidade/precisão e performance/memória
  LExtended: Extended;       // Aplicação focada em precisão, 19 dígitos, Maior capacidade/precisão e menor performance e maior uso de memória

  //A função Max em tipos de ponto flutuante retorna INF (Infinity)

  {Strings e char}

  LAnsiChar:    AnsiChar;    // Fixed (8 bits)
  LAnsiString:  AnsiString;  // Sequências de AnsiChars (tamanho variável, limitado apenas pela memória)
  LChar:        Char;        // Variável (Pode ocupar mais que 8 bits)
  LShortString: ShortString; // Fixed Sequências de caracteres (255)
  LString:      String;      // Tratada como AnsiString by default, tratada como ShortString se a diretiva $LongStrings estiver marcada para Off. Por padrão vem marcada como ON.
  LFixedString: String[10];  // String fixada a 10 caracteres
  LWideChar:    WideChar;    // Fixed (16 bits) Caracter único que suporta sets internacionais
  LWideString:  WideString;  // Sequências de WideChars

  // O primeiro campo de strings é [1].

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
