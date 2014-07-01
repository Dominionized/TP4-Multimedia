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
    public partial class Article : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            articleContent.Text = "";

            int parseResult;
            if (Request.QueryString["ID"] == null || int.TryParse(Request.QueryString["ID"], out parseResult) == false)
            {
                Response.Redirect("Nouvelles.aspx");
            }

            int idSujet = int.Parse(Request.QueryString["ID"]);

            OleDbConnection connection = new OleDbConnection(ConfigurationManager.ConnectionStrings["tp3Database"].ConnectionString);
            connection.Open();

            OleDbCommand command = new OleDbCommand("SELECT nouvelles.titre, nouvelles.contenu, nouvelles.auteur, nouvelles.date_de_creation, utilisateurs.avatar FROM nouvelles, utilisateurs WHERE nouvelles.id = @id;", connection);
            command.Parameters.Add(new OleDbParameter("id", idSujet) { OleDbType = OleDbType.Integer, Size = 255 });
            OleDbDataReader dataReader = command.ExecuteReader();

            if (dataReader.Read())
            {
                articleContent.Text += "<h1>" + (string)dataReader[0] + "</h1>";
                articleContent.Text += "<span class=\"date-auteur\"><img src=\"avatars/" + (string)dataReader[4] + "\" class=\"article\"/>&nbsp;" + (string)dataReader[2] + ", le " + ((DateTime)dataReader[3]).ToLongDateString() + " à " + ((DateTime)dataReader[3]).ToShortTimeString() + ".</span><br/>";
                articleContent.Text += "<p class=\"article\">" + dataReader[1].ToString().Replace("\r\n", "<br />") + "</p>";
            }
            else
            {
                Response.Redirect("Nouvelles.aspx");
            }
        }
    }
}