unit MinhasClasses;

{
Crie uma classe Conta que possua métodos públicos (virtual) para
as operações de saque, depósito e consulta de saldo. Em seguida
crie outras duas classes, ContaCorrente e ContaPoupanca que herdam
da classe Conta.

Sobrescreva (override) o método de saque da classe
ContaCorrente pois deverá adicionalmente realizar um desconto de
imposto no saldo referente a 1% do valor sacado toda vez que um
saque for realizado. O limite de saque da classe ContaCorrente é
de 1000 reais por operação.

Para a classe ContaPoupanca sobrescreva
(override) o método de saque não permitindo realizar nenhum tipo de
desconto de imposto na operação de saque, no entanto o limite de
saque será de apenas 500 reais por operação. Na classe ContaPoupanca
sobrescreva (override) a operação de depósito permitindo somente
operações com valores superiores à 200 reais.
}

interface

type
  IConta = interface ['{F89EC647-B7DF-42AB-AC19-A75ADD9EC9FD}']
    function Saque(Valor: currency; out Msg: string): boolean;
    function Deposito(Valor: currency; out Msg: string): boolean;
    function ConsultaSaldo: currency;
  end;

  TContaCorrente = class(TInterfacedObject, IConta)
  strict private
    FNomeTitular: string;
    FSaldoConta: currency;
  public
    constructor Create;
    property NomeTitular: string read FNomeTitular;
    function Saque(Valor: currency; out Msg: string): boolean;
    function Deposito(Valor: currency; out Msg: string): boolean;
    function ConsultaSaldo: currency;
  end;

  TContaPoupanca = class(TInterfacedObject, IConta)
    strict private
      FNomeTitular: string;
      FSaldoConta: currency;
    public
      constructor Create;
      property NomeTitular: string read FNomeTitular;
      function Saque(Valor: currency; out Msg: string): boolean;
      function Deposito(Valor: currency; out Msg: string): boolean;
      function ConsultaSaldo: currency;
  end;

implementation

{ TContaCorrente }

constructor TContaCorrente.Create;
begin
  FNomeTitular:= 'Guilherme Ferreira Alecrim';
  FSaldoConta:= 1000;
end;

function TContaCorrente.ConsultaSaldo: currency;
begin
  Result:= FSaldoConta;
end;

function TContaCorrente.Deposito(Valor: currency; out Msg: string): boolean;
begin
  FSaldoConta:= FSaldoConta + Valor;
  Result:= True;
end;

function TContaCorrente.Saque(Valor: currency; out Msg: string): boolean;
var
  IsWithinLimite, IsWithinSaldo: boolean;
const
  MSG_RETORNO_FALSE = 'A operação não pôde ser realizada. ';
  MSG_ABOVE_LIMITE = 'O limite para saques nesta modalidade é de R$ 1.000,00 por operação.';
  MSG_SALDO_INSUFICIENTE = 'Saldo insuficiente.';
begin
  IsWithinLimite:= Valor <= 1000;
  IsWithinSaldo:= FSaldoConta - (Valor * 1.01) >= 0;
  if IsWithinLimite and IsWithinSaldo then
    begin
      FSaldoConta:= FSaldoConta - (Valor * 1.01);
      Result:= True;
    end
  else
    begin
      Result:= False;
      Msg:= MSG_RETORNO_FALSE;
      if not IsWithinLimite then
        Msg:= Msg + MSG_ABOVE_LIMITE
      else
        Msg:= Msg + MSG_SALDO_INSUFICIENTE;
    end;
end;

{ TContaPoupanca }

constructor TContaPoupanca.Create;
begin
  FNomeTitular:= 'Guilherme Ferreira Alecrim';
  FSaldoConta:= 500;
end;

function TContaPoupanca.ConsultaSaldo: currency;
begin
  Result:= FSaldoConta;
end;

function TContaPoupanca.Deposito(Valor: currency; out Msg: string): boolean;
const
  MSG_RETORNO_FALSE = 'A operação não foi realizada. O limite mínimo para depósito é de R$ 200,00 por operação.';
begin
  if Valor>=200 then
    begin
      FSaldoConta:= FSaldoConta + Valor;
      Result:= True;
    end
  else
    begin
      Msg:= MSG_RETORNO_FALSE;
      Result:= False;
    end;
end;

function TContaPoupanca.Saque(Valor: currency; out Msg: string): boolean;
var
  IsWithinLimite, IsWithinSaldo: boolean;
const
  MSG_RETORNO_FALSE = 'A operação não pôde ser realizada. ';
  MSG_ABOVE_LIMITE = 'O limite para saques nesta modalidade é de R$ 500,00 por operação.';
  MSG_SALDO_INSUFICIENTE = 'Saldo insuficiente.';
begin
  IsWithinLimite:= Valor<=500;
  IsWithinSaldo:= FSaldoConta - Valor >= 0;
  if IsWithinLimite and IsWithinSaldo then
    begin
      FSaldoConta:= FSaldoConta - Valor;
      Result:= True;
    end
  else
    begin
      Result:= False;
      Msg:= MSG_RETORNO_FALSE;
      if not IsWithinLimite then
        Msg:= Msg + MSG_ABOVE_LIMITE
      else
        Msg:= Msg + MSG_SALDO_INSUFICIENTE;
    end;
end;

end.
