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
        <% if (Session["Courriel"] != null)
           { //Si l'utilisateur est connecté %>
        <h1>Répondre au sujet</h1>
        <% 
            if ((bool)Session["isClosed"] == true) {messagePost.Visible = false;}
           %>
        <div runat="server" id="messagePost">
        <asp:TextBox runat="server" TextMode="MultiLine" ID="txtNouveauMessage" Width="800" Height="300"></asp:TextBox><br />
        <asp:Button runat="server" ID="btnSubmitNouveauMessage" Text="Soumettre" OnClick="btnSubmitNouveauMessage_Click" /><br />
        <asp:Button ID="btnCloseSujet" runat="server" Text="Button" OnClick="btnCloseSujet_Click"  />
        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtNouveauMessage" ErrorMessage="Vous devez entrer un message."></asp:RequiredFieldValidator>
      </div>
            
    </div>
    <%if (IsPostBack)
      { %>
    <script>
        $(document).ready(function () { $('#confirmationNouveauMessage').slideDown(); })
    </script>
    <%} %>
</asp:Content>
