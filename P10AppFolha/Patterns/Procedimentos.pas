unit Procedimentos;

interface

uses SysUtils;

//criar classes para rodar essas validações

function IsValidName(const AString: string): boolean;
function ValidarCamposCadastroCargo(const ACodigo, ATituloCargo: string; ASalarioBase: currency; ErrorIndex: byte; out EMessage: string): boolean;

const
  E_FIELD_IS_EMPTY      = 'Este campo não pode ficar vazio';
  E_TITLE_IS_NOT_VALID  = 'Caracteres especiais e números não permitidos neste campo';
  E_QUANTIA_INVALIDA    = 'Quantia Inválida';

implementation

function IsValidName(const AString: string): boolean;
var
  caracter: char;
  UpperCaseString: string;
begin
  if Trim(AString) <> '' then
    begin
      UpperCaseString:= AnsiUpperCase(AString);
      Result:= True;
      for caracter in UpperCaseString do
        if caracter in ['A'..'Z', ' '] then
        else
          begin
            Result:= False;
            break;
          end;
    end
  else
    Result:= False;
end;

function ValidarCamposCadastroCargo(const ACodigo, ATituloCargo: string; ASalarioBase: currency; ErrorIndex: byte; out EMessage: string): boolean;
begin
  Result:= True;
  while True do
    begin
      if Trim(ACodigo) = '' then
        begin
          ErrorIndex:= 1;
          EMessage:= E_FIELD_IS_EMPTY;
          Result:= False;
          break;
        end;
      if not IsValidName(ATituloCargo) then
        begin
          if (Trim(ATituloCargo) = '') then
            EMessage:= E_FIELD_IS_EMPTY
          else
            EMessage:= E_TITLE_IS_NOT_VALID;
          ErrorIndex:= 2;
          Result:= False;
          break;
        end;
      if (ASalarioBase < 0) or (ASalarioBase > 999999) then
        begin
          ErrorIndex:= 3;
          EMessage:= E_QUANTIA_INVALIDA;
          Result:= False;
          break;
        end;
      break;
    end;
end;

end.
