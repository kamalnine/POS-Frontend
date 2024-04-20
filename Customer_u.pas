unit Customer_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  REST.Types, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope,System.JSON,Datasnap.DBClient,
  Vcl.StdCtrls;

type
  TfrmCustomer = class(TForm)
    DBGrid1: TDBGrid;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    Label1: TLabel;
    EditTotalAmount: TEdit;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
     ClientDataSet: TClientDataSet;
      procedure CalculateTotalAmount;

  public
    { Public declarations }
      FSelectedEmail : string;
      procedure SetSelectedEmail(Email: string);
  end;

var
  frmCustomer: TfrmCustomer;

implementation

procedure TfrmCustomer.SetSelectedEmail(Email: string);
begin
  // Store the provided ID in the class field
  FSelectedEmail := Email;
end;
{$R *.dfm}

procedure TfrmCustomer.FormShow(Sender: TObject);
var
  jsv: TJSONValue;
  jsonArray: TJSONArray;
  jsonObject: TJSONObject;
  i: Integer;
begin

  try
    // Make a REST request to fetch orders for the given customer email
    RESTRequest1.Params.ParameterByName('email').Value := FSelectedEmail;
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


            ClientDataSet.FieldDefs.Add('ProductNames', Data.DB.ftString, 35);
            ClientDataSet.FieldDefs.Add('CustomerEmail', Data.DB.ftString,20);
            ClientDataSet.FieldDefs.Add('Quantity', Data.DB.ftString,20);
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



            ClientDataSet.FieldByName('ProductNames').AsString := jsonObject.GetValue('productNames').Value;
            ClientDataSet.FieldByName('CustomerEmail').AsString := jsonObject.GetValue('customerEmail').Value;
            ClientDataSet.FieldByName('Quantity').AsString := jsonObject.GetValue('quantity').Value;
            ClientDataSet.FieldByName('TotalAmount').AsFloat := jsonObject.GetValue('totalAmount').Value.ToDouble;
            ClientDataSet.Post;
          end;

          // Bind ClientDataSet to DBGrid
          DBGrid1.DataSource := TDataSource.Create(Self);
          DBGrid1.DataSource.DataSet := ClientDataSet;

            CalculateTotalAmount;
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

procedure TfrmCustomer.CalculateTotalAmount;
var
  TotalAmount: Double;
begin
  TotalAmount := 0.0;

  // Sum up the TotalAmount field of each record in the ClientDataSet
  ClientDataSet.First;
  while not ClientDataSet.Eof do
  begin
    TotalAmount := TotalAmount + ClientDataSet.FieldByName('TotalAmount').AsFloat;
    ClientDataSet.Next;
  end;

  // Display the total amount in the EditTotalAmount edit box
  EditTotalAmount.Text := FormatFloat('$#,##0.00', TotalAmount);
end;


end.
