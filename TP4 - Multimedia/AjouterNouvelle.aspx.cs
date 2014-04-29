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
    public partial class WebForm10 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((bool)Session["Moderateur"] == false || Session["Courriel"] == null)
            {
                Response.Redirect("Nouvelles.aspx");
            }
        }

        protected void btnAjouterNouvelle_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                OleDbConnection connection = new OleDbConnection(ConfigurationManager.ConnectionStrings["tp3Database"].ConnectionString);
                connection.Open();

                OleDbCommand command = new OleDbCommand("INSERT INTO nouvelles (titre, contenu, auteur) VALUES (@titre, @corpsNouvelle,@nomUtilisateur);", connection);
                command.Parameters.Add(new OleDbParameter("titre", txtNouvelleTitre.Text) { OleDbType = OleDbType.VarChar, Size = 255 });
                command.Parameters.Add(new OleDbParameter("corpsNouvelle", txtNouvelle.Text) { OleDbType = OleDbType.LongVarChar, Size = 10000 });
                command.Parameters.Add(new OleDbParameter("nomUtilisateur", Session["nomUtilisateur"]) { OleDbType = OleDbType.VarChar, Size = 255 });
                command.Prepare();
                command.ExecuteNonQuery();

                connection.Close();

                txtNouvelle.Text = "";

                Response.Redirect("Nouvelles.aspx");

            }
        }


    }
}