<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Accueil.aspx.cs" Inherits="TP4_Multimedia.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="contentAccueil" ContentPlaceHolderID="content" runat="server">
    <section class="red">
        <div class="contentWrapper">
            <img src="assets/images/weakend_home.svg" alt="" class="left" />
            <h1>Le groupe de gentils marins Weak End !</h1>
            <p>
                Nous sommes des très gentils marins informatiques, toujours prêts à faire le bien pour aider nos compatriotes ! Nous ne pratiquons, ahem, en aucun cas toute sorte de, ahem, piraterie ! Venez nous joindre sur nos <a href="Sujets.aspx">forums</a> dès maintenant ! ... S'il vous plait ?
            </p>
        </div>
    </section>
</asp:Content>
