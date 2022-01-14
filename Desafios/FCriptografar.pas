unit Criptografar;

interface

uses
  StrUtils, Classes, Variants, SysUtils;

function Criptografar (const Texto: string): string;

implementation

function Criptografar (const Texto: string): string;
var
  StrList: TStringList;
  TextoManipulado, temp: string;
  ColNumber, I, J: byte;
begin
  Result:= '';
  if Length(Texto) < 12 then
    raise Exception.Create('Digite um texto com um mínimo de 12 caracteres');
  StrList:= TStringList.Create;
  try
    StrList.Clear;
    TextoManipulado:= Texto;
    TextoManipulado:= TextoManipulado.Replace(' ', '@');
    while (Length(TextoManipulado) mod 8) <> 0 do
      TextoManipulado:= TextoManipulado + '@';
    ColNumber:= (Length(TextoManipulado)) div 8;
    temp:= TextoManipulado;
    for I := 1 to ColNumber do
      begin
        StrList.Add(LeftStr(TextoManipulado,8));
        Delete(TextoManipulado, 1, 8);
      end;
    for I := 1 to 8 do
      begin
        for J := 0 to ColNumber -1 do
          Result:= Result + StrList[J].Chars[I-1];
      end;
  finally
    StrList.Free;
  end;
end;