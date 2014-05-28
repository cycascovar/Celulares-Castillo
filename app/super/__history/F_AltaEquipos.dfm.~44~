object FAltaEquipo: TFAltaEquipo
  Left = 0
  Top = 0
  Caption = 'Sistema para administradores: Alta de equipos'
  ClientHeight = 357
  ClientWidth = 1044
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 16
    Top = 64
    Width = 33
    Height = 13
    Align = alCustom
    Anchors = [akLeft, akBottom]
    Caption = 'Marca:'
  end
  object Label3: TLabel
    Left = 16
    Top = 272
    Width = 155
    Height = 13
    Align = alCustom
    Anchors = [akLeft, akBottom]
    Caption = 'Los equipos van para la sucursal'
  end
  object Label4: TLabel
    Left = 16
    Top = 96
    Width = 38
    Height = 13
    Align = alCustom
    Anchors = [akLeft, akBottom]
    Caption = 'Modelo:'
  end
  object Label5: TLabel
    Left = 16
    Top = 136
    Width = 24
    Height = 13
    Align = alCustom
    Anchors = [akLeft, akBottom]
    Caption = 'Imei:'
  end
  object Label6: TLabel
    Left = 16
    Top = 168
    Width = 33
    Height = 13
    Align = alCustom
    Anchors = [akLeft, akBottom]
    Caption = 'ICCID:'
  end
  object Label7: TLabel
    Left = 16
    Top = 208
    Width = 75
    Height = 13
    Align = alCustom
    Anchors = [akLeft, akBottom]
    Caption = 'N'#250'mero celular:'
  end
  object Label8: TLabel
    Left = 16
    Top = 238
    Width = 29
    Height = 13
    Align = alCustom
    Anchors = [akLeft, akBottom]
    Caption = 'Precio'
  end
  object Label1: TLabel
    Left = 18
    Top = 8
    Width = 137
    Height = 19
    Caption = 'Alta de celulares'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object listaSucursales: TDBLookupComboBox
    Left = 177
    Top = 269
    Width = 145
    Height = 21
    Align = alCustom
    Anchors = [akLeft, akBottom]
    ListSource = DSListaSuc
    TabOrder = 0
  end
  object marcaequipo: TEdit
    Left = 64
    Top = 64
    Width = 121
    Height = 21
    Align = alCustom
    Anchors = [akLeft, akBottom]
    TabOrder = 1
  end
  object modeloequipo: TEdit
    Left = 64
    Top = 96
    Width = 121
    Height = 21
    Align = alCustom
    Anchors = [akLeft, akBottom]
    TabOrder = 2
  end
  object imeiequipo: TEdit
    Left = 64
    Top = 141
    Width = 121
    Height = 21
    Align = alCustom
    Anchors = [akLeft, akBottom]
    TabOrder = 3
  end
  object iccidequipo: TEdit
    Left = 64
    Top = 167
    Width = 121
    Height = 21
    Align = alCustom
    Anchors = [akLeft, akBottom]
    TabOrder = 4
  end
  object numeroequipo: TEdit
    Left = 120
    Top = 208
    Width = 121
    Height = 21
    Align = alCustom
    Anchors = [akLeft, akBottom]
    TabOrder = 5
  end
  object Button1: TButton
    Left = 8
    Top = 321
    Width = 75
    Height = 25
    Align = alCustom
    Anchors = [akLeft, akBottom]
    Caption = 'Dar de alta'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 247
    Top = 324
    Width = 75
    Height = 25
    Align = alCustom
    Anchors = [akLeft, akBottom]
    Caption = 'Limpiar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
  end
  object precioequipo: TEdit
    Left = 53
    Top = 238
    Width = 145
    Height = 21
    Align = alCustom
    Anchors = [akLeft, akBottom]
    TabOrder = 8
  end
  object DBAlmacenes: TDBGrid
    Left = 344
    Top = 61
    Width = 692
    Height = 283
    Align = alCustom
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DSSucursales
    TabOrder = 9
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Sucursal'
        Width = 94
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Marca'
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Modelo'
        Width = 101
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IMEI'
        Width = 111
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ICCID'
        Width = 124
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Numero'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Precio'
        Visible = True
      end>
  end
  object sucursal: TEdit
    Left = 344
    Top = 34
    Width = 105
    Height = 21
    TabOrder = 10
    OnKeyUp = sucursalKeyUp
  end
  object ZQSucursales: TZQuery
    Connection = FPrincipalAdmin.ZConexion
    Params = <>
    Left = 504
    Top = 104
  end
  object DSSucursales: TDataSource
    DataSet = ZQSucursales
    Left = 480
    Top = 200
  end
  object DSListaSuc: TDataSource
    DataSet = ZQListaSuc
    Left = 168
    Top = 296
  end
  object ZQListaSuc: TZQuery
    Connection = FPrincipalAdmin.ZConexion
    Params = <>
    Left = 120
    Top = 304
  end
end
