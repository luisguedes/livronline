<%@ Page Title="Vendas" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="card">
        <h2>Realizar Compra</h2>

        <div class="input select">
            <asp:TextBox runat="server" ID="ClienteField" CssClass="ClienteField" placeholder=" " />
            <label for="ClienteField">Escolha o Cliente</label>
            <div class="value-holder"></div>
            <ul id="cliente">
                <% foreach (Dictionary<String, String> cliente in todosClientes) { %>
                    <li data-val="<%= cliente["id"] %>"><%= cliente["text"] %> </li>
                <% } %>
            </ul>
        </div>
        <div class="row">
            <div class="col-md-8">
                <div class="input select" id="livro-select">
                    <input type="text" id="LivroInpt" placeholder=" "/>
                    <label for="LivroInpt">Escolha um Livro</label>
                    <div class="value-holder"></div>
                    <ul>
                        <% foreach (Dictionary<String, String> cliente in todosLivros) { %>
                           <li data-val="<%= cliente["id"] %>" data-extra="<%= cliente["extra"] %>"><%= cliente["text"] %> </li>
                        <% } %>
                    </ul>
                </div>
            </div>
            <div class="col-md-4">
                <button id="adicionar-livro" type="button" class="button btn-block" style="margin-top: 20px">
                    <i class="far fa-plus-square"></i> Adicionar Livro
                </button>
            </div>
        </div>

        <table class="custom-table">
            <col width="20%" />
            <col width="60%" />
            <col width="20%" />
            <thead>
                <tr>
                    <th>ISBN</th>
                    <th>Nome</th>
                    <th>Preço</th>
                </tr>
            </thead>
            <tbody id="livros">
                <tr><td colspan="2" class="text-right">Total</td><td id="totalPrice">R$ 0.00</td><tr>
            </tbody>
        </table>

        <div style="margin-top:20px" class="text-right">
            <asp:Button CssClass="button" Text="Finalizar Compra" ID="FinalizarCompraBtn" runat="server" OnClick="FazerCompra" />
        </div>

        <div style="display: none">
            <asp:TextBox runat="server" ID="LivrosField" CssClass="LivrosField"/>
        </div>
    </div>
    <div class="card">
        <h2>Últimas Compras</h2>
        <asp:GridView ID="gridCompras" runat="server" CellSpacing="0" CellPadding="0" BorderWidth="0" AutoGenerateColumns="false"
             OnPreRender="GridView_PreRender" CssClass="custom-table">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="Id da Compra" />
                <asp:BoundField DataField="titulo" HeaderText="Titulo" />
                <asp:BoundField DataField="cliente" HeaderText="Cliente" />
                <asp:BoundField DataField="valor" HeaderText="Valor" />
            </Columns>
        </asp:GridView>
    </div>

    <script>
        var carrinho = document.getElementById("livros");
        var livroSelect = document.getElementById("livro-select");
        var isbnInput = livroSelect.querySelector("input");
        var livros = livroSelect.querySelector("ul");
        var livroASP = document.querySelector(".LivrosField");

        function addTotalPrice(price) {
            var pholder = document.getElementById("totalPrice");
            var value = parseFloat(pholder.textContent.replace("R$ ", ""));

            pholder.textContent = "R$ " + (value + price).toString();
        }

        document.getElementById("cliente").querySelectorAll("li").forEach(function (li) {
            li.onclick = function () {
                carrinho.innerHtml = '<tr><td colspan="2" class="text-right">Total</td><td id="totalPrice">R$ 0.00</td><tr>';
            }
        });

        document.getElementById("adicionar-livro").onclick = function () {
            var livroLi = livros.querySelector("li[data-val='" + isbnInput.value + "']");
            var livroData = {
                isbn: livroLi.dataset.val,
                valor: livroLi.dataset.extra,
                titulo: livroLi.textContent
            };

            function createTd(val) {
                var td = document.createElement("td");
                td.textContent = val;
                return td;
            }

            var row = document.createElement("tr");
            row.appendChild(createTd(livroData.isbn));
            row.appendChild(createTd(livroData.titulo));
            row.appendChild(createTd("R$ " + livroData.valor));

            row.onclick = function () {
                carrinho.removeChild(row);
                livroASP.value = livroASP.value.replace(livroData.isbn + ",", "");
            }

            setTimeout(function () {
                carrinho.prepend(row);
                addTotalPrice(parseFloat(livroData.valor));
                livroASP.value = livroASP.value + livroData.isbn + ",";
            }, 100);
        }
    </script>
    
</asp:Content>
