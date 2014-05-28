unit splashScreen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, ComCtrls, jpeg, ExtCtrls, pngimage;

type
  TSplashForm = class(TForm)
    Label4: TLabel;
    Image1: TImage;
    Label5: TLabel;
    ProgressBar1: TProgressBar;
    ver: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    function getFormsCount(): Integer;
    { Public declarations }
  end;

var
  SplashForm: TSplashForm;

implementation

{$R *.dfm}

procedure TSplashForm.FormCreate(Sender: TObject);
begin
  progressBar1.Min := 0;
//  progressBar1.Max := 10;
  progressBar1.Step := 1;
end;

procedure TSplashForm.FormShow(Sender: TObject);
var
  verblock:PVSFIXEDFILEINFO;
  versionMS,versionLS:cardinal;
  verlen:cardinal;
  rs:TResourceStream;
  m:TMemoryStream;
  p:pointer;
  s:cardinal;
//  myDate : TDateTime;
begin
  m:=TMemoryStream.Create;
  try
//    myDate := Now();
//    FormatSettings.LongDateFormat := 'dddd dd '+#100+#101+' mmmm '+#100+#101+#108+' yyyy';
{    FormatSettings.LongDateFormat := 'dddd dd - mmmm - yyyy';
    FormatSettings.LongDayNames[1]    := 'Domingo';
    FormatSettings.LongMonthNames[6]  := 'Junio';
    FormatSettings.LongTimeFormat     := 'hh : nn : ss . zzz';}
//    FormatDateTime('dddddd', myDate);
//    fechalarga.Caption := FormatDateTime('dddddd', myDate);

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
        ver.Caption := 'v'+
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
    //ShowMessage('Numero de formularios: '+IntToStr(getFormsCount));
    //ShowMessage('Numero de componentes: '+IntToStr(Application.ComponentCount));
  end;
end;

function TSplashForm.getFormsCount: Integer;
var
    i : Integer;
begin
    Result := 0;
    try
        for i:=0 to Application.ComponentCount-1 do
        begin
          if (Application.Components[i] is TForm) and
          (Application.Components[i] <> Application.MainForm) then
           Inc(Result);
        end;
    except
            Result := 1;
    end;
end;

end.
