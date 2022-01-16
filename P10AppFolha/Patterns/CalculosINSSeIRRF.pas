unit CalculosINSSeIRRF;

interface

uses Math;

type

  TFaixasINSSeIRRF = (Isento, Faixa1, Faixa2, Faixa3, Faixa4);

  INSS = record
    const Faixa1Limite       = 1212.00;
    const Faixa2Limite       = 2427.79;
    const Faixa3Limite       = 3641.69;
    const Faixa4Limite       = 7088.50;
    const AliquotaFaixa1     = 0.075  ;
    const AliquotaFaixa2     = 0.09   ;
    const AliquotaFaixa3     = 0.12   ;
    const AliquotaFaixa4     = 0.14   ;
  end;

  IRRF = record
    const FaixaIsencaoLimite = 1903.98;
    const Faixa1Limite       = 2826.65;
    const Faixa2Limite       = 3751.05;
    const Faixa3Limite       = 4664.68;
    const AliquotaFaixa1     = 0.075  ;
    const AliquotaFaixa2     = 0.15   ;
    const AliquotaFaixa3     = 0.225  ;
    const AliquotaFaixa4     = 0.275  ;
    const DeducaoFaixa1      = 142.80 ;
    const DeducaoFaixa2      = 354.80 ;
    const DeducaoFaixa3      = 636.13 ;
    const DeducaoFaixa4      = 869.36 ;
  end;

  function GetFaixaINSS (ASalarioBruto: currency): TFaixasINSSeIRRF;
  function CalcularINSS (ASalarioBruto: currency): currency;
  function GetFaixaIRRF (ASalarioBruto: currency): TFaixasINSSeIRRF;
  function CalcularIRRF (ASalarioBruto: currency): currency;

const
  SalarioMinimo = 1212.00;

implementation

function GetFaixaINSS (ASalarioBruto: currency): TFaixasINSSeIRRF;
begin
  if (ASalarioBruto <= INSS.Faixa1Limite) then
    Result:= Faixa1
  else if (ASalarioBruto <= INSS.Faixa2Limite) then
    Result:= Faixa2
  else if (ASalarioBruto <= INSS.Faixa3Limite) then
    Result:= Faixa3
  else
    Result:= Faixa4;
end;

function CalcularINSS (ASalarioBruto: currency): currency;
var
  FaixaINSS: TFaixasINSSeIRRF;
  CalculoBaseFaixa1, CalculoBaseFaixa2, CalculoBaseFaixa3, CalculoTetoContribuicao: currency;
begin
  CalculoBaseFaixa1:=       SimpleRoundTo(INSS.Faixa1Limite * INSS.AliquotaFaixa1, -2);
  CalculoBaseFaixa2:=       SimpleRoundTo(CalculoBaseFaixa1 + ((INSS.Faixa2Limite - INSS.Faixa1Limite) * INSS.AliquotaFaixa2), -2);
  CalculoBaseFaixa3:=       SimpleRoundTo(CalculoBaseFaixa2 + ((INSS.Faixa3Limite - INSS.Faixa2Limite) * INSS.AliquotaFaixa3), -2);
  CalculoTetoContribuicao:= SimpleRoundTo(CalculoBaseFaixa3 + ((INSS.Faixa4Limite - INSS.Faixa3Limite) * INSS.AliquotaFaixa4), -2);

  FaixaINSS:= GetFaixaINSS(ASalarioBruto);
  case FaixaINSS of
    Isento: ;
    Faixa1: Result:= ASalarioBruto * INSS.AliquotaFaixa1;
    Faixa2: Result:= CalculoBaseFaixa1 + ((ASalarioBruto - INSS.Faixa1Limite) * INSS.AliquotaFaixa2);
    Faixa3: Result:= CalculoBaseFaixa2 + ((ASalarioBruto - INSS.Faixa2Limite) * INSS.AliquotaFaixa3);
    Faixa4:
      begin
        if (ASalarioBruto > INSS.Faixa4Limite) then
          Result:= CalculoTetoContribuicao
        else
          Result:= CalculoBaseFaixa3 + ((ASalarioBruto - INSS.Faixa3Limite) * INSS.AliquotaFaixa4);
      end;
  end;
  Result:= SimpleRoundTo(Result, -2)
end;

function GetFaixaIRRF (ASalarioBruto: currency): TFaixasINSSeIRRF;
begin
  if (ASalarioBruto <= IRRF.FaixaIsencaoLimite) then
    Result:= Isento
  else if (ASalarioBruto <= IRRF.Faixa1Limite) then
    Result:= Faixa1
  else if (ASalarioBruto <= IRRF.Faixa2Limite) then
    Result:= Faixa2
  else if (ASalarioBruto <= IRRF.Faixa3Limite) then
    Result:= Faixa3
  else
    Result:= Faixa4;
end;

function CalcularIRRF (ASalarioBruto: currency): currency;
var
  FaixaIRRF: TFaixasINSSeIRRF;
  ASalarioBase: currency;
begin
  ASalarioBase:= ASalarioBruto - CalcularINSS(ASalarioBruto);
  FaixaIRRF:= GetFaixaIRRF(ASalarioBase);
  case FaixaIRRF of
    Isento: Result:= 0;
    Faixa1: Result:= ASalarioBase * IRRF.AliquotaFaixa1 - IRRF.DeducaoFaixa1;
    Faixa2: Result:= ASalarioBase * IRRF.AliquotaFaixa2 - IRRF.DeducaoFaixa2;
    Faixa3: Result:= ASalarioBase * IRRF.AliquotaFaixa3 - IRRF.DeducaoFaixa3;
    Faixa4: Result:= ASalarioBase * IRRF.AliquotaFaixa4 - IRRF.DeducaoFaixa4;
  end;
  Result:= SimpleRoundTo(Result, -2)
end;

end.
