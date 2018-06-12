using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Models;

public partial class Default : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        gridClientes.DataSource = new Cliente().Find(0);
        gridClientes.DataBind();
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

    protected void removerCliente(object sender, EventArgs e)
    {
        var Id = Convert.ToInt64(Request.Form["__EVENTARGUMENT"]);
        new Cliente().Delete(Id);
        Response.Redirect("/clientes");
    }
}