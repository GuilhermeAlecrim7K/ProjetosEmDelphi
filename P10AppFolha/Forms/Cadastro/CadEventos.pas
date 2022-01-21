unit CadEventos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, StrUtils, System.UITypes,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.ComCtrls,
  Conexao, Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.ExtCtrls;

type
  TFrmCadastroEventos = class(TForm)
    PgCtrCadEventos: TPageControl;
    TabListaEventos: TTabSheet;
    TabCrud: TTabSheet;
    BtnIncluir: TButton;
    BtnEditar: TButton;
    BtnDeletar: TButton;
    DtsCadEventos: TDataSource;
    DbgEventos: TDBGrid;
    TblEventos: TFDTable;
    TblEventosCODIGO: TStringField;
    TblEventosNOME: TStringField;
    TblEventosCALC_TIPO: TStringField;
    TblEventosTIPO: TStringField;
    QryCadEventos: TFDQuery;
    QryCadEventosCODIGO: TStringField;
    QryCadEventosNOME: TStringField;
    QryCadEventosTIPO: TStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    DbRadGrpTipo: TDBRadioGroup;
    BtnSalvar: TButton;
    BtnCancelar: TButton;
    procedure TblEventosCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure BtnIncluirClick(Sender: TObject);
    procedure BtnEditarClick(Sender: TObject);
    procedure BtnDeletarClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    procedure ResizeForm(Width, Height: integer);
  public
    { Public declarations }
  end;

var
  FrmCadastroEventos: TFrmCadastroEventos;

implementation

{$R *.dfm}

procedure TFrmCadastroEventos.TblEventosCalcFields(DataSet: TDataSet);
begin
  TblEventosCALC_TIPO.AsString:= IfThen(TblEventosTIPO.AsString = '1',
                                        'Acréscimo', 'Decréscimo')
end;

procedure TFrmCadastroEventos.BtnCancelarClick(Sender: TObject);
begin
  TblEventos.Cancel;
  TabListaEventos.TabVisible:= True;
  TabCrud.TabVisible:= False;
  ResizeForm(490, 350);
end;

procedure TFrmCadastroEventos.BtnDeletarClick(Sender: TObject);
begin
  if MessageDlg('Você tem certeza que deseja excluir o registro?',  mtWarning, [mbYes, mbCancel], 0) = mrYes then
    begin
      TblEventos.Delete;
      ShowMessage('Registro excluído com sucesso');
    end
  else
    TblEventos.Cancel;
end;

procedure TFrmCadastroEventos.BtnEditarClick(Sender: TObject);
begin
  TblEventos.Edit;
  TabListaEventos.TabVisible:= False;
  TabCrud.Caption:= 'Incluir novo registro';
  TabCrud.TabVisible:= True;
  ResizeForm(200, 250);
end;

procedure TFrmCadastroEventos.BtnIncluirClick(Sender: TObject);
begin
  TblEventos.Append;
  TabListaEventos.TabVisible:= False;
  TabCrud.Caption:= 'Editar registro';
  TabCrud.TabVisible:= True;
  ResizeForm(200, 250);
end;

procedure TFrmCadastroEventos.BtnSalvarClick(Sender: TObject);
begin
  TblEventos.Post;
  if TblEventos.State = dsInsert then
    ShowMessage('Novo registro criado com sucesso')
  else
    MessageDlg('Registro editado com sucesso', mtConfirmation, [mbOk],0);
  TabListaEventos.TabVisible:= True;
  TabCrud.TabVisible:= False;
  ResizeForm(490, 350);
end;

procedure TFrmCadastroEventos.FormCreate(Sender: TObject);
begin
  PgCtrCadEventos.ActivePage:= TabListaEventos;
  TabCrud.TabVisible:= False;
  TblEventos.Open;
end;

procedure TFrmCadastroEventos.FormDestroy(Sender: TObject);
begin
  TblEventos.Cancel;
  TblEventos.Close;
end;

procedure TFrmCadastroEventos.ResizeForm(Width, Height: integer);
begin
  FrmCadastroEventos.Width:= Width;
  FrmCadastroEventos.Height:= Height;
end;

end.
