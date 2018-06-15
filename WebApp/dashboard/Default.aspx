<%@ Page Title="Dashboard" EnableEventValidation="false" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="card">
        <div class="row">
            <div class="col-md-3">
                <h3>Clientes</h3>
                <h2><%= clientes.Count() %></h2>
            </div>
            <div class="col-md-3">
                <h3>Livros</h3>
                <h2><%= livros.Count() %></h2>
            </div>
            <div class="col-md-3">
                <h3>Em Estoque</h3>
                 <h2><%= emEstoque %></h2>
            </div>
            <div class="col-md-3">
                <h3>Fora de Estoque</h3>
                <h2><%= foraDeEstoque %></h2>
            </div>
        </div>
    </div>
    <div class="card">
        <div class="row">
            <div class="col-md-6">
                <h3>Compras da Semana</h3>
                <canvas id="compras"></canvas>
            </div>
            <div class="col-md-6">
                <h3>Livros Mais Vendidos</h3>
                <canvas id="mais-vendidos"></canvas>
            </div>
        </div>
        
    </div>
    <script>
        var editoras = <%= getEditoras() %>;
        var livros = <%= getLivros() %>;
        var clientes = <%= getClientes() %>;
        var compras = <%= getCompras() %>;

        var compraWeek = _.groupBy(compras.map(function (compra) {
	        compra.data = compra.data.split(" ")[0];
	        return compra;
        }), 'data');

        var compraTitle = _.groupBy(compras, 'titulo');

        new Chart(document.getElementById("compras"), {
            type: 'bar',
            data: {
                labels: Object.keys(compraWeek),
                datasets: [{
                    label: "Quantida de Compras no Dia",
                    backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850"],
                    data: Object.keys(compraWeek).map(function (key) { 
                        return compraWeek[key].length;
                    })
                }]
            }
        })

        new Chart(document.getElementById("mais-vendidos"), {
            type: 'pie',
            data: {
                labels: Object.keys(compraTitle),
                datasets: [{
                    label: "Total de Vendas",
                    backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850"],
                    data: Object.keys(compraTitle).map(function (key) { 
                        return compraTitle[key].length;
                    })
                }]
            },
        });
    </script>
</asp:Content>
