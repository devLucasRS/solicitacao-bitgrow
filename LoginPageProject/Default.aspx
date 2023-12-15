<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="LoginPageProject.Default" %>


<!doctype html>
<html lang="pt-br">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">


    <title>Painel - Inicio</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.0/examples/dashboard/">

    <!-- Bootstra core CSS -->
    <link href="https://getbootstrap.com/docs/4.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <link href="https://getbootstrap.com/docs/4.0/examples/dashboard/dashboard.css" rel="stylesheet">

    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>



  </head>

  <body>
      <style>
          .icon-large {
            width: 2em;
            height: 2em;
        }
      </style>
    <nav class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0">
      <a class="navbar-brand col-sm-3 col-md-2 mr-0" href="#">Teste BitGrow</a>
      <ul class="navbar-nav px-3">
        <li class="nav-item text-nowrap">
          <a class="nav-link" href="/LoginPage.aspx">Sair</a>
        </li>

      </ul>
    </nav>

    <div class="container-fluid">
      <div class="row">
        <nav class="col-md-2 d-none d-md-block bg-light sidebar">
          <div class="sidebar-sticky">
            <ul class="nav flex-column">
              <li class="nav-item">
                <a class="nav-link active" href="#">
                  <span data-feather="home"></span>
                  Painel <span class="sr-only">(atual)</span>
                </a>
              </li>
            </ul>

            <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
              <span>Repositorio do Sistema</span>
              <a class="d-flex align-items-center text-muted" href="#">
              </a>
            </h6>
            <ul class="nav flex-column mb-2">
              <li class="nav-item">
                <a class="nav-link" href="https://github.com/devLucasRS/solicitacao-bitgrow">
                  <span data-feather="github"></span>
                  Acessar
                </a>
              </li>
            </ul>
          </div>
        </nav>

        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">
          <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
            <h1 class="h2">Painel</h1>
                <button id="btnCadastrarNovo" class="btn btn-primary" data-toggle="modal" data-target="#modalCadastrarEstudante">+ Novo estudante</button>
          </div>
            <br />
                <div class="alert alert-warning alert-dismissible fade show" role="alert">
                  <strong>ATENÇÃO!</strong> Todos cadastros imcompletos, são ordenados para ficarem no topo da listagem.
                </div>
            <br />
          <h2>Estudantes Cadastrados</h2>
          <div class="table-responsive">
              <!---=== Tabela de Estudantes ====--->
            <table class="table table-striped table-sm" id="tabelaEstudantes">
              <thead>
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>CEP</th>
                    <th>Nascimento</th>
                    <th>Endereco</th>
                    <th>Observaçãoo</th>
                    <th>Escolaridade</th>
                    <th>Escola</th>
                    <th>Cadastrado em</th>
                    <th>Ação</th>
                </tr>
              </thead>
              <tbody>
     
              </tbody>
            </table>
          </div>
        </main>
      </div>
    </div>

     <!-- Modal de cadastro de estudante -->
    <div class="modal fade" id="modalCadastrarEstudante" tabindex="-1" role="dialog" aria-labelledby="modalCadastrarEstudanteLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalCadastrarEstudanteLabel">Cadastrar Novo Estudante</h5>
                    <button type="button" class="close" data-dismiss="modal" onclick="$('#modalCadastrarEstudante').modal('hide')" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="cadastrarNome">Nome: *</label>
                        <input type="text" class="form-control" id="cadastrarNome">
                    </div>
                    <div class="form-group">
                        <label for="cadastrarCEP">CEP: *</label>
                        <input type="text" class="form-control" id="cadastrarCEP" placeholder="00000-000">
                        <button class="btn btn-secondary" type="button" id="btnPreencherEndereco">Preencher Endereço</button>
                    </div>
                    <div class="form-group">
                        <label for="cadastrarDataNascimento">Data de Nascimento: *</label>
                        <input type="text" class="form-control" id="cadastrarDataNascimento" placeholder="DD/MM/YYYY">
                    </div>
                    <div class="form-group">
                        <label for="cadastrarEndereco">Endereço:</label>
                        <input type="text" class="form-control" id="cadastrarEndereco">
                    </div>
                    <div class="form-group">
                        <label for="cadastrarObservacao">Observação:</label>
                        <textarea class="form-control" id="cadastrarObservacao"></textarea>
                    </div>
                    <div class="form-group">
                        <label for="cadastrarEscolaridade">Escolaridade:</label>
                        <input type="text" class="form-control" id="cadastrarEscolaridade">
                    </div>
                    <div class="form-group">
                        <label for="cadastrarNomeEscola">Nome da Escola:</label>
                        <input type="text" class="form-control" id="cadastrarNomeEscola">
                    </div>
                    <div class="form-group">
                        <input type="hidden" class="form-control" id="cadastrarDataHoraCadastro">
                    </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" onclick="$('#modalCadastrarEstudante').modal('hide')"data-dismiss="modal">Fechar</button>
                    <button type="button" class="btn btn-primary" onclick="cadastrarNovoEstudante()">Salvar</button>
                </div>
            </div>
        </div>
    </div>
</div>

      <!--- Modal para edição do cadastro ---->
      <div class="modal fade" id="modalEditarEstudante" tabindex="-1" role="dialog" aria-labelledby="modalEditarEstudanteLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalEditarEstudanteLabel">Editar Estudante</h5>
                <button type="button" class="close" data-dismiss="modal" onclick="$('#modalEditarEstudante').modal('hide')" aria-label="Fechar">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label for="editarNome">Nome:</label>
                    <input type="text" class="form-control" id="editarNome" required>
                </div>
                <div class="form-group">
                    <label for="editarCEP">CEP:</label>
                    <input type="text" class="form-control" id="editarCEP" required><br />
                </div>
                <div class="form-group">
                    <label for="editarDataNascimento">Data de Nascimento:</label>
                    <input type="text" class="form-control" id="editarDataNascimento" required>
                </div>
                <div class="form-group">
                    <label for="editarEndereco">Endereço:</label>
                    <input type="text" class="form-control" id="editarEndereco" required>
                </div>
                <div class="form-group">
                    <label for="editarObservacao">Observação:</label>
                    <textarea class="form-control" id="editarObservacao"></textarea>
                </div>
                <div class="form-group">
                    <label for="editarEscolaridade">Escolaridade:</label>
                    <input type="text" class="form-control" id="editarEscolaridade">
                </div>
                <div class="form-group">
                    <label for="editarNomeEscola">Nome da Escola:</label>
                    <input type="text" class="form-control" id="editarNomeEscola">
                </div>
                <div class="form-group">
                    <label for="editarDataHoraCadastro">Data e Hora de Cadastro:</label>
                    <input type="text" class="form-control" id="editarDataHoraCadastro" readonly>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" onclick="$('#modalEditarEstudante').modal('hide')" data-dismiss="modal">Fechar</button>
                <button type="button" class="btn btn-primary" onclick="salvarAlteracoes()">Salvar</button>
            </div>
        </div>
    </div>
</div>



    <script src="https://getbootstrap.com/docs/4.0/assets/js/vendor/popper.min.js"></script>
    <script src="https://getbootstrap.com/docs/4.0/dist/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>


<script>
    $(document).ready(function () {
        obterEstudantes();

    });

    var estudanteIDEditar;

    // Carrega a lista de estudantes
    function obterEstudantes() {
        $.ajax({
            type: 'POST',
            url: 'Default.aspx/ObterEstudantes',
            contentType: 'application/json; charset=utf-8',
            dataType: 'json',
            success: function (data) {
                data.d.sort(function (a, b) {
                    var aIsNull = !a.Observacao && !a.Escolaridade && !a.NomeEscola;
                    var bIsNull = !b.Observacao && !b.Escolaridade && !b.NomeEscola;

                    if (aIsNull && !bIsNull) {
                        return -1;
                    } else if (!aIsNull && bIsNull) {
                        return -1;
                    } else {
                        return 0;
                    }
                });

                $('#tabelaEstudantes tbody').empty();

                // Popula a tabela com os dados ordenados
                $.each(data.d, function (index, estudante) {
                    var row = $('<tr>')
                        .append($('<td>').text(estudante.EstudanteID))
                        .append($('<td>').text(estudante.Nome))
                        .append($('<td>').text(estudante.CEP))
                        .append($('<td>').text(estudante.DataNascimento))
                        .append($('<td>').text(estudante.Endereco))
                        .append($('<td>').text(estudante.Observacao))
                        .append($('<td>').text(estudante.Escolaridade))
                        .append($('<td>').text(estudante.NomeEscola))
                        .append($('<td>').text(estudante.DataHoraCadastro))
                        .append($('<td>').html('<a href="#" onclick="editarEstudante(' + JSON.stringify(estudante).replace(/"/g, "&quot;") + '); return false;"><span data-feather="edit"></span></a> | <a href="#" onclick="deletarEstudante(' + estudante.EstudanteID + '); return false;"><span data-feather="trash"></span></a>'));

                    $('#tabelaEstudantes tbody').append(row);
                });
            },
            error: function (error) {
                console.log('Erro ao obter estudantes: ' + error.responseText);
            }
        });
    }

    // Mostra os dados dentro da modal de edição
    function editarEstudante(estudante) {
        estudanteIDEditar = estudante.EstudanteID;

        $('#editarNome').val(estudante.Nome);
        $('#editarCEP').val(estudante.CEP);
        $('#editarDataNascimento').val(estudante.DataNascimento);
        $('#editarEndereco').val(estudante.Endereco);
        $('#editarObservacao').val(estudante.Observacao);
        $('#editarEscolaridade').val(estudante.Escolaridade);
        $('#editarNomeEscola').val(estudante.NomeEscola);
        $('#editarDataHoraCadastro').val(estudante.DataHoraCadastro);
        $('#modalEditarEstudante').modal('show');
    }

    // Salva as edições
    function salvarAlteracoes() {
        // Obtenha os valores dos campos da modal
        var estudanteID = estudanteIDEditar;
        var nome = $('#editarNome').val();
        var cep = $('#editarCEP').val();
        var dataNascimento = $('#editarDataNascimento').val();
        var endereco = $('#editarEndereco').val();
        var observacao = $('#editarObservacao').val();
        var escolaridade = $('#editarEscolaridade').val();
        var nomeEscola = $('#editarNomeEscola').val();
        var dataHoraCadastro = $('#editarDataHoraCadastro').val();

        // Chame o método no lado do servidor para salvar as alterações
        $.ajax({
            type: "POST",
            url: "Default.aspx/AtualizarEstudante",
            data: JSON.stringify({
                estudanteID: estudanteID,
                nome: nome,
                cep: cep,
                dataNascimento: dataNascimento,
                endereco: endereco,
                observacao: observacao,
                escolaridade: escolaridade,
                nomeEscola: nomeEscola,
                dataHoraCadastro: dataHoraCadastro
            }),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                console.log(response.d);
                obterEstudantes();
                $('#modalEditarEstudante').modal('hide');
            },
            error: function (error) {
                console.log("Erro ao atualizar estudante: " + error.responseText);
            }
        });
    }

    // Deleta o usuário
    function deletarEstudante(estudanteID) {
        Swal.fire({
            title: 'Tem certeza que deseja deletar?',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Confirmar',
            cancelButtonText: 'Cancelar'
        }).then((result) => {
            if (result.isConfirmed) {
                $.ajax({
                    type: 'POST',
                    url: 'Default.aspx/DeletarEstudante',
                    data: JSON.stringify({ estudanteID: estudanteID }),
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (response) {
                        obterEstudantes();
                        location.reload();
                    },
                    error: function (error) {
                        console.log('Erro ao deletar estudante: ' + error.responseText);
                    }
                });
            }
        });
    }

    $(document).ready(function () {
        $('#btnCadastrarNovo').click(function () {
            $('#modalNovoEstudante').modal('show');
        });
        $('#novoCEP').blur(function () {
            preencherEndereco();
        });
    });

    // Função para preencher o endereço ao clicar no botão
    $('#btnPreencherEndereco').on('click', function () {
        var cep = $('#cadastrarCEP').val();
        if (cep) {
            preencherEndereco(cep);
        }
    });

    // Função para preencher o endereço usando a API ViaCEP
    function preencherEndereco(cep) {
        $.ajax({
            type: 'GET',
            url: 'https://viacep.com.br/ws/' + cep + '/json/',
            success: function (data) {
                $('#cadastrarEndereco').val(data.logradouro + ', ' + data.bairro + ', ' + data.localidade + ', ' + data.uf);
            },
            error: function (error) {
                console.log('Erro ao obter endereço: ' + error.responseText);
            }
        });
    }

    // Função para cadastrar um novo estudante
    function cadastrarNovoEstudante() {
        var nome = $('#cadastrarNome').val();
        var cep = $('#cadastrarCEP').val();
        var dataNascimento = $('#cadastrarDataNascimento').val();
        var endereco = $('#cadastrarEndereco').val();
        var observacao = $('#cadastrarObservacao').val();
        var escolaridade = $('#cadastrarEscolaridade').val();
        var nomeEscola = $('#cadastrarNomeEscola').val();
        var dataHoraCadastro = $('#cadastrarDataHoraCadastro').val();

        if (!nome || !cep || !dataNascimento) {
            Swal.fire({
                icon: 'warning',
                title: 'Erro',
                text: 'Preencha todos os campos obrigatórios antes de cadastrar.',
                showConfirmButton: true,
            });
            return;
        }

        var hoje = moment();
        var nascimento = moment(dataNascimento, 'DD-MM-YYYY');
        var idade = hoje.diff(nascimento, 'years');

        if (idade < 21) {
            Swal.fire({
                icon: 'warning',
                title: 'Erro ao cadastrar estudante',
                text: 'A idade do estudante deve ser maior ou igual a 21 anos.',
                showConfirmButton: true,
            });
            return;
        }

        // Realize o cadastro
        $.ajax({
            type: 'POST',
            url: 'Default.aspx/SalvarNovoEstudante',
            data: JSON.stringify({
                nome: nome,
                cep: cep,
                dataNascimento: dataNascimento,
                endereco: endereco,
                observacao: observacao,
                escolaridade: escolaridade,
                nomeEscola: nomeEscola,
                dataHoraCadastro: dataHoraCadastro
            }),
            contentType: 'application/json; charset=utf-8',
            dataType: 'json',
            success: function (response) {
                Swal.fire({
                    icon: 'success',
                    title: 'Estudante cadastrado com sucesso!',
                    showConfirmButton: false,
                    timer: 1500 
            }).then(function () {
                location.reload();
            });

                $('#modalCadastrarEstudante').modal('hide');
                obterEstudantes();

            },
            error: function (error) {
                Swal.fire({
                    icon: 'error',
                    title: 'Erro ao cadastrar estudante',
                    text: error.responseText,
                    showConfirmButton: true,
                });
            }
        });
    }

</script>




    <!-- Icons -->
    <script src="https://unpkg.com/feather-icons/dist/feather.min.js"></script>
    <script>
        feather.replace()
    </script>

 
  </body>
</html>

