object aboutForm: TaboutForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'About EasyDS'
  ClientHeight = 128
  ClientWidth = 296
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object line1: TLabel
    Left = 8
    Top = 8
    Width = 280
    Height = 30
    Alignment = taCenter
    AutoSize = False
    Caption = 'EasyDS'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 8
    Top = 44
    Width = 280
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'by dmitlenko'
  end
  object version: TLabel
    Left = 256
    Top = 107
    Width = 32
    Height = 13
    Caption = 'v0.1.2'
  end
  object creatorUrl: TLabel
    Left = 8
    Top = 107
    Width = 32
    Height = 13
    Cursor = crHandPoint
    Caption = 'GitHub'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsUnderline]
    ParentFont = False
  end
end
