unit uEnums;

interface

type

 Status = (Disponivel,Alugado);


 TErrorsCode = record

   NOME_NAO_INFORMADO,
   NOME_INVALIDO,
   DOCUMENTO_NAO_INFORMADO,
   DOCUMENTO_INVALIDO,
   TELEFONE_NAO_INFORMADO,
   TELEFONE_INVALIDO,
   ID_INVALIDO,
   PLACA_NAO_INFORMADA,
   PLACA_INVALIDA,
   VALOR_INVALIDO,
   VEICULO_NAO_INFORMADO,
   CLIENTE_NAO_INFORMADO,
   VEICULO_ALUGADO,
   ERROR_BANCO_DADOS  : INTEGER

 end;


 TmsgResponse = record

   CADASTRADO_COM_SUCESSO,
   ALTERADO_COM_SUCESSO,
   CONSULTA_REALIZADA_COM_SUCESSO,
   CONSULTA_REALIZADA_SEM_RETORNO,
   CONSULTA_SEM_RETORNO,
   DELETADO_COM_SUCESSO,
   VEICULO_NAO_INFORMADO,
   CLIENTE_NAO_INFORMADO,
   VEICULO_ALUGADO : STRING;
 end;


 function RetornarMsgResponse : TmsgResponse;
 function RetornarErrorsCode : TerrorsCode;


implementation

function RetornarErrorsCode : TerrorsCode;
begin

   result.NOME_NAO_INFORMADO       := 100;
   result.NOME_INVALIDO            := 101;
   result.DOCUMENTO_NAO_INFORMADO  := 102;
   result.DOCUMENTO_INVALIDO       := 103;
   result.TELEFONE_NAO_INFORMADO   := 104;
   result.TELEFONE_INVALIDO        := 105;
   result.PLACA_INVALIDA           := 106;
   result.PLACA_NAO_INFORMADA      := 107;
   result.VALOR_INVALIDO           := 108;
   result.ID_INVALIDO              := 109;
   result.VEICULO_NAO_INFORMADO    := 110;
   result.CLIENTE_NAO_INFORMADO    := 111;
   result.VEICULO_ALUGADO          := 112;
   result.ERROR_BANCO_DADOS        := 113;



end;

function RetornarMsgResponse : TmsgResponse;
begin
   result.CADASTRADO_COM_SUCESSO := 'Cadastrado com sucesso!';
   result.ALTERADO_COM_SUCESSO   := 'Alterado com sucesso!';
   result.DELETADO_COM_SUCESSO   := 'Deletado com sucesso!';
   result.CONSULTA_REALIZADA_COM_SUCESSO := 'Consulta realizada com sucesso!';
   result.CONSULTA_SEM_RETORNO   := 'Consulta sem retorno!';
   result.VEICULO_NAO_INFORMADO  := 'Ve�culo n�o informado';
   result.CLIENTE_NAO_INFORMADO  := 'Cliente n�o informado';
   result.VEICULO_ALUGADO        := 'Veiculo alugado';
   result.CONSULTA_REALIZADA_SEM_RETORNO := 'Consulta realizada sem retorno !';

end;

end.
