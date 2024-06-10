unit uICasoUsoLocacao;

interface

uses  uLocacao, uResponse, uDtoLocacao;


type

 ICasoUsoLocacao = interface

  function Cadastrar(locacao: Tlocacao)  : Tresponse;
  function Alterar(locacao: Tlocacao)    : Tresponse;
  function Deletar(id : integer)         : Tresponse;
  function Consultar(Dto : DtoLocacao)   : Tresponse;

 end;

implementation

end.
