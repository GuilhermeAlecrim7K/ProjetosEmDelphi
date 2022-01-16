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
  LanMudancaCargo in 'Forms\Lancamentos\LanMudancaCargo.pas' {FrmLancarMudancaCargo};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  ReportMemoryLeaksOnShutdown:= True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
