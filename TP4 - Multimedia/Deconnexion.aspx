<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Deconnexion.aspx.cs" Inherits="TP4_Multimedia.WebForm5" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div id="divDeconnexion">
        <%if (Session["Courriel"] != null)
          { %>
    Vous êtes connecté en tant que "<asp:Label runat="server" ID="lblNomUtilisateur"></asp:Label>"<br />
        <br />
        <asp:Button runat="server" Text="Se déconnecter" ID="btnDeconnexion" OnClick="btnDeconnexion_Click" />
        <%}
          else { Response.Redirect("Accueil.aspx"); }%>
    </div>
</asp:Content>
