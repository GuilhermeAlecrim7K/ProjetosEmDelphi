unit UnitCalculos;

interface

function Somar(n1: extended; n2: extended): extended;
function Subtrair(n1: extended; n2: extended): extended;
function Multiplicar(n1: extended; n2: extended): extended;
function Dividir(n1: extended; n2: extended): extended;

implementation

function Somar(n1: extended; n2: extended): extended;
begin
  Result:= n1+n2;
end;

function Subtrair(n1: extended; n2: extended): extended;
begin
  Result:= n1-n2;
end;

function Multiplicar(n1: extended; n2: extended): extended;
begin
  Result:= n1*n2;
end;

function Dividir(n1: extended; n2: extended): extended;
begin
  Result:= n1/n2;
end;

end.
