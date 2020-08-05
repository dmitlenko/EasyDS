unit main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, ShellApi, Vcl.Menus,
  Vcl.ExtCtrls, Vcl.ComCtrls, about, inifiles;

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
    port: TEdit;
    portLabel: TLabel;
    password: TEdit;
    passwordLabel: TLabel;
    serverName: TEdit;
    serverNameLabel: TLabel;
    enableRconCheck: TCheckBox;
    rconPass: TEdit;
    lanOnly: TCheckBox;
    version: TLabel;
    gameSettings: TGroupBox;
    mapLabel: TLabel;
    mapBox: TComboBox;
    gamemodeLabel: TLabel;
    gamemodeBox: TComboBox;
    maxPlayersLabel: TLabel;
    maxPlayers: TEdit;
    botsLabel: TLabel;
    bots: TEdit;
    botsSkill: TComboBox;
    botsSkillLabel: TLabel;
    procedure creatorUrlClick(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure enableRconCheckClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    SERVERDIR:String;
  public
    { Public declarations }
  end;

var
  mainForm: TmainForm;

implementation

{$R *.dfm}

procedure TmainForm.About1Click(Sender: TObject);
begin
  aboutForm.ShowModal;
end;

procedure TmainForm.creatorUrlClick(Sender: TObject);
begin
  ShellExecute(self.WindowHandle,'open','https://github.com/dmitlenko/easy_ds',nil,nil, SW_SHOWNORMAL);
end;


procedure TmainForm.enableRconCheckClick(Sender: TObject);
begin
  rconPass.Enabled := enableRconCheck.Checked;
end;

procedure TmainForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
  appINI : TIniFile;
begin
  appINI := TIniFile.Create(ChangeFileExt(Application.ExeName,'.ini')) ;
  try
    //server settings
    appINI.WriteString('Server','name',serverName.Text);
    appINI.WriteString('Server','pass',password.Text);
    appINI.WriteString('Server','port',port.Text);
    appINI.WriteBool('Server','lanonly',lanOnly.Checked);
    //rcon settings
    appINI.WriteBool('RCON','enabled',enableRconCheck.Checked);
    appINI.WriteString('RCON','password',rconPass.Text);
    //game settings
    appINI.WriteInteger('Game','map',mapBox.ItemIndex);
    appINI.WriteInteger('Game','mode',gamemodeBox.ItemIndex);
    appINI.WriteInteger('Game','botsskill',botsSkill.ItemIndex);
    appINI.WriteInteger('Game','bots',StrToInt(bots.Text));
  finally
    appIni.Free;
  end;
end;

procedure TmainForm.FormCreate(Sender: TObject);
var
  appINI : TIniFile;
begin
  appINI := TIniFile.Create(ChangeFileExt(Application.ExeName,'.ini')) ;
  try
    //server settings
    serverName.Text := appINI.ReadString('Server','name','Counter-Strike Server');
    password.Text := appINI.ReadString('Server','pass','');
    port.Text := appINI.ReadString('Server','port','27015');
    lanOnly.Checked := appINI.ReadBool('Server','lanonly',True);
    //rcon settings
    enableRconCheck.Checked := appINI.ReadBool('RCON','enabled',True);
    rconPass.Enabled := enableRconCheck.Checked;
    rconPass.Text := appINI.ReadString('RCON','password','');
    //game settings
    mapBox.ItemIndex := appINI.ReadInteger('Game','map',-1);
    gamemodeBox.ItemIndex := appINI.ReadInteger('Game','mode',0);
    bots.Text := IntToStr(appINI.ReadInteger('Game','bots',0));
    botsSkill.ItemIndex := appINI.ReadInteger('Game','botsskill',0);
  finally
    appINI.Free;
  end;
end;



end.
