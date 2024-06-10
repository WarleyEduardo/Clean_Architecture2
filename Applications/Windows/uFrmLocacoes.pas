unit uFrmLocacoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrmPadrao, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.ExtCtrls, uRepositoryVeiculo,
  uIRepositoryVeiculo , uIPresenter, uPresenterJson, uenums, uUtils,
  uRepositoryCliente, uIRepositoryCliente,
  uControllerLocacao, uRepositoryLocacao, uIrepositoryLocacao,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids,
  Vcl.DBGrids, system.JSON,DataSet.Serialize, Vcl.Buttons,
  uRepositoryClienteMemory, uRepositoryLocacaoMemory, uRepositoryVeiculoMemory;

type
  TFrmLocacoes = class(TFrmPadrao)
    Label14: TLabel;
    edtBuscaCodigo: TEdit;
    Label1: TLabel;
    edtBuscaCliente: TEdit;
    Label2: TLabel;
    edtBuscaLocacao: TEdit;
    Label3: TLabel;
    TableLocacoes: TFDMemTable;
    TableLocacoesId: TIntegerField;
    TableLocacoesIdCliente: TIntegerField;
    TableLocacoesIdVeiculo: TIntegerField;
    TableLocacoesNomeVeiculo: TStringField;
    TableLocacoesNomeCliente: TStringField;
    TableLocacoesDataLocacao: TDateField;
    TableLocacoesDataDevolucao: TDateField;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    edtBuscaDevolucao: TEdit;
    TableLocacoesTotal: TCurrencyField;
    Label4: TLabel;
    edtCodigo: TEdit;
    Label5: TLabel;
    edtCliente: TEdit;
    Label6: TLabel;
    edtVeiculo: TEdit;
    Label7: TLabel;
    edtDataDevolucao: TEdit;
    edtNomecliente: TEdit;
    edtNomeVeiculo: TEdit;
    Label8: TLabel;
    edtDataLocacao: TEdit;
    Label9: TLabel;
    edtTotal: TEdit;
    pesqCliente: TSpeedButton;
    pesqVeiculo: TSpeedButton;
    procedure btnConsultarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure pesqClienteClick(Sender: TObject);
    procedure pesqVeiculoClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }

    acao : string;

    procedure InjecaoDependencia;
    procedure Destroy;
    procedure LimparCampos;
    procedure SetarCampos;
    procedure Excluir(id : integer);

    procedure consultar(id, idcliente,dataLocacao,dataDevolucao : string);
    procedure Salvar;


  public
    { Public declarations }
  end;

var
  FrmLocacoes: TFrmLocacoes;
  Presenter         : IPresenter;
  RepositoryCliente : IRepositoryCliente;
  RepositoryVeiculo : IRepositoryVeiculo;
  RepositoryLocacao : IRepositoryLocacao;
  ControllerLocacao : TControllerLocacao;


implementation

{$R *.dfm}

uses uFrmClientes, uFrmVeiculos;

{ TFrmLocacoes }

procedure TFrmLocacoes.btnConsultarClick(Sender: TObject);
begin
  consultar(edtbuscacodigo.Text,
             edtbuscacliente.Text,
             edtbuscaLocacao.Text,
             edtBuscaDevolucao.text);
end;

procedure TFrmLocacoes.btnEditarClick(Sender: TObject);
begin
  inherited;
  Acao := 'Editar';
  setarCampos;

end;

procedure TFrmLocacoes.btnExcluirClick(Sender: TObject);
begin
  inherited;
   Excluir(tableLocacoesId.AsInteger);
end;

procedure TFrmLocacoes.btnIncluirClick(Sender: TObject);
begin
  inherited;

  acao := 'Incluir';
  Limparcampos;

end;

procedure TFrmLocacoes.btnSalvarClick(Sender: TObject);
begin
  inherited;
  salvar;

end;

procedure TFrmLocacoes.consultar(id, idcliente, dataLocacao,
  dataDevolucao: string);
var
 aux, mensagem ,   _array , response : string;
 sucesso : boolean;
 JsonValue, locacao, cliente, veiculo : TJsonValue;

 status, errorcode : integer;
 arraylocacao : TJSONArray;
 i : integer;


begin
  if id = '' then id := '0';
  if idcliente = '' then idcliente := '0';

  if datadevolucao = '' then datadevolucao := '30/12/1899';
  if dataLocacao = '' then dataLocacao := '30/12/1899' ;

    Response := ControllerLocacao.Consultar(strToInt(id),
    strToInt(idcliente), strTodate(dataLocacao), strTodate(datadevolucao));

  Jsonvalue  := converterStrJsonParaObjectJson(response);

  mensagem     := JsonValue.GetValue<string>('Message');
  sucesso      := JsonValue.GetValue<boolean>('Success');
  errorcode    := JsonValue.GetValue<integer>('ErrorCode');
  arraylocacao := JsonValue.GetValue<TJSONArray>('Data');


  if sucesso then
  begin

    if not(tableLocacoes.Active) then  tableLocacoes.Open;

    tableLocacoes.EmptyDataSet;

    if arraylocacao.Count > 0 then
    begin

      for I := 0 to arraylocacao.Count -1  do
      begin
        locacao := arraylocacao[i];
        cliente := locacao.GetValue<TJsonValue>('Cliente');
        veiculo := locacao.GetValue<TJsonValue>('Veiculo');

        tableLocacoes.Insert;
        TableLocacoesid.AsInteger            := cliente.GetValue<integer>('Id');
        tableLocacoesDatalocacao.AsString    := locacao.GetValue<string>('DataLocacao');
        tableLocacoesDataDevolucao.AsString  := locacao.GetValue<string>('DataDevolucao');
        tableLocacoesTotal.AsCurrency        :=locacao.GetValue<currency>('Total');

        TableLocacoesIdCliente.AsInteger     := cliente.GetValue<integer>('Id');
        TableLocacoesNomeCliente.AsString    := cliente.GetValue<string>('Nome');

        tableLocacoesidVeiculo.AsInteger     :=   veiculo.GetValue<integer>('Id');
        tableLocacoesNomeVeiculo.asstring    :=  veiculo.GetValue<string>('Nome');


        tableLocacoes.Post;


      end;

    end;


    showmessage(mensagem);
  end else
  begin
    showmessage('Erro: ' + intToStr(errorcode) + #13#10 + mensagem);
  end;




end;

procedure TFrmLocacoes.Destroy;
begin
 ControllerLocacao.Free;
end;

procedure TFrmLocacoes.Excluir(id: integer);
var
 mensagem ,  response : string;
 sucesso : boolean;
 JsonValue : TJsonValue;
 status, errorcode : integer;
begin

   Response := ControllerLocacao.Deletar(id);

   Jsonvalue  := converterStrJsonParaObjectJson(response);

   mensagem  := JsonValue.GetValue<string>('Message');
   sucesso   := JsonValue.GetValue<boolean>('Success');
   errorcode := JsonValue.GetValue<integer>('ErrorCode');

   if sucesso then
   begin
      showmessage(mensagem);
   end else
   begin
      showmessage('Erro: ' + intToStr(errorcode) + #13#10 + mensagem);
   end;


end;

procedure TFrmLocacoes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Destroy;
end;

procedure TFrmLocacoes.FormShow(Sender: TObject);
begin
  inherited;

  InjecaoDependencia;

end;

procedure TFrmLocacoes.InjecaoDependencia;
begin
 Presenter         := Tpresenterjson.Create;
 {
 RepositoryCliente := TRepositoryCliente.create;
 RepositoryVeiculo := TRepositoryVeiculo.create;
 RepositoryLocacao := TRepositoryLocacao.create(repositorycliente,
 repositoryveiculo);
 }

 RepositoryCliente := TRepositoryClienteMemory.create;
 RepositoryVeiculo := TRepositoryVeiculoMemory.create;
 RepositoryLocacao := TRepositoryLocacaoMemory.create;


 ControllerLocacao := TControllerLocacao.create(RepositoryLocacao,
 RepositoryVeiculo, repositorycliente,presenter);

end;

procedure TFrmLocacoes.LimparCampos;
begin

  edtCodigo.Clear;
  edtCliente.Clear;
  edtNomecliente.Clear;

  edtVeiculo.Clear;
  edtNomeVeiculo.Clear;
  edtDatalocacao.Clear;
  edtDataDevolucao.Clear;

  edtTotal.Clear;

end;

procedure TFrmLocacoes.pesqClienteClick(Sender: TObject);
var
 codigo : string;

begin

  FrmClientes := TFrmClientes.Create(self);
  FrmClientes.status := 'Consultar';
  FrmClientes.ShowModal;

  Codigo := frmClientes.codigo;

  if codigo = '' then  codigo := '0';

  if strToint(codigo) >  0 then
  begin
    edtcliente.Text := codigo;
    edtNomecliente.Text := frmClientes.nome;
  end;


  Frmclientes.Free;



end;

procedure TFrmLocacoes.pesqVeiculoClick(Sender: TObject);
var
 codigo : string;

begin

  FrmVeiculos := TFrmVeiculos.Create(self);
  FrmVeiculos.status := 'Consultar';
  FrmVeiculos.ShowModal;

  Codigo := FrmVeiculos.codigo;

  if codigo = '' then  codigo := '0';

  if strToint(codigo) >  0 then
  begin
    edtVeiculo.Text := codigo;
    edtNomeVeiculo.Text := FrmVeiculos.nome;
  end;


  FrmVeiculos.Free;


end;

procedure TFrmLocacoes.Salvar;
var

 body : TJsonObject;
 dataDevolucao, mensagem ,nome , idLocacao, idVeiculo, idCliente, response : string;
 sucesso : boolean;
 JsonValue : TJsonValue;
 status, errorcode : integer;
begin

   idLocacao     := edtCodigo.Text;
   idCliente     := edtcliente.Text;
   idVeiculo     := edtVeiculo.Text;
   DataDevolucao := edtDataDevolucao.text;

   if idLocacao = '' then idLocacao := '0';
   if idCliente = '' then idCliente := '0';
   if idVeiculo = '' then idVeiculo := '0';
   if DataDevolucao = '' then DataDevolucao := '30/12/1899';


   if acao = 'Incluir' then
   begin
     response  := ControllerLocacao.Cadastrar(strToint(idCliente),
     strtoint(idVeiculo));
   end else
   begin


     response  := ControllerLocacao.Alterar(strToInt(idlocacao),
     strToint(idCliente),  strtoint(idVeiculo), strTodate(DataDevolucao));


   end;

   Jsonvalue  := converterStrJsonParaObjectJson(response);

   mensagem  := JsonValue.GetValue<string>('Message');
   sucesso   := JsonValue.GetValue<boolean>('Success');
   errorcode := JsonValue.GetValue<integer>('ErrorCode');

   if sucesso then
   begin
      showmessage(mensagem);
   end else
   begin
    showmessage('Erro: ' + intToStr(errorcode) + #13#10 + mensagem);
   end;



end;

procedure TFrmLocacoes.SetarCampos;
begin

  edtCodigo.Text        := TableLocacoesid.AsString;
  edtCliente.Text       :=  TableLocacoesidcliente.AsString;
  edtNomecliente.Text   :=  TableLocacoesNomeCliente.AsString;

  edtVeiculo.Text       :=  TableLocacoesidVeiculo.AsString;
  edtNomeVeiculo.Text   :=  TableLocacoesNomeVeiculo.AsString;
  edtDatalocacao.Text   :=  TableLocacoesDataLocacao.AsString;
  edtDataDevolucao.Text :=  TableLocacoesDatadevolucao.AsString;
  edtTotal.Text         :=  TableLocacoesTotal.AsString;


end;

end.
