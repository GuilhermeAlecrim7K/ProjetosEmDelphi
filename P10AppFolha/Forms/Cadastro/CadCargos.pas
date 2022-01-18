unit CadCargos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Conexao, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  Vcl.Menus, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls;

type
  TFrmCadastroCargos = class(TForm)
    DtsCadCargos: TDataSource;
    MainMenu1: TMainMenu;
    MenuHeadListaCargos: TMenuItem;
    QryCadCargos: TFDQuery;
    BtnSalvar: TButton;
    QryCadCargosCODIGO: TStringField;
    QryCadCargosNOME: TStringField;
    QryCadCargosSALARIO_BASE: TFloatField;
    QryCadCargosSTATUS: TStringField;
    DbChkBoxStatusAtivo: TDBCheckBox;
    LblCodigoCargo: TLabel;
    DbEdtCodigoInclusao: TDBEdit;
    LblTituloCargo: TLabel;
    DbEdtTituloInclusao: TDBEdit;
    BtnCancelar: TButton;
    LblSalarioBaseCargo: TLabel;
    DbEdtSalarioBaseInclusao: TDBEdit;
    PgCtrCadCargos: TPageControl;
    TabInclusao: TTabSheet;
    TabEdicao: TTabSheet;
    EdtPesquisar: TEdit;
    BtnPesquisar: TButton;
    DbgEdicao: TDBGrid;
    PnlEdicao: TPanel;
    Label1: TLabel;
    DBEdtCodigoEdicao: TDBEdit;
    Label2: TLabel;
    DbEdtTituloEdicao: TDBEdit;
    DbChkBoxAtivoEdicao: TDBCheckBox;
    QryCadCargosCALC_STATUS: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure MenuHeadListaCargosClick(Sender: TObject);
    procedure SetSQLState(Sender: TObject);
    procedure BtnPesquisarClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure CheckCamposInclusao(Sender: TObject);
    procedure DbgEdicaoColEnter(Sender: TObject);
    procedure QryCadCargosCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    FQryCodigo: string;
    FQryTituloCargo: string;
    FQrySalarioBase: currency;
    FIndexErro: byte;
    procedure LimparCampos;
    function QueryReadyToPost(out AMsg: string): boolean;
  public
    { Public declarations }
  end;

var
  FrmCadastroCargos: TFrmCadastroCargos;

implementation

uses
  RelCargos, Procedimentos;

{$R *.dfm}

procedure TFrmCadastroCargos.FormCreate(Sender: TObject);
begin
  FrmListaCargos:= TFrmListaCargos.Create(Self);
  PgCtrCadCargos.ActivePage:= TabInclusao;
  QryCadCargos.Open;
  QryCadCargos.Append;
end;

procedure TFrmCadastroCargos.FormDestroy(Sender: TObject);
begin
  QryCadCargos.Cancel;
  QryCadCargos.Close;
  FrmListaCargos.Free;
end;

procedure TFrmCadastroCargos.MenuHeadListaCargosClick(
  Sender: TObject);
begin
  FrmListaCargos.Show;
end;

procedure TFrmCadastroCargos.QryCadCargosCalcFields(
  DataSet: TDataSet);
begin
  if QryCadCargosSTATUS.AsInteger = 1 then
    QryCadCargosCALC_STATUS.AsString:= 'Ativo'
  else
    QryCadCargosCALC_STATUS.AsString:= 'Inativo';
end;

function TFrmCadastroCargos.QueryReadyToPost(out AMsg: string): boolean;
begin
  FQryCodigo:= QryCadCargosCODIGO.AsString;
  FQryTituloCargo:= QryCadCargosNOME.AsString;
  FQrySalarioBase:= QryCadCargosSALARIO_BASE.AsCurrency;
  Result:= ValidarCamposCadastroCargo(FQryCodigo, FQryTituloCargo, FQrySalarioBase, FIndexErro, AMsg);
end;

procedure TFrmCadastroCargos.BtnPesquisarClick(Sender: TObject);
var
  Query: string; 
begin
  Query:= 'SELECT * FROM CARGOS WHERE NOME LIKE ' + QuotedStr('%' + EdtPesquisar.Text + '%');
  QryCadCargos.Open(Query);
  if QryCadCargos.IsEmpty then
    begin
      PnlEdicao.Visible:= False;
    end
  else
    begin
      PnlEdicao.Visible:= True;
      QryCadCargos.Edit;
    end;
end;

procedure TFrmCadastroCargos.LimparCampos;
begin
  //PgCtrCadCargos.FindNextPage(PgCtrCadCargos.ActivePage, True, False).Visible:= True;
  //Componentes de Inclusão
  DbEdtCodigoInclusao.Clear;
  DbEdtTituloInclusao.Clear;
  DbEdtSalarioBaseInclusao.Text:= '1212,00';
  DbChkBoxStatusAtivo.Checked:= False;

  //Componentes de edição 
  PnlEdicao.Visible:= False;
  EdtPesquisar.Text:= '';

  BtnSalvar.Enabled:= False;
  FrmCadastroCargos.SetFocus;
end;

procedure TFrmCadastroCargos.SetSQLState(Sender: TObject);
begin
  QryCadCargos.Cancel;
  if PgCtrCadCargos.ActivePage = TabInclusao then
    begin
      FrmCadastroCargos.Height:= 250;
      QryCadCargos.Open('SELECT * FROM CARGOS');
      QryCadCargos.Append;
    end
  else
    begin
      FrmCadastroCargos.Height:= 360;
      QryCadCargos.Open;
      QryCadCargos.Edit;
      FrmCadastroCargos.SetFocus;
    end;
end;

procedure TFrmCadastroCargos.BtnSalvarClick(Sender: TObject);
var
  EndMessage: string;
begin
  if QryCadCargos.State in [dsInsert, dsEdit] then
    begin
      if not QueryReadyToPost(EndMessage) then
        raise Exception.Create(EndMessage);
      if QryCadCargos.State = dsInsert then
        ShowMessage('Cadastro concluído com sucesso')
      else
        ShowMessage('Cadastro editado com sucesso');
      QryCadCargos.Post;
      LimparCampos;
    end;
end;

procedure TFrmCadastroCargos.CheckCamposInclusao(Sender: TObject);
var
  EndMessage: string;
begin
  if QueryReadyToPost(EndMessage) then
    BtnSalvar.Enabled:= True
  else
    BtnSalvar.Enabled:= False;
end;

procedure TFrmCadastroCargos.DbgEdicaoColEnter(Sender: TObject);
begin
  if QryCadCargos.IsEmpty then
  begin
    PnlEdicao.Visible:= False;
    BtnSalvar.Enabled:= False;
  end
  else
  begin
    PnlEdicao.Visible:= True;
    BtnSalvar.Enabled:= True;
  end;
end;

procedure TFrmCadastroCargos.BtnCancelarClick(Sender: TObject);
begin
  if QryCadCargos.State in [dsInsert, dsEdit] then
    begin
      //MsgDialog Tem certeza que deseja cancelar a operação?
      QryCadCargos.Cancel;
    end;
  LimparCampos;
  SetSQLState(Sender);
end;

end.
