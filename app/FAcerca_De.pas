unit FAcerca_De;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, pngimage;

type
  TFAcercaDe = class(TForm)
    Label5: TLabel;
    LinkLabel1: TLinkLabel;
    Label6: TLabel;
    sucursal: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    ver: TLabel;
    Label1: TLabel;
    Button1: TButton;
    procedure FormClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure LinkLabel1Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    ZQSucursal : TZQuery;
  public
    { Public declarations }
  end;

var
    FAcercaDe: TFAcercaDe;

implementation
uses
    FPrincipalEmpleados;

{$R *.dfm}

procedure TFAcercaDe.Button1Click(Sender: TObject);
begin
    FAcercaDe.Close;
end;

procedure TFAcercaDe.FormClick(Sender: TObject);
begin
    FAcercaDe.Close;
end;

procedure TFAcercaDe.FormShow(Sender: TObject);
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
          Ver.Caption:=ver.Caption;
  finally
    m.Free;
  end;


    sucursal.Caption := FPrincipal.sucursal;
    sucursal.Update;
end;

procedure TFAcercaDe.Image1Click(Sender: TObject);
begin
    FAcercaDe.Close;
end;

procedure TFAcercaDe.LinkLabel1Click(Sender: TObject);
begin
    //agregar un link para enviar un correo
end;

end.
