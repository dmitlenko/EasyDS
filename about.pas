unit about;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TaboutForm = class(TForm)
    line1: TLabel;
    Label1: TLabel;
    version: TLabel;
    creatorUrl: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  aboutForm: TaboutForm;

implementation

{$R *.dfm}

end.
