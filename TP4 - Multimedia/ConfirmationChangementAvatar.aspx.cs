﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TP4_Multimedia
{
    public partial class ConfirmationChangementAvatar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void buttonRedirectHomePage_Click(object sender, EventArgs e)
        {
            Response.Redirect("Accueil.aspx");
        }
    }
}