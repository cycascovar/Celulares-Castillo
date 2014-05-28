object FAContacto: TFAContacto
  Left = 0
  Top = 0
  Caption = 'FAContacto'
  ClientHeight = 365
  ClientWidth = 342
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 41
    Height = 13
    Caption = 'Nombre:'
  end
  object Label2: TLabel
    Left = 8
    Top = 117
    Width = 146
    Height = 13
    Caption = 'Razones por las que contacta:'
  end
  object Label3: TLabel
    Left = 8
    Top = 181
    Width = 121
    Height = 13
    Caption = #191'En qu'#233' puedo ayudarle?'
  end
  object Label4: TLabel
    Left = 8
    Top = 62
    Width = 92
    Height = 13
    Caption = 'E-mail de contacto:'
  end
  object Edit1: TEdit
    Left = 8
    Top = 35
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'Edit1'
  end
  object Contactar: TButton
    Left = 128
    Top = 315
    Width = 75
    Height = 25
    Caption = 'Contactar'
    TabOrder = 1
    OnClick = ContactarClick
  end
  object RadioButton1: TRadioButton
    Left = 8
    Top = 136
    Width = 57
    Height = 17
    Caption = 'Queja'
    TabOrder = 2
  end
  object RadioButton2: TRadioButton
    Left = 88
    Top = 136
    Width = 75
    Height = 17
    Caption = 'Sugerencia'
    TabOrder = 3
  end
  object Memo1: TMemo
    Left = 8
    Top = 200
    Width = 328
    Height = 89
    Lines.Strings = (
      'Memo1')
    TabOrder = 4
  end
  object RadioButton3: TRadioButton
    Left = 169
    Top = 136
    Width = 120
    Height = 17
    Caption = 'Reporte de error'
    TabOrder = 5
  end
  object Edit2: TEdit
    Left = 8
    Top = 81
    Width = 121
    Height = 21
    TabOrder = 6
    Text = 'Edit1'
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 346
    Width = 342
    Height = 19
    Panels = <
      item
        Width = 50
      end
      item
        Width = 50
      end
      item
        Width = 50
      end>
    SizeGrip = False
    ExplicitLeft = 256
    ExplicitTop = 344
    ExplicitWidth = 0
  end
end
