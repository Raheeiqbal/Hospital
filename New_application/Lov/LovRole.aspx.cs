using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Markup;

namespace New_application.Lov
{
    public partial class LovRole : System.Web.UI.Page
    {
        DataAccess obj = new DataAccess();
        DataTable dt = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            fill();

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
            string FINUNIQUENUM = grdprview.Rows[((GridViewRow)((LinkButton)sender).NamingContainer).RowIndex].Cells[2].Text;
            string xx = rpt_data.Items[((RepeaterItem)((Button)sender).NamingContainer).ItemIndex].ToString();
        }
    }
}