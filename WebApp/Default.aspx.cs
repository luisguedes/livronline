using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Models;

public partial class _Default : Page
{
    protected bool isUpdate = false;
    protected List<Dictionary<String, String>> todosClientes = new List<Dictionary<String, String>>();
    protected List<Dictionary<String, String>> todosLivros = new List<Dictionary<String, String>>();

    protected void Page_Load(object sender, EventArgs e)
    {

        var dtClientes = new Cliente().Find(0);
        var dtLivros = new Livro().EmEstoque();

        gridCompras.DataSource = new Compra().Find(0);
        gridCompras.DataBind();

        foreach (DataRow r in dtClientes.Rows)
        {
            var map = new Dictionary<String, String>();
            map["id"] = r.Field<Int64>(0).ToString();
            map["text"] = r.Field<String>(1);
            this.todosClientes.Add(map);
        }

        foreach (DataRow r in dtLivros.Rows)
        {
            var map = new Dictionary<String, String>();
            map["id"] = r.Field<Int64>(0).ToString();
            map["text"] = r.Field<String>(1);
            map["extra"] = r.Field<Decimal>(2).ToString();
            this.todosLivros.Add(map);
        }
    }

    protected void GridView_PreRender(object sender, EventArgs e)
    {
        GridView gv = (GridView)sender;

        if ((gv.ShowHeader == true && gv.Rows.Count > 0)
            || (gv.ShowHeaderWhenEmpty == true))
        {
            //Force GridView to use <thead> instead of <tbody> - 11/03/2013 - MCR.
            gv.HeaderRow.TableSection = TableRowSection.TableHeader;
        }
        if (gv.ShowFooter == true && gv.Rows.Count > 0)
        {
            //Force GridView to use <tfoot> instead of <tbody> - 11/03/2013 - MCR.
            gv.FooterRow.TableSection = TableRowSection.TableFooter;
        }
    }

    protected void FazerCompra(object sender, EventArgs e)
    {
        Compra c = new Compra();
        c.cliente = Convert.ToInt64(ClienteField.Text);
        c.data = DateTime.Now;

        foreach (string livro in LivrosField.Text.Split(',')) {
            if (livro != "") {
                c.livro = Convert.ToInt64(livro);
                c.Save(false);
            }
        }

        Response.Redirect("/");
    }
}