object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 442
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Label1: TLabel
    Left = 8
    Top = 168
    Width = 29
    Height = 15
    Caption = 'Email'
  end
  object btnSalvarBoleto: TButton
    Left = 135
    Top = 189
    Width = 75
    Height = 25
    Caption = 'enviar'
    TabOrder = 0
    OnClick = btnSalvarBoletoClick
  end
  object edtEmail: TEdit
    Left = 8
    Top = 189
    Width = 121
    Height = 23
    TabOrder = 1
  end
  object OpenDialog1: TOpenDialog
    Left = 8
    Top = 216
  end
end
