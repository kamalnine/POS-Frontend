object frmSalesManager: TfrmSalesManager
  Left = 0
  Top = 0
  Align = alTop
  Caption = 'frmSalesManager'
  ClientHeight = 682
  ClientWidth = 1374
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClick = FormClick
  OnCreate = FormCreate
  TextHeight = 15
  object lblSearch: TLabel
    Left = 610
    Top = 8
    Width = 59
    Height = 25
    Caption = 'Search'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 24
    Top = 640
    Width = 79
    Height = 15
    Caption = 'Logged In User'
  end
  object Panel1: TPanel
    Left = -8
    Top = 0
    Width = 273
    Height = 393
    Alignment = taLeftJustify
    BevelWidth = 4
    Caption = 'POS Number'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    VerticalAlignment = taAlignTop
    object Button1: TButton
      Left = 8
      Top = 48
      Width = 80
      Height = 80
      Caption = '7'
      TabOrder = 0
      OnClick = NumberClick
    end
    object Button2: TButton
      Left = 94
      Top = 48
      Width = 80
      Height = 80
      Caption = '8'
      TabOrder = 1
      OnClick = NumberClick
    end
    object Button3: TButton
      Left = 180
      Top = 48
      Width = 80
      Height = 80
      Caption = '9'
      TabOrder = 2
      OnClick = NumberClick
    end
    object Button4: TButton
      Left = 8
      Top = 134
      Width = 80
      Height = 80
      Caption = '4'
      TabOrder = 3
      OnClick = NumberClick
    end
    object Button5: TButton
      Left = 94
      Top = 134
      Width = 80
      Height = 80
      Caption = '5'
      TabOrder = 4
      OnClick = NumberClick
    end
    object Button6: TButton
      Left = 180
      Top = 134
      Width = 80
      Height = 80
      Caption = '6'
      TabOrder = 5
      OnClick = NumberClick
    end
    object Button7: TButton
      Left = 8
      Top = 220
      Width = 80
      Height = 80
      Caption = '1'
      TabOrder = 6
      OnClick = NumberClick
    end
    object Button8: TButton
      Left = 94
      Top = 220
      Width = 80
      Height = 80
      Caption = '2'
      TabOrder = 7
      OnClick = NumberClick
    end
    object Button9: TButton
      Left = 180
      Top = 220
      Width = 80
      Height = 80
      Caption = '3'
      TabOrder = 8
      OnClick = NumberClick
    end
    object Button10: TButton
      Left = 8
      Top = 306
      Width = 80
      Height = 80
      Caption = '0'
      TabOrder = 9
      OnClick = NumberClick
    end
    object Button11: TButton
      Left = 94
      Top = 306
      Width = 80
      Height = 80
      Caption = '.'
      TabOrder = 10
      OnClick = Button11Click
    end
    object Button12: TButton
      Left = 180
      Top = 306
      Width = 80
      Height = 80
      Caption = 'C'
      TabOrder = 11
      OnClick = Button12Click
    end
  end
  object Panel2: TPanel
    Left = 271
    Top = 0
    Width = 290
    Height = 402
    Alignment = taLeftJustify
    BevelWidth = 4
    Caption = ' Items   Price($)  QTY'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    VerticalAlignment = taAlignTop
    object lstPrice: TListBox
      Left = 8
      Top = 48
      Width = 273
      Height = 345
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ItemHeight = 25
      ParentFont = False
      TabOrder = 0
    end
  end
  object Panel3: TPanel
    Left = 567
    Top = 56
    Width = 799
    Height = 337
    Alignment = taLeftJustify
    BevelWidth = 4
    Caption = 
      'Point Of Sale                                                   ' +
      '    Item Selector'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    VerticalAlignment = taAlignTop
    object DBGrid1: TDBGrid
      Left = 0
      Top = 40
      Width = 785
      Height = 346
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -27
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = [fsBold]
      OnCellClick = DBGrid1CellClick
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 408
    Width = 881
    Height = 201
    Alignment = taLeftJustify
    BevelWidth = 4
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    VerticalAlignment = taAlignTop
    object Panel6: TPanel
      Left = 9
      Top = 16
      Width = 425
      Height = 165
      Alignment = taLeftJustify
      BevelWidth = 4
      BorderStyle = bsSingle
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      VerticalAlignment = taAlignTop
      object Label1: TLabel
        Left = 16
        Top = 16
        Width = 120
        Height = 37
        Caption = 'Sub Total'
      end
      object Label2: TLabel
        Left = 16
        Top = 59
        Width = 44
        Height = 37
        Caption = 'Tax'
      end
      object Label3: TLabel
        Left = 16
        Top = 102
        Width = 65
        Height = 37
        Caption = 'Total'
      end
      object EditSubTotal: TEdit
        Left = 184
        Top = 16
        Width = 193
        Height = 45
        TabOrder = 0
        Text = '0'
      end
      object EditTax: TEdit
        Left = 184
        Top = 64
        Width = 193
        Height = 45
        TabOrder = 1
        Text = '0'
      end
      object EditTotal: TEdit
        Left = 184
        Top = 111
        Width = 193
        Height = 45
        TabOrder = 2
        Text = '0'
      end
    end
    object Panel5: TPanel
      Left = 448
      Top = 16
      Width = 416
      Height = 165
      Alignment = taLeftJustify
      BevelWidth = 4
      BorderStyle = bsSingle
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      VerticalAlignment = taAlignTop
      object Label4: TLabel
        Left = 24
        Top = 24
        Width = 155
        Height = 37
        Caption = 'Pay Method'
      end
      object Label5: TLabel
        Left = 24
        Top = 67
        Width = 123
        Height = 37
        Caption = 'Cash Paid'
      end
      object Label6: TLabel
        Left = 24
        Top = 110
        Width = 96
        Height = 37
        Caption = 'Change'
      end
      object EditCost: TEdit
        Left = 192
        Top = 60
        Width = 193
        Height = 38
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object EditChange: TEdit
        Left = 192
        Top = 111
        Width = 193
        Height = 38
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
      object cmbPayMethod: TComboBox
        Left = 192
        Top = 16
        Width = 193
        Height = 38
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
    end
  end
  object Panel7: TPanel
    Left = 887
    Top = 406
    Width = 479
    Height = 201
    Alignment = taLeftJustify
    BevelWidth = 4
    BorderStyle = bsSingle
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    VerticalAlignment = taAlignTop
    object btnPay: TButton
      Left = 8
      Top = 8
      Width = 130
      Height = 80
      Caption = 'Pay'
      TabOrder = 0
      OnClick = btnPayClick
    end
    object btnSave: TButton
      Left = 160
      Top = 8
      Width = 130
      Height = 80
      Caption = 'Save'
      TabOrder = 1
      OnClick = btnSaveClick
    end
    object btnReset: TButton
      Left = 312
      Top = 8
      Width = 130
      Height = 80
      Caption = 'Reset'
      TabOrder = 2
      OnClick = btnResetClick
    end
    object btnRemove: TButton
      Left = 8
      Top = 102
      Width = 130
      Height = 80
      Caption = 'Remove'
      TabOrder = 3
      OnClick = btnRemoveClick
    end
    object btnOpen: TButton
      Left = 160
      Top = 102
      Width = 130
      Height = 80
      Caption = 'Open'
      TabOrder = 4
      OnClick = btnOpenClick
    end
    object btnExit: TButton
      Left = 312
      Top = 102
      Width = 130
      Height = 80
      Caption = 'Exit'
      TabOrder = 5
      OnClick = btnExitClick
    end
  end
  object Panel8: TPanel
    Left = 515
    Top = 633
    Width = 470
    Height = 41
    BevelWidth = 4
    TabOrder = 5
    object Button13: TButton
      Left = 126
      Top = 8
      Width = 235
      Height = 25
      Caption = 'Add New Product'
      TabOrder = 0
      OnClick = Button13Click
    end
  end
  object edtSearch: TEdit
    Left = 705
    Top = 8
    Width = 448
    Height = 23
    TabOrder = 6
    OnChange = edtSearchChange
  end
  object edtUserName: TEdit
    Left = 131
    Top = 637
    Width = 206
    Height = 23
    TabOrder = 7
  end
  object Panel9: TPanel
    Left = 1072
    Top = 627
    Width = 209
    Height = 41
    BevelWidth = 4
    TabOrder = 8
    object btnLogout: TButton
      Left = 24
      Top = 8
      Width = 161
      Height = 25
      Caption = 'Logout'
      TabOrder = 0
      OnClick = btnLogoutClick
    end
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
    Left = 744
    Top = 624
  end
  object SaveDialog1: TSaveDialog
    Left = 880
    Top = 624
  end
  object OpenDialog1: TOpenDialog
    Left = 1040
    Top = 632
  end
  object IdHTTP2: TIdHTTP
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
    Left = 1200
    Top = 624
  end
  object RESTClient1: TRESTClient
    BaseURL = 'http://localhost:5063/api/Auth/GetNameByEmail'
    Params = <>
    SynchronizedEvents = False
    Left = 16
  end
  object RESTRequest1: TRESTRequest
    AssignedValues = [rvConnectTimeout, rvReadTimeout]
    Client = RESTClient1
    Params = <
      item
        Name = 'email'
        Value = 'kamal@gmail.com'
      end>
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 48
    Top = 32
  end
  object RESTResponse1: TRESTResponse
    Left = 56
    Top = 40
  end
  object IdHTTP3: TIdHTTP
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
    Left = 643
    Top = 617
  end
end
