unit Records;

interface

type
TCliente = Record
  Nome: string[40];
  Endereco: string[40];
  CPF: string[11];
  Idade: byte;
  TemFilhos: boolean;
End;

procedure CriarCliente;

implementation

procedure CriarCliente;
var
  Cliente1, Cliente2: TCliente;
begin
  Cliente1.Nome:= 'João das Neves';
  Cliente1.Endereco:= 'Rua Almirante das Rosas, 457';
  Cliente1.CPF:= '06514795166';
  Cliente1.Idade:= 45;
  Cliente1.TemFilhos:= True;

  Cliente2:= Cliente1; //Utilizando Cliente1 como base para definição de seu irmão e depois alterando os dados divergentes
  Cliente2.Nome:= 'Pedro das Neves';
  Cliente2.CPF:= '85819426724'
end;

end.
