unit Principal;

interface

uses
  Objetos, Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Dialogs, Vcl.Forms, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.WinXCalendars, Vcl.Menus,
  Vcl.Mask, FrmRelatorios, StrUtils, Vcl.ComCtrls;

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
    PageControl1: TPageControl;
    procedure BtnRegistraHoraExtraClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SubMenuGerarRelatoriosClick(Sender: TObject);
  strict private
    { Private declarations }
    Funcionarios: TListaFuncionarios;
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
  vData: TDateTime;
  vQtdeHoras: byte;
  vIsFeriado: boolean;
  vFuncionario: TFuncionario;
  vRegistroHorasExtras: TRegistroHorasExtras;
begin
  vFuncionario:= nil;
  vRegistroHorasExtras:= nil;
  vCodigoFuncionario:= StrToInt(MskEdtCodigoFuncionario.Text);
  vQtdeHoras:= CmbBoxQtdeHoras.ItemIndex +1;
  vData:= CldData.Date;
  vIsFeriado:= not ((RadGrpIsFeriado.ItemIndex).ToBoolean);
  try
    vRegistroHorasExtras:= TRegistroHorasExtras.Create(vData, vQtdeHoras, vIsFeriado);
    vFuncionario:= TFuncionario.Create(vCodigoFuncionario, vRegistroHorasExtras);
    case Funcionarios.CriaRegistroFuncionario(vFuncionario) of
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
  finally
    vRegistroHorasExtras.Free;
    vFuncionario.Free;
  end;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //Funcionarios.Free;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Funcionarios:= nil;
  Funcionarios:= TListaFuncionarios.Create;
  CldData.Date:= Date;
end;

procedure TForm1.SubMenuGerarRelatoriosClick(Sender: TObject);
begin
  FormRelatorios:= TFormRelatorios.Create(Self);
  FormRelatorios.ListaFuncionarios:= Funcionarios;
  FormRelatorios.ShowModal;
end;

end.
