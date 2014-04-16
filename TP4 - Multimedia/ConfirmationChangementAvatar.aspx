<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="ConfirmationChangementAvatar.aspx.cs" Inherits="TP4_Multimedia.ConfirmationChangementAvatar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="ContentConfirmationChangementAvatar" ContentPlaceHolderID="content" runat="server">
    <div class="contentWrapper">
        <div class="divConfirmationChangementAvatar">
            <h1>Le changement de votre avatar s'est effectué avec succès</h1>
            <asp:Button ID="buttonRedirectHomePage" runat="server" Text="Retour à la page d'accueil" OnClick="buttonRedirectHomePage_Click" />
        </div>
    </div>
</asp:Content>
