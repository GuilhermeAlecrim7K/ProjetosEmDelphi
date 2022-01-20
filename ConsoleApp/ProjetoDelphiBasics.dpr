program ProjetoDelphiBasics;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  StrUtils,
  Variaveis in 'Variaveis.pas',
  Arrays in 'Arrays.pas',
  Records in 'Records.pas',
  ClasseConta in 'ClasseConta.pas',
  ProvaDeSelecao in 'ProvaDeSelecao.pas';

begin
  try
    { TODO -oUser -cConsole Main : Insert code here }
    WriteLn('Hello World!');
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
  Readln;
end.
