using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.StartPanel;
using System.Web.SessionState;

namespace New_application
{
    public partial class main : System.Web.UI.MasterPage
    {
        DataAccess obj = new DataAccess();
        DataTable dt = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            GenMenu();
        }
        DataTable executepro(string Action, string parentID)
        {
            SqlParameter[] para = new SqlParameter[]
            {
                new SqlParameter("@P_Action",SqlDbType.NVarChar,1000){ Value = Action},
                new SqlParameter("@P_RoleCode",SqlDbType.NVarChar,1000){ Value = Session["Role_Code"]},
                new SqlParameter("@P_Parent",SqlDbType.NVarChar,1000){ Value = parentID},
            };
            string MSG = obj.ExecuteSP("sp_Permission", para, out dt);
            return dt;
        }
        void GenMenu()
        {
            try
            {
                DataTable parent = executepro("node", "");
                string sMenuMarkup = "";
                for (int x = 0; x < parent.Rows.Count; x++)
                {
                    if (parent.Rows.Count > 0)
                    {
                        sMenuMarkup += "<li class='nav-item'> <a class='nav-link collapsed' href='#' data-bs-toggle='collapse' data-bs-target='#" + parent.Rows[x]["ParentID"].ToString() + x.ToString() + "' aria-controls='#" + parent.Rows[x]["ParentID"].ToString() + x.ToString() + "'> <i class='" + parent.Rows[x]["Icon"].ToString() + "'></i>" + parent.Rows[x]["Formname"].ToString() + "<i class='bi bi-chevron-down ms-auto'></i></a>";
                        sMenuMarkup += "<ul id='#" + parent.Rows[x]["ParentID"].ToString() + x.ToString() + "' class='nav-content collapse' data-parent='#" + parent.Rows[x]["ParentID"].ToString() + x.ToString() + "'>";
                        DataTable child = executepro("child", parent.Rows[x]["FormID"].ToString());
                        for (int y = 0; y < child.Rows.Count; y++)
                        {
                            sMenuMarkup += "<li><a class='collapse-item' target='I1' href='" + child.Rows[y]["PageUrl"].ToString() + "?f=" + child.Rows[y]["FormID"].ToString() + "&s=" + "'><i class='bi bi-circle'></i><span>" + child.Rows[y]["Formname"].ToString() + "</span></a></li>";
                        }
                        sMenuMarkup += "</ul></li>";
                    }
                }
                App_Menu.InnerHtml = HttpUtility.HtmlDecode(sMenuMarkup);
                pro_name.InnerText = Session["pro_name"].ToString();
                title_name.InnerText = Session["pro_name"].ToString();
                pro_dec.InnerText = Session["pro_decs"].ToString();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "pop", "alert('" + ex + "')", true);
            }
        }

    }
}