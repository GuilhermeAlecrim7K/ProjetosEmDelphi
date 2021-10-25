unit Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask;

type
  TMainForm = class(TForm)
    Memo1: TMemo;
    BtnEmitirSaldo: TButton;
    BtnDeposito: TButton;
    BtnSaque: TButton;
    CmbBoxTipoConta: TComboBox;
    BtnExibirDados: TButton;
    EditQuantia: TMaskEdit;
    LabelInstrucao: TLabel;
    procedure BtnExibirDadosClick(Sender: TObject);
    procedure CmbBoxTipoContaSelect(Sender: TObject);
    procedure BtnEmitirSaldoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnDepositoClick(Sender: TObject);
    procedure EditQuantiaEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses MinhasClasses;

{$R *.dfm}

var
  Conta: TConta;
  ContaCorrente: TContaCorrente;
  ContaPoupanca: TContaPoupanca;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  Conta:= TConta.Create;
  ContaCorrente:= TContaCorrente.Create;
  ContaPoupanca:= TContaPoupanca.Create;
end;

procedure TMainForm.BtnExibirDadosClick(Sender: TObject);
var
  TipoConta: string;
begin
  Memo1.Clear;
  TipoConta:= IntToStr(CmbBoxTipoConta.ItemIndex);
{
    if Conta<> nil then
      begin
        Conta:= TConta.Create;
        Conta:= nil;
      end;
}
  Conta.NomeTitular:= 'Guilherme Ferreira Alecrim';
  Memo1.Lines.Add('Nome do Titular: ' + Conta.NomeTitular);
  //Memo1.Lines.Add('Saldo Disponível na Conta: ' + FloatToStr(Conta.SaldoDaConta));
  BtnEmitirSaldo.Enabled:= True;
  BtnDeposito.Enabled:= True;
  BtnSaque.Enabled:= True;
end;

procedure TMainForm.CmbBoxTipoContaSelect(Sender: TObject);
begin
  Memo1.Clear;
  BtnEmitirSaldo.Enabled:= False;
  BtnDeposito.Enabled:= False;
  BtnSaque.Enabled:= False;
end;

procedure TMainForm.BtnEmitirSaldoClick(Sender: TObject);
// Inserir if else para opções de conta e reorganizar distribuição dos procedimentos abaixo
var
  LSaldoDaPoupanca: currency;
  LSaldoDaCorrente: currency;
const
  CONCORRTEXT = 'Saldo da Conta Corrente: ';
  CONPOUPTEXT = 'Saldo da Conta Poupança: ';
begin
  Memo1.Lines.Delete(2); Memo1.Lines.Delete(1);
  LSaldoDaCorrente:= ContaCorrente.ConsultaSaldo;
  LSaldoDaPoupanca:= ContaPoupanca.ConsultaSaldo;
  Memo1.Lines.Insert(1,CONCORRTEXT + CurrToStr(LSaldoDaCorrente));
  Memo1.Lines.Insert(2,CONPOUPTEXT + CurrToStr(LSaldoDaPoupanca));
  Memo1.Lines.Add('TConta: ' + CurrToStr(Conta.ConsultaSaldo));
end;

procedure TMainForm.BtnDepositoClick(Sender: TObject);
const
  PARPOUP = 'O valor do depósito não pode ser menor que R$ 200,00';
begin
  EditQuantia.Visible:= True;
  LabelInstrucao.Visible:= True;
  Conta.Deposito(500);
end;

procedure TMainForm.EditQuantiaEnter(Sender: TObject);
var
  Quantia: currency;
begin
  Quantia:= StrToCurr(EditQuantia.Text);
  if CmbBoxTipoConta.ItemIndex = 0 then
    begin
      //Result:= Quantia;
    end
  else
    begin
      //Result:= Quantia;
    end;
end;

end.
