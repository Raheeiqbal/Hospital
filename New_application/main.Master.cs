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
            if (!IsPostBack)
            {
                bindsidebar();
            }
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

        void bindsidebar()
        {
            DataTable Node = executepro("node", "");
            Node.Dispose();
            rpt_menu.DataSource = Node;
            rpt_menu.DataBind();
            for (int i = 0; i < rpt_menu.Items.Count; i++)
            {
                DataTable child = executepro("child", Node.Rows[i]["FormID"].ToString());
                child.Dispose();

                Repeater obj_rpt_fom = (Repeater)rpt_menu.Items[i].FindControl("rpt_child");
                obj_rpt_fom.DataSource = child;
                obj_rpt_fom.DataBind();
            }
            //pro_name.InnerText = Session["pro_name"].ToString();
            //title_name.InnerText = Session["pro_name"].ToString();
            //pro_dec.InnerText = Session["pro_decs"].ToString();
        }

    }
}