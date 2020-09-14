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
    lanOnly: TCheckBox;
    version: TLabel;
    gameSettings: TGroupBox;
    mapLabel: TLabel;
    mapBox: TComboBox;
    gamemodeLabel: TLabel;
    maxPlayersLabel: TLabel;
    maxPlayers: TEdit;
    botsLabel: TLabel;
    bots: TEdit;
    botsSkill: TComboBox;
    botsSkillLabel: TLabel;
    Githubpage1: TMenuItem;
    miscGroup: TGroupBox;
    gamemodeBox: TComboBox;
    onlyThisMapCheck: TCheckBox;
    mapgroupBox: TComboBox;
    mapgroupcaption: TLabel;
    tickRateBox: TComboBox;
    tickRateLabel: TLabel;
    cheatsCheck: TCheckBox;
    customArgumentsLabel: TLabel;
    customArgs: TEdit;
    friendlyFireCheck: TCheckBox;
    procedure creatorUrlClick(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure selectserverfolderClick(Sender: TObject);
    procedure Githubpage1Click(Sender: TObject);
    procedure openServerFolderButtonClick(Sender: TObject);
    procedure scanMaps();
    procedure startButtonClick(Sender: TObject);
    procedure onlyThisMapCheckClick(Sender: TObject);
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
    appINI.WriteInteger('Server','tickrate',tickRateBox.ItemIndex);
    //game settings
    appINI.WriteInteger('Game','map',mapBox.ItemIndex);
    appINI.WriteInteger('Game','mode',gamemodeBox.ItemIndex);
    appINI.WriteInteger('Game','botsskill',botsSkill.ItemIndex);
    appINI.WriteInteger('Game','bots',StrToInt(bots.Text));
    appINI.WriteInteger('Game','mapgroup',mapgroupBox.ItemIndex);
    appINI.WriteBool('Game','onlyselmap',onlyThisMapCheck.Checked);
    //misc settings
    appINI.WriteBool('Misc','cheats',cheatsCheck.Checked);
    appINI.WriteBool('Misc','friendlyfire',friendlyFireCheck.Checked);
    appINI.WriteString('Misc','customargs',customArgs.Text);
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
    tickRateBox.ItemIndex := appINI.ReadInteger('Server','tickrate',1);
    //maps scan
    scanMaps();
    //game settings
    mapBox.ItemIndex := appINI.ReadInteger('Game','map',0);
    gamemodeBox.ItemIndex := appINI.ReadInteger('Game','mode',0);
    bots.Text := IntToStr(appINI.ReadInteger('Game','bots',0));
    botsSkill.ItemIndex := appINI.ReadInteger('Game','botsskill',0);
    mapgroupBox.ItemIndex := appINI.ReadInteger('Game','mapgroup',0);

    onlyThisMapCheck.Checked := appINI.ReadBool('Game','onlyselmap',True);
    mapgroupBox.Enabled := not(onlyThisMapCheck.Checked);
    //misc settings
    cheatsCheck.Checked := appINI.ReadBool('Misc','cheats',False);
    friendlyFireCheck.Checked := appINI.ReadBool('Misc','friendlyfire',True);
    customArgs.Text := appINI.ReadString('Misc','customargs','');
  finally
    appINI.Free;
  end;
end;



procedure TmainForm.Githubpage1Click(Sender: TObject);
begin
  ShellExecute(self.WindowHandle,'open','https://github.com/dmitlenko/easy_ds',nil,nil, SW_SHOWNORMAL);
end;

procedure TmainForm.onlyThisMapCheckClick(Sender: TObject);
begin
  mapgroupBox.Enabled := not(onlyThisMapCheck.Checked);
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
  arguments,passwd: String;
begin
  arguments := '-game csgo -console -usercon ';

  case gamemodeBox.ItemIndex of
    0: arguments := arguments + '+game_type 0 +game_mode 0 ';
    1: arguments := arguments + '+game_type 0 +game_mode 1 ';
    2: arguments := arguments + '+game_type 0 +game_mode 2 ';
    3: arguments := arguments + '+game_type 1 +game_mode 0 ';
    4: arguments := arguments + '+game_type 1 +game_mode 1 ';
    5: arguments := arguments + '+game_type 1 +game_mode 2 ';
    6: arguments := arguments + '+game_type 3 ';
    7: arguments := arguments + '+game_type 4 +game_mode 0 ';
    8: arguments := arguments + '+game_type 4 +game_mode 1 ';
    9: arguments := arguments + '+game_type 6 +game_mode 0 ';
  end;

  if onlyThisMapCheck.Checked then
  begin
    arguments := arguments + '+mapgroup mg_' + mapBox.Items[mapBox.ItemIndex] + ' ';
  end
  else
  begin
    case mapGroupBox.ItemIndex of
      0:arguments := arguments + '+mapgroup mg_bomb ';
      1:arguments := arguments + '+mapgroup mg_hostage ';
      2:arguments := arguments + '+mapgroup mg_dust ';
      3:arguments := arguments + '+mapgroup mg_demolition ';
      4:arguments := arguments + '+mapgroup mg_armsrace ';
      5:arguments := arguments + '+mapgroup classic_random ';
    end;
  end;

  arguments := arguments + '+map ' + mapBox.Items[mapBox.ItemIndex] + ' ';
  arguments := arguments + '+hostname "' + serverName.Text + '" -maxplayers_override ' + maxPlayers.Text + ' ';
  arguments := arguments + '-port ' + port.Text + ' ';

  if not(trim(password.Text) = '') then arguments := arguments + '+sv_password "' + password.Text + '" ';

  arguments := arguments + '+bot_quota ' + bots.Text + ' +bot_difficulty ' + IntToStr(botsSkill.ItemIndex) + ' ';

  if lanOnly.Checked then
  begin
     arguments := arguments + '+sv_lan 1';
  end
  else
  begin
     arguments := arguments + '+ip 0.0.0.0';
  end;

  case tickRateBox.ItemIndex of
    0: arguments := arguments + ' -tickrate 32 ';
    1: arguments := arguments + ' -tickrate 64 ';
    2: arguments := arguments + ' -tickrate 128 ';
  end;

  if friendlyFireCheck.Checked then
  begin
    arguments := arguments + '+mp_friendlyfire 1 ';
  end
  else
  begin
    arguments := arguments + '+mp_friendlyfire 0 ';
  end;
  if cheatsCheck.Checked then arguments := arguments + '+sv_cheats 1 ';

  arguments := arguments + customArgs.Text;

  //ShowMessage(arguments);
  ShellExecute(0, nil, PChar(SERVERPATH + '\\srcds.exe'), PChar(arguments), nil, SW_SHOWNORMAL);
end;

end.
