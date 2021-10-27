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
Michelin: TPneu;
msg: string;

procedure TForm1.NewLine;
begin
  Memo1.Lines.Add('');
end;

procedure TForm1.BtnTeste1Click(Sender: TObject);
const
  MSG_TESTE1 = 'Este teste irá realizar as operações básicas da classe TPneu. Criar um objeto TPneu, usar todas as propriedades e métodos da classe.';
begin
  Michelin:= TPneu.create;
  Memo1.Lines.Clear;
  Memo1.Lines.Add(MSG_TESTE1);
  try
    NewLine;
    Memo1.Lines.Add('- N° Identificador do pneu: ' + Michelin.IdPneu);
    Memo1.Lines.Add('- Leitura do Limite de Rodagem do Pneu: ' + IntToStr(Michelin.LimiteRodagem));
    Memo1.Lines.Add('- Quantidade de Vidas do Pneu: ' + IntToStr(Michelin.ReadQtdVidas));
    NewLine;
    Memo1.Lines.Add('Adicionando 768 km ao objeto...');
    Newline;
    Michelin.WriteQuilometragem(768,msg);
    Memo1.Lines.Add('- Quilômetro rodados: ' + IntToStr(Michelin.ReadQuilometragem));
    Michelin.LimiteRodagem:= 1500;
    Memo1.Lines.Add('- Alterado o limite de Rodagem do Pneu para 1500 km: ' + IntToStr(Michelin.LimiteRodagem));
    Memo1.Lines.Add('- Quilometros restantes da vida atual: ' + IntToStr(Michelin.KmRestanteVidaAtual));
  finally
    FreeAndNil(Michelin)
  end;
end;

end.
