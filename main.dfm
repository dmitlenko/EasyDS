object mainForm: TmainForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'EasyDS'
  ClientHeight = 432
  ClientWidth = 312
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mainMenu
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object creatorUrl: TLabel
    Left = 8
    Top = 411
    Width = 99
    Height = 13
    Cursor = crHandPoint
    Caption = 'EasyDS by dmitlenko'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsUnderline]
    ParentFont = False
    OnClick = creatorUrlClick
  end
  object portLabel: TLabel
    Left = 8
    Top = 49
    Width = 59
    Height = 13
    Caption = 'Server port:'
  end
  object passwordLabel: TLabel
    Left = 159
    Top = 5
    Width = 85
    Height = 13
    Caption = 'Server password:'
  end
  object serverNameLabel: TLabel
    Left = 8
    Top = 5
    Width = 65
    Height = 13
    Caption = 'Server name:'
  end
  object version: TLabel
    Left = 247
    Top = 411
    Width = 57
    Height = 13
    BiDiMode = bdLeftToRight
    Caption = 'alpha v0.01'
    ParentBiDiMode = False
  end
  object startButton: TButton
    Left = 159
    Top = 372
    Width = 145
    Height = 33
    Caption = 'Start'
    TabOrder = 0
  end
  object openServerFolderButton: TButton
    Left = 8
    Top = 372
    Width = 147
    Height = 33
    Caption = 'Open Folder'
    TabOrder = 1
  end
  object port: TEdit
    Left = 8
    Top = 68
    Width = 145
    Height = 21
    TabOrder = 2
    Text = '27015'
    TextHint = 'Port'
  end
  object password: TEdit
    Left = 159
    Top = 24
    Width = 145
    Height = 21
    TabOrder = 3
    TextHint = 'Password'
  end
  object serverName: TEdit
    Left = 8
    Top = 24
    Width = 145
    Height = 21
    Hint = 'Server name'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    Text = 'Counter-Strike Server'
    TextHint = 'Server name'
  end
  object enableRconCheck: TCheckBox
    Left = 8
    Top = 93
    Width = 97
    Height = 17
    Caption = 'Enable RCON'
    TabOrder = 5
    OnClick = enableRconCheckClick
  end
  object rconPass: TEdit
    Left = 8
    Top = 116
    Width = 296
    Height = 21
    Enabled = False
    TabOrder = 6
    TextHint = 'RCON Password'
  end
  object lanOnly: TCheckBox
    Left = 159
    Top = 70
    Width = 145
    Height = 17
    Caption = 'LAN Only'
    Checked = True
    State = cbChecked
    TabOrder = 7
  end
  object gameSettings: TGroupBox
    Left = 8
    Top = 143
    Width = 296
    Height = 223
    Caption = 'Game settings'
    TabOrder = 8
    object mapLabel: TLabel
      Left = 12
      Top = 25
      Width = 24
      Height = 13
      Caption = 'Map:'
    end
    object gamemodeLabel: TLabel
      Left = 12
      Top = 71
      Width = 57
      Height = 13
      Caption = 'Gamemode:'
    end
    object maxPlayersLabel: TLabel
      Left = 12
      Top = 117
      Width = 62
      Height = 13
      Caption = 'Max players:'
    end
    object botsLabel: TLabel
      Left = 12
      Top = 163
      Width = 25
      Height = 13
      Caption = 'Bots:'
    end
    object botsSkillLabel: TLabel
      Left = 151
      Top = 163
      Width = 44
      Height = 13
      Caption = 'Bots skill:'
    end
    object mapBox: TComboBox
      Left = 12
      Top = 44
      Width = 272
      Height = 21
      Style = csDropDownList
      TabOrder = 0
    end
    object gamemodeBox: TComboBox
      Left = 12
      Top = 90
      Width = 272
      Height = 21
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 1
      Text = 'Classic Casual'
      Items.Strings = (
        'Classic Casual'
        'Classic Competitive'
        'Armsrace'
        'Demolition'
        'Deathmatch'
        'Training'
        'Cooperative'
        'Wingman'
        'Danger Zone'
        'Custom')
    end
    object maxPlayers: TEdit
      Left = 12
      Top = 136
      Width = 272
      Height = 21
      NumbersOnly = True
      TabOrder = 2
      Text = '16'
      TextHint = 'Max players'
    end
    object bots: TEdit
      Left = 12
      Top = 182
      Width = 133
      Height = 21
      NumbersOnly = True
      TabOrder = 3
      Text = '0'
      TextHint = 'Bots'
    end
    object botsSkill: TComboBox
      Left = 151
      Top = 182
      Width = 133
      Height = 21
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 4
      Text = 'Easy'
      Items.Strings = (
        'Easy'
        'Normal'
        'Hard'
        'Expert')
    end
  end
  object mainMenu: TMainMenu
    Left = 592
    Top = 8
    object options: TMenuItem
      Caption = 'Options'
      object selectserverfolder: TMenuItem
        Caption = 'Select server folder'
      end
    end
    object Help1: TMenuItem
      Caption = 'Help'
      object About1: TMenuItem
        Caption = 'About'
        OnClick = About1Click
      end
    end
  end
end
