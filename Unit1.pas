unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.OleCtrls, SHDocVw;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Button4: TButton;
    RadioGroup1: TRadioGroup;
    WebBrowser1: TWebBrowser;
    Label2: TLabel;
    Label3: TLabel;
    Button1: TButton;
    procedure Button4Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);

 private
    { Private declarations }
  public
    f,v,c:text;
    s:string;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses Unit2, Unit3, unit4;


procedure TForm1.Button1Click(Sender: TObject);
begin
form1.Close;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
case radiogroup1.itemindex of
1:
begin
form3.Show;
form1.closemodal;
end;
2:
begin
form4.Show;
form1.closemodal;
end;
end;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
form1.Color:=rgb(77,131,201);
radiogroup1.color:=rgb(97, 158, 237);
form2.Show;
end;

procedure TForm1.RadioGroup1Click(Sender: TObject);
begin
case radiogroup1.itemindex of
0:
begin
label2.Visible:=false;
label3.Visible:=false;
webbrowser1.Visible:=true;
button4.Enabled := false;
    webbrowser1.Navigate(ExtractFilePath(Application.ExeName)+'������.htm');
    end;
1:
begin
label2.Visible:=false;
label3.Visible:=false;
webbrowser1.Visible:=true;
button4.Enabled := true;
    webbrowser1.Navigate(ExtractFilePath(Application.ExeName)+'����.htm');
    end;
2:
begin
label2.Visible:=false;
label3.Visible:=false;
webbrowser1.Visible:=true;
button4.Enabled := true;
    webbrowser1.Navigate(ExtractFilePath(Application.ExeName)+'�������.htm');
    end;

end;
end;

end.
