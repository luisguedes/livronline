<%@ Page Title="Editora" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Editar.aspx.cs" Inherits="Editar" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="card">
        <h2>Dados da Editora</h2>
        <div class="row">
            <div class="col-md-12">
                <div class="input <% if (isUpdate) { %> disabled <% } %>">
                    <asp:TextBox ID="Id" runat="server" Placeholder=" " />
                    <label for="id">CNPJ</label>
                </div>

                <div class="input">
                    <asp:TextBox ID="Nome" runat="server" Placeholder=" " />
                    <label for="Nome">Nome</label>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-5">
                <div class="input">
                    <asp:TextBox ID="Pais" runat="server" Placeholder=" " />
                    <label for="pais">País</label>
                </div>
            </div>
            <div class="col-md-5">
                <div class="input">
                    <asp:TextBox ID="Cidade" runat="server" Placeholder=" " />
                    <label for="cidade">Cidade</label>
                </div>
            </div>
            <div class="col-md-2">
                <div class="input">
                    <asp:TextBox ID="Estado" runat="server" Placeholder=" " />
                    <label for="estado">Estado</label>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <div class="input">
                    <asp:TextBox ID="Logradouro" runat="server" Placeholder=" " />
                    <label for="logradouro">Logradouro</label>
                </div>
            </div>

            <div class="col-md-3">
                <div class="input">
                    <asp:TextBox ID="Bairro" runat="server" Placeholder=" " />
                    <label for="bairro">Bairro</label>
                </div>
            </div>

            <div class="col-md-3">
                <div class="input">
                    <asp:TextBox ID="Numero" runat="server" Placeholder=" " />
                    <label for="numero">Número</label>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-7">
                <div class="input">
                    <asp:TextBox ID="Complemento" runat="server" Placeholder=" " />
                    <label for="complemento">Complemento</label>
                </div>
            </div>
            <div class="col-md-5">
                <div class="input">
                    <asp:TextBox ID="CEP" runat="server" Placeholder=" " />
                    <label for="cep">CEP</label>
                </div>
            </div>
        </div>
    </div>
    <div class="text-right">
        <% if (isUpdate) { %>
           <asp:Button CssClass="button red" Text="Deletar" ID="deletarBtn" runat="server" onClick="deletarEditora" />
        <% } %>

        <asp:Button CssClass="button" Text="Salvar" runat="server" ID="salvarBtn" onClick="salvarEditora" />
    </div>
</asp:Content>
