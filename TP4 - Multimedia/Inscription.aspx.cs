using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.IO;

using System.Data.OleDb;
using System.Configuration;

namespace TP4_Multimedia
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void submitButton_Click(object sender, EventArgs e)
        {
            //Ajout dans la base de donnée
            if (IsValid)
            {
                string filenameAvatar;
                if (fuAvatar.HasFile)
                {
                    string fileExtension = Path.GetFileName(fuAvatar.PostedFile.FileName);
                    filenameAvatar = txtInscriptionPseudo.Text + DateTime.Now.ToString("yyyyMMddhhmmss") + "." + fileExtension;
                }
                else
                {
                    filenameAvatar = "default_avatar_big.png";
                }
                fuAvatar.SaveAs(Server.MapPath("~/avatars/" + filenameAvatar));

                OleDbConnection connection = new OleDbConnection(ConfigurationManager.ConnectionStrings["tp3Database"].ConnectionString);
                connection.Open();

                OleDbCommand command = new OleDbCommand("INSERT INTO utilisateurs (pseudonyme, adresse_courriel, avatar, mot_de_passe) VALUES (@pseudonyme,@adresse_couriel,@avatar,@mot_de_passe);", connection);
                command.Parameters.Add(new OleDbParameter("pseudonyme", txtInscriptionPseudo.Text) { OleDbType = OleDbType.VarChar, Size = 255 });
                command.Parameters.Add(new OleDbParameter("adresse_couriel", txtInscriptionCourriel.Text) { OleDbType = OleDbType.VarChar, Size = 255 });
                command.Parameters.Add(new OleDbParameter("avatar", filenameAvatar) { OleDbType = OleDbType.VarChar, Size = 255 });
                command.Parameters.Add(new OleDbParameter("mot_de_passe", txtInscriptionPassword.Text) { OleDbType = OleDbType.VarChar, Size = 255 });
                command.Prepare();
                command.ExecuteNonQuery();

                connection.Close();
                Server.Transfer("ConfirmationInscription.aspx");
            }
        }
        protected void fuAvatarValidate_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (fuAvatar.HasFile)
            {
                System.Drawing.Image image = null;
                try
                {
                    image = System.Drawing.Image.FromStream(fuAvatar.PostedFile.InputStream);
                    if (image.Height != 180 || image.Width != 180)
                    {
                        args.IsValid = false;
                    }
                }
                catch
                {
                    args.IsValid = false;
                }
            }
        }
        protected void validerUsernameUniqueness_ServerValidate(object source, ServerValidateEventArgs args)
        {
            OleDbConnection connection = new OleDbConnection(ConfigurationManager.ConnectionStrings["tp3Database"].ConnectionString);
            connection.Open();

            OleDbCommand command = new OleDbCommand("SELECT pseudonyme FROM utilisateurs", connection);

            OleDbDataReader dataReader = command.ExecuteReader();

            while (dataReader.Read())
            {
                if (txtInscriptionPseudo.Text == dataReader[0].ToString())
                {
                    args.IsValid = false;
                    connection.Close();
                    return;
                }
            }
        }
    }
}