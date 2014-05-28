unit F_About;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, pngimage, uCore;

type
  TFAbout = class(TForm)
    Label5: TLabel;
    sucursal: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    ver: TLabel;
    Label1: TLabel;
    Image1: TImage;
    Label7: TLabel;
    Image2: TImage;
    Label8: TLabel;
    Image3: TImage;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAbout: TFAbout;

implementation
uses
    FPrincipalEmpleados;

{$R *.dfm}

procedure TFAbout.Button1Click(Sender: TObject);
begin
    FAbout.Close;
end;

procedure TFAbout.FormClick(Sender: TObject);
begin
    FAbout.Close;
end;

procedure TFAbout.FormCreate(Sender: TObject);
begin
  setTitleWindow(self,'Acerca de este sistema (sucursal '+getsucursal+')');
  Label7.Caption := '(045) 771 214-9235';
  Label8.Caption := 'cycascovar@hotmail.com';
end;

procedure TFAbout.FormShow(Sender: TObject);
var
  verblock:PVSFIXEDFILEINFO;
  versionMS,versionLS:cardinal;
  verlen:cardinal;
  rs:TResourceStream;
  m:TMemoryStream;
  p:pointer;
  s:cardinal;
begin
  m:=TMemoryStream.Create;
  try
    rs:=TResourceStream.CreateFromID(HInstance,1,RT_VERSION);
    try
      m.CopyFrom(rs,rs.Size);
    finally
      rs.Free;
    end;
    m.Position:=0;
    if VerQueryValue(m.Memory,'\',pointer(verblock),verlen) then
      begin
        VersionMS:=verblock.dwFileVersionMS;
        VersionLS:=verblock.dwFileVersionLS;
        ver.Caption :=
          IntToStr(versionMS shr 16)+'.'+
          IntToStr(versionMS and $FFFF)+'.'+
          IntToStr(VersionLS shr 16)+'.'+
          IntToStr(VersionLS and $FFFF);
      end;
    if VerQueryValue(m.Memory,PChar('\\StringFileInfo\\'+
      IntToHex(GetThreadLocale,4)+IntToHex(GetACP,4)+'\\FileDescription'),p,s) or
        VerQueryValue(m.Memory,'\\StringFileInfo\\040904E4\\FileDescription',p,s) then //en-us
        begin
          Ver.Caption:=ver.Caption;
        end;
  finally
    m.Free;
  end;
    sucursal.Caption := getSucursal();
end;

end.
