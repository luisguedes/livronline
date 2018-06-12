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
    protected List<String> todasCategorias = new List<String>();
    protected List<String> categoriasDoLivro = new List<String>();

    protected void Page_Load(object sender, EventArgs e)
    {
        var id = Convert.ToInt64(Request["id"]);
        var dtCategorias = new Categoria().Find(0);

        foreach (DataRow r in dtCategorias.Rows) {
            this.todasCategorias.Add(r.Field<String>(0));
        } 

        if (id != 0)
        {
            DataTable dtlc = new Categorizador().Find(id);
            DataTable d = new Livro().Find(id);
            isUpdate = true;

            foreach (DataRow r in dtlc.Rows)
            {
                this.categoriasDoLivro.Add(r.Field<String>(2));
            }

            if (!Page.IsPostBack)
            {
                ISBN.Text = Request["id"];
                Editora.Text = d.Rows[0].Field<Int64>(0).ToString();
                Qtd.Text = d.Rows[0].Field<int>(2).ToString();
                Titulo.Text = d.Rows[0].Field<String>(3);
                Autor.Text = d.Rows[0].Field<String>(4);
                this.todasCategorias = this.todasCategorias.Except(this.categoriasDoLivro).ToList();
            }
        }
    }

    protected void salvarLivro(object sender, EventArgs e)
    {
        var _categorias = CategoriasField.Text.Split(',');
        Livro l = new Livro();

        l.isbn = Convert.ToInt64(ISBN.Text);
        l.autor = Autor.Text;
        l.qtde = Convert.ToInt64(Qtd.Text);
        l.editoraCnpj = Convert.ToInt64(Editora.Text);
        l.titulo = Titulo.Text;

        l.Save(this.isUpdate);

        foreach (string cat in _categorias) {
            var c = new Categorizador();
            c.isbn = l.isbn;
            c.categoria = cat;
            c.Save(false);
        }

        Response.Redirect("/livros");
    }

    protected void deletarLivro(object sender, EventArgs e)
    {
        new Livro().Delete(Convert.ToInt64(this.ISBN.Text));
        Response.Redirect("/livros");
    }
}