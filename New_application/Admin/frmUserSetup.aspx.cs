using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace New_application.Admin
{
    public partial class frmUserSetup : System.Web.UI.Page
    {
        DataAccess obj = new DataAccess();
        DataTable dt = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            fill();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            ExecutePro("IN");
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {

        }
        void fill()
        {
            ExecutePro("GT");
            if (dt.Rows.Count > 0)
            {
                txtUSRcode.Text = dt.Rows[0][0].ToString();
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
            XMLF += "<RoleCode>" + txtRoleCode.Text + "</RoleCode>";


            XMLF += "</User>";


            SqlParameter[] para = new SqlParameter[]
            {
            new SqlParameter("@P_Action",SqlDbType.NVarChar,1000){Value = sAction},
            new SqlParameter("@P_User", SqlDbType.NVarChar,1000){Value = ""},
            new SqlParameter("P_FormID",SqlDbType.NVarChar,1000) { Value = Request.QueryString["f"] },
            new SqlParameter("@P_XMLData",SqlDbType.VarChar,2000){Value = XMLF},
            };

            ViewState["msg"] = obj.ExecuteSP("sp_Users", para, out dt);
        }


    }
}