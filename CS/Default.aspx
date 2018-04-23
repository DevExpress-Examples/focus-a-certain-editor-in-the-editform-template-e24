<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>Focus a certain editor in the EditForm template</title>
    <script type="text/jscript">
        function FocusQuantity() {
            window.setTimeout(function () {
                if (typeof quantityEditor === 'undefined') return;
                quantityEditor.Focus();
            }, 0);
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <dx:ASPxGridView ID="grid" runat="server" DataSourceID="ObjectDataSource1" KeyFieldName="Id">
            <SettingsEditing Mode="PopupEditForm" />
            <Columns>
                <dx:GridViewCommandColumn ShowEditButton="true" />
                <dx:GridViewDataColumn FieldName="Id">
                </dx:GridViewDataColumn>
                <dx:GridViewDataColumn FieldName="Name">
                </dx:GridViewDataColumn>
                <dx:GridViewDataColumn FieldName="Quantity">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataColumn>
                <dx:GridViewDataTextColumn FieldName="Price">
                    <PropertiesTextEdit DisplayFormatString="c"/>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Total">
                    <PropertiesTextEdit DisplayFormatString="c"/>
                </dx:GridViewDataTextColumn>
            </Columns>
            <Templates>
                <EditForm>
                    <dx:ASPxGridViewTemplateReplacement ID="Editors" ReplacementType="EditFormEditors"
                        runat="server"></dx:ASPxGridViewTemplateReplacement>
                    <div style="text-align: right; padding: 2px 2px 2px 2px">
                        <dx:ASPxGridViewTemplateReplacement ID="UpdateButton" ReplacementType="EditFormUpdateButton"
                            runat="server"></dx:ASPxGridViewTemplateReplacement>
                        <dx:ASPxGridViewTemplateReplacement ID="CancelButton" ReplacementType="EditFormCancelButton"
                            runat="server"></dx:ASPxGridViewTemplateReplacement>
                    </div>
                    <dx:ASPxTextBox ID="quantityEditor" runat="server" ClientInstanceName="quantityEditor"
                        EnableClientSideAPI="true" Text='<%# Bind("Quantity") %>' Width="100%" />
                </EditForm>
            </Templates>
            <ClientSideEvents EndCallback="function(s, e) { FocusQuantity();}" BeginCallback="function(s, e) { FocusQuantity();}"
                Init="function(s, e) { FocusQuantity();}" />
        </dx:ASPxGridView>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetItems"
            TypeName="InvoiceItemsProvider" UpdateMethod="Update" InsertMethod="Insert" DeleteMethod="Delete">
        </asp:ObjectDataSource>
    </form>
</body>
</html>