unit Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TMainForm = class(TForm)
    Memo1: TMemo;
    BtnEmitirSaldo: TButton;
    BtnDeposito: TButton;
    BtnSaque: TButton;
    CmbBoxTipoConta: TComboBox;
    BtnExibirDados: TButton;
    procedure BtnExibirDadosClick(Sender: TObject);
    procedure CmbBoxTipoContaSelect(Sender: TObject);
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

procedure TMainForm.BtnExibirDadosClick(Sender: TObject);
var
  TipoConta: string;
begin
  Memo1.Clear;
  TipoConta:= IntToStr(CmbBoxTipoConta.ItemIndex);
  Conta:= TConta.Create;
  Conta.NomeTitular:= 'Guilherme Ferreira Alecrim';
  Memo1.Lines.Add('Nome do Titular: ' + Conta.NomeTitular);
  Memo1.Lines.Add('Saldo Disponível na Conta: ' + FloatToStr(Conta.SaldoDaConta));
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

end.
