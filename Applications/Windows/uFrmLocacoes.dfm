inherited FrmLocacoes: TFrmLocacoes
  Caption = ''
  OnClose = FormClose
  TextHeight = 15
  inherited Panel1: TPanel
    inherited Panel2: TPanel
      Caption = 'Loca'#231#245'es'
    end
    inherited Panel4: TPanel
      inherited pgPrincipal: TPageControl
        ActivePage = tsCadastro
        inherited tsconsulta: TTabSheet
          inherited Panel5: TPanel
            object Label14: TLabel [0]
              Left = 16
              Top = 19
              Width = 55
              Height = 21
              Caption = 'C'#243'digo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label1: TLabel [1]
              Left = 240
              Top = 19
              Width = 54
              Height = 21
              Caption = 'Cliente'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label2: TLabel [2]
              Left = 464
              Top = 19
              Width = 62
              Height = 21
              Caption = 'Loca'#231#227'o'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label3: TLabel [3]
              Left = 686
              Top = 18
              Width = 82
              Height = 21
              Caption = 'Devolu'#231#227'o'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
            end
            inherited btnConsultar: TButton
              OnClick = btnConsultarClick
            end
            object edtBuscaCodigo: TEdit
              Left = 16
              Top = 46
              Width = 201
              Height = 29
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
            object edtBuscaCliente: TEdit
              Left = 240
              Top = 46
              Width = 201
              Height = 29
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
            end
            object edtBuscaLocacao: TEdit
              Left = 464
              Top = 46
              Width = 201
              Height = 29
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              TabOrder = 3
            end
            object edtBuscaDevolucao: TEdit
              Left = 686
              Top = 47
              Width = 201
              Height = 29
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              TabOrder = 4
            end
          end
          inherited Panel6: TPanel
            object DBGrid1: TDBGrid
              Left = 1
              Top = 1
              Width = 1094
              Height = 453
              Align = alClient
              DataSource = DataSource1
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -12
              TitleFont.Name = 'Segoe UI'
              TitleFont.Style = []
              Columns = <
                item
                  Expanded = False
                  FieldName = 'Id'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'IdCliente'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NomeCliente'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'IdVeiculo'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NomeVeiculo'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DataLocacao'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DataDevolucao'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'Total'
                  Visible = True
                end>
            end
          end
          inherited Panel7: TPanel
            inherited btnExcluir: TButton
              OnClick = btnExcluirClick
            end
          end
        end
        inherited tsCadastro: TTabSheet
          inherited Panel8: TPanel
            object Label4: TLabel
              Left = 864
              Top = 27
              Width = 55
              Height = 21
              Caption = 'C'#243'digo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label5: TLabel
              Left = 16
              Top = 27
              Width = 54
              Height = 21
              Caption = 'Cliente'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label6: TLabel
              Left = 16
              Top = 115
              Width = 57
              Height = 21
              Caption = 'Ve'#237'culo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label7: TLabel
              Left = 256
              Top = 211
              Width = 82
              Height = 21
              Caption = 'Devolu'#231#227'o'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label8: TLabel
              Left = 16
              Top = 211
              Width = 62
              Height = 21
              Caption = 'Loca'#231#227'o'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label9: TLabel
              Left = 496
              Top = 211
              Width = 38
              Height = 21
              Caption = 'Total'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object pesqCliente: TSpeedButton
              Left = 180
              Top = 54
              Width = 35
              Height = 35
              Caption = 'L'
              Font.Charset = SYMBOL_CHARSET
              Font.Color = clWindowText
              Font.Height = -27
              Font.Name = 'Webdings'
              Font.Style = []
              ParentFont = False
              OnClick = pesqClienteClick
            end
            object pesqVeiculo: TSpeedButton
              Left = 180
              Top = 136
              Width = 35
              Height = 35
              Caption = 'L'
              Font.Charset = SYMBOL_CHARSET
              Font.Color = clWindowText
              Font.Height = -27
              Font.Name = 'Webdings'
              Font.Style = []
              ParentFont = False
              OnClick = pesqVeiculoClick
            end
            object edtCodigo: TEdit
              Left = 864
              Top = 54
              Width = 201
              Height = 29
              TabStop = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
            object edtCliente: TEdit
              Left = 16
              Top = 54
              Width = 137
              Height = 29
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
            object edtVeiculo: TEdit
              Left = 16
              Top = 142
              Width = 137
              Height = 29
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
            end
            object edtDataDevolucao: TEdit
              Left = 256
              Top = 238
              Width = 201
              Height = 29
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              TabOrder = 4
            end
            object edtNomecliente: TEdit
              Left = 256
              Top = 54
              Width = 553
              Height = 29
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              TabOrder = 6
            end
            object edtNomeVeiculo: TEdit
              Left = 256
              Top = 142
              Width = 809
              Height = 29
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              TabOrder = 7
            end
            object edtDataLocacao: TEdit
              Left = 16
              Top = 238
              Width = 201
              Height = 29
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 3
            end
            object edtTotal: TEdit
              Left = 496
              Top = 238
              Width = 201
              Height = 29
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 5
            end
          end
          inherited Panel9: TPanel
            inherited btnSalvar: TButton
              OnClick = btnSalvarClick
            end
          end
        end
      end
    end
  end
  object TableLocacoes: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 826
    Top = 504
    object TableLocacoesId: TIntegerField
      FieldName = 'Id'
    end
    object TableLocacoesIdCliente: TIntegerField
      FieldName = 'IdCliente'
    end
    object TableLocacoesNomeCliente: TStringField
      FieldName = 'NomeCliente'
    end
    object TableLocacoesIdVeiculo: TIntegerField
      FieldName = 'IdVeiculo'
    end
    object TableLocacoesNomeVeiculo: TStringField
      FieldName = 'NomeVeiculo'
    end
    object TableLocacoesDataLocacao: TDateField
      FieldName = 'DataLocacao'
    end
    object TableLocacoesDataDevolucao: TDateField
      FieldName = 'DataDevolucao'
    end
    object TableLocacoesTotal: TCurrencyField
      FieldName = 'Total'
    end
  end
  object DataSource1: TDataSource
    DataSet = TableLocacoes
    Left = 946
    Top = 529
  end
end
