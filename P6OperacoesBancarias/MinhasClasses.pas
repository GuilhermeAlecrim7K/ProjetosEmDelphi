unit MinhasClasses;

interface

type
  TConta = class
  private
    FNomeTitular: string;
    FSaldoDaConta: currency;
  public
    property NomeTitular: string read FNomeTitular write FNomeTitular;
    property SaldoDaConta: currency read FSaldoDaConta;
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
  //Procedimentos
end;

function TConta.Saque(Valor: currency): currency;
begin
  //Procedimentos
end;

{ TContaCorrente }

function TContaCorrente.ConsultaSaldo: currency;
begin
  //Result:= não pode ser inherited
end;

function TContaCorrente.Deposito(Valor: currency): currency;
begin

end;

function TContaCorrente.Saque(Valor: currency): currency;
begin

end;

{ TContaPoupanca }

function TContaPoupanca.ConsultaSaldo: currency;
begin

end;

function TContaPoupanca.Deposito(Valor: currency): currency;
begin

end;

function TContaPoupanca.Saque(Valor: currency): currency;
begin

end;

end.
