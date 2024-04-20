object frmCustomerRelationshipManager: TfrmCustomerRelationshipManager
  Left = 0
  Top = 0
  Caption = 'frmCustomerRelationshipManager'
  ClientHeight = 442
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object DBGrid1: TDBGrid
    Left = 24
    Top = 32
    Width = 577
    Height = 289
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
  end
  object Button1: TButton
    Left = 526
    Top = 1
    Width = 75
    Height = 25
    Caption = 'Logout'
    TabOrder = 1
    OnClick = Button1Click
  end
  object RESTClient1: TRESTClient
    BaseURL = 'http://localhost:5063/api/Auth/GetCustomer'
    Params = <>
    SynchronizedEvents = False
  end
  object RESTRequest1: TRESTRequest
    AssignedValues = [rvConnectTimeout, rvReadTimeout]
    Client = RESTClient1
    Params = <>
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
