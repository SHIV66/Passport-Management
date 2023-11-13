<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="BotDetect" Namespace="BotDetect.Web.UI" TagPrefix="BotDetect" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <div class="container">

        <div class="card">

            <div class="card-body">

                <div class="jumbotron">
                    <h1>New User Registration</h1>
                    <p>Fields marked with asterisk (*) are mandatory</p>
                    <p>Important Information: Passport application can be processed at any PSK/POPSK/PSLK WITHIN INDIA irrespective of your residential address.</p>
                </div>

                <table class="table">

                    <tbody>
                        <tr>
                            <td width="40%">
                                <label for="txtFirstname">First Name</label></td>
                            <td width="60%">
                                <asp:TextBox ID="txtFirstname" runat="server" CssClass="form-control"></asp:TextBox>
                                <small class="form-text text-muted">First Name</small>
                                <asp:RequiredFieldValidator ID="rvFirstname" Display="Dynamic" ForeColor="Red" Font-Bold="true" runat="server" ErrorMessage="Enter Firstname" ControlToValidate="txtFirstname"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="valFirstname" runat="server" Display="Dynamic" ForeColor="Red" Font-Bold="true" ErrorMessage="Invalid Fisrt Name (Number and symbols are not allowed)" ControlToValidate="txtFirstname" ValidationExpression="^[a-zA-Z]+$"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="txtLastname">Surname</label></td>
                            <td>
                                <asp:TextBox ID="txtLastname" runat="server" CssClass="form-control"></asp:TextBox>
                                <small class="form-text text-muted">Surname</small>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="Dynamic" ForeColor="Red" Font-Bold="true" runat="server" ErrorMessage="Enter Lastname" ControlToValidate="txtLastname"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="valLastname" runat="server" Display="Dynamic" ForeColor="Red" Font-Bold="true" ErrorMessage="Invalid Last Name (Number and symbols are not allowed)" ControlToValidate="txtLastname" ValidationExpression="^[a-zA-Z]+$"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="txtEmail">Email Address</label></td>
                            <td>
                                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                                <small class="form-text text-muted">Valid Email Address</small>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" Display="Dynamic" ForeColor="Red" Font-Bold="true" runat="server" ErrorMessage="Enter Email" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="valEmail" runat="server" Display="Dynamic" ForeColor="Red" Font-Bold="true" ErrorMessage="Invalid Email" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <label for="txtUsername">Username</label></td>
                            <td>

                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                    <ContentTemplate>
                                        <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" AutoPostBack="true" OnTextChanged="txtUsername_TextChanged"></asp:TextBox>
                                        <asp:Label ID="lblUsername" runat="server" Text="" Font-Bold="true" Font-Italic="true" Visible="false"></asp:Label>
                                        <small class="form-text text-muted">Enter Username</small>
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Display="Dynamic" ForeColor="Red" Font-Bold="true" runat="server" ErrorMessage="Enter Username" ControlToValidate="txtUsername"></asp:RequiredFieldValidator>
                                        <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="Username already exist" Font-Bold="true" ForeColor="Red" ControlToValidate="txtUsername" OnServerValidate="CustomValidator1_ServerValidate"></asp:CustomValidator>
                                    </ContentTemplate>
                                </asp:UpdatePanel>


                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="txtPassword">Password</label></td>
                            <td>
                                <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" CssClass="form-control-sm"></asp:TextBox>
                                <br />
                                <ajaxToolkit:PasswordStrength ID="PasswordStrength1" runat="server" TargetControlID="txtPassword" MinimumLowerCaseCharacters="2" MinimumNumericCharacters="2" MinimumSymbolCharacters="2" MinimumUpperCaseCharacters="2" PreferredPasswordLength="10" />
                                <small class="form-text text-muted">The password must contain one digit (0-9), one lowercase (a-z) or uppercase (A-Z) character. It can contain minimum 8 characters. </small>
                                
                                <asp:RequiredFieldValidator ID="rvPassword" Display="Dynamic" ForeColor="Red" Font-Bold="true" runat="server" ErrorMessage="Enter Password" ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="valPassword" runat="server" Display="Dynamic" ForeColor="Red" Font-Bold="true" ErrorMessage="Password must contain - Minimum 8 characters atleast 1 Alphabet, 1 Number and 1 Special Character" ControlToValidate="txtPassword" ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$"></asp:RegularExpressionValidator>
                            </td>

                        </tr>
                        <tr>
                            <td>
                                <label for="txtCpassword">Confirm Password</label></td>
                            <td>
                                <asp:TextBox ID="txtCpassword" TextMode="Password" runat="server" CssClass="form-control-sm"></asp:TextBox>
                                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Passwords do not match" Font-Bold="True" Font-Italic="True" ControlToCompare="txtPassword" ControlToValidate="txtCpassword" CssClass="alert alert-danger"></asp:CompareValidator>
                                <small class="form-text text-muted">Confirm Password</small>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="captcha">Enter Captcha</label></td>
                            <td>
                                <asp:TextBox ID="txtCaptcha" runat="server" CssClass="form-control-sm"></asp:TextBox>
                                <small class="form-text text-muted">Enter Captcha</small>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" Display="Dynamic" ForeColor="Red" Font-Bold="true" runat="server" ErrorMessage="Enter Captcha" ControlToValidate="txtCaptcha"></asp:RequiredFieldValidator>
                                <br />
                                <BotDetect:WebFormsCaptcha ID="captchaBox" runat="server" />
                                <asp:Label ID="Label1" runat="server" ForeColor="Red" Text=""></asp:Label></td>
                        </tr>


                    </tbody>
                </table>


                <table class="w-100">
                    <tr>
                        <td class="text-right">
                            <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn btn-primary" OnClick="btnRegister_Click" />
                        </td>
                    </tr>
                </table>
                <%--<div class="form-group">
                        <label for="TextBox1">Demo</label>
                        <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control-sm"></asp:TextBox>
                        <small id="helpId" class="form-text text-muted">Help text</small>
                    </div>--%>
            </div>
        </div>


    </div>

</asp:Content>

