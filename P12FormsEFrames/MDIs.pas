unit MDIs;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FmeEventos;

type
  TFrmMdi = class(TForm)
    FrameEventos1: TFrameEventos;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMdi: TFrmMdi;

implementation

{$R *.dfm}

procedure TFrmMdi.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:= caFree;
end;

end.
