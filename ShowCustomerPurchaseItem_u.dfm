object Form5: TForm5
  Left = 0
  Top = 0
  Caption = 'Form5'
  ClientHeight = 442
  ClientWidth = 755
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnShow = FormShow
  TextHeight = 15
  object Label1: TLabel
    Left = 63
    Top = 8
    Width = 123
    Height = 15
    Caption = 'Total Purchase Amount'
  end
  object DBGrid1: TDBGrid
    Left = 16
    Top = 40
    Width = 731
    Height = 353
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object btnLogout: TButton
    Left = 592
    Top = 8
    Width = 97
    Height = 25
    Caption = 'Close'
    TabOrder = 1
    OnClick = btnLogoutClick
  end
  object EditTotalAmount: TEdit
    Left = 208
    Top = 8
    Width = 121
    Height = 23
    TabOrder = 2
  end
  object RESTClient1: TRESTClient
    BaseURL = 'http://localhost:5063/api/PurchaseItem/Email'
    Params = <>
    SynchronizedEvents = False
  end
  object RESTRequest1: TRESTRequest
    AssignedValues = [rvConnectTimeout, rvReadTimeout]
    Client = RESTClient1
    Params = <
      item
        Name = 'email'
        Value = 'vaishnavi@gmail.com'
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
