unit Gmail_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IdIOHandler, IdIOHandlerSocket,
  IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdMessage, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase,
  IdMessageClient, IdSMTPBase, IdSMTP, Vcl.StdCtrls;

type
  TForm4 = class(TForm)
    IdSMTP1: TIdSMTP;
    IdMessage1: TIdMessage;
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    Label1: TLabel;
    edtUserName: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    estPassword: TEdit;
    edtTarget: TEdit;
    edtSubject: TEdit;
    edtBody: TEdit;
    btnEmail: TButton;
    procedure btnEmailClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}
procedure Gmail(username,password,totarget,subject,body:string);
var
DATA : TIdMessage;
SMTP : TIdSMTP;
SSL : TIdSSLIOHandlerSocketOpenSSL;
begin

SMTP := TIdSMTP.Create(nil);
DATA := TIdMessage.Create(nil);
SSL := TIdSSLIOHandlerSocketOpenSSL.Create(nil);

ssl.SSLOptions.Method := sslvTLSv1;
ssl.SSLOptions.Mode := sslmUnassigned;
ssl.SSLOptions.VerifyMode := [];
ssl.SSLOptions.VerifyDepth := 0;

DATA.From.Address := username;
DATA.Recipients.EMailAddresses := totarget;
DATA.Subject := subject;
DATA.Body.Text := body;

SMTP.IOHandler := SSL;
SMTP.Host := 'smtp.gmail.com';
SMTP.Port := 587;
SMTP.Username := username;
SMTP.Password := password;
SMTP.UseTLS := utUseExplicitTLS;
SMTP.Connect;
SMTP.Authenticate;
SMTP.Send(DATA);
SMTP.Disconnect();
SMTP.Free;
DATA.Free;
SSL.Free;



end;


procedure TForm4.btnEmailClick(Sender: TObject);
begin
try
  Gmail(edtUserName.Text,estPassword.Text,edtTarget.Text,edtSubject.Text,edtBody.Text);
finally

end;
end;

end.
