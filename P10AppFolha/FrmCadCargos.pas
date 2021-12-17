unit FrmCadCargos;

interface

{
- Criar campos
  - No campo Código, permitir apenas a geração de um número aleatório e
- Dois botões, Salvar e Cancelar
- Ao tentar salvar, validar se aquele número já existe no banco, em caso positivo,
  gerar de novo e imprimir em tela (do-while)
- Criar tela de validação (Yes, no): Yes, executa Query ; No, Limpa os campos
}
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Connection, Vcl.ExtCtrls, Vcl.DBCtrls,
  Vcl.ComCtrls, Vcl.StdCtrls;

type
  TFCadCargos = class(TForm)
    QryInsertCargos: TFDQuery;
    BtnSalvar: TButton;
    BtnCancelar: TButton;
    QryConsultaCargos: TFDQuery;
    EdtCodigo: TLabeledEdit;
    EdtTitulo: TLabeledEdit;
    procedure BtnSalvarClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadCargos: TFCadCargos;

implementation

{$R *.dfm}


procedure TFCadCargos.BtnSalvarClick(Sender: TObject);
var
  Codigo: string;
  Titulo: string;
  QTemIgual: string;
begin
  Codigo:= EdtCodigo.Text;
  Titulo:= EdtTitulo.Text;
  QryConsultaCargos.SQL.Text:= 'SELECT * FROM CARGOS c WHERE c.CODIGO = ' + QuotedStr(Codigo) + ' OR c.NOME = ' + QuotedStr(Titulo);
  if True then
  
end;

end.
