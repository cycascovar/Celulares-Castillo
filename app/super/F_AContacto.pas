unit F_AContacto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TFAContacto = class(TForm)
    Edit1: TEdit;
    Contactar: TButton;
    Label1: TLabel;
    Label2: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Memo1: TMemo;
    Label3: TLabel;
    RadioButton3: TRadioButton;
    Label4: TLabel;
    Edit2: TEdit;
    StatusBar1: TStatusBar;
    procedure ContactarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAContacto: TFAContacto;

implementation

{$R *.dfm}

procedure TFAContacto.ContactarClick(Sender: TObject);
begin
    ShowMessage('Muchas gracias por ponerse en contacto con nosotros.'+#13+'Nos pondremos en contacto con Usted tan pronto como sea posible.'+#13+'Gracias por utilizar Celulares Castillo.');
end;

end.
