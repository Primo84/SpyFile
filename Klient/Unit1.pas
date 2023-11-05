unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ScktComp, StdCtrls, Buttons, IdUDPServer, IdTrivialFTPServer,
  IdUDPBase, IdUDPClient, IdTrivialFTP, IdBaseComponent, IdComponent,
  IdTCPServer, IdMappedPortTCP, IdTCPConnection, IdTCPClient, ExtCtrls,
  Gauges;

type
  TForm1 = class(TForm)
    Spower1: TServerSocket;
    Button1: TButton;
    cpower: TClientSocket;
    Button2: TButton;
    ComboBox1: TComboBox;
    ListBox1: TListBox;
    Button3: TButton;
    ListBox2: TListBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    StaticText1: TStaticText;
    BitBtn3: TBitBtn;
    Label1: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label2: TLabel;
    pob: TClientSocket;
    pplik: TServerSocket;
    roz: TServerSocket;
    Timer1: TTimer;
    BitBtn4: TBitBtn;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Edit3: TEdit;
    ListBox3: TListBox;
    BitBtn5: TBitBtn;
    Edit4: TEdit;
    BitBtn6: TBitBtn;
    Timer2: TTimer;
    Label6: TLabel;
    BitBtn7: TBitBtn;
    Edit5: TEdit;
    Button4: TButton;
    BitBtn8: TBitBtn;
    krozmiar: TClientSocket;
    srozmiar: TServerSocket;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Edit6: TEdit;
    kat: TClientSocket;
    skat: TServerSocket;
    splik: TServerSocket;
    proc: TGauge;
    BitBtn9: TBitBtn;
    res: TClientSocket;
    Button5: TButton;
    udp: TIdUDPClient;
    sip: TServerSocket;
    ListBox4: TListBox;
    Button6: TButton;
    procedure Spower1ClientRead(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure Button1Click(Sender: TObject);
    procedure cpowerConnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure pplikClientRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure rozClientRead(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure Timer1Timer(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure srozmiarClientRead(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure skatClientRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure splikClientRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure BitBtn9Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure sipClientRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure Button6Click(Sender: TObject);
  private
    { Private declarations }
  public
  s:tfilestream;
  zadanie,porcja :integer;
  dysk:string;
  sciezka,plsciez,plsciez1:tcaption;
  katalog:string;
  rozmiar,rozsciag,pozycja,rozsciag1:integer;
  download,baza,baza1:string;
  przer:boolean;
  zakoncz,pobieranie:boolean;
  dlug,ps,rozlist:integer;
  lista:tcaption;
  dlug1,ps1,rozlist1:integer;
  lista1:tcaption;
    { Public declarations }
  end;

var
  Form1: TForm1;
implementation

uses Unit2,unit3;

{$R *.dfm}

procedure TForm1.Spower1ClientRead(Sender: TObject;
  Socket: TCustomWinSocket);
var tekst :string;
    tekst1:string;
count,i,k:integer;
begin
tekst:='0';
tekst1:='0';
try
tekst:=socket.ReceiveText;
except
spower1.Active:=false;
pplik.Active:=false;
roz.Active:=false;
srozmiar.Active:=false;
porcja:=0;
pobieranie:=false;
timer1.Enabled:=false;
timer2.Enabled:=false;
cpower.Active:=false;
pob.Active:=false;
krozmiar.Active:=false;
pob.Host:='';
przer:=false;
Showmessage('Nie mo�na nawiazac po��czenia'+#10+#13
              +'Sci�ganie zostanie przerwane');

spower1.Active:=true;
pplik.Active:=true;
roz.Active:=true;
srozmiar.Active:=true;
exit;
end;
tekst1:=copy(tekst,1,9);
if tekst1='Sprawdzaj'then
begin
showmessage('Komputer :'+Edit5.Text+' ip:'+socket.RemoteAddress+#10#13
              +'ma w��czony komputer');
tekst1:='0';
tekst:='0';
end;
if tekst1='listadysk'then
begin
count:=strtoint(tekst[10]);
tekst1:=copy(tekst,11,length(tekst));
k:=1;
for i:=1 to count do
  begin
   tekst:=copy(tekst1,k,3);
   combobox1.Items.Append(tekst);
   k:=k+3;
  end;
tekst:='0';
tekst1:='0';
end;
if tekst[1]='1'then
begin
delete(tekst,1,1);
i:=Pos('|',tekst);
listbox1.Items.Text:=copy(tekst,1,i-1);
listbox2.Items.Text:=copy(tekst,i+1,length(tekst));
statictext1.Caption:=dysk;
sciezka:=dysk;
tekst:='0';
end;
if tekst[1]='4'then
begin
delete(tekst,1,1);
listbox2.Items.Text:=tekst;
statictext1.Caption:=sciezka;
tekst:='0';
end;
spower1.Active:=false;
spower1.Active:=true;
end;
procedure TForm1.Button1Click(Sender: TObject);
begin
zadanie:=1;
try
cpower.Host:=Edit4.Text;
cpower.Active:=true;
except
application.ProcessMessages;
cpower.Host:='';
zadanie:=0;
showmessage('Nie mo�na nawi�zac po��czenie');
listbox1.Clear;
listbox2.Clear;
edit1.Text:='';
edit2.Text:='';
combobox1.Clear;
statictext1.caption:='';
cpower.Active:=false;
pob.Active:=false;
krozmiar.Active:=false;
pobieranie:=false;
end;
end;
procedure TForm1.cpowerConnect(Sender: TObject; Socket: TCustomWinSocket);
begin
try
if zadanie=1 then cpower.Socket.SendText('Sprawdzaj');
if zadanie=2 then cpower.Socket.SendText('pobierzdysk');
if zadanie=3 then cpower.Socket.SendText('3'+dysk);
if zadanie=5 then cpower.Socket.SendText('5'+sciezka);
if zadanie=6 then cpower.Socket.SendText('koniec');
cpower.Active:=false;
except
showmessage('Nie ma po��czenia');
edit1.Text:='';
edit2.Text:='';
listbox1.Clear;
listbox2.Clear;
statictext1.Caption:='';
combobox1.Clear;
cpower.Active:=false;
pob.Active:=false;
krozmiar.Active:=false;
end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
combobox1.Clear;
try
zadanie:=2;
cpower.Host:=Edit4.Text;
cpower.Active:=true;
except
application.ProcessMessages;
zadanie:=0;
showmessage('Nie mo�na pobra dysk�w poniewa�'+#10+#13+
              'nawi�zac po��czenie');
listbox1.Clear;
listbox2.Clear;
edit1.Text:='';
edit2.Text:='';
combobox1.Clear;
statictext1.caption:='';
cpower.Host:='';
cpower.Active:=false;
pob.Active:=false;
krozmiar.Active:=false;
pobieranie:=false;
end;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
if combobox1.ItemIndex < 0 then showmessage('Nie wybrano �adnego dysku')
else
begin
dysk:=combobox1.Text;
try
kat.Address:=edit4.Text;
kat.Active:=true;
rozlist:=0;
ps:=0;
statictext1.Caption:=combobox1.Text;
kat.Socket.SendText('40|'+combobox1.Text);
kat.Active:=false;
except
application.ProcessMessages;
kat.Active:=false;
cpower.Host:='';
listbox1.Clear;
listbox2.Clear;
edit1.Text:='';
edit2.Text:='';
combobox1.Clear;
statictext1.caption:='';
cpower.Active:=false;
pob.Active:=false;
krozmiar.Active:=false;
pobieranie:=false;
zadanie:=0;
showmessage('Nie mo�na za�adowa dysku poniewa�'+#10+#13+
            'nawi�zac po��czenie');
end;
end;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
if listbox1.ItemIndex <0 then showmessage('Nie wybrano �adnego katalogu')
else
begin
try
kat.Host:=Edit4.Text;
sciezka:=statictext1.Caption;
if sciezka[length(sciezka)]<>'\'then sciezka:=sciezka+'\';
sciezka:=sciezka+listbox1.Items.Strings[listbox1.itemindex];
katalog:=listbox1.Items.Strings[listbox1.itemindex];
statictext1.Caption:=sciezka;
kat.Active:=true;
rozlist:=0;
ps:=0;
kat.Socket.SendText('40|'+sciezka);
kat.Active:=false;
except
application.ProcessMessages;
cpower.Host:='';
showmessage('Brak dost�pu do dysk�w');
zadanie:=0;
cpower.Active:=false;
pob.Active:=false;
krozmiar.Active:=false;
listbox1.Clear;
listbox2.Clear;
edit1.Text:='';
edit2.Text:='';
combobox1.Clear;
statictext1.caption:='';
pobieranie:=false;
end;
end;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
var
z:char;
tekst:string;
begin
try
tekst:=statictext1.Caption;
repeat
z:=tekst[length(tekst)];
if z<>'\'then delete(tekst,length(tekst),1);
until tekst[length(tekst)]='\';
if (length(tekst)>3)then delete(tekst,length(tekst),1);
sciezka:=tekst;
statictext1.Caption:=tekst;
kat.Address:=edit4.Text;
kat.Active:=true;
rozlist:=0;
ps:=0;
kat.Socket.SendText('40|'+tekst);
kat.Active:=false;
except
application.ProcessMessages;
kat.Host:='';
kat.Active:=false;
showmessage('Brak dost�pu do dysk�w');
listbox1.Clear;
listbox2.Clear;
edit1.Text:='';
edit2.Text:='';
combobox1.Clear;
statictext1.caption:='';
zadanie:=0;
cpower.Active:=false;
pob.Active:=false;
krozmiar.Active:=false;
pobieranie:=false;
end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
download:=paramstr(0);
download:=extractfilepath(download);
baza:=download;
baza:=baza+'baza_danych.dat';
baza1:=download;
baza1:=baza1+'baza_danych1.dat';
download:=download+'download';
przer:=false;
pobieranie:=false;
end;
procedure TForm1.BitBtn3Click(Sender: TObject);
var
t:string;
path:tcaption;
plik1:tfilestream;
plik:tmemorystream;
begin
if pobieranie=true then
  begin
  showmessage('Trwa pobieranie pliku,'+#10#13+
            'musisz najpierw zako�czyc ten proces aby pobra nast�pny plik');
   exit;
  end;
try
pobieranie:=true;
porcja:=0;
if listbox2.ItemIndex <0 then showmessage('Nie wybrano �adnego pliku')
else
  begin
  plsciez:=statictext1.Caption;
  if length(plsciez)<>3 then plsciez:=plsciez+'\';
  plsciez:=plsciez+listbox2.Items.Strings[listbox2.itemindex];
  path:=download+'\'+listbox2.Items.Strings[listbox2.itemindex];
  plsciez1:=path;
  if fileexists(path)=true then
    begin
    plik1:=tfilestream.Create(path,fmopenread);
    rozsciag:=plik1.Size;
    rozsciag1:=rozsciag;
    pozycja:=rozsciag;
    plik1.Free;
    end;
   if fileexists(path)=false then
    begin
    plik:=tmemorystream.Create;
    plik.SaveToFile(path);
    plik.Free;
    pozycja:=0;
    rozsciag:=0;
    end;
   pob.Host:=Edit4.Text;
   pob.Active:=true;
   t:='1';
   t:=t+plsciez;
   pob.Socket.SendText(t);
   s:=tfilestream.Create(plsciez1,fmopenreadwrite);
   end;
   except
   application.ProcessMessages;
   if fileexists(path)then deletefile(path);
   listbox1.Clear;
   listbox2.Clear;
   edit1.Text:='';
   edit2.Text:='';
   combobox1.Clear;
   statictext1.caption:='';
   zadanie:=0;
   cpower.Active:=false;
   pob.Active:=false;
   krozmiar.Active:=false;
   pob.Host:='';
   showmessage('Brak dost�pu do pliku sprawd� po��czenie');
   pobieranie:=false;
   end;
end;

procedure TForm1.pplikClientRead(Sender: TObject;
  Socket: TCustomWinSocket);
var
i:integer;
buf:array of byte;
t:string;
reszta,dziel:integer;
begin
timer1.Enabled:=false;
try
i:=socket.ReceiveLength;
porcja:=porcja+i;
setlength(buf,i);
socket.ReceiveBuf(buf[0],i);
s.Seek(s.Size,sofrombeginning);
s.WriteBuffer(buf[0],length(buf));
pozycja:=s.Size;
rozsciag:=s.Size;
proc.Progress:=rozsciag;
dziel:=rozsciag div 1024;
reszta:=rozsciag mod 1024;
edit2.Text:=inttostr(dziel)+','+inttostr(reszta);
if rozsciag=rozmiar then
  begin
  s.Free;
  pob.Socket.SendText('przerwa');
  pob.Active:=false;
  pob.Host:='';
  showmessage('Pobieranie uko�czone');
  edit1.Text:='';
  edit2.Text:='';
  edit3.Text:='';
  timer2.Enabled:=false;
  timer1.Enabled:=false;
  pobieranie:=false;
  proc.Progress:=0;
  proc.MaxValue:=0;
  exit;
  end
else
  begin
  if porcja= 70000 then
  begin
  porcja:=0;
  if przer=true then
  begin
  pobieranie:=false;
  timer1.Enabled:=false;
  timer2.Enabled:=false;
  przer:=false;
  pob.Socket.SendText('przerwa');
  pob.Active:=false;
  showmessage('sci�ganie zosta�o anulowane');
  edit1.Text:='';
  edit2.Text:='';
  edit3.Text:='';
  proc.MaxValue:=0;
  proc.Progress:=0;
  s.Free;
  edit3.Text:='';
  exit;
  end;
  t:='2';
  t:=t+plsciez;
  t:=t+'|';
  t:=t+inttostr(pozycja);
  pob.Socket.SendText(t);
  timer1.Enabled:=false;
  end;
  end;
except
s.Free;
timer2.Enabled:=false;
timer1.Enabled:=false;
spower1.Active:=false;
pplik.Active:=false;
roz.Active:=false;
srozmiar.Active:=false;
showmessage('Brak dost�pu do pliku poniewaz nie mozna nawiazac polaczenia');
edit1.Text:='';
edit2.Text:='';
edit3.Text:='';
proc.MaxValue:=0;
proc.Progress:=0;
listbox1.Clear;
listbox2.Clear;
statictext1.Caption:='';
combobox1.Clear;
pobieranie:=false;
cpower.Active:=false;
pob.Active:=false;
krozmiar.Active:=false;
spower1.Active:=true;
pplik.Active:=true;
roz.Active:=true;
srozmiar.Active:=true;
proc.Progress:=0;
proc.MaxValue:=0;
end;
end;

procedure TForm1.rozClientRead(Sender: TObject;
  Socket: TCustomWinSocket);
var
t:string;
dziel,reszta:integer;
begin
timer1.Enabled:=false;
t:=socket.ReceiveText;
rozmiar:=strtoint(t);
proc.MaxValue:=rozmiar;
if rozmiar=0 then
  begin
  timer1.Enabled:=false;
  timer2.Enabled:=false;
  showmessage('Ten plik zawiera 0 bajt�w');
  pobieranie:=false;
  pob.Active:=false;
  s.Free;
  deletefile(plsciez1);
  exit;
  end;
if rozmiar=s.Size then
  begin
  pob.Active:=false;
  timer1.Enabled:=false;
  timer2.Enabled:=false;
  s.Free;
  pobieranie:=false;
  showmessage('Pobieranie tego pliku zosta�o ju� uko�czone');
  exit;
  end;
dziel:=rozmiar div 1024;
reszta:=rozmiar mod 1024;
t:=inttostr(dziel)+','+inttostr(reszta);
Edit1.Text:=t;
t:='2';
t:=t+plsciez;
t:=t+'|';
t:=t+inttostr(pozycja);
try
if pob.Active=true then pob.Active:=false;
pob.Active:=true;
pob.Socket.SendText(t);
timer2.Enabled:=true;
roz.Active:=false;
roz.Active:=true;
except
s.Free;
timer2.Enabled:=false;
spower1.Active:=false;
pplik.Active:=false;
roz.Active:=false;
srozmiar.Active:=false;
showmessage('Brak dost�pu do pliku poniewaz nie mozna nawiazac polaczenia');
edit1.Text:='';
edit2.Text:='';
listbox1.Clear;
listbox2.Clear;
statictext1.Caption:='';
combobox1.Clear;
cpower.Active:=false;
pob.Active:=false;
krozmiar.Active:=false;
pobieranie:=false;
spower1.Active:=true;
pplik.Active:=true;
roz.Active:=true;
srozmiar.Active:=true;
proc.MaxValue:=0;
end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
timer1.Enabled:=false;
Showmessage('Brak dost�pu do pliku lub nie mo�na nawi�za po��czenia');
if fileexists(plsciez1)then deletefile(plsciez1);
s.Free;
cpower.Active:=false;
pob.Active:=false;
krozmiar.Active:=false;
pobieranie:=false;
spower1.Active:=false;
pplik.Active:=false;
roz.Active:=false;
srozmiar.Active:=false;
spower1.Active:=true;
pplik.Active:=true;
roz.Active:=true;
srozmiar.Active:=true;
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
begin
timer1.Enabled:=false;
przer:=true;
end;

procedure TForm1.Timer2Timer(Sender: TObject);
var
dz,re,transfer:integer;

begin
transfer:=rozsciag-rozsciag1;
rozsciag1:=rozsciag;
dz:=transfer div 1024;
re:=transfer mod 1024;
edit3.Text:=inttostr(dz)+','+inttostr(re);
end;

procedure TForm1.BitBtn6Click(Sender: TObject);
type osoba = record
      komp:string[100];
      ip:string[15];
      end;
var
os:osoba;
zk,zp:string;
zap:boolean;
p : file of osoba;
begin
zap:=true;
form2:=tform2.Create(self);
repeat
zakoncz:=true;
if form2.ShowModal=mrok then
  begin
  if (form2.edit1.Text<>'')and(form2.Edit2.Text<>'') then
    begin
    zakoncz:=true;
    os.komp:=form2.Edit1.Text;
    os.ip:=form2.Edit2.Text;
    assignFile(p,baza);
    if fileexists(baza)=false then rewrite(p) else reset(p);
    if fileexists(baza)=true then
      begin
      zk:=os.komp;
      zp:=os.ip;
      while not eof(p) do
        begin
        read(p,os);
        if zk=os.komp then
          begin
          showmessage('osoba o takich danych ju� istnieje');
          zap:=false;
          zakoncz:=false;
          end
        else
          begin
          os.komp:=zk;
          os.ip:=zp;
          zap:=true;
          end;
        end;
      end;
    if zap=true then write(p,os);
    closefile(p);
    end
  else
    begin
    zakoncz:=false;
    showmessage('Pole IP lub HOST jest puste');
    end;
  end;
until zakoncz=true;
listbox3.Clear;
form2.Free;
form1.Hide;
Form1.Show;
end;

procedure TForm1.BitBtn7Click(Sender: TObject);
type
  pl=record
  komp:string[100];
  ip:string[15];
    end;
var
os:pl;
baz:file of pl;
baz1:file of pl;
k :string;
begin
if listbox3.ItemIndex<0 then
  begin
  showmessage('Nie wybrano komputera do usuni�cia');
  exit;
  end;
if fileexists(baza)=false then
  begin
  showmessage('Baza danych jest ju� pusta');
  exit;
  end;
k:=listbox3.Items.Strings[listbox3.itemindex];
assignfile(baz,baza);
assignfile(baz1,baza1);
rewrite(baz1);
reset(baz);
while not eof(baz)do
  begin
  read(baz,os);
  if os.komp<>k then write(baz1,os);
  end;
closefile(baz);
closefile(baz1);
assignfile(baz,baza);
assignfile(baz1,baza1);
rewrite(baz);
reset(baz1);
while not eof(baz1)do
  begin
  read(baz1,os);
  write(baz,os);
  end;
closefile(baz);
closefile(baz1);
deletefile(baza1);
listbox3.Clear;
form1.Hide;
Form1.Show;
end;

procedure TForm1.FormShow(Sender: TObject);
type baz=record
    k:string[100];
    ip:string[15];
    end;
var
os:baz;
p:file of baz;
begin
if fileexists(baza) then
  begin
  assignfile(p,baza);
  reset(p);
  while not eof(p) do
    begin
    read(p,os);
    listbox3.Items.Append(os.k);
    end;
  end
  else showmessage('Nie mo�na odnale�c pliku z baz� danych');
end;

procedure TForm1.BitBtn5Click(Sender: TObject);
type
rek =record
  k:string[100];
  ip:string[15];
  end;
var
pli :file of rek;
os :rek;
begin
if listbox3.ItemIndex<0 then showmessage('Nie wybrano �dnego komputera do za�adowania')
else
  begin
  edit5.Text:=listbox3.Items.Strings[listbox3.itemindex];
  listbox1.Clear;
  listbox2.Clear;
  edit1.Text:='';
  edit2.Text:='';
  edit3.Text:='';
  combobox1.Clear;
  assignfile(pli,baza);
  reset(pli);
  while not eof(pli)do
    begin
    read(pli,os);
    if os.k=edit5.Text then edit4.Text:=os.ip;
    end;
  closefile(pli);
  end;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
try
spower1.Active:=true;
pplik.Active:=true;
roz.Active:=true;
srozmiar.Active:=true;
skat.Active:=true;
splik.Active:=true;
sip.Active:=true;
except
showmessage('Wyst�pil bl�d spr�buj ponownie uruchomic komputer');
end;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
if messagebox(handle,'Czy napewno chcesz wyl�czyc program ?','Wyl�cz',mb_YesNo)=idYes then
begin
if pobieranie=true then
  begin
  showmessage('Trwa pobieranie pliku,'+#10#13+
            'musisz najpierw zako�czyc ten proces aby pobra nast�pny plik');
   exit;
  end;
if edit4.Text='' then
  begin
  showmessage('Nie wybrano komputera');
  exit;
  end;
try
cpower.Address:=edit4.Text;
pob.Active:=false;
zadanie:=6;
cpower.Active:=true;
except
cpower.Active:=false;
pob.Active:=false;
krozmiar.Active:=false;
pobieranie:=false;
end;
end;
end;

procedure TForm1.BitBtn8Click(Sender: TObject);
var
t:string;
begin
try
if listbox2.ItemIndex<0 then
  begin
  showmessage('Nie wybrano pliku');
  exit;
  end;
krozmiar.Host:=edit4.Text;
t:=statictext1.Caption;
if t[length(t)]<>'\'then t:=t+'\';
t:=t+listbox2.Items.Strings[listbox2.itemindex];
krozmiar.Active:=true;
krozmiar.Socket.SendText(t);
krozmiar.Active:=false;
except
application.ProcessMessages;
showmessage('Nie mozna nawiazac pol�czenia');
cpower.Active:=false;
pob.Active:=false;
krozmiar.Active:=false;
pobieranie:=false;
end;
end;

procedure TForm1.srozmiarClientRead(Sender: TObject;
  Socket: TCustomWinSocket);
var
t:string;
dziel,reszta,r:integer;
begin
try
t:=socket.ReceiveText;
except
spower1.Active:=false;
pplik.Active:=false;
roz.Active:=false;
srozmiar.Active:=false;
showmessage('Utracono pol�czenie');
spower1.Active:=true;
pplik.Active:=true;
roz.Active:=true;
srozmiar.Active:=true;
exit;
end;
r:=strtoint(t);
dziel:=r div 1024;
reszta:=r mod 1024;
t:=inttostr(dziel)+','+inttostr(reszta);
Edit6.Text:=t;
srozmiar.Active:=false;
srozmiar.Active:=true;
end;

procedure TForm1.skatClientRead(Sender: TObject; Socket: TCustomWinSocket);
var
i:integer;
tekst:tcaption;
begin
tekst:=socket.ReceiveText;
if tekst[1]='1'then
  begin
  i:=pos('|',tekst);
  dlug1:=strtoint(copy(tekst,2,i-2));
  if dlug1=0 then
    begin
    listbox1.Items.Text:='';
    exit;
    end;
  delete(tekst,1,i);
  end;
if tekst[1]='2' then delete(tekst,1,1);
ps1:=ps1+length(tekst);
rozlist1:=rozlist1+length(tekst);
lista1:=lista1+tekst;
if rozlist=dlug then
  begin
  listbox1.Items.Text:=lista1;
  lista1:='';
  tekst:='';
  end;
if ps=4000 then
  begin
  tekst:='4';
  tekst:=tekst+inttostr(rozlist1)+'|';
  ps:=0;
  try
  kat.Active:=true;
  kat.Socket.SendText(tekst);
  kat.Active:=false;
  except
  kat.Active:=false;
  showmessage('Wystapil bl�d podczas przesylania listy plik�w');
  exit;
  end;
  end;
end;

procedure TForm1.splikClientRead(Sender: TObject;
  Socket: TCustomWinSocket);
var
i:integer;
tekst:tcaption;
begin
tekst:=socket.ReceiveText;
if tekst[1]='1'then
  begin
  i:=pos('|',tekst);
  dlug:=strtoint(copy(tekst,2,i-2));
  if dlug=0 then
   begin
   listbox2.Items.Text:='';
    try
    kat.Active:=true;
    kat.Socket.SendText('50|');
    kat.Active:=false;
    except
    kat.Active:=false;
    showmessage('Wyst�pil bl�d podaczas pobierania listy katalog�w');
    exit;
    end;
   exit;
   end;
  delete(tekst,1,i);
  end;
if tekst[1]='2' then delete(tekst,1,1);
ps:=ps+length(tekst);
rozlist:=rozlist+length(tekst);
lista:=lista+tekst;
if rozlist=dlug then
  begin
  listbox2.Items.Text:=lista;
  lista:='';
  tekst:='';
  try
  kat.Active:=true;
  kat.Socket.SendText('50|');
  kat.Active:=false;
  except
  kat.Active:=false;
  showmessage('Wyst�pil bl�d podaczas pobierania listy katalog�w');
  exit;
  end;
  exit;
  end;
if ps=4000 then
  begin
  tekst:='4';
  tekst:=tekst+inttostr(rozlist)+'|';
  ps:=0;
  try
  kat.Active:=true;
  kat.Socket.SendText(tekst);
  kat.Active:=false;
  except
  kat.Active:=false;
  showmessage('Wystapil bl�d podczas przesylania listy plik�w');
  exit;
  end;
  end;
end;
procedure TForm1.BitBtn9Click(Sender: TObject);
begin
if messagebox(handle,'CZy napewno chcesz restartowac program ?','Restart',MB_YESNO)=idYes then
  begin
  if pobieranie=true then
  begin
  showmessage('Trwa pobieranie pliku,'+#10#13+
            'musisz najpierw zako�czyc ten proces aby zrestartowac program');
   exit;
  end;
  if edit4.Text='' then
    begin
    showmessage('Wybierz najpierw komputer');
    exit;
    end;
  try
  zadanie:=0;
  res.Address:=edit4.Text;
  res.Active:=true;
  res.Socket.SendText('restart');
  res.Active:=false;
  except
  cpower.Active:=false;
  showmessage('Nie mo�na nawi�zac pol�czenia');
  end;
  end;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
form3:=tform3.Create(self);
if form3.ShowModal=mrok then
  begin
  try
  udp.Active:=true;
  udp.Send(form3.Edit1.Text,udp.Port,'IP');
  except
  showmessage('Bledny adres');
  end;
  end;
form3.Free;
end;

procedure TForm1.sipClientRead(Sender: TObject; Socket: TCustomWinSocket);
var
s:string;
begin
s:=socket.ReceiveText;
if s='IP' then listbox4.Items.Add(socket.RemoteAddress);
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
listbox4.Clear;
end;

end.
