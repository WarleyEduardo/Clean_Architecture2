unit uController.Clientes;

interface

uses horse, system.JSON, uControllerCliente,uRepositoryCliente,
uIRepositoryCliente , uIPresenter, uPresenterJson, uenums, uUtils,
system.SysUtils;


procedure injecaoDependencia;
procedure Destroy;


procedure getClientes(Req: THorseRequest; Res: THorseResponse);
procedure deleteCliente(Req: THorseRequest; Res: THorseResponse);
procedure postCliente(Req: THorseRequest; Res: THorseResponse);
procedure putCliente(Req: THorseRequest; Res: THorseResponse);


var
ControllerCliente : TcontrollerCliente;
RepositoryCliente : IRepositoryCliente;
Presenter         : IPresenter;


implementation

procedure injecaoDependencia;
begin

 Presenter         := TPresenterJson.Create;
 RepositoryCliente := TRepositorycliente.create;
 ControllerCliente :=  Tcontrollercliente.create(RepositoryCliente,Presenter)

end;

procedure Destroy;
begin
  ControllerCliente.Free;

end;

procedure getClientes(Req: THorseRequest; Res: THorseResponse);
var

 id, mensagem ,response, nome, documento : string;
 sucesso : boolean;
 JsonValue : TJsonValue;
 status, ErrorCode : integer;
  body : TJsonObject;
begin

  injecaoDependencia;

  nome      := req.Query['nome'];
  documento := req.Query['documento'];
  id        := req.Query['id'];

  if id = '' then id := '0';


  response := ControllerCliente.Consultar(strToint(id),nome,documento);

  Jsonvalue  := converterStrJsonParaObjectJson(response);

  mensagem  := JsonValue.GetValue<string>('Message');
  sucesso   := JsonValue.GetValue<boolean>('Success');
  errorcode := JsonValue.GetValue<integer>('ErrorCode');

  if mensagem = RetornarMsgResponse.CONSULTA_REALIZADA_COM_SUCESSO then
  begin
    status := 200;
  end;

    if errorcode > 0 then
   begin
     status := 422;
   end;

   if errorcode = 113 then
   begin
     status := 500;
   end;


  Destroy;

  res.Send(response).Status(status);


end;

procedure deleteCliente(Req: THorseRequest; Res: THorseResponse);
var
id , response, mensagem : string;
Sucesso : boolean;
JsonValue : TJsonValue;
status, ErrorCode : integer;

begin


  injecaoDependencia;
  id := req.Params['id'];

  status := 200;

  if id = '' then id := '0';


  response := ControllerCliente.Deletar(strToInt(id));

  Jsonvalue  := converterStrJsonParaObjectJson(response);

  mensagem  := JsonValue.GetValue<string>('Message');
  sucesso   := JsonValue.GetValue<boolean>('Success');
  errorcode := JsonValue.GetValue<integer>('ErrorCode');

  if mensagem = RetornarMsgResponse.DELETADO_COM_SUCESSO then
  begin
    status := 200;
  end;

    if errorcode > 0 then
   begin
     status := 422;
   end;

   if errorcode = 113 then
   begin
     status := 500;
   end;


  Destroy;

  res.Send(response).Status(status);

end;


procedure putCliente(Req: THorseRequest; Res: THorseResponse);
var

 body : TJsonObject;
 id, mensagem ,nome , documento, cep, logradouro, numero, complemento, bairro,
 cidade, uf , telefone, response : string;
 sucesso : boolean;
 JsonValue : TJsonValue;
 status, errorcode : integer;

begin
   injecaoDependencia;


   id := req.Params['id'];

    if id = '' then id := '0';

   status := 200;

   body := req.Body<TjsonObject>;

   nome        := body.GetValue<string>('nome');
   documento   := body.GetValue<string>('documento');
   cep         := body.GetValue<string>('cep');
   logradouro  := body.GetValue<string>('logradouro');
   numero      := body.GetValue<string>('numero');
   complemento := body.GetValue<string>('complemento');
   bairro      := body.GetValue<string>('bairro');
   cidade      := body.GetValue<string>('cidade');
   uf          := body.GetValue<string>('uf');
   telefone    := body.GetValue<string>('telefone');

   response  := ControllerCliente.Alterar(strToInt(id),nome,documento,cep,
   logradouro,numero,complemento,bairro,cidade,uf,telefone);

   Jsonvalue  := converterStrJsonParaObjectJson(response);

   mensagem  := JsonValue.GetValue<string>('Message');
   sucesso   := JsonValue.GetValue<boolean>('Success');
   errorcode := JsonValue.GetValue<integer>('ErrorCode');

   if mensagem = RetornarMsgResponse.ALTERADO_COM_SUCESSO then
   begin
     status := 200;
   end;

   if errorcode > 0 then
   begin
     status := 422;
   end;

   if errorcode = 113 then
   begin
     status := 500;
   end;



   Destroy;

   res.Send(response).Status(status);


end;

procedure postCliente(Req: THorseRequest; Res: THorseResponse);
var

 body : TJsonObject;
 mensagem ,nome , documento, cep, logradouro, numero, complemento, bairro,
 cidade, uf , telefone, response : string;
 sucesso : boolean;
 JsonValue : TJsonValue;
 status, errorcode : integer;

begin
   injecaoDependencia;

   status := 200;

   body := req.Body<TjsonObject>;

   nome        := body.GetValue<string>('nome');
   documento   := body.GetValue<string>('documento');
   cep         := body.GetValue<string>('cep');
   logradouro  := body.GetValue<string>('logradouro');
   numero      := body.GetValue<string>('numero');
   complemento := body.GetValue<string>('complemento');
   bairro      := body.GetValue<string>('bairro');
   cidade      := body.GetValue<string>('cidade');
   uf          := body.GetValue<string>('uf');
   telefone    := body.GetValue<string>('telefone');

   response  := ControllerCliente.Cadastrar(nome,documento,cep,
   logradouro,numero,complemento,bairro,cidade,uf,telefone);

   Jsonvalue  := converterStrJsonParaObjectJson(response);

   mensagem  := JsonValue.GetValue<string>('Message');
   sucesso   := JsonValue.GetValue<boolean>('Success');
   errorcode := JsonValue.GetValue<integer>('ErrorCode');

   if mensagem = RetornarMsgResponse.CADASTRADO_COM_SUCESSO then
   begin
     status := 201;
   end;

   if errorcode > 0 then
   begin
     status := 422;
   end;

   if errorcode = 113 then
   begin
     status := 500;
   end;



   Destroy;

   res.Send(response).Status(status);

end;

end.
