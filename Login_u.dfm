object frmLogin: TfrmLogin
  Left = 0
  Top = 0
  Caption = 'frmLogin'
  ClientHeight = 442
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Panel1: TPanel
    Left = -8
    Top = 0
    Width = 633
    Height = 41
    TabOrder = 0
    object Label1: TLabel
      Left = 264
      Top = 9
      Width = 126
      Height = 32
      Caption = 'Login Page'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object Panel2: TPanel
    Left = -8
    Top = 47
    Width = 633
    Height = 354
    TabOrder = 1
    object Label2: TLabel
      Left = 64
      Top = 59
      Width = 29
      Height = 15
      Caption = 'Email'
    end
    object Label3: TLabel
      Left = 64
      Top = 112
      Width = 50
      Height = 15
      Caption = 'Password'
    end
    object edtEmail: TEdit
      Left = 160
      Top = 56
      Width = 217
      Height = 23
      TabOrder = 0
      TextHint = 'Enter your Email'
    end
    object edtPassword: TEdit
      Left = 160
      Top = 109
      Width = 217
      Height = 23
      TabOrder = 1
      TextHint = 'Enter your password'
    end
    object Button1: TButton
      Left = 112
      Top = 165
      Width = 209
      Height = 25
      Caption = 'Login'
      TabOrder = 2
      OnClick = Button1Click
    end
  end
  object RESTClient1: TRESTClient
    BaseURL = 'http://localhost:5063/api/Auth/Login'
    Params = <>
    SynchronizedEvents = False
  end
  object RESTRequest1: TRESTRequest
    AssignedValues = [rvConnectTimeout, rvReadTimeout]
    Client = RESTClient1
    Method = rmPOST
    Params = <
      item
        Kind = pkREQUESTBODY
        Name = 'bodyC658B0E85ED64CCDB34879244FFF7DF3'
        Value = '{'#13#10'  "email": "kamal@gmail.com",'#13#10'  "password": "kamal123#"'#13#10'}'
        ContentTypeStr = 'application/json'
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
