unit CadCargos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Conexao, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls;

type
  TFrmCadastroCargos = class(TForm)
    TblCargos: TFDTable;
    DtsCargos: TDataSource;
    TblCargosCODIGO: TStringField;
    TblCargosNOME: TStringField;
    TblCargosSALARIOBASE: TFloatField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadastroCargos: TFrmCadastroCargos;

implementation

{$R *.dfm}

end.
