program DprojFolhaDePagamento;

uses
  Vcl.Forms,
  Principal in 'Principal.pas' {FrmPrincipal},
  Conexao in 'Conexao.pas' {DM: TDataModule},
  CalculosINSSeIRRF in 'Patterns\CalculosINSSeIRRF.pas',
  CadCargos in 'Forms\Cadastro\CadCargos.pas' {FrmCadastroCargos},
  CadFuncionarios in 'Forms\Cadastro\CadFuncionarios.pas' {FrmCadastroFuncionarios},
  CadEventos in 'Forms\Cadastro\CadEventos.pas' {FrmCadastroEventos},
  LanMudancaSalario in 'Forms\Lancamentos\LanMudancaSalario.pas' {FrmLancarMudancaDeSalario},
  LanEventos in 'Forms\Lancamentos\LanEventos.pas' {FrmLancarEventos},
  LanMudancaCargo in 'Forms\Lancamentos\LanMudancaCargo.pas' {FrmLancarMudancaCargo},
  RelCargos in 'Forms\Relatorios\RelCargos.pas' {FrmListaCargos},
  RelFuncionarios in 'Forms\Relatorios\RelFuncionarios.pas' {FrmRelatorioFuncionarios},
  RelEventos in 'Forms\Relatorios\RelEventos.pas' {FrmRelatorioEventos},
  RelMudancaSalario in 'Forms\Relatorios\RelMudancaSalario.pas' {FrmRelatorioMudancaSalario},
  RelFinanceiroINSS in 'Forms\Relatorios\RelFinanceiroINSS.pas' {FrmRelatorioINSS},
  RelFinanceiroIRRF in 'Forms\Relatorios\RelFinanceiroIRRF.pas' {FrmRelatorioFinanceiroIRRF},
  Procedimentos in 'Patterns\Procedimentos.pas',
  Padroes in 'Patterns\Padroes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  ReportMemoryLeaksOnShutdown:= True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
