using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.OleDb;
using System.Configuration;

namespace TP4_Multimedia
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnConnect_Click(object sender, EventArgs e)
        {
            if (IsValid) // Le validateur valide si le courriel correspond au mot de passe.
            {
                OleDbConnection connection = new OleDbConnection(ConfigurationManager.ConnectionStrings["tp3Database"].ConnectionString);
                connection.Open();

                OleDbCommand command = new OleDbCommand("SELECT pseudonyme, avatar, admin, modo FROM utilisateurs WHERE adresse_courriel = @adresse_courriel;", connection);
                command.Parameters.Add(new OleDbParameter("adresse_courriel", txtCourriel.Text) { OleDbType = OleDbType.VarChar, Size = 255 });
                command.Prepare();

                OleDbDataReader dataReader = command.ExecuteReader();
                if (dataReader.Read())
                {
                    Session["nomUtilisateur"] = (string)dataReader[0];
                    Session["pathAvatar"] = "avatars/" + (string)dataReader[1];
                    Session["Admin"] = (bool)dataReader[2];
                    Session["Moderateur"] = (bool)dataReader[3];
                }

                connection.Close();

                Session["Courriel"] = txtCourriel.Text;
                if (Request["Redirect"] != null)
                {
                    Response.Redirect(Request["Redirect"]);
                }
                else
                {
                    Response.Redirect("Accueil.aspx");
                }
            }
        }

        protected void validateEmailPasswordBanned_ServerValidate(object source, ServerValidateEventArgs args)
        {
            OleDbConnection connection = new OleDbConnection(ConfigurationManager.ConnectionStrings["tp3Database"].ConnectionString);
            connection.Open();

            OleDbCommand command = new OleDbCommand("SELECT adresse_courriel, mot_de_passe FROM utilisateurs WHERE adresse_courriel=@adresse_courriel AND mot_de_passe=@mot_de_passe AND banned=FALSE;", connection);
            command.Parameters.Add(new OleDbParameter("adresse_courriel", txtCourriel.Text) { OleDbType = OleDbType.VarChar, Size = 255 });
            command.Parameters.Add(new OleDbParameter("mot_de_passe", txtPassword.Text) { OleDbType = OleDbType.VarChar, Size = 255 });

            OleDbDataReader dataReader = command.ExecuteReader();

            if (dataReader.Read())
            {
                args.IsValid = true;
                return;
            }
            else
            {
                args.IsValid = false;
            }
        }
    }
}
