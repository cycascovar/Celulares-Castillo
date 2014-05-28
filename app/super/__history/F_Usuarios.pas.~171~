unit F_Usuarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  Grids, DBGrids, uCore, ComCtrls;

type
  TFUsuarios = class(TForm)
    Label1: TLabel;
    nombreEmpleado: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    PasswordEmpleado: TEdit;
    Button1: TButton;
    DSEmpleados: TDataSource;
    ZQEmpleados: TZQuery;
    listaSucursales: TDBLookupComboBox;
    DBGrid1: TDBGrid;
    DSSucursal: TDataSource;
    ZQSucursal: TZQuery;
    GroupBox1: TGroupBox;
    Empleado: TLabel;
    usuario: TLabel;
    Button2: TButton;
    Memo1: TMemo;
    Button3: TButton;
    vertodos: TCheckBox;
    listaPuestos: TDBLookupComboBox;
    barra: TProgressBar;
    Label4: TLabel;
    Button4: TButton;
    procedure t(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Button2Click(Sender: TObject);
    procedure DBGrid1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FUsuarios: TFUsuarios;

implementation
uses
    F_PrincipalAdmin,FPrincipalEmpleados,F_Main, FA_Login, FR_Movimientoslog;

{$R *.dfm}

procedure TFUsuarios.Button1Click(Sender: TObject);
var
    idSucursal,idNivel : Integer;
begin
    idSucursal := listaSucursales.KeyValue;
    idNivel := listaPuestos.KeyValue;

    ZQEmpleados.Close;
    ZQEmpleados.SQL.Clear;
    ZQEmpleados.SQL.Add('INSERT INTO empleado (empleado,password,idsucursal,idnivel)');
    ZQEmpleados.SQL.Add('VALUES ("'+nombreEmpleado.Text+'","'+passwordEmpleado.Text+'",'+IntToStr(idSucursal)+','+IntToStr(idNivel)+')');
    ZQEmpleados.ExecSQL;

    ZQEmpleados.SQL.Clear;
    ZQEmpleados.SQL.Add('SELECT Usuario, Sucursal');
    ZQEmpleados.SQL.Add('FROM c_empleados');
    ZQEmpleados.SQL.Add('WHERE id > 1');
    ZQEmpleados.ExecSQL;
    ZQEmpleados.Open;
    dbgrid1.Refresh;

    Application.MessageBox('Usuario agregado exitosamente.','Información',MB_ICONINFORMATION);
end;

procedure TFUsuarios.Button2Click(Sender: TObject);
var
    guardar : TSaveDialog;
    fecha : String;
    k : Integer;
begin
    try
        fecha := DateToStr(Date());
        ShowMessage(fecha);

        for k := Length(fecha) downto 1 do
        begin
            if (fecha[k] = '/') then
                Insert('-',fecha,k);
        end;
        ShowMessage(fecha);

        guardar := TSaveDialog.Create(self);
        guardar.Title := 'Guardar log de movimientos de empleados';
        guardar.Filter := 'Archivo txt|*.txt';
        guardar.DefaultExt := 'txt';
        guardar.FileName :=fecha+'_'+FPrincipal.sucursal;
        guardar.InitialDir := GetCurrentDir;
        if guardar.Execute then
            memo1.Lines.SaveToFile(guardar.FileName);
    finally
        guardar := nil;
        guardar.Free;
    end;
end;

procedure TFUsuarios.Button3Click(Sender: TObject);
var
    ZQMovimientoU : TZQuery;
    DSMovimientoU : TDataSource;
begin
    try
        barra.Min := 0;
        barra.Style := pbstNormal;
        barra.Step := 1;
        barra.Visible := true;

        ZQMovimientoU := TZQuery.Create(self);
        ZQMovimientoU.Connection := FPrincipalAdmin.ZConexion;
        DSMovimientoU := TDataSource.Create(self);
        DSMovimientoU.DataSet := ZQMovimientoU;
        Memo1.Clear;

        if (vertodos.Checked = true) then
        begin
            ZQMovimientoU.Close;
            ZQMovimientoU.SQL.Clear;
            ZQMovimientoU.SQL.Add('SELECT movimiento AS Tipo, movimiento_detalles AS Movimiento, empleado, sucursal, fecha FROM empleado_movimiento');
            ZQMovimientoU.ExecSQL;
            ZQMovimientoU.Open;
            barra.Max := ZQMovimientoU.RecordCount;
            Memo1.Lines.Add('Reporte generado el día '+DateToStr(Date())+' a las '+TimeToStr(Time()));
            Memo1.Lines.Add('Usuario: Todos los usuarios.');
            Memo1.Lines.Add('Tipo                        Movimiento                                                      Empleado                Sucursal                  Fecha');
            Memo1.Lines.Add('----------------------      ------------------------------------------------------          -------------           -------------             -------------');

            with ZQMovimientoU do
            begin
                First;
                while not EOF do
                begin
                    Memo1.Lines.Add(ZQMovimientoU.FieldByName('Tipo').AsString+'            '+
                    ZQMovimientoU.FieldByName('Movimiento').AsString+'            '+
                    ZQMovimientoU.FieldByName('Empleado').AsString+'            '+
                    ZQMovimientoU.FieldByName('Sucursal').AsString+'            '+
                    ZQMovimientoU.FieldByName('Fecha').AsString+'            '+#13);
                    barra.StepIt;
                    Next;
                end;
            end;
        end else
        if (usuario.Caption <> '') then
        begin
            ZQMovimientoU.Close;
            ZQMovimientoU.SQL.Clear;
            ZQMovimientoU.SQL.Add('SELECT movimiento AS Tipo, movimiento_detalles AS Movimiento, empleado, sucursal, fecha FROM empleado_movimiento');
            ZQMovimientoU.SQL.Add('WHERE empleado="'+usuario.Caption+'"');
            ZQMovimientoU.ExecSQL;
            ZQMovimientoU.Open;
            barra.Max := ZQMovimientoU.RecordCount;
            Memo1.Lines.Add('Reporte generado el día '+DateToStr(Date())+' a las '+TimeToStr(Time()));
            Memo1.Lines.Add('Usuario: '+Usuario.Caption);
            Memo1.Lines.Add('Tipo                        Movimiento                                                      Empleado                Sucursal                  Fecha');
            Memo1.Lines.Add('----------------------      ------------------------------------------------------          -------------           -------------             -------------');
            with ZQMovimientoU do
            begin
                First;
                while not EOF do
                begin
                    Memo1.Lines.Add(ZQMovimientoU.FieldByName('Tipo').AsString+'            '+
                    ZQMovimientoU.FieldByName('Movimiento').AsString+'            '+
                    ZQMovimientoU.FieldByName('Empleado').AsString+'            '+
                    ZQMovimientoU.FieldByName('Sucursal').AsString+'            '+
                    ZQMovimientoU.FieldByName('Fecha').AsString+'            '+#13);
                    barra.StepIt;
                    Next;
                end;
            end;
        end else
            raise Exception.Create('Error: Seleccione un usuario válido.');
    finally
        barra.Visible := false;
        ZQMovimientoU := nil;
        ZQMovimientoU.Free;
        DSMovimientoU := nil;
        DSMovimientoU.Free;
    end;
end;

procedure TFUsuarios.Button4Click(Sender: TObject);
begin
    FRMovimientosLog.QuickRep1.Preview;
end;

procedure TFUsuarios.DBGrid1CellClick(Column: TColumn);
begin
    usuario.Caption := DBgrid1.Fields[0].AsString;
end;

procedure TFUsuarios.DBGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if (Key = VK_UP) or (Key = VK_DOWN) or (Key = VK_LEFT) or (Key = VK_RIGHT) then
    begin
        usuario.Caption := DBgrid1.Fields[0].AsString;
    end;
end;

procedure TFUsuarios.t(Sender: TObject);
var
    ZQPuestos : TZQuery;
    DSPuestos : TDataSource;
begin
//Agregar el LookupComboBox

  //agregar validacion para que sysadmin agregue otro desarrollador

    barra.Visible := false;
    usuario.Caption := '';

    if (FALogin.idNivel = 2) or (FPrincipal.idNivel = 2) then      //admin
    begin
        ZQEmpleados.Close;
        ZQEmpleados.SQL.Clear;
        ZQEmpleados.SQL.Add('SELECT usuario, Sucursal');
        ZQEmpleados.SQL.Add('FROM c_empleados');
        ZQEmpleados.SQL.Add('WHERE id > 1');
        ZQEmpleados.ExecSQL;
        ZQEmpleados.Open;
        dbgrid1.Refresh;

        ZQSucursal.Close;
        ZQSucursal.SQL.Clear;
        ZQSucursal.SQL.Add('SELECT * FROM sucursal');
        ZQSucursal.ExecSQL;
        ZQSucursal.Open;

        listaSucursales.ListField := 'sucursal';
        listaSucursales.KeyField := 'idsucursal';

        ZQPuestos := TZQuery.Create(self);
        ZQPuestos.Connection := FPrincipalAdmin.ZConexion;

        DSPuestos := TDataSource.Create(self);
        DSPuestos.DataSet := ZQPuestos;
        listaPuestos.ListSource := DSPuestos;

        ZQPuestos.Close();
        ZQPuestos.SQL.Clear();
        ZQPuestos.SQL.Add('SELECT * FROM nivel_usuario WHERE nivel>0');
        ZQPuestos.ExecSQL();
        ZQPuestos.Open();

        listaPuestos.ListField := 'descripcion';
        listaPuestos.KeyField := 'idnivel';
    end else
    if (FALogin.idNivel = 1) or (FPrincipal.idNivel = 1) then    //carga todos los usuarios (sysadmins, administradores, empleados)
    begin
        ZQEmpleados.Close;
        ZQEmpleados.SQL.Clear;
        ZQEmpleados.SQL.Add('SELECT usuario, Sucursal');
        ZQEmpleados.SQL.Add('FROM c_empleados');
        ZQEmpleados.ExecSQL;
        ZQEmpleados.Open;
        dbgrid1.Refresh;

        ZQSucursal.Close;
        ZQSucursal.SQL.Clear;
        ZQSucursal.SQL.Add('SELECT * FROM sucursal');
        ZQSucursal.ExecSQL;
        ZQSucursal.Open;

        listaSucursales.ListField := 'sucursal';
        listaSucursales.KeyField := 'idsucursal';

        ZQPuestos := TZQuery.Create(self);
        ZQPuestos.Connection := FPrincipalAdmin.ZConexion;

        DSPuestos := TDataSource.Create(self);
        DSPuestos.DataSet := ZQPuestos;
        listaPuestos.ListSource := DSPuestos;

        ZQPuestos.Close();
        ZQPuestos.SQL.Clear();
        ZQPuestos.SQL.Add('SELECT * FROM nivel_usuario');
        ZQPuestos.ExecSQL();
        ZQPuestos.Open();

        listaPuestos.ListField := 'descripcion';
        listaPuestos.KeyField := 'idnivel';
    end;
end;
end.
