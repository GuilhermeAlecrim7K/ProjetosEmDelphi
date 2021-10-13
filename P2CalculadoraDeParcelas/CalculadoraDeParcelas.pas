unit CalculadoraDeParcelas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, Math, Vcl.Mask;

type
  TMainForm = class(TForm)
    BotaoCalcular: TButton;
    ComboBoxQuantidadeDeParcelas: TComboBox;
    MemoDemonstrativoDeParcelas: TMemo;
    EditValorTotalDoProduto: TMaskEdit;
    BotaoConfirmar: TButton;
    LabelValorMin: TLabel;
    procedure BotaoCalcularClick(Sender: TObject);
    procedure EditValorTotalDoProdutoChange(Sender: TObject);
    procedure BotaoConfirmarClick(Sender: TObject);
    procedure ComboBoxQuantidadeDeParcelasSelect(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    ValorOriginal: currency;
    ValorFinal: currency;
    QtdDeParcelas: integer;
    ValorDasParcelas: currency;
    PrimeiraParcela: currency;
    TemParcelasDiferentes: boolean;
  end;

var
  MainForm: TMainForm;

const
  JurosAM = 0.016;


implementation

{$R *.dfm}

procedure TMainForm.EditValorTotalDoProdutoChange(Sender: TObject);
begin
  ComboBoxQuantidadeDeParcelas.Enabled := True;
  ComboBoxQuantidadeDeParcelas.ItemIndex := -1;
  MemoDemonstrativoDeParcelas.Lines.Clear;
  BotaoConfirmar.Enabled := False;
end;

procedure TMainForm.ComboBoxQuantidadeDeParcelasSelect(Sender: TObject);
begin
  BotaoConfirmar.Enabled := False;
  if ComboBoxQuantidadeDeParcelas.ItemIndex = 12 then
  begin
    QtdDeParcelas := StrToInt(inputbox('Definir número de parcelas', 'Digite a quantidade de parcelas desejada: ', '15'));
    //Aqui pode-se definir um máximo de parcelas ou regra de prevenção de erro de input do usuário
    MemoDemonstrativoDeParcelas.Lines.Insert(2, 'Juros = ' + FloatToStr(JurosAM))
  end
  else
    QtdDeParcelas := ComboBoxQuantidadeDeParcelas.ItemIndex +1;
  ValorOriginal:= StrToCurr(EditValorTotalDoProduto.Text)/100;
  if ValorOriginal>0 then
    begin
      BotaoCalcular.Enabled := True;
    end;
end;

procedure TMainForm.BotaoCalcularClick(Sender: TObject);
begin
  ValorDasParcelas:= Math.Roundto(ValorOriginal/QtdDeParcelas, -2);
  MemoDemonstrativoDeParcelas.Lines.Clear;
  MemoDemonstrativoDeParcelas.Visible := True;
  BotaoConfirmar.Enabled := True;
  BotaoConfirmar.Visible := True;
  //MemoDemonstrativoDeParcelas.Lines.Add('');
  if QtdDeParcelas*ValorDasParcelas = ValorOriginal then
    begin
      MemoDemonstrativoDeParcelas.Lines.Add(CurrToStr(QtdDeParcelas)+ 'x de: ' + Format('%m', [ValorDasParcelas]));
      TemParcelasDiferentes:= False;
      PrimeiraParcela:= 0;
    end
  else
    begin
      PrimeiraParcela := ValorDasParcelas + (ValorOriginal - QtdDeParcelas*ValorDasParcelas);
      TemParcelasDiferentes:= True;
      MemoDemonstrativoDeParcelas.Lines.Add('1x de: ' + Format('%m', [PrimeiraParcela]));
      MemoDemonstrativoDeParcelas.Lines.Add('+ ' + IntToStr(QtdDeParcelas - 1) + 'x de: ' + Format('%m', [ValorDasParcelas]));
    end;
  if QtdDeParcelas > 12 then
    begin
      MemoDemonstrativoDeParcelas.Lines.Add('Taxa de Juros: ' + Format('%f%%', [JurosAM*100]));
      MemoDemonstrativoDeParcelas.Lines.Add('Valor total com Juros: ' + Format('%m', [ValorOriginal + ValorOriginal*JurosAM]))
    end;

end;

procedure TMainForm.BotaoConfirmarClick(Sender: TObject);
begin
  ShowMessage(Format('Obrigado por sua compra. O valor total foi de: %m.', [ValorOriginal]));
  //Ajustar linha acima que falta apresentar valor com juros
  EditValorTotalDoProduto.text:= '';
  MemoDemonstrativodeParcelas.Visible:= False;
  BotaoConfirmar.Visible:= False;
  BotaoCalcular.Enabled:= False;
  ComboBoxQuantidadeDeParcelas.Enabled:= False;
  ComboBoxQuantidadeDeParcelas.Items.Delete(13)
end;

end.
