using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace LoginPageProject
{
    public partial class LoginPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = ConfigurationManager.ConnectionStrings["myConnectionstring"].ConnectionString;
            SqlCommand cmd = new SqlCommand("select * from usermaster where username = @username and password = @password", conn);
            cmd.Parameters.AddWithValue("@username", txtUserName.Text.Trim());
            cmd.Parameters.AddWithValue("@password", txtPassword.Text.Trim());
            SqlDataAdapter sqlda = new SqlDataAdapter(cmd);
            DataTable dtUserList = new DataTable();
            sqlda.Fill(dtUserList);
            conn.Open();
            int i = cmd.ExecuteNonQuery();
            conn.Close();

            if (dtUserList.Rows.Count > 0)
            {
                Response.Redirect("Default.aspx");
            }
            else
            {
                lblMessage.Text = "Nome de usuario/senha inválidos.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

    }
}