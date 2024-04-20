unit GlobalData_u;



interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

  var
  GlobalEmail: string = '';

type
  TForm3 = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
    procedure displayLogin;
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}
procedure TForm3.displayLogin;
begin

end;

end.
