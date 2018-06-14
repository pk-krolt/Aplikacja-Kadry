<%@ Page Title="Zatrudnienie" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Employment.aspx.cs" Inherits="SZRBD.Kadry.Applications.Employment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
        <div class="col-md-9">
            <h3 class="about-header">Nadesłane wnioski kandydatów</h3>
             <hr />
        </div>
    </div>
 
    <div class="col-md-12">
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
                            </table>
                    </LayoutTemplate>
                </asp:ListView>
        </div>
        </div>

</asp:Content>
