<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditHoliday.aspx.cs" Inherits="SZRBD.Kadry.Applications.EditHoliday" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">



     <div>
            <h3 class="about-header">Edytuj wniosek</h3>
         <br />
    </div>
     <div class="row">
            <section id="advertForm">
                <div class="form-horizontal">
                    <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="FailureText" />
                        </p>
                    </asp:PlaceHolder>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="Name" CssClass="col-md-2 control-label">Tytuł wniosku</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="Name" CssClass="form-control" TextMode="SingleLine" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Name"
                                CssClass="text-danger" ErrorMessage="Pole jest wymagane." />
                        </div>
                    </div>

                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="Type" CssClass="col-md-2 control-label">Typ urlopu</asp:Label>
                        <div class="col-md-10">
                            <asp:DropDownList ID="Type" Width="280px" CssClass="form-control" runat="server">
                                <asp:ListItem>--Wybierz--</asp:ListItem>
                                <asp:ListItem>Wypoczynkowy</asp:ListItem>
                                <asp:ListItem>Szkoleniowy</asp:ListItem>
                                <asp:ListItem>Macierzynski</asp:ListItem>
                                <asp:ListItem>Zdrowotny</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" InitialValue="--Wybierz--" ControlToValidate="Type" CssClass="text-danger" ErrorMessage="Pole jest wymagane." />
                        </div>
                    </div>

                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="DateFrom" CssClass="col-md-2 control-label">Data od</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="DateFrom" CssClass="form-control" TextMode="Date" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="DateFrom"
                                CssClass="text-danger" ErrorMessage="Pole jest wymagane." />
                        </div>
                    </div>


                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="DateTo" CssClass="col-md-2 control-label">Data do</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="DateTo" CssClass="form-control" TextMode="Date" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="DateTo"
                                CssClass="text-danger" ErrorMessage="Pole jest wymagane." />
                        </div>
                    </div>


                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="Message" CssClass="col-md-2 control-label">Dodatkowe informacje</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="Message" TextMode="MultiLine" Rows="15" style="resize: none;" CssClass="form-control" />
                        </div>
                    </div>

                    <asp:HiddenField runat="server" ID="RequestID" />

                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                            <asp:Button runat="server" ID="Save" OnClick="Save_Click" Text="Wyślij" CssClass="btn btn-info" />
                            <asp:Button runat="server" ID="Cancel" OnClientClick="window.history.back(); return false;" Text="Anuluj" CssClass="btn btn-default" />
                        </div>
                    </div>

                    <div>
                        <asp:Label runat="server" ID="MessageLabel"></asp:Label>
                    </div>
                </div>
            </section>



    </div>



</asp:Content>
