<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddEmployee.aspx.cs" Inherits="SZRBD.Kadry.HR.AddEmployee" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    
     <div>
            <h3 class="about-header">Dodaj pracownika</h3>
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
                        <asp:Label runat="server" AssociatedControlID="Name" CssClass="col-md-2 control-label">Imię</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="Name" CssClass="form-control" TextMode="SingleLine" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Name"
                                CssClass="text-danger" ErrorMessage="Pole jest wymagane." />
                        </div>
                    </div>

                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="Surname" CssClass="col-md-2 control-label">Nazwisko</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="Surname" CssClass="form-control" TextMode="SingleLine" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Surname"
                                CssClass="text-danger" ErrorMessage="Pole jest wymagane." />
                        </div>
                    </div>

                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="Birthday" CssClass="col-md-2 control-label">Data urodzenia</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="Birthday" Width="280" CssClass="form-control" TextMode="Date" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Birthday" CssClass="text-danger" ErrorMessage="Pole jest wymagane." />
                        </div>
                    </div>

                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="PESEL" CssClass="col-md-2 control-label">PESEL</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" MaxLength="11" ID="PESEL" CssClass="form-control" TextMode="SingleLine" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="PESEL" CssClass="text-danger" ErrorMessage="Pole jest wymagane." />
                        </div>
                    </div>

                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-2 control-label">Email</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Email" CssClass="text-danger" ErrorMessage="Pole jest wymagane." />
                        </div>
                    </div>


                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="Position" CssClass="col-md-2 control-label">Stanowisko</asp:Label>
                        <div class="col-md-10">
                            <asp:DropDownList ID="Position" Width="280px" CssClass="form-control" runat="server">
                                <asp:ListItem>--Wybierz--</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Email" CssClass="text-danger" ErrorMessage="Pole jest wymagane." />
                        </div>
                    </div>


                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="HolidayRest" CssClass="col-md-2 control-label">Urlop wypoczynkowy</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="HolidayRest" Width="280" CssClass="form-control" TextMode="Number" />
                        </div>
                    </div>

                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="HolidayRest" CssClass="col-md-2 control-label">Urlop szkoleniowy</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="HolidayTraining" Width="280" CssClass="form-control" TextMode="Number" />
                        </div>
                    </div>

                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="HolidayRest" CssClass="col-md-2 control-label">Urlop macierzyński</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="HolidayMaternal" Width="280" CssClass="form-control" TextMode="Number" />
                        </div>
                    </div>

                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="HolidayHealth" CssClass="col-md-2 control-label">Urlop zdrowotny</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="HolidayHealth" Width="280" CssClass="form-control" TextMode="Number" />
                        </div>
                    </div>
                    <hr />
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label">Hasło użytkownika</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="Password" Width="280" CssClass="form-control" TextMode="SingleLine" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" CssClass="text-danger" ErrorMessage="Pole jest wymagane." />
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                            <asp:Button runat="server" ID="Add" OnClick="Add_Click" Text="Dodaj" CssClass="btn btn-info" />
                            <asp:Button runat="server" ID="Cancel" OnClientClick="window.history.back(); return false;" Text="Anuluj" CssClass="btn btn-default" />
                        </div>
                    </div>
                     <asp:HiddenField runat="server" ID="EmployeeID" />
                    <div>
                        <asp:Label runat="server" ID="MessageLabel"></asp:Label>
                    </div>
                </div>
            </section>

         </div>


</asp:Content>
