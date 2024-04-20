object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 677
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClick = FormClick
  OnCreate = FormCreate
  TextHeight = 15
  object Label1: TLabel
    Left = 152
    Top = 26
    Width = 321
    Height = 37
    Caption = 'Update Product Detail'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Panel11: TPanel
    Left = 32
    Top = 461
    Width = 545
    Height = 41
    TabOrder = 0
    object Label10: TLabel
      Left = 24
      Top = 8
      Width = 64
      Height = 20
      Caption = 'Category'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtProductCategory: TEdit
      Left = 248
      Top = 8
      Width = 257
      Height = 23
      Enabled = False
      TabOrder = 0
      TextHint = 'Enter Product Category'
    end
  end
  object Panel3: TPanel
    Left = 32
    Top = 125
    Width = 545
    Height = 41
    TabOrder = 1
    object Label3: TLabel
      Left = 24
      Top = 8
      Width = 101
      Height = 20
      Caption = 'Product Name'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtProductName: TEdit
      Left = 248
      Top = 8
      Width = 257
      Height = 23
      Enabled = False
      TabOrder = 0
      TextHint = 'Enter Product Name'
    end
  end
  object Panel4: TPanel
    Left = 32
    Top = 172
    Width = 545
    Height = 41
    TabOrder = 2
    object Label4: TLabel
      Left = 24
      Top = 8
      Width = 95
      Height = 20
      Caption = 'Price Per Unit'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtProductPrice: TEdit
      Left = 248
      Top = 8
      Width = 257
      Height = 23
      Enabled = False
      TabOrder = 0
      TextHint = 'Enter Product Price'
    end
  end
  object Panel5: TPanel
    Left = 32
    Top = 219
    Width = 545
    Height = 41
    TabOrder = 3
    object Label5: TLabel
      Left = 24
      Top = 8
      Width = 121
      Height = 20
      Caption = 'Quantity In Stock'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtProductQuantity: TEdit
      Left = 248
      Top = 8
      Width = 257
      Height = 23
      Enabled = False
      TabOrder = 0
      TextHint = 'Enter Product Quantity'
    end
  end
  object Panel6: TPanel
    Left = 32
    Top = 266
    Width = 545
    Height = 41
    TabOrder = 4
    object Label6: TLabel
      Left = 19
      Top = 8
      Width = 100
      Height = 20
      Caption = 'Purchase Date'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtProductPurchaseDate: TEdit
      Left = 248
      Top = 8
      Width = 257
      Height = 23
      Enabled = False
      TabOrder = 0
      TextHint = 'Enter Product PurchaseDate'
    end
  end
  object Panel7: TPanel
    Left = 32
    Top = 313
    Width = 545
    Height = 41
    TabOrder = 5
    object Label7: TLabel
      Left = 24
      Top = 8
      Width = 81
      Height = 20
      Caption = 'Expiry Date'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtProductExpiryDate: TEdit
      Left = 248
      Top = 8
      Width = 257
      Height = 23
      Enabled = False
      TabOrder = 0
      TextHint = 'Enter Product Expiry Date'
    end
  end
  object Panel8: TPanel
    Left = 32
    Top = 367
    Width = 545
    Height = 41
    TabOrder = 6
    object Label8: TLabel
      Left = 24
      Top = 8
      Width = 103
      Height = 20
      Caption = 'Product Image'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnUploadImage: TButton
      Left = 248
      Top = 8
      Width = 257
      Height = 25
      Caption = 'Upload Image'
      Enabled = False
      TabOrder = 0
      OnClick = btnUploadImageClick
    end
  end
  object Panel9: TPanel
    Left = 32
    Top = 414
    Width = 545
    Height = 41
    TabOrder = 7
    object Label9: TLabel
      Left = 24
      Top = 8
      Width = 90
      Height = 20
      Caption = 'Image Name'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtProductImageName: TEdit
      Left = 248
      Top = 8
      Width = 257
      Height = 23
      Enabled = False
      TabOrder = 0
      TextHint = 'Enter Product Image Name'
    end
  end
  object Panel10: TPanel
    Left = 24
    Top = 524
    Width = 593
    Height = 41
    TabOrder = 8
    object BtnSubmit: TButton
      Left = 178
      Top = 8
      Width = 225
      Height = 25
      Caption = 'Submit'
      TabOrder = 0
      OnClick = BtnSubmitClick
    end
  end
  object Panel2: TPanel
    Left = 32
    Top = 78
    Width = 545
    Height = 41
    TabOrder = 9
    object Label2: TLabel
      Left = 24
      Top = 8
      Width = 94
      Height = 20
      Caption = 'Product Code'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtProductCode1: TEdit
      Left = 248
      Top = 8
      Width = 257
      Height = 23
      Enabled = False
      TabOrder = 0
      TextHint = 'Enter Product Code'
    end
  end
  object Edit1: TEdit
    Left = 80
    Top = 576
    Width = 313
    Height = 23
    TabOrder = 10
    Text = 'Edit1'
  end
  object IdHTTP1: TIdHTTP
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 552
    Top = 568
  end
  object OpenDialog1: TOpenDialog
    Left = 472
    Top = 568
  end
  object RESTClient2: TRESTClient
    BaseURL = 'http://localhost:5063/api/Product/update-without-image'
    Params = <>
    SynchronizedEvents = False
    Left = 592
    Top = 8
  end
  object RESTRequest2: TRESTRequest
    AssignedValues = [rvConnectTimeout, rvReadTimeout]
    Client = RESTClient2
    Method = rmPUT
    Params = <
      item
        Kind = pkQUERY
        Name = 'id'
        Value = '1'
      end
      item
        Kind = pkREQUESTBODY
        Name = 'bodyA7E86718DDB1471FBF4D19C5DC357F64'
        Value = 
          '{'#13#10'  "productCode": "TEA009X",'#13#10'  "productName": "TATA TEA",'#13#10'  ' +
          '"pricePerUnit": 100,'#13#10'  "quantityInStock":500,'#13#10'  "category": "G' +
          'rocery",'#13#10'  "purchaseDate": "2023-11-11",'#13#10'  "expiryDate": "2024' +
          '-12-11"'#13#10'}'
        ContentTypeStr = 'application/json'
      end>
    Response = RESTResponse2
    SynchronizedEvents = False
    Left = 576
    Top = 8
  end
  object RESTResponse2: TRESTResponse
    Left = 544
    Top = 16
  end
  object RESTClient1: TRESTClient
    BaseURL = 'http://localhost:5063/api/Product/id'
    Params = <>
    SynchronizedEvents = False
  end
  object RESTRequest1: TRESTRequest
    AssignedValues = [rvConnectTimeout, rvReadTimeout]
    Client = RESTClient1
    Params = <
      item
        Name = 'id'
        Value = '1'
      end>
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 8
    Top = 8
  end
  object RESTResponse1: TRESTResponse
    Left = 16
    Top = 16
  end
end
