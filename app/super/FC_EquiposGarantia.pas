unit FC_EquiposGarantia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCore, StdCtrls, ExtCtrls, Grids, DBGrids, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset;

type
  TFCEQuiposGarantia = class(TForm)
    Label1: TLabel;
    gridEGarantia: TDBGrid;
    ZQEGarantia: TZQuery;
    DSEGarantia: TDataSource;
    Button1: TButton;
    cbtodos: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCEQuiposGarantia: TFCEQuiposGarantia;

implementation
uses F_Main;
{$R *.dfm}

procedure TFCEQuiposGarantia.FormCreate(Sender: TObject);
begin
  SetTitleWindow(self, 'Cat�logo de equipos celulares en garant�a - Sistema para administradores');
end;

procedure TFCEQuiposGarantia.FormShow(Sender: TObject);
begin

  ZQEGarantia.Close;
  ZQEGarantia.SQL.Clear;
  ZQEgarantia.SQL.Add('SELECT Marca, Modelo, IMEI, ICCID, Accesorios, Observaciones, Titular, Sucursal');
  ZQEGarantia.SQL.Add('FROM v_equipos_garantia WHERE sucursal = "'+getSucursal()+'"');
  ZQEGarantia.ExecSQL;
  ZQEGarantia.Open;

  gridEGarantia.Columns[0].Width := 70;
  gridEGarantia.Columns[1].Width := 80;
  gridEGarantia.Columns[2].Width := 80;
  gridEGarantia.Columns[3].Width := 80;
  gridEGarantia.Columns[4].Width := 100;
  gridEGarantia.Columns[5].Width := 80;
  gridEGarantia.Columns[6].Width := 100;

  gridEGarantia.Update;
end;

end.
