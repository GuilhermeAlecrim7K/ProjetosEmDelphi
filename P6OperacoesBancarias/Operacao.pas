unit Operacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Mask;

type
  TFrmOperacao = class(TForm)
    BtnOperacao: TButton;
    MskEdtValor: TMaskEdit;
    LblLimiteSaque: TLabel;
    procedure BtnOperacaoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmOperacao: TFrmOperacao;
  OpValor: currency;

implementation

{$R *.dfm}

procedure TFrmOperacao.BtnOperacaoClick(Sender: TObject);
begin
  OpValor:= StrToCurr(MskEdtValor.Text);
  FrmOperacao.Close;
end;

procedure TFrmOperacao.FormCreate(Sender: TObject);
begin
  OpValor:= 0;
end;

end.
