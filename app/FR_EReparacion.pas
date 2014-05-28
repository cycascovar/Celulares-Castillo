unit FR_EReparacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, QuickRpt, ExtCtrls, QRCtrls, qrpctrls, pngimage, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset,uCore;

type
  TFREReparacion = class(TForm)
    QRReparacion: TQuickRep;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRBand3: TQRBand;
    ZQEReparacion: TZQuery;
    QRLFoot: TQRLabel;
    QRLSuc: TQRLabel;
    QRShape1: TQRShape;
    QRBand4: TQRBand;
    QRDBMArca: TQRDBText;
    QRDBModelo: TQRDBText;
    QRDBImei: TQRDBText;
    QRDBTitular: TQRDBText;
    QRDBContacto: TQRDBText;
    QRShape2: TQRShape;
    QRPage: TQRLabel;
    QRShape3: TQRShape;
    procedure QRReparacionBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    pageCount : Integer; {Global variable}
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FREReparacion: TFREReparacion;

implementation
uses
    FPrincipalEmpleados;

{$R *.dfm}

procedure TFREReparacion.QRReparacionBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
    with ZQEReparacion do
    begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT marca_equipo AS Marca, modelo_equipo AS Modelo, imei_equipo AS IMEI, nombre_cliente as Titular, telefono_contacto AS "Telefono titular", fecha AS "Fecha Recibido"');
        SQL.Add('FROM equipo_reparacion JOIN cliente_reparacion ON equipo_reparacion.idequipo_reparacion = cliente_reparacion.idequipo_reparacion JOIN sucursal ON sucursal.idsucursal = equipo_reparacion.idsucursal AND equipo_reparacion.idsucursal=:sucursal');
        ParamByName('sucursal').Value := IntToStr(FPrincipal.idSucursal);
        ExecSQL;
        Open;
    end;

    QRDBMarca.DataSet := ZQEReparacion;QRDBModelo.DataSet := ZQEReparacion;QRDBImei.DataSet := ZQEReparacion;QRDBTitular.DataSet := ZQEReparacion;QRDBContacto.DataSet := ZQEReparacion;
    QRDBMarca.DataField := 'Marca';QRDBModelo.DataField := 'Modelo';QRDBImei.DataField := 'IMEI';QRDBTitular.DataField := 'Titular';QRDBContacto.DataField := 'Telefono titular';

    QRLSuc.Font.Style := [fsBold];
    QRLSuc.Caption := 'Sucursal: '+getSucursal;
    QRLFoot.Caption := 'Reporte generado por '+FPrincipal.Label2.Caption+' el día '+DateToStr(Date())+' a las '+TimeToStr(Time());
    QRPage.Caption := '';
end;

end.
