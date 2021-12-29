program DprojCalculadora;

uses
  Vcl.Forms,
  Calculadora in 'Calculadora.pas' {FrmPrincipal},
  UnitCalculos in 'UnitCalculos.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
