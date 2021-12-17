unit FrmPrincipal;

{
Requisitos: Criar um sistema para calcular a folha de pagamentos de uma empresa.
    - Cadastro de cargos: código e nome.
    - Cadastro de eventos: código, descrição, tipo (desconto/acréscimo).
    - Tabela de INSS.
    - Tabela de IRRF.
    - Cadastro de funcionários: código, nome, data de nascimento, cargo, contato, e-mail, ativo.
      * O cadastro de funcionários deve manter o histórico de salários do empregado.
    - Registrar mudança de salário
    - Lançar evento para funcionário(s)
    - Tela de processamento de folha: calcular/recalcular folha de pagamentos para um mês informado.
        * Consultar dados dos funcionários ativos
        * Calcular INSS
        * Calcular IRRF
        * Verificar Eventos para o mês
    - Relatório de folha de pagamento.
    - Relatório de empregados.
}
interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Connection, Vcl.Menus;

type
  TFMain = class(TForm)
    MainMenu1: TMainMenu;
    Cargos1: TMenuItem;
    Cargos2: TMenuItem;
    Cargos3: TMenuItem;
    Processos1: TMenuItem;
    Funcionrios1: TMenuItem;
    Funcionrios2: TMenuItem;
    abeladeINSS1: TMenuItem;
    abeladeINSS2: TMenuItem;
    Relatrios1: TMenuItem;
    Mudanadesalrio1: TMenuItem;
    Mudanadesalrio2: TMenuItem;
    FolhadePagamento1: TMenuItem;
    FolhadePagamento2: TMenuItem;
    Funcionrios3: TMenuItem;
    Sair1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure Funcionrios1Click(Sender: TObject);
    procedure Cargos2Click(Sender: TObject);
    procedure Cargos3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMain: TFMain;

implementation

{$R *.dfm}

uses
  FrmCadFuncionario, FrmCadCargos, FrmCadEventos;

procedure TFMain.Cargos2Click(Sender: TObject);
begin
  FCadCargos:= TFCadCargos.Create(Self);
  FCadCargos.ShowModal;
  FCadCargos.Free;
end;

procedure TFMain.Cargos3Click(Sender: TObject);
begin
  FCadEventos:= TFCadEventos.Create(Self);
end;

procedure TFMain.FormCreate(Sender: TObject);
begin
  DModule := TDModule.Create(Self);
end;

procedure TFMain.FormDestroy(Sender: TObject);
begin
  DModule.Free;
end;

procedure TFMain.Funcionrios1Click(Sender: TObject);
begin
  FCadFuncionario:= TFCadFuncionario.Create(self);
end;

procedure TFMain.Sair1Click(Sender: TObject);
begin
  Close;
end;

end.
