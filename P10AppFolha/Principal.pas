unit Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.Menus,
  Vcl.Grids, Vcl.StdCtrls, CalculosINSSeIRRF, Conexao;

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
    StrGrdTabelaINSS: TStringGrid;
    StrGrdTabelaIRRF: TStringGrid;
    procedure FormCreate(Sender: TObject);
    procedure SetINSSandIRRFTables;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}


procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
  DM:= TDM.Create(Self);
  SetINSSandIRRFTables;
  FrmPrincipal.Height:= 480; FrmPrincipal.Width:= 720;
  StatusBar1.Panels[0].Text:= 'Status: Conectado';
  //Em caso de falha conexão de rede criar um evento do TFDConnection
  //e chamar uma procedure para atualizar esse painel
  StatusBar1.Panels[1].Text:= DateTimeToStr(Date);
end;

procedure TFrmPrincipal.SetINSSandIRRFTables;
begin
  StrGrdTabelaINSS.ColWidths[0]:= 180;
  StrGrdTabelaINSS.Cells[0,0]:= 'Salário de contribuição';
  StrGrdTabelaINSS.Cells[0,1]:= Format('até %m', [INSS.Faixa1Limite]);
  StrGrdTabelaINSS.Cells[0,2]:= Format('%m até %m', [INSS.Faixa1Limite + 0.01, IRRF.Faixa2Limite]);
  StrGrdTabelaINSS.Cells[0,3]:= Format('%m até %m', [INSS.Faixa2Limite + 0.01, IRRF.Faixa2Limite]);
  StrGrdTabelaINSS.Cells[0,4]:= Format('%m até %m', [INSS.Faixa3Limite + 0.01, INSS.Faixa4Limite]);
  StrGrdTabelaINSS.ColWidths[1]:= 60;
  StrGrdTabelaINSS.Cells[1,0]:= 'Alíquota';
  StrGrdTabelaINSS.Cells[1,1]:= Format('%f%%', [INSS.AliquotaFaixa1 *100]);
  StrGrdTabelaINSS.Cells[1,2]:= Format('%f%%', [INSS.AliquotaFaixa2 *100]);
  StrGrdTabelaINSS.Cells[1,3]:= Format('%f%%', [INSS.AliquotaFaixa3 *100]);
  StrGrdTabelaINSS.Cells[1,4]:= Format('%f%%', [INSS.AliquotaFaixa4 *100]);
  StrGrdTabelaINSS.Width:= StrGrdTabelaINSS.ColWidths[0] + StrGrdTabelaINSS.ColWidths[1];

  StrGrdTabelaIRRF.ColWidths[0]:= 180;
  StrGrdTabelaIRRF.Cells[0,0]:= 'Base de cálculo';
  StrGrdTabelaIRRF.Cells[0,1]:= Format('de %m até %m', [0.0, IRRF.FaixaIsencaoLimite]);
  StrGrdTabelaIRRF.Cells[0,2]:= Format('de %m até %m', [IRRF.FaixaIsencaoLimite + 0.01, IRRF.Faixa1Limite]);
  StrGrdTabelaIRRF.Cells[0,3]:= Format('de %m até %m', [IRRF.Faixa1Limite + 0.01, IRRF.Faixa2Limite]);
  StrGrdTabelaIRRF.Cells[0,4]:= Format('de %m até %m', [IRRF.Faixa2Limite + 0.01, IRRF.Faixa3Limite]);
  StrGrdTabelaIRRF.Cells[0,5]:= Format('A partir de %m', [IRRF.Faixa3Limite + 0.01]);
  StrGrdTabelaIRRF.ColWidths[1]:= 60;
  StrGrdTabelaIRRF.Cells[1,0]:= 'Alíquota';
  StrGrdTabelaIRRF.Cells[1,1]:= 'isento';
  StrGrdTabelaIRRF.Cells[1,2]:= Format('%f%%', [IRRF.AliquotaFaixa1 *100]);
  StrGrdTabelaIRRF.Cells[1,3]:= Format('%f%%', [INSS.AliquotaFaixa2 *100]);
  StrGrdTabelaIRRF.Cells[1,4]:= Format('%f%%', [INSS.AliquotaFaixa3 *100]);
  StrGrdTabelaIRRF.Cells[1,5]:= Format('%f%%', [INSS.AliquotaFaixa4 *100]);
  StrGrdTabelaIRRF.ColWidths[2]:= 80;
  StrGrdTabelaIRRF.Cells[2,0]:= 'Dedução';
  StrGrdTabelaIRRF.Cells[2,1]:= Format('%m', [0.0]);
  StrGrdTabelaIRRF.Cells[2,2]:= Format('%m', [IRRF.DeducaoFaixa1]);
  StrGrdTabelaIRRF.Cells[2,3]:= Format('%m', [IRRF.DeducaoFaixa2]);
  StrGrdTabelaIRRF.Cells[2,4]:= Format('%m', [IRRF.DeducaoFaixa3]);
  StrGrdTabelaIRRF.Cells[2,5]:= Format('%m', [IRRF.DeducaoFaixa4]);
  StrGrdTabelaIRRF.Width:= StrGrdTabelaIRRF.ColWidths[0] + StrGrdTabelaIRRF.ColWidths[1] + StrGrdTabelaIRRF.ColWidths[2];
end;

end.
