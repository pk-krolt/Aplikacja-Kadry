<%@ Page Title="Kontakt" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="SZRBD.Kadry.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <h3>W razie pytań skontaktuj się z nami</h3>
    <div class="col-md-2">
        <img src="Images/leaf_logo.png" width="150"/>
    </div>
    <div class="col-md-10">
    <address style="margin-top: 10px;">
        ul. Śniadeckich<br />
        75-004 Koszalin<br />
        <abbr title="Phone">Tel:</abbr>
        400 400 400<br />
    </address>

    <address>
        <strong>Support:</strong>   <a href="mailto:krouliko@gmail.com">krouliko@gmail.com</a><br />
    </address>
        </div>
</asp:Content>
