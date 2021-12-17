program DProjAppFolha;

uses
  Vcl.Forms,
  FrmPrincipal in 'FrmPrincipal.pas' {FMain},
  Connection in 'Connection.pas' {DModule: TDataModule},
  FrmCadFuncionario in 'FrmCadFuncionario.pas' {FCadFuncionario},
  FrmCadCargos in 'FrmCadCargos.pas' {FCadCargos},
  FrmCadEventos in 'FrmCadEventos.pas' {FCadEventos},
  FrmMudSalario in 'FrmMudSalario.pas' {FMudSalario};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFMain, FMain);
  Application.Run;
end.
