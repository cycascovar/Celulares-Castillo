unit FGarantia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Menus, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ComCtrls, Buttons, ExtCtrls, uCore, pngimage;

type
  TFGarantias = class(TForm)
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    DSGarantias: TDataSource;
    ZQGarantias: TZQuery;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    imei: TEdit;
    observaciones: TMemo;
    modelo: TEdit;
    marca: TEdit;
    titular: TEdit;
    telefonocontacto: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    label1111: TLabel;
    Label7: TLabel;
    iccid: TEdit;
    Label8: TLabel;
    StatusBar1: TStatusBar;
    fecharecibido: TDateTimePicker;
    Label6: TLabel;
    accesorios: TMemo;
    Label9: TLabel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Timer1: TTimer;
    PopupMenu1: TPopupMenu;
    Ordenarpor2: TMenuItem;
    Marca1: TMenuItem;
    Modelo1: TMenuItem;
    itular1: TMenuItem;
    Fecharecibido1: TMenuItem;
    Image6: TImage;
    BitBtn1: TBitBtn;
    SpeedButton1: TSpeedButton;
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Edit3KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit2KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure fecharecibidoChange(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
    ZQMovimiento : TZQuery;
    ZQTemp : TZQuery;
    procedure ordenarGrid(); overload;
    procedure ordenarGrid(fecha : TDateTimePicker);  overload;
  public
    cargatodos : boolean;
    { Public declarations }
  end;

var
  FGarantias: TFGarantias;

implementation
uses
    FPrincipalEmpleados, F_Login, FR_EGarantia;
{$R *.dfm}

procedure TFGarantias.BitBtn1Click(Sender: TObject);
var
    idEquipo : Integer;
    idEquiposG : Integer;
begin
    //
    if (titular.Text = '') or (imei.Text = '')then
        Application.MessageBox('Hace falta introducir datos obligatorios del equipo en garantía.','Información',MB_ICONINFORMATION)
    else
    begin
        cargatodos := true;
        ZQTemp.Close;
        ZQTemp.SQL.Clear;
        ZQTemp.SQL.Add('SELECT MAX(idequipo) AS idEquipo');
        ZQTemp.SQL.Add('FROM equipo_garantia WHERE idsucursal = '+IntToStr(FPrincipal.idSucursal)+'');
        ZQTemp.ExecSQL;
        ZQTemp.Open;

        idEquipo := ZQTemp.FieldByName('idEquipo').AsInteger;

        //si no hay registros, agrega uno primero
        if idEquipo = 0 then
        begin
          if (FPrincipal.idNivel = 3) then //___SI ES EMPLEADO
          begin
            idEquipo := 1;
            ZQGarantias.Close;
            ZQGarantias.SQL.Clear;
            ZQGarantias.SQL.Add('INSERT INTO equipo_garantia (idempleado, marca_equipo, imei_equipo, iccid_equipo, modelo_equipo, fecha, observaciones,accesorios,idequipo,idsucursal,mes)');
            ZQGarantias.SQL.Add('VALUES ("'+IntToStr(FPrincipal.idEmpleado)+'","'+marca.Text+'","'+imei.Text+'","'+iccid.Text+'","'+modelo.Text+'","'+FormatDateTime('YYYY/MM/DD',Date())+'","'+observaciones.Text+'","'+accesorios.Text+'",'+IntToStr(idequipo)+','+IntToStr(FPrincipal.idSucursal)+','+IntToStr(obtieneMes(Date()))+')');
            ZQGarantias.ExecSQL;

            ZQGarantias.SQL.Clear;
            ZQGarantias.SQL.Add('SELECT idequipo_garantia FROM equipo_garantia WHERE idequipo='+IntToStr(idEquipo)+'');
            ZQGarantias.ExecSQL;
            ZQGarantias.Open;

            idEquiposG := ZQGarantias.FieldByName('idequipo_garantia').AsInteger;
            ShowMessage('ID Equipo garantia: '+IntToStr(idEquiposG));

            ZQGarantias.Close;
            ZQGarantias.SQL.Clear;
            ZQGarantias.SQL.Add('INSERT INTO cliente_garantia(idequipo_garantia,nombre_cliente,telefono_contacto,tipo)');
            ZQGarantias.SQL.Add('VALUES ("'+IntToStr(idEquiposG)+'","'+titular.Text+'","'+telefonoContacto.Text+'","Garantia")');
            ZQGarantias.ExecSQL;

            ZQMovimiento.Close;
            ZQMovimiento.SQL.Clear;
            ZQMovimiento.SQL.Add('INSERT INTO empleado_movimiento (movimiento,movimiento_detalles, sucursal,fecha,empleado,host,userpc)');
            ZQMovimiento.SQL.Add('VALUES ("Alta de equipo en garantia.","El usuario '+Flogin.username.Text+' ha dado de alta un equipo en garantia el dia '+DateToStr(date())+' a las '+TimeToStr(Time())+'","'+FPrincipal.sucursal+'","'+FormatDateTime('YYYY/MM/DD',Date())+'","'+Flogin.username.Text+'","'+getHostname()+'","'+getUserFromWindows()+'")');
            ZQMovimiento.ExecSQL;

            OrdenarGrid;
            DBGrid1.Update;

            Application.MessageBox('El equipo ha sido agregado a garantía.','Información',MB_ICONINFORMATION);
          end else
          if (FPrincipal.idNivel = 2) then //_____ si es administrador
          begin
            idEquipo := 1;
            ZQGarantias.Close;
            ZQGarantias.SQL.Clear;
            ZQGarantias.SQL.Add('INSERT INTO equipo_garantia (idempleado, marca_equipo, imei_equipo, iccid_equipo, modelo_equipo, fecha, observaciones,accesorios,idequipo,idsucursal,mes)');
            ZQGarantias.SQL.Add('VALUES ("'+IntToStr(FPrincipal.idEmpleado)+'","'+marca.Text+'","'+imei.Text+'","'+iccid.Text+'","'+modelo.Text+'","'+FormatDateTime('YYYY/MM/DD',Date())+'","'+observaciones.Text+'","'+accesorios.Text+'",'+IntToStr(idequipo)+','+IntToStr(FPrincipal.idSucursal)+','+IntToStr(obtieneMes(Date()))+')');
            ZQGarantias.ExecSQL;

            ZQGarantias.SQL.Clear;
            ZQGarantias.SQL.Add('SELECT idequipo_garantia FROM equipo_garantia WHERE idequipo='+IntToStr(idEquipo)+'');
            ZQGarantias.ExecSQL;
            ZQGarantias.Open;

            idEquiposG := ZQGarantias.FieldByName('idequipo_garantia').AsInteger;
            ShowMessage('ID Equipo garantia: '+IntToStr(idEquiposG));

            ZQGarantias.Close;
            ZQGarantias.SQL.Clear;
            ZQGarantias.SQL.Add('INSERT INTO cliente_garantia(idequipo_garantia,nombre_cliente,telefono_contacto,tipo)');
            ZQGarantias.SQL.Add('VALUES ("'+IntToStr(idEquiposG)+'","'+titular.Text+'","'+telefonoContacto.Text+'","Garantia")');
            ZQGarantias.ExecSQL;

            ZQMovimiento.Close;
            ZQMovimiento.SQL.Clear;
            ZQMovimiento.SQL.Add('INSERT INTO administrador_movimiento (tipo,movimiento, sucursal,fecha,usuario)');
            ZQMovimiento.SQL.Add('VALUES ("Alta de equipo en garantia.","El usuario '+Flogin.username.Text+' ha dado de alta un equipo en garantia el dia '+DateToStr(date())+' a las '+TimeToStr(Time())+'","'+FPrincipal.sucursal+'","'+FormatDateTime('YYYY/MM/DD',Date())+'","'+Flogin.username.Text+'")');
            ZQMovimiento.ExecSQL;

            OrdenarGrid;
            DBGrid1.Update;

            Application.MessageBox('El equipo ha sido agregado a garantía.','Información',MB_ICONINFORMATION);
          end;
        end
        else //si ya hay equipos registrados Y si el idEquipos <> 0
        begin
            if (FPrincipal.idNivel = 3) then
            begin
            idEquipo := idEquipo + 1;
            ZQGarantias.Close;
            ZQGarantias.SQL.Clear;
            ZQGarantias.SQL.Add('INSERT INTO equipo_garantia (idempleado, marca_equipo, imei_equipo, iccid_equipo, modelo_equipo, fecha, observaciones,accesorios,idequipo,idsucursal,mes)');
            ZQGarantias.SQL.Add('VALUES ("'+IntToStr(FPrincipal.idEmpleado)+'","'+marca.Text+'","'+imei.Text+'","'+iccid.Text+'","'+modelo.Text+'","'+FormatDateTime('YYYY/MM/DD',Date())+'","'+observaciones.Text+'","'+accesorios.Text+'",'+IntToStr(idequipo)+','+IntToStr(FPrincipal.idSucursal)+','+IntToStr(obtieneMes(Date()))+')');
            ZQGarantias.ExecSQL;

            ZQGarantias.SQL.Clear;
            ZQGarantias.SQL.Add('SELECT idequipo_garantia FROM equipo_garantia WHERE idequipo='+IntToStr(idEquipo)+'');
            ZQGarantias.ExecSQL;
            ZQGarantias.Open;

            idEquiposG := ZQGarantias.FieldByName('idequipo_garantia').AsInteger;
            ShowMessage('ID Equipo garantia: '+IntToStr(idEquiposG));

            ZQGarantias.Close;
            ZQGarantias.SQL.Clear;
            ZQGarantias.SQL.Add('INSERT INTO cliente_garantia(idequipo_garantia,nombre_cliente,telefono_contacto,tipo)');
            ZQGarantias.SQL.Add('VALUES ("'+IntToStr(idEquiposG)+'","'+titular.Text+'","'+telefonoContacto.Text+'","Garantia")');
            ZQGarantias.ExecSQL;

            ZQMovimiento.Close;
            ZQMovimiento.SQL.Clear;
            ZQMovimiento.SQL.Add('INSERT INTO empleado_movimiento (movimiento,movimiento_detalles, sucursal, empleado, fecha,host,userpc)');
            ZQMovimiento.SQL.Add('VALUES ("Alta de equipo en garantia.","El usuario '+Flogin.username.Text+' ha dado de alta un equipo en garantia el dia '+DateToStr(date())+' a las '+TimeToStr(Time())+'","'+FPrincipal.sucursal+'","'+Flogin.username.Text+'","'+FormatDateTime('YYYY/MM/DD',Date())+'","'+getHostname()+'","'+getUserFromWindows()+'")');
            ZQMovimiento.ExecSQL;

            ordenarGrid;
            DBGrid1.Update;

            Application.MessageBox('El equipo ha sido agregado a garantía.','Información',MB_ICONINFORMATION);
            end else
            if (FPrincipal.idNivel = 2) then
            begin
            idEquipo := idEquipo + 1;
            ZQGarantias.Close;
            ZQGarantias.SQL.Clear;
            ZQGarantias.SQL.Add('INSERT INTO equipo_garantia (idempleado, marca_equipo, imei_equipo, iccid_equipo, modelo_equipo, fecha, observaciones,accesorios,idequipo,idsucursal,mes)');
            ZQGarantias.SQL.Add('VALUES ("'+IntToStr(FPrincipal.idEmpleado)+'","'+marca.Text+'","'+imei.Text+'","'+iccid.Text+'","'+modelo.Text+'","'+FormatDateTime('YYYY/MM/DD',Date())+'","'+observaciones.Text+'","'+accesorios.Text+'",'+IntToStr(idequipo)+','+IntToStr(FPrincipal.idSucursal)+','+IntToStr(obtieneMes(Date()))+')');
            ZQGarantias.ExecSQL;

            ZQGarantias.SQL.Clear;
            ZQGarantias.SQL.Add('SELECT idequipo_garantia FROM equipo_garantia WHERE idequipo='+IntToStr(idEquipo)+'');
            ZQGarantias.ExecSQL;
            ZQGarantias.Open;

            idEquiposG := ZQGarantias.FieldByName('idequipo_garantia').AsInteger;
            ShowMessage('ID Equipo garantia: '+IntToStr(idEquiposG));

            ZQGarantias.Close;
            ZQGarantias.SQL.Clear;
            ZQGarantias.SQL.Add('INSERT INTO cliente_garantia(idequipo_garantia,nombre_cliente,telefono_contacto,tipo)');
            ZQGarantias.SQL.Add('VALUES ("'+IntToStr(idEquiposG)+'","'+titular.Text+'","'+telefonoContacto.Text+'","Garantia")');
            ZQGarantias.ExecSQL;

            ZQMovimiento.Close;
            ZQMovimiento.SQL.Clear;
            ZQMovimiento.SQL.Add('INSERT INTO administrador_movimiento (tipo,movimiento, sucursal,fecha,usuario)');
            ZQMovimiento.SQL.Add('VALUES ("Alta de equipo en garantia.","El usuario '+Flogin.username.Text+' ha dado de alta un equipo en garantia el dia '+DateToStr(date())+' a las '+TimeToStr(Time())+'","'+FPrincipal.sucursal+'","'+FormatDateTime('YYYY/MM/DD',Date())+'","'+Flogin.username.Text+'")');
            ZQMovimiento.ExecSQL;

            ordenarGrid;
            DBGrid1.Update;

            Application.MessageBox('El equipo ha sido agregado a garantía.','Información',MB_ICONINFORMATION);
            end;
        end;
    end;
end;

procedure TFGarantias.BitBtn2Click(Sender: TObject);
begin
    if application.MessageBox (pchar('¿Desea limpiar los datos del celular?'), pchar('Confirmar'), (MB_YESNO + MB_ICONQUESTION)) = IDYES then
    begin
        imei.Clear;
        modelo.Clear;
        marca.Clear;
        iccid.Clear;
        observaciones.Clear;
        accesorios.Clear;
    end;
end;

procedure TFGarantias.BitBtn3Click(Sender: TObject);
begin
    if application.MessageBox (pchar('¿Desea limpiar los datos del cliente?'), pchar('Confirmar'), (MB_YESNO + MB_ICONQUESTION)) = IDYES then
    begin
        titular.Clear;
        telefonocontacto.Clear;
    end;
end;

procedure TFGarantias.BitBtn4Click(Sender: TObject);
var
    IMEI,ICCID: String;
    idEquiposG,idNivel : Integer;
begin
    {eliminar un registro a partir del imei ó eliminar y mandar a otra tabla los equipos vendidos}
    imei := DBGrid1.Fields[2].AsString;
    iccid := DBGrid1.Fields[3].AsString;
    idNivel := FPrincipal.idNivel;

    if (imei <> '') or (iccid <> '') then
    begin
    if (idNivel = 3) then
    begin
    ZQGarantias.Close();
    ZQGarantias.SQL.Clear();
    ZQGarantias.SQL.Add('SELECT idequipo_garantia AS idEquiposG FROM equipo_garantia WHERE imei_equipo = "'+imei+'"');
    ZQGarantias.ExecSQL();
    ZQGarantias.Open();
    idEquiposG := ZQGarantias.FieldByName('idEquiposG').AsInteger;

    ZQGarantias.SQL.Clear();
    ZQGarantias.SQL.Add('DELETE FROM cliente_garantia WHERE idequipo_garantia='+IntToStr(idEquiposG)+'');
    ZQGarantias.ExecSQL();

    ZQGarantias.SQL.Clear;
    ZQGarantias.SQL.Add('DELETE FROM equipo_garantia WHERE idequipo_garantia='+IntToStr(idEquiposG)+'');
    ZQGarantias.ExecSQL;

    ZQGarantias.Close;
    ZQGarantias.SQL.Clear;
    ZQGarantias.SQL.Add('INSERT INTO equipo_entregado (fecha_entrega, tipo, empleado, imei_equipo, iccid_equipo, sucursal)');
    ZQGarantias.SQL.Add('VALUES ("'+FormatDateTime('YYYY/MM/DD',Date())+'","Garantia","'+FLogin.username.Text+'","'+imei+'","'+iccid+'","'+FPrincipal.sucursal+'")');
    ZQGarantias.ExecSQL;

    ZQMovimiento.Close;
    ZQMovimiento.SQL.Clear;
    ZQMovimiento.SQL.Add('INSERT INTO empleado_movimiento (movimiento,movimiento_detalles, sucursal, empleado, fecha,host, userpc)');
    ZQMovimiento.SQL.Add('VALUES ("Entrega de equipo (garantia).","El usuario '+Flogin.username.Text+' ha entregado un equipo en garantia el dia '+DateToStr(date())+' a las '+TimeToStr(Time())+'","'+FPrincipal.sucursal+'","'+Flogin.username.Text+'","'+FormatDateTime('YYYY/MM/DD',Date())+'","'+getHostname()+'","'+getUserFromWindows()+'")');
    ZQMovimiento.ExecSQL;

    OrdenarGrid;
    DBGrid1.Update;

    Application.MessageBox('El equipo ha sido entregado y no esta mas en garantía.','Información',MB_ICONINFORMATION);
    end else
    if (idNivel = 2) then
    begin
    ZQGarantias.Close();
    ZQGarantias.SQL.Clear();
    ZQGarantias.SQL.Add('SELECT idequipo_garantia AS idEquiposG FROM equipo_garantia WHERE imei_equipo = "'+imei+'"');
    ZQGarantias.ExecSQL();
    ZQGarantias.Open();
    idEquiposG := ZQGarantias.FieldByName('idEquiposG').AsInteger;
//    ShowMessage(IntToStr(idEquiposG));

    ZQGarantias.SQL.Clear();
    ZQGarantias.SQL.Add('DELETE FROM cliente_garantia WHERE idequipo_garantia='+IntToStr(idEquiposG)+'');
    ZQGarantias.ExecSQL();

    ZQGarantias.SQL.Clear;
    ZQGarantias.SQL.Add('DELETE FROM equipo_garantia WHERE idequipo_garantia='+IntToStr(idEquiposG)+'');
    ZQGarantias.ExecSQL;

    ZQGarantias.Close;
    ZQGarantias.SQL.Clear;
    ZQGarantias.SQL.Add('INSERT INTO equipo_entregado (fecha_entrega, tipo, empleado, imei_equipo, iccid_equipo, sucursal)');
    ZQGarantias.SQL.Add('VALUES ("'+FormatDateTime('YYYY/MM/DD',Date())+'","Garantia","'+FLogin.username.Text+'","'+imei+'","'+iccid+'","'+FPrincipal.sucursal+'")');
    ZQGarantias.ExecSQL;

    ZQMovimiento.Close;
    ZQMovimiento.SQL.Clear;
    ZQMovimiento.SQL.Add('INSERT INTO administrador_movimiento (tipo,movimiento, sucursal, usuario, fecha)');
    ZQMovimiento.SQL.Add('VALUES ("Entrega de equipo (garantia).","El usuario '+Flogin.username.Text+' ha entregado un equipo en garantia el dia '+DateToStr(date())+' a las '+TimeToStr(Time())+'","'+FPrincipal.sucursal+'","'+Flogin.username.Text+'","'+FormatDateTime('YYYY/MM/DD',Date())+'")');
    ZQMovimiento.ExecSQL;

    ordenarGrid;
    DBGrid1.Update;

    Application.MessageBox('El equipo ha sido entregado y no esta mas en garantía.','Información',MB_ICONINFORMATION);
    end;
    end
    else
    ShowMessage('Seleccione un equipo válido. La lista de equipos en garantía está vacía.');
end;

procedure TFGarantias.BitBtn5Click(Sender: TObject);
begin
    // Revisar los cambios en la fecha en el grid
    //FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
    cargatodos := true;
    Edit1.Clear;
    Edit2.Clear;
    Edit3.Clear;
    ordenarGrid;
    DBGrid1.Update;
end;

procedure TFGarantias.Button1Click(Sender: TObject);
var
    IMEI,ICCID: String;
    idEquiposG : Integer;
begin
    {eliminar un registro a partir del imei ó eliminar y mandar a otra tabla los equipos vendidos}
    imei := DBGrid1.Fields[2].AsString;
    iccid := DBGrid1.Fields[3].AsString;

    ZQGarantias.Close();
    ZQGarantias.SQL.Clear();
    ZQGarantias.SQL.Add('SELECT idequipo_garantia AS idEquiposG FROM equipo_garantia WHERE imei_equipo = "'+imei+'"');
    ZQGarantias.ExecSQL();
    ZQGarantias.Open();
    idEquiposG := ZQGarantias.FieldByName('idEquiposG').AsInteger;
    ShowMessage(IntToStr(idEquiposG));

    ZQGarantias.SQL.Clear();
    ZQGarantias.SQL.Add('DELETE FROM cliente_garantia WHERE idequipo_garantia='+IntToStr(idEquiposG)+'');
    ZQGarantias.ExecSQL();

    ZQGarantias.SQL.Clear;
    ZQGarantias.SQL.Add('DELETE FROM equipo_garantia WHERE idequipo_garantia='+IntToStr(idEquiposG)+'');
    ZQGarantias.ExecSQL;

    ZQGarantias.Close;
    ZQGarantias.SQL.Clear;
    ZQGarantias.SQL.Add('INSERT INTO equipo_entregado (fecha_entrega, tipo, empleado, imei_equipo, iccid_equipo, sucursal)');
    ZQGarantias.SQL.Add('VALUES ("'+FormatDateTime('YYYY/MM/DD',Date())+'","Garantia","'+FLogin.username.Text+'","'+imei+'","'+iccid+'","'+FPrincipal.sucursal+'")');
    ZQGarantias.ExecSQL;

    ZQMovimiento.Close;
    ZQMovimiento.SQL.Clear;
    ZQMovimiento.SQL.Add('INSERT INTO empleado_movimiento (movimiento,movimiento_detalles, sucursal, empleado, fecha,host,userpc)');
    ZQMovimiento.SQL.Add('VALUES ("Entrega de equipo (garantia).","El usuario '+Flogin.username.Text+' ha entregado un equipo en garantia el dia '+DateToStr(date())+' a las '+TimeToStr(Time())+'","'+FPrincipal.sucursal+'","'+Flogin.username.Text+'","'+FormatDateTime('YYYY/MM/DD',Date())+'","'+getHostname()+'","'+getUserFromWindows()+'")');
    ZQMovimiento.ExecSQL;

    OrdenarGrid;
    DBGrid1.Update;

    Application.MessageBox('El equipo ha sido entregado y no esta mas en garantía.','Información',MB_ICONINFORMATION);
end;

procedure TFGarantias.Button2Click(Sender: TObject);
var
    idEquipo : Integer;
    idEquiposG : Integer;
begin
    if (titular.Text = '') or (imei.Text = '')then
        Application.MessageBox('Hace falta introducir datos obligatorios del equipo en garantía.','Información',MB_ICONINFORMATION)
    else
    begin
        ZQTemp.Close;
        ZQTemp.SQL.Clear;
        ZQTemp.SQL.Add('SELECT MAX(idequipo) AS idEquipo');
        ZQTemp.SQL.Add('FROM equipo_garantia');
        ZQTemp.ExecSQL;
        ZQTemp.Open;

        idEquipo := ZQTemp.FieldByName('idEquipo').AsInteger;

        if idEquipo = 0 then
        begin
            idEquipo := 1;
            ZQGarantias.Close;
            ZQGarantias.SQL.Clear;
            ZQGarantias.SQL.Add('INSERT INTO equipo_garantia (idempleado, marca_equipo, imei_equipo, iccid_equipo, modelo_equipo, fecha, observaciones,accesorios,idequipo,idsucursal,mes)');
            ZQGarantias.SQL.Add('VALUES ("'+IntToStr(FPrincipal.idEmpleado)+'","'+marca.Text+'","'+imei.Text+'","'+iccid.Text+'","'+modelo.Text+'","'+FormatDateTime('YYYY/MM/DD',Date())+'","'+observaciones.Text+'","'+accesorios.Text+'",'+IntToStr(idequipo)+','+IntToStr(FPrincipal.idSucursal)+','+IntToStr(obtieneMes(Date()))+')');
            ZQGarantias.ExecSQL;

            ZQGarantias.SQL.Clear;
            ZQGarantias.SQL.Add('SELECT idequipo_garantia FROM equipo_garantia WHERE idequipo='+IntToStr(idEquipo)+'');
            ZQGarantias.ExecSQL;
            ZQGarantias.Open;

            idEquiposG := ZQGarantias.FieldByName('idequipo_garantia').AsInteger;

            ZQGarantias.Close;
            ZQGarantias.SQL.Clear;
            ZQGarantias.SQL.Add('INSERT INTO cliente_garantia(idequipo_garantia,nombre_cliente,telefono_contacto)');
            ZQGarantias.SQL.Add('VALUES ("'+IntToStr(idEquiposG)+'","'+titular.Text+'","'+telefonoContacto.Text+'")');
            ZQGarantias.ExecSQL;

            ZQMovimiento.Close;
            ZQMovimiento.SQL.Clear;
            ZQMovimiento.SQL.Add('INSERT INTO empleado_movimiento (movimiento,movimiento_detalles, sucursal,host,userpc)');
            ZQMovimiento.SQL.Add('VALUES ("Alta de equipo en garantia.","El usuario '+Flogin.username.Text+' ha dado de alta un equipo en garantia el dia '+DateToStr(date())+' a las '+TimeToStr(Time())+'","'+FPrincipal.sucursal+'","'+getHostname()+'","'+getUserFromWindows()+'")');
            ZQMovimiento.ExecSQL;

            ordenarGrid;
            DBGrid1.Update;

            Application.MessageBox('El equipo ha sido agregado a garantía.','Información',MB_ICONINFORMATION);
        end
        else
        begin
            ZQGarantias.Close;
            ZQGarantias.SQL.Clear;
            ZQGarantias.SQL.Add('INSERT INTO equipo_garantia (idempleado, marca_equipo, imei_equipo, modelo_equipo, iccid_equipo, fecha, observaciones,accesorios,idequipo,idsucursal,mes)');
            ZQGarantias.SQL.Add('VALUES ("'+IntToStr(FPrincipal.idEmpleado)+'","'+marca.Text+'","'+imei.Text+'","'+modelo.Text+'","'+iccid.Text+'","'+FormatDateTime('YYYY/MM/DD',Date())+'","'+observaciones.Text+'","'+accesorios.Text+'",'+IntToStr(idEquipo+1)+','+IntToStr(FPrincipal.idSucursal)+','+IntToStr(obtieneMes(Date()))+')');
            ZQGarantias.ExecSQL;

            ZQGarantias.SQL.Clear;
            ZQGarantias.SQL.Add('SELECT idequipo_garantia FROM equipo_garantia WHERE idequipo='+IntToStr(idEquipo+1)+'');
            ZQGarantias.ExecSQL;
            ZQGarantias.Open;

            idEquiposG := ZQGarantias.FieldByName('idequipo_garantia').AsInteger;

            ZQGarantias.Close;
            ZQGarantias.SQL.Clear;
            ZQGarantias.SQL.Add('INSERT INTO cliente_garantia(idequipo_garantia,nombre_cliente,telefono_contacto)');
            ZQGarantias.SQL.Add('VALUES ("'+IntToStr(idEquiposG)+'","'+titular.Text+'","'+telefonoContacto.Text+'")');
            ZQGarantias.ExecSQL;

            ZQMovimiento.Close;
            ZQMovimiento.SQL.Clear;
            ZQMovimiento.SQL.Add('INSERT INTO empleado_movimiento (movimiento,movimiento_detalles, sucursal, empleado, fecha,host,userpc)');
            ZQMovimiento.SQL.Add('VALUES ("Alta de equipo en garantia.","El usuario '+Flogin.username.Text+' ha dado de alta un equipo en garantia el dia '+DateToStr(date())+' a las '+TimeToStr(Time())+'","'+FPrincipal.sucursal+'","'+Flogin.username.Text+'","'+FormatDateTime('YYYY/MM/DD',Date())+'","'+getHostname()+'","'+getUserFromWindows()+'")');
            ZQMovimiento.ExecSQL;

            ordenarGrid();
            DBGrid1.Update;

            Application.MessageBox('El equipo ha sido agregado a garantía.','Información',MB_ICONINFORMATION);
        end;
    end;
end;

procedure TFGarantias.Button3Click(Sender: TObject);
begin
    FGarantias.Close;
end;

procedure TFGarantias.Button4Click(Sender: TObject);
begin
    if application.MessageBox (pchar('¿Desea limpiar los datos del cliente?'), pchar('Confirmar'), (MB_YESNO + MB_ICONQUESTION)) = IDYES then
    begin
        titular.Clear;
        telefonocontacto.Clear;
    end;
end;

procedure TFGarantias.Button5Click(Sender: TObject);
begin
    if application.MessageBox (pchar('¿Desea limpiar los datos del celular?'), pchar('Confirmar'), (MB_YESNO + MB_ICONQUESTION)) = IDYES then
    begin
        imei.Clear;
        modelo.Clear;
        marca.Clear;
        iccid.Clear;
        observaciones.Clear;
        accesorios.Clear;
    end;
end;

procedure TFGarantias.Button6Click(Sender: TObject);
begin
    ordenarGrid;
end;

procedure TFGarantias.DBGrid1TitleClick(Column: TColumn);
{$J+}
const
  PrvOrd: Boolean = False;
{$J-}
const
  Orden: array[Boolean] of string=(' ASC',' DESC');
var
  col : String;
  PrvInx: Integer;
begin
  col := Column.Field.FieldName;
  PrvInx := Column.Index;

  //  with DBGrid1.Columns[PrvInx].Title.Font do
//    begin
//      Style := Style - [fsBold];
//      with ZQGarantias.DataSource.DataSet do

{  with DBGrid1.Columns[PrvInx].Title.Font do Style := Style - [fsBold];
      with ZQGarantias(DBGrid1.DataSource.DataSet) do
      begin
        PrvOrd := not PrvOrd;
        Close;
        SQL.Clear;
        SQL.Add('SELECT marca_equipo Marca, modelo_equipo Modelo, imei_equipo IMEI, iccid_equipo ICCID, Accesorios, nombre_cliente Titular, telefono_contacto AS "Telefono de contacto", fecha AS "Fecha recibido"');
        SQL.Add('FROM equipo_garantia');
        SQL.Add('JOIN cliente_garantia ON equipo_garantia.idequipo_garantia = cliente_garantia.idequipo_garantia');
        SQL.Add('JOIN sucursal ON sucursal.idsucursal = equipo_garantia.idsucursal');
        SQL.Add('AND equipo_garantia.idsucursal = '+IntToStr(FPrincipal.idSucursal)+'');
        SQL.Add('AND fecha="'+DateToStr(Date())+'"');
        SQL.Add('ORDER BY '+col+orden[PrvOrd]);
        ExecSQL;
        Open;
      end;}
    //end;

//    with DBGrid1.Columns[PrvInx].Title.Font do Style:= Style + [fsBold];
end;

procedure TFGarantias.Edit1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    ZQGarantias.Filtered := false;
    ZQGarantias.Filter := 'IMEI LIKE'+QuotedStr('*'+edit1.Text+'*');
    ZQGarantias.Filtered := true;
end;

procedure TFGarantias.Edit2KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    ZQGarantias.Filtered := false;
    ZQGarantias.Filter := 'Modelo LIKE'+QuotedStr('*'+edit2.Text+'*');
    ZQGarantias.Filtered := true;
end;

procedure TFGarantias.Edit3KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    ZQGarantias.Filtered := false;
    ZQGarantias.Filter := 'Marca LIKE'+QuotedStr('*'+edit3.Text+'*');
    ZQGarantias.Filtered := true;
end;

procedure TFGarantias.fecharecibidoChange(Sender: TObject);
begin
//    FormatDateTime('YYYY-MM-DD',fecharecibido.Date);
    FormatSettings.ShortDateFormat := 'yyyy-mm-dd';
    cargatodos := false;
    ordenarGrid(fechaRecibido);
    FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
    DBGrid1.Update;
end;

procedure TFGarantias.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    eliminaZQuery(ZQGarantias);
end;

procedure TFGarantias.FormShow(Sender: TObject);
begin
    ZQMovimiento := TZQuery.Create(self);
    ZQMovimiento.Connection := FPrincipal.ZConexion;

    ZQTemp := TZQuery.Create(self);
    ZQTemp.Connection := FPrincipal.ZConexion;

    StatusBar1.Panels[0].Text := DateToStr(Date()); //fecha
    StatusBar1.Panels[0].Width := 70;

    setTitleWindow(self,'Equipos en garantía - Celulares "Castillo", (sucursal '+FPrincipal.sucursal+')');

//    FormatDateTime('YYYY/MM/DD',Date());
    FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
    fecharecibido.Date := Date();
    FormatSettings.ShortDateFormat := 'yyyy-mm-dd';
    ordenarGrid(fechaRecibido);
    FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
    DBGrid1.Update;
end;

procedure TFGarantias.ordenarGrid;    // Muestra TODOS los celulares recibidos
begin
    ZQGarantias.Close;
    ZQGarantias.SQL.Clear;
    ZQGarantias.SQL.Add('SELECT Marca, Modelo, IMEI, ICCID, Accesorios, Titular, telefono_contacto AS "Telefono de contacto", fecha AS "Fecha recibido"');
    ZQGarantias.SQL.Add('FROM v_equipos_garantia');
    ZQGarantias.SQL.Add('WHERE idsucursal = '+IntToStr(FPrincipal.idSucursal)+'');
    ZQGarantias.SQL.Add('ORDER BY 8 DESC');
    ZQGarantias.ExecSQL;
    ZQGarantias.Open;
end;

procedure TFGarantias.ordenarGrid(fecha: TDateTimePicker); // Muestra los celulares recibidos EN CIERTA FECHA
begin
    ZQGarantias.Close;
    ZQGarantias.SQL.Clear;
    ZQGarantias.SQL.Add('SELECT Marca, Modelo, IMEI, ICCID, Accesorios, Titular, telefono_contacto AS "Telefono de contacto", fecha AS "Fecha recibido"');
    ZQGarantias.SQL.Add('FROM v_equipos_garantia');
    ZQGarantias.SQL.Add('WHERE idsucursal = '+IntToStr(FPrincipal.idSucursal)+' AND fecha = "'+DateToStr(fecha.Date)+'" ');
    ZQGarantias.SQL.Add('ORDER BY 8 DESC');
    ZQGarantias.ExecSQL;
    ZQGarantias.Open;
end;

procedure TFGarantias.SpeedButton1Click(Sender: TObject);
begin
  FREgarantia.QRGarantia.PrinterSetup;
  FREGarantia.QRGarantia.Print;
end;

procedure TFGarantias.Timer1Timer(Sender: TObject);
begin
    StatusBar1.Panels[1].Text := TimeToStr(Time());
end;

end.
