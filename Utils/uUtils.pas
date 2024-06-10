unit uUtils;

interface

uses system.SysUtils ,uResponse, uExceptions, uEnums,
ucliente,uVeiculo, uLocacao, system.Generics.Collections,
typinfo, system.JSON;


function converterStrJsonParaObjectJson(json : string) : TJsonValue;


function TratarException(e : Exception) : Tresponse;

//function ListaClienteParaListaObject(listaObject : TList<TObject>;
//listaCliente : TObjectList<Tcliente>) : TList<TObject> ;


function ListaClienteParaListaObject(listaObject : TList<TObject>;
listaCliente : TList<Tcliente>) : TList<TObject> ;


function ListaVeiculoParaListaObject(listaObject : TList<TObject>;
listaVeiculo : TList<TVeiculo>) : TList<TObject> ;



function ListaLocacaoParaListaObject(listaObject : TList<TObject>;
listalocacao : Tlist<TLocacao>) : TList<TObject> ;


function ConverterStatusStr(value : Status) : string;


function convertStrStatus(value : string) : Status;

implementation


function converterStrJsonParaObjectJson(json : string) : TJsonValue;
begin
  result := TjsonObject.ParseJSONValue(json);
end;

function convertStrStatus(value : string) : Status;
begin
  result := Status(GetEnumValue(typeinfo(Status),value));
end;

function ConverterStatusStr(value : Status) : string;

begin
  result := GetEnumName(typeInfo(Status),integer(value));
end;

function ListaLocacaoParaListaObject(listaObject : TList<TObject>;
listalocacao : Tlist<TLocacao>) : TList<TObject> ;
var
 locacao : TLocacao;
begin

   if listalocacao.Count >  0  then
   begin

      for locacao in listaLocacao do
      begin
         ListaObject.Add(locacao);
      end;

   end;

   result := ListaObject;

end;

function ListaVeiculoParaListaObject(listaObject : TList<TObject>;
listaVeiculo : TList<TVeiculo>) : TList<TObject> ;
var
 veiculo : Tveiculo;
begin

   if listaVeiculo.Count >  0  then
   begin

      for veiculo in listaVeiculo do
      begin
         ListaObject.Add(veiculo);
      end;

   end;

   result := ListaObject;

end;

//function ListaClienteParaListaObject(listaObject : TList<TObject>;
//listaCliente : TObjectList<Tcliente>): TList<TObject>;

function ListaClienteParaListaObject(listaObject : TList<TObject>;
listaCliente : TList<Tcliente>): TList<TObject>;


var
 cliente : Tcliente;
begin

   if listacliente.Count >  0  then
   begin

      for cliente in listaCliente do
      begin

         ListaObject.Add(cliente);
      end;

   end;

   result := ListaObject;

end;



function TratarException(e : Exception) : Tresponse;
var
 response : Tresponse;
begin

  response.success   := false;
  response.Message   := e.Message;
  response.Data      := nil;



  if e.ClassType = TExceptionDatabase then
  begin
     response.ErrorCode := retornarErrorsCode.ERROR_BANCO_DADOS;
  end;


  if e.ClassType = TexceptionLocacaoVeiculo then
  begin
    response.ErrorCode  := RetornarErrorsCode.VEICULO_NAO_INFORMADO;
  end;


  if e.ClassType = TexceptionLocacaoCliente then
  begin
    response.ErrorCode  := RetornarErrorsCode.CLIENTE_NAO_INFORMADO;
  end;


  if e.ClassType = TexceptionLocacaoVeiculoAlugado then
  begin
    response.ErrorCode  := RetornarErrorsCode.VEICULO_ALUGADO;
  end;

  if e.ClassType = TexceptionIdInvalido then
  begin
    response.ErrorCode  := RetornarErrorsCode.ID_INVALIDO;
  end;

  if e.ClassType = TexceptionNome then
  begin
     response.ErrorCode := retornarErrorsCode.NOME_NAO_INFORMADO;
  end;

  if e.ClassType = TexceptionMinimoNome then
  begin
     response.ErrorCode := retornarErrorsCode.NOME_INVALIDO;
  end;

  if e.ClassType = TexceptionDocumento then
  begin
     response.ErrorCode := retornarErrorsCode.DOCUMENTO_NAO_INFORMADO;
  end;

  if e.ClassType = TexceptionMinimoDocumento then
  begin
     response.ErrorCode := retornarErrorsCode.DOCUMENTO_INVALIDO;
  end;

  if e.ClassType = TexceptionTelefone then
  begin
     response.ErrorCode := retornarErrorsCode.TELEFONE_NAO_INFORMADO;
  end;

  if e.ClassType = TexceptionMinimoTelefone then
  begin
     response.ErrorCode := retornarErrorsCode.TELEFONE_INVALIDO;
  end;

  if e.ClassType = TexceptionValorVeiculo then
  begin
     response.ErrorCode := retornarErrorsCode.VALOR_INVALIDO;
  end;


  if e.ClassType = TexceptionPlacaVeiculo then
  begin
     response.ErrorCode := retornarErrorsCode.PLACA_NAO_INFORMADA;
  end;

  if e.ClassType = TexceptionMinimoPlacaVeiculo then
  begin
     response.ErrorCode := retornarErrorsCode.PLACA_INVALIDA;
  end;


  if e.ClassType = TexceptionMinimoNomeVeiculo then
  begin
     response.ErrorCode := retornarErrorsCode.NOME_INVALIDO;
  end;


  result := response;
end;

end.
