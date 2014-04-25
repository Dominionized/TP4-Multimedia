<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Nouvelles.aspx.cs" Inherits="TP4_Multimedia.Nouvelles" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="contentNouvelles" ContentPlaceHolderID="content" runat="server">
    <div class="contentWrapper">
        <h1>Nouvelles</h1>
        <asp:Literal runat="server" ID="conteneurNouvelles"></asp:Literal>
        <%if (Session["Courriel"] != null && (bool)Session["Moderateur"] == true) // Si l'utilisateur est un modo
          { %>
        <asp:TextBox ID="txtNouvelleTitre" runat="server"></asp:TextBox><br />
        <asp:TextBox ID="txtNouvelle" TextMode="MultiLine" runat="server" Height="300" Width="800"></asp:TextBox><br />
        <asp:Button runat="server" ID="btnAjouterNouvelle" Text="Ajouter une nouvelle" OnClick="btnAjouterNouvelle_Click" /><br />
        <asp:RequiredFieldValidator ID="txtNouvelleValidator" runat="server" ControlToValidate="txtNouvelle" ErrorMessage="La nouvelle ne doit pas être vide"></asp:RequiredFieldValidator> 
        <%} %>
    </div>
</asp:Content>
