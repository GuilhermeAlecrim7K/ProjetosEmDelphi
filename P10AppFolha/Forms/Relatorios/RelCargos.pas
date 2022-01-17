unit RelCargos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, Conexao, Vcl.StdCtrls,
  Vcl.ExtCtrls;

type
  TFrmListaCargos = class(TForm)
    DbgCargos: TDBGrid;
    DtsCargos: TDataSource;
    QryCargos: TFDQuery;
    ChkBoxMostrarInativos: TCheckBox;
    QryCargosCODIGO: TStringField;
    QryCargosNOME: TStringField;
    QryCargosSALARIO_BASE: TFloatField;
    QryCargosSTATUS: TStringField;
    LblEdtNomeCargo: TLabeledEdit;
    BtnPesquisar: TButton;
    BtnLimparPesquisa: TButton;
    procedure FormCreate(Sender: TObject);
    procedure QryCargosSTATUSGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure QryCargosSALARIO_BASEGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure BtnPesquisarClick(Sender: TObject);
    procedure BtnLimparPesquisaClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure DbgCargosTitleClick(Column: TColumn);
  private
    { Private declarations }
    const FMainQuery = 'SELECT * FROM CARGOS ';
    var FQueryConditional: string;
    function GetQuery: string;
  public
    { Public declarations }
  end;

var
  FrmListaCargos: TFrmListaCargos;

implementation

{$R *.dfm}

procedure TFrmListaCargos.BtnLimparPesquisaClick(Sender: TObject);
begin
  LblEdtNomeCargo.Text:= '';
  FQueryConditional:= 'WHERE STATUS = 1';
  ChkBoxMostrarInativos.Checked:= False;
  QryCargos.Open(GetQuery);
end;

procedure TFrmListaCargos.BtnPesquisarClick(Sender: TObject);
begin
  FQueryConditional:= 'WHERE ';
  if LblEdtNomeCargo.Text <> '' then
    FQueryConditional:= FQueryConditional + 'NOME LIKE ' + QuotedStr('%' + LblEdtNomeCargo.Text + '%') + ' AND ';
  if not ChkBoxMostrarInativos.Checked then
    FQueryConditional:= FQueryConditional + 'STATUS = 1'
  else
    FQueryConditional:= FQueryConditional + '(STATUS = 1 OR STATUS = 0)';
  QryCargos.Open(GetQuery);
end;

procedure TFrmListaCargos.DbgCargosTitleClick(Column: TColumn);
begin
  QryCargos.IndexFieldNames:= Column.FieldName;
end;

procedure TFrmListaCargos.FormCreate(Sender: TObject);
begin
  FQueryConditional:= 'WHERE STATUS = 1';
  QryCargos.Open(GetQuery);
end;

procedure TFrmListaCargos.FormDestroy(Sender: TObject);
begin
  QryCargos.Close;
end;

function TFrmListaCargos.GetQuery: string;
begin
  Result:= FMainQuery + FQueryConditional;
end;

procedure TFrmListaCargos.QryCargosSALARIO_BASEGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
    try
      Text:= Format('%m', [Sender.AsCurrency]);
    except
      Text:= 'Sem Registro';
    end;
end;

procedure TFrmListaCargos.QryCargosSTATUSGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  Text:= 'Ativo';
  if Trim(Sender.AsString) <> '' then
    begin
      if Sender.AsInteger = 0 then
        Text:= 'Inativo'
    end
  else
    Text:= 'Sem Registro';
end;

end.
