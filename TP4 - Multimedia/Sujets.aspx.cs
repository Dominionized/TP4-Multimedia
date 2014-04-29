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
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            tblSujets.Text += "<table class=\"tableauxForum\"><tr><th></th><th>Titre du sujet</th><th>Pseudonyme de l'auteur</th><th>Date de création</th></tr>";
            OleDbConnection connection = new OleDbConnection(ConfigurationManager.ConnectionStrings["tp3Database"].ConnectionString);
            connection.Open();

            OleDbCommand command = new OleDbCommand("SELECT ID, nom_sujet, auteur, date_de_création, isclosed FROM sujets ORDER BY date_de_création DESC;", connection);
            OleDbDataReader dataReader = command.ExecuteReader();

            while (dataReader.Read())
            {
                tblSujets.Text += "<tr>";
                if ((bool)dataReader["isclosed"] == true)
                {
                    tblSujets.Text += "<td width=\"5%\"><img src=\"~/assets/images/lock.png\" height=\"32\" width=\"32\"></td>";
                }
                else
                {
                    tblSujets.Text += "<td width=\"5%\"></td>";
                }
                tblSujets.Text += "<td width=\"55%\"><a href=\"Messages.aspx?ID=" + dataReader[0].ToString() + "\">" + (string)dataReader[1] + "</a></td>"; // Lien
                tblSujets.Text += "<td width=\"20%\">" + (string)dataReader[2] + "</td>";
                tblSujets.Text += "<td width=\"20%\">" + dataReader[3].ToString() + "</td>";
                tblSujets.Text += "</tr>";
            }

            connection.Close();

            tblSujets.Text += "</table>";
        }
    }
}