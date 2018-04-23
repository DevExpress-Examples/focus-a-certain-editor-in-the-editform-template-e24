#Region "Using"
Imports System
Imports System.Data
Imports System.Configuration
Imports System.Collections
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls
Imports System.Web.SessionState
Imports System.ComponentModel
#End Region
Partial Public Class BatchUpdate
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
        'Populate grid with data on the first load
        If (Not IsPostBack) AndAlso (Not IsCallback) Then
            Dim provider As New InvoiceItemsProvider()
            provider.Populate()
            grid.StartEdit(1)
        End If
    End Sub
End Class

