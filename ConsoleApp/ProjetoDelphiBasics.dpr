program ProjetoDelphiBasics;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Variaveis in 'Variaveis.pas',
  Arrays in 'Arrays.pas',
  Records in 'Records.pas',
  ClasseConta in 'ClasseConta.pas';

var
  I: Integer;
begin
  try
    { TODO -oUser -cConsole Main : Insert code here }
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
  Readln;
end.
