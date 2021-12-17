unit Arrays;

interface

uses
  System.SysUtils;

procedure ArraysFixos;
procedure Matrizes;
procedure ArrayDinamico;

implementation

procedure ArraysFixos;
var
  Index, I: byte;
  Array1: array [0..3] of integer;  //array de tamanho 4
  Array2: array [10..20] of string; //array de tamanho 11
begin
  I:= 1;
  for Index := Low(Array2) to High(Array2) do
    begin
      Array2[Index]:= Format('Posição[%d]= ', [Index]) + IntToStr(I);
      I:= I + 1;
    end;
end;

procedure Matrizes;
var
  Matriz1: array [0..4, 0..4] of byte;
  cl, ln: byte;
begin
  for cl := Low(Matriz1) to High(Matriz1) do
    for ln := Low(Matriz1[cl]) to High(Matriz1[cl]) do
      Matriz1[cl][ln]:= ln;
end;

procedure ArrayDinamico;
var
  Array1: array of byte;
  Matriz1: array of array of string;
  Index: byte;
begin
  SetLength(Array1, 10); //Setando o tamanho do array para 10 (0-9)
  for Index := Low(Array1) to High(Array1) do
    Array1[Index]:= Random(255);

  SetLength(Matriz1, 5); //Setando 5 "colunas"
  for Index := Low(Matriz1) to High(Matriz1) do
    SetLength(Matriz1[Index], random(5)); // para cada coluna setando um tamanho randômico para a linha correspondente
end;
end.
