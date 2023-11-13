<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="ApplicationStatus.aspx.cs" Inherits="ApplicationStatus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">

        <div class="row justify-content-center mt-lg-5">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header font-weight-bold bg-primary text-light">
                        <center>Login</center>
                    </div>
                    <div class="card-body">

                        <table width="100%" class="table table-borderless">
                            <tbody>
                               
                                <tr>
                                    <td width="40%">
                                        <label for="txtID">Enter Your Application ID : </label>
                                    </td>
                                    <td width="60%">
                                        <asp:TextBox ID="txtID"  runat="server" CssClass="" Width="100%"></asp:TextBox>

                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="text-align: center;">
                                        <asp:Button ID="btnLogin" Text="Login" CssClass="btn btn-primary" runat="server" Width="48%" OnClick="btnLogin_Click" />

                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:GridView ID="gvAppStatus" CssClass="table table-bordered" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White" 
                                            runat="server" AutoGenerateColumns="False" AllowSorting="True">
                                            <Columns>
                                                <asp:BoundField DataField="fid" HeaderText="ID" ItemStyle-Width="10">
                                                    <ItemStyle Width="10px"></ItemStyle>
                                                </asp:BoundField>
                                                <asp:BoundField DataField="status" HeaderText="Status" ItemStyle-Width="150">
                                                    <ItemStyle Width="150px"></ItemStyle>
                                                </asp:BoundField>
                                                <asp:BoundField DataField="updated_on" HeaderText="Updated On" ItemStyle-Width="150">
                                                    <ItemStyle Width="150px"></ItemStyle>
                                                </asp:BoundField>
                                            </Columns>

                                            <HeaderStyle BackColor="#3AC0F2" ForeColor="White"></HeaderStyle>
                                        </asp:GridView>
                                    </td>
                                </tr>
                            </tbody>
                        </table>

                    </div>
                </div>

            </div>
        </div>
    </div>
</asp:Content>

