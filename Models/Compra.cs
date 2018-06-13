using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models
{
    public class Compra : SqlLayer
    {
        public Int64 cliente;
        public Int64 livro;
        public DateTime data;

        public Compra() : base("COMPRA", "@id") {}

        public override SqlCommand SaveCommand(SqlCommand cmd)
        {
            cmd.Parameters.AddWithValue("@cliente_id", this.cliente);
            cmd.Parameters.AddWithValue("@livro_isbn", this.livro);
            cmd.Parameters.AddWithValue("@data", this.data);
            return cmd;
        }
    }
}
