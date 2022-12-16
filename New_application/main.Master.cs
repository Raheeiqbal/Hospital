using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace New_application
{
    public partial class main : System.Web.UI.MasterPage
    {
        DataAccess obj = new DataAccess();
        protected void Page_Load(object sender, EventArgs e)
        {
            GenMenu();
        }
        void GenMenu()
        {

            string sConstr = obj.connection();
            SqlDataAdapter adp = new SqlDataAdapter("select * from dynamic_menu", sConstr);
            DataTable dt = new DataTable();
            adp.Fill(dt);
            dt.Dispose();
            adp.Dispose();

            string sMenuMarkup = "";
            string currentPage = Path.GetFileName(Request.Url.AbsolutePath);
            DataRow[] parent = dt.Select("ParentID=" + 0);
            for (int x = 0; x < parent.Length; x++)
            {
                if (parent.Length > 0)
                {
                    sMenuMarkup += "<li class='nav-item'> <a class='nav-link collapsed' href='#' data-bs-toggle='collapse' data-bs-target='#" + parent[x]["ParentID"].ToString() + x.ToString() + "' aria-controls='#" + parent[x]["ParentID"].ToString() + x.ToString() + "'> <i class='bi bi-people-fill'></i>" + parent[x]["Formname"].ToString() + "<i class='bi bi-chevron-down ms-auto'></i></a>";
                    sMenuMarkup += "<ul id='#" + parent[x]["ParentID"].ToString() + x.ToString() + "' class='nav-content collapse' data-parent='#" + parent[x]["ParentID"].ToString() + x.ToString() + "'>";
                    DataRow[] child = dt.Select("ParentID=" + parent[x]["FormID"]);
                    for (int y = 0; y < child.Length; y++)
                    {
                        sMenuMarkup += "<li><a class='collapse-item' target='I1' href='" + child[y]["PageUrl"].ToString() + "?f=" + child[y]["FormID"].ToString() + "&s=" + "'><i class='bi bi-circle'></i><span>" + child[y]["Formname"].ToString() + "</span></a></li>";
                    }
                    sMenuMarkup += "</ul></li>";
                }
            }
            App_Menu.InnerHtml = HttpUtility.HtmlDecode(sMenuMarkup);
        }

    }
}