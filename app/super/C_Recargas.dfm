object CRecargas: TCRecargas
  Left = 0
  Top = 0
  Anchors = [akLeft, akTop, akRight, akBottom]
  Caption = 'CRecargas'
  ClientHeight = 456
  ClientWidth = 424
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    424
    456)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 162
    Height = 13
    Caption = 'Dar de alta c'#243'digos para recargas'
  end
  object Label2: TLabel
    Left = 8
    Top = 248
    Width = 396
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 
      'C'#243'digos para recargas (presionar "enter" despues de ingresar cod' +
      'igo)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ExplicitTop = 222
  end
  object Label3: TLabel
    Left = 8
    Top = 371
    Width = 184
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Los codigos van para la sucursal:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ExplicitTop = 346
  end
  object txtcodigos: TMemo
    Left = 7
    Top = 267
    Width = 409
    Height = 85
    Anchors = [akLeft, akRight, akBottom]
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object Button1: TButton
    Left = 131
    Top = 401
    Width = 121
    Height = 39
    Anchors = [akLeft, akBottom]
    Caption = 'Dar de alta codigos'
    TabOrder = 1
    OnClick = Button1Click
    ExplicitTop = 375
  end
  object listaSucursales: TDBLookupComboBox
    Left = 207
    Top = 367
    Width = 145
    Height = 21
    Anchors = [akLeft, akBottom]
    ListSource = DSSucursales
    TabOrder = 2
    ExplicitTop = 341
  end
  object gridCodigosRecargas: TDBGrid
    Left = 8
    Top = 75
    Width = 408
    Height = 170
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DSRecargas
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Sucursal'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Codigo'
        Visible = True
      end
      item
        Expanded = False
        Visible = True
      end>
  end
  object txtsucursal: TEdit
    Left = 13
    Top = 48
    Width = 76
    Height = 21
    TabOrder = 4
  end
  object DSRecargas: TDataSource
    DataSet = ZQRecargas
    Left = 152
    Top = 168
  end
  object ZQRecargas: TZQuery
    Connection = FMain.ZConexion
    Params = <>
    Left = 208
    Top = 160
  end
  object ZQSucursales: TZQuery
    Connection = FMain.ZConexion
    Params = <>
    Left = 336
    Top = 296
  end
  object DSSucursales: TDataSource
    DataSet = ZQSucursales
    Left = 232
    Top = 304
  end
end
