<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Administration.aspx.cs" Inherits="TP4_Multimedia.WebForm9" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div class="contentWrapper">
        <h1>Administration</h1>
        <div class="tableauxForum">
            <asp:GridView ID="grdAdmin" runat="server" AutoGenerateColumns="False" DataSourceID="Admin" DataKeyNames="pseudonyme">
                <Columns>
                    <asp:BoundField DataField="pseudonyme" ReadOnly="true" HeaderText="Utilisateurs" SortExpression="pseudonyme" />
                    <asp:BoundField DataField="adresse_courriel" ReadOnly="true" HeaderText="Email" SortExpression="adresse_courriel" />
                    <asp:CheckBoxField DataField="admin" HeaderText="Administrateur" SortExpression="admin" />
                    <asp:CheckBoxField DataField="modo" HeaderText="Modérateur" SortExpression="modo" />
                    <asp:CommandField HeaderText="Modifier" ShowEditButton="True" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="Admin" runat="server" ConnectionString="<%$ ConnectionStrings:tp3Database %>" ProviderName="<%$ ConnectionStrings:tp3Database.ProviderName %>" SelectCommand="SELECT [pseudonyme], [adresse_courriel], [admin], [modo] FROM [utilisateurs]" InsertCommand="INSERT INTO [utilisateurs] ([admin], [modo]) VALUES (?, ?)" UpdateCommand="UPDATE [utilisateurs] SET [admin] = ?, [modo] = ? WHERE [pseudonyme] = ?">
                <InsertParameters>
                    <asp:Parameter Name="admin" Type="Boolean" />
                    <asp:Parameter Name="modo" Type="Boolean" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="admin" Type="Boolean" />
                    <asp:Parameter Name="modo" Type="Boolean" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>
