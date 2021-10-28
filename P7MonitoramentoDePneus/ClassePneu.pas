unit ClassePneu;

interface

type
TVidaPneu = class
private
  FQuilometragem: integer;
public
  function ReadQuilometragem : integer;
  function WriteQuilometragem(Km: integer; out msg: string): boolean; virtual;
end;

TPneu = class (TVidaPneu)
private
  FIdPneu: string;
  FLimiteRodagem: integer;
  FQtdVidas: integer;
  FKmRestante: integer;
  FKmTotal: integer;
public
  constructor create;
  property IdPneu: string read FIdPneu;
  property LimiteRodagem: integer read FLimiteRodagem write FLimiteRodagem;
  function ReadQtdVidas: integer;
  function KmRestanteVidaAtual: integer;
  function KmTotalPercorrido: integer;
  function WriteQuilometragem(Km: integer; out msg: string): boolean; override;

end;

implementation

uses SysUtils;

{ TVidaPneu }

function TVidaPneu.ReadQuilometragem: integer;
begin
  Result:= FQuilometragem;
end;

function TVidaPneu.WriteQuilometragem(Km: integer; out msg: string): boolean;
begin
  FQuilometragem := FQuilometragem + Km;
  Result:= True;
end;

{ TPneu }

constructor TPneu.create;
begin
  FIdPneu:= IntToStr(Random(99999999));
  FQtdVidas:= 5;
  FLimiteRodagem:= 5000;
  FKmTotal:= 0;
end;

function TPneu.ReadQtdVidas: integer;
begin
  Result:= FQtdVidas;
end;

function TPneu.KmRestanteVidaAtual: integer;
begin
  FKmRestante:= FLimiteRodagem - FQuilometragem;
  Result:= FKmRestante;
end;

function TPneu.KmTotalPercorrido: integer;
begin
  Result:= FKmTotal;
end;

function TPneu.WriteQuilometragem(Km: integer; out msg: string): boolean;
const
  MSG_ERRO = 'Este pneu não pode ser mais recapeado e chegou ao fim de sua vida.';
begin
  inherited;
  FKmTotal:= FKmTotal + Km;
  if (FQuilometragem >= FLimiteRodagem) then
    begin
      if (FQtdVidas>0) then
        begin
        FQtdVidas:= FQtdVidas -1;
        FQuilometragem:= 0;
        Result:= True;
        end
      else
        begin
        msg:= MSG_ERRO;
        FQuilometragem:= FQuilometragem - Km; //Desfazendo o procedimento herdado caso não haja mais vidas e FQuilometragem fique acima de 5000;
        FKmTotal:= FKmTotal - Km;
        Result:= False;
        end;
    end
end;

end.
