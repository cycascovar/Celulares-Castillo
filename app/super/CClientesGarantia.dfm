object C_ClientesGarantia: TC_ClientesGarantia
  Left = 46
  Top = 0
  Caption = 'Catalogo de clientes de garant'#237'a'
  ClientHeight = 632
  ClientWidth = 918
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    918
    632)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 182
    Height = 13
    Caption = 'Cat'#225'logo de clientes de garant'#237'a'
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
    Width = 270
    Height = 13
    Caption = 'El cat'#225'logo de clientes presente, es para la sucursal de: '
  end
  object sucursal: TLabel
    Left = 280
    Top = 27
    Width = 45
    Height = 13
    Caption = '$sucursal'
  end
  object DBCGarantias: TDBGrid
    Left = 8
    Top = 81
    Width = 904
    Height = 296
    Anchors = [akLeft, akTop, akRight]
    BorderStyle = bsNone
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = DBCGarantiasCellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Sucursal'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Titular'
        Width = 125
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Telefono'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IMEI'
        Width = 152
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ICCID'
        Width = 135
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Observaciones'
        Width = 139
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Accesorios'
        Width = 208
        Visible = True
      end>
  end
  object txtsucursalf: TEdit
    Left = 8
    Top = 54
    Width = 89
    Height = 21
    TabOrder = 1
  end
  object Button1: TButton
    Left = 375
    Top = 50
    Width = 130
    Height = 25
    Caption = 'Cargar clientes'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = Button1Click
  end
  object ProgressBar1: TProgressBar
    Left = 8
    Top = 248
    Width = 904
    Height = 25
    Anchors = [akLeft, akTop, akRight]
    BarColor = clHighlight
    TabOrder = 3
  end
  object todos: TCheckBox
    Left = 375
    Top = 27
    Width = 242
    Height = 17
    Caption = 'Cargar clientes de todas las sucursales'
    TabOrder = 4
  end
  object txttitularf: TEdit
    Left = 103
    Top = 54
    Width = 121
    Height = 21
    TabOrder = 5
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 396
    Width = 345
    Height = 228
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = 'Datos del cliente'
    TabOrder = 6
    object Label3: TLabel
      Left = 16
      Top = 32
      Width = 41
      Height = 13
      Caption = 'Nombre:'
    end
    object Label4: TLabel
      Left = 16
      Top = 69
      Width = 106
      Height = 13
      Caption = 'Tel'#233'fono de contacto:'
    end
    object Label5: TLabel
      Left = 16
      Top = 109
      Width = 44
      Height = 13
      Caption = 'Sucursal:'
    end
    object txtcliente: TEdit
      Left = 63
      Top = 24
      Width = 235
      Height = 21
      ReadOnly = True
      TabOrder = 0
    end
    object txttelefono: TEdit
      Left = 128
      Top = 64
      Width = 170
      Height = 21
      ReadOnly = True
      TabOrder = 1
    end
    object txtsuc: TEdit
      Left = 66
      Top = 104
      Width = 232
      Height = 21
      ReadOnly = True
      TabOrder = 2
    end
  end
  object GroupBox2: TGroupBox
    Left = 359
    Top = 396
    Width = 551
    Height = 228
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = 'Datos del equipo celular'
    TabOrder = 7
    object Label6: TLabel
      Left = 16
      Top = 24
      Width = 29
      Height = 13
      Caption = 'IMEI: '
    end
    object Label7: TLabel
      Left = 16
      Top = 64
      Width = 29
      Height = 13
      Caption = 'IMEI: '
      WordWrap = True
    end
    object Label8: TLabel
      Left = 16
      Top = 109
      Width = 75
      Height = 13
      Caption = 'Observaciones:'
      WordWrap = True
    end
    object Label9: TLabel
      Left = 352
      Top = 104
      Width = 100
      Height = 13
      Caption = 'Accesorios recibidos:'
      WordWrap = True
    end
    object txtimei: TEdit
      Left = 51
      Top = 24
      Width = 158
      Height = 21
      ReadOnly = True
      TabOrder = 0
    end
    object txtobservaciones: TMemo
      Left = 16
      Top = 128
      Width = 185
      Height = 89
      ReadOnly = True
      TabOrder = 1
    end
    object txtaccesorios: TMemo
      Left = 352
      Top = 128
      Width = 180
      Height = 89
      ReadOnly = True
      TabOrder = 2
    end
    object txticcid: TEdit
      Left = 51
      Top = 64
      Width = 158
      Height = 21
      ReadOnly = True
      TabOrder = 3
    end
  end
end
