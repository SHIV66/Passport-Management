<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="PassportType.aspx.cs" Inherits="Applicant_PassportType" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container ">
        <div class="card w-100">
            <div class="card-body">
                <div class="row">
                    <div class="col-md-4">
                        <div class="card">
                            <div class="card-header bg-primary text-light">
                                Information Corner
                            </div>
                            <div class="card-body p-0 ">
                                <div id="list-example" class="list-group">
                                    <div class="list-group-item list-group-item-action border-right-warning ">Passport Type</div>
                                    <div class="list-group-item list-group-item-action ">Personal Details</div>
                                    <div class="list-group-item list-group-item-action">Family Details</div>
                                    <div class="list-group-item list-group-item-action">Residential Details</div>
                                    <div class="list-group-item list-group-item-action">Emergency Contact Details</div>
                                    <div class="list-group-item list-group-item-action">Terms</div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="col-md-8">
                        <div class="card">
                            <div class="card-header">
                                <h2 class="display-6">Select Passport Type
                                </h2>
                            </div>
                            <div class="card-body">
                                <table class="table table-borderless">
                                    <tbody>
                                        <tr>
                                            <td width="50%">
                                                <label for="rbPassportType">Select Passport Type</label></td>
                                            <td width="50%">
                                                <asp:RadioButtonList ID="rbPassportType" runat="server" RepeatDirection="Horizontal">
                                                    <asp:ListItem Value="Normal">&nbsp;Normal</asp:ListItem>
                                                    <asp:ListItem Value="Tatkal">&nbsp;Tatkal</asp:ListItem>
                                                </asp:RadioButtonList>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="Dynamic" ForeColor="Red" runat="server" ErrorMessage="Select Passport type" ControlToValidate="rbPassportType"></asp:RequiredFieldValidator>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label for="rbPassportPages">Select Passport Size</label></td>
                                            <td>
                                                <asp:RadioButtonList ID="rbPassportPages" runat="server" RepeatDirection="Horizontal">
                                                    <asp:ListItem Value="36">&nbsp;36</asp:ListItem>
                                                    <asp:ListItem Value="60">&nbsp;60</asp:ListItem>
                                                </asp:RadioButtonList>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Display="Dynamic" ForeColor="Red" runat="server" ErrorMessage="Select Passport pages" ControlToValidate="rbPassportPages"></asp:RequiredFieldValidator>

                                                
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <asp:Button ID="btnNext" runat="server" CssClass="btn btn-sm btn-primary" Text="Next" OnClick="btnNext_Click" />
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

</asp:Content>

