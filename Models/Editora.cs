using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models
{
    public class Editora : Pessoa
    {
        public Editora() : base("EDITORA", "@cnpj") { }

        public override SqlCommand SaveCommand(SqlCommand cmd)
        {
            cmd.Parameters.AddWithValue("@cnpj", id);
            cmd.Parameters.AddWithValue("@editoranome", nome);

            return base.SaveCommand(cmd);
        }
    }
}
