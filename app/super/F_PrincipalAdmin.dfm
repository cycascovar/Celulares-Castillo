object FPrincipalAdmin: TFPrincipalAdmin
  Left = 0
  Top = 0
  Caption = 'Sistema para administradores: Res'#250'men general'
  ClientHeight = 522
  ClientWidth = 875
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    875
    522)
  PixelsPerInch = 96
  TextHeight = 13
  object Garantias: TPageControl
    Left = 5
    Top = 8
    Width = 862
    Height = 513
    ActivePage = TabSheet1
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    ExplicitWidth = 857
    object TabSheet1: TTabSheet
      Caption = 'Garantias'
      ExplicitWidth = 849
      DesignSize = (
        854
        485)
      object dbgrid1: TDBGrid
        Left = 0
        Top = 27
        Width = 775
        Height = 300
        Anchors = [akLeft, akTop, akRight]
        DataSource = DSGarantias
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'Sucursal'
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Recibido por'
            Width = 69
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Marca'
            Width = 113
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Modelo'
            Width = 96
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IMEI'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Titular'
            Width = 46
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Observaciones'
            Width = 154
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Fecha'
            Visible = True
          end>
      end
      object botonclientesgtia: TBitBtn
        Left = 0
        Top = 333
        Width = 97
        Height = 34
        Caption = 'Ver clientes'
        DoubleBuffered = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentDoubleBuffered = False
        ParentFont = False
        TabOrder = 1
      end
      object Button1: TButton
        Left = 633
        Top = 333
        Width = 142
        Height = 34
        Anchors = [akTop, akRight]
        Caption = 'Equipos entregados'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        ExplicitLeft = 628
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Reparaciones'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 853
      ExplicitHeight = 745
      DesignSize = (
        854
        485)
      object gridreparaciones: TDBGrid
        Left = 3
        Top = 24
        Width = 778
        Height = 278
        Anchors = [akLeft, akTop, akRight]
        DataSource = DSReparaciones
        TabOrder = 0
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
            FieldName = 'Recibido por'
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
            FieldName = 'Titular'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Observaciones'
            Width = 115
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Fecha'
            Visible = True
          end>
      end
      object BitBtn2: TBitBtn
        Left = 0
        Top = 308
        Width = 97
        Height = 34
        Caption = 'Ver clientes'
        DoubleBuffered = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentDoubleBuffered = False
        ParentFont = False
        TabOrder = 1
      end
      object Button2: TButton
        Left = 636
        Top = 308
        Width = 145
        Height = 34
        Anchors = [akTop, akRight]
        Caption = 'Equipos entregados'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        ExplicitLeft = 631
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Ventas'
      ImageIndex = 2
      ExplicitLeft = -132
      ExplicitTop = 48
      ExplicitWidth = 0
      ExplicitHeight = 499
      DesignSize = (
        854
        485)
      object Label1: TLabel
        Left = 3
        Top = 3
        Width = 126
        Height = 13
        Caption = 'Estadisticas de ventas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object botonclientes: TBitBtn
        Left = 220
        Top = 295
        Width = 75
        Height = 41
        Anchors = [akTop, akRight]
        Caption = 'Ver clientes'
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 0
        OnClick = botonclientesClick
        ExplicitLeft = 219
      end
      object gridVentas: TDBGrid
        Left = 3
        Top = 46
        Width = 799
        Height = 413
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDrawColumnCell = gridVentasDrawColumnCell
        Columns = <
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
            FieldName = 'Precio'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Total'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Sucursal'
            Visible = True
          end>
      end
      object todos: TCheckBox
        Left = 221
        Top = 23
        Width = 196
        Height = 17
        Caption = 'Ver datos de todas las sucursales'
        TabOrder = 2
        OnClick = todosClick
      end
      object Button4: TButton
        Left = 423
        Top = 15
        Width = 90
        Height = 25
        Caption = 'Cargar ventas'
        TabOrder = 3
        OnClick = Button4Click
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Almacenes'
      ImageIndex = 3
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 853
      ExplicitHeight = 745
      DesignSize = (
        854
        485)
      object Label4: TLabel
        Left = 3
        Top = 3
        Width = 115
        Height = 13
        Caption = 'Equipos por sucursal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object BitBtn1: TBitBtn
        Left = 478
        Top = 201
        Width = 75
        Height = 25
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 0
      end
      object gridequipos: TDBGrid
        Left = 3
        Top = 36
        Width = 848
        Height = 379
        Align = alCustom
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
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
            FieldName = 'ICCID'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Precio'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Numero'
            Visible = True
          end>
      end
      object Button3: TButton
        Left = 3
        Top = 423
        Width = 105
        Height = 41
        Anchors = [akLeft]
        Caption = 'Agregar equipo'
        TabOrder = 2
        OnClick = Button3Click
        ExplicitTop = 435
      end
    end
  end
  object ZQGarantias: TZQuery
    Connection = ZConexion
    Params = <>
    Left = 112
    Top = 256
  end
  object DSGarantias: TDataSource
    DataSet = ZQGarantias
    Left = 144
    Top = 208
  end
  object ZConexion: TZConnection
    Protocol = 'mysql-5'
    Left = 496
    Top = 336
  end
  object ZQReparaciones: TZQuery
    Connection = ZConexion
    Params = <>
    Left = 672
    Top = 192
  end
  object DSReparaciones: TDataSource
    DataSet = ZQReparaciones
    Left = 720
    Top = 256
  end
end
