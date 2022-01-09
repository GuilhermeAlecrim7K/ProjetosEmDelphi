unit ClassePneu;

interface

type
TVidaPneu = class
private
  FQuilometragem: integer;
public
  constructor Create;
  function ReadQuilometragem : integer; virtual;
  function WriteQuilometragem(Km: integer; out msg: string): boolean; virtual;
end;

TPneu = class (TVidaPneu)
private
  FIdPneu: string;
  FLimiteRodagem: integer;
  FQtdVidas: integer;
  FKmRestante: integer;
	FVidasPneu: array of TVidaPneu;
public
  constructor create;
	destructor Destroy; override;
  function ReadNumVidaAtual: integer;
	procedure AddVida;
  function KmRestanteVidaAtual: integer;
  function KmTotalPercorrido: integer;
  function ReadQuilometragem : integer; override;
  function WriteQuilometragem(Km: integer; out msg: string): boolean; override;
  property IdPneu: string read FIdPneu;
  property LimiteRodagem: integer read FLimiteRodagem write FLimiteRodagem;
end;

implementation

uses SysUtils;

{ TVidaPneu }

constructor TVidaPneu.Create;
begin
  FQuilometragem:= 0;
end;

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
  FIdPneu:= Format('%.8d', [Random(99999999)]);
  FQtdVidas:= 5;
  FLimiteRodagem:= 5000;
	SetLength(FVidasPneu, 1);
	FVidasPneu[0]:= TVidaPneu.Create;
end;

destructor TPneu.destroy;
var
  I: integer;
begin
	for I:= 0 to (length(FVidasPneu)-1) do
		FreeAndNil(FVidasPneu[I]);
end;

function TPneu.ReadNumVidaAtual: integer;
begin
  Result:= length(FVidasPneu);
end;

function TPneu.ReadQuilometragem: integer;
begin
  Result:= FVidasPneu[ReadNumVidaAtual - 1].ReadQuilometragem;
end;

procedure TPneu.AddVida;
begin
	If ReadNumVidaAtual <= FQtdVidas then
	begin
		SetLength(FVidasPneu, ReadNumVidaAtual +1);
		FVidasPneu[ReadNumVidaAtual - 1]:= TVidaPneu.Create;
	end;
end;

function TPneu.KmRestanteVidaAtual: integer;
begin
  FKmRestante:= FLimiteRodagem - FQuilometragem;
  Result:= FKmRestante;
end;

function TPneu.KmTotalPercorrido: integer;
var
  I: integer;
  KmTotal: integer;
begin
  KmTotal:= 0;
  for I:= 0 to ReadNumVidaAtual-1 do
    KmTotal:= KmTotal + FVidasPneu[I].FQuilometragem;
  Result:= KmTotal;
end;

function TPneu.WriteQuilometragem(Km: integer; out msg: string): boolean;
begin
  FVidasPneu[ReadNumVidaAtual-1].WriteQuilometragem(Km, msg);
  Result:= True;
  if (FVidasPneu[ReadNumVidaAtual-1].FQuilometragem >= FLimiteRodagem) then
    begin
      if (ReadNumVidaAtual <= FQtdVidas) then
        begin
				AddVida;
        end
      else
        begin
        msg:= Format('Este pneu não pode ser mais recapeado e chegou ao fim de sua vida. Sua vida útil já foi ultrapassada em %d km. Trocar imediatamente', [FVidasPneu[ReadNumVidaAtual-1].ReadQuilometragem - FLimiteRodagem]);;
        Result:= False;
        end;
    end
end;

end.

