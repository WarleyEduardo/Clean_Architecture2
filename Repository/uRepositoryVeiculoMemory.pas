unit uRepositoryVeiculoMemory;

interface

uses  uVeiculo, uIRepositoryVeiculo, System.SysUtils,
 system.Generics.Collections, uDToVeiculo,uUtils;


 type

 TrepositoryVeiculoMemory = class(TInterfacedObject, IRepositoryVeiculo)
  private
    FLista: TList<TVeiculo>;
    procedure SetLista(const Value: TList<TVeiculo>);
    procedure SalvarTxt ;
    procedure LerTxt;
  published

   procedure Cadastrar(Veiculo : TVeiculo);
   procedure Alterar(Veiculo : TVeiculo);
   procedure Excluir(codigo : integer);
   function Consultar( dto : DTOVeiculo) : Tlist<TVeiculo>;
   property Lista : TList<TVeiculo> read FLista write SetLista;

   function RetornarId : Integer;

   constructor create;
    destructor destroy;

 end;

 var
  Repository:  TList<TVeiculo>;
  Id : Integer = 0 ;

implementation

{ TrepositoryVeiculoMemory }

procedure TrepositoryVeiculoMemory.Alterar(Veiculo: TVeiculo);
var
 _Veiculo : TVeiculo;
begin

  for _Veiculo in repository do
  begin

     if _Veiculo.id = Veiculo.id then
     begin

       repository.Remove(_Veiculo);

     end;

  end;


  _Veiculo            := TVeiculo.Create;
  _Veiculo.Id          := Veiculo.Id;
  _Veiculo.Nome        := Veiculo.Nome;
  _Veiculo.Placa       := Veiculo.Placa;
  _Veiculo.Valor       := Veiculo.Valor;
  _Veiculo.Status      := Veiculo.Status;

  Repository.Add(_Veiculo);

  SalvarTxt;

end;

procedure TrepositoryVeiculoMemory.Cadastrar(Veiculo: TVeiculo);
var
_Veiculo : TVeiculo ;
begin


  _Veiculo            := TVeiculo.Create;
  _Veiculo.Id          :=  RetornarId;
  _Veiculo.Nome        := Veiculo.Nome;
  _Veiculo.Placa       := Veiculo.Placa;
  _Veiculo.Valor       := Veiculo.Valor;
  _Veiculo.Status      := Veiculo.Status;


  Repository.Add(_Veiculo);

  SalvarTxt
end;

function TrepositoryVeiculoMemory.Consultar(dto: DTOVeiculo): Tlist<TVeiculo>;
var
 obj, _Veiculo : TVeiculo;
 Filtro  : boolean;
 encontrado : boolean;
begin

  Flista.Clear;


  Filtro := (dto.id >  0)           or
            (trim(dto.Nome) <> '')      or
            (trim(dto.placa) <> '');


  if Repository.Count >  0  then
  begin


    for _Veiculo in Repository do
    begin

      encontrado := false;

      if Filtro  then
      begin


        if _Veiculo.id = dto.id then
        begin

          Flista.Add( _Veiculo);

        end else
        begin

            if trim(dto.Nome) <> '' then
            begin

              if pos(UpperCase(dto.nome), UpperCase(_Veiculo.nome)) >  0 then
              begin
                encontrado := true;
              end

            end;

            if trim(dto.placa) <> '' then
            begin

              if pos(UpperCase(dto.placa), UpperCase(_Veiculo.placa)) >  0 then
              begin
                encontrado := true;
              end
            end;



           if encontrado then
           begin
             Flista.Add( _Veiculo);
           end;

        end;

      end else
      begin
        Flista.Add( _Veiculo);
      end;


    end;

  end;


   result := FLista;

end;

constructor TrepositoryVeiculoMemory.create;
begin

   FLista := TList<TVeiculo>.create;

  if not assigned(repository) then
  begin
     repository := TList<TVeiculo>.create;
  end else
  begin
   repository.Clear;
  end;

  LerTxt;
end;

destructor TrepositoryVeiculoMemory.destroy;
begin

  FLista.Free;
  repository.Free;
 end;

procedure TrepositoryVeiculoMemory.Excluir(codigo: integer);
var
 _Veiculo : TVeiculo;
begin

  for _Veiculo in repository do
  begin

     if _Veiculo.id = codigo then
     begin

       repository.Remove(_Veiculo);

     end;

  end;

  SalvarTxt;
end;

procedure TrepositoryVeiculoMemory.LerTxt;
var
 auxLinha, linha , diretorio , arquivo: string;
  arq: TextFile;

  erro : boolean;

  veiculo : Tveiculo;
begin

  diretorio:= ExtractFileDir(GetCurrentDir);

  Arquivo := diretorio  + '\repository';

  if not DirectoryExists(Arquivo) then
  begin
    ForceDirectories(Arquivo)
  end;

  Arquivo := Arquivo + '\veiculos.txt';



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

          if Pos('<veiculo>',linha) > 0 then
          begin
            veiculo := TVeiculo.Create;
          end;

          if pos('id:',linha) > 0 then
          begin

            auxLinha := trim(copy(linha,pos(':',linha) + 1));
            veiculo.Id :=  strtoInt(auxLinha);
            if veiculo.Id > id  then id := veiculo.Id;
          end;

          if pos('nome:',linha) > 0 then
          begin

            auxLinha := trim(copy(linha,pos(':',linha) + 1));
            veiculo.nome := auxLinha;

          end;

          if pos('placa:',linha) > 0 then
          begin

           auxLinha := trim(copy(linha,pos(':',linha) + 1));
           veiculo.placa := auxLinha;

          end;

          if pos('valor:',linha) > 0 then
          begin

            auxLinha := trim(copy(linha,pos(':',linha) + 1));
            veiculo.valor := strToCurr(auxLinha);

          end;

          if pos('status:',linha) > 0 then
          begin

            auxLinha := trim(copy(linha,pos(':',linha) + 1));
            veiculo.status := ConvertStrStatus(auxLinha);

          end;


          if Pos('</veiculo>',linha) > 0 then  Repository.Add(veiculo);

        end;

      end;

      CloseFile(arq);


    end;


  end


end;

function TrepositoryVeiculoMemory.RetornarId: Integer;
begin

  inc(id);
   result := id;

end;

procedure TrepositoryVeiculoMemory.SalvarTxt;
var
 linha , diretorio , arquivo: string;
  arq: TextFile;
  _veiculo : Tveiculo;
begin

  diretorio:= ExtractFileDir(GetCurrentDir);

  Arquivo := diretorio  + '\repository\veiculos.txt';

  if FileExists(Arquivo) then
  begin
    DeleteFile(Arquivo);
  end;


  AssignFile(arq, Arquivo);
  Rewrite(arq);

  if repository.Count > 0  then
  begin

     for _veiculo in repository do
     begin

       linha := '<veiculo>';
       Writeln(arq,linha);

       linha := 'id:'+ inTToStr(_veiculo.id);
       Writeln(arq,linha);

       linha := 'nome:'+ _veiculo.nome;
       Writeln(arq,linha);

       linha := 'placa:'+ _veiculo.Placa;
       Writeln(arq,linha);

       linha := 'valor:'+ currtoStr(_veiculo.Valor);
       Writeln(arq,linha);

       linha := 'status:'+ ConverterStatusStr(_veiculo.Status);
       Writeln(arq,linha);

       linha := '</veiculo>';
       Writeln(arq,linha);


     end;

  end;


  CloseFile(arq);


end;

procedure TrepositoryVeiculoMemory.SetLista(const Value: TList<TVeiculo>);
begin
  FLista := Value;
end;

end.
