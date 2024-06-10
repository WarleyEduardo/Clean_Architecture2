unit uRepositoryCliente;

interface

uses uCliente, uDtocliente, uIRepositoryCliente,system.Generics.Collections,
system.SysUtils, uConfiguracaoDb;

type

 TRepositoryCliente = class(TinterfacedObject, IRepositoryCliente)
  private
    //FLista: TObjectlist<Tcliente>;
    FLista: Tlist<Tcliente>;
    ConfiguracaoDb : TConfiguracaoDB;
   // procedure SetLista(const Value: TObjectlist<Tcliente>);
   procedure SetLista(const Value: Tlist<Tcliente>);

  published

  procedure Cadastrar(cliente : Tcliente);
  procedure Alterar(cliente : Tcliente);
  procedure Excluir(codigo : integer);
  //Function Consultar(dto: DtoCliente) :TObjectlist<Tcliente>;
  Function Consultar(dto: DtoCliente) :Tlist<Tcliente>;


  //property Lista : TObjectlist<Tcliente> read FLista write SetLista;
   property Lista : Tlist<Tcliente> read FLista write SetLista;

  constructor create;
  destructor destroy;
  //;override;


 end;


implementation

{ TRepositoryCliente }


procedure TRepositoryCliente.Cadastrar(cliente: Tcliente);
var
 sql : string;
begin

   Sql := 'insert into clientes (nome,documento,cep,logradouro,' +
          'numero, complemento, bairro, cidade, uf , telefone)'+
          'values (' +
          QuotedStr(Cliente.Nome) + ',' +
          QuotedStr(Cliente.Documento) + ',' +
          QuotedStr(Cliente.Cep) + ',' +
          QuotedStr(Cliente.Logradouro) + ',' +
          QuotedStr(Cliente.numero) + ',' +
          QuotedStr(Cliente.complemento) + ',' +
          QuotedStr(Cliente.Bairro) + ',' +
          QuotedStr(Cliente.Cidade) + ',' +
          QuotedStr(Cliente.UF) + ',' +
          QuotedStr(Cliente.Telefone) + ')' ;

   Configuracaodb.ExecSql(sql);


end;

procedure TRepositoryCliente.Alterar(cliente: Tcliente);
var
 Sql : String;

begin

  sql := 'update clientes set nome = ' +  QuotedStr(Cliente.Nome) + ','+
          'cep = '         +  QuotedStr(Cliente.Cep) + ','+
          'logradouro = '  +  QuotedStr(Cliente.Logradouro) + ','+
          'numero = '      +  QuotedStr(Cliente.NUmero) + ','+
          'complemento = ' +  QuotedStr(Cliente.Complemento) + ','+
          'bairro = '      +  QuotedStr(Cliente.bairro) + ','+
          'cidade = '      +  QuotedStr(Cliente.Cidade) + ','+
          'Uf = '          +  QuotedStr(Cliente.UF) + ','+
          'telefone = '    +  QuotedStr(Cliente.Telefone) + ','+
          'documento = '   +  QuotedStr(Cliente.documento) +
          ' where id = ' + intToStr(Cliente.Id);

   Configuracaodb.ExecSql(sql);

end;

procedure TRepositoryCliente.Excluir(codigo: integer);

var
 Sql : string;
begin
  sql := 'delete from clientes where id =  ' +  intTostr(Codigo);

  Configuracaodb.ExecSql(sql);

end;



//function TRepositoryCliente.Consultar(dto: DtoCliente): TObjectlist<Tcliente>;
function TRepositoryCliente.Consultar(dto: DtoCliente): Tlist<Tcliente>;

var

 sql : string;

 cliente : Tcliente;
 I : integer;

begin

   sql := 'select * from clientes where 1 = 1 ' ;

   if Dto.id > 0 then
   begin
     sql := sql  +  ' and id = ' + inttostr(dto.id);
   end else
   begin

      if dto.Nome <> '' then
      begin
        sql := Sql  + ' and nome like ' + Quotedstr('%' + dto.Nome + '%');
      end;

      if Dto.Documento <> '' then
      begin
        sql := Sql  + ' and documento like ' + Quotedstr('%' + dto.documento + '%');
      end;

   end;



   if Configuracaodb.Consulta(sql) then
   begin

     {
     if lista.Count >  0 then
     begin

       for I := 0 to lista.Count - 1 do
       begin
         lista.Items[i] := nil;
        // lista.Remove(tcliente(lista.Items[i]));
       end;

     end;
     }
     Flista.Clear;



     with configuracaodb do
     begin
        query.First;

        while not query.Eof  do
        begin

           cliente := Tcliente.Create;

           cliente.Id          := query.FieldByName('id').asInteger;
           Cliente.Nome        := query.FieldByName('nome').AsString;
           Cliente.Documento   := query.FieldByName('Documento').AsString;
           Cliente.cep         := query.FieldByName('cep').AsString;
           Cliente.Logradouro  := query.FieldByName('logradouro').AsString;

           Cliente.Numero      := query.FieldByName('numero').AsString;
           Cliente.Complemento := query.FieldByName('complemento').AsString;
           Cliente.Bairro      := query.FieldByName('bairro').AsString;
           Cliente.Cidade      := query.FieldByName('cidade').AsString;
           Cliente.UF          := query.FieldByName('UF').AsString;
           Cliente.Telefone    := query.FieldByName('Telefone').AsString;

           Lista.Add(cliente);

           query.Next;

        end;

     end;


   end;

   result := Lista;

end;

constructor TRepositoryCliente.create;
begin

  //Lista := TObjectlist<Tcliente>.Create;
  Lista := Tlist<Tcliente>.Create;
  Configuracaodb := TconfiguracaoDb.Create;

end;

destructor TRepositoryCliente.destroy;
begin



  Lista.Free ;
  ConfiguracaoDb.Free;


  //inherited;


end;


//procedure TRepositoryCliente.SetLista(const Value: TObjectlist<Tcliente>);
procedure TRepositoryCliente.SetLista(const Value: Tlist<Tcliente>);

begin
  FLista := Value;
end;

end.
