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
    procedure BotaoCalcularClick(Sender: TObject);
    procedure ComboBoxQuantidadeDeParcelasChange(Sender: TObject);
    procedure EditValorTotalDoProdutoChange(Sender: TObject);
    procedure BotaoConfirmarClick(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    ValorTotal: currency;
    QtdDeParcelas: integer;
    ValorDasParcelas: currency;
    PrimeiraParcela: currency;
    TemParcelasDiferentes: boolean;
  end;

var
  MainForm: TMainForm;


implementation

{$R *.dfm}

procedure TMainForm.EditValorTotalDoProdutoChange(Sender: TObject);
begin
  ComboBoxQuantidadeDeParcelas.Enabled := True;
  ComboBoxQuantidadeDeParcelas.ItemIndex := -1;
  MemoDemonstrativoDeParcelas.Lines.Clear;
  BotaoConfirmar.Enabled := False;
end;

procedure TMainForm.ComboBoxQuantidadeDeParcelasChange(Sender: TObject);
begin
  ValorTotal:= StrToCurr(EditValorTotalDoProduto.Text)/100;
  QtdDeParcelas:= ComboBoxQuantidadeDeParcelas.ItemIndex +1;
  if ValorTotal>0 then
    begin
      BotaoCalcular.Enabled := True;
    end;
end;

procedure TMainForm.BotaoCalcularClick(Sender: TObject);
begin
  ValorDasParcelas:= Math.Roundto(ValorTotal/QtdDeParcelas, -2);
  MemoDemonstrativoDeParcelas.Lines.Clear;
  MemoDemonstrativoDeParcelas.Visible := True;
  BotaoConfirmar.Enabled := True;
  BotaoConfirmar.Visible := True;
  if QtdDeParcelas*ValorDasParcelas = ValorTotal then
    begin
      MemoDemonstrativoDeParcelas.Lines.Add(CurrToStr(QtdDeParcelas)+ 'x de: ' + Format('%m', [ValorDasParcelas]));
      TemParcelasDiferentes:= False;
      PrimeiraParcela:= 0;
    end
  else
    begin
      PrimeiraParcela := ValorDasParcelas + (ValorTotal - QtdDeParcelas*ValorDasParcelas);
      TemParcelasDiferentes:= True;
      MemoDemonstrativoDeParcelas.Lines.Add('1x de: ' + Format('%m', [PrimeiraParcela]));
      MemoDemonstrativoDeParcelas.Lines.Add('+ ' + IntToStr(QtdDeParcelas - 1) + 'x de: ' + Format('%m', [ValorDasParcelas]));
    end;
end;

procedure TMainForm.BotaoConfirmarClick(Sender: TObject);
begin
  ShowMessage(Format('Obrigado por sua compra. O valor total foi de: %m.', [ValorTotal]));
  EditValorTotalDoProduto.text:= '';
  MemoDemonstrativodeParcelas.Visible:= False;
  BotaoConfirmar.Visible:= False;
  BotaoCalcular.Enabled:= False;
  ComboBoxQuantidadeDeParcelas.Enabled:= False;
end;

end.
