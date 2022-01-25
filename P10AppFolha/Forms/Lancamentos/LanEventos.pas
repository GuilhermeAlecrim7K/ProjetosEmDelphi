unit LanEventos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Conexao, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask,
  Vcl.ExtCtrls, UITypes, StrUtils, Vcl.ComCtrls, DateUtils;

type
  TFrmLancarEventos = class(TForm)
    QryTiposEventos: TFDQuery;
    DtsEventos: TDataSource;
    QryFuncionarios: TFDQuery;
    QryCargos: TFDQuery;
    DtsFuncionarios: TDataSource;
    DtsCargos: TDataSource;
    LblMesAno: TLabel;
    DbLkpCmbBoxCargoOuFunc: TDBLookupComboBox;
    DbLkpCmbBoxEvento: TDBLookupComboBox;
    QryLancarEvento: TFDQuery;
    MemJustificativa: TMemo;
    EdtBusca: TEdit;
    LblTipoEvento: TLabel;
    LblEdtPesquisa: TLabel;
    BtnLancarEvento: TButton;
    RadGrpBeneficiario: TRadioGroup;
    DtsLancarEvento: TDataSource;
    QryTiposEventosCODIGO: TStringField;
    QryTiposEventosNOME: TStringField;
    QryTiposEventosTIPO: TStringField;
    QryFuncionariosCODIGO: TStringField;
    QryFuncionariosNOME: TStringField;
    QryFuncionariosDATA_NASCIMENTO: TStringField;
    QryFuncionariosCOD_CARGO: TStringField;
    QryFuncionariosCONTATO: TStringField;
    QryFuncionariosEMAIL: TStringField;
    QryFuncionariosSTATUS: TStringField;
    QryFuncionariosSALARIO_ATUAL: TSingleField;
    QryCargosCODIGO: TStringField;
    QryCargosNOME: TStringField;
    QryCargosSALARIO_BASE: TFloatField;
    QryCargosSTATUS: TStringField;
    QryTiposEventosC_COD_NOME: TStringField;
    QryFuncionariosC_COD_NOME: TStringField;
    QryCargosC_COD_NOME: TStringField;
    LblJustificativa: TLabel;
    QryLancarEventoMES_LANCAMENTO: TIntegerField;
    QryLancarEventoANO_LANCAMENTO: TIntegerField;
    QryLancarEventoCOD_EVENTO: TStringField;
    QryLancarEventoCOD_FUNCIONARIO: TStringField;
    QryLancarEventoCOD_CARGO: TStringField;
    QryLancarEventoVALOR: TSingleField;
    QryLancarEventoJUSTIFICATIVA: TStringField;
    DtpMesAno: TDateTimePicker;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    QryRemoveDuplicates: TFDQuery;
    QryRemoveDuplicatesMES_LANCAMENTO: TIntegerField;
    QryRemoveDuplicatesANO_LANCAMENTO: TIntegerField;
    QryRemoveDuplicatesCOD_EVENTO: TStringField;
    QryRemoveDuplicatesCOD_FUNCIONARIO: TStringField;
    QryRemoveDuplicatesCOD_CARGO: TStringField;
    QryRemoveDuplicatesVALOR: TSingleField;
    QryRemoveDuplicatesJUSTIFICATIVA: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure BtnLancarEventoClick(Sender: TObject);
    procedure EdtBuscaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure QryTiposEventosCalcFields(DataSet: TDataSet);
    procedure QryFuncionariosCalcFields(DataSet: TDataSet);
    procedure QryCargosCalcFields(DataSet: TDataSet);
    procedure RadGrpBeneficiarioClick(Sender: TObject);
  private
    { Private declarations }
    procedure Reset;
    procedure ValidaCampos;
    procedure RemoveDuplicates;
  public
    { Public declarations }
  end;

var
  FrmLancarEventos: TFrmLancarEventos;
const
  Cargo = 0;
  Funcionario = 1;

implementation

{$R *.dfm}

procedure TFrmLancarEventos.BtnLancarEventoClick(Sender: TObject);
begin
  ValidaCampos;
  QryLancarEventoMES_LANCAMENTO.AsInteger:= MonthOf(DtpMesAno.Date);
  QryLancarEventoANO_LANCAMENTO.AsInteger:= YearOf(DtpMesAno.Date);
  QryLancarEventoJUSTIFICATIVA.AsString:= MemJustificativa.Text;
  RemoveDuplicates;
  QryLancarEvento.Post;
  MessageDlg('Evento registrado com sucesso', mtConfirmation, [mbOk], 0);
  Reset;
end;

procedure TFrmLancarEventos.EdtBuscaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = vkReturn then
  begin
    DbLkpCmbBoxCargoOuFunc.Enabled:= True;
    case RadGrpBeneficiario.ItemIndex of
      Cargo:
        begin
          DbLkpCmbBoxCargoOuFunc.ListSource:= DtsCargos;
          DbLkpCmbBoxCargoOuFunc.ListField:= 'C_COD_NOME';
          DbLkpCmbBoxCargoOuFunc.KeyField:= 'CODIGO';
          DbLkpCmbBoxCargoOuFunc.DataField:= 'COD_CARGO';
          QryCargos.Locate('NOME', EdtBusca.Text, [loCaseInsensitive, loPartialKey]);
        end;
      Funcionario:
        begin
          DbLkpCmbBoxCargoOuFunc.ListSource:= DtsFuncionarios;
          DbLkpCmbBoxCargoOuFunc.ListField:= 'C_COD_NOME';
          DbLkpCmbBoxCargoOuFunc.KeyField:= 'CODIGO';
          DbLkpCmbBoxCargoOuFunc.DataField:= 'COD_FUNCIONARIO';
          QryFuncionarios.Locate('NOME', EdtBusca.Text, [loCaseInsensitive, loPartialKey]);
        end;
    end;

  end;
end;

procedure TFrmLancarEventos.FormCreate(Sender: TObject);
begin
  QryCargos.Open;
  QryFuncionarios.Open;
  QryTiposEventos.Open;
  QryLancarEvento.Open;
  QryLancarEvento.Append;
  MemJustificativa.MaxLength:= 90;
  DtpMesAno.Date:= Date;
  DtpMesAno.MaxDate:= Date;
  DtpMesAno.MinDate:= IncMonth(Date, -12);
  DbLkpCmbBoxCargoOuFunc.Enabled:= False;
end;

procedure TFrmLancarEventos.FormDestroy(Sender: TObject);
begin
  QryFuncionarios.Close;
  QryCargos.Close;
  QryTiposEventos.Close;
  QryLancarEvento.Cancel;
  QryLancarEvento.Close;
end;

procedure TFrmLancarEventos.QryCargosCalcFields(DataSet: TDataSet);
begin
  QryCargosC_COD_NOME.AsString:=
    QryCargosCODIGO.AsString + ' - ' + QryCargosNOME.AsString;
end;

procedure TFrmLancarEventos.QryFuncionariosCalcFields(
  DataSet: TDataSet);
begin
  QryFuncionariosC_COD_NOME.AsString:=
    QryFuncionariosCODIGO.AsString + ' - ' + QryFuncionariosNOME.AsString;
end;

procedure TFrmLancarEventos.QryTiposEventosCalcFields(
  DataSet: TDataSet);
begin
  QryTiposEventosC_COD_NOME.AsString:=
    QryTiposEventosCODIGO.AsString + ' - ' + QryTiposEventosNOME.AsString;
end;

procedure TFrmLancarEventos.RadGrpBeneficiarioClick(Sender: TObject);
begin
  QryLancarEventoCOD_CARGO.Clear;
  QryLancarEventoCOD_FUNCIONARIO.Clear;
  DbLkpCmbBoxCargoOuFunc.Enabled:= False;
end;

procedure TFrmLancarEventos.RemoveDuplicates;
begin
  //Procurar registros duplicados para um mesmo funcionário ou cargo no mesmo mês
end;

procedure TFrmLancarEventos.Reset;
begin
  EdtBusca.Clear;
  MemJustificativa.Clear;
  DbLkpCmbBoxCargoOuFunc.Enabled:= False;
  QryLancarEvento.Append;
end;

procedure TFrmLancarEventos.ValidaCampos;
begin
  if QryLancarEventoCOD_CARGO.IsNull and QryLancarEventoCOD_FUNCIONARIO.IsNull then
    raise Exception.Create('Escolha um cargo ou um funcionário para registrar o evento');
  if VarToStr(MemJustificativa.Text).IsEmpty then
  begin
    MemJustificativa.SetFocus;
    raise Exception.Create('Descreva a justificativa do lançamento do evento');
  end;
  if RadGrpBeneficiario.ItemIndex = Cargo then
    QryLancarEventoCOD_FUNCIONARIO.Clear
  else
    QryLancarEventoCOD_CARGO.Clear;
  //Verificar se evento é de decréscimo e multiplicar por -1
end;

end.
