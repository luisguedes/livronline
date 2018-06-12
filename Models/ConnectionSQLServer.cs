using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models
{
    public class ConnectionSQLServer
    {
        private SqlConnection con;

        public ConnectionSQLServer () {
            string conString =
                ConfigurationManager.ConnectionStrings["SQLSERVER"].ConnectionString;

            this.con = new SqlConnection();
            this.con.ConnectionString = conString;
        }

        public void Exec(SqlCommand cmd) {
            this.con.Open();
            cmd.Connection = this.con;
            cmd.ExecuteNonQuery();
            this.Disconnect();
        }

        public DataTable ExecGet(SqlCommand cmd)
        {
            DataTable dt = new DataTable();
            SqlDataAdapter sqldt = new SqlDataAdapter();
  
            this.con.Open();
            cmd.Connection = con;

            sqldt.SelectCommand = cmd;
            sqldt.Fill(dt);
            this.Disconnect();

            return dt;
        }

        public void Disconnect() {
            con.Close();
        }
    }
}