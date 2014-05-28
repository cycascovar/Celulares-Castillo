object FCEQuiposGarantia: TFCEQuiposGarantia
  Left = 0
  Top = 0
  Caption = 'FCEQuiposGarantia'
  ClientHeight = 500
  ClientWidth = 934
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
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 236
    Height = 13
    Caption = 'Cat'#225'logo de equipos celulares en garant'#237'a'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object gridEGarantia: TDBGrid
    Left = 8
    Top = 72
    Width = 905
    Height = 289
    DataSource = DSEGarantia
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Button1: TButton
    Left = 424
    Top = 41
    Width = 75
    Height = 25
    Caption = 'Cargar'
    TabOrder = 1
  end
  object cbtodos: TCheckBox
    Left = 424
    Top = 18
    Width = 97
    Height = 17
    Caption = 'Cargar todos'
    TabOrder = 2
  end
  object ZQEGarantia: TZQuery
    Connection = FMain.ZConexion
    Params = <>
    Left = 592
    Top = 288
  end
  object DSEGarantia: TDataSource
    DataSet = ZQEGarantia
    Left = 704
    Top = 184
  end
end
