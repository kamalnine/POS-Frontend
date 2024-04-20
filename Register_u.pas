unit Register_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, REST.Types, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, Vcl.StdCtrls, Vcl.ExtCtrls,System.JSON,Login_u;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtUserName: TEdit;
    edtName: TEdit;
    edtpassword: TEdit;
    edtMobileNumber: TEdit;
    Button1: TButton;
    Label5: TLabel;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    Edit1: TEdit;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  RequestBody: TJSONObject;
  RolesArray: TJSONArray;
begin
  try
    RequestBody := TJSONObject.Create;
    RolesArray := TJSONArray.Create; // Create the JSON array for roles
    try
      RequestBody.AddPair('userName', edtUserName.Text);
      RequestBody.AddPair('email', edtName.Text);
      RequestBody.AddPair('password', edtPassword.Text);
      RequestBody.AddPair('phoneNumber', edtMobileNumber.Text);

      // Add roles to the JSON array
      RolesArray.Add('Customer');

      // Add the JSON array to the request body
      RequestBody.AddPair('roles', RolesArray);

      RESTRequest1.Params.Clear;
      RESTRequest1.Params.AddItem('Content-Type', 'application/json', TRESTRequestParameterKind.pkHTTPHEADER, [poDoNotEncode]);
      RESTRequest1.Body.ClearBody;
      RESTRequest1.Body.Add(RequestBody);
      RESTRequest1.Execute;

      if RESTResponse1.StatusCode = 200 then
      begin
        showMessage('Registration Successful! Please login.');
        frmLogin.Show;
      end
      else
      begin
        showMessage('Registration Unsuccessful: ' + RestResponse1.Content);
      end;
    finally
      RequestBody.Free;
      RolesArray.Free;
    end;
  except
    on E: Exception do
    begin
      showMessage('Error: ' + E.Message);
    end;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
frmLogin.Show;
end;

end.
