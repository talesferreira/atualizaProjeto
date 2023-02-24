object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Atualizador de Vers'#245'es - Projeletric'
  ClientHeight = 118
  ClientWidth = 259
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbVersaoAtual: TLabel
    Left = 8
    Top = 14
    Width = 82
    Height = 14
    Caption = 'Vers'#227'o Atual:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnAtualizarVersao: TButton
    Left = 8
    Top = 45
    Width = 241
    Height = 65
    Caption = '&Atualizar Vers'#227'o de Arquivo'
    TabOrder = 0
    OnClick = btnAtualizarVersaoClick
  end
end
