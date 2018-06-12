using System;
using System.Collections.Generic;
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

        public Livro() : base("LIVRO", "@isbn") { }

        public override SqlCommand SaveCommand(SqlCommand cmd)
        {
            cmd.Parameters.AddWithValue("@editora_cnpj", editoraCnpj);
            cmd.Parameters.AddWithValue("@isbn", isbn);
            cmd.Parameters.AddWithValue("@qtde", qtde);
            cmd.Parameters.AddWithValue("@titulo", titulo);
            cmd.Parameters.AddWithValue("@autor", autor);

            return cmd;
        }
    }
}
