object frmInventoryManager: TfrmInventoryManager
  Left = 0
  Top = 0
  Caption = 'frmInventoryManager'
  ClientHeight = 442
  ClientWidth = 716
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
    Left = 24
    Top = 24
    Width = 48
    Height = 15
    Caption = 'Category'
  end
  object Label2: TLabel
    Left = 408
    Top = 24
    Width = 35
    Height = 15
    Caption = 'Search'
  end
  object DBGrid1: TDBGrid
    Left = 24
    Top = 64
    Width = 665
    Height = 297
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
  end
  object edtCategory: TEdit
    Left = 79
    Top = 21
    Width = 162
    Height = 23
    TabOrder = 1
    TextHint = 'Enter Category of product'
  end
  object Submit: TButton
    Left = 247
    Top = 20
    Width = 74
    Height = 25
    Caption = 'Submit'
    TabOrder = 2
    OnClick = SubmitClick
  end
  object edtSearch: TEdit
    Left = 472
    Top = 21
    Width = 241
    Height = 23
    TabOrder = 3
    OnChange = edtSearchChange
  end
  object Button1: TButton
    Left = 24
    Top = 367
    Width = 75
    Height = 25
    Caption = 'Logout'
    TabOrder = 4
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 536
    Top = 367
    Width = 153
    Height = 25
    Caption = 'Show All Orders'
    TabOrder = 5
    OnClick = Button2Click
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
    Top = 288
  end
end
