<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="AjouterNouvelle.aspx.cs" Inherits="TP4_Multimedia.WebForm10" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="contentAjouterNouvelle" ContentPlaceHolderID="content" runat="server">
    <div id="contentWrapper">
        <asp:TextBox ID="txtNouvelleTitre" runat="server"></asp:TextBox><br />
        <asp:TextBox ID="txtNouvelle" TextMode="MultiLine" runat="server" Height="300" Width="800"></asp:TextBox><br />
        <asp:RequiredFieldValidator ID="txtNouvelleValidator" runat="server" ControlToValidate="txtNouvelle" ErrorMessage="La nouvelle ne doit pas être vide"></asp:RequiredFieldValidator> 
        <asp:Button runat="server" ID="btnAjouterNouvelle" Text="Ajouter une nouvelle" OnClick="btnAjouterNouvelle_Click" /><br />
    </div>
</asp:Content>