﻿<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SZRBD.Kadry._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">


        <div class="row">
            <div class="logo-jumbotron"><img src="Images/kadrex-top.jpg" /></div>
        </div>

    <div class="row">
        <div class="col-md-4">
            <h2>Witaj na pokładzie</h2>
            <p>
                <img src="Images/KADREX.png" width="350"  />
            </p>
            <p>
                Witaj na stronie oprogramowania Kadrex. Zaloguj się w celu uzyskania dostępu do pełnej funkcjonalności aplikacji.
            </p>

        </div>
        <div class="col-md-4">
            <h2>Oferty pracy</h2>
            <p><img src="Images/find-jobs.jpg" width="350" /></p>
            <p>
                Przeszukaj dostępne oferty pracy i znajdź zatrudnienie w naszej firmie. Aplikacje można składać osobiście lub za pośrednictwem formularza online.
            </p>
            <p>
                <a class="btn btn-default" href="/Job/Adverts">Zobacz oferty &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Kontakt</h2>
            <p><img src="Images/contact-us.png" width="350" /></p>
            <p>
                Skontaktuj się, w celu uzyskania więcej informacji na temat aplikacji Kadry.
            </p>
            <p>
                <a class="btn btn-default" href="/Contact">Skontaktuj się z nami &raquo;</a>
            </p>
        </div>
    </div>

</asp:Content>
