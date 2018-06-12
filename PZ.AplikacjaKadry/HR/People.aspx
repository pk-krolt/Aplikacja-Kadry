<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="People.aspx.cs" Inherits="SZRBD.Kadry.HR.People" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">



    <div class="row">
        <div class="col-md-12">
            <h3 class="about-header">Pracownicy</h3>
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
                                <li class="list-group-item active"><a style="color: white !important;" href="Departments.aspx">Zarządzaj kadrą</a></li>
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
                <li class="list-group-item"><a href="Departments.aspx">Działy</a></li>
                <li class="list-group-item active"><a style="color: white !important;" href="People.aspx">Pracownicy</a></li>
            </ul>
        </div>
    </div>


    <div class="col-md-9">
        <div class="row">
                <asp:Label runat="server" ID="ErrorMessage" ></asp:Label>
                <asp:ListView ID="positionsList" runat="server" DataKeyNames="Id_pracownik">
                    <EmptyDataTemplate>
                        <table>
                            <tr>
                                <td>Brak rekordów do wyświetlenia.</td>
                            </tr>
                        </table>
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
                            <td><%# Eval("Dzial")%></td>
                            <td><%# Eval("Data_urodzenia")%></td>
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
                        <table class="table table-bordered">
                            <tr>
                                <th>ID</th>
                                <th>Imię</th>
                                <th>Nazwisko</th>
                                <th>Stanowisko</th>
                                <th>Dział</th>
                                <th>Data urodzenia</th>
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
                            <tr id="Tr2" runat="server">
                                <td id="Td6" runat="server" class="text-center" colspan="8">
                                    <asp:DataPager ID="DataPager1" runat="server">
                                        <Fields>
                                            <asp:NextPreviousPagerField ButtonType="Link" />
                                            <asp:NumericPagerField />
                                        </Fields>
                                    </asp:DataPager>
                                </td>
                            </tr>
                            </table>
                    </LayoutTemplate>
                </asp:ListView>
        </div>

    </div>

</asp:Content>
