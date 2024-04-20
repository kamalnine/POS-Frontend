object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
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
    Left = -5
    Top = 0
    Width = 630
    Height = 441
    TabOrder = 0
    object Label1: TLabel
      Left = 56
      Top = 88
      Width = 55
      Height = 15
      Caption = 'UserName'
    end
    object Label2: TLabel
      Left = 56
      Top = 128
      Width = 29
      Height = 15
      Caption = 'Email'
    end
    object Label3: TLabel
      Left = 56
      Top = 171
      Width = 50
      Height = 15
      Caption = 'Password'
    end
    object Label4: TLabel
      Left = 56
      Top = 213
      Width = 84
      Height = 15
      Caption = 'Mobile Number'
    end
    object Label5: TLabel
      Left = 224
      Top = 24
      Width = 176
      Height = 37
      Caption = 'Register Page'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtUserName: TEdit
      Left = 168
      Top = 85
      Width = 265
      Height = 23
      TabOrder = 0
      TextHint = 'Enter Your Name'
    end
    object edtName: TEdit
      Left = 168
      Top = 125
      Width = 265
      Height = 23
      TabOrder = 1
      TextHint = 'Enter Your Email'
    end
    object edtpassword: TEdit
      Left = 168
      Top = 168
      Width = 265
      Height = 23
      TabOrder = 2
      TextHint = 'Enter Your Password'
    end
    object edtMobileNumber: TEdit
      Left = 168
      Top = 210
      Width = 265
      Height = 23
      TabOrder = 3
      TextHint = 'Enter Your Mobile Number'
    end
    object Button1: TButton
      Left = 56
      Top = 256
      Width = 393
      Height = 25
      Caption = 'Register'
      TabOrder = 4
      OnClick = Button1Click
    end
    object Edit1: TEdit
      Left = 176
      Top = 287
      Width = 145
      Height = 23
      TabOrder = 5
      Text = 'Already have an account'
    end
    object Button2: TButton
      Left = 325
      Top = 287
      Width = 75
      Height = 23
      Caption = 'Login'
      TabOrder = 6
      OnClick = Button2Click
    end
  end
  object RESTClient1: TRESTClient
    BaseURL = 'http://localhost:5063/api/Auth/Register'
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
        Name = 'body8F14EE9D6D8E4448B89BD242BF9C3B82'
        Value = 
          '{'#13#10'  "userName": "Jyothsna",'#13#10'  "email": "jyothsna@gmail.com",'#13#10 +
          '  "password": "jyothsna123#",'#13#10'  "phoneNumber": "9381418143",'#13#10' ' +
          ' "roles": ['#13#10'    "Customer Relationship Manager"'#13#10'  ]'#13#10'}'
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
