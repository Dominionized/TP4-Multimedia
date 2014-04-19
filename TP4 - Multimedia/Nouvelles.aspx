<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Nouvelles.aspx.cs" Inherits="TP4_Multimedia.Nouvelles" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="contentNouvelles" ContentPlaceHolderID="content" runat="server">
    <div class="contentWrapper">
        <h1>Nouvelles</h1>
        <%if (Session["Courriel"] != null && (bool)Session["moderateur"] == true) // Si l'utilisateur est un modo
          { %>
        <br /><asp:Button runat="server" ID="btnAjouterNouvelle" Text="Ajouter une nouvelle" /><br />
        <%} %>
        <asp:Literal runat="server" ID="tblNouvelles"
    </div>
</asp:Content>
