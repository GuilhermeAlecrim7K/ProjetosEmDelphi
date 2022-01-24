unit CadFuncionarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DBCGrids,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Conexao, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, DateUtils, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, StrUtils;

type
  TFrmCadastroFuncionarios = class(TForm)
    QryFuncionarios: TFDQuery;
    DtsFuncionarios: TDataSource;
    QryFuncionariosCODIGO: TStringField;
    QryFuncionariosNOME: TStringField;
    QryFuncionariosDATA_NASCIMENTO: TStringField;
    QryFuncionariosCONTATO: TStringField;
    QryFuncionariosEMAIL: TStringField;
    QryFuncionariosSTATUS: TStringField;
    PgCtrFuncionarios: TPageControl;
    TabListaFuncionarios: TTabSheet;
    TabOperacoes: TTabSheet;
    QryCargos: TFDQuery;
    DtsCargos: TDataSource;
    QryCargosCODIGO: TStringField;
    QryCargosNOME: TStringField;
    QryCargosSALARIO_BASE: TFloatField;
    QryCargosSTATUS: TStringField;
    QryFuncionariosC_TITULO_CARGO: TStringField;
    QryFuncionariosCOD_CARGO: TStringField;
    LblCodigo: TLabel;
    DbEdtCodigo: TDBEdit;
    LblNome: TLabel;
    DbEdtNome: TDBEdit;
    LblDataNascimento: TLabel;
    LblTelefone: TLabel;
    DbEdtIncluirTelefone: TDBEdit;
    LblCargo: TLabel;
    LblEmail: TLabel;
    DbEdtEmail: TDBEdit;
    DtpDataNascimento: TDateTimePicker;
    LblPadraoEmailCorporativo: TLabel;
    DbLkpCmbBoxCargo: TDBLookupComboBox;
    QryCargosC_COD_NOME: TStringField;
    DbRadGrpStatus: TDBRadioGroup;
    PnlCargoSalario: TPanel;
    LblSalarioInicial: TLabel;
    DbEdtSalarioInicial: TDBEdit;
    BtnSalvar: TButton;
    DbgFuncionarios: TDBGrid;
    QrySalarios: TFDQuery;
    DtsSalarios: TDataSource;
    BtnCancelar: TButton;
    BtnIncluir: TButton;
    BtnEditar: TButton;
    BtnInativar: TButton;
    Edit1: TEdit;
    QryFuncionariosC_STATUS: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure QryCargosCalcFields(DataSet: TDataSet);
    procedure QryFuncionariosCalcFields(DataSet: TDataSet);
    procedure BtnIncluirClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    procedure ChangeToOperacoes;
    procedure ChangeToListaFuncionarios;
  public
    { Public declarations }
  end;

var
  FrmCadastroFuncionarios: TFrmCadastroFuncionarios;

implementation

{$R *.dfm}


procedure TFrmCadastroFuncionarios.BtnCancelarClick(Sender: TObject);
begin
  //Validar se realmente deseja cancelar
  QryFuncionarios.Cancel;
  TabListaFuncionarios.TabVisible:= True;
  TabOperacoes.TabVisible:= False;
end;

procedure TFrmCadastroFuncionarios.BtnIncluirClick(Sender: TObject);
begin
  QryFuncionarios.Append;
  ChangeToOperacoes;
  TabOperacoes.Caption:= 'Novo cadastro';
  PnlCargoSalario.Visible:= True;
  DbRadGrpStatus.ItemIndex:= 0;
  DbLkpCmbBoxCargo.ListFieldIndex:= 0;
end;

procedure TFrmCadastroFuncionarios.BtnSalvarClick(Sender: TObject);
begin
  QryFuncionariosDATA_NASCIMENTO.AsString:= DateTimeToStr(DtpDataNascimento.DateTime);
  QryFuncionarios.Post;
  ChangeToListaFuncionarios;
end;

procedure TFrmCadastroFuncionarios.ChangeToListaFuncionarios;
begin
  TabOperacoes.TabVisible:= False;
  TabListaFuncionarios.TabVisible:= True;
end;

procedure TFrmCadastroFuncionarios.ChangeToOperacoes;
begin
  TabOperacoes.TabVisible:= True;
  TabListaFuncionarios.TabVisible:= False;
end;

procedure TFrmCadastroFuncionarios.FormCreate(Sender: TObject);
begin
  PgCtrFuncionarios.ActivePage:= TabListaFuncionarios;
  TabOperacoes.TabVisible:= False;
  QryCargos.Open;
  QryFuncionarios.Open;
//  QrySalarios.Open;
  DtpDataNascimento.MaxDate:= IncYear(Date, -13);
  DtpDataNascimento.MinDate:= IncYear(Date, -100);
end;

procedure TFrmCadastroFuncionarios.FormDestroy(Sender: TObject);
begin
  QryCargos.Close;
  QryFuncionarios.Cancel;
//  QrySalarios.Close;
  QryFuncionarios.Close;
end;

procedure TFrmCadastroFuncionarios.QryCargosCalcFields(
  DataSet: TDataSet);
begin
  QryCargosC_COD_NOME.AsString:=
  QryCargosCODIGO.AsString + ' - ' + QryCargosNOME.AsString;
end;

procedure TFrmCadastroFuncionarios.QryFuncionariosCalcFields(
  DataSet: TDataSet);
begin
  QryFuncionariosC_STATUS.AsString:=
    IfThen(QryFuncionariosSTATUS.AsString = '1', 'Ativo', 'Inativo');
end;

end.
