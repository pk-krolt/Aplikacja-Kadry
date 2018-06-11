<%@ Page Title="Praca" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Adverts.aspx.cs" Inherits="SZRBD.Kadry.Adverts" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
  <div class="row" style="margin-bottom: 20px;">
    <div class="col-md-6">
            <h3 class="about-header">Oferty pracy</h3>
    </div>
    <div class="col-md-6 text-right" style="margin-top: 38px;">
        <asp:LoginView runat="server" ViewStateMode="Disabled">
            <RoleGroups>
                <asp:RoleGroup Roles="Manager, Administrator">
                    <ContentTemplate>
                            <a href="#" class="btn btn-link btn-xs">Wszystkie</a>
                            <a href="#" class="btn btn-link btn-xs">Aktywne</a>
                            <a href="#" class="btn btn-link btn-xs">Nieaktywne</a>
                            <a href="#" class="btn btn-link btn-xs">Zakończone</a>
                            <a href="AddAdvert.aspx" class="btn btn-info">Dodaj ogłoszenie</a>
                    </ContentTemplate>
                </asp:RoleGroup>
            </RoleGroups>
        </asp:LoginView>
    </div>
   </div>


     <div class="row">
                <asp:Label runat="server" ID="ErrorMessage" ></asp:Label>
                <asp:ListView ID="advertsList" runat="server" DataKeyNames="Id_ogloszenie">
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
                            <td><%# Eval("Id_ogloszenie")%></td>
                            <td><%# Eval("Nazwa_ogloszenie")%></td>
                            <td><%# Eval("Dzial")%></td>
                            <td><%# Eval("Data_poczatek")%></td>
                            <td><a href="Advert.aspx?ID=<%# Eval("Id_ogloszenie")%>">Zobacz</a></td>
                            <asp:LoginView runat="server" ViewStateMode="Disabled">
                                <RoleGroups>
                                    <asp:RoleGroup Roles="Manager, Administrator">
                                        <ContentTemplate>
                                            <td><a href="EditAdvert.aspx?ID=<%# Eval("Id_ogloszenie")%>">Edytuj</a></td>
                                            <td>
                                                <asp:LinkButton runat="server" OnClick="DeleteItem_Click" Text="Usuń" CommandArgument='<%# Eval("Id_ogloszenie")%>' /></td>
                                        </ContentTemplate>
                                    </asp:RoleGroup>
                                </RoleGroups>
                            </asp:LoginView>

                        </tr>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <table class="table table-hover">
                            <tr>
                                <th>ID</th>
                                <th>Nazwa</th>
                                <th>Dział</th>
                                <th>Data dodania</th>
                                <th></th>
                                <th></th>
                                <th></th>
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
</asp:Content>
