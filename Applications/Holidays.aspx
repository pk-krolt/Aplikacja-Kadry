<%@ Page Title="Urlopy" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Holidays.aspx.cs" Inherits="SZRBD.Kadry.Applications.Holidays" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

   

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
