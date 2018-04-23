<%-- BeginRegion Page setup --%>
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="BatchUpdate" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.1" Namespace="DevExpress.Web.ASPxEditors"  TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v8.1" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v8.1" Namespace="DevExpress.Web.ASPxPager" TagPrefix="dxwp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%-- EndRegion --%>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Focus a certain editor in the EditForm template</title>
<script type="text/jscript">
function FocusQuantity() {
    if(!_aspxIsExists(quantityEditor)) return;
    quantityEditor.Focus();
}
</script>    
</head>
<body>
    <form id="form1" runat="server">
    
    <dxwgv:ASPxGridView ID="grid" ClientInstanceName="grid" runat="server" DataSourceID="ObjectDataSource1" KeyFieldName="Id" Width="300px">
        <Columns>
            <dxwgv:GridViewCommandColumn  VisibleIndex="0">
                <EditButton Visible="true"></EditButton>
            </dxwgv:GridViewCommandColumn>
        <%-- BeginRegion Data Columns --%>
            <dxwgv:GridViewDataColumn FieldName="Id" VisibleIndex="2">
            </dxwgv:GridViewDataColumn>
            <dxwgv:GridViewDataColumn FieldName="Name" VisibleIndex="3">
            </dxwgv:GridViewDataColumn>
            <dxwgv:GridViewDataColumn FieldName="Quantity" VisibleIndex="4">
                <EditFormSettings Visible="False" />
            </dxwgv:GridViewDataColumn>
            <dxwgv:GridViewDataTextColumn FieldName="Price" VisibleIndex="5">
                <PropertiesTextEdit DisplayFormatString="c"></PropertiesTextEdit>
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="Total" VisibleIndex="6">
                <PropertiesTextEdit DisplayFormatString="c"></PropertiesTextEdit>
            </dxwgv:GridViewDataTextColumn>
        <%-- EndRegion --%>
        </Columns>
        <Templates>
            <EditForm>
             <dxwgv:ASPxGridViewTemplateReplacement ID="Editors" ReplacementType="EditFormEditors" runat="server"></dxwgv:ASPxGridViewTemplateReplacement>
             <div style="text-align:right; padding:2px 2px 2px 2px">
                 <dxwgv:ASPxGridViewTemplateReplacement ID="UpdateButton" ReplacementType="EditFormUpdateButton" runat="server"></dxwgv:ASPxGridViewTemplateReplacement>
                 <dxwgv:ASPxGridViewTemplateReplacement ID="CancelButton" ReplacementType="EditFormCancelButton" runat="server"></dxwgv:ASPxGridViewTemplateReplacement>
             </div>
             <dxe:ASPxTextBox ID="quantityEditor" runat="server" ClientInstanceName="quantityEditor"  EnableClientSideAPI="true" Text='<%# Bind("Quantity") %>' Width="100%" > </dxe:ASPxTextBox>
            </EditForm>
        </Templates>
        <ClientSideEvents EndCallback="function(s, e) { FocusQuantity();}" BeginCallback="function(s, e) { FocusQuantity();}" Init="function(s, e) { FocusQuantity();}" />    
    </dxwgv:ASPxGridView>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server"
            SelectMethod="GetItems" TypeName="InvoiceItemsProvider" UpdateMethod="Update" InsertMethod="Insert" DeleteMethod="Delete" ></asp:ObjectDataSource>
    </form>
</body>
</html>
