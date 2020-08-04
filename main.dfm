object mainForm: TmainForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'EasyDS'
  ClientHeight = 432
  ClientWidth = 632
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mainMenu
  OldCreateOrder = False
  Position = poScreenCenter
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
  object startButton: TButton
    Left = 480
    Top = 392
    Width = 147
    Height = 33
    Caption = 'Start'
    TabOrder = 0
  end
  object openServerFolderButton: TButton
    Left = 327
    Top = 392
    Width = 147
    Height = 33
    Caption = 'Open Folder'
    TabOrder = 1
  end
  object TabControl1: TTabControl
    Left = 8
    Top = 8
    Width = 616
    Height = 378
    TabOrder = 2
    Tabs.Strings = (
      'General'
      'Game settings'
      'Map manager'
      'Misc')
    TabIndex = 0
    object mapLabel: TLabel
      Left = 16
      Top = 167
      Width = 24
      Height = 13
      Caption = 'Map:'
    end
    object portLabel: TLabel
      Left = 16
      Top = 121
      Width = 59
      Height = 13
      Caption = 'Server port:'
    end
    object passwordLabel: TLabel
      Left = 16
      Top = 75
      Width = 85
      Height = 13
      Caption = 'Server password:'
    end
    object serverNameLabel: TLabel
      Left = 16
      Top = 29
      Width = 65
      Height = 13
      Caption = 'Server name:'
    end
    object mapBox: TComboBox
      Left = 16
      Top = 186
      Width = 145
      Height = 21
      ItemIndex = 0
      TabOrder = 0
      Text = 'map1'
      Items.Strings = (
        'map1'
        'map2'
        'map3'
        'map4')
    end
    object port: TEdit
      Left = 16
      Top = 140
      Width = 145
      Height = 21
      TabOrder = 1
      Text = '27015'
      TextHint = 'Port'
    end
    object password: TEdit
      Left = 16
      Top = 94
      Width = 145
      Height = 21
      TabOrder = 2
      TextHint = 'Password'
    end
    object Edit1: TEdit
      Left = 16
      Top = 48
      Width = 145
      Height = 21
      Hint = 'Server name'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      Text = 'Counter-Strike Server'
      TextHint = 'Server name'
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
