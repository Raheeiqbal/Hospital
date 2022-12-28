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
                int irowindex = ((RepeaterItem)((Button)sender).NamingContainer).ItemIndex;
                string controlID = Request.QueryString["ControlID"];
                ScriptManager.RegisterStartupScript(this, this.GetType(), "ExPop", "ClosePop('" + controlID + "','" + controlID + "','" + ((Label)rpt_data.Items[irowindex].Controls[0]).Text + "','" + ((Label)rpt_data.Items[irowindex].Controls[1]).Text.Replace("&nbsp;", "" + "');"), true);
                //ScriptManager.RegisterStartupScript(this, this.GetType(), "onclick", "window.close('" + controlID + "','" + RoleCOde + "','" + RoleCOde.Replace("&nbsp;", "") + "','" + btnControlID + "');", true);
            }
            catch (Exception ex)
            {

                Response.Write(ex);
            }

        }

//        protected void rpt_data_ItemDataBound(object sender, RepeaterItemEventArgs e)
//        {

//            protected void btnSelect_Click(object sender, EventArgs e)
//            {
//                int irowindex = ((GridViewRow)((Button)sender).NamingContainer).RowIndex;
//                string CtrlCode = Request.QueryString["cid"].ToString();
//                string CtrlDesc = Request.QueryString["did"].ToString();
//                //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Pop", "ClosePop('" + CtrlCode + "','" + CtrlDesc + "','" + GV_Data.Rows[irowindex].Cells[0].Text + "','" + GV_Data.Rows[irowindex].Cells[1].Text.Replace("&nbsp;", "" + "');", true);
//                ScriptManager.RegisterStartupScript(this, this.GetType(), "ExPop", "ClosePop('" + CtrlCode + "','" + CtrlDesc + "','" + GV_Data.Rows[irowindex].Cells[0].Text + "','" + GV_Data.Rows[irowindex].Cells[1].Text.Replace("&nbsp;", "" + "');", true);
//            }


//< script type = "text/javascript" >
//        var PopProp = 'directories=no,titlebar=no,toolbar=no,location=no,status=no,menubar=no,left=280,top=130,height=530, width= 900 ,menubar=no,location=no,toolbar=no,scrollbars=yes,resizable=no';
//            function openLovRole()
//            {
//                var ContCode = ('<%=txtutcode.ClientID%>');
//                var ContDesc = ('<%=txtutdesc.ClientID%>');
//                var a = window.open('../Lov/UnitTypeLov.aspx?cid=' + ContCode + '&did=' + ContDesc, '', PopProp);
//                a.focus();
//                return false;
//            }
//            function ClosePop(ControlID, Code, Desc)
//            {
//                window.opener.document.all(ControlID).value = Code + '~' + Desc;
//                window.opener.document.all(ControlID).title = Code;
//                window.opener.document.all(ControlID).focus;
//                self.close();
//            }
//    </ script >

//     function ClosePop(cid, did, cval, dval) {
//                window.opener.document.getElementById(cid).value = cval;
//                window.opener.document.getElementById(did).value = dval;
//                self.close();
//                window.close();
//            }

//            ((Label)rpt_data.Items[((RepeaterItem)((Button)sender).NamingContainer).ItemIndex].FindControl("RoleCo")).Text;
//        }
    }
}