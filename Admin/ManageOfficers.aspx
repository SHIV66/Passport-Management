<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="ManageOfficers.aspx.cs" Inherits="Admin_ManageOfficers" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container ">
        <div class="card w-100">
            <div class="card-body">
                <div class="row">

                    <div class="col-md-3">
                        <div class="card">
                            <div class="card-header bg-primary text-light">
                                Admin Dashboard
                            </div>
                            <div class="card-body p-0 ">
                                <div id="list-example" class="list-group">
                                    <a class="list-group-item list-group-item-action" href="/Admin/Admin.aspx">Admin Panel</a>
                                    <a class="list-group-item list-group-item-action" href="/Admin/ManageOfficers.aspx">Manage Officers</a>
                                    <a class="list-group-item list-group-item-action" href="/Admin/ModifyDocumentAdvisors.aspx">Modify Document Advisor</a>
                                    <a class="list-group-item list-group-item-action" href="/Admin/ModifyFees.aspx">Modify Fees</a>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="col-md-9">
                        <div class="card">
                            <div class="card-header">
                                <h2 class="display-7">Add or Remove Officers
                                </h2>
                            </div>
                            <div class="card-body">
                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                    <ContentTemplate>
                                        <table class="table table-borderless">
                                            <tr>
                                                <td>Firstname </td>
                                                <td>
                                                    <asp:TextBox ID="txtFname" CssClass="form-control form-control-sm" runat="server"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="rvFirstname" Display="Dynamic" ForeColor="Red" Font-Bold="true" runat="server" ErrorMessage="Enter Firstname" ControlToValidate="txtFname"></asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="valFirstname" runat="server" Display="Dynamic" ForeColor="Red" Font-Bold="true" ErrorMessage="Invalid Fisrt Name (Number and symbols are not allowed)" ControlToValidate="txtFname" ValidationExpression="^[a-zA-Z]+$"></asp:RegularExpressionValidator>
                                                </td>
                                                <td>Lastname </td>
                                                <td>
                                                    <asp:TextBox ID="txtLname" CssClass="form-control form-control-sm" runat="server"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="Dynamic" ForeColor="Red" Font-Bold="true" runat="server" ErrorMessage="Enter Firstname" ControlToValidate="txtLname"></asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" Display="Dynamic" ForeColor="Red" Font-Bold="true" ErrorMessage="Invalid Last Name (Number and symbols are not allowed)" ControlToValidate="txtLname" ValidationExpression="^[a-zA-Z]+$"></asp:RegularExpressionValidator>
                                                </td>
                                                <td>Email </td>
                                                <td>
                                                    <asp:TextBox ID="txtEmail" CssClass="form-control form-control-sm" runat="server"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" Display="Dynamic" ForeColor="Red" Font-Bold="true" runat="server" ErrorMessage="Enter Email" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="valEmail" runat="server" Display="Dynamic" ForeColor="Red" Font-Bold="true" ErrorMessage="Invalid Email" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Username</td>
                                                <td>
                                                    <asp:TextBox ID="txtUsername" CssClass="form-control form-control-sm" runat="server" AutoPostBack="true" OnTextChanged="txtUsername_TextChanged"></asp:TextBox>
                                                    <asp:Label ID="lblUsername" runat="server" Text="" Font-Bold="true" Font-Italic="true" Visible="false"></asp:Label>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Display="Dynamic" ForeColor="Red" Font-Bold="true" runat="server" ErrorMessage="Enter Username" ControlToValidate="txtUsername"></asp:RequiredFieldValidator>
                                                    <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="Username already exist" Font-Bold="true" ForeColor="Red" ControlToValidate="txtUsername" OnServerValidate="CustomValidator1_ServerValidate"></asp:CustomValidator>

                                                </td>
                                                <td>Password </td>
                                                <td>
                                                    <asp:TextBox ID="txtPassword" TextMode="Password" CssClass="form-control form-control-sm" runat="server"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="rvPassword" Display="Dynamic" ForeColor="Red" Font-Bold="true" runat="server" ErrorMessage="Enter Password" ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="valPassword" runat="server" Display="Dynamic" ForeColor="Red" Font-Bold="true" ErrorMessage="Password must contain - Minimum 8 characters atleast 1 Alphabet, 1 Number and 1 Special Character" ControlToValidate="txtPassword" ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$"></asp:RegularExpressionValidator>
                                                </td>
                                                <td>Select Level </td>
                                                <td>
                                                    <asp:DropDownList ID="ddLevel" CssClass="form-control  form-control-sm" runat="server">
                                                        <asp:ListItem Value="1">1</asp:ListItem>
                                                        <asp:ListItem Value="2">2</asp:ListItem>
                                                        <asp:ListItem Value="3">3</asp:ListItem>
                                                        <asp:ListItem Value="4">4</asp:ListItem>
                                                    </asp:DropDownList>

                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="6">
                                                    <asp:Button ID="btnRegister" CssClass="btn btn-primary btn-sm w-100" runat="server" Text="Add New Officer" OnClick="btnRegister_Click" />
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                                <hr />
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        <asp:GridView ID="gvOfficerList" CssClass="table table-bordered" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White" OnRowCommand="gvOfficerList_RowCommand" OnRowDataBound="gvOfficerList_RowDataBound"
                                            runat="server" AutoGenerateColumns="False" AllowSorting="True">
                                            <Columns>
                                                <asp:BoundField DataField="oid" HeaderText="ID" ItemStyle-Width="10">
                                                    <ItemStyle Width="10px"></ItemStyle>
                                                </asp:BoundField>
                                                <asp:BoundField DataField="name" HeaderText="Name" ItemStyle-Width="150">
                                                    <ItemStyle Width="150px"></ItemStyle>
                                                </asp:BoundField>
                                                <asp:BoundField DataField="uname" HeaderText="Username" ItemStyle-Width="150">
                                                    <ItemStyle Width="150px"></ItemStyle>
                                                </asp:BoundField>
                                                <asp:BoundField DataField="lvl" HeaderText="Lvl" ItemStyle-Width="30">
                                                    <ItemStyle Width="30px"></ItemStyle>
                                                </asp:BoundField>
                                                <asp:BoundField DataField="ufrom" HeaderText="Created on" ItemStyle-Width="150">
                                                    <ItemStyle Width="150px"></ItemStyle>
                                                </asp:BoundField>
                                                <asp:TemplateField HeaderText="Action">

                                                    <ItemTemplate>
                                                        <asp:HiddenField ID="HiddenField1" Value='<%# Eval("hoid") %>' runat="server" />
                                                        <asp:HiddenField ID="HiddenField2" Value='<%# Eval("status") %>' runat="server" />
                                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" CommandName="disable" CommandArgument='<%#Eval("huid")%>'>Disable</asp:LinkButton>
                                                    </ItemTemplate>
                                                    <ItemStyle Width="150px" />
                                                </asp:TemplateField>
                                            </Columns>

                                            <HeaderStyle BackColor="#3AC0F2" ForeColor="White"></HeaderStyle>
                                        </asp:GridView>

                                    </ContentTemplate>
                                </asp:UpdatePanel>

                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>

    </div>
</asp:Content>

