unit FC_EquiposEntregados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DBCtrls, StdCtrls, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, uCore, ComCtrls;

type
  TFCEquiposEntregados = class(TForm)
    gridEntregados: TDBGrid;
    Button1: TButton;
    ZQEntregados: TZQuery;
    DSEntregados: TDataSource;
    CBTipo: TComboBox;
    DateTimePicker1: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    todos: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure CBTipoChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure todosClick(Sender: TObject);
  private
    { Private declarations }
     procedure getAllPhones(); overload;
     procedure getAllPhones(Sucursal : String); overload;
  public
    { Public declarations }
  end;

var
  FCEquiposEntregados: TFCEquiposEntregados;

implementation
uses
    F_PrincipalAdmin,FPrincipalEmpleados;

{$R *.dfm}

procedure TFCEquiposEntregados.Button1Click(Sender: TObject);
begin
  if todos.Checked = true then
    getAllPhones()
  else
    getAllPhones(getSucursal);
end;

procedure TFCEquiposEntregados.CBTipoChange(Sender: TObject);
begin

    ZQEntregados.Filtered := false;
    ZQEntregados.Filter := 'Tipo LIKE'+QuotedStr('*'+CBTipo.Text+'*');
    ZQEntregados.Filtered := true;

    {ZQEntregados.Close;
    ZQEntregados.SQL.Clear;
    ZQEntregados.SQL.Add('SELECT tipo, sucursal, imei_equipo AS IMEI, iccid_equipo AS ICCID, empleado, fecha_entrega AS "Fecha Entrega"');
    ZQEntregados.SQL.Add('FROM equipo_entregado WHERE sucursal = "'+getSucursal()+'"');
    ZQEntregados.SQL.Add('AND tipo = "'+CBTipo.Text+'"');
    ZQEntregados.ExecSQL;
    ZQEntregados.Open;
    gridEntregados.Update;}
end;



procedure TFCEquiposEntregados.FormCreate(Sender: TObject);
begin
    setTitleWindow(self,'Catálogo de equipos entregados - Sistema para administradores');
    label2.Caption := 'Catálogo de equipos celulares entregados en la sucursal '+getSucursal();
end;

procedure TFCEquiposEntregados.FormShow(Sender: TObject);
begin
    gridEntregados.Columns[0].Width := 70;
    gridEntregados.Columns[1].Width := 80;
    gridEntregados.Columns[2].Width := 100;
    gridEntregados.Columns[3].Width := 150;
    gridEntregados.Columns[4].Width := 150;

    getAllPhones(getSucursal);
end;

procedure TFCEquiposEntregados.getAllPhones;
begin
    ZQEntregados.Close;
    ZQEntregados.SQL.Clear;
    ZQEntregados.SQL.Add('SELECT tipo, sucursal, imei_equipo AS IMEI, iccid_equipo AS ICCID, empleado, fecha_entrega AS "Fecha Entrega"');
    ZQEntregados.SQL.Add('FROM equipo_entregado');
    ZQEntregados.ExecSQL;
    ZQEntregados.Open;
    gridEntregados.Update;
end;

procedure TFCEquiposEntregados.getAllPhones(Sucursal: String);
begin
    ZQEntregados.Close;
    ZQEntregados.SQL.Clear;
    ZQEntregados.SQL.Add('SELECT tipo, sucursal, imei_equipo AS IMEI, iccid_equipo AS ICCID, empleado, fecha_entrega AS "Fecha Entrega"');
    ZQEntregados.SQL.Add('FROM equipo_entregado WHERE sucursal = "'+Sucursal+'"');
    ZQEntregados.ExecSQL;
    ZQEntregados.Open;
    gridEntregados.Update;
end;

procedure TFCEquiposEntregados.todosClick(Sender: TObject);
begin
  if (todos.Checked = true) then
    ShowMessage('Para poder cargar todos los equipos en las demas sucursales, '+#13+'se recomienda tener una conexión a Internet.');
end;

end.
