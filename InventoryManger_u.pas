unit InventoryManger_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, System.JSON, InventoryUpdate_u,
  Vcl.StdCtrls;

type
  TfrmInventoryManager = class(TForm)
    DBGrid1: TDBGrid;
    IdHTTP1: TIdHTTP;
    Label1: TLabel;
    edtCategory: TEdit;
    Submit: TButton;
    edtSearch: TEdit;
    Label2: TLabel;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
     procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure SubmitClick(Sender: TObject);
    procedure edtSearchChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormClick(Sender: TObject);
  private
    { Private declarations }
    ClientDataSet: TClientDataSet;
    procedure HandleException(const Msg: string; E: Exception);
    procedure FetchProducts(const Category: string);
  public
    { Public declarations }
    id: Integer;
    procedure DisplayProducts(const ProductsArray: TJSONArray);
  end;

var
  frmInventoryManager: TfrmInventoryManager;

implementation

{$R *.dfm}

procedure TfrmInventoryManager.DisplayProducts(const ProductsArray: TJSONArray);
var
  ProductIndex: Integer;
  ProductJSON: TJSONObject;
begin
  if not Assigned(ClientDataSet) then
  begin
    ClientDataSet := TClientDataSet.Create(Self);
    ClientDataSet.FieldDefs.Add('Sr No', ftString, 20);
    ClientDataSet.FieldDefs.Add('ProductCode', ftString, 20);
    ClientDataSet.FieldDefs.Add('ProductName', ftString, 20);
    ClientDataSet.FieldDefs.Add('Category' ,ftString,20);
    ClientDataSet.FieldDefs.Add('PricePerUnit', ftString, 20);
    ClientDataSet.FieldDefs.Add('QuantityInStock', ftString, 20);
    ClientDataSet.FieldDefs.Add('PurchaseDate', ftString, 20);
    ClientDataSet.FieldDefs.Add('ExpiryDate', ftString, 20);
    ClientDataSet.CreateDataSet;
  end
  else
    ClientDataSet.EmptyDataSet;

  for ProductIndex := 0 to ProductsArray.Count - 1 do
  begin
    ProductJSON := ProductsArray.Items[ProductIndex] as TJSONObject;
    ClientDataSet.Append;
    ClientDataSet.FieldByName('Sr No').AsString := ProductJSON.GetValue('productId').Value;
    ClientDataSet.FieldByName('ProductCode').AsString := ProductJSON.GetValue('productCode').Value;
ClientDataSet.FieldByName('ProductName').AsString := ProductJSON.GetValue('productName').Value;
ClientDataSet.FieldByName('Category').AsString := ProductJSON.GetValue('category').Value;

    ClientDataSet.FieldByName('PricePerUnit').AsString := ProductJSON.GetValue('pricePerUnit').Value;
    ClientDataSet.FieldByName('QuantityInStock').AsString := ProductJSON.GetValue('quantityInStock').Value;
    ClientDataSet.FieldByName('PurchaseDate').AsString := ProductJSON.GetValue('purchaseDate').Value;
    ClientDataSet.FieldByName('ExpiryDate').AsString := ProductJSON.GetValue('expiryDate').Value;
    ClientDataSet.Post;
  end;

  DBGrid1.DataSource := TDataSource.Create(Self);
  DBGrid1.DataSource.DataSet := ClientDataSet;
end;

procedure TfrmInventoryManager.edtSearchChange(Sender: TObject);

var
  SearchText: string;
begin
  // Convert the search text to uppercase to perform case-insensitive search
  SearchText := UpperCase(edtSearch.Text);

  if ClientDataSet <> nil then
  begin
    if SearchText <> '' then
    begin
      // Filter the dataset based on the entered text in edtSearch
      ClientDataSet.Filter := '(UPPER(ProductCode) LIKE ' + QuotedStr('%' + SearchText + '%') +
                              ') OR (UPPER(ProductName) LIKE ' + QuotedStr('%' + SearchText + '%') +
                              ') OR (UPPER(PricePerUnit) LIKE ' + QuotedStr('%' + SearchText + '%') +
                              ') OR (UPPER(QuantityInStock) LIKE ' + QuotedStr('%' + SearchText + '%') +
                              ') OR (UPPER(PurchaseDate) LIKE ' + QuotedStr('%' + SearchText + '%') +
                              ') OR (UPPER(ExpiryDate) LIKE ' + QuotedStr('%' + SearchText + '%') + ')';
      ClientDataSet.Filtered := True;
    end
    else
    begin
      // Clear the filter if the search text is empty
      ClientDataSet.Filter := '';
      ClientDataSet.Filtered := False;
    end;
  end;
end;


procedure TfrmInventoryManager.HandleException(const Msg: string; E: Exception);
begin
  ShowMessage(Msg);
  // Log the exception or handle it according to your application's needs
end;

procedure TfrmInventoryManager.SubmitClick(Sender: TObject);
begin
FetchProducts(edtCategory.Text);
end;

procedure TfrmInventoryManager.Button1Click(Sender: TObject);
begin
Close;
end;

procedure TfrmInventoryManager.DBGrid1CellClick(Column: TColumn);
var
  SelectedID: Integer;
begin
  SelectedID := ClientDataSet.FieldByName('Sr No').AsInteger;
  id := SelectedID;
  if SelectedID <> 0 then
  begin
    Form2.SetSelectedID(id);
    Form2.Show;
  end;
end;



procedure TfrmInventoryManager.FetchProducts(const Category: string);
var
  IdHTTP1: TIdHTTP;
  ResponseContent: string;
  ProductsArray: TJSONArray;
begin
  IdHTTP1 := TIdHTTP.Create(nil);
  try
    try
      // If the category is empty, fetch all products; otherwise, fetch products filtered by category
      if Category = '' then
        ResponseContent := IdHTTP1.Get('http://localhost:5063/api/Product')
      else
        ResponseContent := IdHTTP1.Get('http://localhost:5063/api/Product/Category/' +
         Category);



      // Parse the JSON response
      ProductsArray := TJSONObject.ParseJSONValue(ResponseContent) as TJSONArray;

      // Display the products in the DBGrid
      DisplayProducts(ProductsArray);
    except
      on E: Exception do
        HandleException('Error retrieving products: ' + E.Message, E);
    end;
  finally
    IdHTTP1.Free;
  end;
end;

procedure TfrmInventoryManager.FormClick(Sender: TObject);
begin
FetchProducts('');
end;

procedure TfrmInventoryManager.FormCreate(Sender: TObject);
begin
  // Initialize the form with all products
  FetchProducts('');
end;
procedure TfrmInventoryManager.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
  Column: TColumn; State: TGridDrawState);
var
  Value: string;
  ExpireDate: TDateTime;
  Quantity: Integer;
begin
  // Get the value of the current cell
  Value := Column.Field.AsString;

  // Check if the column is 'ExpiryDate' or 'QuantityInStock'
  if (Column.FieldName = 'ExpiryDate') or (Column.FieldName = 'QuantityInStock') then
  begin
    // Convert the expiration date string to a TDateTime
    if Column.FieldName = 'ExpiryDate' then
      ExpireDate := StrToDateDef(Value, 0)
    else
      ExpireDate := Now; // Use current date for quantity check

    // Check the conditions and set the color accordingly
    if (Column.FieldName = 'ExpiryDate') and (ExpireDate < Now + 10) then
      DBGrid1.Canvas.Brush.Color := $00FFFF80 // Amber color for products reaching expiry date in 10 days
    else if (Column.FieldName = 'QuantityInStock') and (StrToIntDef(Value, 0) < 10) then
      DBGrid1.Canvas.Brush.Color := $00FFFF80; // Amber color for products with less than 10 quantity
  end
  else if (Column.FieldName = 'QuantityInStock') and (StrToIntDef(Value, 0) = 0) then
    DBGrid1.Canvas.Brush.Color := clRed // Red color for out-of-stock products
  else if (Column.FieldName = 'ExpiryDate') and (ExpireDate < Now) then
    DBGrid1.Canvas.Brush.Color := clRed; // Red color for expired products

  // Draw the cell with the modified color
  DBGrid1.Canvas.FillRect(Rect);
  DBGrid1.Canvas.TextOut(Rect.Left + 2, Rect.Top + 2, Value);
end;

end.

