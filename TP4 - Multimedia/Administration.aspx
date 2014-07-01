<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Administration.aspx.cs" Inherits="TP4_Multimedia.WebForm11" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div class="contentWrapper">
        <h1>Administration</h1>
        <div class="tableauxForum">
            <asp:GridView ID="grdAdmin" runat="server" AutoGenerateColumns="False" DataSourceID="Admin" DataKeyNames="id">
                <Columns>
                    <asp:BoundField DataField="pseudonyme" HeaderText="Utilisateurs" SortExpression="pseudonyme" />
                    <asp:BoundField DataField="adresse_courriel" HeaderText="Email" SortExpression="adresse_courriel" />
                    <asp:CheckBoxField DataField="admin" HeaderText="Administrateur" SortExpression="admin" />
                    <asp:CheckBoxField DataField="modo" HeaderText="Modérateur" SortExpression="modo" />
                    <asp:BoundField DataField="id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id" Visible="False" />
                    <asp:CommandField HeaderText="Modifier" ShowEditButton="True" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="Admin" runat="server" ConnectionString="<%$ ConnectionStrings:tp3Database %>" ProviderName="<%$ ConnectionStrings:tp3Database.ProviderName %>" SelectCommand="SELECT [pseudonyme], [adresse_courriel], [admin], [modo], [id] FROM [utilisateurs]" DeleteCommand="DELETE FROM [utilisateurs] WHERE [id] = ?" InsertCommand="INSERT INTO [utilisateurs] ([pseudonyme], [adresse_courriel], [admin], [modo], [id]) VALUES (?, ?, ?, ?, ?)" UpdateCommand="UPDATE [utilisateurs] SET [pseudonyme] = ?, [adresse_courriel] = ?, [admin] = ?, [modo] = ? WHERE [id] = ?">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="pseudonyme" Type="String" />
                    <asp:Parameter Name="adresse_courriel" Type="String" />
                    <asp:Parameter Name="admin" Type="Boolean" />
                    <asp:Parameter Name="modo" Type="Boolean" />
                    <asp:Parameter Name="id" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="pseudonyme" Type="String" />
                    <asp:Parameter Name="adresse_courriel" Type="String" />
                    <asp:Parameter Name="admin" Type="Boolean" />
                    <asp:Parameter Name="modo" Type="Boolean" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>
