unit Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls,
  System.ImageList, Vcl.ImgList, Vcl.ToolWin, Vcl.CheckLst,
  Vcl.StdCtrls, Vcl.Samples.Spin, Vcl.ExtCtrls, Vcl.Mask,
  Vcl.AppEvnts, Vcl.Grids, Vcl.Buttons;

type
  TFrmPrincipal = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ImageList1: TImageList;
    Label1: TLabel;
    Edit1: TEdit;
    MaskEdit1: TMaskEdit;
    Memo1: TMemo;
    GroupBox1: TGroupBox;
    RadioGroup1: TRadioGroup;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    ComboBox1: TComboBox;
    CheckBox4: TCheckBox;
    RadioButton1: TRadioButton;
    SpinEdit1: TSpinEdit;
    ListBox1: TListBox;
    CheckListBox1: TCheckListBox;
    DateTimePicker1: TDateTimePicker;
    MonthCalendar1: TMonthCalendar;
    Button1: TButton;
    BitBtn1: TBitBtn;
    SpeedButton1: TSpeedButton;
    Image1: TImage;
    Shape1: TShape;
    StringGrid1: TStringGrid;
    StatusBar1: TStatusBar;
    ApplicationEvents1: TApplicationEvents;
    Timer1: TTimer;
    TrayIcon1: TTrayIcon;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

end.
