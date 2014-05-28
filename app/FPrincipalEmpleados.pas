unit FPrincipalEmpleados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ExtCtrls, StdCtrls, pngimage, ZAbstractConnection, ZConnection,
  DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, ComCtrls,
  ZDbcIntfs, Buttons, ShellApi, ImgList, jpeg, uCore;

type
  TFPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Garantas1: TMenuItem;
    Reparacin1: TMenuItem;
    Verequiposengaranta1: TMenuItem;
    Verequiposenreparacin1: TMenuItem;
    Ayuda1: TMenuItem;
    Acercade1: TMenuItem;
    Cmousarelsistema1: TMenuItem;
    Equipos1: TMenuItem;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Recargas1: TMenuItem;
    Salir1: TMenuItem;
    Button4: TButton;
    Button5: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Verequiposenalmacen1: TMenuItem;
    Vercelularesasignados1: TMenuItem;
    ZConexion: TZConnection;
    N2: TMenuItem;
    Salir2: TMenuItem;
    ZQuery1: TZQuery;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    Reportes1: TMenuItem;
    Equipos2: TMenuItem;
    Garanta1: TMenuItem;
    Reparacin2: TMenuItem;
    Inventario1: TMenuItem;
    Ventasdeldia1: TMenuItem;
    Label4: TLabel;
    Administrador1: TMenuItem;
    Iniciar1: TMenuItem;
    Image6: TImage;
    Sistema1: TMenuItem;
    Comprobarnuevasversiones1: TMenuItem;
    Deldia1: TMenuItem;
    Mensual1: TMenuItem;
    procedure Acercade1Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Verequiposenreparacin1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Verequiposenalmacen1Click(Sender: TObject);
    procedure Vercelularesasignados1Click(Sender: TObject);
    procedure Verequiposengaranta1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Salir2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Iniciar1Click(Sender: TObject);
    procedure Cmousarelsistema1Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure Inventario1Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Reparacin2Click(Sender: TObject);
    procedure Deldia1Click(Sender: TObject);
    procedure Garanta1Click(Sender: TObject);
  private
    { Private declarations }
    ZQMovimiento : TZQuery;
  public
    { Public declarations }
    idEmpleado, idSucursal,idNivel : Integer;
    sucursal : String;
    procedure GetSystemDPI(var HorizDPI, VertDPI: Integer);
    procedure scaleForm(F: TForm; ScreenWidth, ScreenHeight: LongInt);
    function InetIsOffline(Flag: Integer): Boolean; stdcall;
//    external 'URL.DLL';
  end;

var
  FPrincipal: TFPrincipal;

implementation
uses
    F_Login,FR_EReparacion,FAlmacen_Local,FGarantia,FReparacion, FRecargas, FA_Login,F_About,F_Main,FR_VentaDiario,FR_Almacen, _FReporteTest,FR_EGarantia;


{$R *.dfm}

procedure TFPrincipal.Acercade1Click(Sender: TObject);
begin
    FAbout.Enabled := false;
    FAbout := TFAbout.Create(self);
    FAbout.ShowModal;
end;

procedure TFPrincipal.Button1Click(Sender: TObject);
begin
    try
        FAlmacenLocal.Enabled := false;
        FAlmacenLocal := TFAlmacenLocal.Create(self);
        FAlmacenLocal.ShowModal;
    finally
        FAlmacenLocal.Free;
    end;
end;

procedure TFPrincipal.Button2Click(Sender: TObject);
begin
    try
        F_Recargas.Enabled := false;
        F_Recargas := TF_Recargas.Create(Self);
        F_Recargas.ShowModal;
    finally
        F_Recargas.Free;
    end;
end;

procedure TFPrincipal.Button3Click(Sender: TObject);
begin
    try
        FGarantias.Enabled := false;
        FGarantias := TFGarantias.Create(self);
        FGarantias.ShowModal;
    finally
        FGarantias.Free;
    end;
end;

procedure TFPrincipal.Button4Click(Sender: TObject);
begin
    try
        FReparaciones.Enabled := false;
        FReparaciones := TFReparaciones.Create(self);
        FReparaciones.ShowModal;
    finally
        FReparaciones.Free;
    end;
end;

procedure TFPrincipal.Button5Click(Sender: TObject);
begin
    try
        if application.MessageBox (pchar('¿Desea salir del programa?'), pchar('Confirmar'), (MB_YESNO + MB_ICONQUESTION)) = IDYES then
        begin
            if idNivel = 3 then
            begin
            ZQMovimiento.Close;
            ZQMovimiento.SQL.Clear;
            ZQMovimiento.SQL.Add('INSERT INTO empleado_movimiento (movimiento,movimiento_detalles,sucursal,empleado,fecha,host,userpc)');
            ZQMovimiento.SQL.Add('VALUES ("Salida del programa.","El usuario '+FLogin.username.Text+' dejó de usar el sistema el dia '+DateToStr(Date())+' a las '+TimeToStr(Time())+'","'+sucursal+'","'+FLogin.username.Text+'","'+FormatDateTime('YYYY/MM/DD',Date())+'","'+getHostName()+'","'+GetUserFromWindows()+'")');
            ZQMovimiento.ExecSQL;
            FLogin.Close;
            FLogin.Free;
            FLogin := nil;
            end
            else if idNivel = 2 then
            begin
            ZQMovimiento.Close;
            ZQMovimiento.SQL.Clear;
            ZQMovimiento.SQL.Add('INSERT INTO administrador_movimiento (tipo,movimiento,sucursal,usuario,fecha)');
            ZQMovimiento.SQL.Add('VALUES ("Salida del programa.","El usuario '+FLogin.username.Text+' dejó de usar el sistema el dia '+DateToStr(Date())+' a las '+TimeToStr(Time())+'","'+sucursal+'","'+FLogin.username.Text+'","'+FormatDateTime('YYYY/MM/DD',Date())+'")');
            ZQMovimiento.ExecSQL;
            FLogin.Close;
            FLogin.Free;
            FLogin := nil;
            end;
        end;
    finally
        ZQMovimiento.Free;
    end;
end;

procedure TFPrincipal.Button6Click(Sender: TObject);
begin
  __FReporteTest.ReportePrueba.Preview;
end;

procedure TFPrincipal.Cmousarelsistema1Click(Sender: TObject);
begin
    ShellExecute(Handle, 'open', 'C:\Archivos de programa\Celulares Castillo\ayuda\ayuda.chm', nil, nil, SW_SHOWNORMAL) ; //Aqui deberia de ejecutarse el .chm o un .html para la ayuda
end;

procedure TFPrincipal.Deldia1Click(Sender: TObject);
begin
    FRVentaDiario.QuickRep1.PrinterSetup;
    FRVentaDiario.QuickRep1.Print;
end;

procedure TFPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
    if idNivel = 3 then
    begin
        ZQMovimiento.Close;
        ZQMovimiento.SQL.Clear;
        ZQMovimiento.SQL.Add('INSERT INTO empleado_movimiento (movimiento,movimiento_detalles,sucursal,empleado,fecha,host,userpc)');
        ZQMovimiento.SQL.Add('VALUES ("Salida del programa.","El usuario '+FLogin.username.Text+' dejó de usar el sistema el dia '+DateToStr(Date())+' a las '+TimeToStr(Time())+'","'+sucursal+'","'+FLogin.username.Text+'","'+FormatDateTime('YYYY/MM/DD',Date())+'","'+getHostName()+'","'+GetUserFromWindows()+'")');
        ZQMovimiento.ExecSQL;
        FLogin.Close;
    end else
    if idNivel = 2 then
    begin
        ZQMovimiento.Close;
        ZQMovimiento.SQL.Clear;
        ZQMovimiento.SQL.Add('INSERT INTO administrador_movimiento (tipo,movimiento,sucursal,usuario,fecha)');
        ZQMovimiento.SQL.Add('VALUES ("Salida del programa.","El usuario '+FLogin.username.Text+' dejó de usar el sistema el dia '+DateToStr(Date())+' a las '+TimeToStr(Time())+'","'+sucursal+'","'+FLogin.username.Text+'","'+FormatDateTime('YYYY/MM/DD',Date())+'")');
        ZQMovimiento.ExecSQL;
        FLogin.Close;
    end;
  except on E: Exception do
    ShowMessage('Inicie el administrador de tareas y cierre el programa.');
  end;
end;

procedure TFPrincipal.FormCreate(Sender: TObject);
begin
//    SetWindowLong(Handle, GWL_EXSTYLE, WS_EX_APPWINDOW);
    SetBounds(Left,Top,217,368);
    ZConexion.HostName := _hostname;
    ZConexion.Catalog := _CATALOG;
    ZConexion.Database := _db;
    ZConexion.User := _u;
    ZConexion.Password := _p;
end;

procedure TFPrincipal.FormShow(Sender: TObject);
begin
    Label2.Caption := FLogin.username.Text;
    FormatDateTime('YYYY/MM/DD',Date());
    StatusBar1.Panels[0].Text := DateToStr(Date()); //fecha
    StatusBar1.Panels[0].Width := 70;

    ZQMovimiento := TZQuery.Create(self);
    ZQMovimiento.Connection := ZConexion;
   // InetIsOffline(0);

    //Niveles : 1 = sysadmin, 2 = administrador, 3 = empleado

    ZQuery1.Close;
    ZQuery1.SQL.Clear;
    ZQuery1.SQL.Add('SELECT idempleado,idsucursal,idnivel');
    ZQuery1.SQL.Add('FROM empleado');
    ZQuery1.SQL.Add('WHERE password="'+FLogin.password.Text+'"');
    ZQuery1.ExecSQL;
    ZQuery1.Open;

    idEmpleado := ZQuery1.FieldByName('idempleado').AsInteger;
    idSucursal := ZQuery1.FieldByName('idsucursal').AsInteger;
    idNivel := ZQuery1.FieldByName('idNivel').AsInteger;
(*    ShowMessage('Nivel: '+IntToStr(idNivel));
    ShowMessage('idsucursal:'+IntToStr(idSucursal)); *)

    ZQuery1.Close;
    ZQuery1.SQL.Clear;
    ZQuery1.SQL.Add('SELECT sucursal');
    ZQuery1.SQL.Add('FROM sucursal');
    ZQuery1.SQL.Add('WHERE idsucursal='+IntToStr(idSucursal)+'');
    ZQuery1.ExecSQL;
    ZQuery1.Open;
    Sucursal := ZQuery1.FieldByName('sucursal').AsString;
    setSucursal(Sucursal);
    setTitleWindow(self,'Principal - Celulares "Castillo", (sucursal '+getsucursal+')');
//    Application.Title := 'Sistema para empleados: Celulares "Castillo", (sucursal '+getsucursal+')';

    if idNivel = 3 then
    begin
        ZQMovimiento.Close;
        ZQMovimiento.SQL.Clear;
        ZQMovimiento.SQL.Add('INSERT INTO empleado_movimiento (movimiento,movimiento_detalles,sucursal,empleado,fecha,host,userpc)');
        ZQMovimiento.SQL.Add('VALUES ("Inicio de sesión.","El usuario '+FLogin.username.Text+' inicio sesion correctamente a las '+TimeToStr(Time())+'","'+getsucursal+'","'+FLogin.username.Text+'","'+FormatDateTime('YYYY/MM/DD',Date())+'","'+getHostName()+'","'+GetUserFromWindows()+'")');
        ZQMovimiento.ExecSQL;
    end else
    if idNivel = 2 then
    begin
        ZQMovimiento.Close;
        ZQMovimiento.SQL.Clear;
        ZQMovimiento.SQL.Add('INSERT INTO administrador_movimiento (tipo,movimiento,sucursal,usuario,fecha)');
        ZQMovimiento.SQL.Add('VALUES ("Inicio de sesión.","El usuario '+FLogin.username.Text+' inicio sesion correctamente a las '+TimeToStr(Time())+'","'+getsucursal+'","'+FLogin.username.Text+'","'+FormatDateTime('YYYY/MM/DD',Date())+'")');
        ZQMovimiento.ExecSQL;
    end;
end;

procedure TFPrincipal.Garanta1Click(Sender: TObject);
begin
  FREGarantia.QRGarantia.PrinterSetup;
  FREGarantia.QRGarantia.Print;
end;

procedure TFPrincipal.GetSystemDPI(var HorizDPI, VertDPI: Integer);
var
  DC: HDC;
begin
  DC := GetDC(0);
  try
    HorizDPI := GetDeviceCaps(DC, LOGPIXELSX);
    VertDPI := GetDeviceCaps(DC, LOGPIXELSY);
  finally
    ReleaseDC(0, DC);
  end;
end;

procedure TFPrincipal.Image1Click(Sender: TObject);
begin
// agregar codigo de boton
    try
        FAlmacenLocal.Enabled := false;
        FAlmacenLocal := TFAlmacenLocal.Create(self);
        FAlmacenLocal.ShowModal;
    finally
        FAlmacenLocal.Free;
    end;
end;

procedure TFPrincipal.Image2Click(Sender: TObject);
begin
    try
        F_Recargas.Enabled := false;
        F_Recargas := TF_Recargas.Create(self);
        F_Recargas.ShowModal;
    finally
        F_Recargas.Free;
    end;
end;

procedure TFPrincipal.Image3Click(Sender: TObject);
begin
    try
        FGarantias.Enabled := false;
        FGarantias := TFGarantias.Create(self);
        FGarantias.ShowModal;
    finally
        FGarantias.Free;
    end;
end;

procedure TFPrincipal.Image4Click(Sender: TObject);
begin
    try
        FReparaciones.Enabled := false;
        FReparaciones := TFReparaciones.Create(self);
        FReparaciones.ShowModal;
    finally
        FReparaciones.Free;
    end;
end;

procedure TFPrincipal.Image5Click(Sender: TObject);
begin
    try
        if application.MessageBox (pchar('¿Desea salir del programa?'), pchar('Confirmar'), (MB_YESNO + MB_ICONQUESTION)) = IDYES then
        begin
            if idNivel = 3 then
            begin
            ZQMovimiento.Close;
            ZQMovimiento.SQL.Clear;
            ZQMovimiento.SQL.Add('INSERT INTO empleado_movimiento (movimiento,movimiento_detalles,sucursal,empleado,fecha,host,userpc)');
            ZQMovimiento.SQL.Add('VALUES ("Salida del programa.","El usuario '+FLogin.username.Text+' dejó de usar el sistema el dia '+DateToStr(Date())+' a las '+TimeToStr(Time())+'","'+sucursal+'","'+FLogin.username.Text+'","'+FormatDateTime('YYYY/MM/DD',Date())+'","'+getHostName()+'","'+GetUserFromWindows()+'")');
            ZQMovimiento.ExecSQL;
            FLogin.Close;
{            FLogin.Free;
            FLogin := nil;}
            end
            else if idNivel = 2 then
            begin
            ZQMovimiento.Close;
            ZQMovimiento.SQL.Clear;
            ZQMovimiento.SQL.Add('INSERT INTO administrador_movimiento (tipo,movimiento,sucursal,usuario,fecha)');
            ZQMovimiento.SQL.Add('VALUES ("Salida del programa.","El usuario '+FLogin.username.Text+' dejó de usar el sistema el dia '+DateToStr(Date())+' a las '+TimeToStr(Time())+'","'+sucursal+'","'+FLogin.username.Text+'","'+FormatDateTime('YYYY/MM/DD',Date())+'")');
            ZQMovimiento.ExecSQL;
            FLogin.Close;
{            FLogin.Free;
            FLogin := nil;}
            end;
        end;
    finally
        ZQMovimiento.Free;
    end;
end;

function TFPrincipal.InetIsOffline(Flag: Integer): Boolean;
begin
if InetIsOffline(0) then
   ShowMessage('This computer is not connected to Internet!')
else
   ShowMessage('You are connected to Internet!');
end;

procedure TFPrincipal.Iniciar1Click(Sender: TObject);
begin
    if (idNivel = 1) or (idNivel = 2) then
    begin
        FMain.Enabled := false;
        FMain := TFMain.Create(self);
        FMain.ShowModal();
    end else
    if (idNivel = 3) then
    begin
        FALogin.Enabled := false;
        FALogin := TFALogin.Create(self);
        FALogin.ShowModal();
    end;
end;

procedure TFPrincipal.Inventario1Click(Sender: TObject);
begin
    FRAlmacen.QRAlmacen.PrinterSetup;
    FRAlmacen.QRAlmacen.Print;
    //FRAlmacen.QRAlmacen.Preview;
end;

procedure TFPrincipal.Reparacin2Click(Sender: TObject);
begin
    FREReparacion.QRReparacion.PrinterSetup;
    FREReparacion.QRReparacion.Print;
end;

procedure TFPrincipal.Salir2Click(Sender: TObject);
begin
    try
        if application.MessageBox (pchar('¿Desea salir del programa?'), pchar('Confirmar'), (MB_YESNO + MB_ICONQUESTION)) = IDYES then
        begin
            if idNivel = 3 then
            begin
                ZQMovimiento.Close;
                ZQMovimiento.SQL.Clear;
                ZQMovimiento.SQL.Add('INSERT INTO empleado_movimiento (movimiento,movimiento_detalles,sucursal,empleado,fecha,host,userpc)');
                ZQMovimiento.SQL.Add('VALUES ("Salida del programa.","El usuario '+FLogin.username.Text+' dejó de usar el sistema el dia '+DateToStr(Date())+' a las '+TimeToStr(Time())+'","'+sucursal+'","'+FLogin.username.Text+'","'+FormatDateTime('YYYY/MM/DD',Date())+'","'+getHostName()+'","'+GetUserFromWindows()+'")');
                ZQMovimiento.ExecSQL;
                FLogin.Close;
{                FLogin.Free;
                FLogin := nil;}
            end
            else if idNivel = 2 then
            begin
                ZQMovimiento.Close;
                ZQMovimiento.SQL.Clear;
                ZQMovimiento.SQL.Add('INSERT INTO administrador_movimiento (tipo,movimiento,sucursal,usuario,fecha)');
                ZQMovimiento.SQL.Add('VALUES ("Salida del programa.","El usuario '+FLogin.username.Text+' dejó de usar el sistema el dia '+DateToStr(Date())+' a las '+TimeToStr(Time())+'","'+sucursal+'","'+FLogin.username.Text+'","'+FormatDateTime('YYYY/MM/DD',Date())+'")');
                ZQMovimiento.ExecSQL;
                FLogin.Close;
{                FLogin.Free;
                FLogin := nil;}
            end;
        end;
    finally
        ZQMovimiento.Free;
    end;
end;


procedure TFPrincipal.scaleForm(F: TForm; ScreenWidth, ScreenHeight: Integer);
begin
F.Scaled := True;
   F.AutoScroll := False;
   F.Position := poScreenCenter;
   F.Font.Name := 'Arial';
   if (Screen.Width <> ScreenWidth) then begin
     F.Height :=
         LongInt(F.Height) * LongInt(Screen.Height)
         div ScreenHeight;
     F.Width :=
         LongInt(F.Width) * LongInt(Screen.Width)
         div ScreenWidth;
     F.ScaleBy(Screen.Width,ScreenWidth) ;
   end;
end;

procedure TFPrincipal.Timer1Timer(Sender: TObject);
begin
    StatusBar1.Panels[1].Text := TimeToStr(Time());
end;

procedure TFPrincipal.Vercelularesasignados1Click(Sender: TObject);
begin
    F_Recargas.Enabled := false;
    F_Recargas := TF_Recargas.Create(self);
    F_Recargas.ShowModal;
end;

procedure TFPrincipal.Verequiposenalmacen1Click(Sender: TObject);
begin
    FAlmacenLocal.Enabled := false;
    FAlmacenLocal := TFAlmacenLocal.Create(self);
    FAlmacenLocal.ShowModal;
end;

procedure TFPrincipal.Verequiposengaranta1Click(Sender: TObject);
begin
    FGarantias.Enabled := false;
    FGarantias := TFGarantias.Create(self);
    FGarantias.ShowModal;
end;

procedure TFPrincipal.Verequiposenreparacin1Click(Sender: TObject);
begin
    FReparaciones.Enabled := false;
    FReparaciones := TFReparaciones.Create(self);
    FReparaciones.ShowModal;
end;

end.
