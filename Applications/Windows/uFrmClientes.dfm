inherited FrmClientes: TFrmClientes
  Caption = ''
  OnClose = FormClose
  TextHeight = 15
  object Label6: TLabel [0]
    Left = 58
    Top = 512
    Width = 47
    Height = 21
    Caption = 'Nome'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  inherited Panel1: TPanel
    inherited Panel2: TPanel
      Caption = 'Clientes'
    end
    inherited Panel4: TPanel
      inherited pgPrincipal: TPageControl
        ActivePage = tsCadastro
        inherited tsconsulta: TTabSheet
          inherited Panel5: TPanel
            Height = 161
            ExplicitHeight = 161
            object Label13: TLabel [0]
              Left = 264
              Top = 11
              Width = 47
              Height = 21
              Caption = 'Nome'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label14: TLabel [1]
              Left = 32
              Top = 11
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
            object Label15: TLabel [2]
              Left = 32
              Top = 83
              Width = 90
              Height = 21
              Caption = 'Documento'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
            end
            inherited btnConsultar: TButton
              Left = 912
              Top = 78
              Width = 153
              Height = 51
              OnClick = btnConsultarClick
              ExplicitLeft = 912
              ExplicitTop = 78
              ExplicitWidth = 153
              ExplicitHeight = 51
            end
            object edtBuscaNome: TEdit
              Left = 264
              Top = 38
              Width = 601
              Height = 29
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
            object edtBuscaCodigo: TEdit
              Left = 32
              Top = 38
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
            object edtBuscaDocumento: TEdit
              Left = 32
              Top = 110
              Width = 833
              Height = 29
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              TabOrder = 3
            end
          end
          inherited Panel6: TPanel
            Top = 161
            Height = 415
            ExplicitTop = 161
            ExplicitHeight = 415
            object DBGrid1: TDBGrid
              Left = 1
              Top = 1
              Width = 1094
              Height = 413
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
                  FieldName = 'Nome'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'Documento'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'Cep'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'Logradouro'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'Numero'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'Complemento'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'Bairro'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'Cidade'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'UF'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'Telefone'
                  Visible = True
                end>
            end
          end
          inherited Panel7: TPanel
            inherited btnExcluir: TButton
              OnClick = btnExcluirClick
            end
            inherited btnOk: TButton
              OnClick = btnOkClick
            end
          end
        end
        inherited tsCadastro: TTabSheet
          inherited Panel8: TPanel
            object Label1: TLabel
              Left = 48
              Top = 32
              Width = 47
              Height = 21
              Caption = 'Nome'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label2: TLabel
              Left = 696
              Top = 424
              Width = 90
              Height = 21
              Caption = 'Documento'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label3: TLabel
              Left = 48
              Top = 120
              Width = 29
              Height = 21
              Caption = 'Cep'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label4: TLabel
              Left = 192
              Top = 120
              Width = 89
              Height = 21
              Caption = 'Logradouro'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label5: TLabel
              Left = 48
              Top = 192
              Width = 63
              Height = 21
              Caption = 'Numero'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label7: TLabel
              Left = 192
              Top = 192
              Width = 109
              Height = 21
              Caption = 'Complemento'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label8: TLabel
              Left = 48
              Top = 261
              Width = 46
              Height = 21
              Caption = 'Bairro'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label9: TLabel
              Left = 48
              Top = 344
              Width = 53
              Height = 21
              Caption = 'Cidade'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label10: TLabel
              Left = 957
              Top = 344
              Width = 20
              Height = 21
              Caption = 'UF'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label11: TLabel
              Left = 48
              Top = 424
              Width = 66
              Height = 21
              Caption = 'Telefone'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Segoe UI'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label12: TLabel
              Left = 872
              Top = 32
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
            object edtNome: TEdit
              Left = 48
              Top = 59
              Width = 785
              Height = 29
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object edtDocumento: TEdit
              Left = 696
              Top = 451
              Width = 361
              Height = 29
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              TabOrder = 10
            end
            object edtCep: TEdit
              Left = 48
              Top = 147
              Width = 113
              Height = 29
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
            object edtLogradouro: TEdit
              Left = 192
              Top = 147
              Width = 865
              Height = 29
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
            end
            object edtNumero: TEdit
              Left = 48
              Top = 219
              Width = 113
              Height = 29
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              TabOrder = 3
            end
            object edtComplemento: TEdit
              Left = 192
              Top = 219
              Width = 865
              Height = 29
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              TabOrder = 4
            end
            object edtBairro: TEdit
              Left = 48
              Top = 288
              Width = 1009
              Height = 29
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              TabOrder = 5
            end
            object edtCidade: TEdit
              Left = 48
              Top = 371
              Width = 865
              Height = 29
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              TabOrder = 6
            end
            object edtUF: TEdit
              Left = 957
              Top = 371
              Width = 100
              Height = 29
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              TabOrder = 7
            end
            object edtTelefone: TEdit
              Left = 48
              Top = 451
              Width = 593
              Height = 29
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              TabOrder = 8
            end
            object edtCodigo: TEdit
              Left = 872
              Top = 59
              Width = 185
              Height = 29
              TabStop = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 9
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
  object tableClientes: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 850
    Top = 441
    object tableClientesId: TIntegerField
      FieldName = 'Id'
    end
    object tableClientesNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object tableClientesDocumento: TStringField
      FieldName = 'Documento'
      Size = 15
    end
    object tableClientesCep: TStringField
      FieldName = 'Cep'
      Size = 8
    end
    object tableClientesLogradouro: TStringField
      FieldName = 'Logradouro'
    end
    object tableClientesNumero: TStringField
      FieldName = 'Numero'
      Size = 10
    end
    object tableClientesBairro: TStringField
      FieldName = 'Bairro'
    end
    object tableClientesCidade: TStringField
      FieldName = 'Cidade'
    end
    object tableClientesUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object tableClientesTelefone: TStringField
      FieldName = 'Telefone'
      Size = 10
    end
    object tableClientesComplemento: TStringField
      FieldName = 'Complemento'
    end
  end
  object DataSource1: TDataSource
    DataSet = tableClientes
    Left = 898
    Top = 529
  end
end
