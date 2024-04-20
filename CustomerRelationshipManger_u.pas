unit CustomerRelationshipManger_u;

interface

uses
 Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.JSON, REST.Types,
  REST.Client, Data.Bind.Components, System.Math, Data.Bind.ObjectScope,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls,
  REST.JSON,DateUtils,System.Net.HttpClientComponent,ShellAPI, Vcl.ExtCtrls,
   Vcl.Imaging.jpeg, Vcl.Imaging.pngimage, Vcl.Imaging.gifimg,
  System.Net.URLClient, System.Net.HttpClient,ShowCustomerPurchaseItem_u,Datasnap.DBClient;

type
  TfrmCustomerRelationshipManager = class(TForm)
    DBGrid1: TDBGrid;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
     ClientDataSet: TClientDataSet;
  public
    { Public declarations }
    procedure DisplayOrdersForCustomer(const Email: string);
  end;

var
  frmCustomerRelationshipManager: TfrmCustomerRelationshipManager;

implementation



{$R *.dfm}

procedure TfrmCustomerRelationshipManager.Button1Click(Sender: TObject);
begin
Close;
end;

procedure TfrmCustomerRelationshipManager.DBGrid1CellClick(Column: TColumn);
var
  SelectedEmail: string;
begin
SelectedEmail := ClientDataSet.FieldByName('Email').AsString;
CustomerEmail := SelectedEmail;
Form5.Show;

end;

procedure TfrmCustomerRelationshipManager.DisplayOrdersForCustomer(const Email: string);
var
  jsv: TJSONValue;
  jsonArray: TJSONArray;
  jsonObject: TJSONObject;
  i: Integer;
begin
  try
    // Make a REST request to fetch orders for the given customer email
    RESTRequest1.Resource := 'http://localhost:5063/api/PurchaseItem/Email?email=' + Email;
    RESTRequest1.Execute;

    if RESTResponse1.StatusCode = 200 then
    begin
      jsv := TJSONObject.ParseJSONValue(RESTResponse1.Content);
      try
        if Assigned(jsv) and (jsv is TJSONArray) then
        begin
          jsonArray := jsv as TJSONArray;

          // Create or clear existing ClientDataSet
          if not Assigned(ClientDataSet) then
          begin
            ClientDataSet := TClientDataSet.Create(Self);

            ClientDataSet.FieldDefs.Add('Id', ftInteger);
            ClientDataSet.FieldDefs.Add('ProductIds', ftString, 100);
            ClientDataSet.FieldDefs.Add('ProductNames', ftString, 100);
            ClientDataSet.FieldDefs.Add('CustomerEmail', ftString, 100);
            ClientDataSet.FieldDefs.Add('Quantity', ftString, 100);
            ClientDataSet.FieldDefs.Add('TotalAmount', ftFloat);
            ClientDataSet.CreateDataSet;
          end
          else
            ClientDataSet.EmptyDataSet;

          // Populate the ClientDataSet with retrieved data
          for i := 0 to jsonArray.Count - 1 do
          begin
            jsonObject := jsonArray.Items[i] as TJSONObject;

            ClientDataSet.Append;

            ClientDataSet.FieldByName('Id').AsInteger := jsonObject.GetValue('id').Value.ToInteger;
            ClientDataSet.FieldByName('ProductIds').AsString := jsonObject.GetValue('productIds').Value;
            ClientDataSet.FieldByName('ProductNames').AsString := jsonObject.GetValue('productNames').Value;
            ClientDataSet.FieldByName('CustomerEmail').AsString := jsonObject.GetValue('customerEmail').Value;
            ClientDataSet.FieldByName('Quantity').AsString := jsonObject.GetValue('quantity').Value;
            ClientDataSet.FieldByName('TotalAmount').AsFloat := jsonObject.GetValue('totalAmount').Value.ToDouble;
            ClientDataSet.Post;
          end;

          // Bind ClientDataSet to DBGrid
          DBGrid1.DataSource := TDataSource.Create(Self);
          DBGrid1.DataSource.DataSet := ClientDataSet;
        end;
      finally
        jsv.Free;
      end;
    end;
  except
    on E: Exception do
      ShowMessage('Error: ' + E.Message);
  end;
end;


procedure TfrmCustomerRelationshipManager.FormCreate(Sender: TObject);
var
  jsv: TJSONValue;
  jsonArray: TJSONArray;
  jsonObject: TJSONObject;
  i: Integer;
begin
  try
    RESTRequest1.Execute;
    if RESTResponse1.StatusCode = 200 then
    begin
      jsv := TJSONObject.ParseJSONValue(RESTResponse1.Content);
      try
        if Assigned(jsv) and (jsv is TJSONArray) then
        begin
          jsonArray := jsv as TJSONArray;

          // Create or clear existing ClientDataSet
          if not Assigned(ClientDataSet) then
          begin
            ClientDataSet := TClientDataSet.Create(Self);

            ClientDataSet.FieldDefs.Add('UserName', ftString, 20);
            ClientDataSet.FieldDefs.Add('Email', ftString, 20);
            ClientDataSet.FieldDefs.Add('PhoneNumber', ftString, 20);
            ClientDataSet.FieldDefs.Add('Roles', ftString, 20);
            ClientDataSet.CreateDataSet;
          end
          else
            ClientDataSet.EmptyDataSet;

          // Populate the ClientDataSet with retrieved data
          for i := 0 to jsonArray.Count - 1 do
          begin
            jsonObject := jsonArray.Items[i] as TJSONObject;

            ClientDataSet.Append;

            ClientDataSet.FieldByName('UserName').AsString := jsonObject.GetValue('userName').Value;
            ClientDataSet.FieldByName('Email').AsString := jsonObject.GetValue('email').Value;
            ClientDataSet.FieldByName('PhoneNumber').AsString := jsonObject.GetValue('phoneNumber').Value;
            ClientDataSet.FieldByName('Roles').AsString := jsonObject.GetValue('roles').Value;
            ClientDataSet.Post;
          end;

          // Bind ClientDataSet to DBGrid
          DBGrid1.DataSource := TDataSource.Create(Self);
          DBGrid1.DataSource.DataSet := ClientDataSet;
        end;
      finally
        jsv.Free;
      end;
    end;
  except
    on E: Exception do
      ShowMessage('Error: ' + E.Message);
  end;
end;


end.
