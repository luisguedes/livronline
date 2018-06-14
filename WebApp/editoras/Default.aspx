<%@ Page Title="Editoras" EnableEventValidation="false" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="card">
        <h2>Editoras</h2>
        <asp:GridView ID="gridEditora" runat="server" CellSpacing="0" CellPadding="0" BorderWidth="0" AutoGenerateColumns="false"
             OnPreRender="GridView_PreRender" CssClass="custom-table">
            <Columns>
                <asp:BoundField DataField="cnpj" HeaderText="CNPJ" />
                <asp:BoundField DataField="editoranome" HeaderText="Nome" />
                <asp:BoundField DataField="cidade" HeaderText="Cidade" />
                <asp:BoundField DataField="logradouro" HeaderText="Logradouro" />
                <asp:TemplateField HeaderText="Ações">
                    <ItemTemplate> 
                        <button data-href="/editoras/Editar?id=" class="action-button edit-button">
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
        <asp:Button ID="removeEditoraBtn" runat="server" OnClick="removeEditora" />
    </div>

    <script>
        window.pageRemoveId = "<%= removeEditoraBtn.UniqueID %>";
        window.pageQuestion = "essa editora?"
    </script>
    <script src="/Scripts/list.js"></script>
</asp:Content>

