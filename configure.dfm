object configureForm: TconfigureForm
  Left = 0
  Top = 0
  Caption = 'EasyDS Configure'
  ClientHeight = 144
  ClientWidth = 488
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object startButton: TButton
    Left = 335
    Top = 103
    Width = 145
    Height = 33
    Caption = 'Done'
    TabOrder = 0
  end
  object serverFolder: TEdit
    Left = 8
    Top = 32
    Width = 417
    Height = 21
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 1
    Text = 'C:\csgo-ds\'
    TextHint = 'Server folder'
  end
  object chooseServerFolder: TButton
    Left = 431
    Top = 32
    Width = 49
    Height = 21
    Caption = '...'
    TabOrder = 2
  end
end
