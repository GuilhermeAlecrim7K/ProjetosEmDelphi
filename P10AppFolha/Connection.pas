unit Connection;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Phys.IBBase,
  FireDAC.Comp.Client, Data.DB;

type
  TDModule = class(TDataModule)
    FDConnect: TFDConnection;
    FDTransaction1: TFDTransaction;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    procedure DataModuleDestroy(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DModule: TDModule;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses
  Vcl.Forms, Dialogs;

procedure TDModule.DataModuleCreate(Sender: TObject);
begin
  try
    FDConnect.Connected:= True;
  except
    ShowMessage('Falha ao iniciar a aplicação');
    Application.Terminate;
  end;
end;

procedure TDModule.DataModuleDestroy(Sender: TObject);
begin
  FDConnect.Connected:= False;
end;

end.
