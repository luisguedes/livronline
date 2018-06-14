<%@ Page Title="Clientes" EnableEventValidation="false" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="card">
        <h2>Clientes</h2>
        <asp:GridView ID="gridClientes" runat="server" CellSpacing="0" CellPadding="0" BorderWidth="0" AutoGenerateColumns="false"
             OnPreRender="GridView_PreRender" CssClass="custom-table">
            <Columns>
                <asp:BoundField DataField="cpf_cnpj" HeaderText="Identificador" />
                <asp:BoundField DataField="nome" HeaderText="Nome" />
                <asp:BoundField DataField="email" HeaderText="E-mail" />
                <asp:TemplateField HeaderText="Ações">
                    <ItemTemplate> 
                        <button data-href="/clientes/Editar?id=" class="action-button edit-button">
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
        <asp:Button ID="removeClientBtn" runat="server" OnClick="removerCliente" />
    </div>

    <script>
        window.pageRemoveId = "<%= removeClientBtn.UniqueID %>";
        window.pageQuestion = "esse usuario?"
    </script>
    <script src="/Scripts/list.js"></script>
</asp:Content>


