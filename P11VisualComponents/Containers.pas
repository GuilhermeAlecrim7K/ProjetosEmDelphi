unit Containers;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.ComCtrls;

type
  TFrmContainers = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    GroupBox1: TGroupBox;
    ScrollBox1: TScrollBox;
    Panel1: TPanel;
    Edit1: TEdit;
    CheckBox1: TCheckBox;
    RadioButton1: TRadioButton;
    ButtonedEdit1: TButtonedEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmContainers: TFrmContainers;

implementation

{$R *.dfm}

end.
