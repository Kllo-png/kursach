unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.Imaging.pngimage;

type
  TForm2 = class(TForm)
    ProgressBar1: TProgressBar;
    Timer1: TTimer;
    Label1: TLabel;
    Image1: TImage;
    procedure Timer1Timer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation
uses unit1;

{$R *.dfm}


procedure TForm2.FormActivate(Sender: TObject);
begin
form2.Color:=rgb(97, 158, 237);
end;

procedure TForm2.Timer1Timer(Sender: TObject);
begin
if progressbar1.position<progressbar1.max then
progressbar1.Position:=progressbar1.Position+10
else
begin
form1.show;
  close;
  timer1.Enabled:=false;

end;
end;
end.
