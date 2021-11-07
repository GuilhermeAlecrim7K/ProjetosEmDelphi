program DProjOperacoesBancarias;

uses
  Vcl.Forms,
  Principal in 'Principal.pas' {MainForm},
  MinhasClasses in 'MinhasClasses.pas',
  Operacao in 'Operacao.pas' {FrmOperacao};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
