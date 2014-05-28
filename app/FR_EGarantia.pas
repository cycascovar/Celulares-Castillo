unit FR_EGarantia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, qrpctrls, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, uCore;

type
  TFREGarantia = class(TForm)
    QRGarantia: TQuickRep;
    QRBand1: TQRBand;
    ChildBand1: TQRChildBand;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    ChildBand2: TQRChildBand;
    QRPLabel3: TQRPLabel;
    QRPLabel4: TQRPLabel;
    QRPLabel1: TQRPLabel;
    QRLSucursal: TQRPLabel;
    ZQGarantia: TZQuery;
    ChildBand3: TQRChildBand;
    QRShape1: TQRShape;
    QRPIE: TQRLabel;
    QRLabel1: TQRLabel;
    QRDBMarca: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBModelo: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBIccid: TQRDBText;
    QRDBImei: TQRDBText;
    QRDBFecha: TQRDBText;
    QRDBTitular: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    procedure QRGarantiaBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FREGarantia: TFREGarantia;

implementation
uses FGarantia, FPrincipalEmpleados;

{$R *.dfm}

procedure TFREGarantia.QRGarantiaBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var
  fecha : TDate;
begin
    fecha := FGarantias.fecharecibido.Date;    
    QRLSucursal.Caption := getSucursal();
    QRGarantia.ReportTitle := 'Almacen '+getSucursal()+' '+cleanSlashes(Date);

    if FGarantias.cargaTodos = false then {si no se cargan todos}
    begin
      with ZQGarantia do
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT Marca, Modelo, IMEI, ICCID, Titular, telefono_contacto AS "Telefono", fecha');
        SQL.Add('FROM v_equipos_garantia WHERE idsucursal=:sucursal');
        ParamByName('sucursal').Value := IntToStr(FPrincipal.idSucursal);
        ExecSQL;
        Open;
      end;
    end
    else 
    begin {carga todos los equipos de garantia en la sucursal}
      with ZQGarantia do
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT Marca, Modelo, IMEI, ICCID, Titular, telefono_contacto AS "Telefono de contacto", fecha AS "Fecha recibido"');
        SQL.Add('FROM v_equipos_garantia WHERE idsucursal=:sucursal AND fecha=:_fecha');
        ParamByName('sucursal').Value := IntToStr(FPrincipal.idSucursal);        
        ParamByName('_fecha').Value := DateToStr(fecha);
        ExecSQL;
        Open;
      end;
    end;

    QRDBMarca.DataSet := ZQGarantia; QRDBMarca.DataField := 'Marca';
    QRDBModelo.DataSet := ZQGarantia; QRDBModelo.DataField := 'Modelo';
    QRDBImei.DataSet := ZQGarantia; QRDBImei.DataField := 'IMEI';
    QRDBTitular.DataSet := ZQGarantia; QRDBTitular.DataField := 'Titular';
    QRDBIccid.DataSet := ZQGarantia; QRDBIccid.DataField := 'ICCID';
    QRDBFecha.DataSet := ZQGarantia; QRDBFecha.DataField := 'Fecha';

    QRPie.Caption := 'Reporte generado el día '+DateToStr(Date)+' a las '+TimetoStr(Time());
end;

end.
