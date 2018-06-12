using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models
{
    public class SqlLayer
    {
        private ConnectionSQLServer sql;
        private String entityName;
        private String entityKeyName;

        public SqlLayer(String entityName, String entityKeyName)
        {
            this.entityName = entityName;
            this.entityKeyName = entityKeyName;
            this.sql = new ConnectionSQLServer();
        }

        public virtual SqlCommand SaveCommand(SqlCommand cmd)
        {
            return cmd;
        }

        public bool Save(bool isUpdate)
        {
            try
            {
                String procedurePrefix = "PR_INSERIR_";
                SqlCommand cmd = new SqlCommand();

                cmd.CommandType = CommandType.StoredProcedure;

                if (isUpdate)
                {
                    procedurePrefix = "PR_ATUALIZAR_";
                }
                cmd.CommandText = procedurePrefix + this.entityName;

                this.sql.Exec(this.SaveCommand(cmd));

                return true;
            }
            catch (Exception e)
            {

                return false;
            }

        }

        public DataTable Find(Int64 id)
        {

            SqlCommand cmd = new SqlCommand();

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PR_SELECT_" + this.entityName;

            if (id != 0)
            {
                cmd.Parameters.AddWithValue(this.entityKeyName, id);
            }

            return this.sql.ExecGet(cmd);
        }

        public void Delete(Int64 id)
        {
            SqlCommand cmd = new SqlCommand();

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PR_DELETAR_" + this.entityName;
            cmd.Parameters.AddWithValue(this.entityKeyName, id);

            this.sql.Exec(cmd);
        }
    }
}
