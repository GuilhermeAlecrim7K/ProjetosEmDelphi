program FizzBuzzProj;

uses
  Vcl.Forms,
  FizzBuzz in 'FizzBuzz.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
