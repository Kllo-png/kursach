unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.Buttons;

type
  TForm3 = class(TForm)
    StringGrid1: TStringGrid;
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    label3: TLabel;
    StringGrid2: TStringGrid;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    label4: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Label2: TLabel;
    Image1: TImage;
    Button7: TButton;
    Label1: TLabel;
    Button8: TButton;
    StringGrid3: TStringGrid;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Timer1: TTimer;
    Panel3: TPanel;
    Panel4: TPanel;
    Button9: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
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
  Form3: TForm3;

implementation

{$R *.dfm} uses math, Unit4,unit1, Unit5, Unit6,unit7;

procedure TForm3.Button1Click(Sender: TObject);
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



procedure TForm3.Button2Click(Sender: TObject);
var i, v, c: Integer;
begin
  for i := StringGrid1.ColCount - 1 downto 0 do
  begin
    if (StringGrid1.Cells[i, 0] = '') and (stringgrid2.Cells[0,0] <> '') then
    begin
      StringGrid2.Canvas.Brush.Color := clRed;
      StringGrid1.Canvas.Brush.Color := clGreen;
      StringGrid2.Canvas.FillRect(StringGrid2.CellRect(0, 0));
      StringGrid1.Canvas.FillRect(StringGrid1.CellRect(i, 0));

      Sleep(500);

      StringGrid1.Cells[i, 0] := StringGrid2.Cells[0, 0];
      StringGrid2.Cells[0, 0] := '';
      for v :=0 to stringgrid2.ColCount-2 do
      begin
        StringGrid2.Cells[v, 0] := StringGrid2.Cells[v+1, 0];
        stringgrid2.Cells[v+1,0]:='';
      end;
      StringGrid1SetEditText(Sender, 0, 0, StringGrid1.Cells[0, 0]);
      exit;
    end;
  end;

  if (StringGrid1.ColCount < 12) and (StringGrid2.Cells[0, 0] <> '') then
  begin
    Edit1.Text := IntToStr(StringGrid1.ColCount + 1);
    StringGrid1.Width := 56 * StringGrid1.ColCount;
    StringGrid2.Canvas.Brush.Color := clRed;
    StringGrid1.Canvas.Brush.Color := clGreen;
    StringGrid2.Canvas.FillRect(StringGrid2.CellRect(0, 0));
    StringGrid1.Canvas.FillRect(StringGrid1.CellRect(i, 0));
    Sleep(500);
    for v := stringgrid1.ColCount-1 downto 1 do
    begin
    stringgrid1.Cells[v,0]:=stringgrid1.Cells[v-1,0];
    stringgrid1.cells[v-1,0]:='';
    end;


    StringGrid1.Cells[0, 0] := StringGrid2.Cells[0, 0];
    for c := 0 to stringgrid2.ColCount-2 do
    begin
    stringgrid2.cells[c,0]:=stringgrid2.Cells[c+1,0];
    stringgrid2.Cells[c+1,0]:='';
    end;
    StringGrid1SetEditText(Sender, 0, 0, StringGrid1.Cells[0, 0]);

  end
  else
    ShowMessage('Невозможно добавить новое число');
end;

procedure TForm3.Button3Click(Sender: TObject);
var i:integer;
begin
if stringgrid1.ColCount>1 then
begin
stringgrid1.Cells[0,0]:='';
stringgrid1.canvas.brush.Color:=clred;
stringgrid1.canvas.fillrect(stringgrid1.cellrect(0,0));
sleep(500);
for i := 0 to stringgrid1.ColCount-2 do
begin
stringgrid1.Cells[i,0]:=stringgrid1.cells[i+1,0];
stringgrid1.Cells[i+1,0]:='';
end;
edit1.Text:=inttostr(stringgrid1.ColCount-1);
StringGrid1SetEditText(Sender, 0, 0, StringGrid1.Cells[0, 0]);
end
else
showmessage('Невозможно удалить элементы');

end;

procedure TForm3.Button4Click(Sender: TObject);
var i:integer;
begin
 for i:= 0 to stringgrid1.colcount-1 do
 stringgrid1.Cells[i,0]:='';
 StringGrid1SetEditText(Sender, 0, 0, StringGrid1.Cells[0, 0]);

end;

procedure TForm3.Button5Click(Sender: TObject);
begin
form3.close;
form4.show;

end;

procedure TForm3.Button6Click(Sender: TObject);
begin
form3.Close;
form5.show;
end;

procedure TForm3.Button7Click(Sender: TObject);
begin
form3.Close;
form7.show;
end;

procedure TForm3.Button8Click(Sender: TObject);
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
  label6.visible:=true;
  label6.Caption:='Элемент есть в стеке';
  timer1.Enabled:=true;
  end
  else
  begin
   label6.Visible:=true;
   label6.Caption:='Элемента нет в стеке';
   timer1.Enabled:=true;
  end;

end;
end;



procedure TForm3.Button9Click(Sender: TObject);
begin
if stringgrid1.Cells[0, 0] <> '' then
begin
label7.Visible:=true;
label7.Caption:='Последний элемент='+stringgrid1.cells[0,0];
timer1.Enabled:=true;
end
else
showmessage('Элемента не существует');
end;

procedure TForm3.Edit1Change(Sender: TObject);
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
showmessage('Введено некорректное число');
edit1.text:='1';
end;
end;


procedure TForm3.FormActivate(Sender: TObject);

begin
panel1.Color:=RGB(77,131,201);
panel2.color:=RGB(77,131,201);
panel3.Color:=rgb(97, 158, 237);
panel4.Color:=rgb(97, 158, 237);
end;

procedure TForm3.Image1Click(Sender: TObject);
begin
form3.Close;
form1.Show;
end;


procedure TForm3.StringGrid1SetEditText(Sender: TObject; ACol, ARow: Integer;
  const Value: string);
  var i:integer;
  pusto:boolean;
begin
pusto:=true;
for i := 0 to stringgrid1.ColCount-1 do
begin
if stringgrid1.Cells[i, 0] <> '' then
begin
pusto := false;
label4.Visible:=true;
label4.Left:=246+(55*i);
exit;
end;
end;
if pusto=true then
label4.Visible:=false;
end;

procedure TForm3.Timer1Timer(Sender: TObject);
begin
label6.Visible:=false;
label7.Visible:=false;
timer1.Enabled:=false;
end;

end.
