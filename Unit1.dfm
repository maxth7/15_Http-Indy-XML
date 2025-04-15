object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Client RPC'
  ClientHeight = 423
  ClientWidth = 483
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object GroupBox1: TGroupBox
    Left = 8
    Top = 6
    Width = 225
    Height = 273
    Caption = 'Sending to the server'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clGreen
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object LabelINN: TLabel
      Left = 16
      Top = 29
      Width = 41
      Height = 25
      Caption = 'INN:'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clGreen
      Font.Height = -19
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Edit1: TEdit
      Left = 88
      Top = 29
      Width = 137
      Height = 33
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clGreen
      Font.Height = -19
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      Text = '7730588444'
    end
    object MemoMess: TMemo
      Left = 338
      Top = 276
      Width = 339
      Height = 165
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clGreen
      Font.Height = -19
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      ScrollBars = ssBoth
      TabOrder = 1
    end
    object ButtonSend: TButton
      Left = -7
      Top = 230
      Width = 232
      Height = 40
      Caption = 'Send'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clGreen
      Font.Height = -19
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = ButtonSendClick
    end
    object Memo1Send: TMemo
      Left = 3
      Top = 68
      Width = 222
      Height = 156
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clGreen
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ScrollBars = ssBoth
      TabOrder = 3
    end
  end
  object GroupBox2: TGroupBox
    Left = 239
    Top = 6
    Width = 234
    Height = 409
    Caption = 'Received from the server'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clGreen
    Font.Height = -19
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object MemoReceived: TMemo
      Left = 7
      Top = 29
      Width = 210
      Height = 379
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clGreen
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ScrollBars = ssBoth
      TabOrder = 0
    end
  end
  object GroupBox3: TGroupBox
    Left = 8
    Top = 287
    Width = 225
    Height = 130
    Caption = '       Client messages'
    DefaultHeaderFont = False
    HeaderFont.Charset = RUSSIAN_CHARSET
    HeaderFont.Color = clBlack
    HeaderFont.Height = -19
    HeaderFont.Name = 'Segoe UI'
    HeaderFont.Style = [fsBold]
    TabOrder = 2
    object MemoSend: TMemo
      Left = 371
      Top = 256
      Width = 318
      Height = 81
      Lines.Strings = (
        '')
      ScrollBars = ssBoth
      TabOrder = 0
    end
    object ButtonDisconnect: TButton
      Left = 104
      Top = 105
      Width = 112
      Height = 25
      Caption = 'Disconnect'
      Enabled = False
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clGreen
      Font.Height = -19
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = ButtonDisconnectClick
    end
    object ButtonConnect: TButton
      Left = 0
      Top = 104
      Width = 98
      Height = 25
      Caption = 'Connect'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clGreen
      Font.Height = -19
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = ButtonConnectClick
    end
    object Memo1Mess: TMemo
      Left = 3
      Top = 21
      Width = 222
      Height = 68
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clGreen
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      Lines.Strings = (
        '')
      ParentFont = False
      ScrollBars = ssBoth
      TabOrder = 3
    end
  end
  object IdTCPClient1: TIdTCPClient
    OnDisconnected = IdTCPClient1Disconnected
    OnConnected = IdTCPClient1Connected
    ConnectTimeout = 0
    Port = 0
    ReadTimeout = -1
    Left = 288
    Top = 336
  end
end
