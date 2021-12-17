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
    CmbBoxOperation: TComboBox;
    CaixaDeResultado: TEdit;
    procedure botao1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  EOperation = (Soma = 0, Subtracao, Multiplicacao, Divisao);

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.botao1Click(Sender: TObject);
var
  V1, V2: Integer;
  Result: Extended;
  Operador: EOperation;
begin
  V1 := StrToInt(Campo1.Text);
  V2 := StrToInt(Campo2.Text);
  Operador:= EOperation(CmbBoxOperation.ItemIndex);
  case Operador of
    Soma:
      Result := V1 + V2;
    Subtracao:
      Result := V1 - V2;
    Multiplicacao:
      Result := V1 * V2 ;
    Divisao:
      Result := V1 / V2;
  end;
  CaixaDeResultado.Text := 'Resultado = ' + FloatToStr(Result);
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ShowMessage('Fim de Execução')
end;

end.
