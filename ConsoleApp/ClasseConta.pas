unit ClasseConta;

interface

type
  TConta = class(TObject)
  private
    FSaldo: Double;
  public
    constructor Create(ASaldo: Double = 0);
    destructor Destroy; override;
    function Deposito(Valor: Double; out Msg: string): Boolean; virtual;
    function Saque(Valor: Double; out Msg: string): Boolean; virtual;
    function Saldo: Double; virtual;
  end;

  TContaPoupanca = class(TConta)
  public
    function Deposito(Valor: Double; out Msg: string): Boolean; override;
    function Saque(Valor: Double; out Msg: string): Boolean; override;
  end;

  TContaCorrente = class(TConta)
  public
    function Saque(Valor: Double; out Msg: string): Boolean; override;
  end;

implementation

uses
  SysUtils;

{ TConta }

constructor TConta.Create(ASaldo: Double);
begin
  FSaldo := ASaldo;
end;

destructor TConta.Destroy;
begin
  inherited;
end;

function TConta.Deposito(Valor: Double; out Msg: string): Boolean;
begin
  FSaldo := FSaldo + Valor;
  Result := True;
end;

function TConta.Saque(Valor: Double; out Msg: string): Boolean;
begin
  Result := False;
  if Valor <= FSaldo then
  begin
    FSaldo := FSaldo - Valor;
    Result := True;
  end
  else
  begin
    Msg := 'Saldo insuficiente.';
    //raise Exception.Create('Saldo insuficiente');
    //ShowMessage('Saldo insuficiente');
  end;
end;

function TConta.Saldo: Double;
begin
  Result := FSaldo;
end;

{ TContaCorrente }

function TContaCorrente.Saque(Valor: Double; out Msg: string): Boolean;
var
  ValorComTaxa: Double;
begin
  //inherited;
  Result := False;
  ValorComTaxa := Valor + (Valor * 0.01); //Taxa de 1%
  if (FSaldo < ValorComTaxa) then
  begin
    Msg := 'Saldo insuficiente';
    Exit;
  end;

  if Valor <= 1000 then
  begin
    FSaldo := FSaldo - ValorComTaxa;
    Result := True;
  end
  else
    Msg := 'Limite para saque de R$ 1.000,00';
end;

{ TContaPoupanca }

function TContaPoupanca.Deposito(Valor: Double; out Msg: string): Boolean;
begin
  //inherited;
  Result := False;
  if Valor > 200 then
  begin
    FSaldo := FSaldo + Valor;
    Result := True;
  end
  else
    Msg := 'Valor mínimo para depósito de R$ 200,00';
end;

function TContaPoupanca.Saque(Valor: Double; out Msg: string): Boolean;
begin
  //inherited;
  Result := False;
  if (FSaldo < Valor) then
  begin
    Msg := 'Saldo insuficiente.';
    Exit;
  end;

  if (Valor <= 500) then
  begin
    FSaldo := FSaldo - Valor;
    Result := True;
  end
  else
    Msg := 'Limite para saque de R$ 500,00';
end;

end.

