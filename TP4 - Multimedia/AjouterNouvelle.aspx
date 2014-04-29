<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="AjouterNouvelle.aspx.cs" Inherits="TP4_Multimedia.WebForm10" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="contentAjouterNouvelle" ContentPlaceHolderID="content" runat="server">
    <div class="contentWrapper">
        <h1>Ajouter une nouvelle</h1>
        Titre de la nouvelle :<br />
        <asp:TextBox ID="txtNouvelleTitre" runat="server" Width="400" MaxLength="140"></asp:TextBox><br />
        Corps :<br />
        <asp:TextBox ID="txtNouvelle" TextMode="MultiLine" runat="server" Height="500" Width="800"></asp:TextBox><br />
        <asp:RequiredFieldValidator ID="txtNouvelleValidator" runat="server" ControlToValidate="txtNouvelle" ErrorMessage="La nouvelle ne doit pas être vide"></asp:RequiredFieldValidator><br />
        <asp:Button runat="server" ID="btnAjouterNouvelle" Text="Ajouter une nouvelle" OnClick="btnAjouterNouvelle_Click" /><br />
    </div>
</asp:Content>