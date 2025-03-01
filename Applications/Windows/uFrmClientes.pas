unit uFrmClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, uFrmPadrao, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.ExtCtrls, system.JSON, uControllerCliente,uRepositoryCliente,
  uIRepositoryCliente , uIPresenter, uPresenterJson, uenums, uUtils,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids,
  Vcl.DBGrids, uRepositoryClienteMemory;

type
  TFrmClientes = class(TFrmPadrao)
    Label1: TLabel;
    edtNome: TEdit;
    Label2: TLabel;
    edtDocumento: TEdit;
    Label3: TLabel;
    edtCep: TEdit;
    Label4: TLabel;
    edtLogradouro: TEdit;
    Label5: TLabel;
    edtNumero: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    edtComplemento: TEdit;
    Label8: TLabel;
    edtBairro: TEdit;
    Label9: TLabel;
    edtCidade: TEdit;
    Label10: TLabel;
    edtUF: TEdit;
    Label11: TLabel;
    edtTelefone: TEdit;
    edtCodigo: TEdit;
    Label12: TLabel;
    Label13: TLabel;
    edtBuscaNome: TEdit;
    Label14: TLabel;
    edtBuscaCodigo: TEdit;
    Label15: TLabel;
    edtBuscaDocumento: TEdit;
    tableClientes: TFDMemTable;
    tableClientesId: TIntegerField;
    tableClientesNome: TStringField;
    tableClientesDocumento: TStringField;
    tableClientesCep: TStringField;
    tableClientesLogradouro: TStringField;
    tableClientesNumero: TStringField;
    tableClientesBairro: TStringField;
    tableClientesCidade: TStringField;
    tableClientesUF: TStringField;
    tableClientesTelefone: TStringField;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    tableClientesComplemento: TStringField;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    Acao : string;

    procedure injecaoDependencia;
    procedure Destroy;
    procedure Salvar;
    procedure Excluir(id : integer);
    procedure consultar(id, nome , documento: string);
    procedure LimparCampos;
    procedure SetarCampos;



  public
    { Public declarations }
  end;

var
  FrmClientes: TFrmClientes;
  ControllerCliente : TcontrollerCliente;
  RepositoryCliente : IRepositoryCliente;
  Presenter         : IPresenter;


implementation

uses
  Vcl.Dialogs;

{$R *.dfm}

{ TFrmClientes }


procedure TFrmClientes.btnConsultarClick(Sender: TObject);
begin

   consultar(edtbuscacodigo.text,
             edtBuscaNome.Text,
             edtBuscaDocumento.text);

end;

procedure TFrmClientes.btnEditarClick(Sender: TObject);
begin
  inherited;
   Acao := 'Editar';
   SetarCampos;
end;

procedure TFrmClientes.btnExcluirClick(Sender: TObject);
begin

  Excluir(tableClientesId.AsInteger);


end;

procedure TFrmClientes.btnIncluirClick(Sender: TObject);
begin
  inherited;
  Acao := 'Incluir';
  LimparCampos;
end;

procedure TFrmClientes.btnOkClick(Sender: TObject);
begin

  codigo := TableClientesid.AsString;
  Nome   := TableClientesNome.asString;

  self.Close;

end;

procedure TFrmClientes.btnSalvarClick(Sender: TObject);
begin
  inherited;
  Salvar;
end;



procedure TFrmClientes.consultar(id, nome, documento: string);
var
 mensagem ,  response : string;
 sucesso : boolean;
 JsonValue, cliente : TJsonValue;
 status, errorcode : integer;
 arraycliente : TJSONArray;
 i : integer;
begin

  if id = ''  then id := '0';

  Response := ControllerCliente.Consultar(strToInt(id),nome,documento);

  Jsonvalue  := converterStrJsonParaObjectJson(response);

  mensagem     := JsonValue.GetValue<string>('Message');
  sucesso      := JsonValue.GetValue<boolean>('Success');
  errorcode    := JsonValue.GetValue<integer>('ErrorCode');
  arraycliente := JsonValue.GetValue<TJSONArray>('Data');



  if sucesso then
  begin

    if not(tableClientes.Active) then  tableClientes.Open;

    tableClientes.EmptyDataSet;

    if arrayCliente.Count > 0 then
    begin

      for I := 0 to arrayCliente.Count -1 do
      begin

        cliente := arrayCliente[I];

        TableClientes.Insert;
        TableClientesid.AsInteger         := cliente.GetValue<integer>('Id');
        TableClientesNome.asString        := cliente.GetValue<string>('Nome');
        TableClientesDocumento.asString   := cliente.GetValue<string>('Documento');
        TableClientesCep.asString         := cliente.GetValue<string>('Cep');
        TableClientesLogradouro.asString  := cliente.GetValue<string>('Logradouro');
        TableClientesNumero.asString      := cliente.GetValue<string>('Numero');
        TableClientesComplemento.asString := cliente.GetValue<string>('Complemento');
        TableClientesBairro.asString      := cliente.GetValue<string>('Bairro');
        TableClientesCidade.asString      := cliente.GetValue<string>('Cidade');
        TableClientesuf.asString          := cliente.GetValue<string>('UF');
        TableClientesTelefone.asString    := cliente.GetValue<string>('Telefone');
        TableClientes.post;
      end;

    end;



    showmessage(mensagem);
  end else
  begin
    showmessage('Erro: ' + intToStr(errorcode) + #13#10 + mensagem);
  end;



end;

procedure TFrmClientes.Destroy;
begin
    ControllerCliente.Free;
end;

procedure TFrmClientes.Excluir(id: integer);
var
 mensagem ,  response : string;
 sucesso : boolean;
 JsonValue : TJsonValue;
 status, errorcode : integer;
begin

   Response := ControllerCliente.Deletar(id);

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

procedure TFrmClientes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Destroy;
end;

procedure TFrmClientes.FormShow(Sender: TObject);
begin
  inherited;
  injecaoDependencia;


end;

procedure TFrmClientes.injecaoDependencia;
begin

 Presenter         := TPresenterJson.Create;
 //RepositoryCliente := TRepositorycliente.create;
 RepositoryCliente := TRepositoryclienteMemory.create;
 ControllerCliente :=  Tcontrollercliente.create(RepositoryCliente,Presenter)


end;

procedure TFrmClientes.LimparCampos;
begin

   edtCodigo.clear;
   edtnome.clear;
   edtDocumento.clear;
   edtCep.clear;
   edtlogradouro.clear;
   edtNumero.clear;
   edtComplemento.clear;
   edtBairro.clear;
   edtCidade.clear;
   edtUf.clear;
   edtTelefone.clear;

end;

procedure TFrmClientes.Salvar;
var

 body : TJsonObject;
 mensagem ,nome , id, documento, cep, logradouro, numero, complemento, bairro,
 cidade, uf , telefone, response : string;
 sucesso : boolean;
 JsonValue : TJsonValue;
 status, errorcode : integer;
begin

   id          := edtCodigo.Text;
   nome        := edtnome.text;
   documento   := edtDocumento.text;
   cep         := edtCep.Text;
   logradouro  := edtlogradouro.text;
   numero      := edtNumero.Text;
   complemento := edtComplemento.Text;
   bairro      := edtBairro.Text;
   cidade      := edtCidade.Text;
   uf          := edtUf.Text;
   telefone    := edtTelefone.Text;

   if acao = 'Incluir' then
   begin
     response  := ControllerCliente.Cadastrar(nome,documento,cep,
     logradouro,numero,complemento,bairro,cidade,uf,telefone);
   end else
   begin

    if id = '' then id := '0';

     response  := ControllerCliente.Alterar(strToInt(id), nome,documento,cep,
     logradouro,numero,complemento,bairro,cidade,uf,telefone);


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

procedure TFrmClientes.SetarCampos;
begin

  edtCodigo.text      := tableClientesId.AsString;
  edtnome.text        := tableClientesnome.AsString;
  edtDocumento.text   := tableClientesdocumento.AsString;
  edtCep.text         := tableClientescep.AsString;
  edtlogradouro.text  := tableClienteslogradouro.AsString;
  edtNumero.text      := tableClientesnumero.AsString;
  edtComplemento.text := tableClientesComplemento.AsString;
  edtBairro.text      := tableClientesbairro.AsString;
  edtCidade.text      := tableClientescidade.AsString;
  edtUf.text          := tableClientesuf.AsString;
  edtTelefone.text    := tableClientestelefone.AsString;

end;

end.
