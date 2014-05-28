unit FR_VentaDiario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, QRCtrls, QRPDFFilt, qrpctrls, grimgctrl, ToolWin, ActnMan,
  ActnCtrls, ActnMenus, Menus, pngimage, uCore;

type
  TFRVentaDiario = class(TForm)
    _ZQVentas: TZQuery;
    QRPDFFilter1: TQRPDFFilter;
    _ZQVentasFechadeventa: TDateField;
    _ZQVentasMarca: TWideStringField;
    _ZQVentasModelo: TWideStringField;
    _ZQVentasempleado: TWideStringField;
    _ZQVentasprecio: TLargeintField;
    _ZQVentasICCID: TWideStringField;
    _ZQVentassucursal: TWideStringField;
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRPLabel3: TQRPLabel;
    ChildBand1: TQRChildBand;
    QRBand3: TQRBand;
    QRBand4: TQRBand;
    QRLVentasTitulo: TQRPLabel;
    QRPIE: TQRLabel;
    ChildBand2: TQRChildBand;
    QRShape1: TQRShape;
    QRPLabel1: TQRPLabel;
    QRLSucursal: TQRPLabel;
    QRDBMarca: TQRDBText;
    QRPLabel2: TQRPLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLTotal: TQRLabel;
    QRPLabel4: TQRPLabel;
    QREmpleado: TQRPLabel;
    QRLabel3: TQRLabel;
    QRDBModelo: TQRDBText;
    QRDBFecha: TQRDBText;
    QRDBPrecio: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBEmpleado: TQRDBText;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRVentaDiario: TFRVentaDiario;

implementation
uses
  FPrincipalEmpleados,FAlmacen_Local;

{$R *.dfm}

procedure TFRVentaDiario.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var
  total, empleado : String;
begin
    //agregar codigo
    QuickRep1.ReportTitle := 'Ventas_'+getSucursal+'_'+cleanSlashes(Date);
    QRLVentastitulo.Caption := 'Ventas registradas del día '+DateToStr(Date);

    empleado := FPrincipal.Label2.Caption;
    QREmpleado.Caption := empleado;
    QRPie.Caption := 'Reporte generado el día '+DateToStr(Date)+' a las '+TimetoStr(Time());

    showmessage('zczczx');
    _ZQVentas.Close;
    _ZQVentas.SQL.Clear;
    _ZQVentas.SQL.Add('SELECT SUM(precio) AS total');
    _ZQVentas.SQL.Add('FROM venta_detalle');
    _ZQVentas.SQL.Add('WHERE sucursal=:suc AND fecha_venta=:venta');
    _ZQVentas.ParamByName('suc').Value := getSucursal();
    _ZQVentas.ParamByName('venta').Value := DateToStr(Date());
    _ZQVentas.ExecSQL;
    _ZQVentas.Open;

    total := _ZQVentas.FieldByName('Total').AsString;
    QRLTotal.Caption := '$'+total;
    QRLSucursal.Caption := getSucursal();

    _ZQVentas.Close();
    _ZQVentas.SQL.Clear();
    _ZQVentas.SQL.Add('SELECT fecha_venta, marca_celular, modelo_celular, precio, empleado');
    _ZQVentas.SQL.Add('FROM venta_detalle');
    _ZQVentas.SQL.Add('WHERE sucursal=:_sucursal');
    _ZQVentas.SQL.Add('AND fecha_venta=:_fv');
    _ZQVentas.ParamByName('_sucursal').Value := getSucursal();
    _ZQVentas.ParamByName('_fv').Value := DateToStr(DAte);
    _ZQVentas.ExecSQL();
    _ZQVentas.Open();

    QRDBFecha.DataSet := _ZQVentas;
    QRDBFecha.DataField := 'fecha_venta';
    QRDBMarca.DataSet := _ZQVentas;
    QRDBMarca.DataField := 'marca_celular';
    QRDBModelo.DataSet := _ZQVentas;
    QRDBModelo.DataField := 'modelo_celular';
    QRDBPrecio.DataSet := _ZQVentas;
    QRDBPrecio.DataField := 'precio';
    QRDBEmpleado.DataSet := _ZQVentas;
    QRDBEmpleado.DataField := 'empleado';
end;

end.
