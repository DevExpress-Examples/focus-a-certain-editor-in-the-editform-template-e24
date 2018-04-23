#region Using
using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Web.SessionState;
using System.ComponentModel;
#endregion
public partial class BatchUpdate : System.Web.UI.Page {
    protected void Page_Load(object sender, EventArgs e) {
        //Populate grid with data on the first load
        if(!IsPostBack && !IsCallback) {
            InvoiceItemsProvider provider = new InvoiceItemsProvider();
            provider.Populate();
            grid.StartEdit(1);
        }
    }
}

