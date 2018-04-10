<%@ Page Title="Praca" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Advert.aspx.cs" Inherits="SZRBD.Kadry.Job.Advert" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="margin-top: 36px; position: absolute; margin-left: 200px; z-index: 1000;">
        <asp:Button runat="server" ID="Cancel" OnClientClick="window.history.back(); return false;" Text="Wróć" CssClass="btn btn-success" />
    </div>

    <div class="col-md-12">
        <h3 class="about-header">Ogłoszenie</h3>
        <hr />

    </div>

    <div class="row">
        <asp:FormView ID="AdvertDetails" runat="server" ItemType="SZRBD.Kadry.Models.Advert" SelectMethod="GetItem" RenderOuterTable="false">
            <ItemTemplate>
                <div class="row">
                    <div class="col-md-2">
                        <img src="/Images/leaf_logo.png" width="150" />
                    </div>
                    <div class="col-md-10">
                        <h2><%#:Item.Name %></h2>
                        <b>Data dodania: </b><%#:Item.Created %>
                        <br />
                        <b>Dział: </b><%#:Item.Department %>
                        <br />
                        <b>Status: </b><%#:Item.Status %>
                        <br />
                    </div>
                </div>
                <hr />
                <table>
                    <tr>
                        <td>
                            <p><%#:Item.Description %></p>
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:FormView>
    </div>
    <hr />
    <div class="row">
        <h3>Złóż aplikacje</h3>
        <section id="advertForm">
            <div class="form-horizontal">
                <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                    <p class="text-danger">
                        <asp:Literal runat="server" ID="FailureText" />
                    </p>
                </asp:PlaceHolder>
                <div>
                    <asp:Label runat="server" ID="MessageLabel"></asp:Label>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="Name" CssClass="col-md-2 control-label">Imię</asp:Label>
                    <div class="col-md-10">
                        <asp:TextBox runat="server" ID="Name" CssClass="form-control" TextMode="SingleLine" Width="250" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="Name"
                            CssClass="text-danger" ErrorMessage="Pole jest wymagane." />
                    </div>
                </div>

                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="Surname" CssClass="col-md-2 control-label">Nazwisko</asp:Label>
                    <div class="col-md-10">
                        <asp:TextBox runat="server" ID="Surname" CssClass="form-control" TextMode="SingleLine" Width="250" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="Surname"
                            CssClass="text-danger" ErrorMessage="Pole jest wymagane." />
                    </div>
                </div>

                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-2 control-label">Email</asp:Label>
                    <div class="col-md-10">
                        <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" Width="250" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                            CssClass="text-danger" ErrorMessage="Pole jest wymagane." />
                    </div>
                </div>

                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="Phone" CssClass="col-md-2 control-label">Telefon</asp:Label>
                    <div class="col-md-10">
                        <asp:TextBox runat="server" ID="Phone" MaxLength="9" CssClass="form-control" TextMode="Phone" Width="250" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="Phone"
                            CssClass="text-danger" ErrorMessage="Pole jest wymagane." />
                    </div>
                </div>

                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="CV" CssClass="col-md-2 control-label">Plik CV</asp:Label>
                    <div class="col-md-10">
                        <asp:FileUpload ID="CV" runat="server" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="CV"
                            CssClass="text-danger" ErrorMessage="Pole jest wymagane." />
                    </div>
                </div>

                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="Message" CssClass="col-md-2 control-label">Informacje dodatkowe</asp:Label>
                    <div class="col-md-10">
                        <asp:TextBox runat="server" ID="Message" TextMode="MultiLine" Rows="5" Style="resize: none;" CssClass="form-control" />
                    </div>
                </div>


                <div class="form-group">
                    <div class="col-md-offset-2 col-md-10">
                        <asp:Button runat="server" ID="Send" OnClick="Send_Click" Text="Wyślij" CssClass="btn btn-info" />
                    </div>
                </div>
            </div>
        </section>



    </div>

</asp:Content>
