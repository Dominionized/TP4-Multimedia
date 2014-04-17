﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TP4_Multimedia
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblNomUtilisateur.Text = (string)Session["nomUtilisateur"];
        }

        protected void btnDeconnexion_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Accueil.aspx");
        }
    }
}