unit Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids,
  Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    StrGrdTabela: TStringGrid;
    EdtNomeProduto: TEdit;
    EdtQtd: TEdit;
    EdtPreco: TEdit;
    BtnInserirProduto: TButton;
    LblEdtValorTotal: TLabeledEdit;
    BtnCancelarItem: TButton;
    procedure FormCreate(Sender: TObject);
    procedure BtnInserirProdutoClick(Sender: TObject);
    procedure BtnCancelarItemClick(Sender: TObject);
    procedure InserirProduto;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  var
  Form1: TForm1;

implementation

{$R *.dfm}

var
  LastLine: integer = 1;
  ValorTotal: Currency = 0;

procedure TForm1.BtnCancelarItemClick(Sender: TObject);
var
  DelLine, ln, cl: Byte;
  sValor: string;
begin
  DelLine:= StrToInt(InputBox('Excluir Produto', 'Qual a linha do produto a ser excluído?',''));
  sValor:= Copy(StrGrdTabela.Cells[4, DelLine], 4, length(StrGrdTabela.Cells[4, DelLine])-3);
  sValor:= sValor;
  ValorTotal:= ValorTotal - StrToCurr(sValor);
  for ln := DelLine to LastLine do
    begin
      for cl := 1 to 4 do
        StrGrdTabela.Cells[cl,ln]:= StrGrdTabela.Cells[cl,ln+1];
    end;
  LastLine:= LastLine -1;
  for cl := 1 to 4 do
    StrGrdTabela.Cells[cl,LastLine].Empty;
  LblEdtValorTotal.Text:= FloatToStr(ValorTotal);
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  I: Integer;
begin
  for I := 1 to 100 do
    StrGrdTabela.Cells[0,I]:= IntToStr(I);
  StrGrdTabela.ColWidths[0]:= 15;
  StrGrdTabela.Cells[1,0]:= 'Produto';
  StrGrdTabela.Cells[2,0]:= 'Qtde.';
  StrGrdTabela.ColWidths[2]:= 40;
  StrGrdTabela.Cells[3,0]:= 'Preço';
  StrGrdTabela.Cells[4,0]:= 'Valor';
  StrGrdTabela.RowCount:= LastLine + 1;
end;

procedure TForm1.InserirProduto;
var
  PQtd: integer; PPreco: currency;
begin
  PQtd:= StrToInt(EdtQtd.Text); PPreco:= StrToFloat(EdtPreco.Text);
  StrGrdTabela.Cells[1, LastLine]:= EdtNomeProduto.Text;
  StrGrdTabela.Cells[2, LastLine]:= EdtQtd.Text;
  StrGrdTabela.Cells[3, LastLine]:= Format('%m', [PPreco]);
  StrGrdTabela.Cells[4, LastLine]:= Format('%m', [PQtd * PPreco]);
  ValorTotal:= ValorTotal + PQtd * PPreco;
end;

procedure TForm1.BtnInserirProdutoClick(Sender: TObject);
begin
  StrGrdTabela.RowCount:= LastLine + 1;
  InserirProduto;
  EdtNomeProduto.Text:= '';
  EdtQtd.Text:= '';
  EdtPreco.Text:= '';
  LastLine:= LastLine + 1;
  LblEdtValorTotal.Text:= Format('%m', [ValorTotal]);
end;

end.
