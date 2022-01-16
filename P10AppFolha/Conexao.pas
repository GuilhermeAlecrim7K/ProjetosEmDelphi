unit Conexao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Comp.Client,
  FireDAC.Phys.IBBase, Data.DB;

type
  TDM = class(TDataModule)
    ConnectionFB: TFDConnection;
    FDPhysFBDriverLink: TFDPhysFBDriverLink;
    Transaction: TFDTransaction;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
    FDbPath: string;
  public
    { Public declarations }
    property DbPath: string read FDbPath;
  end;

var
  DM: TDM;

implementation

uses
  Vcl.Forms, Dialogs, StrUtils;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  try
    FDbPath:= ReverseString(ExtractFilePath(Application.ExeName));
    Delete(FDbPath, 1, 12);
    FDbPath:= ReverseString(FDbPath) + 'Database\';
    ConnectionFB.DriverName:= 'FB';
    ConnectionFB.LoginPrompt:= False;
    ConnectionFB.Params.Database:= DbPath + 'DATABASE.FDB';
    ConnectionFB.Params.UserName:= 'SYSDBA';
    ConnectionFB.Params.Password:= 'masterkey';
    ConnectionFB.Params.Values['Server']:= 'localhost';
    ConnectionFB.Params.Values['Port']:= '3050';
    ConnectionFB.Connected:= True;
    //FDPhysFBDriverLink.VendorLib:= 'C:\Program Files\Firebird\Firebird_2_5\WOW64\fbclient.dll';
  except
    ShowMessage('Falha na conexão.');
    Application.Terminate;
  end;
end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
  ConnectionFB.Connected:= False;
end;

end.
