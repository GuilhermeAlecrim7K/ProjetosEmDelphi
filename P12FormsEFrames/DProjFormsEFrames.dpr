program DProjFormsEFrames;

uses
  Vcl.Forms,
  Principal in 'Principal.pas' {FrmPrincipal},
  Produtos in 'Produtos.pas' {FrmProdutos},
  Clientes in 'Clientes.pas' {FrmClientes},
  MDIs in 'MDIs.pas' {FrmMdi},
  FmeEventos in 'FmeEventos.pas' {FrameEventos: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  ReportMemoryLeaksOnShutdown:= True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
