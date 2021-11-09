program DprojTabelaClientes;

uses
  Vcl.Forms,
  FrmPrincipal in 'FrmPrincipal.pas' {MainForm},
  FrmDados in 'FrmDados.pas' {FrmInclusao};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
