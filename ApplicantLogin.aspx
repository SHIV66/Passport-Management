<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="ApplicantLogin.aspx.cs" Inherits="ApplicantLogin" %>

<%@ Register Assembly="BotDetect" Namespace="BotDetect.Web.UI" TagPrefix="BotDetect" %>
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
                                        <label for="txtUsername">Username</label>
                                    </td>
                                    <td width="60%">
                                        <asp:TextBox ID="txtUsername" runat="server" CssClass="" Width="100%"></asp:TextBox>

                                    </td>
                                </tr>
                                <tr>
                                    <td width="40%">
                                        <label for="txtUsername">Password</label>
                                    </td>
                                    <td width="60%">
                                        <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" CssClass="" Width="100%"></asp:TextBox>

                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label for="captcha">Enter Captcha</label></td>
                                    <td>
                                        <asp:TextBox ID="txtCaptcha" runat="server" CssClass="form-control-sm"></asp:TextBox>
                                        <br />
                                        <br />
                                        <BotDetect:WebFormsCaptcha ID="captchaBox" runat="server" />
                                        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                                        <small class="form-text text-muted">Enter Captcha</small></td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="text-align: center;">
                                        <asp:Button ID="btnLogin" Text="Login" CssClass="btn btn-primary" runat="server" Width="48%" OnClick="btnLogin_Click" />
                                        <a href="Register.aspx" class="btn btn-warning w-50">Register</a>
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

