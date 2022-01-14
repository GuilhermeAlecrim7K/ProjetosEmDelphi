unit Principal;

interface

uses
  Objetos, Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Dialogs, Vcl.Forms, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.WinXCalendars, Vcl.Menus,
  Vcl.Mask, FrmRelatorios, StrUtils;

type
  TForm1 = class(TForm)
    CldData: TCalendarPicker;
    RadGrpIsFeriado: TRadioGroup;
    BtnRegistraHoraExtra: TButton;
    CmbBoxQtdeHoras: TComboBox;
    LblQtdeHoras: TLabel;
    MainMenu1: TMainMenu;
    MskEdtCodigoFuncionario: TMaskEdit;
    MenuRelatorios: TMenuItem;
    SubMenuGerarRelatorios: TMenuItem;
    procedure BtnRegistraHoraExtraClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SubMenuGerarRelatoriosClick(Sender: TObject);
  strict private
    { Private declarations }
    ListaFuncionarios: TListaFuncionarios;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.BtnRegistraHoraExtraClick(Sender: TObject);
var
  vCodigoFuncionario: integer;
  vRegistro: RRegistroHoras;
begin
  vCodigoFuncionario:= StrToInt(MskEdtCodigoFuncionario.Text);
  vRegistro.QtdeHoras:= CmbBoxQtdeHoras.ItemIndex +1;
  vRegistro.Data:= CldData.Date;
  vRegistro.IsFeriadoOrDomingo:= not ((RadGrpIsFeriado.ItemIndex).ToBoolean);
  case CriaRegistroFuncionario(vCodigoFuncionario, vRegistro, ListaFuncionarios) of
    NewEmployeeCreated:
      ShowMessage ('Novo funcionário registrado');
    NewRegisterCreated:
      ShowMessage ('Novo registro para o funcionário criado');
    RegisterUpdated:
      ShowMessage ('Registro da data incrementado com sucesso.');
    RegisterUpdatedWithHoliday:
      ShowMessage ('Registro da data incrementado com sucesso. Alterado o tipo de data');
    OvertimeExceeded:
      ShowMessage ('Limite de horas extras no dia atingidas. Não foi possível realizar a operação');
  end;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
ListaFuncionarios.Free;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  ListaFuncionarios:= TListaFuncionarios.Create;
  CldData.Date:= Date;
end;

procedure TForm1.SubMenuGerarRelatoriosClick(Sender: TObject);
begin
  FormRelatorios:= TFormRelatorios.Create(Self);
  FormRelatorios.ListaFuncionarios:= ListaFuncionarios;
  FormRelatorios.ShowModal;
end;

end.
