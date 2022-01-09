unit UnitCalculaIRRF;

interface

uses Math;

function CalculaIRRF (SalarioBase: Currency): Currency;

type
  EFaixaSalario = (Isento, Faixa1, Faixa2, Faixa3, Faixa4);

const
  LimiteIsencao =  1903.98;
  LimiteFaixa1 = 2826.65;
  LimiteFaixa2 = 3751.05;
  LimiteFaixa3 = 4664.68;

  DeducaoFaixa1 = 142.80;
  DeducaoFaixa2 = 354.80;
  DeducaoFaixa3 = 636.13;
  DeducaoFaixa4 = 869.36;

  PorcentagemFaixa1 = 0.075;
  PorcentagemFaixa2 = 0.15;
  PorcentagemFaixa3 = 0.225;
  PorcentagemFaixa4 = 0.275;

implementation

function CalculaIRRF (SalarioBase: Currency): Currency;
var
  FaixaSalario: EFaixaSalario;

begin
  if (SalarioBase <= LimiteIsencao) then
    FaixaSalario:= Isento
  else if (SalarioBase <= LimiteFaixa1) then
    FaixaSalario:= Faixa1
  else if (SalarioBase <= LimiteFaixa2) then
    FaixaSalario:= Faixa2
  else if (SalarioBase <= LimiteFaixa3) then
    FaixaSalario:= Faixa3
  else
    FaixaSalario:= Faixa4;

  case FaixaSalario of
    Isento:
      Result:= 0;
    Faixa1:
      Result:= SalarioBase * PorcentagemFaixa1 - DeducaoFaixa1;
    Faixa2:
      Result:= SalarioBase * PorcentagemFaixa2 - DeducaoFaixa2;
    Faixa3:
      Result:= SalarioBase * PorcentagemFaixa3 - DeducaoFaixa3;
    Faixa4:
      Result:= SalarioBase * PorcentagemFaixa4 - DeducaoFaixa4;
  end;

  Result:= SimpleRoundTo(Result, -2);

end;

end.
