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
    public partial class WebForm7 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Courriel"] == null)
            {
                Response.Redirect("Connexion.aspx");
            }

            imgAvatarActuel.ImageUrl = (string)Session["pathAvatar"];
        }

        protected void validerNouvelAvatar_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = fuNouvelAvatar.HasFile;
            if (args.IsValid)
            {
                try
                {
                    System.Drawing.Image image = System.Drawing.Image.FromStream(fuNouvelAvatar.FileContent);
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

        protected void btnSumbitNouvelAvatar_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                string fileExtension = Path.GetFileName(fuNouvelAvatar.PostedFile.FileName);
                string filenameAvatar = (string)Session["nomUtilisateur"] + DateTime.Now.ToString("yyyyMMddhhmmss") + "." + fileExtension;
                string savePath = Server.MapPath("~/avatars/" + filenameAvatar);
                fuNouvelAvatar.SaveAs(savePath);

                OleDbConnection connection = new OleDbConnection(ConfigurationManager.ConnectionStrings["tp3Database"].ConnectionString);
                connection.Open();

                OleDbCommand command = new OleDbCommand("UPDATE utilisateurs SET avatar=@nouvelavatar WHERE pseudonyme=@pseudonyme", connection);
                command.Parameters.Add(new OleDbParameter("nouvelavatar", filenameAvatar) { OleDbType = OleDbType.VarChar, Size = 255 });
                command.Parameters.Add(new OleDbParameter("pseudonyme", (string)Session["nomUtilisateur"]) { OleDbType = OleDbType.VarChar, Size = 255 });
                command.Prepare();

                connection.Close();

                Session["pathAvatar"] = "avatars/" + filenameAvatar;
                Server.Transfer("ConfirmationChangementAvatar.aspx");
            }
        }
    }
}