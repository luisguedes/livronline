using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models {
    public class Cliente : Pessoa
    {
        public String email;
        private Char tipo;

        public Cliente() : base("CLIENTE", "@cpf_cnpj") {}

        public override SqlCommand SaveCommand(SqlCommand cmd) {
            cmd.Parameters.AddWithValue("@cpf_cnpj", id);
            cmd.Parameters.AddWithValue("@nome", nome);
            cmd.Parameters.AddWithValue("@email", email);
            cmd.Parameters.AddWithValue("@tipo", tipo);

            return base.SaveCommand(cmd);
        }

        public void setTipo()
        {
            if (this.id.ToString().Length >  11)
            {
                this.setJuridico();
            } else
            {
                this.setFisico();
            }
        }

        public void setJuridico(){
            this.tipo = 'J';
        }

        public void setFisico() {
            this.tipo = 'F';
        }
    }
}
