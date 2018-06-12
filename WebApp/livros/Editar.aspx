﻿<%@ Page Title="Livro" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Editar.aspx.cs" Inherits="Editar" %>

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

            <div class="col-md-6">
                <div class="input">
                    <asp:TextBox ID="Autor" runat="server" Placeholder=" " />
                    <label for="Autor">Autor</label>
                </div>
            </div>

            <div class="col-md-4">
                <div class="input">
                    <asp:TextBox ID="Editora" runat="server" Placeholder=" " />
                    <label for="Editora">Editora</label>
                </div>
            </div>
        </div>
    </div>
    <div class="card">
        <h2>Categorias</h2>
        <div display="none">
            <asp:TextBox ID="CategoriasField" CssClass="CategoriasField" runat="server" Placeholder=" " />
        </div>

        <div class="input">
            <select id="Categorias">
                <% foreach (String nome in todasCategorias) { %>
                    <option value="<%= nome %>"><%= nome %></option>
                <% } %>
            </select>
        </div>
        <button type="button" id="adicionarCategoria" onclick="adicionarCategoria"> Adicionar </button>

        <ul id="listaDeCategoria">
            <% foreach (String nome in categoriasDoLivro) { %>
               <li><%= nome %></li>
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
            var categorias = document.getElementById("Categorias");
            var lista = document.getElementById("listaDeCategoria");
            var option = categorias.options[categorias.selectedIndex];
            var input = document.querySelector(".CategoriasField");

            li.textContent = option.value;
            li.onclick = function () {
                lista.removeChild(li);
                categorias.appendChild(option);
                input.value = input.value.replace(option.value + ",", "");
            }

            lista.appendChild(li);
            input.value = input.value + option.value + ",";
            categorias.removeChild(option);
        }
    </script>
</asp:Content>