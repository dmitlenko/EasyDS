unit main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, ShellApi, Vcl.Menus,
  Vcl.ExtCtrls, Vcl.ComCtrls, about, inifiles, IOUtils;

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
    Githubpage1: TMenuItem;
    procedure creatorUrlClick(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure enableRconCheckClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure selectserverfolderClick(Sender: TObject);
    procedure Githubpage1Click(Sender: TObject);
    procedure openServerFolderButtonClick(Sender: TObject);
    procedure scanMaps();
    procedure startButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  mainForm: TmainForm;
  SERVERPATH: String;

implementation

{$R *.dfm}


procedure TmainForm.scanMaps();
var
  path: String;
begin
  for path in TDirectory.GetFiles(SERVERPATH + '\\csgo\\maps\\') do
  begin
    if ExtractFileExt(path) = '.bsp' then mapBox.Items.Add(ChangeFileExt(ExtractFileName(path),''));
  end;
end;

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
    appINI.WriteString('Main','path',SERVERPATH);
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
    //server folder
    if appINI.ReadString('Main','path','') = '' then
    begin
      with TFileOpenDialog.Create(nil) do
      try
        Options := [fdoPickFolders];
        if Execute then
        begin
          if FileExists(FileName + '\\srcds.exe') then
          begin
            SERVERPATH := FileName;
          end
          else
          begin
            ShowMessage('srcds.exe not found!');
            FormCreate(Sender);
          end;
        end
        else
        begin
          Application.Terminate;
        end;

      finally
        Free;
      end;
    end
    else
    begin
      SERVERPATH := appINI.ReadString('Main','path','');
    end;
    //server settings
    serverName.Text := appINI.ReadString('Server','name','Counter-Strike Server');
    password.Text := appINI.ReadString('Server','pass','');
    port.Text := appINI.ReadString('Server','port','27015');
    lanOnly.Checked := appINI.ReadBool('Server','lanonly',True);
    //rcon settings
    enableRconCheck.Checked := appINI.ReadBool('RCON','enabled',True);
    rconPass.Enabled := enableRconCheck.Checked;
    rconPass.Text := appINI.ReadString('RCON','password','');
    //maps scan
    scanMaps();
    //game settings
    mapBox.ItemIndex := appINI.ReadInteger('Game','map',-1);
    gamemodeBox.ItemIndex := appINI.ReadInteger('Game','mode',0);
    bots.Text := IntToStr(appINI.ReadInteger('Game','bots',0));
    botsSkill.ItemIndex := appINI.ReadInteger('Game','botsskill',0);
  finally
    appINI.Free;
  end;
end;



procedure TmainForm.Githubpage1Click(Sender: TObject);
begin
  ShellExecute(self.WindowHandle,'open','https://github.com/dmitlenko/easy_ds',nil,nil, SW_SHOWNORMAL);
end;

procedure TmainForm.openServerFolderButtonClick(Sender: TObject);
begin
  ShellExecute(0, nil, 'explorer.exe', PChar(SERVERPATH), nil, SW_SHOWNORMAL);
end;

procedure TmainForm.selectserverfolderClick(Sender: TObject);
begin
  with TFileOpenDialog.Create(nil) do
  try
    Options := [fdoPickFolders];
    if Execute then
    begin
      if FileExists(FileName + '\\srcds.exe') then
      begin
        SERVERPATH := FileName;
      end
      else
      begin
        ShowMessage('srcds.exe not found!');
        selectserverfolderClick(Sender);
      end;
    end;

  finally
    Free;
  end;
end;

procedure TmainForm.startButtonClick(Sender: TObject);
var
  arguments: String;
begin
  arguments := '-game csgo -console -usercon ';

  case gamemodeBox.ItemIndex of
    0: arguments := arguments + '+game_type 0 +game_mode 0 ';
    1: arguments := arguments + '+game_type 0 +game_mode 1 ';
    2: arguments := arguments + '+game_type 0 +game_mode 2 ';                                               `
    3: arguments := arguments + '+game_type 1 +game_mode 0 ';
    4: arguments := arguments + '+game_type 1 +game_mode 1 ';
    5: arguments := arguments + '+game_type 1 +game_mode 2 ';
    6: arguments := arguments + '+game_type 3 ';
    7: arguments := arguments + '+game_type 4 +game_mode 0 ';
    8: arguments := arguments + '+game_type 4 +game_mode 1 ';
    9: arguments := arguments + '+game_type 6 +game_mode 0 ';
  end;

  arguments := arguments + '+mapgroup mg_' + mapBox.Items[mapBox.ItemIndex] + ' +map ' + mapBox.Items[mapBox.ItemIndex] + ' ';
  arguments := arguments + '+hostname ' + serverName.Text + ' -maxplayers_override ' + maxPlayers.Text + ' ';
  arguments := arguments + '-port ' + port.Text + ' +sv_password ' + password.Text + ' ';
  arguments := arguments + '+bot_quota ' + bots.Text + ' +bot_difficulty ' + IntToStr(botsSkill.ItemIndex) + ' ';

  if enableRconCheck.Checked then
  begin
    arguments := arguments + '+rcon_password ' + rconPass.Text + ' ';
  end;

  arguments := arguments + '+sv_lan ' + IntToStr(StrToInt(BoolToStr(lanOnly.Checked))*-1) + ' -tickrate 128';

  //ShowMessage(arguments);

  ShellExecute(0, nil, PChar(SERVERPATH + '\\srcds.exe'), PChar(arguments), nil, SW_SHOWNORMAL);
end;

end.
