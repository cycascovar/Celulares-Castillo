unit FRecargas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, Menus, StdCtrls, Buttons, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ComCtrls,
  IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl, IWControl, IWCompLabel,
  IWDBStdCtrls, ExtCtrls,uCore, DBCtrls, pngimage;

type
  TF_Recargas = class(TForm)
    codigo: TEdit;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    ZQuery1: TZQuery;
    DataSource1: TDataSource;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    celulares: TMemo;
    Button3: TButton;
    ZQRecargas: TZQuery;
    DSRecargas: TDataSource;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    _codigogenerado: TLabel;
    Image6: TImage;
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure codigoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Recargas: TF_Recargas;

implementation
uses FPrincipalEmpleados;
{$R *.dfm}

procedure TF_Recargas.BitBtn1Click(Sender: TObject);
begin
    F_Recargas.Close;
end;

procedure TF_Recargas.Button1Click(Sender: TObject);
var
    codigo : String;
    i,x : Integer;
    ZQllenado : TZQuery;
begin
    //evitar que se repitan las tuplas
    ZQllenado := TZQuery.Create(self);
    ZQLlenado.Connection := FPrincipal.ZConexion;

    //aqui algoritmo para generar los codigos
    ZQLlenado.Close;
    for i := 0 to 200 do
    begin
        codigo := '900';
        x := Random(400);
        codigo := codigo + IntToStr(x);

        if (Length(codigo)) = 5 then
            codigo := codigo + '00'
        else
        if (Length(codigo)) = 4 then
            codigo := codigo + '000'
        else if (Length(codigo)) = 6 then
             codigo := codigo + '0';

        ZQLlenado.SQL.Clear;
        ZQLlenado.SQL.Add('INSERT INTO codigo_recarga (codigo_recarga)');
        ZQLlenado.SQL.Add('VALUES ('+codigo+')');
        ZQLlenado.ExecSQL;
        codigo := '';
    end;
    ZQLlenado.Free;
end;

procedure TF_Recargas.Button3Click(Sender: TObject);
var
    k : Integer;
    numeros : String;
begin
  numeros := celulares.Text;
  if celulares.Text <> '' then
  begin
    if application.MessageBox (pchar('¿Desea asignar el codigo a los celulares marcados?'), pchar('Confirmar'), (MB_YESNO + MB_ICONQUESTION)) = IDYES then
    begin
        // Actualizar el caption del codigo generado por otro nuevo y volver a refrescar el grid
        ZQRecargas.Close;
        ZQRecargas.SQL.Clear;
        ZQRecargas.SQL.Add('SELECT codigo_recarga AS Codigo');
        ZQRecargas.SQL.Add('FROM codigo_recarga');
        ZQRecargas.SQL.Add('WHERE celular IS NULL');
        ZQRecargas.SQL.Add('AND sucursal = "'+FPrincipal.sucursal+'"');
        ZQRecargas.ExecSQL;
        ZQRecargas.Open;
        _codigoGenerado.Caption := ZQRecargas.FieldByName('Codigo').AsString;

        for k := Length(numeros) downto 1 do
        begin
            if (numeros[k] = ',') then
                Insert('\',numeros,k);
        end;

        ZQRecargas.Close;
        ZQRecargas.SQL.Clear;
        ZQRecargas.SQL.Add('UPDATE codigo_recarga');
        ZQRecargas.SQL.Add('SET celular = "'+numeros+'", sucursal = "'+FPrincipal.sucursal+'"');
        ZQRecargas.SQL.Add('WHERE codigo_recarga="'+_codigoGenerado.Caption+'"');
        ZQRecargas.ExecSQL;

        // Actualizar el caption del codigo generado por otro nuevo y volver a refrescar el grid
        ZQRecargas.Close;
        ZQRecargas.SQL.Clear;
        ZQRecargas.SQL.Add('SELECT codigo_recarga AS Codigo');
        ZQRecargas.SQL.Add('FROM codigo_recarga');
        ZQRecargas.SQL.Add('WHERE celular IS NULL');
        ZQRecargas.SQL.Add('AND sucursal = "'+FPrincipal.sucursal+'"');
        ZQRecargas.ExecSQL;
        ZQRecargas.Open;
        _codigoGenerado.Caption := ZQRecargas.FieldByName('Codigo').AsString;

        ZQuery1.Close;
        ZQuery1.SQL.Clear;
        ZQuery1.SQL.Add('SELECT codigo_recarga AS Codigo, celular As "Celulares asignados"');
        ZQuery1.SQL.Add('FROM codigo_recarga');
        ZQuery1.SQL.Add('WHERE sucursal = "'+FPrincipal.sucursal+'"');
        ZQuery1.SQL.Add('AND celular IS NOT NULL');
        ZQuery1.ExecSQL;
        ZQuery1.Open;
        DBGrid1.Refresh;

        celulares.Clear;


    end;
  end else
  begin
    raise Exception.Create('Error: Falta asignar al menos un celular.');
  end;

end;

procedure TF_Recargas.codigoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    ZQuery1.Filtered := false;
    ZQuery1.Filter := 'Codigo LIKE'+QuotedStr('*'+codigo.Text+'*');
    ZQuery1.Filtered := true;
end;

procedure TF_Recargas.FormShow(Sender: TObject);
begin
    StatusBar1.Panels[0].Text := DateToStr(Date()); //fecha
    StatusBar1.Panels[0].Width := 70;
    setTitleWindow(self,'Códigos de recargas - Celulares "Castillo", (sucursal '+FPrincipal.sucursal+')');

    //Escoger un codigo aleatorio que esté disponible, que pertenezca a tal sucursal
    ZQRecargas.Close;
    ZQRecargas.SQL.Clear;
    ZQRecargas.SQL.Add('SELECT codigo_recarga AS Codigo');
    ZQRecargas.SQL.Add('FROM codigo_recarga');
    ZQRecargas.SQL.Add('WHERE celular IS NULL');
    ZQRecargas.SQL.Add('AND sucursal = "'+FPrincipal.sucursal+'"');
    ZQRecargas.ExecSQL;
    ZQRecargas.Open;

    _codigoGenerado.Caption := ZQRecargas.FieldByName('Codigo').AsString;

    // Muestra los codigos asignados en el grid para x sucursal
    ZQuery1.Close;
    ZQuery1.SQL.Clear;
    ZQuery1.SQL.Add('SELECT codigo_recarga AS Codigo, celular As "Celulares asignados"');
    ZQuery1.SQL.Add('FROM codigo_recarga');
    ZQuery1.SQL.Add('WHERE sucursal = "'+FPrincipal.sucursal+'"');
    ZQuery1.SQL.Add('AND celular IS NOT NULL');
    ZQuery1.SQL.Add('ORDER BY 1');
    ZQuery1.ExecSQL;
    ZQuery1.Open;
    DBGrid1.Refresh;

end;

procedure TF_Recargas.Timer1Timer(Sender: TObject);
begin
    StatusBar1.Panels[1].Text := TimeToStr(Time());
end;

end.
