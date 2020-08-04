unit main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, ShellApi, Vcl.Menus,
  Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TmainForm = class(TForm)
    startButton: TButton;
    openServerFolderButton: TButton;
    creatorUrl: TLabel;
    mainMenu: TMainMenu;
    options: TMenuItem;
    selectserverfolder: TMenuItem;
    Help1: TMenuItem;
    About1: TMenuItem;
    mapLabel: TLabel;
    mapBox: TComboBox;
    port: TEdit;
    portLabel: TLabel;
    password: TEdit;
    passwordLabel: TLabel;
    Edit1: TEdit;
    serverNameLabel: TLabel;
    procedure creatorUrlClick(Sender: TObject);
    procedure About1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  mainForm: TmainForm;

implementation

{$R *.dfm}

uses about;



procedure TmainForm.About1Click(Sender: TObject);
begin
  aboutForm.ShowModal;
end;

procedure TmainForm.creatorUrlClick(Sender: TObject);
begin
  ShellExecute(self.WindowHandle,'open','https://github.com/dmitlenko/easy_ds',nil,nil, SW_SHOWNORMAL);
end;

end.
