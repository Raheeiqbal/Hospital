using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Web.Security;

namespace New_application.Admin
{
    public partial class frmRoleSetup : System.Web.UI.Page
    {
        DataAccess obj = new DataAccess();
        DataTable data = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                filldata();
            }
        }
        void filldata()
        {
            ExecuteProc("F", "", "", "");
            if (data.Rows.Count > 0)
            {
                rpt_data.DataSource = data;
                rpt_data.DataBind();
            }
            ExecuteProc("Code", "", "", "");
            if (data.Rows.Count > 0)
            {
                txtrolcode.Text = data.Rows[0][0].ToString(); Session["Code"] = data.Rows[0][0].ToString();
            }
        }
        void ExecuteProc(string pAction, string pFormID, string pRoleCode, string pRoleName)
        
        {
            string XMLR = "<Role>";
            if (Session["Code"] != null)
            {
                XMLR += "<RoleCode>" + Session["Code"].ToString().ToUpper() + "</RoleCode>";
            }
            XMLR += "<RoleName>" + txtrolName.Text + "</RoleName>";
            XMLR += "</Role>";

            string XMLD = "<RoleDetail>";

            for (int i = 0; i < rpt_data.Items.Count; i++)
            {
                XMLD += "<Row>";
                if (Session["Code"] != null)
                {
                    XMLD += "<RoleCode>" + Session["Code"].ToString() + "</RoleCode>";
                }
                XMLD += "<FormID>" + ((Label)rpt_data.Items[i].FindControl("FormID")).Text + "</FormID>";
                XMLD += "<FormName>" + ((Label)rpt_data.Items[i].FindControl("Formname")).Text + "</FormName>";
                XMLD += "<View>" + (((CheckBox)rpt_data.Items[i].FindControl("CHK_VIEW")).Checked ? "1" : "0") + "</View>";
                XMLD += "<Insert>" + (((CheckBox)rpt_data.Items[i].FindControl("CHK_INS")).Checked ? "1" : "0") + "</Insert>";
                XMLD += "<Update>" + (((CheckBox)rpt_data.Items[i].FindControl("CHK_UPD")).Checked ? "1" : "0") + "</Update>";
                XMLD += "</Row>";

            }
            XMLD += "</RoleDetail>";
            SqlParameter[] para = new SqlParameter[]
            {
                new SqlParameter("@P_Action",SqlDbType.VarChar, 1000){ Value = pAction},
                new SqlParameter("@P_User", SqlDbType.VarChar, 1000){ Value = "" },
                new SqlParameter("@P_FormID", SqlDbType.VarChar, 1000){ Value = ""},
                new SqlParameter("@P_RoleCode", SqlDbType.VarChar, 1000) { Value = pRoleCode},
                new SqlParameter("@P_RoleName", SqlDbType.VarChar, 1000) { Value = pRoleName},
                new SqlParameter("@P_XMLR", SqlDbType.VarChar, 1000) { Value = XMLR},
                new SqlParameter("@P_XMLD", SqlDbType.VarChar, 1000) { Value = XMLD},
            };
            string dt = obj.ExecuteSP("sp_Rolesetup", para, out data);
            Session["msg"] = dt;
        }
        protected void CHK_All_CheckedChanged(object sender, EventArgs e)
        {
            RepeaterItem gvrow = (RepeaterItem)((CheckBox)sender).NamingContainer;
            for (int i = 0; i < ((Repeater)gvrow.NamingContainer).Items.Count; i++)
            {
                switch (((CheckBox)sender).ID)
                {
                    case "CHK_VIEW_All":
                        ((CheckBox)((Repeater)gvrow.NamingContainer).Items[i].FindControl("CHK_VIEW")).Checked = ((CheckBox)sender).Checked;
                        break;

                    case "CHK_INS_All":
                        ((CheckBox)((Repeater)gvrow.NamingContainer).Items[i].FindControl("CHK_INS")).Checked = ((CheckBox)sender).Checked;
                        break;

                    case "CHK_UPD_All":
                        ((CheckBox)((Repeater)gvrow.NamingContainer).Items[i].FindControl("CHK_UPD")).Checked = ((CheckBox)sender).Checked;
                        break;
                }
            }
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                ExecuteProc("INS", "", Session["Code"].ToString(), txtrolName.Text);
                if (Session["msg"].ToString() == "00")
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "msg", "alert('Successfully Inserted')", true);
                }
                else if (Session["msg"].ToString() != null)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "msg", "alert('Invalid Action')", true);
                }
            }
            catch (Exception ex)
            {

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "MSG", "alert('" + ex + "')", true);
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            Response.Redirect("\\Admin/frmRoleSetup.aspx");
        }
    }
}