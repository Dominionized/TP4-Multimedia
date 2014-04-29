<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Connexion.aspx.cs" Inherits="TP4_Multimedia.WebForm4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="contentConnexion" ContentPlaceHolderID="content" runat="server">
    <div id="loginBox">
        <h1>Connexion</h1>
        Adresse courriel<br />
        <asp:TextBox ID="txtCourriel" runat="server"></asp:TextBox><br />
        Mot de passe<br />
        <asp:TextBox runat="server" ID="txtPassword" type="password"></asp:TextBox><br />
        <asp:CustomValidator runat="server" ID="validateEmailPasswordBanned" OnServerValidate="validateEmailPassword_ServerValidate" ErrorMessage="Le nom d'utilisateur ou mot de passe est invalide, ou le compte a été banni."></asp:CustomValidator><br />
        <asp:Button runat="server" ID="btnConnect" Text="Connexion" OnClick="btnConnect_Click" />
    </div>
</asp:Content>
