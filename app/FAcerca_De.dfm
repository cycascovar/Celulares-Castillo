object FAcercaDe: TFAcercaDe
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Acerca de'
  ClientHeight = 214
  ClientWidth = 386
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  Visible = True
  OnClick = FormClick
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label5: TLabel
    Left = 17
    Top = 8
    Width = 301
    Height = 23
    Caption = 'Sistema para control de inventarios.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clCaptionText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 108
    Top = 88
    Width = 82
    Height = 13
    Caption = '| (771) 214-9235'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clCaptionText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object sucursal: TLabel
    Left = 82
    Top = 110
    Width = 30
    Height = 13
    Caption = '          '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clCaptionText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 25
    Top = 110
    Width = 51
    Height = 13
    Caption = 'Sucursal:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clCaptionText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 16
    Top = 95
    Width = 3
    Height = 13
  end
  object Label2: TLabel
    Left = 13
    Top = 69
    Width = 253
    Height = 13
    Caption = 'Desarrollado por Christian Yamil Castillo Covarrubias.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clCaptionText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object ver: TLabel
    Left = 281
    Top = 35
    Width = 46
    Height = 28
    Caption = '1.00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clCaptionText
    Font.Height = -23
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 17
    Top = 37
    Width = 258
    Height = 25
    Caption = 'Celulares "Chapulh" versi'#243'n'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clCaptionText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object LinkLabel1: TLinkLabel
    Left = 8
    Top = 87
    Width = 94
    Height = 17
    Caption = 'cyccov@gmail.com'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clCaptionText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsUnderline]
    ParentColor = False
    ParentFont = False
    TabOrder = 0
    OnClick = LinkLabel1Click
  end
  object Button1: TButton
    Left = 160
    Top = 181
    Width = 75
    Height = 25
    Caption = 'Cerrar'
    TabOrder = 1
    OnClick = Button1Click
  end
end
