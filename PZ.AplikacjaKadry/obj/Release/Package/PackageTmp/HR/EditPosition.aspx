<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditPosition.aspx.cs" Inherits="SZRBD.Kadry.HR.EditPosition" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <div>
        <h3 class="about-header">Edytuj stanowisko</h3>
        <br />
    </div>
    <div class="row">
        <section id="positionForm">
            <div class="form-horizontal">
                <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                    <p class="text-danger">
                        <asp:Literal runat="server" ID="FailureText" />
                    </p>
                </asp:PlaceHolder>
                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="Name" CssClass="col-md-2 control-label">Nazwa stanowiska</asp:Label>
                    <div class="col-md-10">
                        <asp:TextBox runat="server" ID="Name" CssClass="form-control" TextMode="SingleLine" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="Name"
                            CssClass="text-danger" ErrorMessage="Pole jest wymagane." />
                    </div>
                </div>

                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="Department" CssClass="col-md-2 control-label">Wybierz dział</asp:Label>
                    <div class="col-md-10">
                        <asp:DropDownList runat="server" ID="Department" Width="280px" CssClass="form-control">
                            <asp:ListItem>--Wybierz--</asp:ListItem>
                            <asp:ListItem>Produkcja</asp:ListItem>
                            <asp:ListItem>Ksiegowosc</asp:ListItem>
                            <asp:ListItem>Zarząd</asp:ListItem>
                            <asp:ListItem>Magazyn</asp:ListItem>
                            <asp:ListItem>Sprzedaz</asp:ListItem>
                            <asp:ListItem>Marketing</asp:ListItem>
                            <asp:ListItem>Transport</asp:ListItem>
                            <asp:ListItem>IT</asp:ListItem>
                            <asp:ListItem>Inne</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" InitialValue="--Wybierz--" ControlToValidate="Department" CssClass="text-danger" ErrorMessage="Pole jest wymagane." />
                    </div>
                </div>

                <asp:HiddenField runat="server" ID="PositionID" />

                <div class="form-group">
                    <div class="col-md-offset-2 col-md-10">
                        <asp:Button runat="server" ID="Save" OnClick="Save_Click" Text="Zapisz" CssClass="btn btn-info" />
                        <asp:Button runat="server" ID="Cancel" OnClientClick="window.history.back(); return false;" Text="Anuluj" CssClass="btn btn-default" />
                    </div>
                </div>

                <div>
                    <asp:Label runat="server" ID="MessageLabel"></asp:Label>
                </div>
            </div>
            <p>
                <%-- Enable this once you have account confirmation enabled for password reset functionality
                    <asp:HyperLink runat="server" ID="ForgotPasswordHyperLink" ViewStateMode="Disabled">Forgot your password?</asp:HyperLink>
                --%>
            </p>
        </section>


    </div>

</asp:Content>
