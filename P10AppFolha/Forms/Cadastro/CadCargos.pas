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
    DbEdtCodigoCargo: TDBEdit;
    LblTituloCargo: TLabel;
    DbEdtTituloCargo: TDBEdit;
    BtnCancelar: TButton;
    LblSalarioBaseCargo: TLabel;
    DbEdtSalarioBaseCargo: TDBEdit;
    PgCtrCadCargos: TPageControl;
    TabInclusao: TTabSheet;
    TabEdicao: TTabSheet;
    EdtPesquisar: TEdit;
    BtnPesquisar: TButton;
    DbgEdicao: TDBGrid;
    PnlEdicao: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure MenuHeadListaCargosClick(Sender: TObject);
    procedure SetSQLState(Sender: TObject);
    procedure BtnPesquisarClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure DbgEdicaoCellClick(Column: TColumn);
  private
    { Private declarations }
    procedure LimparCampos;
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

procedure TFrmCadastroCargos.BtnPesquisarClick(Sender: TObject);
var
  Query: string; 
begin
//'NOME LIKE ''%' + LblEdtNomeCargo.Text + '%'' AND '
  Query:= 'SELECT * FROM CARGOS WHERE NOME LIKE ' + QuotedStr('%' + EdtPesquisar.Text + '%');
  QryCadCargos.Open(Query);
  if not QryCadCargos.IsEmpty then
    begin
      PnlEdicao.Visible:= True;
      QryCadCargos.Edit;
    end
end;

procedure TFrmCadastroCargos.DbgEdicaoCellClick(Column: TColumn);
begin
//  ShowMessage('Entrei');
end;

procedure TFrmCadastroCargos.LimparCampos;
begin
  PgCtrCadCargos.FindNextPage(PgCtrCadCargos.ActivePage, True, False).Visible:= True;
  //Componentes de Inclusão
  DbEdtCodigoCargo.Clear;
  DbEdtTituloCargo.Clear;
  DbEdtSalarioBaseCargo.Text:= '1212,00';
  DbChkBoxStatusAtivo.Checked:= False;

  //Componentes de edição 
  PnlEdicao.Visible:= False;
  EdtPesquisar.Text:= '';
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
    end;
end;

procedure TFrmCadastroCargos.BtnSalvarClick(Sender: TObject);
const
  E_FIELD_IS_EMPTY = 'Este campo não pode ficar vazio';
  E_TITLE_IS_NOT_VALID = 'Caracteres especiais e números não permitidos neste campo';
  E_QUANTIA_INVALIDA = 'Quantia Inválida';
var
  ErrorMsg, vCodigo, vTituloCargo, vSalarioBase: string;
  HasException: boolean;
begin
  HasException:= False;
  ErrorMsg:= '';
  vCodigo:= DbEdtCodigoCargo.Text;
  vTituloCargo:= DbEdtTituloCargo.Text;
  vSalarioBase:= DbEdtSalarioBaseCargo.Text;
  if QryCadCargos.State in [dsInsert, dsEdit] then
    begin
      if QryCadCargos.State = dsInsert then
        begin
          while not HasException do
            begin
              if Trim(vCodigo) = '' then
                begin
                  DbEdtCodigoCargo.SetFocus;
                  ErrorMsg:= E_FIELD_IS_EMPTY;
                  HasException:= True;
                  break;
                end;
              if (Trim(vTituloCargo) = '') then
                begin
                  DbEdtTituloCargo.SetFocus;
                  ErrorMsg:= E_FIELD_IS_EMPTY;
                  HasException:= True;
                  break;
                end;
              if not IsValidName(vTituloCargo) then
                begin
                  DbEdtTituloCargo.SetFocus;
                  ErrorMsg:= E_TITLE_IS_NOT_VALID;
                  HasException:= True;
                  break;
                end;
              //exception está sendo lançada no OnLeave do componente
              if (StrToCurr(DbEdtSalarioBaseCargo.EditText) < 0) or (StrToCurr(DbEdtSalarioBaseCargo.EditText) > 999999) then
                begin
                  DbEdtSalarioBaseCargo.SetFocus;
                  ErrorMsg:= E_QUANTIA_INVALIDA;
                  HasException:= True;
                  break;
                end;
              break;
            end;
          if HasException then
            raise Exception.Create(ErrorMsg)
          else
            ShowMessage('Cadastro realizado com sucesso');
        end
      else
        begin
          //tratamento do dsEdit
        end;
      QryCadCargos.Post;
      LimparCampos;
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
