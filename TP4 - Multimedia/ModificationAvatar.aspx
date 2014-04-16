<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="ModificationAvatar.aspx.cs" Inherits="TP4_Multimedia.WebForm7" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="contentModificationAvatar" ContentPlaceHolderID="content" runat="server">
    <div id="divModificationAvatar">
        <h1>Modification de l'avatar</h1>
        Votre avatar actuel:<br />
        <asp:Image runat="server" ID="imgAvatarActuel" /><br />
        Choisissez un nouvel avatar:<br />
        <asp:FileUpload runat="server" ID="fuNouvelAvatar" />
        <asp:Button runat="server" ID="btnSumbitNouvelAvatar" Text="Modifier l'avatar" OnClick="btnSumbitNouvelAvatar_Click" /><br />
        <asp:CustomValidator runat="server" ID="validerNouvelAvatar" OnServerValidate="validerNouvelAvatar_ServerValidate" ErrorMessage="L'avatar doit être une image de 180x180."></asp:CustomValidator>
    </div>
</asp:Content>
