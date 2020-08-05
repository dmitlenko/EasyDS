unit configure;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TconfigureForm = class(TForm)
    startButton: TButton;
    serverFolder: TEdit;
    chooseServerFolder: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  configureForm: TconfigureForm;

implementation

{$R *.dfm}

end.
