object C_ClientesReparacion: TC_ClientesReparacion
  Left = 0
  Top = 0
  Caption = 'C_ClientesReparacion'
  ClientHeight = 638
  ClientWidth = 789
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
    789
    638)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 195
    Height = 13
    Caption = 'Cat'#225'logo de clientes de reparaci'#243'n'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 27
    Width = 261
    Height = 13
    Caption = 'El cat'#225'logo de clientes mostrado es para la sucursal de'
  end
  object Label10: TLabel
    Left = 275
    Top = 27
    Width = 31
    Height = 13
    Caption = 'Label1'
  end
  object gridCReparaciones: TDBGrid
    Left = 8
    Top = 80
    Width = 773
    Height = 225
    Anchors = [akLeft, akTop, akRight]
    DataSource = DSCReparacion
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = gridCReparacionesCellClick
    OnKeyUp = gridCReparacionesKeyUp
    Columns = <
      item
        Expanded = False
        FieldName = 'Sucursal'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Titular'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Telefono de contacto'
        Width = 115
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Marca'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Modelo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IMEI'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Observaciones'
        Width = 207
        Visible = True
      end>
  end
  object todos: TCheckBox
    Left = 392
    Top = 25
    Width = 233
    Height = 17
    Caption = 'Cargar clientes de todas las sucursales'
    TabOrder = 1
    OnClick = todosClick
  end
  object Edit1: TEdit
    Left = 8
    Top = 53
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object Edit2: TEdit
    Left = 135
    Top = 53
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object ProgressBar1: TProgressBar
    Left = 8
    Top = 176
    Width = 773
    Height = 17
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 4
    ExplicitWidth = 915
  end
  object Button1: TButton
    Left = 392
    Top = 49
    Width = 137
    Height = 25
    Caption = 'Cargar clientes'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = Button1Click
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 327
    Width = 441
    Height = 303
    Anchors = [akLeft, akTop, akBottom]
    Caption = 'Datos del cliente'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    object Label3: TLabel
      Left = 16
      Top = 24
      Width = 40
      Height = 13
      Caption = 'Titular:'
    end
    object Label4: TLabel
      Left = 16
      Top = 64
      Width = 122
      Height = 13
      Caption = 'Telefono de contacto:'
    end
    object Label5: TLabel
      Left = 16
      Top = 104
      Width = 51
      Height = 13
      Caption = 'Sucursal:'
    end
    object txttitular: TEdit
      Left = 74
      Top = 21
      Width = 201
      Height = 21
      ReadOnly = True
      TabOrder = 0
    end
    object txttelefonocontacto: TEdit
      Left = 154
      Top = 61
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 1
    end
    object txtsucursal: TEdit
      Left = 73
      Top = 101
      Width = 121
      Height = 21
      TabOrder = 2
    end
  end
  object GroupBox2: TGroupBox
    Left = 455
    Top = 327
    Width = 326
    Height = 303
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = 'Datos del celular'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    ExplicitWidth = 468
    object Label7: TLabel
      Left = 16
      Top = 24
      Width = 29
      Height = 13
      Caption = 'IMEI:'
    end
    object Label8: TLabel
      Left = 16
      Top = 64
      Width = 38
      Height = 13
      Caption = 'Marca:'
    end
    object Label9: TLabel
      Left = 16
      Top = 104
      Width = 44
      Height = 13
      Caption = 'Modelo:'
    end
    object Label11: TLabel
      Left = 16
      Top = 144
      Width = 86
      Height = 13
      Caption = 'Observaciones:'
    end
    object txtimei: TEdit
      Left = 71
      Top = 21
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 0
    end
    object txtmarca: TEdit
      Left = 71
      Top = 61
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 1
    end
    object txtmodelo: TEdit
      Left = 72
      Top = 101
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 2
    end
    object txtobservaciones: TMemo
      Left = 116
      Top = 141
      Width = 185
      Height = 89
      TabOrder = 3
    end
  end
  object ZQCReparacion: TZQuery
    Connection = FPrincipalAdmin.ZConexion
    Params = <>
    Left = 552
    Top = 80
  end
  object DSCReparacion: TDataSource
    DataSet = ZQCReparacion
    Left = 472
    Top = 192
  end
end
