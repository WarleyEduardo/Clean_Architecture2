unit uController.Veiculos;

interface

uses Horse, system.JSON, uControllerVeiculo, UIRepositoryVeiculo,
uRepositoryVeiculo, uIPresenter, UPresenterJson, uEnums, uUtils,
system.SysUtils;


procedure postVeiculo(Req : THorseRequest; Res : THorseResponse);
procedure putVeiculo(Req : THorseRequest; Res : THorseResponse);
procedure deleteVeiculo(Req : THorseRequest; Res : THorseResponse);
procedure getVeiculos(Req : THorseRequest; Res : THorseResponse);


procedure InjecaoDependencia;
procedure Destroy;

implementation

var

 RepositoryVeiculo : IRepositoryVeiculo;
 Presenter         : IPresenter;
 ControllerVeiculo : TcontrollerVeiculo;

procedure InjecaoDependencia;
begin
  RepositoryVeiculo  := TrepositoryVeiculo.create;
  Presenter          := TPresenterJson.Create;
  ControllerVeiculo  := TControllerVeiculo.create(RepositoryVeiculo,Presenter);
end;

procedure Destroy;
begin
  ControllerVeiculo.Free;
end;

procedure getVeiculos(Req : THorseRequest; Res : THorseResponse);
var
 nome , placa , mensagem, id ,response: string;
 status ,errorcode : integer;
 sucesso : boolean;
 Jsonvalue : TJsonValue;
begin

injecaoDependencia;

  nome   := req.Query['nome'];
  placa  := req.Query['placa'];
  id     := req.Query['id'];

  if id = '' then id := '0';



   response := ControllerVeiculo.Consultar(strToint(id),nome,placa);

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

procedure deleteVeiculo(Req : THorseRequest; Res : THorseResponse);
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


  response := ControllerVeiculo.Deletar(strToInt(id));

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

procedure putVeiculo(Req : THorseRequest; Res : THorseResponse);
var
 id, Nome, StatusVeiculo, Placa, Mensagem , response : String;
 Valor : Currency;
 ErrorCode , Status: Integer;

 Body : TjsonObject;

 JsonValue : TJsonValue;

 Success : boolean;

begin
  InjecaoDependencia;


   status := 200;

    id := req.Params['id'];

    if id = '' then id := '0';


   body := req.Body<TjsonObject>;

   nome          := body.GetValue<string>('nome');
   Placa         := body.GetValue<string>('placa');
   StatusVeiculo := body.GetValue<string>('status');
   Valor         := body.GetValue<currency>('valor');

   response  := ControllerVeiculo.Alterar(StrtoInt(id),nome,placa,
   StatusVeiculo, valor);

   Jsonvalue  := converterStrJsonParaObjectJson(response);

   mensagem  := JsonValue.GetValue<string>('Message');
   Success   := JsonValue.GetValue<boolean>('Success');
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



procedure postVeiculo(Req : THorseRequest; Res : THorseResponse);
var
 Nome, Placa, Mensagem , response : String;
 Valor : Currency;
 ErrorCode , Status: Integer;

 Body : TjsonObject;

 JsonValue : TJsonValue;

 Success : boolean;

begin
    InjecaoDependencia;


   status := 200;

   body := req.Body<TjsonObject>;

   nome        := body.GetValue<string>('nome');
   Placa       := body.GetValue<string>('placa');
   Valor       := body.GetValue<currency>('valor');

   response  := ControllerVeiculo.Cadastrar(nome,placa, valor);

   Jsonvalue  := converterStrJsonParaObjectJson(response);

   mensagem  := JsonValue.GetValue<string>('Message');
   Success   := JsonValue.GetValue<boolean>('Success');
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
