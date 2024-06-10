unit uRepositoryLocacao;

interface

uses uLocacao, uDtoLocacao , uIrepositoryLocacao, system.Generics.Collections,
  uConfiguracaoDb, system.SysUtils, uVeiculo, uCliente, uDtoCliente, uDtoVeiculo,
  uIrepositoryCliente, uIRepositoryVeiculo;


type

 TRepositoryLocacao = class(TinterfacedObject, IRepositoryLocacao)
  private
    configuracaodb : Tconfiguracaodb;
    repositoryCliente : IrepositoryCliente;
    repositoryVeiculo  : IRepositoryVeiculo;
    FLista: Tlist<TLocacao>;
    //FlistaClientes : TObjectlist<TCliente>;
     FlistaClientes : Tlist<TCliente>;

    FlistaVeiculos : TList<TVeiculo>;

    procedure SetLista(const Value: Tlist<TLocacao>);
  published

  procedure Cadastrar(locacao : TLocacao);
  procedure Alterar(locacao : TLocacao);
  procedure Excluir(codigo : integer);
  Function Consultar(dto: DtoLocacao) :Tlist<TLocacao>;

  property Lista : Tlist<TLocacao> read FLista write SetLista;


  constructor create(repositoryCliente: IRepositoryCliente;
   repositoryVeiculo : IRepositoryVeiculo);
  destructor destroy;
  //;override;

 end;


implementation

{ IRepositoryLocacao }

procedure TRepositoryLocacao.Alterar(locacao: TLocacao);

var
 sql : string;
begin

  sql:= 'update locacao set ' +
         'idcliente  = '      +  intToStr(locacao.cliente.Id) + ',' +
         'datadevolucao = '   +  QuotedStr(dateToStr(locacao.DataDevolucao)) + ','+
         'total = '           +  StringReplace(CurrToStr(Locacao.Total),',','.',[]) + ' '+
         'where id = '        +  intToStr(locacao.Id);

   configuracaodb.ExecSql(sql);



   if locacao.Veiculo.Id <> locacao.VeiculoAtual.id then
   begin

     sql :=  'update locacaoveiculos set idveiculo = ' + intTostr(locacao.Veiculo.Id) +
             'where idlocacao = ' +  intToStr(locacao.Id);

     configuracaodb.ExecSql(sql);
   end;




end;

procedure TRepositoryLocacao.Cadastrar(locacao: TLocacao);
var
 Sql : string;
begin

 sql := 'insert into locacao (idcliente, datalocacao,datadevolucao,total,hash)'+
         ' values ( ' +
         intToStr(locacao.cliente.Id) + ', '+
         QuotedStr(Datetostr(locacao.DataLocacao)) + ', '+
         QuotedStr(Datetostr(locacao.DataDevolucao)) + ', '+
         StringReplace(CurrToStr(Locacao.Total),',','.',[]) + ','+
         Quotedstr(locacao.Hash) + ')';

    configuracaodb.ExecSql(sql);

    sql := 'select id from locacao where hash = ' + QuotedStr(locacao.Hash);

    if configuracaodb.Consulta(sql) then
    begin

      locacao.Id := configuracaodb.Query.FieldByName('id').AsInteger;

    end;


    sql := 'insert into locacaoveiculos (idlocacao,idveiculo,valor)'+
            ' values ( '+
            intToStr(locacao.Id) + ',' +
            intToStr(locacao.Veiculo.Id) + ',' +
            StringReplace(CurrToStr(Locacao.veiculo.Valor),',','.',[]) + ')';


   configuracaodb.ExecSql(sql);

end;

function TRepositoryLocacao.Consultar(dto: DtoLocacao): Tlist<TLocacao>;

var
 sql : string;
 Locacao : Tlocacao;
 _DtoCliente : DtoCliente;
 _DtoVeiculo : DtoVeiculo;
begin


   sql := 'select l.*, lv.*' +
           'from locacao l ' +
           'inner join locacaoveiculos lv on lv.idlocacao = l.id '+
           ' where 1 = 1';

  if dto.id > 0 then
  begin
     sql := sql + ' and l.id = ' +  intTostr(dto.Id);
  end else
  begin

    if dto.idcliente > 0 then
    begin
      sql:= sql + ' and l.idcliente =  ' +  intToStr(dto.idcliente);
    end;

    if dto.Datalocacao <> strTodate('30/12/1899') then
    begin
      sql := sql + ' and l.datalocacao = ' +  quotedstr(datetostr(dto.Datalocacao));
    end;

    if dto.DataDevolucao <> strTodate('30/12/1899') then
    begin
      sql := sql + ' and l.datadevolucao = ' +  quotedstr(datetostr(dto.Datadevolucao));
    end;


  end;


  if configuracaodb.Consulta(sql) then
  begin

    lista.Clear;


    with configuracaodb do
    begin
        query.First;

        while not query.eof do
        begin

          locacao := Tlocacao.create;

          locacao.Id            := query.FieldByName('id').AsInteger;
          locacao.DataLocacao   := query.FieldByName('datalocacao').AsDateTime;
          locacao.DataDevolucao := query.FieldByName('datadevolucao').AsDateTime;
          locacao.Total         := query.FieldByName('total').AsCurrency;

          _dtocliente.id        := query.FieldByName('idcliente').AsInteger;

          FlistaClientes := RepositoryCliente.Consultar(_dtocliente);


          if flistaclientes.Count > 0 then
          begin
             locacao.cliente      := Tcliente.Create;
             locacao.cliente      := FlistaClientes.Items[0];
          end;

          _dtoveiculo.id          := query.FieldByName('idveiculo').AsInteger;

          FlistaVeiculos := RepositoryVeiculo.Consultar(_dtoVeiculo);

          if FlistaVeiculos.Count >  0 then
          begin

            Locacao.Veiculo  := TVeiculo.Create;

            locacao.Veiculo  := FlistaVeiculos.Items[0];

            locacao.VeiculoAtual := locacao.Veiculo;
          end;


          lista.Add(locacao);

          query.Next;
        end;
    end;

  end;


  result := lista;

end;

constructor TRepositoryLocacao.create(repositoryCliente: IRepositoryCliente;
   repositoryVeiculo : IRepositoryVeiculo);
begin
  self.repositoryCliente := repositoryCliente ;
  self.repositoryVeiculo  := repositoryVeiculo;
  Lista                  := Tlist<TLocacao>.Create;
  Configuracaodb         := TconfiguracaoDb.Create;
  FlistaClientes         := TObjectList<Tcliente>.create;
  FListaVeiculos         := TList<TVeiculo>.create;

end;

destructor TRepositoryLocacao.destroy;
begin
  Lista.Free ;
  ConfiguracaoDb.Free;
 // inherited;
end;

procedure TRepositoryLocacao.Excluir(codigo: integer);
var
 sql : string;

begin

  sql := 'delete from locacao where id = ' +  intToStr(codigo);
  configuracaodb.ExecSql(sql);

  sql := 'delete from locacaoveiculos where idlocacao = ' +  intToStr(codigo);
  configuracaodb.ExecSql(sql);

end;

procedure TRepositoryLocacao.SetLista(const Value: Tlist<TLocacao>);
begin
  FLista := Value;
end;

end.
