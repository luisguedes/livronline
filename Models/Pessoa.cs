using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models
{
    public class Pessoa : SqlLayer
    {
        public Int64 id;
        public String nome;
        public String pais;
        public String estado;
        public String cidade;
        public String cep;
        public String logradouro;
        public String bairro;
        public String complemento;
        public int numero;

        public Pessoa(String entityName, String entityKeyName) : base(entityName, entityKeyName) {}

        public override SqlCommand SaveCommand(SqlCommand cmd) {
            cmd.Parameters.AddWithValue("@pais", pais);
            cmd.Parameters.AddWithValue("@estado", estado);
            cmd.Parameters.AddWithValue("@cidade", cidade);
            cmd.Parameters.AddWithValue("@cep", cep);
            cmd.Parameters.AddWithValue("@logradouro", logradouro);
            cmd.Parameters.AddWithValue("@bairro", bairro);
            cmd.Parameters.AddWithValue("@numero", numero);
            cmd.Parameters.AddWithValue("@complemento", complemento);

            return cmd;
        }
    }
}
