<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Positions.aspx.cs" Inherits="SZRBD.Kadry.HR.Positions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">



    <div class="row">
        <div class="col-md-9">
            <h3 class="about-header">Stanowiska</h3>
            <hr />
        </div>
    </div>
    <div class="col-md-9">
        <div class="row">
                <asp:Label runat="server" ID="ErrorMessage" ></asp:Label>
                <asp:ListView ID="positionsList" runat="server" DataKeyNames="Id_stanowisko">
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
                            <td><%# Eval("Id_stanowisko")%></td>
                            <td><%# Eval("Nazwa_stanowisko")%></td>
                            <td><%# Eval("Dzial")%></td>
                            <td><a href="EditPosition.aspx?ID=<%# Eval("Id_stanowisko")%>">Edytuj</a></td>
                            <td><asp:LinkButton runat="server" OnClick="DeleteItem_Click" Text="Usuń" CommandArgument='<%# Eval("Id_stanowisko")%>' /></td>
                        </tr>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <table class="table table-bordered">
                            <tr>
                                <th>ID</th>
                                <th>Nazwa</th>
                                <th>Dział</th>
                                <th></th>
                                <th></th>
                            </tr>
                            <tr>
                                <tr id="ItemPlaceholder" runat="server">
                                </tr>
                            </tr>
                            <tr id="Tr2" runat="server">
                                <td id="Td6" runat="server" class="text-center" colspan="5">
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

    <div class="col-md-3 nav-fixed-right">
        <div class="row">
            <asp:LoginView runat="server" ViewStateMode="Disabled">
                <RoleGroups>
                    <asp:RoleGroup Roles="Manager, Administrator">
                        <ContentTemplate>
                            <h4>Zarządzaj</h4>
                            <ul class="list-group">
                                <li class="list-group-item"><a href="AddPosition.aspx">Dodaj stanowisko</a></li>
                                <li class="list-group-item"><a href="AddEmployee.aspx">Dodaj pracownika</a></li>
                                <li class="list-group-item active"><a style="color: white !important;" href="Positions.aspx">Zarządzaj stanowiskami</a></li>
                                <li class="list-group-item"><a href="Departments.aspx">Kadra pracownicza</a></li>
                            </ul>
                        </ContentTemplate>
                    </asp:RoleGroup>
                </RoleGroups>
            </asp:LoginView>
        </div>
    </div>



</asp:Content>
