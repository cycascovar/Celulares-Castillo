unit CClientesVentas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, uCore;

type
  TForm1 = class(TForm)
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  SetTitleWindow(self,'Catálogo de clientes de ventas - Sistema para administradores');
  label1.Caption := 'Catálogo de Clientes de ventas.';
  label2.Caption := 'Catálogo de Clientes de ventas para la sucursal '+getSucursal;
end;

end.
