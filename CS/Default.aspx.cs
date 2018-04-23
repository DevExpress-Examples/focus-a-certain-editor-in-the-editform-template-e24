using System;

public partial class _Default : System.Web.UI.Page {
    protected void Page_Load(object sender, EventArgs e) {
        //Populate grid with data on the first load
        if(!IsPostBack && !IsCallback) {
            InvoiceItemsProvider provider = new InvoiceItemsProvider();
            provider.Populate();
            grid.StartEdit(1);
        }
    }
}