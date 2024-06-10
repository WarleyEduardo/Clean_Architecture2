unit uController.Locacoes;

interface

uses horse, system.JSON, uRepositoryCliente,
uIRepositoryCliente , uIPresenter, uPresenterJson, uenums, uUtils,
system.SysUtils, uControllerLocacao, uRepositoryLocacao, uIrepositoryLocacao,
uRepositoryVeiculo, uIRepositoryVeiculo;



procedure postLocacao(Req: THorseRequest; Res: THorseResponse);
procedure putLocacao(Req: THorseRequest; Res: THorseResponse);
procedure deleteLocacao(Req: THorseRequest; Res: THorseResponse);
procedure getLocacoes(Req: THorseRequest; Res: THorseResponse);

procedure injecaoDependencia;
procedure Destroy;

var

 RepositoryCliente : IRepositoryCliente;
 RepositoryVeiculo : IRepositoryVeiculo;
 RepositoryLocacao : IRepositoryLocacao;
 Presenter         : IPresenter;
 ControllerLocacao : TControllerLocacao;

implementation

procedure getLocacoes(Req: THorseRequest; Res: THorseResponse);
var

 idlocacao, idcliente, mensagem ,response,dataLocacao,
 DataDevolucao : string;

 sucesso : boolean;
 JsonValue : TJsonValue;
 status, ErrorCode : integer;
  body : TJsonObject;
begin

  injecaoDependencia;

  idlocacao      := req.Query['idlocacao'];
  idcliente      := req.Query['idcliente'];
  DataLocacao    := req.Query['datalocacao'];
  DataDevolucao  := req.Query['datadevolucao'];


  if idlocacao = ''     then idlocacao := '0';
  if idcliente = ''     then idcliente := '0';
  if DataLocacao = ''   then DataLocacao := '30/12/1899';
  if DataDevolucao = '' then DataDevolucao := '30/12/1899';


  response := ControllerLocacao.consultar(strToInt(idlocacao),
  strToInt(idcliente), strTodate(dataLocacao) ,
  strTodate(datadevolucao) );

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

procedure deleteLocacao(Req: THorseRequest; Res: THorseResponse);
var

 body : TJsonObject;


 idLocacao , mensagem , response : string;
 sucesso : boolean;
 JsonValue : TJsonValue;
 status, errorcode : integer;
begin

   injecaoDependencia;

   status := 200;

   idLocacao := req.Params['id'];

   if idLocacao = '' then idLocacao := '0';


   response   := ControllerLocacao.deletar(strToInt(idLocacao));


   Jsonvalue  := converterStrJsonParaObjectJson(response);

   mensagem  := JsonValue.GetValue<string>('Message');
   sucesso   := JsonValue.GetValue<boolean>('Success');
   errorcode := JsonValue.GetValue<integer>('ErrorCode');

   if mensagem = RetornarMsgResponse.CADASTRADO_COM_SUCESSO then
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

procedure putLocacao(Req: THorseRequest; Res: THorseResponse);
var

 body : TJsonObject;


 idLocacao, DataLocacao, mensagem , response : string;
 sucesso : boolean;
 JsonValue : TJsonValue;
 idcliente , idveiculo , status, errorcode : integer;
begin

   injecaoDependencia;

   status := 200;


   idLocacao := req.Params['id'];

   if idLocacao = '' then idLocacao := '0';


   body := req.Body<TjsonObject>;

   idcliente        := body.GetValue<integer>('idcliente');
   idveiculo        := body.GetValue<integer>('idveiculo');
   DataLocacao      := body.GetValue<string>('datadevolucao');

   if DataLocacao = '' then DataLocacao := '30/12/1899';


   response   := ControllerLocacao.Alterar(strToInt(idLocacao),
     idcliente, idveiculo,    strtoDate(DataLocacao));

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

procedure postLocacao(Req: THorseRequest; Res: THorseResponse);

var

 body : TJsonObject;
 mensagem , response : string;
 sucesso : boolean;
 JsonValue : TJsonValue;
 idcliente , idveiculo , status, errorcode : integer;
begin

   injecaoDependencia;

   status := 200;

   body := req.Body<TjsonObject>;

   idcliente        := body.GetValue<integer>('idcliente');
   idveiculo        := body.GetValue<integer>('idveiculo');

   response   := ControllerLocacao.Cadastrar(idcliente,idveiculo);

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

procedure injecaoDependencia;
begin
 RepositoryCliente := TRepositoryCliente.Create;
 RepositoryVeiculo := TRepositoryVeiculo.Create;
 RepositoryLocacao := TRepositoryLocacao.Create(RepositoryCliente,RepositoryVeiculo);
 Presenter         := TPresenterJson.Create;

 ControllerLocacao := TControllerLocacao.Create(RepositoryLocacao,
  RepositoryVeiculo , RepositoryCliente, Presenter );

 end;


procedure Destroy;
begin
  ControllerLocacao.Free;
end;


end.
