unit Unit1;

interface

uses
Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, IdTCPClient, IdBaseComponent,
  IdComponent, IdTCPConnection,
     System.NetEncoding;
const
  CLIENT_HOST ='localhost';
  CLIENT_PORP = 8080;
  CONNECT_TIMEOUT = 5000;

type
  TForm1 = class(TForm)
    IdTCPClient1: TIdTCPClient;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    LabelINN: TLabel;
    MemoMess: TMemo;
    ButtonSend: TButton;
    GroupBox2: TGroupBox;
    MemoReceived: TMemo;
    GroupBox3: TGroupBox;
    MemoSend: TMemo;
    ButtonDisconnect: TButton;
    ButtonConnect: TButton;
    Memo1Send: TMemo;
    Memo1Mess: TMemo;

    procedure IdTCPClient1Connected(Sender: TObject);

    procedure ButtonSendClick(Sender: TObject);
    procedure ButtonConnectClick(Sender: TObject);
    procedure ButtonDisconnectClick(Sender: TObject);
    procedure IdTCPClient1Disconnected(Sender: TObject);

    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
  function DecodeMessage(const EncodedMsg: string): string;
  function EncodeMessage(const Msg: string): string;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
procedure TForm1.ButtonDisconnectClick(Sender: TObject);
begin
    ButtonConnect.Enabled:=true;
    ButtonDisconnect.Enabled:=false;;

  IdTCPClient1.Disconnect;
end;

procedure TForm1.ButtonConnectClick(Sender: TObject);
begin

    ButtonConnect.Enabled:=false;
    ButtonDisconnect.Enabled:=true;
    try
    IdTCPClient1.ConnectTimeout := CONNECT_TIMEOUT;
    IdTCPClient1.Connect;
   except
    on E: Exception do
      Memo1Mess.Lines.Add('Error connecting to server: ' + E.Message);
  end;

end;


procedure TForm1.ButtonSendClick(Sender: TObject);
var
  XMLToSend: string;
  Response: string;
begin

XMLToSend := '<?xml version="1.0" encoding="UTF-8"?>' +sLineBreak+
    '<Request>' +sLineBreak+
    '  <Method>GetBankAccountDetails</Method>' +
    '  <Params>' +sLineBreak+
    '    <INN>' + Edit1.Text + '</INN>' +sLineBreak+
    '    <AccountNumber>4070233485485985</AccountNumber>' +
    '  </Params>' +sLineBreak+
    '</Request>'+sLineBreak;
  IdTCPClient1.Socket.WriteLn(EncodeMessage(XMLToSend));
  Memo1Send.Lines.Add('Sent XML: ' + XMLToSend);
  Response := IdTCPClient1.IOHandler.ReadLn;
  MemoReceived.Lines.Add(DecodeMessage(Response));
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Memo1Send.Clear;
  MemoReceived.Clear;
  Memo1Mess.Clear;

  IdTCPClient1.Host :=CLIENT_HOST;
  IdTCPClient1.Port :=CLIENT_PORP;
end;

procedure TForm1.IdTCPClient1Connected(Sender: TObject);
begin
 try
    Memo1Mess.Lines.Add('Connected to server');
  except
    on E: Exception do
      Memo1Mess.Lines.Add('Error connecting to server: ' + E.Message);
  end;
end;

procedure TForm1.IdTCPClient1Disconnected(Sender: TObject);
begin
    Memo1Mess.Lines.Add('Disconnected from server');
end;

function TForm1.DecodeMessage(const EncodedMsg: string): string;
var
  CodeStr: string;
  i: Integer;
begin
  Result := '';
  CodeStr := '';
  for i := 1 to Length(EncodedMsg) do
  begin
    if EncodedMsg[i] = ' ' then
    begin
      Result := Result + Chr(StrToInt(CodeStr));
      CodeStr := '';
    end
    else
      CodeStr := CodeStr + EncodedMsg[i];
  end;
  if CodeStr <> '' then
    Result := Result + Chr(StrToInt(CodeStr));
end;

function TForm1.EncodeMessage(const Msg: string): string;
var
  i: Integer;
begin
  Result := '';
  for i := 1 to Length(Msg) do
  begin
    Result := Result + IntToStr(Ord(Msg[i])) + ' ';
  end;
  Result := Trim(Result);
end;
end.
