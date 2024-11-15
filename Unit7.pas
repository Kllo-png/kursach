unit Unit7;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage;

type
  TForm7 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Timer1: TTimer;
    Button1: TButton;
    RadioGroup1: TRadioGroup;
    Label3: TLabel;
    Image1: TImage;
    Label4: TLabel;
    edit1: TEdit;
    Timer2: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
  private
    { Private declarations }
  public
    s:string;
    f:text;
    ball:integer; nvern:integer;
  end;

var
  Form7: TForm7;

implementation

{$R *.dfm}  uses unit4,unit3,unit1;



procedure TForm7.FormCreate(Sender: TObject);
begin
radiogroup1.Color:=rgb(97, 158, 237);
form7.Color:=rgb(77,131,201);
label2.caption:='������ ���� �� 15 �������� ��������� �� 5 �����.'+#13#10'��������� ��������� ������������������ ���� ��� ������� ������ �� 10 �� 15 �������� ����������'+#13#10+'������ ���������� ����� ������ �� ������ ������';
assignfile(f,ExtractFilePath(Application.ExeName)+'test.txt');
ball:=0;
Reset(f);
Readln(f,s);
repeat
  if(s[1]='-') then
  begin
    delete(s,1,1);
    radiogroup1.caption:=s;
     end
    else if s[1]='*' then
    begin
      delete(s,1,1);
      nvern:=StrToInt(s)
      end
     else radiogroup1.Items.Add(s);
readln(f,s);
until (s[1]='-') or (eof(f));
end;

procedure TForm7.Image1Click(Sender: TObject);
begin
form7.Close;
form1.show;
end;

procedure TForm7.Timer1Timer(Sender: TObject);
begin
edit1.Text:=inttostr(strtoint(edit1.Text)-1);
end;

procedure TForm7.Timer2Timer(Sender: TObject);
begin
timer1.Enabled:=false;
radiogroup1.Enabled:=false;
button1.Enabled:=false;
label3.Caption := '���������� �������: '+inttostr(ball)+#13#10+'������� ���������� �������:'+floattostr(ball/15*100)+'%';

end;

procedure TForm7.Button1Click(Sender: TObject);
begin
timer1.Enabled:=true;
timer2.Enabled:=true;
  if (radiogroup1.ItemIndex > -1) and (not Eof(f)) then
  begin
  if radiogroup1.ItemIndex = Nvern-1 then ball:=ball+1;
    radiogroup1.Items.Clear();
    Repeat
      if Length(s) >= 1 then
      begin
        if (s[1] = '-') then
        begin
          Delete(s, 1, 1);
          radiogroup1.Caption := s;
        end
        else if (s[1] = '*') then
        begin
          Delete(s, 1, 1);
          Nvern := StrToInt(s);
        end
        else
        begin
          radiogroup1.Items.Add(s);
        end;
        Readln(f, s);
      end;
    until (Length(s) < 1) or (s[1] = '-');
  end
  else if Eof(f) then
  begin
    if radiogroup1.ItemIndex = Nvern - 1 then
    begin
      ball:= ball+1;
    end;
    radiogroup1.Enabled:=false;
    label3.Caption := '���������� �������: '+inttostr(ball)+#13#10+'������� ���������� �������:'+floattostr((ball/15*100))+'%';
    CloseFile(f);
    radiogroup1.Enabled:=false;
    button1.Enabled := False;
    timer1.Enabled:=false;
  end;
end;


end.
