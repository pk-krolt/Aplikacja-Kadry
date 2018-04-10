<%@ Page Title="Zatrudnienie" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Employment.aspx.cs" Inherits="SZRBD.Kadry.Applications.Employment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
        <div class="col-md-9">
            <h3 class="about-header">Wnioski o zatrudnienie</h3>
             <hr />
        </div>
    </div>
 
    <div class="col-md-9">
          <div class="row">
                <asp:Label runat="server" ID="ErrorMessage" ></asp:Label>
                <asp:ListView ID="applicationList" runat="server" DataKeyNames="Id_aplikacja">
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
                            <td><%# Eval("Id_aplikacja")%></td>
                            <td><%# Eval("Nazwa_ogloszenie")%></td>
                            <td><%# Eval("Imie_aplikant")%></td>
                            <td><%# Eval("Nazwisko_aplikant")%></td>
                            <td><%# Eval("Data_wniosku")%></td>
                            <td><a href="DispEmplRequest.aspx?ID=<%# Eval("Id_aplikacja")%>">Wyświetl</a></td>
                        </tr>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <table class="table table-bordered">
                            <tr>
                                <th>ID</th>
                                <th>Nazwa ogłoszenia</th>
                                <th>Imię</th>
                                <th>Nazwisko</th>
                                <th>Data wniosku</th>
                                <th></th>
                            </tr>
                            <tr>
                                <tr id="ItemPlaceholder" runat="server">
                                </tr>
                            </tr>
                            <tr id="Tr2" runat="server">
                                <td id="Td6" runat="server" class="text-center" colspan="7">
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

    <div class="col-md-3 nav-fixed-right">
        <div class="row">
            <asp:LoginView runat="server" ViewStateMode="Disabled">
                <RoleGroups>
                    <asp:RoleGroup Roles="Manager, Administrator">
                        <ContentTemplate>
                            <h4>Zarządzaj wnioskami</h4>
                            <ul class="list-group">
                                <li class="list-group-item"><a href="Holidays.aspx">Urlopy</a></li>
                                <li class="list-group-item active"><a style="color: white !important" href="Employment.aspx">Zatrudnienie</a></li>
                            </ul>
                        </ContentTemplate>
                    </asp:RoleGroup>
                </RoleGroups>
            </asp:LoginView>
        </div>
    </div>



</asp:Content>
