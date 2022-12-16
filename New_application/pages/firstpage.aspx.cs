using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Ajax.Utilities;
using New_application;
using System.Data.SqlClient;

namespace New_application.pages
{
    public partial class firstpage : System.Web.UI.Page
    {
        DataAccess obj = new DataAccess();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getData("city");
                getData("Con");
            }
        }
        void getData(string value)
        {
            DataTable data = new DataTable();
            SqlParameter[] para = new SqlParameter[]
            {
                new SqlParameter("@P_Action",SqlDbType.VarChar, 10){ Value = value}
            };
            string dt = obj.ExecuteSP("sp_Registration", para, out data);
            ddlCity.DataSource = data;
            if (value == "city")
            {
                ddlCity.DataTextField = "City_Description";
                ddlCity.DataValueField = "City_Code";
                ddlCity.DataBind();
            }
            else if (value == "Con")
            {
                ddlCon.DataTextField = "City_Description";
                ddlCon.DataValueField = "City_Code";
                ddlCon.DataBind();
            }
        }
    }
}