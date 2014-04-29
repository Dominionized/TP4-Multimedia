using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.OleDb;
using System.Configuration;
using System.Text.RegularExpressions;

namespace TP4_Multimedia
{
    public partial class Nouvelles : System.Web.UI.Page
    {
        protected void Page_PreRender(object sender, EventArgs e)
        {
            const int nbCaracteresMax = 250;
            conteneurNouvelles.Text = "";
            OleDbConnection connection = new OleDbConnection(ConfigurationManager.ConnectionStrings["tp3Database"].ConnectionString);
            connection.Open();

            OleDbCommand command = new OleDbCommand("SELECT nouvelles.ID, nouvelles.titre, nouvelles.contenu, nouvelles.auteur, nouvelles.date_de_creation, utilisateurs.avatar FROM nouvelles, utilisateurs WHERE utilisateurs.pseudonyme = nouvelles.auteur;", connection);
            OleDbDataReader dataReader = command.ExecuteReader();


            while (dataReader.Read())
            {
                conteneurNouvelles.Text += "<div class=\"divNouvelle\">";
                conteneurNouvelles.Text += "<a href\"Article.aspx?ID=" + (int)dataReader[0] + "\"><h2>" + (string)dataReader[1] + "</h2></a>";
                conteneurNouvelles.Text += "<span class=\"date-auteur\"><img src=\"avatars/" + (string)dataReader[5] + "\"/>&nbsp;" + (string)dataReader[3] + ", le " + ((DateTime)dataReader[4]).ToLongDateString() + " à " + ((DateTime)dataReader[4]).ToShortTimeString() + ".</span><br/>";
                conteneurNouvelles.Text += "<p>";
                string messageWithoutHTML = Regex.Replace((string)dataReader[2], @"<[^>]+>|&nbsp;", "").Trim();
                if (messageWithoutHTML.Length > nbCaracteresMax)
                {
                    conteneurNouvelles.Text += messageWithoutHTML.Substring(0, nbCaracteresMax) + "...";
                }
                else
                {
                    conteneurNouvelles.Text += messageWithoutHTML;
                }
                conteneurNouvelles.Text += "<br/><a href=\"Article.aspx?ID=" + (int)dataReader[0] + "\">Lire l'article au complet</a>";
                conteneurNouvelles.Text += "</p>";
                conteneurNouvelles.Text += "</div>";

            }

            connection.Close();
        }

        protected void btnAjouterNouvelle_Click(object sender, EventArgs e)
        {
            Server.Transfer("AjouterNouvelle.aspx");
        }

        

    }
}