unit FA_Login;

interface

uses
  Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, pngimage, ExtCtrls, WinInet, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset,uCore;

type
  TFALogin = class(TForm)
    BitBtn1: TBitBtn;
    usuario: TEdit;
    passw: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Image1: TImage;
    ZQAdmin: TZQuery;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ZQLog : TZQuery;
    idNivel : Integer;
    function isConnected: Boolean;
  end;

const
    INTERNET_CONNECTION_CONFIGURED = $40; //:[ Local system has a valid connection to the Internet, but it might or might not be currently connected.
    INTERNET_CONNECTION_LAN = $02;     //:[  Local system uses a local area network to connect to the Internet.
    INTERNET_CONNECTION_MODEM = $01;     //:[  Local system uses a modem to connect to the Internet
    INTERNET_CONNECTION_OFFLINE = $20;     //:[  Local system is in offline mode.
    INTERNET_CONNECTION_PROXY = $04;     //:[  Local system uses a proxy server to connect to the Internet
    INTERNET_RAS_INSTALLED = $10;     // Local system has RAS installed.
var
  FALogin: TFALogin;

implementation
uses
    F_PrincipalAdmin,F_Main, Windows, ZDbcIntfs,FPrincipalEmpleados
    , F_Login;

{$R *.dfm}

procedure TFALogin.BitBtn1Click(Sender: TObject);
var
  u,p : String;
  n: Integer;

begin
    try
        u := usuario.Text;
        p := passw.Text;

        ZQAdmin.Close;
        ZQAdmin.SQL.Clear;
        ZQAdmin.SQL.Add('SELECT idempleado, empleado, idsucursal,idnivel FROM empleado');
        ZQAdmin.SQL.Add('WHERE empleado="'+u+'" AND password="'+p+'"');
        ZQAdmin.ExecSQL;
        ZQAdmin.Open;

        n := ZQAdmin.FieldByName('idnivel').AsInteger;
        idNivel := n;

        if (n = 3) then
        begin
            ShowMessage('Ud. no cuenta con privilegios suficientes para acceder al panel de administradores.');
            ZQLog.Close;
            ZQLog.SQL.Clear;
            ZQLog.SQL.Add('INSERT INTO empleado_movimiento (movimiento,movimiento_detalles,sucursal,empleado,fecha,host,userpc)');
            ZQLog.SQL.Add('VALUES ("Intento de login.","El usuario '+FLogin.username.Text+' intentó iniciar sesión como administrador el día '+DateToStr(Date())+' a las '+TimeToStr(Time())+' (privilegios insuficientes)","'+FPrincipal.sucursal+'","'+FLogin.username.Text+'","'+FormatDateTime('YYYY/MM/DD',Date())+'","'+getHostName()+'","'+getUserFromWindows()+'")');
            ZQLog.ExecSQL;
        end
        else if (ZQAdmin.FieldByName('idempleado').IsNull = true) then
        begin
            ShowMessage('Usuario o contraseña incorrectos. Intente de nuevo.');
            ZQLog.Close;
            ZQLog.SQL.Clear;
            ZQLog.SQL.Add('INSERT INTO empleado_movimiento (movimiento,movimiento_detalles,sucursal,empleado,fecha,host,userpc)');
            ZQLog.SQL.Add('VALUES ("Intento de login.","El usuario '+FLogin.username.Text+' intentó iniciar sesión como administrador el día '+DateToStr(Date())+' a las '+TimeToStr(Time())+' (datos incorrectos)","'+FPrincipal.sucursal+'","'+FLogin.username.Text+'","'+FormatDateTime('YYYY/MM/DD',Date())+'","'+getHostName()+'","'+GetUserFromWindows()+'")');
            ZQLog.ExecSQL;
        end
        else if
        (ZQAdmin.FieldByName('idempleado').IsNull = false) or
        (FPrincipal.idNivel = 1) or
        (FPrincipal.idNivel = 2) or
        (n = 2) or
        (n = 1) then
        begin
          FALogin.Visible := false;
          FMain.Enabled := false;
          FMain := TFMain.Create(self);
          FMain.ShowModal;
        end;
    except
    on E: EZSQLException do
    begin
        ZQLog.Close;
        ZQLog.SQL.Clear;
        ZQLog.SQL.Add('INSERT INTO administrador_movimiento (tipo,movimiento,sucursal,usuario,fecha)');
        ZQLog.SQL.Add('VALUES ("Error SQL.","El sistema presento un error el dia '+DateToStr(Date())+' a las '+TimeToStr(Time())+'","'+FPrincipal.sucursal+'","'+usuario.Text+'","'+FormatDateTime('YYYY/MM/DD',Date())+'")');
        ZQLog.ExecSQL;
        raise Exception.Create('Error: No se ha podido conectar a la base de datos.'+#13'Contacte al desarrollador del sistema.');
    end;

    end;
end;

procedure TFALogin.FormShow(Sender: TObject);
begin
    ZQLog := TZQuery.Create(self);
    ZQLog.Connection := FPrincipal.ZConexion;
end;

function TFALogin.isConnected: Boolean;
var
    InetState: DWORD;
    hHttpSession, hReqUrl: HInternet;
begin
    Result := InternetGetConnectedState(@InetState, 0);
    if (Result and (InetState and INTERNET_CONNECTION_CONFIGURED = INTERNET_CONNECTION_CONFIGURED) ) then
    begin
    //:[ So far we ONLY know there's a valid connection, so see if we can grab a known URL
        hHttpSession := InternetOpen( PChar(Application.Title), INTERNET_OPEN_TYPE_PRECONFIG, nil, nil, 0);
    try
        hReqUrl := InternetOpenURL(hHttpSession, 'http://www.google.com', nil, 0,0,0);
        Result := hReqUrl <> nil;
        InternetCloseHandle(hReqUrl);
    finally
        InternetCloseHandle(hHttpSession);
    end;
    end
    else if (InetState and INTERNET_CONNECTION_OFFLINE = INTERNET_CONNECTION_OFFLINE) then
        Result := False; //:[ We know for sure we are offline so return false
end;

end.
