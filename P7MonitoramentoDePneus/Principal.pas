unit Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ClassePneu, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    BtnTeste1: TButton;
    BtnTeste2: TButton;
    BtnTeste3: TButton;
    BtnTeste4: TButton;
    BtnTeste5: TButton;
    procedure BtnTeste1Click(Sender: TObject);
    procedure NewLine;
    procedure BtnTeste2Click(Sender: TObject);
    procedure BtnTeste3Click(Sender: TObject);
    procedure BtnTeste4Click(Sender: TObject);
    procedure BtnTeste5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

var
msg: string;

procedure TForm1.NewLine;
begin
  Memo1.Lines.Add('');
end;

procedure TForm1.BtnTeste1Click(Sender: TObject);
var
Michelin: TPneu;
const
  MSG_TESTE1 = 'Este teste ir� fornecer as informa��es do objeto Michelin do tipo classe TPneu. Cria��o do objeto e verifica��o dos valores setados no m�todo create.';
begin
  Michelin:= TPneu.create;
  Memo1.Lines.Clear;
  Memo1.Lines.Add(MSG_TESTE1);
  try
    NewLine;
    Memo1.Lines.Add('- N� Identificador do pneu: ' + Michelin.IdPneu);
    Memo1.Lines.Add('- Leitura do Limite de Rodagem do Pneu: ' + IntToStr(Michelin.LimiteRodagem));
    Memo1.Lines.Add('- Quantidade de Vidas do Pneu: ' + IntToStr(Michelin.ReadQtdVidas));
    Memo1.Lines.Add('- Quilometragem Total Percorrida: ' + IntToStr(Michelin.KmTotalPercorrido));
  finally
    FreeAndNil(Michelin)
  end;
end;

procedure TForm1.BtnTeste2Click(Sender: TObject);
var
  Pirelli: TPneu;
const
  MSG_TESTE2 = 'Este teste ir� trabalhar, de forma simples, com os dados edit�veis do objeto. Cria��o, atribui��o de valores a propriedades com write e m�todos da classe. Al�m de fornecer alguns outros dados do objeto que n�o foram consultados no teste 1.';
begin
  Pirelli:= TPneu.Create;
  Memo1.Lines.Clear;
  Memo1.Lines.Add(MSG_TESTE2);
  try
    NewLine;
    Memo1.Lines.Add('Adicionando 768 km de rodagem ao pneu...');
    Newline;
    Pirelli.WriteQuilometragem(768,msg);
    Memo1.Lines.Add('- Quil�metro rodados da vida atual: ' + IntToStr(Pirelli.ReadQuilometragem));
    Pirelli.LimiteRodagem:= 1500;
    Memo1.Lines.Add('- Alterado o limite de Rodagem do Pneu para 1500 km: ' + IntToStr(Pirelli.LimiteRodagem));
    Memo1.Lines.Add('- Quilometros restantes da vida atual: ' + IntToStr(Pirelli.KmRestanteVidaAtual));
    Memo1.Lines.Add('- Quilometragem Total Percorrida: ' + IntToStr(Pirelli.KmTotalPercorrido));
  finally
    FreeAndNil(Pirelli)
  end;
end;


procedure TForm1.BtnTeste3Click(Sender: TObject);
var
  Continental: TPneu;
const
  MSG_TESTE3 = 'Este teste ir� Demonstrar os dados do objeto ap�s o primeiro recapeamento depois de exatos 5000 km rodados.';
begin
  Continental:= TPneu.Create;
  Memo1.Lines.Clear;
  Memo1.Lines.Add(MSG_TESTE3);
  try
    NewLine;
    Continental.WriteQuilometragem(5000,msg);
    Memo1.Lines.Add('- Quil�metro rodados da vida atual: ' + IntToStr(Continental.ReadQuilometragem));
    Memo1.Lines.Add('- Quantidade de Vidas do Pneu: ' + IntToStr(Continental.ReadQtdVidas));
    Memo1.Lines.Add('- Quilometros restantes da vida atual: ' + IntToStr(Continental.KmRestanteVidaAtual));
    Memo1.Lines.Add('- Quilometragem Total Percorrida: ' + IntToStr(Continental.KmTotalPercorrido));
  finally
    FreeAndNil(Continental)
  end;
end;

procedure TForm1.BtnTeste4Click(Sender: TObject);
type
  Ciclos = (Ciclo1, Ciclo2, Ciclo3, Ciclo4, Ciclo5);
var
  Goodyear: TPneu;
  I: Ciclos;
  ISet: set of Ciclos;
const
  MSG_TESTE4 = 'Este teste trabalhar� com um limite menor de rodagem. Ser�o feitos 4 recapeamentos, passando-se um pouco do limite de rodagem para coletar a quilometragem total do pneu';
begin
  Goodyear:= TPneu.Create;
  ISet:= [Ciclo1, Ciclo2, Ciclo3, Ciclo4];
  Memo1.Lines.Clear;
  Memo1.Lines.Add(MSG_TESTE4);
  try
    NewLine;
    Memo1.Lines.Add('Novo limite de rodagem: 3500');
    Goodyear.LimiteRodagem:= 3500;
    NewLine;
    for I in ISet do //for I in Ciclos
    begin
      Memo1.Lines.Add('Adicionando 3600 km de rodagem ao pneu...');
      Goodyear.WriteQuilometragem(3600,msg);
      Memo1.Lines.Add('- Quilometragem Total Percorrida: ' + IntToStr(Goodyear.KmTotalPercorrido));
      Memo1.Lines.Add('- Vidas restantes: ' + IntToStr(Goodyear.ReadQtdVidas));
      NewLine;
    end;
  finally
    FreeAndNil(Goodyear)
  end;
end;

procedure TForm1.BtnTeste5Click(Sender: TObject);
var
  Bridgestone: TPneu;
  AL: byte;
const
  ArrayLoop: array [0..5] of byte = (0,1,2,3,4,5);
const
  MSG_TESTE5 = 'O �ltimo teste trabalha at� o fim da vida do pneu. Ser�o feito os 5 recapeamentos poss�veis e uma tentativa de registro de nova quilometragem com o objetivo de testar o resultado ap�s esgotadas as vidas do pneu.';
begin
  Bridgestone:= TPneu.Create;
  Memo1.Lines.Clear;
  Memo1.Lines.Add(MSG_TESTE5);
  try
    Memo1.Lines.Add('Novo limite de rodagem: 1000');
    Bridgestone.LimiteRodagem:= 1000;
    NewLine;
    for AL in ArrayLoop do
    begin
      Newline;
      Memo1.Lines.Add('Ciclo ' + IntToStr(AL+1) + ': ');
      if (Bridgestone.WriteQuilometragem(1100,msg)) then
        begin
          Memo1.Lines.Add('- Quilometragem Total Percorrida: ' + IntToStr(Bridgestone.KmTotalPercorrido));
          Memo1.Lines.Add('- Vidas restantes: ' + IntToStr(Bridgestone.ReadQtdVidas));
        end
      else
        begin
          Memo1.Lines.Add(msg);
          Memo1.Lines.Add('- Quilometragem Total Percorrida: ' + IntToStr(Bridgestone.KmTotalPercorrido));
          Memo1.Lines.Add('- Vidas restantes: ' + IntToStr(Bridgestone.ReadQtdVidas));
        end;
    end;
  finally
    FreeAndNil(Bridgestone)
  end;
end;

end.
