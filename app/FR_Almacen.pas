unit FR_Almacen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, qrpctrls, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, uCore, QRPrntr;

type
  TFRAlmacen = class(TForm)
    QRAlmacen: TQuickRep;
    QRBand1: TQRBand;
    QRPLabel3: TQRPLabel;
    ZQAlmacen: TZQuery;
    QRBand2: TQRBand;
    ChildBand1: TQRChildBand;
    QRBand3: TQRBand;
    QRPLabel4: TQRPLabel;
    QRPLabel1: TQRPLabel;
    QRLSucursal: TQRPLabel;
    QRPIE: TQRLabel;
    ChildBand3: TQRChildBand;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBMarca: TQRDBText;
    QRDBModelo: TQRDBText;
    QRDBICCID: TQRDBText;
    QRDBIMEI: TQRDBText;
    QRDBPrecio: TQRDBText;
    QRBand4: TQRBand;
    QRPLabel6: TQRPLabel;
    QRLTotal: TQRPLabel;
    procedure QRAlmacenPreview(Sender: TObject);
    procedure QRAlmacenBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRAlmacen: TFRAlmacen;

implementation
uses
    FPrincipalEmpleados,FAlmacen_Local;

{$R *.dfm}

procedure TFRAlmacen.QRAlmacenBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
    QRAlmacen.ReportTitle := 'Almacen '+getSucursal()+' '+cleanSlashes(Date);
    QRLSucursal.Caption := getSucursal();

    ZQAlmacen.Close;
    ZQAlmacen.SQL.Clear;
    ZQAlmacen.SQL.Add('SELECT marca_celular Marca, modelo_celular Modelo, imei_celular IMEI, iccid_celular ICCID, precioCelular Precio FROM equipo_almacen JOIN sucursal ON equipo_almacen.idsucursal = sucursal.idsucursal AND equipo_almacen.idsucursal=:sucursal');
    ZQAlmacen.ParamByName('sucursal').Value := IntToStr(FPrincipal.idSucursal);
    ZQAlmacen.ExecSQL;
    ZQAlmacen.Open;

    QRDBModelo.DataSet := ZQAlmacen;
    QRDBModelo.DataField := 'modelo';

    QRDBMarca.DataSet := ZQAlmacen;
    QRDBMarca.DataField := 'marca';
    QRDBImei.DataSet := ZQAlmacen;
    QRDBImei.DataField := 'imei';
    QRDBIccid.DataSet := ZQAlmacen;
    QRDBIccid.DataField := 'iccid';
    QRDBPrecio.DataSet := ZQAlmacen;
    QRDBPrecio.DataField := 'precio';
    QRPIE.Caption := 'Reporte generado el día '+DateToStr(Date)+' a las '+TimeToStr(Time());
    QRLTotal.Caption := FAlmacenLocal.totalequipos.Caption;
end;

procedure TFRAlmacen.QRAlmacenPreview(Sender: TObject);
begin
{   QRAlmacen.Prepare;}
    //QRPaginas.Caption := 'Pagina '+IntToStr(QRAlmacen.QRPrinter.PageNumber)+' de '+IntToStr(QRAlmacen.QRPrinter.PageCount);
{    QRAlmacen.Print;}
    QRAlmacen.ReportTitle := 'Almacen '+getSucursal()+' '+cleanSlashes(Date);
    QRLSucursal.Caption := getSucursal();

    ZQAlmacen.Close;
    ZQAlmacen.SQL.Clear;
    ZQAlmacen.SQL.Add('SELECT marca_celular Marca, modelo_celular Modelo, imei_celular IMEI, iccid_celular ICCID, precioCelular Precio FROM equipo_almacen JOIN sucursal ON equipo_almacen.idsucursal = sucursal.idsucursal AND equipo_almacen.idsucursal=:sucursal');
    ZQAlmacen.ParamByName('sucursal').Value := IntToStr(FPrincipal.idSucursal);
    ZQAlmacen.ExecSQL;
    ZQAlmacen.Open;

    QRDBModelo.DataSet := ZQAlmacen;
    QRDBModelo.DataField := 'modelo';

    QRDBMarca.DataSet := ZQAlmacen;
    QRDBMarca.DataField := 'marca';
    QRDBImei.DataSet := ZQAlmacen;
    QRDBImei.DataField := 'imei';
    QRDBIccid.DataSet := ZQAlmacen;
    QRDBIccid.DataField := 'iccid';
    QRDBPrecio.DataSet := ZQAlmacen;
    QRDBPrecio.DataField := 'precio';
    QRPIE.Caption := 'Reporte generado el día '+DateToStr(Date)+' a las '+TimeToStr(Time());
    QRLTotal.Caption := IntToStr(FAlmacenLocal.totalInventario(FAlmacenLocal.ZQAlmacen));
end;

end.
