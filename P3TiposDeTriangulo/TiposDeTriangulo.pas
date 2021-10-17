unit TiposDeTriangulo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

function VerifTriang(const x, y, z : integer): string;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Label1: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

const
  Resultado = 'Resultado = ';
  Isosceles = 'É isósceles';
  Escaleno = 'É escaleno';
  Equilatero = 'É equilátero';
  NotTriangulo = 'Não é um triângulo';

implementation

{$R *.dfm}

  function VerifTriang(const x, y, z : integer): string;
    begin
      if (x + y <= z) or (x + z <= y) or (y + z <= x) then
        Result:= NotTriangulo
      else if (x = y) and (x = z) then
        Result:= Equilatero
      else if (x = y) or (x = z) or (y = z) then
        Result:= Isosceles
      else
        Result:= Escaleno;
    end;



procedure TForm1.Button1Click(Sender: TObject);
begin
  Label1.Caption:= Resultado + VerifTriang(StrtoInt(Edit1.Text), StrToInt(Edit2.Text), StrToInt(Edit3.Text));
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  edit1.text := '';
  edit2.text := '';
  edit3.text := '';
  label1.Caption := Resultado;
end;

end.
