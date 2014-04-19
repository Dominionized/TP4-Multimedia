<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Sujets.aspx.cs" Inherits="TP4_Multimedia.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="contentSujets" ContentPlaceHolderID="content" runat="server">
    <div class="contentWrapper">
        <h1>Forums</h1>
        <a href="NouveauSujet.aspx" id="creerNouveauSujet">
            <div>Créer un nouveau sujet</div>
        </a>
        <asp:Literal runat="server" ID="tblSujets"></asp:Literal>
    </div>
</asp:Content>
