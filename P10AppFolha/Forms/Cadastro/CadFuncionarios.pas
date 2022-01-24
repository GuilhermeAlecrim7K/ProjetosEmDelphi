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
  Vcl.DBGrids, Vcl.ExtCtrls, StrUtils, Padroes, UITypes;

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
    EdtBuscaFuncionario: TEdit;
    QryFuncionariosC_STATUS: TStringField;
    ChkBoxShowAtivos: TCheckBox;
    QryFuncionariosSALARIO_ATUAL: TSingleField;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure QryCargosCalcFields(DataSet: TDataSet);
    procedure QryFuncionariosCalcFields(DataSet: TDataSet);
    procedure BtnIncluirClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnEditarClick(Sender: TObject);
    procedure BtnInativarClick(Sender: TObject);
    procedure DbLkpCmbBoxCargoCloseUp(Sender: TObject);
    procedure ChkBoxShowAtivosClick(Sender: TObject);
    procedure EdtBuscaFuncionarioChange(Sender: TObject);
    procedure DbgFuncionariosTitleClick(Column: TColumn);
  private
    { Private declarations }
    procedure ChangeToOperacoes;
    procedure ChangeToListaFuncionarios;
    procedure RegistrarContratacao;
  public
    { Public declarations }
  end;

var
  FrmCadastroFuncionarios: TFrmCadastroFuncionarios;

implementation

{$R *.dfm}


procedure TFrmCadastroFuncionarios.BtnCancelarClick(Sender: TObject);
begin
  if MessageDlg('Tem certeza que deseja cancelar a operação?', mtWarning, [mbYes, mbNo], 0) = mrYes then
  begin
    QryFuncionarios.Cancel;
    TabListaFuncionarios.TabVisible:= True;
    TabOperacoes.TabVisible:= False;
  end;
end;

procedure TFrmCadastroFuncionarios.BtnEditarClick(Sender: TObject);
begin
  if not QryFuncionarios.IsEmpty then
  begin
    QryFuncionarios.Edit;
    ChangeToOperacoes;
    TabOperacoes.Caption:= 'Editar cadastro';
    PnlCargoSalario.Visible:= False;
  end;
end;

procedure TFrmCadastroFuncionarios.BtnInativarClick(Sender: TObject);
var
  ConfirmationMsg: string;
begin
  if not (QryFuncionarios.IsEmpty) and (QryFuncionariosSTATUS.AsInteger <> 0) then
  begin
    ConfirmationMsg:= 'Tem certeza que deseja inativar o cadastro do funcionário ' + QryFuncionariosNOME.AsString + '?';
    if MessageDlg(ConfirmationMsg, mtWarning, [mbYes, mbCancel], 0) = mrYes then
      begin
        QryFuncionarios.Edit;
        QryFuncionariosSTATUS.AsInteger:= Ord(sfInativo);
        QryFuncionarios.Post;
      end;
  end;
end;

procedure TFrmCadastroFuncionarios.BtnIncluirClick(Sender: TObject);
begin
  QryFuncionarios.Append;
  ChangeToOperacoes;
  TabOperacoes.Caption:= 'Novo cadastro';
  PnlCargoSalario.Visible:= True;
  DbRadGrpStatus.ItemIndex:= 0;
  DbLkpCmbBoxCargo.ListFieldIndex:= 1;
end;

procedure TFrmCadastroFuncionarios.BtnSalvarClick(Sender: TObject);
var
  QryState: TDataSetState;
begin
  //to-do Validações do preenchimento dos campos (Marcar todos como obrigatórios)
  QryState:= QryFuncionarios.State;
  QryFuncionariosDATA_NASCIMENTO.AsString:= DateTimeToStr(DtpDataNascimento.DateTime);
  QryFuncionarios.Post;
  if QryState = dsInsert then
    RegistrarContratacao;
  ChangeToListaFuncionarios;
end;

procedure TFrmCadastroFuncionarios.ChangeToListaFuncionarios;
begin
  TabOperacoes.TabVisible:= False;
  TabListaFuncionarios.TabVisible:= True;
  FrmCadastroFuncionarios.Height:= 450; FrmCadastroFuncionarios.Width:= 1000;
  QryFuncionarios.Refresh;
end;

procedure TFrmCadastroFuncionarios.ChangeToOperacoes;
begin
  TabOperacoes.TabVisible:= True;
  TabListaFuncionarios.TabVisible:= False;
  FrmCadastroFuncionarios.Height:= 455; FrmCadastroFuncionarios.Width:= 360;
end;

procedure TFrmCadastroFuncionarios.ChkBoxShowAtivosClick(
  Sender: TObject);
begin
  if ChkBoxShowAtivos.Checked then
    QryFuncionarios.Open('SELECT * FROM FUNCIONARIOS')
  else
    QryFuncionarios.Open('SELECT * FROM FUNCIONARIOS WHERE STATUS = 1');
end;

procedure TFrmCadastroFuncionarios.DbgFuncionariosTitleClick(
  Column: TColumn);
begin
  if Column.Field.FieldKind = fkData then
    QryFuncionarios.IndexFieldNames:= Column.FieldName;
end;

procedure TFrmCadastroFuncionarios.DbLkpCmbBoxCargoCloseUp(
  Sender: TObject);
begin
  QryFuncionariosSALARIO_ATUAL.AsFloat:= QryCargosSALARIO_BASE.AsFloat;
end;

procedure TFrmCadastroFuncionarios.EdtBuscaFuncionarioChange(
  Sender: TObject);
begin
  QryFuncionarios.Locate('NOME', EdtBuscaFuncionario.Text, [loCaseInsensitive, loPartialKey]);
end;

procedure TFrmCadastroFuncionarios.FormCreate(Sender: TObject);
begin
  PgCtrFuncionarios.ActivePage:= TabListaFuncionarios;
  TabOperacoes.TabVisible:= False;
  QryCargos.Open;
  QryFuncionarios.Open;
  QrySalarios.Open;
  DtpDataNascimento.MaxDate:= IncYear(Date, -13);
  DtpDataNascimento.MinDate:= IncYear(Date, -100);
end;

procedure TFrmCadastroFuncionarios.FormDestroy(Sender: TObject);
begin
  QryCargos.Close;
  QryFuncionarios.Cancel;
  QrySalarios.Close;
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

procedure TFrmCadastroFuncionarios.RegistrarContratacao;
begin
  QrySalarios.SQL.Text:= 'INSERT INTO HIST_ALTER_SALARIO_INDIVIDUAL ' +
	'VALUES (:Data,:Hora, :CodFuncionario, :NovoValor, :Tipo)';
  QrySalarios.ParamByName('Data').AsString:= DateToStr(Now);
  QrySalarios.ParamByName('Hora').AsString:= TimeToStr(Now);
  QrySalarios.ParamByName('CodFuncionario').AsString:= QryFuncionariosCODIGO.AsString;
  QrySalarios.ParamByName('NovoValor').AsFloat:= QryFuncionariosSALARIO_ATUAL.AsFloat;
  QrySalarios.ParamByName('Tipo').AsInteger:= Ord(tasContratacao);
  QrySalarios.ExecSQL;
end;

end.
