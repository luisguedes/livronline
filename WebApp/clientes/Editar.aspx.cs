using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Models;

public partial class Editar : Page
{
    protected bool isUpdate = false;

    protected void Page_Load(object sender, EventArgs e)
    {
        var id = Convert.ToInt64(Request["id"]);

        if (id != 0)
        {
            DataTable d = new Cliente().Find(id);
            isUpdate = true;

            if (!Page.IsPostBack)
            {
                Id.Text = Request["id"];
                Nome.Text = d.Rows[0].Field<String>(1);
                Email.Text = d.Rows[0].Field<String>(2);
                Pais.Text = d.Rows[0].Field<String>(3);
                Estado.Text = d.Rows[0].Field<String>(4);
                Cidade.Text = d.Rows[0].Field<String>(5);
                CEP.Text = d.Rows[0].Field<String>(6);
                Logradouro.Text = d.Rows[0].Field<String>(7);
                Bairro.Text = d.Rows[0].Field<String>(8);
                Numero.Text = d.Rows[0].Field<int>(9).ToString();
                Complemento.Text = d.Rows[0].Field<String>(10);
            }
        }
    }

    protected void salvarCliente(object sender, EventArgs e)
    {
        Cliente c = new Cliente();

        c.id = Convert.ToInt64(this.Id.Text);
        c.nome = this.Nome.Text;
        c.email = this.Email.Text;
        c.pais = this.Pais.Text;
        c.estado = this.Estado.Text;
        c.cidade = this.Cidade.Text;
        c.cep = this.CEP.Text;
        c.logradouro = this.Logradouro.Text;
        c.bairro = this.Bairro.Text;
        c.complemento = this.Complemento.Text;
        c.numero = Convert.ToInt16(this.Numero.Text);
        c.setTipo();


        c.Save(this.isUpdate);
        Response.Redirect("/clientes");
    }

    protected void deletarCliente(object sender, EventArgs e) {
        new Cliente().Delete(Convert.ToInt64(this.Id.Text));
        Response.Redirect("/clientes");
    }
}