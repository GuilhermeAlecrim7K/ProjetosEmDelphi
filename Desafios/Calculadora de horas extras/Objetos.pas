unit Objetos;

interface

uses
  Generics.Collections, Generics.Defaults, DateUtils, SysUtils, Classes;

type

  TConclusionReport = (NewEmployeeCreated, NewRegisterCreated, RegisterUpdated, RegisterUpdatedWithHoliday, OvertimeExceeded);
  TDiasDaSemana = (Segunda=1, Terca, Quarta, Quinta, Sexta, Sabado, Domingo);

  TRegistroHorasExtras = class
  public
    const VALOR_HORA_EXTRA = 20;
    const VALOR_ACRESCIMO_REGULAR = 1.5;
    const VALOR_ACRESCIMO_DIA_NAO_UTIL = 2.0;
    const CARGA_EXTRA_DIARIA_MAXIMA = 5;
    {$SCOPEDENUMS ON}
    type TDia = (Util, Feriado, Domingo = 7);
    {$SCOPEDENUMS OFF}
  strict private
    FData: TDateTime;
    FQtdeHoras: byte;
    FTipoDia: TDia;
    procedure UpdateRegistro (ARegistro: TRegistroHorasExtras);
  private
    property Update: TRegistroHorasExtras write UpdateRegistro;
  public
    property Data: TDateTime read FData;
    property QtdeHoras: byte read FQtdeHoras;
    property Dia: TDia read FTipoDia;
    constructor Create (AData: TDateTime; AQtdeHoras: byte; AIsFeriado: boolean);
    function GetValorDoDia: currency;
  end;

  TListaRegistroHorasExtras = class
  strict private
    FLista: TObjectList<TRegistroHorasExtras>;
    function Buscar(AData: TDateTime): integer;
  public
    constructor Create;
    destructor Destroy; override;
    property Lista: TObjectList<TRegistroHorasExtras> read FLista;
    function CriarNovoRegistro(ARegistro: TRegistroHorasExtras): TConclusionReport;
    procedure GerarRelatorioIndividual(AMsg: TStringList);
    function GetValorTotal: currency;
  end;

  TFuncionario = class
  strict private
    FCodigo: integer;
    FRegistrosHorasExtras: TListaRegistroHorasExtras;
  public
    constructor Create(ACodigo: integer; ARegistro: TRegistroHorasExtras);
    destructor Destroy; override;
    property Codigo: integer read FCodigo;
    property RegistrosHorasExtras: TListaRegistroHorasExtras read FRegistrosHorasExtras;
  end;

  TListaFuncionarios = class sealed
  strict private
    FLista: TObjectList<TFuncionario>;
  public
    constructor Create;
    destructor Destroy; override;
    property Lista: TObjectList<TFuncionario> read FLista;
    function BuscaFuncionario (ACodigo: integer): integer;
    function CriaRegistroFuncionario (AFuncionario: TFuncionario): TConclusionReport;
    procedure GerarRelatorioLista (out AMsg: TStringList);
  end;

  {EConclusionMessage: array [EConclusion] of string = (
    'Novo registro criado''#13''#10''Código do funcionário: %6.d',
    'Novo registro criado para o funcionário de código %d',
    'Registro do funcionário do dia atualizado para %d horas',
    'Registro do funcionário do dia atualizado para %d horas''#13''#10''Obs: Alterado de %s', // Data útil ou Feriado
    'Não foi possível atualizar o registro. O funcionário já possui %d horas registradas nesta data. Limite: 5 horas');
   }
implementation

const
  NotFound = -1;

{ TRegistroHoras }

constructor TRegistroHorasExtras.Create(AData: TDateTime; AQtdeHoras: byte; AIsFeriado: boolean);
begin
  if (AQtdeHoras < CARGA_EXTRA_DIARIA_MAXIMA) then
    begin
      FData:= AData;
      FQtdeHoras:= AQtdeHoras;
      if (DayofTheWeek(FData) = Integer(Domingo)) then
        FTipoDia:= TDia.Domingo
      else if AIsFeriado then
        FTipoDia:= TDia.Feriado
      else
        FTipoDia:= TDia.Util;
    end
  else
    raise Exception.Create(Format('A carga máxima diária não pode ser maior que %d', [CARGA_EXTRA_DIARIA_MAXIMA]));
end;

function TRegistroHorasExtras.GetValorDoDia: currency;
begin
  if (FTipoDia = TDia.Util) then
    Result:= FQtdeHoras * VALOR_HORA_EXTRA * VALOR_ACRESCIMO_REGULAR
  else
    Result:= FQtdeHoras * VALOR_HORA_EXTRA * VALOR_ACRESCIMO_DIA_NAO_UTIL;
end;

procedure TRegistroHorasExtras.UpdateRegistro (ARegistro: TRegistroHorasExtras);
begin
  FQtdeHoras:= QtdeHoras + ARegistro.QtdeHoras;
  FTipoDia:= ARegistro.Dia;
end;

{ TListaRegistroHoras }

function TListaRegistroHorasExtras.Buscar(AData: TDateTime): integer;
var
  Low, Middle, High: integer;
begin
  Result:= NotFound;
  if (FLista <> nil) and (FLista.Count > 1) then
    begin
      Low:= 0; High:= FLista.Count -1;
      while Low <= High do
        begin
          Middle:= (Low + High) div 2;
          if FLista[Middle].Data = AData then
            begin
              Result:= Middle;
              break;
            end
          else if FLista[Middle].Data > AData then
            High:= Middle -1
          else
            Low:= Middle +1;
        end;
    end;
end;

constructor TListaRegistroHorasExtras.Create;
begin
  FLista:= nil;
  FLista:= TObjectList<TRegistroHorasExtras>.Create;
end;

function TListaRegistroHorasExtras.CriarNovoRegistro(ARegistro: TRegistroHorasExtras): TConclusionReport;
var
  ResultadoBusca: integer;
  I: integer;
begin
  ResultadoBusca:= Buscar(ARegistro.Data);
  if ResultadoBusca = NotFound then
    begin
      FLista.Add(ARegistro);
      I:= FLista.Count -2;
      while (I>0) and (FLista[I].Data > ARegistro.Data) do
        begin
          FLista.Exchange(I, I+1);
          Inc(I, -1);
        end;
      Result:= NewRegisterCreated;
    end
  else
    begin
      if FLista[ResultadoBusca].QtdeHoras + ARegistro.QtdeHoras <= ARegistro.CARGA_EXTRA_DIARIA_MAXIMA then
        begin
          if FLista[ResultadoBusca].Dia <> ARegistro.Dia then
            Result:= RegisterUpdatedWithHoliday
          else
            Result:= RegisterUpdated;
          FLista[ResultadoBusca].Update:= ARegistro;
        end
      else
        Result:= OvertimeExceeded;
    end;
end;

destructor TListaRegistroHorasExtras.Destroy;
begin
  //FLista.Free;
  inherited;
end;

function TListaRegistroHorasExtras.GetValorTotal: currency;
var
  Registro: TRegistroHorasExtras;
begin
  Result:= 0;
  for Registro in FLista do
    Result:= Result + Registro.GetValorDoDia;
end;

procedure TListaRegistroHorasExtras.GerarRelatorioIndividual(AMsg: TStringList);
var
  Registro: TRegistroHorasExtras;
  TDiaNome: string;
const
  PADRAO_DATA = '%s - %s:';
  PADRAO_QTDEHORAS = '%d:';
  PADRAO_VALOR = '%f;';
begin
  for Registro in FLista do
    begin
      case Registro.Dia of
        TRegistroHorasExtras.TDia.Util:    TDiaNome:= 'Útil';
        TRegistroHorasExtras.TDia.Feriado: TDiaNome:= 'Feriado';
        TRegistroHorasExtras.TDia.Domingo: TDiaNome:='Domingo';
      end;
      AMsg.Add(Format(PADRAO_DATA + PADRAO_QTDEHORAS + PADRAO_VALOR, [DateTimeToStr(Registro.Data), TDiaNome, Registro.QtdeHoras, Registro.GetValorDoDia]))
    end;
  AMsg.Add(Format('ValorTotal:%f', [GetValorTotal]));
end;

{ TFuncionario }

constructor TFuncionario.Create(ACodigo: integer; ARegistro: TRegistroHorasExtras);
begin
  FCodigo:= ACodigo;
  FRegistrosHorasExtras:= nil;
  FRegistrosHorasExtras:= TListaRegistroHorasExtras.Create;
  FRegistrosHorasExtras.CriarNovoRegistro(ARegistro);
end;

destructor TFuncionario.Destroy;
begin
  FRegistrosHorasExtras.Free;
  inherited;
end;

{ TListaFuncionarios}

function TListaFuncionarios.BuscaFuncionario (ACodigo: integer): integer;
var
  Low, Middle, High: integer;
begin
  Result:= NotFound;
  if Lista.Count < 1 then
    Exit;
  Low:= 0; High:= Lista.Count - 1;
  while Low<=High do
    begin
      middle:= (Low+High) div 2;
      if Lista[Middle].Codigo = ACodigo then
        begin
          Result:= middle;
          Exit;
        end
      else if Lista[Middle].Codigo < ACodigo then
        Low:= middle +1
      else
        High:= middle -1;
    end;
end;

constructor TListaFuncionarios.Create;
begin
  FLista:= TObjectList<TFuncionario>.Create;
end;

function TListaFuncionarios.CriaRegistroFuncionario (AFuncionario: TFuncionario): TConclusionReport;
var
  ResultadoBusca, I: integer;
begin
  ResultadoBusca:= BuscaFuncionario (AFuncionario.Codigo);
  if ResultadoBusca = NotFound then
    begin
      Lista.Add(AFuncionario);
      I:= Lista.Count -1;
      while (I -1 >= 0) and (Lista[I].Codigo < Lista[I-1].Codigo) do
          begin
            Lista.Exchange(I, I-1);
            Inc(I, -1);
          end;
      Result:= NewEmployeeCreated;
    end
  else
    begin
      Result:= Lista[ResultadoBusca].RegistrosHorasExtras.CriarNovoRegistro(AFuncionario.RegistrosHorasExtras.Lista[0]);
    end;
end;

destructor TListaFuncionarios.Destroy;
begin
  FLista.Free;
  inherited;
end;

procedure TListaFuncionarios.GerarRelatorioLista(out AMsg: TStringList);
var
  Funcionario: TFuncionario;
  BMsg: TStringList;
begin
  BMsg:= nil;
  BMsg:= TStringList.Create;
  try
    for Funcionario in FLista do
      //AMsg.AddStrings(Funcionario.RegistrosHorasExtras.GerarRelatorioIndividual(BMsg))
  finally
    BMsg.Free;
  end;
end;

end.
