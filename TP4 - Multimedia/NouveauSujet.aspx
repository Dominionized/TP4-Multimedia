<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="NouveauSujet.aspx.cs" Inherits="TP4_Multimedia.WebForm6" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="contentNouveauSujet" ContentPlaceHolderID="content" runat="server">
    <div class="contentWrapper">
        <h1>Créer un nouveau sujet</h1>
        Titre du sujet<br />
        <asp:TextBox runat="server" ID="txtTitreSujet" Width="400"></asp:TextBox><br />
        Corps du premier message<br />
        <asp:TextBox runat="server" ID="txtCorpsPremierMessage" TextMode="MultiLine" Width="700" Height="400"></asp:TextBox><br />
        <asp:Button runat="server" ID="btnCreerSujet" Text="Créer le sujet" OnClick="btnCreerSujet_Click" /><br />
        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtTitreSujet" ErrorMessage="Le titre ne doit pas être vide."></asp:RequiredFieldValidator><br />
        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtCorpsPremierMessage" ErrorMessage="Le corps ne doit pas être vide."></asp:RequiredFieldValidator>
    </div>
</asp:Content>
