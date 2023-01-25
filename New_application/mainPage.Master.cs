using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace New_application
{
    public partial class mainPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["pro_name"] == null)
            {
                Response.Redirect("~/404.html", true);
                return;
            }
            //else
            //{
            //    if (!Request.Url.ToString().Contains("FrmDashboard.aspx") && !Request.Url.ToString().Contains("UserStatus.aspx"))
            //    {
            //        string[] splitURl = Request.Url.AbsoluteUri.Split('/');

            //    }
            //}
        }
    }
}