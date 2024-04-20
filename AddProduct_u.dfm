object frmAddProduct: TfrmAddProduct
  Left = 0
  Top = 0
  Caption = 'frmAddProduct'
  ClientHeight = 607
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Label1: TLabel
    Left = 200
    Top = 24
    Width = 227
    Height = 37
    Caption = 'Add New Product'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 24
    Top = 67
    Width = 596
    Height = 532
    TabOrder = 0
    object Panel2: TPanel
      Left = 24
      Top = 16
      Width = 545
      Height = 41
      TabOrder = 0
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
      object edtProductCode: TEdit
        Left = 248
        Top = 8
        Width = 257
        Height = 23
        TabOrder = 0
        TextHint = 'Enter Product Code'
      end
    end
    object Panel10: TPanel
      Left = 0
      Top = 448
      Width = 593
      Height = 41
      TabOrder = 1
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
  end
  object Panel3: TPanel
    Left = 48
    Top = 130
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
      TabOrder = 0
      TextHint = 'Enter Product Name'
    end
  end
  object Panel4: TPanel
    Left = 48
    Top = 177
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
      TabOrder = 0
      TextHint = 'Enter Product Price'
    end
  end
  object Panel5: TPanel
    Left = 48
    Top = 224
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
      TabOrder = 0
      TextHint = 'Enter Product Quantity'
    end
  end
  object Panel6: TPanel
    Left = 48
    Top = 271
    Width = 545
    Height = 41
    TabOrder = 4
    object Label6: TLabel
      Left = 24
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
      TabOrder = 0
      TextHint = 'Enter Product PurchaseDate'
    end
  end
  object Panel7: TPanel
    Left = 48
    Top = 318
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
      TabOrder = 0
      TextHint = 'Enter Product Expiry Date'
    end
  end
  object Panel8: TPanel
    Left = 48
    Top = 365
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
      TabOrder = 0
      OnClick = btnUploadImageClick
    end
  end
  object Panel9: TPanel
    Left = 48
    Top = 412
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
      TabOrder = 0
      TextHint = 'Enter Product Image Name'
    end
  end
  object Panel11: TPanel
    Left = 48
    Top = 459
    Width = 545
    Height = 41
    TabOrder = 8
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
      TabOrder = 0
      TextHint = 'Enter Product Category'
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 496
    Top = 563
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
    Left = 560
    Top = 555
  end
end
