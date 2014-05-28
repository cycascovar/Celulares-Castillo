unit C_Recargas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, dblookup, DBCtrls, Grids, DBGrids, ucore, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TCRecargas = class(TForm)
    txtcodigos: TMemo;
    Button1: TButton;
    listaSucursales: TDBLookupComboBox;
    Label1: TLabel;
    Label2: TLabel;
    gridCodigosRecargas: TDBGrid;
    txtsucursal: TEdit;
    Label3: TLabel;
    DSRecargas: TDataSource;
    ZQRecargas: TZQuery;
    ZQSucursales: TZQuery;
    DSSucursales: TDataSource;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CRecargas: TCRecargas;

implementation

{$R *.dfm}

procedure TCRecargas.Button1Click(Sender: TObject);
var
  i : Integer;
begin
  // Insertar un codigo por linea para asignarlos a una sucursal
  i := 0;
  while i < txtcodigos.Lines.Count do
  begin
    ShowMessage(txtcodigos.Lines.Strings[i]);
    i := i + 1;
  end;

end;

procedure TCRecargas.FormCreate(Sender: TObject);
begin
  setTitleWindow(self,'Sistema para administradores: Catalogo de codigos de recargas');
end;

end.
