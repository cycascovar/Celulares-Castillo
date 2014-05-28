object FUsuarios: TFUsuarios
  Left = 0
  Top = 0
  VertScrollBar.Visible = False
  Caption = 'Sistema para administradores: Control de usuarios y movimientos'
  ClientHeight = 383
  ClientWidth = 762
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = t
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 182
    Width = 37
    Height = 13
    Align = alCustom
    Anchors = [akLeft, akBottom]
    Caption = 'Nombre'
    ExplicitTop = 167
  end
  object Label2: TLabel
    Left = 8
    Top = 283
    Width = 40
    Height = 13
    Align = alCustom
    Anchors = [akLeft, akBottom]
    Caption = 'Sucursal'
    ExplicitTop = 264
  end
  object Label3: TLabel
    Left = 8
    Top = 207
    Width = 46
    Height = 13
    Align = alCustom
    Anchors = [akLeft, akBottom]
    Caption = 'Password'
    ExplicitTop = 204
  end
  object Label4: TLabel
    Left = 8
    Top = 236
    Width = 37
    Height = 13
    Align = alCustom
    Anchors = [akLeft, akBottom]
    Caption = 'Puesto:'
    ExplicitTop = 220
  end
  object nombreEmpleado: TEdit
    Left = 72
    Top = 181
    Width = 137
    Height = 21
    Align = alCustom
    Anchors = [akLeft, akBottom]
    BorderStyle = bsNone
    TabOrder = 0
  end
  object PasswordEmpleado: TEdit
    Left = 73
    Top = 207
    Width = 137
    Height = 21
    Align = alCustom
    Anchors = [akLeft, akBottom]
    BorderStyle = bsNone
    PasswordChar = '*'
    TabOrder = 1
  end
  object Button1: TButton
    Left = 67
    Top = 347
    Width = 105
    Height = 25
    Align = alCustom
    Anchors = []
    Caption = 'Agregar usuario'
    TabOrder = 2
    OnClick = Button1Click
  end
  object listaSucursales: TDBLookupComboBox
    Left = 73
    Top = 282
    Width = 137
    Height = 21
    Align = alCustom
    Anchors = [akLeft, akBottom]
    ListSource = DSSucursal
    TabOrder = 3
  end
  object DBGrid1: TDBGrid
    Left = -3
    Top = 1
    Width = 275
    Height = 156
    Align = alCustom
    Anchors = [akLeft, akTop, akBottom]
    BorderStyle = bsNone
    DataSource = DSEmpleados
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
    OnKeyUp = DBGrid1KeyUp
    Columns = <
      item
        Expanded = False
        FieldName = 'Usuario'
        Width = 51
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Sucursal'
        Width = 76
        Visible = True
      end>
  end
  object GroupBox1: TGroupBox
    Left = 275
    Top = 0
    Width = 487
    Height = 383
    Align = alRight
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = 'Movimientos del empleado'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    DesignSize = (
      487
      383)
    object Empleado: TLabel
      Left = 18
      Top = 19
      Width = 58
      Height = 13
      Caption = 'Empleado:'
    end
    object usuario: TLabel
      Left = 82
      Top = 19
      Width = 35
      Height = 13
      Caption = 'usuario'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Button2: TButton
      Left = 18
      Top = 275
      Width = 185
      Height = 25
      Align = alCustom
      Anchors = [akLeft, akBottom]
      Caption = 'Guardar movimientos (texto)'
      TabOrder = 0
      OnClick = Button2Click
    end
    object Memo1: TMemo
      Left = 16
      Top = 69
      Width = 458
      Height = 200
      Align = alCustom
      Anchors = [akLeft, akTop, akRight, akBottom]
      BorderStyle = bsNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      ScrollBars = ssBoth
      TabOrder = 1
    end
    object Button3: TButton
      Left = 16
      Top = 38
      Width = 121
      Height = 25
      Caption = 'Ver movimientos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = Button3Click
    end
    object vertodos: TCheckBox
      Left = 175
      Top = 18
      Width = 306
      Height = 17
      Caption = 'ver movimientos de todos los empleados'
      TabOrder = 3
    end
    object Button4: TButton
      Left = 217
      Top = 274
      Width = 143
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = 'Guardar como PDF'
      TabOrder = 4
      OnClick = Button4Click
    end
  end
  object listaPuestos: TDBLookupComboBox
    Left = 73
    Top = 236
    Width = 137
    Height = 21
    Align = alCustom
    Anchors = [akLeft, akBottom]
    TabOrder = 6
  end
  object barra: TProgressBar
    Left = 291
    Top = 168
    Width = 458
    Height = 16
    Align = alCustom
    Anchors = [akLeft, akRight]
    TabOrder = 7
  end
  object DSEmpleados: TDataSource
    DataSet = ZQEmpleados
    Left = 168
    Top = 80
  end
  object ZQEmpleados: TZQuery
    Connection = FPrincipalAdmin.ZConexion
    Params = <>
    Left = 168
    Top = 32
  end
  object DSSucursal: TDataSource
    DataSet = ZQSucursal
    Left = 192
    Top = 280
  end
  object ZQSucursal: TZQuery
    Connection = FPrincipalAdmin.ZConexion
    Params = <>
    Left = 48
    Top = 320
  end
end
