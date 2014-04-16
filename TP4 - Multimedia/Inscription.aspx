<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Inscription.aspx.cs" Inherits="TP4_Multimedia.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="contentInscription" ContentPlaceHolderID="content" runat="server" class="blue">
    <section class="blue">
        <div class="contentWrapper">
            <h1>S'inscrire sur les forums Weak End</h1>
            <p>Pour vous inscrire sur les forums, veuillez entrer les informations suivantes.</p>
            <div id="inscriptionLeft">
                Pseudonyme<br />
                <asp:TextBox runat="server" ID="txtInscriptionPseudo"></asp:TextBox><br />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtInscriptionPseudo" ErrorMessage="Le pseudonyme est obligatoire" Display="none"></asp:RequiredFieldValidator>
                <asp:CustomValidator runat="server" ControlToValidate="txtInscriptionPseudo" ErrorMessage="L'utilisateur existe déjà" Display="None" ID="validerUsernameUniqueness" OnServerValidate="validerUsernameUniqueness_ServerValidate"></asp:CustomValidator>
                Mot de passe<br />
                <asp:TextBox runat="server" type="password" ID="txtInscriptionPassword"></asp:TextBox><br />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtInscriptionPassword" ErrorMessage="Le mot de passe est obligatoire" Display="none"></asp:RequiredFieldValidator>
                Adresse courriel<br />
                <asp:TextBox runat="server" Width="200" ID="txtInscriptionCourriel"></asp:TextBox><br />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtInscriptionCourriel" ErrorMessage="L'adresse courriel est obligatoire" Display="none"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator runat="server" Display="None" ControlToValidate="txtInscriptionCourriel" ValidationExpression=".+\@.+\..+" ErrorMessage="L'adresse courriel doit être valide"></asp:RegularExpressionValidator>
                Avatar<br />
                <asp:FileUpload runat="server" ID="fuAvatar" accept="image/*" /><br />
                <asp:CustomValidator runat="server" ID="fuAvatarValidator" OnServerValidate="fuAvatarValidate_ServerValidate" Display="None" ErrorMessage="Vous devez fournir une image valide de 180x180"></asp:CustomValidator>
                <br />
                <asp:Button runat="server" Text="Soumettre" ID="btnSubmitInscription" OnClick="submitButton_Click"></asp:Button>
            </div>
            <div id="inscriptionRight">
                <asp:ValidationSummary runat="server" />
            </div>
        </div>
    </section>
</asp:Content>
