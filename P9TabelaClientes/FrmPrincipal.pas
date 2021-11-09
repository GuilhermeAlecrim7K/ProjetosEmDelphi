unit FrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, FrmDados;

type
  TMainForm = class(TForm)
    StrGrdClientes: TStringGrid;
    Incluir: TButton;
    BtnExcluir: TButton;
    EdtEditar: TButton;
    procedure FormCreate(Sender: TObject);
    procedure IncluirClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure EdtEditarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  procedure GetNewClient;
  procedure UpdateClient (Row: integer);

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

var
  LastRow: integer;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  StrGrdClientes.RowCount:= 1;
  LastRow:= 1;
  StrGrdClientes.Cells[0,0]:= 'Nº Cliente';
  StrGrdClientes.ColWidths[0]:= 80;
  StrGrdClientes.Cells[1,0]:= 'Nome';
  StrGrdClientes.ColWidths[1]:= 180;
  StrGrdClientes.Cells[2,0]:= 'Telefone';
  StrGrdClientes.ColWidths[2]:= 100;
  StrGrdClientes.Cells[3,0]:= 'Data de Nascimento';
  StrGrdClientes.ColWidths[3]:= 120;
  StrGrdClientes.Cells[4,0]:= 'Naturalidade';
  StrGrdClientes.ColWidths[4]:= 130;
end;

procedure GetNewClient;
var
  I: TDadosCliente;
begin
  for I := Low(NovoRegistro) to High(NovoRegistro) do
    MainForm.StrGrdClientes.Cells[Ord(I), LastRow] := NovoRegistro[I];
  LastRow:= LastRow +1;
end;

procedure TMainForm.IncluirClick(Sender: TObject);
begin
  FrmInclusao:= TFrmInclusao.Create(MainForm);
  try
    FrmInclusao.ShowModal;
    GetNewClient;
    StrGrdClientes.RowCount:= LastRow;
  finally
    FrmInclusao.Free;
  end;
end;

procedure UpdateClient (Row: integer);
var
  I: TDadosCliente;
begin
  FrmInclusao.EdtNumCliente.Text:= MainForm.StrGrdClientes.Cells[0, Row];
  FrmInclusao.EdtNomeCliente.Text:= MainForm.StrGrdClientes.Cells[1, Row];
  FrmInclusao.EdtTelefone.Text:= MainForm.StrGrdClientes.Cells[2, Row];
  FrmInclusao.BoxDataNascimento.Date:= StrToDateTime(MainForm.StrGrdClientes.Cells[3, Row]);
  FrmInclusao.CmbBoxNaturalidade.Text:= MainForm.StrGrdClientes.Cells[4, Row];
  FrmInclusao.ShowModal;
  for I := Low(NovoRegistro) to High(NovoRegistro) do
    MainForm.StrGrdClientes.Cells[Ord(I), Row] := FrmDados.NovoRegistro[I];
end;

procedure TMainForm.EdtEditarClick(Sender: TObject);
var
  EditRow: integer;
begin
  if StrGrdClientes.Row > 0 then
  begin
    EditRow:= StrGrdClientes.Row;
    FrmInclusao:= TFrmInclusao.Create(MainForm);
    try
      UpdateClient (EditRow);
    finally
      FrmInclusao.Free;
    end;
  end;
end;

procedure TMainForm.BtnExcluirClick(Sender: TObject);
var
  I, RemoveRow: byte;
begin
  if StrGrdClientes.Row > 0 then
    begin
    RemoveRow:= StrGrdClientes.Row;
    for I := RemoveRow to LastRow-1 do
      begin
        StrGrdClientes.Rows[I]:= StrGrdClientes.Rows[I + 1];
      end;
    StrGrdClientes.Rows[LastRow].Clear;
    LastRow:= LastRow -1;
    StrGrdClientes.RowCount:= LastRow;
    end;

end;

end.
