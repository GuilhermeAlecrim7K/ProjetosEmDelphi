program DProjVisualComponents;

uses
  Vcl.Forms,
  Principal in 'Principal.pas' {FrmPrincipal},
  Containers in 'Containers.pas' {FrmContainers};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
