unit Login_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, REST.Types,
  REST.Client, Data.Bind.Components, Data.Bind.ObjectScope,System.JSON,InventoryManger_u,GlobalData_u,Customer_u,SalesManager_u,CustomerRelationshipManger_u;



type
  TfrmLogin = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edtEmail: TEdit;
    Label3: TLabel;
    edtPassword: TEdit;
    Button1: TButton;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    procedure Button1Click(Sender: TObject);

  private
    { Private declarations }

  public
    { Public declarations }

  end;

var
  frmLogin: TfrmLogin;
  LoginResponseContent: string;
  LoginRole : string;


implementation

{$R *.dfm}



procedure TfrmLogin.Button1Click(Sender: TObject);
var
  RequestBody: TJSONObject;
  role: String;
begin
  RequestBody := TJSONObject.Create;
  try
    RequestBody.AddPair('email', edtEmail.Text);

    RequestBody.AddPair('password', edtPassword.Text);

    RESTRequest1.Params.Clear;
    RESTRequest1.Params.AddItem('Content-Type', 'application/json', TRESTRequestParameterKind.pkHTTPHEADER, [poDoNotEncode]);
    RESTRequest1.Body.ClearBody;
    RESTRequest1.Body.Add(RequestBody);
    RESTRequest1.Execute;

    frmSalesManager.SetSelectedEmail(edtEmail.Text);
    frmCustomer.SetSelectedEmail(edtEmail.Text);





    if RESTResponse1.StatusCode = 200 then
    begin
      role := TJSONObject.ParseJSONValue(RESTResponse1.Content).GetValue<string>('role');
      if role <> '' then
      begin
        if role = 'Customer Relationship Manager' then
          frmCustomerRelationshipManager.Show
        else if role = 'Customer' then
          frmCustomer.Show
        else if role = 'Sales Manager' then

           frmSalesManager.Show



        else if role = 'Inventory Manager' then
          frmInventoryManager.Show
        else
          ShowMessage('Unknown role: ' + role);
      end
      else
        ShowMessage('No role found for this user.');
    end
    else
      ShowMessage('Login unsuccessful. Please try again.');
  finally
    RequestBody.Free;
    edtEmail.Text := '';
    edtPassword.Text := '';
    frmLogin.Close;
  end;
end;



end.
