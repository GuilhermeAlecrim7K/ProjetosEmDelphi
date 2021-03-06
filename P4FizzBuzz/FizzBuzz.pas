unit FizzBuzz;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

function FizzBuzzPrinter(const I, Fizz, Buzz: integer): string;

type
  TForm1 = class(TForm)
    BotaoFizzBuzz: TButton;
    Memo1: TMemo;
    BotaoEdicao: TButton;
    EditFizz: TLabeledEdit;
    EditBuzz: TLabeledEdit;
    EditLimite: TLabeledEdit;
    procedure BotaoFizzBuzzClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

var
  F: integer = 3;
  B: integer = 5;
  L: integer = 100;

{$R *.dfm}

function FizzBuzzPrinter(const I, Fizz, Buzz: integer): string;
var
  S: string;
const
  StrFizz = 'Fizz';
  StrBuzz = 'Buzz';
begin
  S:= '';
  if (I mod Fizz = 0) then
    S:= S + StrFizz;
  if (I mod Buzz = 0) then
    S:= S + StrBuzz;
  if S = '' then
    S:= IntToStr(I);
  Result:= S;
end;

procedure TForm1.BotaoFizzBuzzClick(Sender: TObject);
var I: integer;
begin
  F:= StrToInt(EditFizz.Text);
  B:= StrToInt(EditBuzz.Text);
  L:= StrToInt(EditLimite.Text);
  Memo1.Lines.Clear;
  for I := 1 to L do
    Memo1.Lines.Add(FizzBuzzPrinter(I, F , B));
  EditFizz.Enabled:= True; EditBuzz.Enabled:= True;
end;

end.
