unit AddProduct_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  IdHTTP, IdMultipartFormData, System.JSON, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient;

type
  TfrmAddProduct = class(TForm)
    Label1: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Label2: TLabel;
    edtProductCode: TEdit;
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
    OpenDialog1: TOpenDialog;
    IdHTTP1: TIdHTTP;
    btnUploadImage: TButton;
    Panel9: TPanel;
    Label9: TLabel;
    edtProductImageName: TEdit;
    Panel10: TPanel;
    BtnSubmit: TButton;
    Panel11: TPanel;
    Label10: TLabel;
    edtProductCategory: TEdit;
    procedure btnUploadImageClick(Sender: TObject);
    procedure BtnSubmitClick(Sender: TObject);

  private
    { Private declarations }
    ImageFilePath: string;
  public
    { Public declarations }
  end;

var
  frmAddProduct: TfrmAddProduct;

implementation

{$R *.dfm}

procedure TfrmAddProduct.BtnSubmitClick(Sender: TObject);
var
  HTTP: TIdHTTP;
  Params: TIdMultipartFormDataStream;
  ResponseContent: string;
  ResponseJSON: TJSONObject;
begin
  HTTP := TIdHTTP.Create(nil);
  try
    Params := TIdMultipartFormDataStream.Create;
    try
      Params.AddFormField('ProductCode', edtProductCode.Text);
      Params.AddFormField('ProductName', edtProductName.Text);
      Params.AddFormField('PricePerUnit', edtProductPrice.Text);
      Params.AddFormField('QuantityInStock', edtProductQuantity.Text);
      Params.AddFormField('PurchaseDate', edtProductPurchaseDate.Text);
      Params.AddFormField('ExpiryDate', edtProductExpiryDate.Text);
      Params.AddFile('ProductImage', ImageFilePath, 'image/jpeg');
      Params.AddFormField('ProductImageName', edtProductImageName.Text);
      Params.AddFormField('Category',edtProductCategory.Text);

      ResponseContent := HTTP.Post('http://localhost:5063/api/Product', Params);

      ResponseJSON := TJSONObject.ParseJSONValue(ResponseContent) as TJSONObject;

      try
        if  HTTP.ResponseCode = 200 then
        begin
               showMessage('Product Added Sucesssfully');
               frmAddProduct.Close;
        end;
      finally
        ResponseJSON.Free;
      end;
    finally
      Params.Free;
    end;
  finally
    HTTP.Free;
  end;
end;

procedure TfrmAddProduct.btnUploadImageClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    ImageFilePath := OpenDialog1.FileName;
  end;
end;



end.

