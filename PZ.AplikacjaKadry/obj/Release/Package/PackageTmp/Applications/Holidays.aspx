<%@ Page Title="Urlopy" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Holidays.aspx.cs" Inherits="SZRBD.Kadry.Applications.Holidays" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
        <div class="col-md-9">
            <h3 class="about-header">Wnioski urlopowe</h3>
            <hr />
        </div>
    </div>
    <div class="row">
        <div class="col-md-9">
            <ul class="nav nav-tabs">
                <li class="active"><a data-toggle="tab" href="#tab-moje">Moje wnioski</a></li>

                <asp:LoginView runat="server" ViewStateMode="Disabled">
                    <RoleGroups>
                        <asp:RoleGroup Roles="Manager, Administrator">
                            <ContentTemplate>
                                <li><a data-toggle="tab" href="#tab-pracownicy">Wnioski pracowników</a></li>
                            </ContentTemplate>
                        </asp:RoleGroup>
                    </RoleGroups>
                </asp:LoginView>


            </ul>
        </div>

    </div>

    <div class="tab-content" style="margin-top: 20px;">
        <div id="tab-moje" class="col-md-12 tab-pane fade in active">
            <div class="row" id="MyRequests">
                <div class="col-md-9">
                    <asp:Label runat="server" ID="ErrorMessage"></asp:Label>
                    <asp:ListView ID="MyHolidaysList" runat="server" DataKeyNames="Id_wniosek">
                        <EmptyDataTemplate>
                            <table class="table table-bordered">
                                <tr>
                                    <th>Id wniosku</th>
                                    <th>Typ</th>
                                    <th>Imię</th>
                                    <th>Nazwisko</th>
                                    <th>Data od</th>
                                    <th>Data do</th>
                                    <th></th>
                                </tr>
                            </table>
                            <p style="margin-top: -15px; font-size: 12px;">Brak rekordów do wyświetlenia.</p>
                        </EmptyDataTemplate>
                        <EmptyItemTemplate>
                            <td />
                        </EmptyItemTemplate>
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("Id_wniosek")%></td>
                                <td><%# Eval("Rodzaj_urlop")%></td>
                                <td><%# Eval("Imie_pracownik")%></td>
                                <td><%# Eval("Nazwisko_pracownik")%></td>
                                <td><%# Eval("Data_od")%></td>
                                <td><%# Eval("Data_do")%></td>
                                <td><%# Eval("Status_urlop")%></td>
                                <td><a href="EditHoliday.aspx?ID=<%# Eval("Id_wniosek")%>">Wyświetl</a></td>
                            </tr>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <table class="table table-bordered">
                                <tr>
                                    <th>Id wniosku</th>
                                    <th>Typ</th>
                                    <th>Imię</th>
                                    <th>Nazwisko</th>
                                    <th>Data od</th>
                                    <th>Data do</th>
                                    <th>Status</th>
                                    <th></th>
                                </tr>
                                <tr>
                                    <tr id="ItemPlaceholder" runat="server">
                                    </tr>
                                </tr>
                            </table>
                        </LayoutTemplate>
                    </asp:ListView>
                </div>
            </div>


            <div class="row">
                <a href="NewHoliday.aspx" class="btn btn-info">Zgłoś wniosek</a>
            </div>
        </div>

        <div id="tab-pracownicy" class="col-md-12 tab-pane fade">
             <div class="col-md-9">
                <div class="row" id="EmployeesRequests">
                    <asp:Label runat="server" ID="Label1"></asp:Label>
                    <asp:ListView ID="EmployeesHolidaysList" runat="server" DataKeyNames="Id_wniosek">
                        <EmptyDataTemplate>
                            <table class="table table-bordered">
                                <tr>
                                    <th>Id wniosku</th>
                                    <th>Typ</th>
                                    <th>Imię</th>
                                    <th>Nazwisko</th>
                                    <th>Data od</th>
                                    <th>Data do</th>
                                    <th></th>
                                </tr>
                            </table>
                            <p style="margin-top: -15px; font-size: 12px;">Brak rekordów do wyświetlenia.</p>
                        </EmptyDataTemplate>
                        <EmptyItemTemplate>
                            <td />
                        </EmptyItemTemplate>
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("Id_wniosek")%></td>
                                <td><%# Eval("Rodzaj_urlop")%></td>
                                <td><%# Eval("Imie_pracownik")%></td>
                                <td><%# Eval("Nazwisko_pracownik")%></td>
                                <td><%# Eval("Data_od")%></td>
                                <td><%# Eval("Data_do")%></td>
                                <td><%# Eval("Status_urlop")%></td>
                                <td><a href="DispHoliday.aspx?ID=<%# Eval("Id_wniosek")%>">Wyświetl</a></td>

                            </tr>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <table class="table table-bordered">
                                <tr>
                                    <th>Id wniosku</th>
                                    <th>Typ</th>
                                    <th>Imię</th>
                                    <th>Nazwisko</th>
                                    <th>Data od</th>
                                    <th>Data do</th>
                                    <th>Status</th>
                                    <th></th>
                                </tr>
                                <tr>
                                    <tr id="ItemPlaceholder" runat="server">
                                    </tr>
                                </tr>
                            </table>
                        </LayoutTemplate>
                    </asp:ListView>
                </div>
            </div>
        </div>
    </div>

    <div class="col-md-3 nav-fixed-right">
        <div class="row">
            <asp:LoginView runat="server" ViewStateMode="Disabled">
                <RoleGroups>
                    <asp:RoleGroup Roles="Manager, Administrator">
                        <ContentTemplate>
                            <h4>Zarządzaj wnioskami</h4>
                            <ul class="list-group">
                                <li class="list-group-item active"><a style="color: white !important" href="Holidays.aspx">Urlopy</a></li>
                                <li class="list-group-item"><a href="Employment.aspx">Zatrudnienie</a></li>
                            </ul>
                        </ContentTemplate>
                    </asp:RoleGroup>
                </RoleGroups>
            </asp:LoginView>
        </div>
    </div>


</asp:Content>
