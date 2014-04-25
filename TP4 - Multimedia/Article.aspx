<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Article.aspx.cs" Inherits="TP4_Multimedia.WebForm9" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="contentArticle" ContentPlaceHolderID="content" runat="server">
    <div class="contentWrapper">
        <asp:Literal runat="server" ID="articleContent"></asp:Literal>
    </div>
</asp:Content>
