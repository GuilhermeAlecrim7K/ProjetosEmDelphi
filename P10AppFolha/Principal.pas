unit Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, System.UITypes, Vcl.Graphics,  Vcl.Controls,
  Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.Menus, Vcl.Grids,
  Vcl.StdCtrls, Conexao, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.DBGrids;

type
  TFrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    MenuHeadCadastros: TMenuItem;
    SubMenCadFuncionarios: TMenuItem;
    SubMenCadCargos: TMenuItem;
    SubMenCadEventos: TMenuItem;
    MenuHeadLancamentos: TMenuItem;
    SubMenLanMudancaDeCargo: TMenuItem;
    SubMenLanMudancaDeSalario: TMenuItem;
    SubMenLanEventos: TMenuItem;
    MenuHeadRelatorios: TMenuItem;
    MenuHeadSair: TMenuItem;
    SubMenRelListaDeCargos: TMenuItem;
    SubMenRelListaDeFuncionarios: TMenuItem;
    SubMenRelEventos: TMenuItem;
    MenuHeadFolhaDePagamento: TMenuItem;
    SubMenRelINSS: TMenuItem;
    SubMenRelIRRF: TMenuItem;
    N1: TMenuItem;
    SubMenFolPagCalcular: TMenuItem;
    SubMenFolPagFolhasAnteriores: TMenuItem;
    StatusBar1: TStatusBar;
    PgCtrInicio: TPageControl;
    TabResumoEmpresa: TTabSheet;
    TabTabelas: TTabSheet;
    LblINSS: TLabel;
    LbIRRF: TLabel;
    DbgInss: TDBGrid;
    DtsInss: TDataSource;
    DtsIrrf: TDataSource;
    TblInss: TFDTable;
    TblIrrf: TFDTable;
    DbgIrrf: TDBGrid;
    TblIrrfALIQUOTA: TSingleField;
    TblIrrfLIMITE_SALARIO: TSingleField;
    TblInssALIQUOTA: TSingleField;
    TblInssLIMITE_SALARIO: TSingleField;
    TblInssCAL_LIMITE: TStringField;
    TblInssCAL_ALIQUOTA: TStringField;
    TblIrrfCAL_LIMITE: TStringField;
    TblIrrfCAL_ALIQUOTA: TStringField;
    TblIrrfCAL_DEDUCAO: TStringField;
    TblInssFAIXA_CONTRIBUICAO: TStringField;
    TblIrrfFAIXA_CONTRIBUICAO: TStringField;
    TblIrrfDEDUCAO: TSingleField;
    procedure FormCreate(Sender: TObject);
    procedure SubMenCadFuncionariosClick(Sender: TObject);
    procedure SubMenCadCargosClick(Sender: TObject);
    procedure SubMenCadEventosClick(Sender: TObject);
    procedure SubMenLanMudancaDeCargoClick(Sender: TObject);
    procedure SubMenLanMudancaDeSalarioClick(Sender: TObject);
    procedure SubMenLanEventosClick(Sender: TObject);
    procedure MenuHeadSairClick(Sender: TObject);
    procedure SubMenRelListaDeCargosClick(Sender: TObject);
    procedure SubMenRelListaDeFuncionariosClick(Sender: TObject);
    procedure SubMenRelEventosClick(Sender: TObject);
    procedure SubMenRelINSSClick(Sender: TObject);
    procedure SubMenRelIRRFClick(Sender: TObject);
    procedure SubMenFolPagCalcularClick(Sender: TObject);
    procedure SubMenFolPagFolhasAnterioresClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure TblInssCalcFields(DataSet: TDataSet);
    procedure TblIrrfCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

uses
  CalculosINSSeIRRF, CadCargos, CadEventos,
  CadFuncionarios, LanEventos, LanMudancaSalario, LanMudancaCargo,
  RelCargos, RelFuncionarios, RelEventos, RelMudancaSalario,
  RelFinanceiroINSS, RelFinanceiroIRRF;

{$R *.dfm}


procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
  DM:= TDM.Create(Self);
  PgCtrInicio.ActivePage:= TabResumoEmpresa;
  TblInss.Active:= True;
  TblIrrf.Active:= True;
  FrmPrincipal.Height:= 480; FrmPrincipal.Width:= 720;
  StatusBar1.Panels[0].Text:= 'Status: Conectado';
  //Em caso de falha conexão de rede criar um evento do TFDConnection
  //e chamar uma procedure para atualizar esse painel
  StatusBar1.Panels[1].Text:= DateTimeToStr(Date);
end;

procedure TFrmPrincipal.FormDestroy(Sender: TObject);
begin
  DM.Free;
end;

procedure TFrmPrincipal.MenuHeadSairClick(Sender: TObject);
begin
  if MessageDlg('Tem certeza que deseja abandonar a aplicação?', mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
    Application.Terminate;
end;

procedure TFrmPrincipal.SubMenCadCargosClick(Sender: TObject);
begin
  FrmCadastroCargos:= TFrmCadastroCargos.Create(Self);
  FrmCadastroCargos.Height:= 250;
  FrmCadastroCargos.Width:= 320;
  FrmCadastroCargos.ShowModal;
  FrmCadastroCargos.Free;
end;

procedure TFrmPrincipal.SubMenCadEventosClick(Sender: TObject);
begin
  FrmCadastroEventos:= TFrmCadastroEventos.Create(Self);
  FrmCadastroEventos.Height:= 350; FrmCadastroEventos.width:= 490;
  FrmCadastroEventos.ShowModal;
  FrmCadastroEventos.Free;
end;

procedure TFrmPrincipal.SubMenCadFuncionariosClick(Sender: TObject);
begin
  FrmCadastroFuncionarios:= TFrmCadastroFuncionarios.Create(Self);
  FrmCadastroFuncionarios.ShowModal;
  FrmCadastroFuncionarios.Free;
end;

procedure TFrmPrincipal.SubMenFolPagCalcularClick(Sender: TObject);
begin
  //...
end;

procedure TFrmPrincipal.SubMenFolPagFolhasAnterioresClick(
  Sender: TObject);
begin
  //...
end;

procedure TFrmPrincipal.SubMenLanEventosClick(Sender: TObject);
begin
  FrmLancarEventos:= TFrmLancarEventos.Create(Self);
  FrmLancarEventos.ShowModal;
  FrmLancarEventos.Free;
end;

procedure TFrmPrincipal.SubMenLanMudancaDeCargoClick(Sender: TObject);
begin
  FrmLancarMudancaCargo:= TFrmLancarMudancaCargo.Create(Self);
  FrmLancarMudancaCargo.ShowModal;
  FrmLancarMudancaCargo.Free;
end;

procedure TFrmPrincipal.SubMenLanMudancaDeSalarioClick(
  Sender: TObject);
begin
  FrmLancarMudancaDeSalario:= TFrmLancarMudancaDeSalario.Create(Self);
  FrmLancarMudancaDeSalario.ShowModal;
  FrmLancarMudancaDeSalario.Free;
end;

procedure TFrmPrincipal.SubMenRelEventosClick(Sender: TObject);
begin
  FrmRelatorioEventos:= TFrmRelatorioEventos.Create(Self);
  FrmRelatorioEventos.ShowModal;
  FrmRelatorioEventos.Free;
end;

procedure TFrmPrincipal.SubMenRelINSSClick(Sender: TObject);
begin
  FrmRelatorioINSS:= TFrmRelatorioINSS.Create(Self);
  FrmRelatorioINSS.ShowModal;
  FrmRelatorioINSS.Free;
end;

procedure TFrmPrincipal.SubMenRelIRRFClick(Sender: TObject);
begin
  //...
end;

procedure TFrmPrincipal.SubMenRelListaDeCargosClick(Sender: TObject);
begin
  FrmListaCargos:= TFrmListaCargos.Create(Self);
  FrmListaCargos.ShowModal;
  FrmListaCargos.Free;
end;

procedure TFrmPrincipal.SubMenRelListaDeFuncionariosClick(
  Sender: TObject);
begin
  FrmRelatorioFuncionarios:= TFrmRelatorioFuncionarios.Create(Self);
  FrmRelatorioFuncionarios.ShowModal;
  FrmRelatorioFuncionarios.Free;
end;

procedure TFrmPrincipal.TblInssCalcFields(DataSet: TDataSet);
begin
  TblInssCAL_LIMITE.AsString:= Format('Até %m', [TblInssLIMITE_SALARIO.AsCurrency]);
  TblInssCAL_ALIQUOTA.AsString:= Format('%f%%', [TblInssALIQUOTA.AsFloat*100]);
end;

procedure TFrmPrincipal.TblIrrfCalcFields(DataSet: TDataSet);
begin
  TblIrrfCAL_LIMITE.AsString:= Format('Até %m', [TblIrrfLIMITE_SALARIO.AsCurrency]);
  TblIrrfCAL_ALIQUOTA.AsString:= Format('%f%%', [TblIrrfALIQUOTA.AsFloat*100]);
  TblIrrfCAL_DEDUCAO.AsString:= Format('%m', [TblIrrfDEDUCAO.AsCurrency]);
end;

end.
