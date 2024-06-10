unit uPresenterJson;

interface

uses uIpresenter, uresponse , ucliente, system.SysUtils,
system.Generics.Collections, uVeiculo, uLocacao, uUtils;


type

  TPresenterJson = class (TInterfacedobject, IPresenter)

  function ConverterResponse(response: Tresponse) : string;
  function Convertercliente (cliente : Tcliente ) : string;
  function ConverterLocacao (locacao : TLocacao ) : string;
  function ConverterLista (Lista : TList<TObject>) : string;
  function ConverterVeiculo (veiculo : TVeiculo ) : string;

  end;



implementation

{ TPresenterJson }

function TPresenterJson.Convertercliente(cliente: Tcliente): string;
var
 _cliente : string;
begin

  _cliente := '{"Id":'         + intToStr(cliente.Id)  +','    + #13#10 +
              '"Nome":"'       + cliente.Nome          + '",'  + #13#10 +
              '"Documento":"'  + cliente.Documento     + '",'  + #13#10 +
              '"Cep":"'        + cliente.Cep           + '",'  + #13#10 +
              '"Logradouro":"' + cliente.Logradouro    + '",'  + #13#10 +
              '"Numero":"'     + cliente.Numero        + '",'  + #13#10 +
              '"Complemento":"' + cliente.Complemento   + '",'  + #13#10 +
              '"Bairro":"'     + cliente.Bairro        + '",'  + #13#10 +
              '"Cidade":"'     + cliente.Cidade        + '",'  + #13#10 +
              '"UF":"'         + cliente.UF            + '",'  + #13#10 +
              '"Telefone":"'   + cliente.Telefone       + '"}';


 result := _cliente;

end;

function TPresenterJson.ConverterLista(Lista: TList<TObject>): string;
var
_lista : string;
_Object : TObject;
 I : integer;
begin

   if assigned(lista)  and (lista.Count > 0 ) then
   begin

     for I := 0 to lista.Count - 1 do
     begin

        _object := lista.Items[I];

        if _Object is Tcliente then
        begin
          _lista := _lista +  convertercliente(Tcliente(_object)) + #13#10;
        end;

        if _Object is TVeiculo then
        begin
          _lista := _lista +  converterVeiculo(TVeiculo(_object)) + #13#10;
        end;


        if _Object is TLocacao then
        begin
          _lista := _lista +  converterLocacao(TLocacao(_object)) + #13#10;
        end;


        if (i < lista.Count - 1)  then
        begin
          _lista := _lista + ',' + #13#10;
        end;

     end;

   end;

   result := '['+ _lista +']';

end;

function TPresenterJson.ConverterLocacao(locacao: TLocacao): string;
var
 _locacao : string;
begin

   _locacao := '{"Id": '           +  intToStr(locacao.id)             + ',' +  #13#10  +
                '"Cliente":'     +  converterCliente(locacao.cliente)  + ',' +  #13#10 +
                '"Veiculo":'     +  converterVeiculo(locacao.Veiculo)  + ',' +  #13#10 +
                '"DataLocacao":"' + DateToStr(locacao.DataLocacao)     + '",' +  #13#10  +
                '"DataDevolucao":"' + DateToStr(locacao.DataDevolucao) + '",' +  #13#10  +
                '"Total": ' + stringReplace(CurrToStr(locacao.Total),',','.',[]) + '}' + #13#10;

  result := _locacao;

end;

function TPresenterJson.ConverterResponse(response: Tresponse): string;
var
 _response , success : string;

begin

   if response.success then
     success := 'true'
  else
    success := 'false';


   _response := '{"Success":"'   +  success   +'",' + #13#10 +
                '"ErrorCode":' +  intToStr(response.ErrorCode) +',' + #13#10 +
                '"Message":"'   + response.Message              +  '",' +  #13#10 +
                '"Data":'   + converterLista(response.Data) + '}';

  result := _response;
end;

function TPresenterJson.ConverterVeiculo(veiculo: TVeiculo): string;
var
 _Veiculo : string;
begin

  _veiculo := '{"Id": '     + inTToStr(veiculo.Id)  + ','   + #13#10  +
               '"Nome":"'   + Veiculo.Nome           + '",' + #13#10  +
               '"Placa":"'  + veiculo.Placa          + '",' + #13#10  +
               '"Status":"' + ConverterStatusStr(veiculo.Status)  +'",'+#13#10 +
               '"Valor":'   + stringreplace(CurrtoStr(veiculo.Valor),',','.',[])  + '}'+ #13#10 ;

  result := _Veiculo;

end;

end.
