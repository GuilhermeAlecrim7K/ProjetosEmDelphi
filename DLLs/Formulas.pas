unit Formulas;

interface

  function JurosCompostos(C: currency; I: real; T: integer): currency; export; stdcall;
  function JurosSimples(C: currency; I: real; T: integer): currency; export; stdcall;
  function Pow(X: real; Y: integer): real; export; stdcall;


implementation

var
  j: integer;

function JurosCompostos(C: currency; I: real; T: integer): currency; export; stdcall;
    begin
      result:= C*pow(1+I, T);
    end;

function JurosSimples(C: currency; I: real; T: integer): currency; export; stdcall;
  begin
    Result := C*i*t;
  end;

function Pow(X: real; Y: integer): real; export; stdcall;
  begin
    result:= 1;
    for j := 1 to Y do
      result:= Result*Y;
  end;

end.
