unit Unit4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TForm4 = class(TForm)
    StringGrid1: TStringGrid;
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    label3: TLabel;
    StringGrid2: TStringGrid;
    Button5: TButton;
    Button6: TButton;
    Label4: TLabel;
    Label5: TLabel;
    Button7: TButton;
    Panel1: TPanel;
    Panel2: TPanel;
    Label2: TLabel;
    Image1: TImage;
    Label1: TLabel;
    Button8: TButton;
    Button9: TButton;
    Label6: TLabel;
    StringGrid3: TStringGrid;
    Label7: TLabel;
    Label8: TLabel;
    Panel3: TPanel;
    Panel4: TPanel;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure StringGrid1SetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: string);
    procedure Button7Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm} uses math, unit3, unit1,unit5,unit7;

procedure TForm4.Button1Click(Sender: TObject);
var
n,i:integer;
begin
for i:=0 to stringgrid1.ColCount-1 do
begin
randomize;
stringgrid1.Cells[i,0]:=inttostr(randomrange(-10,10));
StringGrid1SetEditText(Sender, 0, 0, StringGrid1.Cells[0, 0]);
end;

end;

procedure TForm4.Button2Click(Sender: TObject);
var i,v,c:integer;
begin
for I := 0 to stringgrid1.colcount-1 do
begin
  if stringgrid1.cells[I,0] = '' then
  begin
    stringgrid2.canvas.brush.Color:=clred;
    stringgrid1.Canvas.Brush.Color:=clgreen;
    stringgrid2.canvas.fillrect(stringgrid2.cellrect(0,0));
    stringgrid1.Canvas.FillRect(stringgrid1.cellrect(i,0));

    sleep(500);

    stringgrid1.Cells[I,0] := stringgrid2.cells[0,0];

    stringgrid2.Cells[0,0]:='';
    for v := 0 to stringgrid1.ColCount-2 do
    begin
    stringgrid2.Cells[v,0]:=stringgrid2.cells[v+1,0];
    stringgrid2.Cells[v+1,0]:='';

    end;
    StringGrid1SetEditText(Sender, 0, 0, StringGrid1.Cells[0, 0]);
    Exit;
  end;
end;

if (stringgrid1.ColCount < 12) and (stringgrid2.Cells[0,0]<>'') then
begin
  edit1.Text:=inttostr(stringgrid1.ColCount+1);
  stringgrid1.Width:=56*stringgrid1.ColCount;
  stringgrid2.canvas.brush.Color:=clred;
    stringgrid1.Canvas.Brush.Color:=clgreen;
    stringgrid2.canvas.fillrect(stringgrid2.cellrect(0,0));
    stringgrid1.Canvas.FillRect(stringgrid1.cellrect(i,0));

    sleep(500);
  stringgrid1.Cells[stringgrid1.ColCount-1, 0] := stringgrid2.cells[0,0];
      for c := 0 to stringgrid2.ColCount-1 do
    begin
    stringgrid2.Cells[c,0]:=stringgrid2.cells[c+1,0];
    stringgrid2.Cells[c+1,0]:='';

    end;
    StringGrid1SetEditText(Sender, 0, 0, StringGrid1.Cells[0, 0]);
end
else
  ShowMessage('���������� �������� ����� �����');
end;

procedure TForm4.Button3Click(Sender: TObject);
var i:integer;
begin
if stringgrid1.ColCount>1 then
begin
stringgrid1.Cells[0,0]:='';
stringgrid1.canvas.brush.Color:=clred;
stringgrid1.canvas.fillrect(stringgrid1.cellrect(0,0));
sleep(500);
for i := 0 to stringgrid1.ColCount-1 do
begin
stringgrid1.Cells[i,0]:=stringgrid1.cells[i+1,0];
stringgrid1.Cells[i+1,0]:='';
end;

stringgrid1.Width:=56*stringgrid1.colcount;
edit1.Text:=inttostr(stringgrid1.ColCount-1);
StringGrid1SetEditText(Sender, 0, 0, StringGrid1.Cells[0, 0]);
end
else
showmessage('���������� ������� ��������');
end;

procedure TForm4.Button4Click(Sender: TObject);
begin
var i:integer;
begin
 for i:= 0 to stringgrid1.colcount-1 do
 stringgrid1.Cells[i,0]:='';
 StringGrid1SetEditText(Sender, 0, 0, StringGrid1.Cells[0, 0]);
end;
end;

procedure TForm4.Button5Click(Sender: TObject);
begin
form4.Close;
form3.Show;
end;

procedure TForm4.Button6Click(Sender: TObject);
begin
form4.Close;
form5.show;
end;

procedure TForm4.Button7Click(Sender: TObject);
begin
form4.Close;
form7.show;
end;

procedure TForm4.Button8Click(Sender: TObject);
var i:integer; nalichie:boolean;
begin
nalichie:=false;
if stringgrid3.Cells[0,0]<>'' then
begin
  for i := 0 to stringgrid1.ColCount-1 do
  begin
    if stringgrid1.Cells[i,0]=stringgrid3.Cells[0,0] then
    nalichie:=true;
  end;
  if nalichie=true then
  begin
  label7.visible:=true;
  label7.Caption:='������� ���� � �����';
  timer1.Enabled:=true;
  end
  else
  begin
   label7.Visible:=true;
   label7.Caption:='�������� ��� � �����';
   timer1.Enabled:=true;
  end;

end;
end;

procedure TForm4.Button9Click(Sender: TObject);
begin
if stringgrid1.Cells[stringgrid1.ColCount-1, 0] <> '' then
begin
label8.Visible:=true;
label8.Caption:='��������� �������='+stringgrid1.cells[stringgrid1.ColCount-1,0];
timer1.Enabled:=true;
end
else
showmessage('�������� �� ����������');
end;

procedure TForm4.Edit1Change(Sender: TObject);
var i:integer;
begin
if (strtoint(edit1.Text)>0) and (strtoint(edit1.Text)<13) then
begin
  stringgrid1.colcount:=strtoint(edit1.Text);
  stringgrid1.Width:=56*strtoint(edit1.Text);
  for i := strtoint(edit1.Text) to stringgrid1.colcount-1 do
  stringgrid1.Cells[i,0]:='';
  StringGrid1SetEditText(Sender, 0, 0, StringGrid1.Cells[0, 0]);
end
else
begin
showmessage('������� ������������ �����');
edit1.text:='1';
end;
end;


procedure TForm4.FormActivate(Sender: TObject);
begin
panel1.Color:=RGB(77,131,201);
panel2.color:=RGB(77,131,201);
panel3.Color:=rgb(97, 158, 237);
panel4.Color:=rgb(97, 158, 237);
end;

procedure TForm4.Image1Click(Sender: TObject);
begin
form4.close;
form1.Show;
end;

procedure TForm4.StringGrid1SetEditText(Sender: TObject; ACol, ARow: Integer;
  const Value: string);
var
  i: Integer;
  pusto: Boolean;
begin
  pusto := true;

  for i := 0 to stringgrid1.ColCount - 1 do
  begin
    if stringgrid1.Cells[i, 0] <> '' then
    begin
      pusto := false;
      label5.Visible:=true;
      label5.Left:=254+(55*i);
    end;
  end;
  for i := 0 to stringgrid1.ColCount-1 do
    begin
     if stringgrid1.Cells[i,0]<>'' then
     begin
     label4.Visible:=true;
     label4.Left:=254+(55*i);
     exit;
     end;
    end;
  if pusto then
  begin
    label4.Visible := false;
    label5.Visible := false;
  end;
end;

procedure TForm4.Timer1Timer(Sender: TObject);
begin
label7.Visible:=false;
label8.Visible:=false;
timer1.Enabled:=false;
end;

end.
