unit CClientesReparacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCore, StdCtrls, Grids, DBGrids, ComCtrls, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset;

type
  TC_ClientesReparacion = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    gridCReparaciones: TDBGrid;
    todos: TCheckBox;
    Edit1: TEdit;
    Edit2: TEdit;
    ProgressBar1: TProgressBar;
    Button1: TButton;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    txttitular: TEdit;
    txttelefonocontacto: TEdit;
    txtsucursal: TEdit;
    txtimei: TEdit;
    txtmarca: TEdit;
    txtmodelo: TEdit;
    txtobservaciones: TMemo;
    ZQCReparacion: TZQuery;
    DSCReparacion: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure todosClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure gridCReparacionesCellClick(Column: TColumn);
    procedure gridCReparacionesKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure loadClients();overload;
    procedure loadClients(Sucursal : String); overload;
  public
    { Public declarations }
  end;

var
  C_ClientesReparacion: TC_ClientesReparacion;

implementation
uses
  F_PrincipalAdmin;

{$R *.dfm}

procedure TC_ClientesReparacion.Button1Click(Sender: TObject);
begin
  if todos.Checked = true then
      loadClients()
  else
    loadClients(getSucursal);
end;

procedure TC_ClientesReparacion.todosClick(Sender: TObject);
begin
  if todos.Checked = true then
    ShowMessage('Esto hara que el sistema cargue todos los clientes. '+#13+'Para hacer esto correctamente se recomienda una conexión a Internet.');
end;

procedure TC_ClientesReparacion.FormCreate(Sender: TObject);
begin
  setTitleWindow(self,'Catálogo de clientes de reparación - Sistema para administradores ');
end;

procedure TC_ClientesReparacion.FormShow(Sender: TObject);
begin
  Label10.Caption := getSucursal();
  loadClients(getSucursal); //carga los equipos celulares de la sucursal local
end;

procedure TC_ClientesReparacion.gridCReparacionesCellClick(Column: TColumn);
begin
  // Sucursal, titular, Telefono de contacto, marca, modelo, imei, observaciones
  txtObservaciones.Lines.Clear;

  txtSucursal.Text := gridCReparaciones.Fields[0].AsString;
  txtTitular.Text := gridCReparaciones.Fields[1].AsString;
  txtTelefonoContacto.Text := gridCReparaciones.Fields[2].AsString;
  txtMarca.Text := gridCReparaciones.Fields[3].AsString;
  txtModelo.Text := gridCReparaciones.Fields[4].AsString;
  txtImei.Text := gridCReparaciones.Fields[5].AsString;
  txtObservaciones.Lines.Add(gridCReparaciones.Fields[6].AsString);
end;

procedure TC_ClientesReparacion.gridCReparacionesKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_UP) or (Key = VK_DOWN) or (Key = VK_LEFT) or (Key = VK_RIGHT) or (Key = VK_MBUTTON) then
  begin
    txtObservaciones.Lines.Clear;

    txtSucursal.Text := gridCReparaciones.Fields[0].AsString;
    txtTitular.Text := gridCReparaciones.Fields[1].AsString;
    txtTelefonoContacto.Text := gridCReparaciones.Fields[2].AsString;
    txtMarca.Text := gridCReparaciones.Fields[3].AsString;
    txtModelo.Text := gridCReparaciones.Fields[4].AsString;
    txtImei.Text := gridCReparaciones.Fields[5].AsString;
    txtObservaciones.Lines.Add(gridCReparaciones.Fields[6].AsString);
  end;
end;

procedure TC_ClientesReparacion.loadClients;
begin
    ZQCReparacion.Close;
    ZQCReparacion.SQL.Clear;
    ZQCReparacion.SQL.Add('SELECT sucursal, nombre_cliente AS titular, telefono_contacto AS "Telefono de contacto", marca_equipo AS Marca, modelo_equipo AS Modelo, imei_equipo AS IMEI, observaciones');
    ZQCReparacion.SQL.Add('FROM c_clientes_reparacion');
    ZQCReparacion.ExecSQL;
    ZQCReparacion.Open;

    gridCReparaciones.Update;
end;

procedure TC_ClientesReparacion.loadClients(Sucursal: String);
begin
    ZQCReparacion.Close;
    ZQCReparacion.SQL.Clear;
    ZQCReparacion.SQL.Add('SELECT sucursal, nombre_cliente AS titular, telefono_contacto AS "Telefono de contacto", marca_equipo AS Marca, modelo_equipo AS Modelo, imei_equipo AS IMEI, observaciones');
    ZQCReparacion.SQL.Add('FROM c_clientes_reparacion');
    ZQCReparacion.SQL.Add('WHERE sucursal = "'+Sucursal+'"');
    ZQCReparacion.ExecSQL;
    ZQCReparacion.Open;

    gridCReparaciones.Update;
end;

end.
