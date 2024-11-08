unit Unit5;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.ComCtrls, Vcl.OleCtrls, SHDocVw;

type
  TForm5 = class(TForm)
    Image5: TImage;
    TabControl1: TTabControl;
    WebBrowser1: TWebBrowser;
    procedure Image5Click(Sender: TObject);
    procedure TabControl1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
  f:text; s:string;
  end;

var
  Form5: TForm5;

implementation

{$R *.dfm} uses unit3,unit4,unit6,unit1;


procedure TForm5.FormShow(Sender: TObject);
begin
form5.Color:=rgb(77,131,201);
webbrowser1.Navigate(ExtractFilePath(Application.ExeName)+'�������_�����.htm');
end;

procedure TForm5.Image5Click(Sender: TObject);
begin
form5.Close;
form1.show;
end;



procedure TForm5.TabControl1Change(Sender: TObject);
begin
case tabcontrol1.tabindex of
0:
begin
    webbrowser1.Navigate(ExtractFilePath(Application.ExeName)+'�������_�����.htm');
    end;
1:
begin
    webbrowser1.Navigate(ExtractFilePath(Application.ExeName)+'�������_�����.htm');
    end;
2:
begin
    webbrowser1.Navigate(ExtractFilePath(Application.ExeName)+'�������_�������.htm');
    end;
3:
begin
  webbrowser1.Navigate(ExtractFilePath(Application.ExeName)+'�������_�������.htm');
end;

end;
end;

end.
