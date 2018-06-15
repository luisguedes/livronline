using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models
{
    public class Livro : SqlLayer
    {
        public Int64 editoraCnpj;
        public Int64 isbn;
        public Int64 qtde;
        public String titulo;
        public String autor;
        public Decimal valor;

        public Livro() : base("LIVRO", "@isbn") { }

        public override SqlCommand SaveCommand(SqlCommand cmd)
        {
            cmd.Parameters.AddWithValue("@editora_cnpj", editoraCnpj);
            cmd.Parameters.AddWithValue("@isbn", isbn);
            cmd.Parameters.AddWithValue("@qtde", qtde);
            cmd.Parameters.AddWithValue("@titulo", titulo);
            cmd.Parameters.AddWithValue("@autor", autor);
            cmd.Parameters.AddWithValue("@valor", valor);

            return cmd;
        }

        public DataTable EmEstoque()
        {

            SqlCommand cmd = new SqlCommand();

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PR_SELECT_" + this.entityName + "_EM_ESTOQUE";

            return this.sql.ExecGet(cmd);
        }
    }
}
