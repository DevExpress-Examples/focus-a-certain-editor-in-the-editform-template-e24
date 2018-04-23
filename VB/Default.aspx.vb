Imports System

Partial Public Class _Default
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