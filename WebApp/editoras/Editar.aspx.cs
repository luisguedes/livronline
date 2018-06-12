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
            DataTable d = new Editora().Find(id);
            isUpdate = true;

            if (!Page.IsPostBack)
            {
                Id.Text = Request["id"];
                Nome.Text = d.Rows[0].Field<String>(1);
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

    protected void salvarEditora(object sender, EventArgs ev)
    {
        Editora e = new Editora();

        e.id = Convert.ToInt64(this.Id.Text);
        e.nome = this.Nome.Text;
        e.pais = this.Pais.Text;
        e.estado = this.Estado.Text;
        e.cidade = this.Cidade.Text;
        e.cep = this.CEP.Text;
        e.logradouro = this.Logradouro.Text;
        e.bairro = this.Bairro.Text;
        e.complemento = this.Complemento.Text;
        e.numero = Convert.ToInt16(this.Numero.Text);

        e.Save(this.isUpdate);
        Response.Redirect("/editoras");
    }

    protected void deletarEditora(object sender, EventArgs e)
    {
        new Editora().Delete(Convert.ToInt64(this.Id.Text));
        Response.Redirect("/editoras");
    }
}