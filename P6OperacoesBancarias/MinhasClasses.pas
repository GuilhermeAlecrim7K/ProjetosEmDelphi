unit MinhasClasses;

interface

type
  TConta = class
  private
    FNomeTitular: string;
    FSaldoDaConta: currency;
  public
    property NomeTitular: string read FNomeTitular write FNomeTitular;
    function Saque(Valor: currency): currency; virtual;
    function Deposito(Valor: currency): currency; virtual;
    function ConsultaSaldo: currency; virtual;
  end;

  TContaCorrente = class(TConta)
  public
    function Saque(Valor: currency): currency; override;
    function Deposito(Valor: currency): currency; override;
    function ConsultaSaldo: currency; override;
  end;

  TContaPoupanca = class(TConta)
    public
      function Saque(Valor: currency): currency; override;
      function Deposito(Valor: currency): currency; override;
      function ConsultaSaldo: currency; override;
  end;

implementation

{ TConta }

function TConta.ConsultaSaldo: currency;
begin
  Result:= FSaldoDaConta;
end;

function TConta.Deposito(Valor: currency): currency;
begin
  FSaldoDaConta:= FSaldoDaConta + Valor;
  Result:= FSaldoDaConta;
end;

function TConta.Saque(Valor: currency): currency;
begin
  FSaldoDaConta:= FSaldoDaConta - Valor;
  Result:= FSaldoDaConta;
end;

{ TContaCorrente }

function TContaCorrente.ConsultaSaldo: currency;
begin
  Result:= FSaldoDaConta; //Criar variável saldo da conta para TContaCorrente
end;

function TContaCorrente.Deposito(Valor: currency): currency;
begin
  //Colocar para herdar
end;

function TContaCorrente.Saque(Valor: currency): currency;
begin
    if (Valor<1000) and (FSaldoDaConta - (Valor * 0.99) > 0) then
    begin
      FSaldoDaConta:= FSaldoDaConta - (Valor * 0.99);
    end;
end;

{ TContaPoupanca }

function TContaPoupanca.ConsultaSaldo: currency;
begin

end;

function TContaPoupanca.Deposito(Valor: currency): currency;
begin
  if Valor>200 then
    begin
      FSaldoDaConta:= FSaldoDaConta + Valor;
      Result:= FSaldoDaConta;
    end;
end;

function TContaPoupanca.Saque(Valor: currency): currency;
begin
  if (Valor<500) and (FSaldoDaConta - Valor > 0) then
  begin
    FSaldoDaConta:= FSaldodaConta - Valor;
  end

end;

end.
