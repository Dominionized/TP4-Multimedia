<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Messages.aspx.cs" Inherits="TP4_Multimedia.WebForm8" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="contentMessages" ContentPlaceHolderID="content" runat="server">
    <div id="confirmationNouveauMessage" style="display: none;" onclick="$(this).slideUp();">
        Votre message a bien été créé
    </div>

    <div class="contentWrapper">
        <h1>
            <asp:Label runat="server" ID="lblTitreSujet"></asp:Label></h1>
        <asp:Literal runat="server" ID="tblMessages"></asp:Literal>


        <div runat="server" id="messagePost">
            <% if (Session["Courriel"] != null)
               { %>
            <h1 runat="server" id="repAuSujetTitle">Répondre au sujet</h1>
            <asp:TextBox runat="server" TextMode="MultiLine" ID="txtNouveauMessage" Width="800" Height="300"></asp:TextBox><br />
            <asp:Button runat="server" ID="btnSubmitNouveauMessage" Text="Soumettre" OnClick="btnSubmitNouveauMessage_Click" /><br />
            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtNouveauMessage" ErrorMessage="Vous devez entrer un message."></asp:RequiredFieldValidator><br />

            <%} %>
        </div>
        <asp:Button ID="btnCloseSujet" runat="server" Text="Fermer le sujet" OnClick="btnCloseSujet_Click" CausesValidation="false" />
    </div>
    <%if (Request["NouveauMessage"] != null)
      { %>
    <script>
        $(document).ready(function () { $('#confirmationNouveauMessage').slideDown(); })
    </script>
    <%} %>
</asp:Content>
