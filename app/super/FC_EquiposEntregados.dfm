object FCEquiposEntregados: TFCEquiposEntregados
  Left = 0
  Top = 0
  Caption = 's'
  ClientHeight = 424
  ClientWidth = 544
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    544
    424)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 236
    Height = 13
    Caption = 'Cat'#225'logo de equipos celulares entregados'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 32
    Width = 31
    Height = 13
    Caption = 'Label2'
  end
  object gridEntregados: TDBGrid
    Left = 8
    Top = 83
    Width = 528
    Height = 211
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DSEntregados
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Tipo'
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Sucursal'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IMEI'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ICCID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Empleado'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Fecha entrega'
        Width = 84
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 176
    Top = 52
    Width = 75
    Height = 25
    Caption = 'Ver todos'
    TabOrder = 1
    OnClick = Button1Click
  end
  object CBTipo: TComboBox
    Left = 8
    Top = 56
    Width = 105
    Height = 21
    TabOrder = 2
    OnChange = CBTipoChange
    Items.Strings = (
      'Garantia'
      'Reparacion')
  end
  object DateTimePicker1: TDateTimePicker
    Left = 366
    Top = 56
    Width = 83
    Height = 21
    Date = 41765.884721701390000000
    Time = 41765.884721701390000000
    TabOrder = 3
  end
  object todos: TCheckBox
    Left = 288
    Top = 8
    Width = 193
    Height = 17
    Caption = 'Ver equipos de todas las sucursales'
    TabOrder = 4
    OnClick = todosClick
  end
  object ZQEntregados: TZQuery
    Connection = FPrincipalAdmin.ZConexion
    Params = <>
    Left = 504
    Top = 168
  end
  object DSEntregados: TDataSource
    DataSet = ZQEntregados
    Left = 304
    Top = 216
  end
end
