unit CalculadoraTeste;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    botao1: TButton;
    Campo1: TEdit;
    Campo2: TEdit;
    Operador: TComboBox;
    CaixaDeResultado: TEdit;
    procedure botao1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.botao1Click(Sender: TObject);
var
  V1, V2,  Result : Integer;
begin
  V1 := StrToInt(Campo1.Text);
  V2 := StrToInt(Campo2.Text);
  if Operador.ItemIndex = 0 then
    Result := V1 + V2;
  if Operador.ItemIndex = 1 then
    Result := V1 - V2;
  if Operador.ItemIndex = 2 then
    Result := V1 * V2;
  if Operador.ItemIndex = 3 then
    Result := Trunc(V1 / V2);
  CaixaDeResultado.Text := 'Resultado = ' + IntToStr(Result);
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ShowMessage('Tem certeza que quer fechar essa maravilha de aplica��o?')
end;

end.
