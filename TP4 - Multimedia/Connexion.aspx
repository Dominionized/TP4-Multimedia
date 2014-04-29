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
        <asp:CustomValidator runat="server" ID="validateEmailPassword" OnServerValidate="validateEmailPassword_ServerValidate" ErrorMessage="Le courriel ou le mot de passe sont invalides ou vous avez été banni."></asp:CustomValidator><br />
        <asp:Button runat="server" ID="btnConnect" Text="Connexion" OnClick="btnConnect_Click" />
    </div>
</asp:Content>
