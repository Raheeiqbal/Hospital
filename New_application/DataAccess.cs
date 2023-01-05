using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Data.OracleClient;

namespace New_application
{
    public class DataAccess
    {
        DataTable dt = new DataTable();
        public string connection()
        {
            return ConfigurationManager.AppSettings["Con"];
        }
        public string ExecuteSP(string sSPName, SqlParameter[] SrcPrams, out DataTable Res_DT)
        {
            string sReturn = "";
            DataTable DT_Out = new DataTable();
            SqlDataAdapter adp = new SqlDataAdapter(sSPName, connection());
            adp.SelectCommand.CommandType = CommandType.StoredProcedure;
            adp.SelectCommand.Parameters.AddRange(SrcPrams);
            try
            {
                adp.Fill(DT_Out);
                if (DT_Out.Rows.Count > 0)
                {
                    sReturn = "00";
                }
                else
                {
                    sReturn = "1";
                }
            }
            catch (Exception ex)
            {
                sReturn = "-1;" + ex.Message;
            }
            finally
            {
                DT_Out.Dispose();
                adp.Dispose();
            }
            Res_DT = DT_Out;
            return sReturn;

        }
        //public DataTable sqladapter(string SP, string username, string password, string action, string rolecode, string parent)
        //{
        //    SqlDataAdapter adp = new SqlDataAdapter(SP, connection());
        //    adp.SelectCommand.CommandType = CommandType.StoredProcedure;
        //    adp.SelectCommand.Parameters.Add("@P_userid", SqlDbType.VarChar, 100).Value = username;
        //    adp.SelectCommand.Parameters.Add("@P_password", SqlDbType.VarChar, 100).Value = password;
        //    adp.SelectCommand.Parameters.Add("@P_ValidUser", SqlDbType.VarChar, 100).Value = "";
        //    adp.SelectCommand.Parameters.Add("@P_UserSession", SqlDbType.VarChar, 100).Value = "";
        //    adp.SelectCommand.Parameters.Add("@P_Action", SqlDbType.VarChar, 100).Value = action;
        //    adp.Fill(dt);
        //    dt.Dispose();
        //    return dt;
        //}
    }
}