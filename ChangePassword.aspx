<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
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
                                        <label for="txtOldPassword">Old Password</label>
                                    </td>
                                    <td width="60%">
                                        <asp:TextBox ID="txtOldPassword" TextMode="Password" runat="server" CssClass="" Width="100%" ></asp:TextBox>
                                        <asp:CustomValidator ID="CustomValidator1" runat="server" ForeColor="Red" ErrorMessage="Wrong Password" OnServerValidate="CustomValidator1_ServerValidate"></asp:CustomValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="40%">
                                        <label for="txtNewPassword">Password</label>
                                    </td>
                                    <td width="60%">
                                        <asp:TextBox ID="txtNewPassword" TextMode="Password" runat="server" CssClass="" Width="100%"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfPassword" runat="server" ErrorMessage="Enter New Password" ForeColor="Red" ControlToValidate="txtNewPassword"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="40%">
                                        <label for="txtRePassword">Password</label>
                                    </td>
                                    <td width="60%">
                                        <asp:TextBox ID="txtRePassword" TextMode="Password" runat="server" CssClass="" Width="100%"></asp:TextBox>
                                        <asp:CompareValidator ID="CompareValidator1" runat="server" ForeColor="Red" ErrorMessage="Passwords do not match" ControlToCompare="txtNewPassword" ControlToValidate="txtRePassword"></asp:CompareValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="text-align: center;">
                                        <asp:Button ID="btnChangePassword" Text="Change Password" CssClass="btn btn-primary" runat="server" Width="48%" OnClick="btnChangePassword_Click" />
                                        
                                        <br />
                                        <asp:Label ID="test" runat="server" Text=""></asp:Label>
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

