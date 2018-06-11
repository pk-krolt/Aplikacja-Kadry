<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditAdvert.aspx.cs" Inherits="SZRBD.Kadry.Job.EditAdvert" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

      <div>
            <h3 class="about-header">Edytuj ogłoszenie</h3>
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
                        <asp:Label runat="server" AssociatedControlID="Name" CssClass="col-md-2 control-label">Nazwa ogłoszenia</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="Name" CssClass="form-control" TextMode="SingleLine" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Name"
                                CssClass="text-danger" ErrorMessage="Pole jest wymagane." />
                        </div>
                    </div>

                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="Position" CssClass="col-md-2 control-label">Stanowisko</asp:Label>
                        <div class="col-md-10">
                            <asp:DropDownList ID="Position" Width="280px" CssClass="form-control" runat="server">
                                <asp:ListItem>--Wybierz--</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" InitialValue="--Wybierz--" ControlToValidate="Position" CssClass="text-danger" ErrorMessage="Pole jest wymagane." />
                        </div>
                    </div>

                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="Status" CssClass="col-md-2 control-label">Status</asp:Label>
                        <div class="col-md-10">
                             <asp:DropDownList runat="server" ID="Status" Width="280px" CssClass="form-control">
                                <asp:ListItem>Aktywne</asp:ListItem>
                                <asp:ListItem>Nieaktywne</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Status" CssClass="text-danger" ErrorMessage="Pole jest wymagane." />
                        </div>
                    </div>

                    <hr />
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="Description" CssClass="col-md-2 control-label">Opis</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="Description" TextMode="MultiLine" Rows="15" style="resize: none;" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Description" CssClass="text-danger" ErrorMessage="Pole jest wymagane." />
                        </div>
                    </div>

                    <asp:HiddenField runat="server" ID="AdvertID" />

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
            </section>



    </div>


</asp:Content>
