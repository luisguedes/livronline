using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Models;
using Newtonsoft.Json;

public partial class Default : Page
{

    protected List<Dictionary<String, String>> editoras = new List<Dictionary<String, String>>();
    protected List<Dictionary<String, String>> livros = new List<Dictionary<String, String>>();
    protected List<Dictionary<String, String>> clientes = new List<Dictionary<String, String>>();
    protected List<Dictionary<String, String>> compras = new List<Dictionary<String, String>>();
    protected int emEstoque = 0;
    protected int foraDeEstoque = 0;

    protected String getEditoras() {
       return JsonConvert.SerializeObject(this.editoras);
    }

    protected String getLivros() {
        return JsonConvert.SerializeObject(this.livros);
    }

    protected String getClientes() {
        return JsonConvert.SerializeObject(this.clientes);
    }

    protected String getCompras()
    {
        return JsonConvert.SerializeObject(this.compras);
    }


    protected void Page_Load(object sender, EventArgs e)
    {
        var dtEditoras = new Editora().Find(0);
        var dtLivros = new Livro().Find(0);
        var dtClientes = new Cliente().Find(0);
        var dtCompras = new Compra().Find(0);

        foreach (DataRow r in dtEditoras.Rows)
        {
            var map = new Dictionary<String, String>();
            map["id"] = r.Field<Int64>(0).ToString();
            map["text"] = r.Field<String>(1);

            this.editoras.Add(map);
        }

        foreach (DataRow r in dtLivros.Rows)
        {
            var map = new Dictionary<String, String>();
            map["id"] = r.Field<Int64>(1).ToString();
            map["titulo"] = r.Field<String>(3);
            map["preco"] = r.Field<Decimal>(5).ToString();
            map["quantidade"] = r.Field<int>(2).ToString();

            this.livros.Add(map);
        }

        foreach (DataRow r in dtClientes.Rows)
        {
            var map = new Dictionary<String, String>();
            map["id"] = r.Field<Int64>(0).ToString();
            map["nome"] = r.Field<String>(1);
            map["pais"] = r.Field<String>(3);
            map["estado"] = r.Field<String>(4);

            this.clientes.Add(map);
        }

        foreach (DataRow r in dtCompras.Rows)
        {
            var map = new Dictionary<String, String>();
            map["id"] = r.Field<int>(0).ToString();
            map["titulo"] = r.Field<String>(1);
            map["valor"] = r.Field<Decimal>(3).ToString();
            map["data"] = r.Field<DateTime>(4).ToString();

            this.compras.Add(map);
        }

        for (var i = 0; i < this.livros.Count(); i++)
        {
            if (Convert.ToInt16(this.livros[i]["quantidade"]) > 0)
            {
                this.emEstoque++;
            } else
            {
                this.foraDeEstoque++;
            }
        }
    }
}