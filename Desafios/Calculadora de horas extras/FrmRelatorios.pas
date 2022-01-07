unit FrmRelatorios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Objetos;

type
  TFormRelatorios = class(TForm)
    Memo1: TMemo;
    BtnGerarRelatorio: TButton;
    procedure BtnGerarRelatorioClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ListaFuncionarios: TListaFuncionarios;
  end;

var
  FormRelatorios: TFormRelatorios;

implementation

{$R *.dfm}

procedure TFormRelatorios.BtnGerarRelatorioClick(Sender: TObject);
var
  Funcionario: TFuncionario;
  ValorIndividual, ValorTotal: currency;
  Msg: string;
begin
  Memo1.Lines.Clear;
  ValorTotal:= 0;
  if ListaFuncionarios.Count<1 then
    Memo1.Lines.Add('Não há nenhum registro');
  for Funcionario in ListaFuncionarios do
    begin
      ValorIndividual:= GerarRelatorio(Funcionario, msg);
      Memo1.Lines.Add(Format(Msg, [Funcionario.Codigo, ValorIndividual]));
      ValorTotal:= ValorTotal + ValorIndividual;
    end;
  Memo1.Lines.Add(Format('Valor Total a ser pago: %m', [ValorTotal]));
end;

end.
