unit uICasoUsoVeiculo;

interface

uses  uVeiculo , uResponse, uDtoVeiculo;

type

 ICasoUsoVeiculo = interface

 // cadastrar

   function Cadastrar(veiculo : Tveiculo): Tresponse;

 // alterar


  function Alterar (veiculo : Tveiculo) : Tresponse;

 // deletar

  function Deletar (id : integer) : Tresponse;

 // consultar


 function  Consultar (Dto: Dtoveiculo) : TResponse;

end;


implementation

end.
