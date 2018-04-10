<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DispHoliday.aspx.cs" Inherits="SZRBD.Kadry.Applications.DispHoliday" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div style="margin-top: 36px; position: absolute; right: 400px; z-index: 1000;">
            <asp:Button runat="server" ID="Cancel" OnClientClick="window.location.href = 'Holidays.aspx'; return false;" Text="Wróć" CssClass="btn btn-default" />
        </div>

    </div>
    <div>
        <h3 class="about-header"><img src="https://png.icons8.com/cotton/40/000000/file.png">  Wniosek o urlop</h3>
        <hr />
    </div>

    <div class="row">
        <div class="col-md-4">
             <asp:FormView ID="ApplicationDetails" runat="server" ItemType="SZRBD.Kadry.Models.HolidayRequest" SelectMethod="GetItem" RenderOuterTable="false">
            <ItemTemplate>
                <div class="row">
                    <div class="col-md-12">
                        <span><b>Pracownik: </b><%#:Item.Name %> <%#:Item.Surname %></span>
                        <br />
                        <b>Email: </b><%#:Item.Email %>
                        <hr />
                        <b>Typ urlopu: </b><%#:Item.Type %>
                        <br />
                        <b>Data od: </b><%#:Item.DateFrom %>
                        <br />
                        <b>Data do: </b><%#:Item.DateTo %>
                        <br /><br />
                        <b>Dodatkowa wiadomość: </b>
                        <br />
                        <%#:Item.Message %>
                        <hr />
                        <b>Data zgłoszenia: </b><%#:Item.CreatedDate %>
                        <br />
                        <b>Status: </b><%#:Item.Status %>
                        <br /><br />
                    </div>
                </div>
            </ItemTemplate>
        </asp:FormView>
        </div>
        <div class="col-md-8">
            <img width="250" src="../Images/leaf_logo.png" />
        </div>
    </div>
    <div class="row">

        <div class="col-md-12">
            <asp:Label runat="server" AssociatedControlID="YourAnswerBox" CssClass="control-label">Komentarz do decyzji</asp:Label>
            <asp:TextBox runat="server" ID="YourAnswerBox" Width="650px" Rows="10" Style="resize: none;" CssClass="form-control" TextMode="MultiLine" />
        </div>
    </div>

    <div class="row" style="margin-top: 20px; margin-left: 0;">
            <asp:Button runat="server" ID="Accept" OnClick="Accept_Click" Text="Akceptuj" CssClass="btn btn-info" />
            <asp:Button runat="server" ID="Decline" OnClick="Decline_Click" Text="Odrzuć" CssClass="btn btn-danger" />
        </div>

</asp:Content>
