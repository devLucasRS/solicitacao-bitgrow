using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Script.Services;
using System.Web.Services;

namespace LoginPageProject
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static List<Estudante> ObterEstudantes()
        {
            List<Estudante> estudantes = new List<Estudante>();

            string connectionString = ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand("ObterEstudantes", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    connection.Open();

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            Estudante estudante = new Estudante
                            {
                                EstudanteID = Convert.ToInt32(reader["EstudanteID"]),
                                Nome = reader["Nome"].ToString(),
                                CEP = reader["CEP"].ToString(),
                                DataNascimento = reader["DataNascimento"].ToString(),
                                Endereco = reader["Endereco"].ToString(),
                                Observacao = reader["Observacao"].ToString(),
                                Escolaridade = reader["Escolaridade"].ToString(),
                                NomeEscola = reader["NomeEscola"].ToString(),
                                DataHoraCadastro = reader["DataHoraCadastro"].ToString()
                            };

                            estudantes.Add(estudante);
                        }
                    }
                }
            }

            return estudantes;
        }
        [WebMethod]
        public static string SalvarNovoEstudante(string nome, string cep, string dataNascimento, string endereco, string observacao, string escolaridade, string nomeEscola)
        {
            try
            {
                string connectionString = ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand("InserirNovoEstudante", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.AddWithValue("@Nome", nome);
                        command.Parameters.AddWithValue("@CEP", cep);
                        command.Parameters.AddWithValue("@DataNascimento", DateTime.Parse(dataNascimento));
                        command.Parameters.AddWithValue("@Endereco", endereco);
                        command.Parameters.AddWithValue("@Observacao", observacao);
                        command.Parameters.AddWithValue("@Escolaridade", escolaridade);
                        command.Parameters.AddWithValue("@NomeEscola", nomeEscola);
                        command.Parameters.AddWithValue("@DataHoraCadastro", DateTime.Now);

                        connection.Open();
                        command.ExecuteNonQuery();

                        return "Estudante cadastrado com sucesso.";
                    }
                }
            }
            catch (Exception ex)
            {
                return "Erro ao cadastrar estudante: " + ex.Message;
            }
        }

        [WebMethod]
        [ScriptMethod]
        public static string AtualizarEstudante(int estudanteID, string nome, string cep, string dataNascimento, string endereco, string observacao, string escolaridade, string nomeEscola)
        {
            try
            {
                string connectionString = ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand("AtualizarEstudante", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.AddWithValue("@EstudanteID", estudanteID);
                        command.Parameters.AddWithValue("@Nome", nome);
                        command.Parameters.AddWithValue("@CEP", cep);
                        command.Parameters.AddWithValue("@DataNascimento", dataNascimento);
                        command.Parameters.AddWithValue("@Endereco", endereco);
                        command.Parameters.AddWithValue("@Observacao", observacao);
                        command.Parameters.AddWithValue("@Escolaridade", escolaridade);
                        command.Parameters.AddWithValue("@NomeEscola", nomeEscola);

                        connection.Open();
                        command.ExecuteNonQuery();

                        return "Estudante atualizado com sucesso.";
                    }
                }
            }
            catch (Exception ex)
            {
                return "Erro ao atualizar estudante: " + ex.Message;
            }
        }

       


        [WebMethod]
        public static string DeletarEstudante(int estudanteID)
        {
            try
            {
                string connectionString = ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand("DeletarEstudante", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.AddWithValue("@EstudanteID", estudanteID);

                        connection.Open();
                        command.ExecuteNonQuery();

                        return "Estudante deletado com sucesso.";
                    }
                }
            }
            catch (Exception ex)
            {
                return "Erro ao deletar estudante: " + ex.Message;
            }
        }
    }

    public class Estudante
    {
        public int EstudanteID { get; set; }
        public string Nome { get; set; }
        public string CEP { get; set; }
        public string DataNascimento { get; set; }
        public string Endereco { get; set; }
        public string Observacao { get; set; }
        public string Escolaridade { get; set; }
        public string NomeEscola { get; set; }
        public string DataHoraCadastro { get; set; }
    }
}
