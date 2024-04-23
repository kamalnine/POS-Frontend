unit InventoryUpdate_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  REST.Types, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope,IdMultipartFormData, System.JSON;

type
  TForm2 = class(TForm)
    IdHTTP1: TIdHTTP;
    Label1: TLabel;
    OpenDialog1: TOpenDialog;
    Panel11: TPanel;
    Label10: TLabel;
    edtProductCategory: TEdit;
    Panel3: TPanel;
    Label3: TLabel;
    edtProductName: TEdit;
    Panel4: TPanel;
    Label4: TLabel;
    edtProductPrice: TEdit;
    Panel5: TPanel;
    Label5: TLabel;
    edtProductQuantity: TEdit;
    Panel6: TPanel;
    Label6: TLabel;
    edtProductPurchaseDate: TEdit;
    Panel7: TPanel;
    Label7: TLabel;
    edtProductExpiryDate: TEdit;
    Panel8: TPanel;
    Label8: TLabel;
    btnUploadImage: TButton;
    Panel9: TPanel;
    Label9: TLabel;
    edtProductImageName: TEdit;
    Panel10: TPanel;
    BtnSubmit: TButton;
    Panel2: TPanel;
    Label2: TLabel;
    edtProductCode1: TEdit;
    Edit1: TEdit;
    RESTClient2: TRESTClient;
    RESTRequest2: TRESTRequest;
    RESTResponse2: TRESTResponse;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;

    procedure FormClick(Sender: TObject);
    procedure BtnSubmitClick(Sender: TObject);
    procedure btnUploadImageClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);


  private
  id:string;
  FSelectedID: Integer;
    FImageFilePath: string;
    { Private declarations }
  public
    { Public declarations }
     ImageFilePath: string;
     procedure SetSelectedID(ID: Integer);

  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}





procedure TForm2.BtnSubmitClick(Sender: TObject);
var
  JsonRequest: TJSONObject;
  IdHTTP1: TIdHTTP;
  ResponseContent: string;
begin
  // Create a JSON object containing the updated contact information
  id := IntToStr(FSelectedID);

  JsonRequest := TJSONObject.Create;
  JsonRequest.AddPair('productCode', edtProductCode1.Text);
  JsonRequest.AddPair('productName', edtProductName.Text);
  JsonRequest.AddPair('pricePerUnit', edtProductPrice.Text);
  JsonRequest.AddPair('quantityInStock',edtProductQuantity.Text);
  JsonRequest.AddPair('category',edtProductCategory.Text);
  JsonRequest.AddPair('purchaseDate',edtProductPurchaseDate.Text);
  JsonRequest.AddPair('expiryDate',edtProductExpiryDate.Text);

  // Assign the JSON object as the request body
  RESTRequest2.ClearBody;
  RESTRequest2.Body.Add(JsonRequest);

  // Set the request method to PUT
  RESTRequest2.Method := rmPUT;

  // Set the query parameter 'id' with the value from the form
  RESTRequest2.Params.Clear;
  RESTRequest2.Params.AddItem('id',id, TRESTRequestParameterKind.pkQUERY, [poDoNotEncode]);

  // Execute the request
  RESTRequest2.Execute;

  // Check for errors
  if RESTResponse2.StatusCode = 200 then
  begin
    showMessage('Task Updates Successfully');

    // Re-fetch the products data after successfully updating
    IdHTTP1 := TIdHTTP.Create(nil);
    try
      // Make the GET request to fetch the updated product data
      ResponseContent := IdHTTP1.Get('http://localhost:5063/api/Product');
      close;

      // Display the updated product data or handle it as required
      // For example, you can parse the response JSON and update UI elements

      // Handle the response content here
    finally
      IdHTTP1.Free;
    end;
  end
  else
    ShowMessage('Failed to update contact information: ' + RESTResponse2.Content);
end;




procedure TForm2.btnUploadImageClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    FImageFilePath := OpenDialog1.FileName;
    edtProductImageName.Text := ExtractFileName(FImageFilePath);
  end;
end;

procedure TForm2.FormClick(Sender: TObject);
var


  idValue: string;
  i: Integer;
  jsv: TJSONValue;
  jsonObject: TJSONObject;
begin
  idValue := IntToStr(FSelectedID);
      id := IntToStr(FSelectedID);



  // Set the 'id' parameter of the REST request
  RESTRequest1.Params.ParameterByName('id').Value := idValue;

  // Execute the REST request
  RESTRequest1.Execute;

  // Check for errors
  if RESTResponse1.StatusCode = 200 then
  begin
    if RESTResponse1.Content <> '' then
    begin
      edtProductCode1.Enabled := True;
         edtProductName.Enabled := True;
         edtProductCategory.Enabled := True;
         edtProductPrice.Enabled := True;
         edtProductPurchaseDate.Enabled :=True;
         edtProductExpiryDate.Enabled := True;
         edtProductImageName.Enabled := True;
         edtProductQuantity.Enabled:= True;
         btnUploadImage.Enabled := True;
      // Print the content of the response for debugging


      // Parse the JSON array
       jsv := TJSONObject.ParseJSONValue(RESTResponse1.Content);

       Edit1.Text := RESTResponse1.Content;

      try
        if Assigned(jsv) and (jsv is TJSONObject) then
              begin
              jsonObject := jsv as TJSONObject;
          edtProductCode1.Text := jsonObject.GetValue('productCode').Value;
            edtProductName.Text := jsonObject.GetValue('productName').Value;
            edtProductPrice.Text := jsonObject.GetValue('pricePerUnit').Value;
            edtProductQuantity.Text := jsonObject.GetValue('quantityInStock').Value;
            edtProductCategory.Text := jsonObject.GetValue('category').Value;
            edtProductPurchaseDate.Text := jsonObject.GetValue('purchaseDate').Value;
            edtProductExpiryDate.Text := jsonObject.GetValue('expiryDate').Value;
            edtProductImageName.Text := jsonObject.GetValue('productImageName').Value;
end

        else
          ShowMessage('Response is not a valid JSON array.');
      finally

      end;
    end
    else
      ShowMessage('No details found for the given ID.');
  end
  else
    ShowMessage('Failed to retrieve contact details: ' + RESTResponse1.StatusText);
end;




procedure TForm2.FormCreate(Sender: TObject);
begin
 FImageFilePath := '';
end;

procedure TForm2.SetSelectedID(ID: Integer);
begin
  // Store the provided ID in the class field
  FSelectedID := ID;



end;
end.
