﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.OleDb;
using System.Configuration;

namespace TP4_Multimedia
{
    public partial class WebForm8 : System.Web.UI.Page
    {
        protected void Page_PreRender(object sender, EventArgs e)
        {
            btnCloseSujet.Visible = false;
            if ((bool)Session["Admin"] == true)
            {
                btnCloseSujet.Visible = true;
            }
            int parseResult;
            if (Request.QueryString["ID"] == null || int.TryParse(Request.QueryString["ID"], out parseResult) == false)
            {
                Response.Redirect("Sujets.aspx");
            }

            int idSujet = int.Parse(Request.QueryString["ID"]);

            tblMessages.Text = "";
            tblMessages.Text += "<table class=\"tableauxForum\">";

            OleDbConnection connection = new OleDbConnection(ConfigurationManager.ConnectionStrings["tp3Database"].ConnectionString);
            connection.Open();

            OleDbCommand command = new OleDbCommand("SELECT messages.message, messages.auteur, messages.date_de_creation, utilisateurs.avatar FROM messages, utilisateurs WHERE messages.sujet = @id AND utilisateurs.pseudonyme = messages.auteur ORDER BY messages.date_de_creation;", connection);
            command.Parameters.Add(new OleDbParameter("id", idSujet) { OleDbType = OleDbType.Integer, Size = 255 });
            OleDbDataReader dataReader = command.ExecuteReader();

            TimeSpan timespan;

            while (dataReader.Read())
            {
                timespan = DateTime.Now - (DateTime)dataReader[2];
                tblMessages.Text += "<tr>";
                tblMessages.Text += "<td width=\"180px\">" + dataReader[1].ToString() + "<br/><img src=\"avatars/" + dataReader[3] + "\"/></td>";
                tblMessages.Text += "<td><span class=\"texteDate\">" + timespan.ToString("'Il y a '%d' jours, '%h' heures, '%m' minutes et '%s' secondes'") + "</span><p>" + dataReader[0].ToString().Replace("\r\n", "<br />") + "</p></td>";
                tblMessages.Text += "</tr>";
            }
            tblMessages.Text += "</table>";

            command = new OleDbCommand("SELECT nom_sujet FROM sujets WHERE ID = @id;", connection);
            command.Parameters.Add(new OleDbParameter("id", idSujet) { OleDbType = OleDbType.Integer, Size = 255 });
            dataReader = command.ExecuteReader();

            if (dataReader.Read())
            {
                lblTitreSujet.Text = dataReader[0].ToString();
            }

            connection.Close();

        }

        protected void btnSubmitNouveauMessage_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                int parseResult;
                if (Request.QueryString["ID"] == null || int.TryParse(Request.QueryString["ID"], out parseResult) == false)
                {
                    Response.Redirect("Sujets.aspx");
                }

                int idSujet = int.Parse(Request.QueryString["ID"]);

                OleDbConnection connection = new OleDbConnection(ConfigurationManager.ConnectionStrings["tp3Database"].ConnectionString);
                connection.Open();

                OleDbCommand command = new OleDbCommand("INSERT INTO messages (message, auteur, sujet) VALUES (@corpsNouveauMessage,@nomUtilisateur,@id);", connection);
                command.Parameters.Add(new OleDbParameter("corpsNouveauMessage", txtNouveauMessage.Text) { OleDbType = OleDbType.LongVarChar, Size = 255 });
                command.Parameters.Add(new OleDbParameter("nomUtilisateur", Session["nomUtilisateur"]) { OleDbType = OleDbType.VarChar, Size = 255 });
                command.Parameters.Add(new OleDbParameter("id", idSujet) { OleDbType = OleDbType.Integer, Size = 255 });
                command.Prepare();
                command.ExecuteNonQuery();

                connection.Close();

                txtNouveauMessage.Text = "";

            }
        }

        protected void btnCloseSujet_Click(object sender, EventArgs e)
        {
            OleDbConnection connection = new OleDbConnection(ConfigurationManager.ConnectionStrings["tp3Database"].ConnectionString);
            connection.Open();

            OleDbCommand command = new OleDbCommand("UPDATE sujets SET isclosed= true WHERE ID=@id", connection);
            command.Parameters.Add(new OleDbParameter("id", Request.QueryString["ID"]) { OleDbType = OleDbType.VarChar, Size = 255 });
            command.Prepare();
            command.ExecuteNonQuery();

            OleDbCommand command1 = new OleDbCommand("SELECT isclosed FROM sujets WHERE ID=@id", connection);
            command1.Parameters.Add(new OleDbParameter("id", Request.QueryString["ID"]) { OleDbType = OleDbType.VarChar, Size = 255 });
            OleDbDataReader dataReader = command.ExecuteReader();
            if (dataReader.Read())
            {
                Session["isClosed"] = (bool)dataReader["isclosed"];
            }
           
        }
    }
}