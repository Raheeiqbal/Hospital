﻿using System;
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
            if(SrcPrams != null)
            {
                adp.SelectCommand.Parameters.AddRange(SrcPrams);
            }
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
        public string ExecuteSP(string sSPName, SqlParameter[] SrcPrams, out DataSet Res_DT)
        {
            string sReturn = "";
            DataSet DT_OutSet = new DataSet();
            SqlDataAdapter adp = new SqlDataAdapter(sSPName, connection());
            adp.SelectCommand.CommandType = CommandType.StoredProcedure;
            adp.SelectCommand.Parameters.AddRange(SrcPrams);
            try
            {
                adp.Fill(DT_OutSet);
                if (DT_OutSet.Tables[0].Rows.Count > 0)
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
                DT_OutSet.Dispose();
                adp.Dispose();
            }
            Res_DT = DT_OutSet;
            return sReturn;

        }
    }
}