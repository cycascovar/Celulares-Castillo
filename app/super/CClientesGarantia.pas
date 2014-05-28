unit CClientesGarantia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids,ZDataset,ZAbstractDataset,ZAbstractConnection,
  DB, ZAbstractRODataset, ZConnection, ComCtrls, pngimage, ExtCtrls, DBCtrls, uCore;

type
  TC_ClientesGarantia = class(TForm)
    DBCGarantias: TDBGrid;
    txtsucursalf: TEdit;
    Label1: TLabel;
    Button1: TButton;
    Label2: TLabel;
    sucursal: TLabel;
    ProgressBar1: TProgressBar;
    todos: TCheckBox;
    txttitularf: TEdit;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    txtcliente: TEdit;
    txttelefono: TEdit;
    txtsuc: TEdit;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    txtimei: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    txtaccesorios: TMemo;
    txticcid: TEdit;
    txtobservaciones: TMemo;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBCGarantiasCellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  C_ClientesGarantia: TC_ClientesGarantia;

implementation
uses
    F_PrincipalAdmin,FPrincipalEmpleados;

{$R *.dfm}

procedure TC_ClientesGarantia.Button1Click(Sender: TObject);
var
    ZQGarantia : TZQuery;
    DSGarantia : TDataSource;
begin
    ZQGarantia := TZQuery.Create(self);
    ZQGarantia.Connection := FPrincipalAdmin.ZConexion;

    DSGarantia := TDataSource.Create(self);
    DBCGarantias.DataSource := DSGarantia;
    DSGarantia.DataSet := ZQGarantia;

    if todos.Checked = true then
    begin
    try
        progressBar1.Visible := true;
        ZQGarantia.Close;
        ZQGarantia.SQL.Clear;
        ZQGarantia.SQL.Add('SELECT sucursal, titular,telefono_contacto as telefono, IMEI, ICCID,observaciones,accesorios');
        ZQGarantia.SQL.Add('FROM v_equipos_garantia');
//        ZQGarantia.SQL.Add('WHERE sucursal = "'+FPrincipal.sucursal+'"');
        ZQGarantia.ExecSQL;
        ZQGarantia.Open;
        progressBar1.Max := ZQGarantia.RecordCount;
        DBCGarantias.Update;

        with ZQGarantia do
        begin
            First();
        while not EOF do
        begin
            progressBar1.StepIt;
            Next;
        end;
    end;
    finally
        progressBar1.Visible := false;
    end;
    end else
    if todos.Checked = false then
    begin
    try
        progressBar1.Visible := true;
        ZQGarantia.Close;
        ZQGarantia.SQL.Clear;
        ZQGarantia.SQL.Add('SELECT sucursal, titular,telefono_contacto as telefono, IMEI, ICCID,observaciones,accesorios');
        ZQGarantia.SQL.Add('FROM v_equipos_garantia');
        ZQGarantia.SQL.Add('WHERE sucursal = "'+getSucursal()+'"');
        ZQGarantia.ExecSQL;
        ZQGarantia.Open;
        progressBar1.Max := ZQGarantia.RecordCount;
        DBCGarantias.Update;

        with ZQGarantia do
        begin
            First();
        while not EOF do
        begin
            progressBar1.StepIt;
            Next;
        end;
        end;
    finally
        progressBar1.Visible := false;
    end;
    end;
end;

procedure TC_ClientesGarantia.DBCGarantiasCellClick(Column: TColumn);
begin
    txtobservaciones.Clear;
    txtaccesorios.Clear;
    // sucursal, titular, telefono de contacto,
    // imei, iccid, observaciones, accesorios,
    txtsuc.Text := DBCGarantias.Fields[0].AsString;
    txtcliente.Text := DBCGarantias.Fields[1].AsString;
    txttelefono.Text := DBCGarantias.Fields[2].AsString;
    txticcid.Text := DBCGarantias.Fields[4].AsString;
    txtobservaciones.Lines.Add(DBCGarantias.Fields[5].AsString);
    txtaccesorios.Lines.Add(DBCGarantias.Fields[6].AsString);


end;

procedure TC_ClientesGarantia.FormCreate(Sender: TObject);
begin
  setTitlewindow(self, 'Catálogo de clientes de garantía - Sistema para administradores.');
end;

procedure TC_ClientesGarantia.FormShow(Sender: TObject);
var
    ZQGarantia : TZQuery;
    DSGarantia : TDataSource;
begin
    progressBar1.Visible := false;
    progressBar1.Min := 0;
    progressBar1.Step := 1;

    sucursal.Caption := FPrincipal.sucursal;
    ZQGarantia := TZQuery.Create(self);
    ZQGarantia.Connection := FPrincipalAdmin.ZConexion;

    DSGarantia := TDataSource.Create(self);
    DBCGarantias.DataSource := DSGarantia;
    DSGarantia.DataSet := ZQGarantia;

    ZQGarantia.Close;
    ZQGarantia.SQL.Clear;
    ZQGarantia.SQL.Add('SELECT sucursal, titular,telefono_contacto as Telefono, IMEI,ICCID,observaciones,accesorios');
    ZQGarantia.SQL.Add('FROM v_equipos_garantia');
    ZQGarantia.SQL.Add('WHERE sucursal = "'+getSucursal+'"');
    ZQGarantia.ExecSQL;
    ZQGarantia.Open;

    DBCGarantias.Update;
end;

end.
