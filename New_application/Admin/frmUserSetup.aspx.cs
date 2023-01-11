using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.Tab;

namespace New_application.Admin
{
    public partial class frmUserSetup : System.Web.UI.Page
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
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            ExecutePro("IN");
            if (ViewState["msg"] != null)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "msg", "alert('Successfully Inserted')", true);
            }
        }
        protected void btnReset_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/frmUserSetup.aspx");
        }
        void fill()
        {
            ExecutePro("GT");
            if (dt.Rows.Count > 0)
            {
                txtUSRcode.Text = dt.Rows[0][0].ToString();
            }
            ExecutePro("ddlS");
            ddlStatus.DataSource = dt;
            ddlStatus.DataTextField = "Status";
            ddlStatus.DataValueField = "ID";
            ddlStatus.DataBind();

            ExecutePro("getuser");
            if (dt.Rows.Count > 0)
            {
                rpt_data.DataSource = dt;
                rpt_data.DataBind();
            }
        }
        void ExecutePro(string sAction)
        {
            string XMLF = "<User>";
            XMLF += "<UserCode>" + txtUSRcode.Text + "</UserCode>";
            XMLF += "<LoginID>" + txtLGNid.Text + "</LoginID>";
            XMLF += "<UserEmail>" + txtEmail.Text + "</UserEmail>";
            XMLF += "<UserContact>" + txtConNum.Text + "</UserContact>";
            XMLF += "<UserPassword>" + txtpassword.Text + "</UserPassword>";
            XMLF += "<Status>" + ddlStatus.SelectedValue + "</Status>";
            XMLF += "<FullName>" + txtFullname.Text + "</FullName>";
            XMLF += "<DepartName>" + txtDepNa.Text + "</DepartName>";
            XMLF += "<Designation>" + txtDesig.Text + "</Designation>";
            XMLF += "<RoleCode>" + (txtRoleCode.Text.Contains("~") ? txtRoleCode.Text.Split('~')[0] : "") + "</RoleCode>";
            XMLF += "</User>";
            SqlParameter[] para = new SqlParameter[]
            {
            new SqlParameter("@P_Action",SqlDbType.NVarChar,1000){Value = sAction},
            new SqlParameter("@P_User", SqlDbType.NVarChar,1000){Value = Session["user_name"]},
            new SqlParameter("P_FormID",SqlDbType.NVarChar,1000) { Value = Request.QueryString["f"] },
            new SqlParameter("@P_XMLData",SqlDbType.VarChar,2000){Value = XMLF},
            };
            ViewState["msg"] = obj.ExecuteSP("sp_Users", para, out dt);
        }

        protected void btnShowPopup_Click(object sender, EventArgs e)
        {


        }

        protected void button_Click(object sender, EventArgs e)
        {

        }
    }
}