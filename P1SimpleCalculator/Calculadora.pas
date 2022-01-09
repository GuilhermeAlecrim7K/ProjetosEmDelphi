unit Calculadora;

interface

{
To do list
- menu do histórico (outro form com iteração no array history incluindo cada linha?)
- Criar classe calculadora em outra unit e passar os métodos e propriedades para lá.
  - o limite de caracteres deve ser feito no form
  - utilizar duas strings para guardar os valores para history
- Possibilitar o uso do teclado para digitar os números
}

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, UnitCalculos;

type
  EOperation = (Soma, Subtracao, Multiplicacao, Divisao);
  ELastButton = (Operador, Numero);

  TFrmPrincipal = class(TForm)
    MemPainel: TMemo;
    Btn1: TButton;
    Btn2: TButton;
    Btn3: TButton;
    Btn4: TButton;
    Btn5: TButton;
    Btn6: TButton;
    Btn7: TButton;
    Btn8: TButton;
    Btn9: TButton;
    Btn0: TButton;
    BtnVirgula: TButton;
    BtnDivisao: TButton;
    BtnMultiplicacao: TButton;
    BtnSubtracao: TButton;
    BtnAdicao: TButton;
    BtnClear: TButton;
    BtnClearLast: TButton;
    BtnIgual: TButton;
    procedure FormCreate(Sender: TObject);
    procedure BtnClearClick(Sender: TObject);
    procedure BtnClearLastClick(Sender: TObject);
    procedure BtnIgualClick(Sender: TObject);
    procedure Btn1Click(Sender: TObject);
    procedure Btn2Click(Sender: TObject);
    procedure Btn3Click(Sender: TObject);
    procedure Btn4Click(Sender: TObject);
    procedure Btn5Click(Sender: TObject);
    procedure Btn6Click(Sender: TObject);
    procedure Btn7Click(Sender: TObject);
    procedure Btn8Click(Sender: TObject);
    procedure Btn9Click(Sender: TObject);
    procedure Btn0Click(Sender: TObject);
    procedure BtnVirgulaClick(Sender: TObject);
    procedure BtnAdicaoClick(Sender: TObject);
    procedure BtnSubtracaoClick(Sender: TObject);
    procedure BtnMultiplicacaoClick(Sender: TObject);
    procedure BtnDivisaoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function GetInputValue: extended;
    function CheckLineMax(text1, text2: string):string;
    procedure UpdateLine0; overload;
    procedure UpdateLine0(value: string); overload;
    procedure UpdateLine1; overload;
    procedure UpdateLine1(value: string); overload;
    procedure ChangeLine1(value: string);
    procedure CalculaResultado(Operation: EOperation);
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

var
  var1, var2, resultado: extended;
  MustChange, IsFirstOperation: boolean;
  History: array of string;
  LastOperation: EOperation;
  LastButton: ELastButton;

{$R *.dfm}

function TFrmPrincipal.GetInputValue: extended;
begin
  Result:= StrToFloat(MemPainel.Lines[1]);
end;

function TFrmPrincipal.CheckLineMax(text1, text2: string):string;
var
len1, len2, sumOfLen: byte;
begin
  len1:= Length(text1); len2:= length(text2);
  SumOfLen:= len1 + len2;
  if (len1 + len2 > 25) then
      Result:= '<<' + Copy(text1, sumOfLen - 23, High(text1)) + text2
  else
		Result:= text1 + text2;
end;

procedure TFrmPrincipal.UpdateLine0;
begin
  MemPainel.Lines[0]:= CheckLineMax(MemPainel.Lines[0], MemPainel.Lines[1]);
end;

procedure TFrmPrincipal.UpdateLine0(value: string);
begin
  MemPainel.Lines[0]:= CheckLineMax(MemPainel.Lines[0], value);
end;

procedure TFrmPrincipal.UpdateLine1;
begin
  MemPainel.Lines[1]:= FloatToStr(resultado);
end;

procedure TFrmPrincipal.UpdateLine1(value: string);
begin
  MemPainel.Lines[1]:= MemPainel.Lines[1] + value;
  LastButton:= Numero;
end;

procedure TFrmPrincipal.ChangeLine1(value: string);
begin
  MemPainel.Lines[1]:= value;
  MustChange:= False;
  LastButton:= Numero;
end;

procedure TFrmPrincipal.CalculaResultado(Operation: EOperation);
begin
  //var1:= resultado;
  //var2:= GetInputValue;
  //MustChange:= True;
  if IsFirstOperation then
    begin
      var1:= GetInputValue;
      IsFirstOperation:= False;
    end
  else
    begin
      var2:= GetInputValue;
        case LastOperation of
          Soma:
            resultado:= Somar(var1, var2);
          Subtracao:
            resultado:= Subtrair(var1, var2);
          Divisao:
            if (var2 = 0) then
              MemPainel.Lines[1]:= 'Impossível dividir por zero'
            else
              resultado:= Dividir(var1, var2);
          Multiplicacao:
            resultado:= Multiplicar(var1, var2);
        end;
      var1:= resultado;
    end;
  MemPainel.Lines[1]:= FloatToStr(var1);
  LastOperation:= Operation;
  MustChange:= True;
  LastButton:= Operador;
end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
  SetLength(History, 0);
  MemPainel.Lines.Clear;
  MemPainel.Lines.Add('');
  MemPainel.Lines.Add('0');
  var1:= 0 ; var2:= 0; resultado:= 0;
  MustChange:= True; IsFirstOperation:= True;
end;

procedure TFrmPrincipal.Btn0Click(Sender: TObject);
begin
  if MustChange then
    MemPainel.Lines[1]:= '0'
  else if (MemPainel.Lines[1] <> '0') then
    begin
    UpdateLine1('0');
    MustChange:= False;
    end;
end;

procedure TFrmPrincipal.Btn1Click(Sender: TObject);
begin
  if MustChange then
    ChangeLine1('1')
  else
    UpdateLine1('1');
end;

procedure TFrmPrincipal.Btn2Click(Sender: TObject);
begin
  if MustChange then
    ChangeLine1('2')
  else
    UpdateLine1('2');
end;

procedure TFrmPrincipal.Btn3Click(Sender: TObject);
begin
  if MustChange then
    ChangeLine1('3')
  else
    UpdateLine1('3');
end;

procedure TFrmPrincipal.Btn4Click(Sender: TObject);
begin
  if MustChange then
    ChangeLine1('4')
  else
    UpdateLine1('4');
end;

procedure TFrmPrincipal.Btn5Click(Sender: TObject);
begin
  if MustChange then
    ChangeLine1('5')
  else
    UpdateLine1('5');
end;

procedure TFrmPrincipal.Btn6Click(Sender: TObject);
begin
  if MustChange then
    ChangeLine1('6')
  else
    UpdateLine1('6');
end;

procedure TFrmPrincipal.Btn7Click(Sender: TObject);
begin
  if MustChange then
    ChangeLine1('7')
  else
    UpdateLine1('7');
end;

procedure TFrmPrincipal.Btn8Click(Sender: TObject);
begin
  if MustChange then
    ChangeLine1('8')
  else
    UpdateLine1('8');
end;

procedure TFrmPrincipal.Btn9Click(Sender: TObject);
begin
  if MustChange then
    ChangeLine1('9')
  else
    UpdateLine1('9');
end;

procedure TFrmPrincipal.BtnVirgulaClick(Sender: TObject);
begin
  if MustChange then
    ChangeLine1('0,')
  else
    UpdateLine1(',');
end;

procedure TFrmPrincipal.BtnClearClick(Sender: TObject);
begin
  MemPainel.Lines[0]:= ' ';
  MemPainel.Lines[1]:= '0';
  MustChange:= True;
  IsFirstOperation:= True;
  resultado:= 0;
end;

procedure TFrmPrincipal.BtnClearLastClick(Sender: TObject);
begin
  MemPainel.Lines[1]:= '0';
  MustChange:= True;
end;

procedure TFrmPrincipal.BtnAdicaoClick(Sender: TObject);
begin
  if (LastButton = Operador) then
  begin
    LastOperation:= Soma;
    MemPainel.Lines[0]:= Copy(MemPainel.Lines[0], 1, High(MemPainel.Lines[0]) - 3) + ' + ';
  end
  else
  begin
    UpdateLine0(MemPainel.Lines[1] + ' + ');
    CalculaResultado(Soma);
  end;
end;

procedure TFrmPrincipal.BtnSubtracaoClick(Sender: TObject);
begin
  if (LastButton = Operador) then
  begin
    LastOperation:= Subtracao;
    MemPainel.Lines[0]:= Copy(MemPainel.Lines[0], 1, High(MemPainel.Lines[0]) - 3) + ' - ';
  end
  else
  begin
  UpdateLine0(MemPainel.Lines[1] + ' - ');
  CalculaResultado(Subtracao);
  end;
end;

procedure TFrmPrincipal.BtnMultiplicacaoClick(Sender: TObject);
begin
  if (LastButton = Operador) then
  begin
    LastOperation:= Multiplicacao;
    MemPainel.Lines[0]:= Copy(MemPainel.Lines[0], 1, High(MemPainel.Lines[0]) - 3) + ' * ';
  end
  else
  begin
    UpdateLine0(MemPainel.Lines[1] + ' * ');
    CalculaResultado(Multiplicacao);
  end;
end;

procedure TFrmPrincipal.BtnDivisaoClick(Sender: TObject);
begin
  if (LastButton = Operador) then
  begin
    LastOperation:= Divisao;
    MemPainel.Lines[0]:= Copy(MemPainel.Lines[0], 1, High(MemPainel.Lines[0]) - 3) + ' / ';
  end
  else
  begin
    UpdateLine0(MemPainel.Lines[1] + ' / ');
    CalculaResultado(Divisao);
  end;
end;

procedure TFrmPrincipal.BtnIgualClick(Sender: TObject);
begin
  UpdateLine0;
  SetLength(History,Length(History) +1);
  History[High(History)]:= MemPainel.Lines[0];
  CalculaResultado(LastOperation);
  MemPainel.Lines[0]:= '';
  MemPainel.Lines[1]:= FloatToStr(resultado);
  IsFirstOperation:= True;
end;

end.
