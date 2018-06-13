<%@ Page Title="Vendas" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="card">
        <h2>Realizar Compras</h2>

        <div class="input">
            <select id="cliente">
                <% foreach (Dictionary<String, String> cliente in todosClientes) { %>
                   <option value="<%= cliente["id"] %>"><%= cliente["text"] %> </option>
                <% } %>
            </select>
        </div>
    
        <ul id="compra-lista"></ul>

        <div class="input">
            <select id="livro">
                <% foreach (Dictionary<String, String> livro in todosLivros) { %>
                   <option value="<%= livro["id"] %>"><%= livro["text"] %></option>
                <% } %>
            </select>
        </div>
        <button id="adicionar-livro" type="button" class="btn"> + </button>

        <asp:Button Text="Finalizar Compra" ID="FinalizarCompraBtn" runat="server" OnClick="FazerCompra" />

        <div>
            <asp:TextBox runat="server" ID="ClienteField" CssClass="ClienteField" />
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
        var listaItems = document.getElementById("compra-lista");
        var listaLivros = document.getElementById("livro");
        var livrosVenda = document.querySelector(".LivrosField");

        document.getElementById("cliente").onchange = function () {
            var selected = this.options[this.selectedIndex];
            document.querySelector(".ClienteField").value = selected.value;
            listaItems.innerHTML = "";
        }

        document.getElementById("adicionar-livro").onclick = function () {
            var li = document.createElement("li");
            var selected = listaLivros.options[listaLivros.selectedIndex];
        
            li.textContent = selected.textContent;
            li.onclick = function () {
                listaItems.removeChild(li);
                livrosVenda.value = livrosVenda.value.replace(selected.value + ",", "");
            }

            livrosVenda.value = livrosVenda.value + selected.value + ",";
            listaItems.appendChild(li);
        }
    </script>
    
</asp:Content>
