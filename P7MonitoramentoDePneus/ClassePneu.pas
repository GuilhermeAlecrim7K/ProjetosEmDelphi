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
  FQtdVidas: integer;
  FKmRestante: integer;
  FLimiteRodagem: integer;
  FKmTotal: integer;
public
  constructor create;
  property IdPneu: string read FIdPneu;
  property KmRestanteVidaAtual: integer read FKmRestante;
  property LimiteRodagem: integer write FLimiteRodagem;
  function ReadQtdVidas: integer;
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

function TPneu.WriteQuilometragem(Km: integer; out msg: string): boolean;
const
  MSG_ERRO = 'Este pneu não pode ser mais recapeado e chegou ao fim de sua vida.';
begin
  inherited;
  FKmTotal:= FKmTotal + Km;
  if (FQuilometragem > FLimiteRodagem) then
    begin
      if (FQtdVidas>0) then
        begin
        FQtdVidas:= FQtdVidas -1;
        FQuilometragem:= 0;
        end
      else
        begin
        msg:= MSG_ERRO;
        FQuilometragem:= FQuilometragem - Km; //Desfazendo o procedimento herdado caso não haja mais vidas e FQuilometragem fique acima de 5000;
        FKmTotal:= FKmTotal - Km;
        Result:= False;
        end;
    end
  else
    FKmRestante:= FLimiteRodagem - FQuilometragem;
end;

end.
