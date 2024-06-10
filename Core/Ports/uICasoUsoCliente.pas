unit uICasoUsoCliente;

interface


uses uCliente, uResponse, uDtoCliente;

type

 ICasoUsoCliente = interface

 // cadastrar

   function Cadastrar(cliente : TCliente): Tresponse;

 // alterar


  function Alterar (cliente : Tcliente) : Tresponse;

 // deletar

  function Deletar (id : integer) : Tresponse;

 // consultar


 function  Consultar (Dto: DtoCliente) : TResponse;


 end;



implementation

end.
