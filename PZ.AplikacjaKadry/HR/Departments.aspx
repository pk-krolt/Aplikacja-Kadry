<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Departments.aspx.cs" Inherits="SZRBD.Kadry.HR.Departments" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
        <div class="col-md-12">
            <h3 class="about-header">Kadra pracownicza</h3>
            <hr />
        </div>
         
        </div>

    <div class="col-md-3 nav-left">
        <div class="row">
            <asp:LoginView runat="server" ViewStateMode="Disabled">
                <RoleGroups>
                    <asp:RoleGroup Roles="Manager, Administrator">
                        <ContentTemplate>
                            <h4>Zarządzanie</h4>
                            <ul class="list-group">
                                 <li class="list-group-item active"><a style="color: white !important;"href="Departments.aspx">Zarządzaj kadrą</a></li>
                                <li class="list-group-item"><a href="Positions.aspx">Zarządzaj stanowiskami</a></li>
                                <li class="list-group-item"><a href="AddPosition.aspx">Dodaj stanowisko</a></li>
                                <li class="list-group-item"><a href="AddEmployee.aspx">Dodaj pracownika</a></li>
                            </ul>
                        </ContentTemplate>
                    </asp:RoleGroup>
                </RoleGroups>
            </asp:LoginView>
        </div>

        <div class="row">
            <h4>Widok</h4>
            <ul class="list-group">
                <li class="list-group-item active"><a style="color: white !important;" href="Departments.aspx">Działy</a></li>
                <li class="list-group-item"><a href="People.aspx">Pracownicy</a></li>
            </ul>
        </div>

        <div class="row">
                <h4>Nawigacja</h4>
            <ul class="list-group">
                <li class="list-group-item"><a href="#Marketing">Marketing</a><span class="badge">5</span></li>
                <li class="list-group-item"><a href="#Management">Zarząd</a><span class="badge">3</span></li>
                <li class="list-group-item"><a href="#BookKeeping">Księgowość</a><span class="badge">2</span></li>
                <li class="list-group-item"><a href="#Sale">Sprzedaż</a><span class="badge">2</span></li>
                <li class="list-group-item"><a href="#Production">Produkcja</a><span class="badge">12</span></li>
                <li class="list-group-item"><a href="#Transport">Transport</a><span class="badge">5</span></li>
                <li class="list-group-item"><a href="#Storage">Magazyn</a><span class="badge">3</span></li>
                <li class="list-group-item"><a href="#IT">IT</a><span class="badge">2</span></li>
                <li class="list-group-item"><a href="#Other">Inne</a><span class="badge">10</span></li>
            </ul>
        </div>
    </div>


    <div class="col-md-9">

    
        <div class="col-md-12">
            <div class="row" id="Production">
                <asp:Label runat="server" ID="ErrorMessage"></asp:Label>
                <asp:ListView ID="ProductionList" runat="server" DataKeyNames="Id_pracownik">
                    <EmptyDataTemplate>
                        <h3>Produkcja</h3>
                        <table class="table table-rows">
                            <tr>
                                <th>ID</th>
                                <th>Imię</th>
                                <th>Nazwisko</th>
                                <th>Stanowisko</th>
                                <th>Kontakt</th>
                                <asp:LoginView runat="server" ViewStateMode="Disabled">
                                    <RoleGroups>
                                        <asp:RoleGroup Roles="Manager, Administrator">
                                            <ContentTemplate>
                                                <th></th>
                                                <th></th>
                                            </ContentTemplate>
                                        </asp:RoleGroup>
                                    </RoleGroups>
                                </asp:LoginView>
                            </tr>
                        </table>
                         <p style="margin-top: -15px; font-size: 12px;">Brak rekordów do wyświetlenia.</p>
                    </EmptyDataTemplate>
                    <EmptyItemTemplate>
                        <td />
                    </EmptyItemTemplate>
                    <ItemTemplate>
                        <tr>
                            <td><%# Eval("Id_pracownik")%></td>
                            <td><%# Eval("Imie_pracownik")%></td>
                            <td><%# Eval("Nazwisko_pracownik")%></td>
                            <td><%# Eval("Nazwa_stanowisko")%></td>
                            <td><%# Eval("Email")%></td>
                            <asp:LoginView runat="server" ViewStateMode="Disabled">
                                <RoleGroups>
                                    <asp:RoleGroup Roles="Manager, Administrator">
                                        <ContentTemplate>
                                            <td><a href="EditEmployee.aspx?ID=<%# Eval("Id_pracownik")%>">Edytuj</a></td>
                                            <td>
                                                <asp:LinkButton runat="server" OnClick="DeleteItem_Click" Text="Usuń" CommandArgument='<%# Eval("Id_pracownik")%>' /></td>
                                        </ContentTemplate>
                                    </asp:RoleGroup>
                                </RoleGroups>
                            </asp:LoginView>
                        </tr>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <h3>Produkcja</h3>
                        <table class="table table-bordered">
                            <tr>
                                <th>ID</th>
                                <th>Imię</th>
                                <th>Nazwisko</th>
                                <th>Stanowisko</th>
                                <th>Kontakt</th>
                                <asp:LoginView runat="server" ViewStateMode="Disabled">
                                    <RoleGroups>
                                        <asp:RoleGroup Roles="Manager, Administrator">
                                            <ContentTemplate>
                                                <th></th>
                                                <th></th>
                                            </ContentTemplate>
                                        </asp:RoleGroup>
                                    </RoleGroups>
                                </asp:LoginView>
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


          <div class="col-md-12">
            <div class="row" id="BookKeeping">
                <asp:Label runat="server" ID="Label1"></asp:Label>
                <asp:ListView ID="BookKeepingList" runat="server" DataKeyNames="Id_pracownik">
                    <EmptyDataTemplate>
                        <h3>Księgowość</h3>
                        <table class="table table-bordered">
                            <tr>
                                <th>ID</th>
                                <th>Imię</th>
                                <th>Nazwisko</th>
                                <th>Stanowisko</th>
                                <th>Kontakt</th>
                                <asp:LoginView runat="server" ViewStateMode="Disabled">
                                    <RoleGroups>
                                        <asp:RoleGroup Roles="Manager, Administrator">
                                            <ContentTemplate>
                                                <th></th>
                                                <th></th>
                                            </ContentTemplate>
                                        </asp:RoleGroup>
                                    </RoleGroups>
                                </asp:LoginView>
                            </tr>
                        </table>
                         <p style="margin-top: -15px; font-size: 12px;">Brak rekordów do wyświetlenia.</p>
                    </EmptyDataTemplate>
                    <EmptyItemTemplate>
                        <td />
                    </EmptyItemTemplate>
                    <ItemTemplate>
                        <tr>
                            <td><%# Eval("Id_pracownik")%></td>
                            <td><%# Eval("Imie_pracownik")%></td>
                            <td><%# Eval("Nazwisko_pracownik")%></td>
                            <td><%# Eval("Nazwa_stanowisko")%></td>
                            <td><%# Eval("Email")%></td>
                             <asp:LoginView runat="server" ViewStateMode="Disabled">
                                <RoleGroups>
                                    <asp:RoleGroup Roles="Manager, Administrator">
                                        <ContentTemplate>
                                            <td><a href="EditEmployee.aspx?ID=<%# Eval("Id_pracownik")%>">Edytuj</a></td>
                                            <td>
                                                <asp:LinkButton runat="server" OnClick="DeleteItem_Click" Text="Usuń" CommandArgument='<%# Eval("Id_pracownik")%>' /></td>
                                        </ContentTemplate>
                                    </asp:RoleGroup>
                                </RoleGroups>
                            </asp:LoginView>
                        </tr>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <h3>Księgowość</h3>
                        <table class="table table-bordered">
                            <tr>
                                <th>ID</th>
                                <th>Imię</th>
                                <th>Nazwisko</th>
                                <th>Stanowisko</th>
                                <th>Kontakt</th>
                                <asp:LoginView runat="server" ViewStateMode="Disabled">
                                    <RoleGroups>
                                        <asp:RoleGroup Roles="Manager, Administrator">
                                            <ContentTemplate>
                                                <th></th>
                                                <th></th>
                                            </ContentTemplate>
                                        </asp:RoleGroup>
                                    </RoleGroups>
                                </asp:LoginView>
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


          <div class="col-md-12">
            <div class="row" id="Management">
                <asp:Label runat="server" ID="Label2"></asp:Label>
                <asp:ListView ID="ManagementList" runat="server" DataKeyNames="Id_pracownik">
                    <EmptyDataTemplate>
                        <h3>Zarząd</h3>
                        <table class="table table-bordered">
                            <tr>
                                <th>ID</th>
                                <th>Imię</th>
                                <th>Nazwisko</th>
                                <th>Stanowisko</th>
                                <th>Kontakt</th>
                                <asp:LoginView runat="server" ViewStateMode="Disabled">
                                    <RoleGroups>
                                        <asp:RoleGroup Roles="Manager, Administrator">
                                            <ContentTemplate>
                                                <th></th>
                                                <th></th>
                                            </ContentTemplate>
                                        </asp:RoleGroup>
                                    </RoleGroups>
                                </asp:LoginView>
                            </tr>
                        </table>
                         <p style="margin-top: -15px; font-size: 12px;">Brak rekordów do wyświetlenia.</p>
                    </EmptyDataTemplate>
                    <EmptyItemTemplate>
                        <td />
                    </EmptyItemTemplate>
                    <ItemTemplate>
                        <tr>
                            <td><%# Eval("Id_pracownik")%></td>
                            <td><%# Eval("Imie_pracownik")%></td>
                            <td><%# Eval("Nazwisko_pracownik")%></td>
                            <td><%# Eval("Nazwa_stanowisko")%></td>
                            <td><%# Eval("Email")%></td>
                            <asp:LoginView runat="server" ViewStateMode="Disabled">
                                <RoleGroups>
                                    <asp:RoleGroup Roles="Manager, Administrator">
                                        <ContentTemplate>
                                            <td><a href="EditEmployee.aspx?ID=<%# Eval("Id_pracownik")%>">Edytuj</a></td>
                                            <td>
                                                <asp:LinkButton runat="server" OnClick="DeleteItem_Click" Text="Usuń" CommandArgument='<%# Eval("Id_pracownik")%>' /></td>
                                        </ContentTemplate>
                                    </asp:RoleGroup>
                                </RoleGroups>
                            </asp:LoginView>
                        </tr>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <h3>Zarząd</h3>
                        <table class="table table-bordered">
                            <tr>
                                <th>ID</th>
                                <th>Imię</th>
                                <th>Nazwisko</th>
                                <th>Stanowisko</th>
                                <th>Kontakt</th>
                                <asp:LoginView runat="server" ViewStateMode="Disabled">
                                    <RoleGroups>
                                        <asp:RoleGroup Roles="Manager, Administrator">
                                            <ContentTemplate>
                                                <th></th>
                                                <th></th>
                                            </ContentTemplate>
                                        </asp:RoleGroup>
                                    </RoleGroups>
                                </asp:LoginView>
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


          <div class="col-md-12">
            <div class="row" id="Storage">
                <asp:Label runat="server" ID="Label3"></asp:Label>
                <asp:ListView ID="StorageList" runat="server" DataKeyNames="Id_pracownik">
                    <EmptyDataTemplate>
                        <h3>Magazyn</h3>
                        <table class="table table-bordered">
                            <tr>
                                <th>ID</th>
                                <th>Imię</th>
                                <th>Nazwisko</th>
                                <th>Stanowisko</th>
                                <th>Kontakt</th>
                                <asp:LoginView runat="server" ViewStateMode="Disabled">
                                    <RoleGroups>
                                        <asp:RoleGroup Roles="Manager, Administrator">
                                            <ContentTemplate>
                                                <th></th>
                                                <th></th>
                                            </ContentTemplate>
                                        </asp:RoleGroup>
                                    </RoleGroups>
                                </asp:LoginView>
                            </tr>
                        </table>
                         <p style="margin-top: -15px; font-size: 12px;">Brak rekordów do wyświetlenia.</p>
                    </EmptyDataTemplate>
                    <EmptyItemTemplate>
                        <td />
                    </EmptyItemTemplate>
                    <ItemTemplate>
                        <tr>
                            <td><%# Eval("Id_pracownik")%></td>
                            <td><%# Eval("Imie_pracownik")%></td>
                            <td><%# Eval("Nazwisko_pracownik")%></td>
                            <td><%# Eval("Nazwa_stanowisko")%></td>
                            <td><%# Eval("Email")%></td>
                            <asp:LoginView runat="server" ViewStateMode="Disabled">
                                <RoleGroups>
                                    <asp:RoleGroup Roles="Manager, Administrator">
                                        <ContentTemplate>
                                            <td><a href="EditEmployee.aspx?ID=<%# Eval("Id_pracownik")%>">Edytuj</a></td>
                                            <td>
                                                <asp:LinkButton runat="server" OnClick="DeleteItem_Click" Text="Usuń" CommandArgument='<%# Eval("Id_pracownik")%>' /></td>
                                        </ContentTemplate>
                                    </asp:RoleGroup>
                                </RoleGroups>
                            </asp:LoginView>
                        </tr>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <h3>Magazyn</h3>
                        <table class="table table-bordered">
                            <tr>
                                <th>ID</th>
                                <th>Imię</th>
                                <th>Nazwisko</th>
                                <th>Stanowisko</th>
                                <th>Kontakt</th>
                                <asp:LoginView runat="server" ViewStateMode="Disabled">
                                    <RoleGroups>
                                        <asp:RoleGroup Roles="Manager, Administrator">
                                            <ContentTemplate>
                                                <th></th>
                                                <th></th>
                                            </ContentTemplate>
                                        </asp:RoleGroup>
                                    </RoleGroups>
                                </asp:LoginView>>
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


          <div class="col-md-12">
            <div class="row" id="Sale">
                <asp:Label runat="server" ID="Label4"></asp:Label>
                <asp:ListView ID="SaleList" runat="server" DataKeyNames="Id_pracownik">
                    <EmptyDataTemplate>
                        <h3>Sprzedaż</h3>
                        <table class="table table-bordered">
                            <tr>
                                <th>ID</th>
                                <th>Imię</th>
                                <th>Nazwisko</th>
                                <th>Stanowisko</th>
                                <th>Kontakt</th>
                                <asp:LoginView runat="server" ViewStateMode="Disabled">
                                    <RoleGroups>
                                        <asp:RoleGroup Roles="Manager, Administrator">
                                            <ContentTemplate>
                                                <th></th>
                                                <th></th>
                                            </ContentTemplate>
                                        </asp:RoleGroup>
                                    </RoleGroups>
                                </asp:LoginView>
                            </tr>
                        </table>
                         <p style="margin-top: -15px; font-size: 12px;">Brak rekordów do wyświetlenia.</p>
                    </EmptyDataTemplate>
                    <EmptyItemTemplate>
                        <td />
                    </EmptyItemTemplate>
                    <ItemTemplate>
                        <tr>
                            <td><%# Eval("Id_pracownik")%></td>
                            <td><%# Eval("Imie_pracownik")%></td>
                            <td><%# Eval("Nazwisko_pracownik")%></td>
                            <td><%# Eval("Nazwa_stanowisko")%></td>
                            <td><%# Eval("Email")%></td>
                            <asp:LoginView runat="server" ViewStateMode="Disabled">
                                <RoleGroups>
                                    <asp:RoleGroup Roles="Manager, Administrator">
                                        <ContentTemplate>
                                            <td><a href="EditEmployee.aspx?ID=<%# Eval("Id_pracownik")%>">Edytuj</a></td>
                                            <td>
                                                <asp:LinkButton runat="server" OnClick="DeleteItem_Click" Text="Usuń" CommandArgument='<%# Eval("Id_pracownik")%>' /></td>
                                        </ContentTemplate>
                                    </asp:RoleGroup>
                                </RoleGroups>
                            </asp:LoginView>
                        </tr>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <h3>Sprzedaż</h3>
                        <table class="table table-bordered">
                            <tr>
                                <th>ID</th>
                                <th>Imię</th>
                                <th>Nazwisko</th>
                                <th>Stanowisko</th>
                                <th>Kontakt</th>
                                <asp:LoginView runat="server" ViewStateMode="Disabled">
                                    <RoleGroups>
                                        <asp:RoleGroup Roles="Manager, Administrator">
                                            <ContentTemplate>
                                                <th></th>
                                                <th></th>
                                            </ContentTemplate>
                                        </asp:RoleGroup>
                                    </RoleGroups>
                                </asp:LoginView>
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


          <div class="col-md-12">
            <div class="row" id="Marketing">
                <asp:Label runat="server" ID="Label5"></asp:Label>
                <asp:ListView ID="MarketingList" runat="server" DataKeyNames="Id_pracownik">
                    <EmptyDataTemplate>
                        <h3>Marketing</h3>
                        <table class="table table-sm">
                            <tr>
                                <th>ID</th>
                                <th>Imię</th>
                                <th>Nazwisko</th>
                                <th>Stanowisko</th>
                                <th>Kontakt</th>
                                <asp:LoginView runat="server" ViewStateMode="Disabled">
                                    <RoleGroups>
                                        <asp:RoleGroup Roles="Manager, Administrator">
                                            <ContentTemplate>
                                                <th></th>
                                                <th></th>
                                            </ContentTemplate>
                                        </asp:RoleGroup>
                                    </RoleGroups>
                                </asp:LoginView>
                            </tr>
                        </table>
                         <p style="margin-top: -15px; font-size: 12px;">Brak rekordów do wyświetlenia.</p>
                    </EmptyDataTemplate>
                    <EmptyItemTemplate>
                        <td />
                    </EmptyItemTemplate>
                    <ItemTemplate>
                        <tr>
                            <td><%# Eval("Id_pracownik")%></td>
                            <td><%# Eval("Imie_pracownik")%></td>
                            <td><%# Eval("Nazwisko_pracownik")%></td>
                            <td><%# Eval("Nazwa_stanowisko")%></td>
                            <td><%# Eval("Email")%></td>
                            <asp:LoginView runat="server" ViewStateMode="Disabled">
                                <RoleGroups>
                                    <asp:RoleGroup Roles="Manager, Administrator">
                                        <ContentTemplate>
                                            <td><a href="EditEmployee.aspx?ID=<%# Eval("Id_pracownik")%>">Edytuj</a></td>
                                            <td>
                                                <asp:LinkButton runat="server" OnClick="DeleteItem_Click" Text="Usuń" CommandArgument='<%# Eval("Id_pracownik")%>' /></td>
                                        </ContentTemplate>
                                    </asp:RoleGroup>
                                </RoleGroups>
                            </asp:LoginView>
                        </tr>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <h3>Marketing</h3>
                        <table class="table table-bordered">
                            <tr>
                                <th>ID</th>
                                <th>Imię</th>
                                <th>Nazwisko</th>
                                <th>Stanowisko</th>
                                <th>Kontakt</th>
                                <asp:LoginView runat="server" ViewStateMode="Disabled">
                                    <RoleGroups>
                                        <asp:RoleGroup Roles="Manager, Administrator">
                                            <ContentTemplate>
                                                <th></th>
                                                <th></th>
                                            </ContentTemplate>
                                        </asp:RoleGroup>
                                    </RoleGroups>
                                </asp:LoginView>
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


          <div class="col-md-12">
            <div class="row" id="Transport">
                <asp:Label runat="server" ID="Label6"></asp:Label>
                <asp:ListView ID="TransportList" runat="server" DataKeyNames="Id_pracownik">
                    <EmptyDataTemplate>
                        <h3>Transport</h3>
                        <table class="table table-bordered">
                            <tr>
                                <th>ID</th>
                                <th>Imię</th>
                                <th>Nazwisko</th>
                                <th>Stanowisko</th>
                                <th>Kontakt</th>
                                <asp:LoginView runat="server" ViewStateMode="Disabled">
                                    <RoleGroups>
                                        <asp:RoleGroup Roles="Manager, Administrator">
                                            <ContentTemplate>
                                                <th></th>
                                                <th></th>
                                            </ContentTemplate>
                                        </asp:RoleGroup>
                                    </RoleGroups>
                                </asp:LoginView>
                            </tr>
                        </table>
                         <p style="margin-top: -15px; font-size: 12px;">Brak rekordów do wyświetlenia.</p>
                    </EmptyDataTemplate>
                    <EmptyItemTemplate>
                        <td />
                    </EmptyItemTemplate>
                    <ItemTemplate>
                        <tr>
                            <td><%# Eval("Id_pracownik")%></td>
                            <td><%# Eval("Imie_pracownik")%></td>
                            <td><%# Eval("Nazwisko_pracownik")%></td>
                            <td><%# Eval("Nazwa_stanowisko")%></td>
                            <td><%# Eval("Email")%></td>
                            <asp:LoginView runat="server" ViewStateMode="Disabled">
                                <RoleGroups>
                                    <asp:RoleGroup Roles="Manager, Administrator">
                                        <ContentTemplate>
                                            <td><a href="EditEmployee.aspx?ID=<%# Eval("Id_pracownik")%>">Edytuj</a></td>
                                            <td>
                                                <asp:LinkButton runat="server" OnClick="DeleteItem_Click" Text="Usuń" CommandArgument='<%# Eval("Id_pracownik")%>' /></td>
                                        </ContentTemplate>
                                    </asp:RoleGroup>
                                </RoleGroups>
                            </asp:LoginView>
                        </tr>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <h3>Transport</h3>
                        <table class="table table-bordered">
                            <tr>
                                <th>ID</th>
                                <th>Imię</th>
                                <th>Nazwisko</th>
                                <th>Stanowisko</th>
                                <th>Kontakt</th>
                                <asp:LoginView runat="server" ViewStateMode="Disabled">
                                    <RoleGroups>
                                        <asp:RoleGroup Roles="Manager, Administrator">
                                            <ContentTemplate>
                                                <th></th>
                                                <th></th>
                                            </ContentTemplate>
                                        </asp:RoleGroup>
                                    </RoleGroups>
                                </asp:LoginView>
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

          <div class="col-md-12">
            <div class="row" id="IT">
                <asp:Label runat="server" ID="Label7"></asp:Label>
                <asp:ListView ID="ITList" runat="server" DataKeyNames="Id_pracownik">
                    <EmptyDataTemplate>
                        <h3>IT</h3>
                        <table class="table table-bordered">
                            <tr>
                                <th>ID</th>
                                <th>Imię</th>
                                <th>Nazwisko</th>
                                <th>Stanowisko</th>
                                <th>Kontakt</th>
                                <asp:LoginView runat="server" ViewStateMode="Disabled">
                                    <RoleGroups>
                                        <asp:RoleGroup Roles="Manager, Administrator">
                                            <ContentTemplate>
                                                <th></th>
                                                <th></th>
                                            </ContentTemplate>
                                        </asp:RoleGroup>
                                    </RoleGroups>
                                </asp:LoginView>
                            </tr>
                        </table>
                         <p style="margin-top: -15px; font-size: 12px;">Brak rekordów do wyświetlenia.</p>
                    </EmptyDataTemplate>
                    <EmptyItemTemplate>
                        <td />
                    </EmptyItemTemplate>
                    <ItemTemplate>
                        <tr>
                            <td><%# Eval("Id_pracownik")%></td>
                            <td><%# Eval("Imie_pracownik")%></td>
                            <td><%# Eval("Nazwisko_pracownik")%></td>
                            <td><%# Eval("Nazwa_stanowisko")%></td>
                            <td><%# Eval("Email")%></td>
                            <asp:LoginView runat="server" ViewStateMode="Disabled">
                                <RoleGroups>
                                    <asp:RoleGroup Roles="Manager, Administrator">
                                        <ContentTemplate>
                                            <td><a href="EditEmployee.aspx?ID=<%# Eval("Id_pracownik")%>">Edytuj</a></td>
                                            <td>
                                                <asp:LinkButton runat="server" OnClick="DeleteItem_Click" Text="Usuń" CommandArgument='<%# Eval("Id_pracownik")%>' /></td>
                                        </ContentTemplate>
                                    </asp:RoleGroup>
                                </RoleGroups>
                            </asp:LoginView>
                        </tr>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <h3>IT</h3>
                        <table class="table table-bordered">
                            <tr>
                                <th>ID</th>
                                <th>Imię</th>
                                <th>Nazwisko</th>
                                <th>Stanowisko</th>
                                <th>Kontakt</th>
                                <asp:LoginView runat="server" ViewStateMode="Disabled">
                                    <RoleGroups>
                                        <asp:RoleGroup Roles="Manager, Administrator">
                                            <ContentTemplate>
                                                <th></th>
                                                <th></th>
                                            </ContentTemplate>
                                        </asp:RoleGroup>
                                    </RoleGroups>
                                </asp:LoginView>
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

          <div class="col-md-12">
            <div class="row" id="Other">
                <asp:Label runat="server" ID="Label8"></asp:Label>
                <asp:ListView ID="OtherList" runat="server" DataKeyNames="Id_pracownik">
                    <EmptyDataTemplate>
                        <h3>Inne</h3>
                        <table class="table table-bordered">
                            <tr>
                                <th>ID</th>
                                <th>Imię</th>
                                <th>Nazwisko</th>
                                <th>Stanowisko</th>
                                <th>Kontakt</th>
                                <asp:LoginView runat="server" ViewStateMode="Disabled">
                                    <RoleGroups>
                                        <asp:RoleGroup Roles="Manager, Administrator">
                                            <ContentTemplate>
                                                <th></th>
                                                <th></th>
                                            </ContentTemplate>
                                        </asp:RoleGroup>
                                    </RoleGroups>
                                </asp:LoginView>
                            </tr>
                        </table>
                         <p style="margin-top: -15px; font-size: 12px;">Brak rekordów do wyświetlenia.</p>
                    </EmptyDataTemplate>
                    <EmptyItemTemplate>
                        <td />
                    </EmptyItemTemplate>
                    <ItemTemplate>
                        <tr>
                            <td><%# Eval("Id_pracownik")%></td>
                            <td><%# Eval("Imie_pracownik")%></td>
                            <td><%# Eval("Nazwisko_pracownik")%></td>
                            <td><%# Eval("Nazwa_stanowisko")%></td>
                            <td><%# Eval("Email")%></td>
                            <asp:LoginView runat="server" ViewStateMode="Disabled">
                                <RoleGroups>
                                    <asp:RoleGroup Roles="Manager, Administrator">
                                        <ContentTemplate>
                                            <td><a href="EditEmployee.aspx?ID=<%# Eval("Id_pracownik")%>">Edytuj</a></td>
                                            <td>
                                                <asp:LinkButton runat="server" OnClick="DeleteItem_Click" Text="Usuń" CommandArgument='<%# Eval("Id_pracownik")%>' /></td>
                                        </ContentTemplate>
                                    </asp:RoleGroup>
                                </RoleGroups>
                            </asp:LoginView>
                        </tr>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <h3>Inne</h3>
                        <table class="table table-bordered">
                            <tr>
                                <th>ID</th>
                                <th>Imię</th>
                                <th>Nazwisko</th>
                                <th>Stanowisko</th>
                                <th>Kontakt</th>
                                <asp:LoginView runat="server" ViewStateMode="Disabled">
                                    <RoleGroups>
                                        <asp:RoleGroup Roles="Manager, Administrator">
                                            <ContentTemplate>
                                                <th></th>
                                                <th></th>
                                            </ContentTemplate>
                                        </asp:RoleGroup>
                                    </RoleGroups>
                                </asp:LoginView>

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





</asp:Content>
