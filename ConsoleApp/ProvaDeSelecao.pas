unit ProvaDeSelecao;

interface

uses
  SysUtils, StrUtils, Generics.Collections;

type

  TBoletim = record
    Name: string;
    Grade: double;
  end;

function Multiplos(AValue: integer = 7; ALimit: integer = 200): string;
function Order3(ValueA, ValueB, ValueC : integer): string;
function IsPalindrome( AString : string): Boolean;
function GetOlderDate(const DateA, DateB: string): string;
function GradeReport(var List: array of TBoletim): string;

implementation

function Multiplos(AValue: integer = 7; ALimit: integer = 200): string;
{
  1. Escreva um programa que imprima múltiplos de 7 menores que 200.
}
begin
  if AValue + 7 > ALimit then
    Result:= AValue.ToString
  else
    Result:= AValue.ToString + ';' + Multiplos(AValue + 7, ALimit)
end;

function Order3(ValueA, ValueB, ValueC : integer): string;
{
  2. Escreva um programa que lê 3 valores e os escreve em ordem crescente.
}
var temp: integer;
begin
  if ValueB < ValueA then
    begin
      Temp:= ValueA;
      ValueA:= ValueB;
      ValueB:= Temp;
    end;
  if ValueC < ValueA then
    begin
      Temp:= ValueA;
      ValueA:= ValueC;
      ValueC:= Temp;
    end;
  if ValueC < ValueB then
    begin
      Temp:= ValueC;
      ValueC:= ValueB;
      ValueB:= Temp;
    end;
  Result:= Format('%d;%d;%d', [ValueA, ValueB, ValueC]);
end;

function IsPalindrome(AString : string): Boolean;
{
 3. Dizemos que uma string qualquer é um palíndromo quando o inverso desta é igual a ela
    própria. Escreva uma função que recebe uma string e retorna se essa string é ou não um
    palíndromo.
}
var Str1, Str2: string;
c: char;
begin
  Str1:= '';
  Str2:= UpperCase(AString);
  for c in Str2 do
    if CharInSet(c, ['A'..'Z']) then
      Str1:= Str1 + c;
  Str2:= AnsiReverseString(Str1);
  if Str1 = Str2 then
    Result:= True
  else
    Result:= False;
end;

function GetOlderDate(const DateA, DateB: string): string;
{
  3. Escreva um programa que determina a data cronologicamente maior de duas datas
     fornecidas pelo usuário. Cada data deve ser fornecida como string no formato DDMMYYYY.
     Não é permitido usar variáveis do tipo Date ou Datetime neste programa.
}

var dayA, monthA, yearA: string;
var dayB, monthB, yearB: string;
begin
  dayA:= Copy(DateA, 1, 2);
  monthA:= Copy(DateA, 3, 2);
  yearA:= Copy(DateA, 5, 4);
  dayB:= Copy(DateB, 1, 2);
  monthB:= Copy(DateB, 3, 2);
  yearB:= Copy(DateB, 5, 4);
  if yearA = yearB then
    if monthA = monthB then
      if DayA = DayB then
        Result:= 'As Datas são iguais'
      else if DayA.ToInteger < DayB.ToInteger then
        Result:= DateA
      else
        Result:= DateB
    else if monthA.ToInteger < monthB.ToInteger then
      Result:= DateA
    else
      Result:= DateB
  else if yearA.ToInteger < yearB.ToInteger then
    Result:= DateA
  else
    Result:= DateB
end;

function GradeReport(var List: array of TBoletim): string;
{
  6. Faça uma rotina que lê um array de record de tamanho 10 contendo um caderno com o
     nome e a nota dos alunos (notas de 0 a 10). Em seguida leia o array e informe a nota média
     da turma e o nome dos alunos com melhor e pior notas.
}
var
  I, HighestGradeIndex, LowestGradeIndex: integer;
  HighestGrade, LowestGrade, Average: double;
begin
  HighestGrade:= 0; LowestGrade:= 10; Average:= 0;
  for I := Low(List) to High(List) do
    begin
      if List[I].Grade > HighestGrade then
        begin
          HighestGrade:= List[I].Grade;
          HighestGradeIndex:= I;
        end;
      if List[I].Grade < LowestGrade then
        begin
          LowestGrade:= List[I].Grade;
          LowestGradeIndex:= I;
        end;
      Average:= Average + List[I].Grade;
    end;
  Average:= Average/ (High(List) + 1);
  Result:= Average.ToString + ';' +
           List[HighestGradeIndex].Name + ';' +
           List[LowestGradeIndex].Name;
end;

end.
