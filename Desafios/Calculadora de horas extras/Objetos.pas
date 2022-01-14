unit Objetos;

interface

uses
  Generics.Collections, Generics.Defaults, DateUtils;

type

  EConclusion = (NewEmployeeCreated, NewRegisterCreated, RegisterUpdated, RegisterUpdatedWithHoliday, OvertimeExceeded);
  EDiasDaSemana = (Segunda=1, Terca, Quarta, Quinta, Sexta, Sabado, Domingo);

  RRegistroHoras = record
    Data: TDateTime;
    QtdeHoras: byte;
    IsFeriadoOrDomingo: boolean;
  end;

  TFuncionario = class
  private
    FCodigo: integer;
    FRegistroDeHoras: array of RRegistroHoras;
    FNumRegistros: integer;
    function BuscaRegistroHora(AData: TDateTime): integer;
  public
    constructor Create(ACodigo: integer; ARegistro: RRegistroHoras);
    destructor Destroy; override;
    property Codigo: integer read FCodigo;
    function RegistrarHoraExtra(ARegistro: RRegistroHoras): EConclusion;
  end;

  TListaFuncionarios = TObjectList<TFuncionario>;

  function BuscaFuncionario (ACodigo: integer; ListaFuncionarios: TListaFuncionarios): integer;
  function CriaRegistroFuncionario (ACodigo: integer; ARegistro: RRegistroHoras; ListaFuncionarios: TListaFuncionarios): EConclusion;
  function GerarRelatorio(AFuncionario: TFuncionario; out AMsg: string): currency;

const
  ValorHoraExtra = 20;
  ValorAcrescimoRegular = 1.5;
  ValorAcrescimoFeriadoOuDomingo = 2.0;
  NotFound = -1;

implementation

function BuscaFuncionario (ACodigo: integer; ListaFuncionarios: TListaFuncionarios): integer;
var
  Low, Middle, High: integer;
begin
  Result:= NotFound;
  if ListaFuncionarios.Count < 1 then
    Exit;
  Low:= 0; High:= ListaFuncionarios.Count;
  while Low<=High do
    begin
      middle:= (Low+High) div 2;
      if ListaFuncionarios[Middle].Codigo = ACodigo then
        begin
          Result:= middle;
          Exit;
        end
      else if ListaFuncionarios[Middle].Codigo < ACodigo then
        Low:= middle +1
      else
        High:= middle -1;
    end;
end;

function CriaRegistroFuncionario (ACodigo: integer; ARegistro: RRegistroHoras; ListaFuncionarios: TListaFuncionarios): EConclusion;
var
  ResultadoBusca: integer;
begin
  ResultadoBusca:= BuscaFuncionario (ACodigo, ListaFuncionarios);
  if ResultadoBusca = NotFound then
    begin
      ListaFuncionarios.Add(TFuncionario.Create(ACodigo, ARegistro));
      Result:= NewEmployeeCreated;
      Exit;
    end
  else
    begin
      Result:= ListaFuncionarios[ResultadoBusca].RegistrarHoraExtra(ARegistro);
    end;

end;

{ TFuncionario }

constructor TFuncionario.Create(ACodigo: integer;
  ARegistro: RRegistroHoras);
begin
  FCodigo:= ACodigo;
  RegistrarHoraExtra(ARegistro);
end;

function TFuncionario.BuscaRegistroHora(AData: TDateTime): integer;
var
  Low, Middle, High: integer;
begin
  Result:= NotFound;
  if FNumRegistros < 1 then
    Exit
  else
    begin
      Low:= 0; High:= FNumRegistros -1;
      while Low <= High do
        begin
          Middle:= (Low + High) div 2;
          if FRegistroDeHoras[Middle].Data = AData then
            begin
              Result:= Middle;
              break;
            end
          else if FRegistroDeHoras[Middle].Data < AData then
            Low:= Middle +1
          else
            High:= Middle -1;
        end;
    end;
end;

destructor TFuncionario.Destroy;
begin
  inherited;
  SetLength(FRegistroDeHoras, 0);
end;

function TFuncionario.RegistrarHoraExtra(ARegistro: RRegistroHoras): EConclusion;
var
  ResultadoBusca: integer;
  I: integer;
begin
  ResultadoBusca:= BuscaRegistroHora(ARegistro.Data);
  if ResultadoBusca = NotFound then
    begin
      I:= FNumRegistros;
      Inc(FNumRegistros);
      SetLength(FRegistroDeHoras, FNumRegistros);
      while (FRegistroDeHoras[I].Data > ARegistro.Data) and (I >= 0) do
        begin
          FRegistroDeHoras[I].Data:= FRegistroDeHoras[I-1].Data;
          Inc(I, -1);
        end;
        FRegistroDeHoras[I]:= ARegistro;
        Result:= NewRegisterCreated
    end
  else
    begin
      if (FRegistroDeHoras[ResultadoBusca].QtdeHoras + ARegistro.QtdeHoras < 5) then
        begin
          if (FRegistroDeHoras[ResultadoBusca].IsFeriadoOrDomingo = ARegistro.IsFeriadoOrDomingo) then
            begin
            FRegistroDeHoras[ResultadoBusca].QtdeHoras := FRegistroDeHoras[ResultadoBusca].QtdeHoras + ARegistro.QtdeHoras;
            Result:= RegisterUpdated;
            Exit;
            end
          else
            begin
              FRegistroDeHoras[ResultadoBusca].QtdeHoras := FRegistroDeHoras[ResultadoBusca].QtdeHoras + ARegistro.QtdeHoras;
              Result:= RegisterUpdatedWithHoliday;
              Exit;
            end;
        end
      else
        begin
          Result:= OvertimeExceeded;
        end;
    end;
end;

function GerarRelatorio(AFuncionario: TFuncionario; out AMsg: string): currency;
var
  vRegistro: RRegistroHoras;
  vValor: currency;
begin
  Result:= 0;
  for vRegistro in AFuncionario.FRegistroDeHoras do
    begin
      if vRegistro.IsFeriadoOrDomingo or (DayOfTheWeek(vRegistro.Data) = Ord(Domingo)) then
        vValor:= ValorHoraExtra * ValorAcrescimoFeriadoOuDomingo
      else
        vValor:= ValorHoraExtra * ValorAcrescimoRegular;
      Result := Result + vRegistro.QtdeHoras * vValor;
    end;
  AMsg:= 'Funcionário: %d'+ Chr(13) + Chr(10) +'Valor total a ser pago: %m'+ Chr(13) + Chr(10);
end;

end.
