program DprojCalculadoraHorasExtras;

uses
  Vcl.Forms,
  Principal in 'Principal.pas' {Form1},
  Objetos in 'Objetos.pas',
  FrmRelatorios in 'FrmRelatorios.pas' {FormRelatorios};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  ReportMemoryLeaksOnShutdown:= true;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
