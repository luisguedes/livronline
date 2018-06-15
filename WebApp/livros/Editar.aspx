<%@ Page Title="Livro" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Editar.aspx.cs" Inherits="Editar" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="card">
        <h2>Dados do Livro</h2>
        <div class="row">
            <div class="col-md-5">
                <div class="input <% if (isUpdate) { %> disabled <% } %>">
                    <asp:TextBox ID="ISBN" runat="server" Placeholder=" " />
                    <label for="ISBN">ISBN</label>
                </div>
            </div>
            <div class="col-md-7">
                <div class="input">
                    <asp:TextBox ID="Titulo" runat="server" Placeholder=" " />
                    <label for="Titulo">Título</label>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2">
                <div class="input">
                    <asp:TextBox ID="Qtd" runat="server" Placeholder=" " />
                    <label for="Qtd">Quantidade</label>
                </div>
            </div>
            <div class="col-md-2">
                <div class="input">
                    <asp:TextBox ID="Valor" runat="server" Placeholder=" " />
                    <label for="Valor">Valor</label>
                </div>
            </div>

            <div class="col-md-4">
                <div class="input">
                    <asp:TextBox ID="Autor" runat="server" Placeholder=" " />
                    <label for="Autor">Autor</label>
                </div>
            </div>

            <div class="col-md-4">
                <div class="input select">
                    <asp:TextBox ID="Editora" runat="server" Placeholder=" " />
                    <label for="Editora">Editora</label>
                    <div class="value-holder"></div>
                    <ul>
                        <% foreach (Dictionary<String, String> editora in editoras) { %>
                            <li data-val="<%= editora["id"] %>"><%= editora["text"] %></option>
                        <% } %>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="card">
        <h2>Categorias</h2>
        <div style="display:none">
            <asp:TextBox ID="CategoriasField" CssClass="CategoriasField" runat="server" Placeholder=" " />
        </div>

        <div class="row">
            <div class="col-md-8">
                <div class="input select" id="selectedCategory">
                    <input type="text" placeholder=" ">
                    <label for="x">Select</label>
                    <div class="value-holder"></div>
                    <ul>
                        <% foreach (String nome in todasCategorias) { %>
                            <li data-val="<%= nome %>"><%= nome %></option>
                        <% } %>
                    </ul>
                </div>
            </div>
            <div class="col-md-4">
                <button style="margin-top:15px" type="button" class="button" id="adicionarCategoria" onclick="adicionarCategoria"> Adicionar Categoria </button>
            </div>
        </div>
        

        <ul id="listaDeCategoria">
            <% foreach (String nome in categoriasDoLivro) { %>
                <li class="disabled"><%= nome %></option>
            <% } %>
        </ul>
    </div>
    <div class="text-right">
        <% if (isUpdate) { %>
           <asp:Button CssClass="button red" Text="Deletar" ID="deletarBtn" runat="server" onClick="deletarLivro" />
        <% } %>

        <asp:Button CssClass="button" Text="Salvar" runat="server" ID="salvarBtn" onClick="salvarLivro" />
    </div>

    <script>
        document.getElementById("adicionarCategoria").onclick = function () {
            var li = document.createElement("li");
            var lista = document.getElementById("listaDeCategoria");
            var categoriesHolderSelect = document.getElementById("selectedCategory")
            var holder = categoriesHolderSelect.querySelector(".value-holder");
            var selectedCategoryInput = categoriesHolderSelect.querySelector("input");
            var selectedCategory = selectedCategoryInput.value;
            var categoriesInputList = categoriesHolderSelect.querySelector("ul");
            var input = document.querySelector(".CategoriasField");

            li.textContent = selectedCategory;
            li.dataset.val = selectedCategory;
            li.onclick = function () {
                lista.removeChild(li);
                categoriesInputList.appendChild(li);
                input.value = input.value.replace(selectedCategory + ",", "");
            }

            lista.appendChild(li);
            input.value = input.value + selectedCategory + ",";
            categoriesInputList.removeChild(document.querySelector("li[data-val=" + selectedCategory + "]"));
            selectedCategoryInput.value = "";
            holder.textContent = "";
        }
    </script>
</asp:Content>