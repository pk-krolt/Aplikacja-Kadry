<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DispEmplRequest.aspx.cs" Inherits="SZRBD.Kadry.Applications.DispEmplRequest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

        <div class="row">
            <asp:FormView ID="ApplicationDetails" runat="server" ItemType="SZRBD.Kadry.Models.EmploymentRequest" SelectMethod="GetItem" RenderOuterTable="false">
                <ItemTemplate>
                    <div class="row">
                        <div style="margin-top: 36px; position: absolute; right: 400px; z-index: 1000;">
                            <asp:Button runat="server" ID="Cancel" OnClientClick="window.history.back(); return false;" Text="Wróć" CssClass="btn btn-default" />
                        </div>

                        <div class="col-md-12">
                            <h3 class="about-header">Kandydat: <%#:Item.AdvertName %></h3>
                            
                            <hr />
                            <h4><a href="<%#:Item.AdvertLink %>">Ogłoszenie: <%#:Item.AdvertName %></a></h4>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-4">
                            <b>Imię: </b><%#:Item.Name %>
                            <br />
                            <b>Nazwisko: </b><%#:Item.Surname %>
                            <br />
                            <b>Telefon: </b><%#:Item.Phone %>
                            <br />
                            <b>Email: </b><%#:Item.Email %>
                            <br />
                            <b>Dodatkowa wiadomość: </b>
                            <br />
                            <%#:Item.Message %>
                            <br />
                            <b>Data zgłoszenia: </b><%#:Item.Date %>
                            <br />
                            <b>Status: </b><%#:Item.Status %>
                            <br />
                            <br />
                        </div>
                        <div class="col-md-8">
                            <h4>Dokument CV</h4>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:FormView>


            <div class="row">
                <div>
                    <asp:Label runat="server" AssociatedControlID="YourAnswerBox" CssClass="col-md-12 control-label">Odpowiedź na zgłoszenie</asp:Label>
                    <div class="col-md-12">
                        <asp:TextBox runat="server" ID="YourAnswerBox" Rows="10" Style="resize: none;" CssClass="form-control" TextMode="MultiLine" />
                    </div>
                </div>
            </div>
        </div>

        <div class="row" style="margin-top: 20px;">
            <asp:Button runat="server" ID="Accept" OnClick="Accept_Click" Text="Akceptuj" CssClass="btn btn-info" />
            <asp:Button runat="server" ID="Decline" OnClick="Decline_Click" Text="Odrzuć" CssClass="btn btn-danger" />
        </div>


</asp:Content>
