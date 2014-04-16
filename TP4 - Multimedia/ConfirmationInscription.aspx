<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="ConfirmationInscription.aspx.cs" Inherits="TP4_Multimedia.ConfirmationInscription" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="ContentConfirmationInscription" ContentPlaceHolderID="content" runat="server">
    <div class="contentWrapper">
        <div class="divConfirmation">
            <h1>Votre inscription s'est effectué avec succès.</h1>
            <asp:Button ID="buttonRedirectConnexion" runat="server" Text="Se connecter" OnClick="buttonRedirectConnexion_Click" /><br />
            <asp:Button ID="buttonRedirectHomePage" runat="server" Text="Retourner à la page d'accueil" OnClick="buttonRedirectHomePage_Click" />
        </div>
    </div>
</asp:Content>
