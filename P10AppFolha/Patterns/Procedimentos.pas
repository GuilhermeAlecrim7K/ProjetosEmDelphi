unit Procedimentos;

interface

uses SysUtils;

function IsValidName(const AString: string): boolean;

implementation

function IsValidName(const AString: string): boolean;
var
  caracter: char;
  UpperCaseString: string;
begin
  UpperCaseString:= AnsiUpperCase(AString);
  Result:= True;
  for caracter in UpperCaseString do
    if caracter in ['A'..'Z'] then
    else
      begin
        Result:= False;
        break;
      end;
end;

end.
