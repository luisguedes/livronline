<%@ Page Title="Livros" EnableEventValidation="false" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="card">
        <h2>Livros</h2>
        <asp:GridView ID="gridLivro" runat="server" CellSpacing="0" CellPadding="0" BorderWidth="0" AutoGenerateColumns="false"
             OnPreRender="GridView_PreRender" CssClass="custom-table">
            <Columns>
                <asp:BoundField DataField="isbn" HeaderText="ISBN" />
                <asp:BoundField DataField="titulo" HeaderText="Título" />
                <asp:BoundField DataField="autor" HeaderText="Autor" />
                <asp:BoundField DataField="qtde" HeaderText="Quantidade" />
                <asp:BoundField DataField="editora" HeaderText="Editora" />
                <asp:TemplateField HeaderText="Ações">
                    <ItemTemplate> 
                        <button data-href="/livros/Editar?id=" class="action-button edit-button">
                            <i class="far fa-edit"></i>
                        </button>
                        <button class="action-button delete-button">
                            <i class="far fa-trash-alt"></i>
                        </button>
                    </ItemTemplate> 
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>

    <div style="display:none">
        <asp:Button ID="removeLivroBtn" runat="server" OnClick="removeLivro" />
    </div>

    <script>
        console.log("esse livro?")
        window.pageRemoveId = "<%= removeLivroBtn.UniqueID %>";
        window.pageQuestion = "esse livro?"
    </script>
    <script src="~/Scripts/list.js"></script>
</asp:Content>
