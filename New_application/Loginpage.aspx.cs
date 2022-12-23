using CRPL.Library.Oracle;
using CRPL.Library.SQLServer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace New_application
{
    public partial class Loginpage : System.Web.UI.Page
    {
        DataAccess obj = new DataAccess();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            login();
        }

        private void login()
        {
            try
            {
                if (txtUsername.Text == "" && txtPassword.Text == "")
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "pop", "alert('invalid userid & password')", true);
                }
                DataTable dt = obj.sqladapter("sp_Userlogin", txtUsername.Text, txtPassword.Text);
                if (dt.Rows.Count > 0)
                {
                    Response.Redirect("./pages/frmDashboard.aspx");
                    //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "pop", "alert('login success')", true);
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
