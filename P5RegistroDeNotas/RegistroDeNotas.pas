unit RegistroDeNotas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    MemoMain: TMemo;
    Button1: TButton;
    Label1: TLabel;
    EditMediaTurma: TLabeledEdit;
    EditMaiorNota: TLabeledEdit;
    EditMenorNota: TLabeledEdit;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

RecordNotas = Record
  Nome: string;
  Nota: double;
  end;

var
  Form1: TForm1;
  MaiorNota, MenorNota, Media: double;
  IndexMenorNota, IndexMaiorNota: Integer;
  GNotas: array[0..9] of RecordNotas;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  I: Integer;
begin
  MemoMain.Lines.Clear;
  MaiorNota:= 0;
  MenorNota:= 10;
  Media:= 0;
  for I := Low(Gnotas) to High(Gnotas) do
    begin
      Gnotas[I].Nome:= InputBox('Nome do aluno', 'Qual o nome do aluno','');
      Gnotas[I].Nota:= Random(9) + (Random(9) / 10);
      Media:= Media + GNotas[I].Nota;
      if Gnotas[I].Nota > MaiorNota then
        begin
          IndexMaiorNota:= I;
          MaiorNota:= Gnotas[I].Nota;
        end;
      if Gnotas[I].Nota < MenorNota then
        begin
          IndexMenorNota:= I;
          MenorNota:= GNotas[I].Nota;
        end;
      MemoMain.Lines.Add(Gnotas[I].Nome + ': ' + FloatToStr(Gnotas[I].Nota));
    end;
  EditMediaTurma.Visible:= True; EditMediaTurma.Text:= FloatToStr(Media/length(Gnotas));
  EditMenorNota.Visible:= True; EditMaiorNota.Text:= Gnotas[IndexMenorNota].Nome + ': ' + FloatToStr(GNotas[IndexMenorNota].Nota);
  EditMaiorNota.Visible:= True; EditMenorNota.Text:= Gnotas[IndexMaiorNota].Nome + ': ' + FloatToStr(Gnotas[IndexMaiorNota].Nota);
  //Faltando considerar os casos com notas iguais
end;

end.
