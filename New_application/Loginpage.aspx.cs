using CRPL.Library.Oracle;
using CRPL.Library.SQLServer;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace New_application
{
    public partial class Loginpage : System.Web.UI.Page
    {
        DataAccess obj = new DataAccess();
        DataTable dt = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            login();
        }
        void executepro(string username, string password)
        {
            SqlParameter[] para = new SqlParameter[]
            {
                new SqlParameter("@P_userid",SqlDbType.VarChar,1000){ Value = username},
                new SqlParameter("@P_password",SqlDbType.VarChar,1000){ Value = password},
            };
            obj.ExecuteSP("sp_Userlogin", para, out dt);
            Session["role_code"] = dt.Rows[0]["role_code"].ToString();
            Session["user_name"] = dt.Rows[0]["user_id"].ToString();
        }
        private void login()
        {
            try
            {
                if (txtUsername.Text == "" && txtPassword.Text == "")
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "pop", "alert('invalid userid & password')", true);
                }
                executepro(txtUsername.Text, txtPassword.Text);
                if (dt.Rows.Count > 0)
                {
                    Response.Redirect("~/pages/frmDashboard.aspx", false);
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "pop", "alert('wrong userid & password')", true);
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "pop", "alert( '" + ex + "' )", true);
            }
        }
    }
}
