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
        DataTable dt = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            setpage();
        }

        void setpage()
        {
            if (Session["pro_name"] == null) { return; }
            GrdList.Columns.Clear();
            GrdList.DataSource = null;
            GrdList.DataBind();

            string sFormID = (Request.QueryString["f"] != null ? Request.QueryString["f"].ToString() : "");
            SqlParameter[] para = new SqlParameter[]
            {

                new SqlParameter("@P_FormID",SqlDbType.NVarChar, 1000) {Value =  sFormID}

            };
            string msg = obj.ExecuteSP("Sp_GetListData", para, out data);
            data.Dispose();
            if (data.Tables[0].Rows.Count > 0 && data.Tables[1].Rows.Count > 0)
            {
                string proname = (data.Tables[0].Rows[0]["procedure_name"].ToString());
                SqlParameter[] para2 = new SqlParameter[data.Tables[1].Rows.Count];
                for (int i = 0; i < data.Tables[1].Rows.Count; i++)
                {

                    if (data.Tables[1].Rows[i]["default_value"].ToString().ToLower().StartsWith("user"))
                    {
                        para2[i] = new SqlParameter(data.Tables[1].Rows[i]["sp_paraname"].ToString(), SqlDbType.NVarChar) { Value = "" };
                    }
                    else if (data.Tables[1].Rows[i]["default_value"].ToString().ToUpper().StartsWith("ACT"))
                    {
                        para2[i] = new SqlParameter(data.Tables[1].Rows[i]["sp_paraname"].ToString(), SqlDbType.NVarChar) { Value = "SO" };
                    }
                    //else if (data.Tables[1].Rows[i]["default_value"].ToString().ToLower().StartsWith("rolecode"))
                    //{
                    //    para2[i] = new SqlParameter(data.Tables[1].Rows[i]["sp_paraname"].ToString(), SqlDbType.NVarChar) { Value = "" };
                    //}
                    //else if (data.Tables[1].Rows[i]["default_value"].ToString().ToLower().StartsWith("rolename"))
                    //{
                    //    para2[i] = new SqlParameter(data.Tables[1].Rows[i]["sp_paraname"].ToString(), SqlDbType.NVarChar) { Value = "" };
                    //}
                    else
                    {
                        para2[i] = new SqlParameter(data.Tables[1].Rows[i]["sp_paraname"].ToString(), SqlDbType.NVarChar) { Value = data.Tables[1].Rows[i]["default_value"] };
                    }

                }
                obj.ExecuteSP(proname, para2, out dt);
                data.Dispose();
                string gridheader = data.Tables[0].Rows[0]["grid_header"].ToString();
                string bindcolumn = data.Tables[0].Rows[0]["grid_bindcolumn"].ToString();
                ViewState["page"] = data.Tables[0].Rows[0]["dml_formlink"].ToString();
                ViewState["Form_ID"] = sFormID;
                try
                {


                    if (gridheader != "" && bindcolumn != "")
                    {
                        string[] GDheader = gridheader.Split(',');
                        string[] GDbindcolumn = bindcolumn.Split(',');

                        if (GDheader.Length != GDbindcolumn.Length)
                        {
                            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "pop", "alert('Display header and detail column not matched')", true);
                        }
                        else
                        {
                            for (int i = 0; i < GDheader.Length; i++)
                            {
                                BoundField bindData = new BoundField();
                                bindData.DataField = GDbindcolumn[i];
                                bindData.HeaderText = GDheader[i];
                                //GrdList.Columns.Add(bindData);
                            }

                            if (dt.Rows.Count > 0)
                            {
                                GrdList.DataSource = dt;
                                GrdList.DataBind();
                            }
                        }
                    }
                }
                catch (Exception)
                {

                    throw;
                }
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