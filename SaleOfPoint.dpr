program SaleOfPoint;

uses
  Vcl.Forms,
  Register_u in 'Register_u.pas' {Form1},
  Login_u in 'Login_u.pas' {frmLogin},
  SalesManager_u in 'SalesManager_u.pas' {frmSalesManager},
  InventoryManger_u in 'InventoryManger_u.pas' {frmInventoryManager},
  CustomerRelationshipManger_u in 'CustomerRelationshipManger_u.pas' {frmCustomerRelationshipManager},
  Customer_u in 'Customer_u.pas' {frmCustomer},
  AddProduct_u in 'AddProduct_u.pas' {frmAddProduct},
  InventoryUpdate_u in 'InventoryUpdate_u.pas' {Form2},
  GlobalData_u in 'GlobalData_u.pas' {Form3},
  Gmail_u in 'Gmail_u.pas' {Form4},
  ShowCustomerPurchaseItem_u in 'ShowCustomerPurchaseItem_u.pas' {Form5},
  Logout_u in 'Logout_u.pas' {Form6};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmSalesManager, frmSalesManager);
  Application.CreateForm(TfrmInventoryManager, frmInventoryManager);
  Application.CreateForm(TfrmCustomerRelationshipManager, frmCustomerRelationshipManager);
  Application.CreateForm(TfrmCustomer, frmCustomer);
  Application.CreateForm(TfrmAddProduct, frmAddProduct);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TForm6, Form6);
  Application.Run;
end.
