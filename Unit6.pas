unit Unit6;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.ComCtrls;

type
  TForm6 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Image5: TImage;
    Memo1: TMemo;
    Memo2: TMemo;
    Memo3: TMemo;
    Memo4: TMemo;
    TabControl1: TTabControl;
    procedure FormActivate(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    f:text;
    s:string;
  end;

var
  Form6: TForm6;

implementation

{$R *.dfm} uses math, Unit4,unit1, Unit5, unit3;

procedure TForm6.FormActivate(Sender: TObject);
begin
form6.Color:=rgb(77,131,201);
label1.Caption:='������ ���������� ����� � �� PascalABC'+#13#10+'� ��� ����������� ���������� 10 ������� �� 10';
label2.Caption:='��� �� ����������� ����, �� �� ������ 1 ������� �'+#13#10+'������ ��������� ������ ���������';
label3.Caption:='� ����������� ���� �� �������� ������� -100 �'+#13#10+'� ������ ��������� ������ ���������';
label4.Caption:='������ ����������� ���� �� �������� �� ���������'+#13#10+'� ������ ��������� ������ ���������';
label6.Caption:='��������� ������ ���������';
label7.Caption:='��������� ������ ���������';
label8.Caption:='��������� ������ ���������';
assignfile(f,'D:\Delphi\Projects\Kursach\Win32\Stack_spravka.txt');
reset(f);
while not eof(f) do
begin
  readln(f,s);
  if (s[1]='*') then
  begin
      delete(s,1,1);
  memo1.Lines.Add(s)
  end
  else if (s[1]='-') then
  begin
      delete(s,1,1);
    memo2.Lines.Add(s);
  end
  else if (s[1]='+') then
  begin
      delete(s,1,1);
    memo3.Lines.Add(s);
  end
  else if (s[1]='%') then
  begin
      delete(s,1,1);
    memo4.Lines.Add(s);
  end;
end;
closefile(f);
end;



procedure TForm6.FormClose(Sender: TObject; var Action: TCloseAction);
begin
memo1.Clear;
memo2.Clear;
memo3.Clear;
memo4.clear
end;

procedure TForm6.Image5Click(Sender: TObject);
begin
form6.Close;
form3.Show;
end;

end.
