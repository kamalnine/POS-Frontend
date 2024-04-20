object Form4: TForm4
  Left = 0
  Top = 0
  Caption = 'Form4'
  ClientHeight = 442
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Label1: TLabel
    Left = 112
    Top = 56
    Width = 56
    Height = 15
    Caption = 'Username'#39
  end
  object Label2: TLabel
    Left = 112
    Top = 91
    Width = 50
    Height = 15
    Caption = 'Password'
  end
  object Label3: TLabel
    Left = 112
    Top = 120
    Width = 44
    Height = 15
    Caption = 'ToTarget'
  end
  object Label4: TLabel
    Left = 112
    Top = 152
    Width = 38
    Height = 15
    Caption = 'subject'
  end
  object Label5: TLabel
    Left = 112
    Top = 184
    Width = 27
    Height = 15
    Caption = 'body'
  end
  object edtUserName: TEdit
    Left = 200
    Top = 53
    Width = 241
    Height = 23
    TabOrder = 0
  end
  object estPassword: TEdit
    Left = 200
    Top = 82
    Width = 241
    Height = 23
    TabOrder = 1
  end
  object edtTarget: TEdit
    Left = 200
    Top = 117
    Width = 241
    Height = 23
    TabOrder = 2
  end
  object edtSubject: TEdit
    Left = 200
    Top = 149
    Width = 241
    Height = 23
    TabOrder = 3
  end
  object edtBody: TEdit
    Left = 200
    Top = 178
    Width = 241
    Height = 23
    TabOrder = 4
  end
  object btnEmail: TButton
    Left = 248
    Top = 224
    Width = 75
    Height = 25
    Caption = 'Send Email'
    TabOrder = 5
    OnClick = btnEmailClick
  end
  object IdSMTP1: TIdSMTP
    SASLMechanisms = <>
    Left = 488
    Top = 280
  end
  object IdMessage1: TIdMessage
    AttachmentEncoding = 'MIME'
    BccList = <>
    CCList = <>
    Encoding = meDefault
    FromList = <
      item
      end>
    Recipients = <>
    ReplyTo = <>
    ConvertPreamble = True
    Left = 536
    Top = 336
  end
  object IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL
    MaxLineAction = maException
    Port = 0
    DefaultPort = 0
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 368
    Top = 328
  end
end
