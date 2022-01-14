unit UnitSaque;

interface

uses
  Generics.Collections, SysUtils;

{Desenvolva uma função que receba um valor para saque e devolva
as notas. Notas disponíveis: 2, 5, 10, 20, 50 e 100.
O valor deve ser maior que 2 e diferente de 3.

Assinatura do método:
function Sacar(Valor: Integer): string;

Entrada:
257.00

Saída:
100,100,50,5,2}

function Sacar (Valor: integer): string;

implementation

function Sacar (Valor: integer): string;
var
  NotasSaque, ConjuntoCedulas: TList<integer>;
  ValorStr: string;
  LastDigit: char;
  CedulasIndisponiveis: set of 0..9;
  ValorCopy, QtdeNotas: integer;
  Cedula, I: integer;
begin
  Result:='';
  if Valor < 4 then
    begin
      Result:= 'Limite mínimo para saque: R$ 4,00';
      Exit;
    end;
  NotasSaque:= TList<Integer>.Create;
  ConjuntoCedulas:= TList<Integer>.Create;
  try
    ConjuntoCedulas.AddRange([100, 50, 20, 10, 5, 2]);
    CedulasIndisponiveis:= [1,3,6,8];
    ValorCopy:= Valor;
    ValorStr:= ValorCopy.ToString;
    LastDigit:= ValorStr[High(ValorStr)];

    if StrToInt(LastDigit) in CedulasIndisponiveis then
      begin
        ValorCopy:= ValorCopy - 6;
        NotasSaque.AddRange([2, 2, 2]);
      end;

    for Cedula in ConjuntoCedulas do
      begin
        while (ValorCopy div Cedula > 0) do
          begin
            QtdeNotas:= ValorCopy div Cedula;
            for I := 1 to QtdeNotas do
              NotasSaque.Add(Cedula);
            ValorCopy:= ValorCopy - Cedula * QtdeNotas;
          end;
        if ValorCopy = 0 then
          break;
      end;
    NotasSaque.Sort;
    NotasSaque.Reverse;
    for Cedula in NotasSaque do
      Result:= Result + IntToStr(Cedula) + ',';
    Delete(Result, High(Result), 1);
  finally
    NotasSaque.Free;
    ConjuntoCedulas.Free;
  end;
end;

end.

