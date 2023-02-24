unit BO.AtualizaVersao;

interface

Uses
  System.SysUtils, Winapi.Windows, Vcl.Forms, Vcl.Menus, Winapi.ShellAPI,
  Bib.Functions,
  Pattern.SingletonConecta;

Type
  TBoAtualizaVersao = class(TFunctions)
  Private
  Public
    /// <summary>M�todo que valida todas as regras de exist�ncia de arquivos e diretorios</summary>
    /// <returns><c>True</c> se todos os arquivos existirem corretamente <c>False</c> se falhar em alguma regra</returns>
    /// <exception cref="1">Caso n�o encontre o arquivo atualizado no diret�rio de compartilhamento</exception>
    /// <exception cref="2">Caso a vers�o origem seja igual a atualizada</exception>
    function arquivosDiretoriosSaoValidos: Boolean;
    /// <summary>M�todo que vai pegar o novo arquivo e criar um diretorio e salvar na pasta de atualiza��o</summary>
    Procedure executaAtualizacaoDaVersao;
    constructor Create;
    destructor Destroy; override;
  end;

Var boArquivos:TBoAtualizaVersao;

implementation

{ TBoPrincipal }

procedure TBoAtualizaVersao.executaAtualizacaoDaVersao;
begin
  //1� - Criando o diret�rio da nova vers�o
  ForceDirectories(Instancia.caminhoGardaVersoes+Instancia.diretorioVersao);

  //2� - Copiando o arquivo novo para o diret�rio com a nova vers�o
  CopyFile(PChar(Instancia.caminhoVersaoAtualizada+Instancia.nomeArquivo), PChar(Instancia.caminhoGardaVersoes+Instancia.diretorioVersao+Instancia.nomeArquivo),False);

  //3� - Deletando o arquivo novo do diret�rio de atualiza��o
  DeleteFile(PChar(Instancia.caminhoVersaoAtual+Instancia.nomeArquivo));

  //4� - Copiando o arquivo do diret�rio com a nova vers�o para o diretorio de atualiza��o
  CopyFile(PChar(Instancia.caminhoVersaoAtualizada+Instancia.nomeArquivo), PChar(Instancia.caminhoVersaoAtual+Instancia.nomeArquivo),False);

  //5� - Atualiza o par�metro vers�o no arquivo config.ini
  Instancia.atualizaValorVersaoArquivoINI(Instancia.versaoNovaArquivo);

  Msg('A atualiza��o para vers�o "'+Instancia.versaoNovaArquivo+'" foi realizada com Sucesso!',OkInf);
end;

function TBoAtualizaVersao.arquivosDiretoriosSaoValidos: Boolean;
begin
  try
    //1� - Verifica se o arquivo "prjProjeletic.exe" se encontra no diret�rio com a vers�o a ser Atualizada
    if not FileExists(Instancia.caminhoVersaoAtualizada + Instancia.nomeArquivo) then
      raise Exception.Create('1� - N�o encontrei o arquivo: '+Instancia.nomeArquivo+' para efetuar a atualiza��o!');

    //2� - Verifica se a vers�o do arquivo "prjProjeletic.exe" � igual da vers�o corrente
    if Instancia.versaoAtualSistema = Instancia.versaoNovaArquivo then
      raise Exception.Create('2� - A vers�o dispon�vel �: '+Instancia.versaoAtualSistema+' e j� foi liberada!');

    //3� - Verificar se o diret�rio da vers�o a ser Atualizada existe
     if DirectoryExists(Instancia.caminhoGardaVersoes+Instancia.diretorioVersao) then
      raise Exception.Create('3� - A nova vers�o '+Instancia.versaoNovaArquivo+' j� tem um diretorio criado!');

    //4� - Testar se a vers�o nova � maior que a �ltima vers�o
    if not Instancia.versaoNovaEMaiorQueVersaoAtual then
      raise Exception.Create('4� - A nova vers�o nova '+Instancia.versaoNovaArquivo+' � menor ou igual a vers�o atual '+Instancia.versaoAtualSistema+'!');

    Result := True;
  except on E: Exception do
    Begin
      Msg(E.Message,OkErr);
      Result := False;
    end;
  end;
end;


constructor TBoAtualizaVersao.Create;
begin
//  inherited;
//  F_Arq        := TArquivo.Create;
end;

destructor TBoAtualizaVersao.Destroy;
begin
//  try
//    inherited;
//    If Assigned(F_Arq)        then FreeAndNil(F_Arq);
//  except
//    on e: exception do
//      raise Exception.Create(E.Message);
//  end;
end;
end.
