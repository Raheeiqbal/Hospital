using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Markup;
using static System.Net.Mime.MediaTypeNames;
using static System.Runtime.CompilerServices.RuntimeHelpers;
using System.Security.Cryptography;
using System.Web.Optimization;

namespace New_application.Lov
{
    public partial class LovRole : System.Web.UI.Page
    {
        DataAccess obj = new DataAccess();
        DataTable dt = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                fill();
            }

        }
        void fill()
        {
            ExecutePro("SG");
            if (dt.Rows.Count > 0)
            {
                rpt_data.DataSource = dt;
                rpt_data.DataBind();
            }
        }
        void ExecutePro(string pAction)
        {
            SqlParameter[] para = new SqlParameter[]
            {
                new SqlParameter("@P_Action",SqlDbType.VarChar, 1000){ Value = pAction},
                new SqlParameter("@P_User", SqlDbType.VarChar, 1000){ Value = "" },
                new SqlParameter("@P_FormID", SqlDbType.VarChar, 1000){ Value = ""},
                new SqlParameter("@P_RoleCode", SqlDbType.VarChar, 1000) { Value = ""},
                new SqlParameter("@P_RoleName", SqlDbType.VarChar, 1000) { Value = ""},
                new SqlParameter("@P_XMLR", SqlDbType.VarChar, 1000) { Value = ""},
                new SqlParameter("@P_XMLD", SqlDbType.VarChar, 1000) { Value = ""},
            };
            string MSG = obj.ExecuteSP("sp_Rolesetup", para, out dt);
        }

        protected void btnSelect_Click(object sender, EventArgs e)
        {
            try
            {
                int rowindex = ((RepeaterItem)((Button)sender).NamingContainer).ItemIndex;
                string code = Request.QueryString["ControlID"].ToString();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "ExPop", "ClosePop('" + code + "','" + ((Label)rpt_data.Items[rowindex].FindControl("RoleCo")).Text + "','" + ((Label)rpt_data.Items[rowindex].FindControl("RoleNa")).Text + "');", true);
            }
            catch (Exception ex)
            {

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "MSG", "alert('" + ex + "')", true);
            }

        }

        protected void rpt_data_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

        }
    }
}