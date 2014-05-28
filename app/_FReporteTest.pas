unit _FReporteTest;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, uCore, qrpctrls, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset;

type
  T__FReporteTest = class(TForm)
    ReportePrueba: TQuickRep;
    QRBand1: TQRBand;
    ChildBand1: TQRChildBand;
    QRBand2: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRPBand2: TQRPBand;
    QRPLabel2: TQRPLabel;
    QRGridReport1: TQRGridReport;
    QRCodigo: TQRDBText;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    ZQReporte: TZQuery;
    QRDBUsuario: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    procedure ReportePruebaBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  __FReporteTest: T__FReporteTest;

implementation
uses  F_Usuarios, FRecargas, FPrincipalEmpleados;

{$R *.dfm}

procedure T__FReporteTest.ReportePruebaBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin

  ZQReporte.Close;
  ZQReporte.SQL.Clear;
  ZQReporte.SQL.Add('SELECT movimiento, empleado FROM empleado_movimiento');
  ZQReporte.ExecSQL;
  ZQReporte.Open;

  QRCodigo.DataSet := ZQReporte;
  QRDBUsuario.DataSet := ZQReporte;

  QRCodigo.DataField := 'Movimiento';
  QRDBUsuario.DataField := 'Empleado';

  QRLabel5.Caption := 'Reporte generado el día '+DateToStr(Date())+' a las '+TimeToStr(Time());
end;

end.
