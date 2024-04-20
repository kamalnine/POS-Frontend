unit SalesManager_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, AddProduct_u,
  IdHTTP, System.JSON, Data.DB, Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, REST.Types,Logout_u,
  REST.Client, Data.Bind.Components, Data.Bind.ObjectScope,GlobalData_u,Gmail_u,IdMultipartFormData;

type
  TfrmSalesManager = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel6: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    EditSubTotal: TEdit;
    EditTax: TEdit;
    EditTotal: TEdit;
    Panel5: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    EditCost: TEdit;
    EditChange: TEdit;
    cmbPayMethod: TComboBox;
    Panel7: TPanel;
    btnPay: TButton;
    btnSave: TButton;
    btnReset: TButton;
    btnRemove: TButton;
    btnOpen: TButton;
    btnExit: TButton;
    IdHTTP1: TIdHTTP;
    DBGrid1: TDBGrid;
    lstPrice: TListBox;
    SaveDialog1: TSaveDialog;
    OpenDialog1: TOpenDialog;
    Panel8: TPanel;
    Button13: TButton;
    lblSearch: TLabel;
    edtSearch: TEdit;
    Label7: TLabel;
    edtUserName: TEdit;
    IdHTTP2: TIdHTTP;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    Panel9: TPanel;
    btnLogout: TButton;
    IdHTTP3: TIdHTTP;
    procedure NumberClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure btnPayClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnOpenClick(Sender: TObject);
    procedure btnResetClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure edtSearchChange(Sender: TObject);
    procedure FetchUsername(const Email: string);
    procedure FormClick(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure btnLogoutClick(Sender: TObject);

  private
   ItemCost,Sum,i,Tax,Change : Double;
   FSelectedEmail : string;
    ClientDataSet: TClientDataSet;
    procedure DisplayProducts(const ProductsArray: TJSONArray);
    procedure DisplayProductsFromServer;
    procedure HandleException(const Msg: string; E: Exception);
  public
   procedure SetSelectedEmail(Email:string);

  end;

var
  frmSalesManager: TfrmSalesManager;

implementation

{$R *.dfm}

procedure TfrmSalesManager.DisplayProductsFromServer;
var
  IdHTTP1: TIdHTTP;
  ResponseContent: string;
  ProductsArray: TJSONArray;
begin
  IdHTTP1 := TIdHTTP.Create(nil);
  try
    try
      // Get products from the server
      ResponseContent := IdHTTP1.Get('http://localhost:5063/api/Product');
      ProductsArray := TJSONObject.ParseJSONValue(ResponseContent) as TJSONArray;
      DisplayProducts(ProductsArray);
    except
      on E: Exception do
        HandleException('Error retrieving products: ' + E.Message, E);
    end;
  finally
    // Free the HTTP client
    IdHTTP1.Free;
  end;
end;

procedure TfrmSalesManager.SetSelectedEmail(Email: string);
begin
  // Store the provided ID in the class field
  FSelectedEmail := Email;
end;

procedure TfrmSalesManager.NumberClick(Sender: TObject);
var b : TButton;
begin
       b := Sender As TButton;
       if EditCost.Text = '0' then
       begin
         EditCost.Text := b.Caption;
       end

       else
           EditCost.Text := EditCost.Text + b.Caption;

end;

procedure TfrmSalesManager.FormClick(Sender: TObject);
begin
 FetchUsername(FSelectedEmail);
end;

procedure TfrmSalesManager.FormCreate(Sender: TObject);
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
      ResponseContent := IdHTTP1.Get('http://localhost:5063/api/Product');
      ProductsArray := TJSONObject.ParseJSONValue(ResponseContent) as TJSONArray;
      DisplayProducts(ProductsArray);

      // Set the email for fetching the username


      // Set the email parameter for the REST request



    except
      on E: Exception do
        HandleException('Error retrieving products: ' + E.Message, E);
    end;
  finally
    // Free the HTTP client
    IdHTTP1.Free;
  end;

  // Add payment methods to the combo box
  cmbPayMethod.Items.Add('Cash');
  cmbPayMethod.Items.Add('Direct Debit');
  cmbPayMethod.Items.Add('Visa Card');
  cmbPayMethod.Items.Add('Master Card');
end;

procedure TfrmSalesManager.btnExitClick(Sender: TObject);
begin
if MessageDlg('Confirm if you want to exit?',TMsgDlgType.mtConfirmation,[mbYes,mbNo],0,mbYes) = mrYes then
begin
  Application.Terminate;
end;
end;

procedure TfrmSalesManager.FetchUsername(const Email: string);
var
  jsv: TJSONValue;
begin
  // Set the email parameter for the REST request
  RESTRequest1.Params.ParameterByName('email').Value := FSelectedEmail;
  RESTRequest1.Execute;

  // Check if the request was successful
  if RESTResponse1.StatusCode = 200 then
  begin
    // Parse the response content as JSON
    jsv := TJSONObject.ParseJSONValue(RESTResponse1.Content);
    try
      // Check if the JSON value is valid and if it's a string
      if Assigned(jsv) and (jsv is TJSONString) then
      begin
        // Extract the username from the JSON response
        edtUserName.Text := (jsv as TJSONString).Value;
      end;
    finally
      // Free the JSON value
      jsv.Free;
    end;
  end
  else
  begin
    // Handle invalid response status code
    ShowMessage('Invalid ID or Contact not found.');
  end;
end;

procedure TfrmSalesManager.btnOpenClick(Sender: TObject);
begin
lstPrice.Items.Clear;
if OpenDialog1.Execute then
OpenDialog1.InitialDir := 'C:\Users\MAVKamal\Desktop\Point Of Sale\SavedImage';
lstPrice.Items.LoadFromFile(OpenDialog1.FileName)
end;

procedure TfrmSalesManager.btnPayClick(Sender: TObject);
var
  Total, Cost, Change: Double;
  I: Integer;
  ProductDetails: TArray<string>;
  Email, ProductIds, ProductNames, Quantities: string;
  ResponseContent: string;
  HTTP: TIdHTTP;
  Params: TIdMultipartFormDataStream;
begin
  HTTP := TIdHTTP.Create(nil);
  Params := TIdMultipartFormDataStream.Create;
  try
    // Prompt the user to enter the email address
    if InputQuery('Enter Email', 'Email:', Email) then
    begin
      // Convert the total amount and cost to double
      Total := StrToFloat(EditTotal.Text);
      Cost := StrToFloat(EditCost.Text);

      // Calculate the change
      Change := Cost - Total;
      EditChange.Text := Format('$%.2f', [Change]);

      // Initialize strings to hold comma-separated values
      ProductIds := '';
      ProductNames := '';
      Quantities := '';

      // Add product details
      for I := 0 to lstPrice.Items.Count - 1 do
      begin
        // Split the item in the list box to extract product name, price, quantity, and ID
        ProductDetails := lstPrice.Items[I].Split(['|']);

        // Trim each part to remove any leading or trailing spaces
        for var J := Low(ProductDetails) to High(ProductDetails) do
          ProductDetails[J] := Trim(ProductDetails[J]);

        // Concatenate product details into comma-separated strings
        if I > 0 then
        begin
          ProductIds := ProductIds + ',';
          ProductNames := ProductNames + ',';
          Quantities := Quantities + ',';
        end;

        ProductIds := ProductIds + ProductDetails[3];
        ProductNames := ProductNames + ProductDetails[0];
        Quantities := Quantities + ProductDetails[2];
      end;

      // Add common details
      Params.AddFormField('CustomerEmail', Email);
      Params.AddFormField('ProductIds', ProductIds);
      Params.AddFormField('ProductNames', ProductNames);
      Params.AddFormField('Quantity', Quantities);

      // Add TotalAmount
      Params.AddFormField('TotalAmount', FloatToStr(Total));

      // Perform the POST request
      ResponseContent := HTTP.Post('http://localhost:5063/api/PurchaseItem', Params);

      // Handle the response from the server
      ShowMessage('Response: ' + ResponseContent);

      // Show a message indicating successful payment
      ShowMessage('Payment successful!');
       DisplayProductsFromServer;
    end;
  finally
    HTTP.Free;
    Params.Free;
  end;
end;





procedure TfrmSalesManager.btnRemoveClick(Sender: TObject);
var
  ItemString: string;
  PricePart, ConfirmQuantity: string;
  PricePerUnit, SubTotal, TaxValue, Total: Double;
  QuantityToRemove: Integer;
  Parts: TArray<string>;
begin
  // Check if an item is selected in the list box
  if lstPrice.ItemIndex >= 0 then
  begin
    // Extract the selected item from the list box
    ItemString := lstPrice.Items[lstPrice.ItemIndex];
    ShowMessage(ItemString);
    Parts := ItemString.Split(['|']);
    showMessage(Parts[1]);

    // Split the item string to extract the price part
    PricePart := Parts[1];

    // Convert the price part to a floating-point number
    if TryStrToFloat(PricePart, PricePerUnit) then
    begin
      // Display the extracted PricePerUnit for testing
      ShowMessage(PricePart);

      // Prompt the user to confirm the quantity to remove
      if InputQuery('Confirm Quantity', 'Enter the quantity to remove:', ConfirmQuantity) then
      begin
        // Attempt to convert the confirmed quantity to an integer
        if TryStrToInt(ConfirmQuantity, QuantityToRemove) then
        begin
          // Check if the confirmed quantity is valid
          if QuantityToRemove > 0 then
          begin
            // Remove the selected item from the list box
            lstPrice.Items.Delete(lstPrice.ItemIndex);

            // Recalculate the subtotal
            SubTotal := StrToFloat(EditSubTotal.Text) - (PricePerUnit * QuantityToRemove);
            EditSubTotal.Text := FloatToStr(SubTotal);

            // Calculate the tax based on the updated subtotal
            TaxValue := SubTotal * 2.3 / 100; // Assuming tax value is 2.3%
            EditTax.Text := FloatToStr(TaxValue);

            // Calculate the total based on the updated subtotal and tax
            Total := SubTotal + TaxValue;
            EditTotal.Text := FloatToStr(Total);
          end
          else
            ShowMessage('Invalid quantity format. Quantity must be greater than 0.');
        end
        else
          ShowMessage('Invalid quantity format. Please enter a valid integer.');
      end;
    end
    else
      ShowMessage('Error extracting PricePerUnit from the selected item.');
  end
  else
    ShowMessage('No item selected to remove.');
end;


procedure TfrmSalesManager.btnResetClick(Sender: TObject);
begin
lstPrice.Clear;
cmbPayMethod.Clear;
EditSubTotal.Text:='';
EditTotal.Text := '';
EditTax.Text:='';
EditCost.Text := '';
EditChange.Text:='';
end;

procedure TfrmSalesManager.btnSaveClick(Sender: TObject);
begin
if SaveDialog1.Execute then
SaveDialog1.InitialDir := 'C:\Users\MAVKamal\Desktop\Point Of Sale\SavedImage';
lstPrice.Items.SaveToFile(SaveDialog1.FileName + '.txt')

end;

procedure TfrmSalesManager.Button11Click(Sender: TObject);
begin
if (POS('.',EditCost.Text)<> 0) then
exit

else
EditCost.Text := EditCost.Text + button11.Caption;

end;

procedure TfrmSalesManager.Button12Click(Sender: TObject);
begin
EditCost.Text := '0';
end;

procedure TfrmSalesManager.Button13Click(Sender: TObject);
begin
     frmAddProduct.ShowModal; // Assuming frmAddProduct is your form for adding products
  DisplayProductsFromServer;
end;

procedure TfrmSalesManager.btnLogoutClick(Sender: TObject);
begin
      Close;
end;

procedure TfrmSalesManager.DBGrid1CellClick(Column: TColumn);
var
  RowIndex,ProductID: Integer;
  ProductName, PricePerUnit: string;
  QuantityStr: string; // String to store the quantity input
  Quantity: Integer; // Variable to store the converted quantity
  UnitPrice, SubTotal, TaxValue, Total: Double;
begin
  // Get the index of the current row
  RowIndex := DBGrid1.DataSource.DataSet.RecNo - 1;
  Tax := 2.3;

  // Ensure the index is valid
  if (RowIndex >= 0) and (RowIndex < ClientDataSet.RecordCount) then
  begin
    // Get the product name and price per unit from the dataset
    ProductID :=  ClientDataSet.FieldByName('productId').AsInteger;
    ProductName := ClientDataSet.FieldByName('ProductName').AsString;
    PricePerUnit := ClientDataSet.FieldByName('PricePerUnit').AsString;

    // Prompt the user to enter the quantity
    if InputQuery('Enter Quantity', 'Quantity:', QuantityStr) then
    begin
      // Attempt to convert the input string to an integer
      if TryStrToInt(QuantityStr, Quantity) then
      begin
        // Convert the price per unit to a floating-point value
        if TryStrToFloat(PricePerUnit, UnitPrice) then
        begin
          // Calculate the subtotal with the quantity
          SubTotal := StrToFloat(EditSubTotal.Text) + (UnitPrice * Quantity);
          EditSubTotal.Text := FloatToStr(SubTotal);

          // Calculate the tax and update the tax display
          TaxValue := SubTotal * Tax / 100;
          EditTax.Text := FloatToStr(TaxValue);

          // Calculate the total and update the total display
          Total := SubTotal + TaxValue;
          EditTotal.Text := FloatToStr(Total);

          // Add the product name, price per unit, and quantity to the list box
          lstPrice.Items.Add(Format('%s  |   %s   |      %d      |     %d', [ProductName, PricePerUnit, Quantity,ProductID]));
        end
        else
          ShowMessage('Invalid price per unit format.');
      end
      else
        ShowMessage('Invalid quantity. Please enter a valid integer.');
    end;
  end;
end;



procedure TfrmSalesManager.DisplayProducts(const ProductsArray: TJSONArray);
var
  ProductIndex: Integer;
  ProductJSON: TJSONObject;
begin
  if not Assigned(ClientDataSet) then
  begin
    ClientDataSet := TClientDataSet.Create(Self);
     ClientDataSet.FieldDefs.Add('ProductId', Data.DB.ftString, 12);
    ClientDataSet.FieldDefs.Add('ProductCode', Data.DB.ftString, 12);
    ClientDataSet.FieldDefs.Add('ProductName',  Data.DB.ftString, 12);
    ClientDataSet.FieldDefs.Add('PricePerUnit',  Data.DB.ftString, 12);
    ClientDataSet.FieldDefs.Add('QuantityInStock',  Data.DB.ftString, 12);
    ClientDataSet.FieldDefs.Add('PurchaseDate',Data.DB.ftString , 12);
    ClientDataSet.FieldDefs.Add('ExpiryDate', Data.DB.ftString, 12);
    ClientDataSet.CreateDataSet;
  end
  else
    ClientDataSet.EmptyDataSet;

  for ProductIndex := 0 to ProductsArray.Count - 1 do
  begin
    ProductJSON := ProductsArray.Items[ProductIndex] as TJSONObject;
    ClientDataSet.Append;
    ClientDataSet.FieldByName('ProductId').AsString := ProductJSON.GetValue('productId').Value;
    ClientDataSet.FieldByName('ProductCode').AsString := ProductJSON.GetValue('productCode').Value;
    ClientDataSet.FieldByName('ProductName').AsString := ProductJSON.GetValue('productName').Value;
    ClientDataSet.FieldByName('PricePerUnit').AsString := ProductJSON.GetValue('pricePerUnit').Value;
    ClientDataSet.FieldByName('QuantityInStock').AsString := ProductJSON.GetValue('quantityInStock').Value;
    ClientDataSet.FieldByName('PurchaseDate').AsString := ProductJSON.GetValue('purchaseDate').Value;
    ClientDataSet.FieldByName('ExpiryDate').AsString := ProductJSON.GetValue('expiryDate').Value;
    ClientDataSet.Post;
  end;

  DBGrid1.DataSource := TDataSource.Create(Self);
  DBGrid1.DataSource.DataSet := ClientDataSet;


end;

procedure TfrmSalesManager.edtSearchChange(Sender: TObject);
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




procedure TfrmSalesManager.HandleException(const Msg: string; E: Exception);
begin
  ShowMessage(Msg);
  // Log the exception or handle it according to your application's needs
end;

end.

