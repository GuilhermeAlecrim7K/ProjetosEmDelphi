unit Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Produtos, Clientes, MDIs;

type
  TFrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Cadastro1: TMenuItem;
    Produtos1: TMenuItem;
    Clientes1: TMenuItem;
    MDI: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    MDIs1: TMenuItem;
    PopupMenu1: TPopupMenu;
    Copiar1: TMenuItem;
    Copiar2: TMenuItem;
    MaisInformaes1: TMenuItem;
    procedure SairClick(Sender: TObject);
    procedure AbrirFrmProdutos(Sender: TObject);
    procedure AbrirFrmClientes(Sender: TObject);
    procedure AbrirFrmMDIs(Sender: TObject);
    procedure FecharTodosMDIs(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

procedure TFrmPrincipal.AbrirFrmClientes(Sender: TObject);
begin
  FrmClientes:= TFrmClientes.Create(Self);
  FrmClientes.Show;
end;

procedure TFrmPrincipal.AbrirFrmMDIs(Sender: TObject);
begin
  FrmMdi:= TFrmMdi.Create(Self);
  FrmMdi.Show;
end;

procedure TFrmPrincipal.AbrirFrmProdutos(Sender: TObject);
begin
  FrmProdutos:= TFrmProdutos.Create(self);
  try
    FrmProdutos.ShowModal;
  finally
    FrmProdutos.Free;
  end;
end;

procedure TFrmPrincipal.FecharTodosMDIs(Sender: TObject);
var I: integer;
begin
  for I := 0 to MDIChildCount -1 do
  begin
    MDIChildren[I].close;
  end;
  //ActiveMDIChild;
end;

procedure TFrmPrincipal.SairClick(Sender: TObject);
begin
  Application.Terminate;
end;

end.
