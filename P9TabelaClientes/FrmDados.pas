unit FrmDados;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Buttons, Vcl.Mask, Vcl.ComCtrls;

type
  TFrmInclusao = class(TForm)
    LblNumCliente: TLabel;
    LblNome: TLabel;
    EdtNomeCliente: TEdit;
    LblTelefone: TLabel;
    LblDataNascimento: TLabel;
    LblNaturalidade: TLabel;
    BtnRegistrar: TButton;
    BtnGerarNumCliente: TSpeedButton;
    EdtNumCliente: TEdit;
    EdtTelefone: TMaskEdit;
    CmbBoxNaturalidade: TComboBox;
    BoxDataNascimento: TDateTimePicker;
    procedure BtnRegistrarClick(Sender: TObject);
    procedure BtnGerarNumClienteClick(Sender: TObject);
    function CamposVazios: boolean;
    procedure EdtTelefoneEnter(Sender: TObject);
    procedure EdtTelefoneExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TDadosCliente = (Num, Nome, Telefone, DataNascimento, Naturalidade);

  //Criar variável TDadosCliente para automatizar o procedimento de guardar os valores dos Edits no array;

var
  FrmInclusao: TFrmInclusao;
  NovoRegistro: array [TDadosCliente] of string;
  FezInclusao: boolean;

implementation

{$R *.dfm}

procedure TFrmInclusao.EdtTelefoneEnter(Sender: TObject);
begin
  EdtTelefone.EditMask:= '!\(99\)0 0000-0000;1;_';
end;

procedure TFrmInclusao.EdtTelefoneExit(Sender: TObject);
begin
  EdtTelefone.EditMask:= '';
end;

procedure TFrmInclusao.BtnGerarNumClienteClick(Sender: TObject);
begin
  EdtNumCliente.Text:= Format('%.8d', [Random(99999999)]);
end;

function TFrmInclusao.CamposVazios: boolean;
var
  NumIsZero, NomeIsEmpty, TelefoneIsEmpty: boolean;
begin
  NumIsZero:= EdtNumCliente.Text = '00000000';
  NomeIsEmpty:= Trim(EdtNomeCliente.Text) = '';
  TelefoneIsEmpty:= EdtTelefone.Text = '';
  if NumIsZero or NomeIsEmpty or TelefoneIsEmpty then
    Result:= True
  else
    Result:= False;
end;

procedure TFrmInclusao.BtnRegistrarClick(Sender: TObject);
begin
  if not CamposVazios then
    begin
    NovoRegistro[Num]:= EdtNumCliente.Text;
    NovoRegistro[Nome]:= EdtNomeCliente.Text;
    NovoRegistro[Telefone]:= EdtTelefone.Text;
    NovoRegistro[DataNascimento]:= DateTimeToStr(BoxDataNascimento.DateTime);
    NovoRegistro[Naturalidade]:= CmbBoxNaturalidade.Text;
    FezInclusao:= True
    end
  else
    raise Exception.Create('Preencha todos os campos antes de prosseguir.');
    FrmInclusao.Close;
end;

end.
