<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="LoginPageProject.LoginPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>




    <link href="https://getbootstrap.com/docs/4.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="https://getbootstrap.com/docs/4.0/examples/sign-in/signin.css" rel="stylesheet"/>


</head>
  <body class="text-center">

    <form id="form1" class="form-signin" runat="server">
        <div>
            <fieldset>
               <img src="https://i.imgur.com/ecYwOC7.png" width="250"/>

                <table align="center">
                    <tr>
                        <td>
                            <b>Nome de Usuario: </b><br />
                            <asp:TextBox ID="txtUserName" class="form-control" runat="server"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ID="rfvtxtUserName" runat="server" ControlToValidate="txtUserName"
                                ErrorMessage="Por favor digite o nome de Usuario" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3"></td>
                    </tr>
                    <tr>
                        <td>
                            <b>Senha: </b> <br />
                            <asp:TextBox ID="txtPassword" class="form-control" TextMode="Password" runat="server"></asp:TextBox><br />
                            <asp:RequiredFieldValidator  ID="rfvtxtPassword" runat="server" ControlToValidate="txtPassword"
                                ErrorMessage="Por favor digite a sua senha" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3"></td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <asp:Button ID="btnLogin" class="btn btn-lg btn-primary btn-block" runat="server" Text="Entrar" OnClick="btnLogin_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <asp:Label ID="lblMessage" runat="server" Style="font-weight: bold"></asp:Label>
                        </td>
                    </tr>
                </table>
            </fieldset>
        </div>
    </form>
</body>
</html>
