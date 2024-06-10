unit uRepositoryClienteMemory;

interface

uses  uCliente, uIRepositoryCliente, System.SysUtils,
 system.Generics.Collections, uDToCliente;


 type

 TrepositoryClienteMemory = class(TInterfacedObject, IRepositoryCliente)
  private
    FLista: TList<TCliente>;
    procedure SetLista(const Value: TList<TCliente>);
    procedure SalvarTxt ;
    procedure LerTxt;

  published

   procedure Cadastrar(cliente : Tcliente);
   procedure Alterar(cliente : TCliente);
   procedure Excluir(codigo : integer);
   function Consultar( dto : DTOCliente) : Tlist<TCliente>;
   property Lista : TList<TCliente> read FLista write SetLista;

   function RetornarId : Integer;

   constructor create;
    destructor destroy;

 end;

 var
  Repository:  TList<TCliente>;
  Id : Integer = 0 ;

implementation

{ TrepositoryClienteMemory }

procedure TrepositoryClienteMemory.Alterar(cliente: TCliente);
var
 _Cliente : TCliente;
begin

  for _Cliente in repository do
  begin

     if _Cliente.id = Cliente.id then
     begin

       repository.Remove(_Cliente);

     end;

  end;


   _cliente            := TCliente.Create;
  _cliente.Id          := cliente.Id;
  _cliente.Nome         := cliente.Nome;
  _cliente.Documento   := cliente.Documento;
  _cliente.Cep         := cliente.Cep;
  _cliente.logradouro  := cliente.logradouro;
  _cliente.Numero      := cliente.Numero;
  _cliente.Complemento := cliente.Complemento;
  _cliente.Bairro      := cliente.Bairro;
  _cliente.Cidade      := cliente.Cidade;
  _cliente.UF          := cliente.UF;
  _cliente.Telefone    := cliente.Telefone;

  Repository.Add(_Cliente);


  SalvarTxt;
end;

procedure TrepositoryClienteMemory.Cadastrar(cliente: Tcliente);
var
_cliente : TCliente ;
begin

  _cliente             := TCliente.Create;
  _cliente.Id          := RetornarId;
  _cliente.Nome         := cliente.Nome;
  _cliente.Documento   := cliente.Documento;
  _cliente.Cep         := cliente.Cep;
  _cliente.logradouro  := cliente.logradouro;
  _cliente.Numero      := cliente.Numero;
  _cliente.Complemento := cliente.Complemento;
  _cliente.Bairro      := cliente.Bairro;
  _cliente.Cidade      := cliente.Cidade;
  _cliente.UF          := cliente.UF;
  _cliente.Telefone    := cliente.Telefone;

  Repository.Add(_Cliente);

  SalvarTxt;

end;

function TrepositoryClienteMemory.Consultar(dto: DTOCliente): Tlist<TCliente>;
var
 obj, _Cliente : TCliente;
 Filtro  : boolean;
 encontrado : boolean;
 posicao : integer;
begin

  Flista.Clear;


  Filtro := (dto.id >  0)           or
            (trim(dto.Nome) <> '')      or
            (trim(dto.documento) <> '');


  if Repository.Count >  0  then
  begin


    for _Cliente in Repository do
    begin

      encontrado := false;

      if Filtro  then
      begin


        if _Cliente.id = dto.id then
        begin

          Flista.Add( _Cliente);

        end else
        begin

            if trim(dto.Nome) <> '' then
            begin

              if pos(UpperCase(dto.nome), UpperCase(_cliente.nome)) >  0 then
              if posicao >  0 then
              begin
                encontrado := true;
              end

            end;

            if trim(dto.documento) <> '' then
            begin

              if pos(UpperCase(dto.documento), UpperCase(_cliente.documento)) >  0 then
              begin
                encontrado := true;
              end
            end;



           if encontrado then
           begin
             Flista.Add( _Cliente);
           end;

        end;

      end else
      begin
        Flista.Add( _Cliente);
      end;


    end;

  end;


   result := FLista;

end;

constructor TrepositoryClienteMemory.create;
begin

  FLista := TList<TCliente>.create;

  if not assigned(repository) then
  begin
     repository := TList<TCliente>.create;
  end else
  begin
   repository.Clear;
  end;

  LerTxt;
end;

destructor TrepositoryClienteMemory.destroy;
begin

  FLista.Free;
  repository.Free;

end;

procedure TrepositoryClienteMemory.Excluir(codigo: integer);
var
 _Cliente : TCliente;
begin

  for _Cliente in repository do
  begin

     if _Cliente.id = codigo then
     begin

       repository.Remove(_Cliente);

     end;

  end;

  SalvarTxt;

end;

procedure TrepositoryClienteMemory.LerTxt;
var
 auxLinha, linha , diretorio , arquivo: string;
  arq: TextFile;

  erro : boolean;

  cliente : TCliente;
begin

  diretorio:= ExtractFileDir(GetCurrentDir);

  Arquivo := diretorio  + '\repository\clientes.txt';


  if FileExists(Arquivo) then
  begin

    AssignFile(arq, Arquivo);

    Reset(arq);

    erro := (IOResult <> 0) ;

    if not erro then
    begin

      while (not eof(arq)) do
      begin
        readln(arq, linha);

        if linha <> '' then
        begin

          if Pos('<cliente>',linha) > 0 then
          begin
            cliente := Tcliente.Create;
          end;

          if pos('id:',linha) > 0 then
          begin

            auxLinha := trim(copy(linha,pos(':',linha) + 1));
            cliente.Id :=  strtoInt(auxLinha);

            if cliente.Id > id  then id := cliente.Id;

          end;

          if pos('nome:',linha) > 0 then
          begin

            auxLinha := trim(copy(linha,pos(':',linha) + 1));
            cliente.nome := auxLinha;

          end;

          if pos('documento:',linha) > 0 then
          begin

            auxLinha := trim(copy(linha,pos(':',linha) + 1));
            cliente.documento := auxLinha;

          end;

          if pos('cep:',linha) > 0 then
          begin

            auxLinha := trim(copy(linha,pos(':',linha) + 1));
            cliente.cep := auxLinha;

          end;

          if pos('logradouro:',linha) > 0 then
          begin

            auxLinha := trim(copy(linha,pos(':',linha) + 1));
            cliente.logradouro := auxLinha;

          end;

          if pos('numero:',linha) > 0 then
          begin

            auxLinha := trim(copy(linha,pos(':',linha) + 1));
            cliente.numero := auxLinha;

          end;

          if pos('complemento:',linha) > 0 then
          begin

            auxLinha := trim(copy(linha,pos(':',linha) + 1));
            cliente.complemento := auxLinha;

          end;

          if pos('bairro:',linha) > 0 then
          begin

            auxLinha := trim(copy(linha,pos(':',linha) + 1));
            cliente.bairro := auxLinha;

          end;

          if pos('cidade:',linha) > 0 then
          begin

            auxLinha := trim(copy(linha,pos(':',linha) + 1));
            cliente.cidade := auxLinha;

          end;

          if pos('uf:',linha) > 0 then
          begin

            auxLinha := trim(copy(linha,pos(':',linha) + 1));
            cliente.uf := auxLinha;

          end;

          if pos('telefone:',linha) > 0 then
          begin

            auxLinha := trim(copy(linha,pos(':',linha) + 1));
            cliente.telefone := auxLinha;

          end;

          if Pos('</cliente>',linha) > 0 then  Repository.Add(cliente);

        end;

      end;

      CloseFile(arq);


    end;


  end

end;

function TrepositoryClienteMemory.RetornarId: Integer;
begin

  inc(id);
   result := id;

end;

procedure TrepositoryClienteMemory.SalvarTxt;
var
 linha , diretorio , arquivo: string;
  arq: TextFile;
  _cliente : TCliente;
begin

  diretorio:= ExtractFileDir(GetCurrentDir);

  Arquivo := diretorio  + '\repository';

  if not DirectoryExists(Arquivo) then
  begin
    ForceDirectories(Arquivo)
  end;

  Arquivo := Arquivo + '\clientes.txt';


  if FileExists(Arquivo) then
  begin
    DeleteFile(pchar(Arquivo));
  end;

  AssignFile(arq, Arquivo);
  Rewrite(arq);


  if repository.Count > 0  then
  begin

     for _Cliente in repository do
     begin

       linha := '<cliente>';
       Writeln(arq,linha);

       linha := 'id:'+ inTToStr(_cliente.id);
       Writeln(arq,linha);

       linha := 'nome:'+ _cliente.nome;
       Writeln(arq,linha);

       linha := 'documento:'+ _cliente.documento;
       Writeln(arq,linha);

       linha := 'cep:'+ _cliente.cep;
       Writeln(arq,linha);

       linha := 'logradouro:'+ _cliente.logradouro;
       Writeln(arq,linha);

       linha := 'numero:'+ _cliente.numero;
       Writeln(arq,linha);

       linha := 'complemento:'+ _cliente.complemento;
       Writeln(arq,linha);

       linha := 'bairro:'+ _cliente.bairro;
       Writeln(arq,linha);

       linha := 'cidade:'+ _cliente.cidade;
       Writeln(arq,linha);

       linha := 'uf:'+ _cliente.uf;

       Writeln(arq,linha);
       linha := 'telefone:'+ _cliente.telefone;
       Writeln(arq,linha);

       linha := '</cliente>';
       Writeln(arq,linha);


     end;

  end;


  CloseFile(arq);


end;

procedure TrepositoryClienteMemory.SetLista(const Value: TList<TCliente>);
begin
  FLista := Value;
end;

end.
