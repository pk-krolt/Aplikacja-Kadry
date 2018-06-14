<%@ Page Title="Kontakt" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="SZRBD.Kadry.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <h4>W razie pytań lub problemów z aplikacją skontaktuj się z naszą grupą wsparcia aplikacji Kadrex.</h4>
    <div class="col-md-4">
        <img src="/Images/KADREX.png" width="350"/>
    </div>
    <div class="col-md-8">
    <address style="margin-top: 10px;">
        ul. Śniadeckich<br />
        75-004 Koszalin<br />
        <abbr title="Phone">Tel:</abbr>
        400 400 400<br />
    </address>

    <address>
        <strong>Support:</strong>   <a href="mailto:support@kadrex.corp.com">support@kadrex.corp.com</a><br />
    </address>
        </div>
</asp:Content>
