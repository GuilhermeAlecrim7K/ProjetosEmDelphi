unit Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask;

type
  TMainForm = class(TForm)
    MemoInfoPanel: TMemo;
    BtnEmitirSaldo: TButton;
    BtnDeposito: TButton;
    BtnSaque: TButton;
    CmbBoxTipoConta: TComboBox;
    BtnExibirDados: TButton;
    procedure FormCreate(Sender: TObject);
    procedure BtnExibirDadosClick(Sender: TObject);
    procedure CmbBoxTipoContaSelect(Sender: TObject);
    procedure BtnEmitirSaldoClick(Sender: TObject);
    procedure BtnDepositoClick(Sender: TObject);
    procedure BtnSaqueClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

type
  EnumConta = (Corrente, Poupanca);
  procedure OperationOpen(Operacao:string); overload;
  procedure OperationOpen(Operacao:string; LimiteSaque: currency); overload;

var
  MainForm: TMainForm;

implementation

uses MinhasClasses, Operacao;

{$R *.dfm}

var
  ContaCorrente: TContaCorrente;
  ContaPoupanca: TContaPoupanca;
  TipoConta: EnumConta;

const
  OP_DEPOSITO = 'Depósito';
  OP_SAQUE = 'Saque';

procedure TMainForm.FormCreate(Sender: TObject);
begin
  ContaCorrente:= TContaCorrente.Create;
  ContaPoupanca:= TContaPoupanca.Create;
end;

procedure OperationOpen(Operacao: string);
begin
  FrmOperacao:= TFrmOperacao.Create(MainForm);
  FrmOperacao.Caption:= Operacao;
  try
    FrmOperacao.ShowModal;
  finally
    FrmOperacao.Free;
  end;
end;

procedure OperationOpen(Operacao: string; LimiteSaque: currency);
begin
  FrmOperacao:= TFrmOperacao.Create(MainForm);
  FrmOperacao.Caption:= Operacao;
  FrmOperacao.LblLimiteSaque.Caption:= FrmOperacao.LblLimiteSaque.Caption + Format('%m', [LimiteSaque]);
  FrmOperacao.LblLimiteSaque.Visible:= True;
  try
    FrmOperacao.ShowModal;
  finally
    FrmOperacao.Free;
  end;
end;

procedure TMainForm.CmbBoxTipoContaSelect(Sender: TObject);
begin
  MemoInfoPanel.Clear;
  BtnEmitirSaldo.Enabled:= False;
  BtnDeposito.Enabled:= False;
  BtnSaque.Enabled:= False;
  case CmbBoxTipoConta.ItemIndex of
    0: TipoConta:= Corrente;
    1: TipoConta:= Poupanca;
  end;
end;

procedure TMainForm.BtnExibirDadosClick(Sender: TObject);
begin
  MemoInfoPanel.Clear;
  case TipoConta of
    Corrente:
      begin
      MemoInfoPanel.Lines.Add('Nome do Titular: ' + ContaCorrente.NomeTitular);
      end;
    Poupanca:
      begin
      MemoInfoPanel.Lines.Add('Nome do Titular: ' + ContaPoupanca.NomeTitular);
      end;
  end;
  BtnEmitirSaldo.Enabled:= True;
  BtnDeposito.Enabled:= True;
  BtnSaque.Enabled:= True;
end;

procedure TMainForm.BtnEmitirSaldoClick(Sender: TObject);
var
  LSaldoDaPoupanca: currency;
  LSaldoDaCorrente: currency;
const
  CONCORRTEXT = 'Saldo da Conta Corrente: ';
  CONPOUPTEXT = 'Saldo da Conta Poupança: ';
begin
  LSaldoDaCorrente:= ContaCorrente.ConsultaSaldo;
  LSaldoDaPoupanca:= ContaPoupanca.ConsultaSaldo;
  MemoInfoPanel.lines.Delete(1);
  case TipoConta of
  Corrente: MemoInfoPanel.Lines.Add(CONCORRTEXT + Format('%m', [LSaldoDaCorrente]));
  Poupanca: MemoInfoPanel.Lines.Add(CONPOUPTEXT + Format('%m', [LSaldoDaPoupanca]));
  else MemoInfoPanel.Lines.Add('Erro');
  end;
end;

procedure TMainForm.BtnDepositoClick(Sender: TObject);
var
  MsgErro: string;
  Valor: currency;
begin
  OperationOpen(OP_DEPOSITO);
  Valor:= Operacao.OpValor;
  case TipoConta of
  Corrente: ContaCorrente.Deposito(Valor, MsgErro);
  Poupanca:
    begin
    if not ContaPoupanca.Deposito(Valor, MsgErro) then
      Raise Exception.Create(MsgErro)
    end;
  end;
  MemoInfoPanel.Lines.Delete(1);
end;

procedure TMainForm.BtnSaqueClick(Sender: TObject);
var
  MsgErro: string;
  Valor: currency;
  LimiteSaqueCorr: currency;
begin
  case TipoConta of
  Corrente:
    begin
    MessageDlg('É cobrada uma taxa de 1% sobre o valor sacado.',TMsgDlgType.mtWarning,[mbok],0);
    LimiteSaqueCorr:= ContaCorrente.ConsultaSaldo * 0.99;
    OperationOpen(OP_Saque, LimiteSaqueCorr);
    Valor:= Operacao.OpValor;
    if not ContaCorrente.Saque(Valor, MsgErro) then
      Raise Exception.Create(MsgErro)
    end;
  Poupanca:
    begin
    OperationOpen(OP_Saque, ContaPoupanca.ConsultaSaldo);
    Valor:= Operacao.OpValor;
    if not ContaPoupanca.Saque(Valor, MsgErro) then
      Raise Exception.Create(MsgErro)
    end;
  end;
  MemoInfoPanel.Lines.Delete(1);
end;

end.
