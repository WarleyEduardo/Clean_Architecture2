object FrmPadrao: TFrmPadrao
  Left = 0
  Top = 0
  Caption = 'FrmPadrao'
  ClientHeight = 783
  ClientWidth = 1116
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1116
    Height = 783
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
      Width = 1104
      Height = 56
      Align = alTop
      BevelOuter = bvNone
      Caption = 'Cadastro'
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
      Top = 760
      Width = 1104
      Height = 17
      Align = alBottom
      BevelOuter = bvNone
      Color = clGradientInactiveCaption
      ParentBackground = False
      TabOrder = 1
    end
    object Panel4: TPanel
      Left = 6
      Top = 62
      Width = 1104
      Height = 698
      Align = alClient
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 2
      object pgPrincipal: TPageControl
        Left = 0
        Top = 0
        Width = 1104
        Height = 698
        ActivePage = tsconsulta
        Align = alClient
        TabOrder = 0
        object tsconsulta: TTabSheet
          Caption = 'tsconsulta'
          object Panel5: TPanel
            Left = 0
            Top = 0
            Width = 1096
            Height = 121
            Align = alTop
            Color = clWhite
            ParentBackground = False
            TabOrder = 0
            object btnConsultar: TButton
              Left = 920
              Top = 24
              Width = 145
              Height = 57
              Caption = 'Consultar'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
            end
          end
          object Panel6: TPanel
            Left = 0
            Top = 121
            Width = 1096
            Height = 455
            Align = alClient
            Color = clWhite
            ParentBackground = False
            TabOrder = 1
          end
          object Panel7: TPanel
            Left = 0
            Top = 576
            Width = 1096
            Height = 92
            Align = alBottom
            Color = clWhite
            ParentBackground = False
            TabOrder = 2
            object btnIncluir: TButton
              Left = 16
              Top = 14
              Width = 145
              Height = 57
              Caption = 'Incluir'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
              OnClick = btnIncluirClick
            end
            object btnEditar: TButton
              Left = 192
              Top = 14
              Width = 145
              Height = 57
              Caption = 'Editar'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
              OnClick = btnEditarClick
            end
            object btnExcluir: TButton
              Left = 376
              Top = 14
              Width = 145
              Height = 57
              Caption = 'Excluir'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 2
            end
            object btnOk: TButton
              Left = 920
              Top = 22
              Width = 145
              Height = 57
              Caption = 'OK'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 3
            end
          end
        end
        object tsCadastro: TTabSheet
          Caption = 'tsCadastro'
          ImageIndex = 1
          object Panel8: TPanel
            Left = 0
            Top = 0
            Width = 1096
            Height = 560
            Align = alClient
            Color = clWhite
            ParentBackground = False
            TabOrder = 0
          end
          object Panel9: TPanel
            Left = 0
            Top = 560
            Width = 1096
            Height = 108
            Align = alBottom
            Color = clWhite
            ParentBackground = False
            TabOrder = 1
            object btnSalvar: TButton
              Left = 752
              Top = 30
              Width = 145
              Height = 57
              Caption = 'Salvar'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
            end
            object btnVoltar: TButton
              Left = 928
              Top = 30
              Width = 145
              Height = 57
              Caption = 'Voltar'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
              OnClick = btnVoltarClick
            end
          end
        end
      end
    end
  end
end
