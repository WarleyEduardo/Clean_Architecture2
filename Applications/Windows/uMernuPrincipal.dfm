object FrmMenuPrincipal: TFrmMenuPrincipal
  Left = 0
  Top = 0
  Caption = 'Menu Principal'
  ClientHeight = 655
  ClientWidth = 1038
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1038
    Height = 655
    Align = alClient
    Color = clHighlight
    Padding.Left = 5
    Padding.Top = 5
    Padding.Right = 5
    Padding.Bottom = 5
    ParentBackground = False
    TabOrder = 0
    object Panel2: TPanel
      Left = 6
      Top = 6
      Width = 1026
      Height = 56
      Align = alTop
      BevelOuter = bvNone
      Caption = 'Controle de Loca'#231#227'o de Ve'#237'culos'
      Color = clHighlight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -29
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
    end
    object Panel3: TPanel
      Left = 6
      Top = 624
      Width = 1026
      Height = 25
      Align = alBottom
      BevelOuter = bvNone
      Color = clGradientInactiveCaption
      ParentBackground = False
      TabOrder = 1
    end
    object Panel4: TPanel
      Left = 6
      Top = 62
      Width = 1026
      Height = 562
      Align = alClient
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 2
      object Panel5: TPanel
        Left = 56
        Top = 116
        Width = 217
        Height = 132
        BevelOuter = bvNone
        Color = clHighlight
        Padding.Left = 5
        Padding.Top = 5
        Padding.Right = 5
        Padding.Bottom = 5
        ParentBackground = False
        TabOrder = 0
        object btnClientes: TSpeedButton
          Left = 5
          Top = 5
          Width = 207
          Height = 122
          Align = alClient
          Caption = 'Clientes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = btnClientesClick
          ExplicitLeft = 16
          ExplicitTop = 24
          ExplicitWidth = 177
          ExplicitHeight = 89
        end
      end
      object Panel6: TPanel
        Left = 392
        Top = 116
        Width = 217
        Height = 132
        BevelOuter = bvNone
        Color = clHighlight
        Padding.Left = 5
        Padding.Top = 5
        Padding.Right = 5
        Padding.Bottom = 5
        ParentBackground = False
        TabOrder = 1
        object btnVeiculos: TSpeedButton
          Left = 5
          Top = 5
          Width = 207
          Height = 122
          Align = alClient
          Caption = 'Ve'#237'culos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = btnVeiculosClick
          ExplicitLeft = 16
          ExplicitTop = 24
          ExplicitWidth = 177
          ExplicitHeight = 89
        end
      end
      object Panel7: TPanel
        Left = 728
        Top = 116
        Width = 217
        Height = 132
        BevelOuter = bvNone
        Color = clHighlight
        Padding.Left = 5
        Padding.Top = 5
        Padding.Right = 5
        Padding.Bottom = 5
        ParentBackground = False
        TabOrder = 2
        object btnLocacoes: TSpeedButton
          Left = 5
          Top = 5
          Width = 207
          Height = 122
          Align = alClient
          Caption = 'Loca'#231#245'es'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = btnLocacoesClick
          ExplicitLeft = 61
        end
      end
    end
  end
end
