unit AllOrders_u;

interface

uses
Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, System.JSON,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, DBClient;


type
  TfrmAllOrders = class(TForm)
    DBGrid1: TDBGrid;
    IdHTTP1: TIdHTTP;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
      ClientDataSet: TClientDataSet;
  public
    { Public declarations }
    procedure DisplayProducts(const ProductsArray: TJSONArray);
  end;

var
  frmAllOrders: TfrmAllOrders;

implementation

{$R *.dfm}

procedure TfrmAllOrders.DisplayProducts(const ProductsArray: TJSONArray);
var
  ProductIndex: Integer;
  ProductJSON: TJSONObject;
begin
  if not Assigned(ClientDataSet) then
  begin
    ClientDataSet := TClientDataSet.Create(Self);
     ClientDataSet.FieldDefs.Add('Id', Data.DB.ftString, 12);
    ClientDataSet.FieldDefs.Add('ProductIDs', Data.DB.ftString, 12);
    ClientDataSet.FieldDefs.Add('ProductNames',  Data.DB.ftString, 21);
    ClientDataSet.FieldDefs.Add('CustomerEmail',  Data.DB.ftString, 21);
    ClientDataSet.FieldDefs.Add('Quantity',  Data.DB.ftString, 12);
    ClientDataSet.FieldDefs.Add('TotalAmount',Data.DB.ftString , 12);

    ClientDataSet.CreateDataSet;
  end
  else
    ClientDataSet.EmptyDataSet;

  for ProductIndex := 0 to ProductsArray.Count - 1 do
  begin
    ProductJSON := ProductsArray.Items[ProductIndex] as TJSONObject;
    ClientDataSet.Append;
    ClientDataSet.FieldByName('Id').AsString := ProductJSON.GetValue('id').Value;
    ClientDataSet.FieldByName('ProductIDs').AsString := ProductJSON.GetValue('productIds').Value;
    ClientDataSet.FieldByName('ProductNames').AsString := ProductJSON.GetValue('productNames').Value;
    ClientDataSet.FieldByName('CustomerEmail').AsString := ProductJSON.GetValue('customerEmail').Value;
    ClientDataSet.FieldByName('Quantity').AsString := ProductJSON.GetValue('quantity').Value;
    ClientDataSet.FieldByName('TotalAmount').AsString := ProductJSON.GetValue('totalAmount').Value;

    ClientDataSet.Post;
  end;

  DBGrid1.DataSource := TDataSource.Create(Self);
  DBGrid1.DataSource.DataSet := ClientDataSet;


end;

procedure TfrmAllOrders.FormCreate(Sender: TObject);
var
  IdHTTP1: TIdHTTP;
  ResponseContent: string;
  ProductsArray: TJSONArray;
  email: string;
  jsv: TJSONValue;
begin
  IdHTTP1 := TIdHTTP.Create(nil);
  try
    try
      // Get products from the server
      ResponseContent := IdHTTP1.Get('http://localhost:5063/api/PurchaseItem');
      ProductsArray := TJSONObject.ParseJSONValue(ResponseContent) as TJSONArray;
     DisplayProducts(ProductsArray);

    


    except
      on E: Exception do
        ShowMessage(E.Message);
    end;
  finally
    // Free the HTTP client
    IdHTTP1.Free;
  end;
end;


end.
