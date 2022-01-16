program DprojFolhaDePagamento;

uses
  Vcl.Forms,
  Principal in 'Principal.pas' {FrmPrincipal},
  Conexao in 'Conexao.pas' {DM: TDataModule},
  CalculosINSSeIRRF in 'Patterns\CalculosINSSeIRRF.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  ReportMemoryLeaksOnShutdown:= True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
