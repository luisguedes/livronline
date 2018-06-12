using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models
{
    public class Categorizador : SqlLayer
    {
        public Int64 isbn;
        public String categoria;

        public Categorizador() : base("CATEGORIA_LIVRO", "@id") { }

        public override SqlCommand SaveCommand(SqlCommand cmd)
        {
            cmd.Parameters.AddWithValue("@livro_isbn", isbn);
            cmd.Parameters.AddWithValue("@categoria", categoria);
            return cmd;

        }
    }
}
