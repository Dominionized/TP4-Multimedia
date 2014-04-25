<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Nouvelles.aspx.cs" Inherits="TP4_Multimedia.Nouvelles" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="contentNouvelles" ContentPlaceHolderID="content" runat="server">
    <div class="contentWrapper">
        <h1>Nouvelles</h1>
        <asp:Literal runat="server" ID="conteneurNouvelles"></asp:Literal>
        <%if (Session["Courriel"] != null && (bool)Session["Moderateur"] == true) // Si l'utilisateur est un modo
          { %>

        <asp:Button runat="server" ID="btnAjouterNouvelle" Text="Ajouter une nouvelle" OnClick="btnAjouterNouvelle_Click" /><br />
        <%} %>
    </div>
</asp:Content>
