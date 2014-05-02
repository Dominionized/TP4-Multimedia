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
    public partial class WebForm11 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Admin"] == null || (bool)Session["Admin"] == false)
            {
                Response.Redirect("Accueil.aspx");
            }
        }
    }
}