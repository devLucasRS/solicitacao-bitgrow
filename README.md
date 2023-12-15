<h1 align="center"> Desenvolvimento .NET & MSSQL</h1>
<i>Esta solicitação de desenvolvido foi realizada a partir de um pedido da empresa BitGrow.
Escopo: criação de um sistema de cadastro, edição e exclusão de estudantes, com verificação de idade e uso de API para preenchimento do endereço do cadastrado.
A solicitação faz parte de um assessment para a empresa K2A Tecnologia.</i>

<div align="center">
  <img src="https://i.imgur.com/L6nf10w.png" alt="Imagem">
</div>

<h2>O desafio</h2>
Desenvolver um sistema de cadastro de pessoas básico:

Deverá existir uma maneira de um novo usuário se cadastrar. Em uma segunda tela, realizaremos o cadastro de uma nova pessoa.
Ao entrar no sistema, deveremos visualizar os cadastros, e em destaque os cadastros incompletos.

Em uma segunda tela, realizaremos um novo cadastro.
Não podemos realizar cadastros de pessoas com menos de 21 anos.
Um cadastro precisa ter data e hora do cadastro, nome, C.E.P., nascimento, endereço, observação, escolaridade, e nome da escola. 

Os campos nome, o C.E.P., e data de nascimento são obrigatórios.

<h2> Tecnologias Utilizadas </h2>

| | |
| -------- | -------- |
|<img src="https://img.shields.io/badge/Microsoft_SQL_Server-CC2927?style=for-the-badge&logo=microsoft-sql-server&logoColor=white">| Microsoft SQL Server 2022 |
|<img src="https://img.shields.io/badge/C%23-239120?style=for-the-badge&logo=c-sharp&logoColor=white">| ASPX WEB |
|<img src="https://img.shields.io/badge/jQuery-0769AD?style=for-the-badge&logo=jquery&logoColor=white">| jQuery |
|<img src="https://img.shields.io/badge/JavaScript-323330?style=for-the-badge&logo=javascript&logoColor=F7DF1E">| Ajax |
|<img src="https://img.shields.io/badge/Bootstrap-563D7C?style=for-the-badge&logo=bootstrap&logoColor=white">| Boostrap 4.1 |





<h2> Configuração </h2>
1. Configure o arquivo <b>web.config</b> com as suas informações de acesso ao SQL SERVER (Linha 10):

```xml
<add name="myConnectionstring" connectionString="Data Source=NOMEDOSUSERVIDOR;Initial Catalog=NOMEDATABELA;User ID=SEUUSUARIO;Password=SUASENHA;Integrated Security=False"/>
```
<br>
2. Configuração do banco de dados:<br>
Abra o arquivo SQL com o editor de texto de sua preferência, copie todo o codigo e execute ele no SQL SERVER para criar as procedures e as tabelas do sistema, logo em seguida restaure o backup do banco de dados para inserir os dados do sistema utilizando o arquivo <b>Backup_SQL</b>.

<h2> Estrutura do SQL </h2>

A tabela responsavel por armazenar os usuarios que acessam ao sistema:<br>
<img src="https://i.imgur.com/oXZD3MZ.png"><br><br>

Tabela responsavel por armazenar os estudantes cadastrados no sistema:<br>
<img src="https://i.imgur.com/7nG88xX.png"><br><br>

Procedure responsavel por inserir um novo estudante:

```sql
USE [sistema]
GO
/****** Object:  StoredProcedure [dbo].[InserirNovoEstudante]    Script Date: 15/12/2023 09:38:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[InserirNovoEstudante]
    @Nome NVARCHAR(255),
    @CEP NVARCHAR(10),
    @DataNascimento DATE,
    @Endereco NVARCHAR(255),
    @Observacao NVARCHAR(MAX),
    @Escolaridade NVARCHAR(50),
    @NomeEscola NVARCHAR(255),
    @DataHoraCadastro DATETIME
AS
BEGIN
    INSERT INTO Estudantes (Nome, CEP, DataNascimento, Endereco, Observacao, Escolaridade, NomeEscola, DataHoraCadastro)
    VALUES (@Nome, @CEP, @DataNascimento, @Endereco, @Observacao, @Escolaridade, @NomeEscola, @DataHoraCadastro);
END;
```

Procedure para Atualizar o cadastro do estudante:
```sql
USE [sistema]
GO
/****** Object:  StoredProcedure [dbo].[AtualizarEstudante]    Script Date: 15/12/2023 09:41:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[AtualizarEstudante]
    @EstudanteID INT,
    @Nome NVARCHAR(255),
    @CEP NVARCHAR(10),
    @DataNascimento DATE,
    @Endereco NVARCHAR(255),
    @Observacao NVARCHAR(MAX),
    @Escolaridade NVARCHAR(50),
    @NomeEscola NVARCHAR(255)
AS
BEGIN
    UPDATE Estudantes
    SET
        Nome = @Nome,
        CEP = @CEP,
        DataNascimento = @DataNascimento,
        Endereco = @Endereco,
        Observacao = @Observacao,
        Escolaridade = @Escolaridade,
        NomeEscola = @NomeEscola
    WHERE 
	EstudanteID = @EstudanteID;
END;
```

Procedure para Deletar o cadastro do estudante:
```sql
USE [sistema]
GO
/****** Object:  StoredProcedure [dbo].[DeletarEstudante]    Script Date: 15/12/2023 09:41:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[DeletarEstudante]
    @EstudanteID INT
AS
BEGIN
    SET NOCOUNT ON;
    IF EXISTS (SELECT 1 FROM Estudantes WHERE EstudanteID = @EstudanteID)
    BEGIN
        DELETE FROM Estudantes WHERE EstudanteID = @EstudanteID;

        SELECT 'Estudante deletado com sucesso.' AS Mensagem;
    END
    ELSE
    BEGIN
        SELECT 'Estudante não encontrado.' AS Mensagem;
    END
END;

```

Procedure para obter todos os registros de estudantes:
```sql
USE [sistema]
GO
/****** Object:  StoredProcedure [dbo].[ObterEstudantes]    Script Date: 15/12/2023 09:42:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[ObterEstudantes]
AS
BEGIN
    SELECT
		    EstudanteID,
        Nome,
        CEP,
        DataNascimento,
        Endereco,
        Observacao,
        Escolaridade,
        NomeEscola,
        DataHoraCadastro
    FROM
        Estudantes;
END;

```

<h2> Estrutura dos arquivos </h2>

* LoginPage.aspx: <i>Esta é a pagina de inicio do sistema aonde obriga ao usuario digitar um login e uma senha para ter acesso ao painel, nela possuimos a verificação das inputs, verificando se os dados digitados estão corretos, e tambem se as inputs contém alguma informação.</i>
* LoginPage.aspx.cs: <i>Este arquivo é responsavel por fazer a verificação de login, este arquivo também é responsavel por conceder um nome a connectionString do SQL SERVER. </i>

* Default.aspx: <i>Nesta pagina dentro do projeto, ele é responsavel por montar todo o painel depois do login, nele contém; tabela de estudantes, botão para incluir um novo estudante, alert-badge, sidebar e o navbar.</i>
* Default.aspx.cs: <i>Neste arquivo contem todos os metodos responsaveis pela parte de gestão dos estudantes, e as chamadas das procedures, utilizando o [WebMethod] e [WebScript].</i>

<h2> Layout </h2>
<i>Todas as imagems abaixo são GIF's para reproduzi-las coloque o seu cursor do mouse encima.</i><br><br>

1. Tela de login:<br>
<i>Na tela de login temos a verificação das inputs, e a verificação dos dados digitados.</i>

<img src="https://i.imgur.com/4cwfXoz.gif">
<br>

2. Painel principal:<br>
<i>No painel principal do sistema nos temos a listagem com os estudantes cadastrados.</i>

<img src="https://i.imgur.com/Y7oQDqk.png">
<br><br>

3. Cadastro de um novo estudante:<br>
<i>Clicando no botão superior temos acesso a modal de cadastro e as suas validações.</i>

<img src="https://i.imgur.com/u3eOfix.gif">
<br><br>

4. Editando o cadastro do estudante:<br>
<i>Na listagem temos o botão Editar, clicando nele abre a modal para edição do cadastro.</i>

<img src="https://i.imgur.com/saDP06D.gif">
<br><br>

5. Deletando o cadastro do estudante:<br>
<i>Na listagem temos o botão Deletar, clicando nele abre a confirmação para deletar o cadastro.</i>

<img src="https://i.imgur.com/13NU1zX.gif">
<br><br>

<div align="center">

<hr>
<H3>Credencias para teste</H3>

| Usuario | Senha |
| -------- | -------- |
|user	   | user
|root	   | root
|teste	   | teste
<hr>

</div>
<h2> Considerações finais </h2>
Foi utilizado a API do VIACEP para preenchimento automatico do endereço do usuario. 
Todas as ações do sistema, cadastro, edição e exclusão de registro são feitas via procedure o responsavel por fazer a "chamada" da procedure na ação do clique do botão, foi removida a encryptografia de senhas de usuarios com acesso ao sistema estava sendo utilizado SHA256 porém removi a encryptografia de senha porque o painel para criação de usuarios não foi desenvolvido, para inserir um novo usario você pode utilizar o INSERT na tabela UserMaster.<br>

<h3> Fontes </h3>
<i>jQuery: https://api.jquery.com/ </i><br>
<i>Boostrap: https://getbootstrap.com/docs/4.1/getting-started/introduction/</i><br>
<i>ViaCEP: https://viacep.com.br/</i><br>


<br><br>
> Status do Projeto: Concluido :heavy_check_mark:
