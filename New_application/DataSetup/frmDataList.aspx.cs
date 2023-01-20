using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace New_application.DataSetup
{
    public partial class frmDataList : System.Web.UI.Page
    {
        DataAccess obj = new DataAccess();
        DataSet data = new DataSet();

        protected void Page_Load(object sender, EventArgs e)
        {
            setpage("1002");
        }

        void setpage(string FormID)
        {
            if (Session["pro_name"] == null) { return; }
            GrdList.Columns.Clear();
            GrdList.DataSource = null;
            GrdList.DataBind();

            string sFormID = (Request.QueryString["f"] != null ? Request.QueryString["f"].ToString() : "");
            SqlParameter[] para = new SqlParameter[]
            {
                new SqlParameter("@P_FormID",SqlDbType.NVarChar, 1000) {Value =  FormID}
            };
            string msg = obj.ExecuteSP("Sp_GetListData", para, out data);
            if (data.Tables[0].Rows.Count > 0 && data.Tables[1].Rows.Count > 0)
            {
                string proname = (data.Tables[0].Rows[0]["procedure_name"].ToString());
                SqlParameter[] innerPara = new SqlParameter[data.Tables[1].Rows.Count];
                for (int i = 0; i < data.Tables[1].Rows.Count; i++)
                {

                    if (data.Tables[1].Rows[i]["default_value"].ToString().ToLower().StartsWith("user"))
                    {
                        innerPara[i] = new SqlParameter(data.Tables[1].Rows[i]["sp_paraname"].ToString(), "");
                    }
                    else if (data.Tables[1].Rows[i]["default_value"].ToString().ToUpper().StartsWith("ACT"))
                    {
                        innerPara[i] = new SqlParameter(data.Tables[1].Rows[i]["sp_paraname"].ToString(), "");
                    }
                    //else if (data.Tables[1].Rows[i]["default_value"].ToString().ToLower().StartsWith("rolecode"))
                    //{
                    //    innerPara[i] = new SqlParameter(data.Tables[1].Rows[i]["sp_paraname"].ToString(), "") ;
                    //}
                    //else if (data.Tables[1].Rows[i]["default_value"].ToString().ToLower().StartsWith("rolename"))
                    //{
                    //    innerPara[i] = new SqlParameter(data.Tables[1].Rows[i]["sp_paraname"].ToString(), "");
                    //}

                }
                DataTable mydata = new DataTable();
                string txt = obj.ExecuteSP(proname, innerPara, out mydata);
            }
        }

        protected void GrdList_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        protected void GrdList_Sorting(object sender, GridViewSortEventArgs e)
        {

        }

        protected void GrdList_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }

        protected void GrdList_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}