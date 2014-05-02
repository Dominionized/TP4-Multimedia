using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
// Nécéssaire pour pouvoir effectuer des requêtes à la base de données.
using System.Data.OleDb;
// Nécéssaire pour obtenir la chaîne de connection.
using System.Configuration;

namespace TP4_Multimedia
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Courriel"] == null)
            {
                Response.Redirect("Connexion.aspx?Redirect=NouveauSujet.aspx");
            }
        }

        protected void btnCreerSujet_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                OleDbConnection connection = new OleDbConnection(ConfigurationManager.ConnectionStrings["tp3Database"].ConnectionString);
                connection.Open();

                OleDbCommand command = new OleDbCommand("INSERT INTO sujets (nom_sujet, auteur) VALUES (@titre_sujet, @auteur);", connection);
                command.Parameters.Add(new OleDbParameter("titre_sujet", txtTitreSujet.Text) { OleDbType = OleDbType.VarChar, Size = 255 });
                command.Parameters.Add(new OleDbParameter("auteur", Session["nomUtilisateur"]) { OleDbType = OleDbType.VarChar, Size = 255 });
                command.Prepare();
                command.ExecuteNonQuery();

                command = new OleDbCommand("SELECT @@IDENTITY;", connection);
                int idNouveauSujet = Convert.ToInt32(command.ExecuteScalar()); // Trouver l'ID du dernier sujet ajouté

                command = new OleDbCommand("INSERT INTO messages (message, auteur, sujet) VALUES (@message, @auteur, @sujet);", connection);
                command.Parameters.Add(new OleDbParameter("message", txtCorpsPremierMessage.Text) { OleDbType = OleDbType.LongVarChar, Size = 255 });
                command.Parameters.Add(new OleDbParameter("auteur", Session["nomUtilisateur"]) { OleDbType = OleDbType.VarChar, Size = 255 });
                command.Parameters.Add(new OleDbParameter("sujet", idNouveauSujet) { OleDbType = OleDbType.VarChar, Size = 255 });
                command.Prepare();
                command.ExecuteNonQuery();

                connection.Close();

                string URLNouveauSujet = "Messages.aspx?ID=" + idNouveauSujet;
                Response.Redirect(URLNouveauSujet);
            }
        }
    }
}