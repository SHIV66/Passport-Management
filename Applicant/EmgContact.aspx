<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="EmgContact.aspx.cs" Inherits="Applicant_EmgContact" %>

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
                                Stage
                            </div>
                            <div class="card-body p-0 ">
                                <div id="list-example" class="list-group">
                                    <div class="list-group-item list-group-item-action bg-success text-light">Passport Type</div>
                                    <div class="list-group-item list-group-item-action bg-success text-light ">Personal Details</div>
                                    <div class="list-group-item list-group-item-action bg-success text-light">Family Details</div>
                                    <div class="list-group-item list-group-item-action bg-success text-light">Residential Details</div>
                                    <div class="list-group-item list-group-item-action border-right-warning">Emergency Contact Details</div>
                                    <div class="list-group-item list-group-item-action">Documents Upload</div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="col-md-9">
                        <div class="card">
                            <div class="card-header">
                                <h2 class="display-7">Emergency Contact Details
                                </h2>
                            </div>
                            <div class="card-body">
                                <table class="table table-borderless pt-0 pb-0">
                                    <tbody>

                                        <tr>
                                            <td width="50%">
                                                <label for="txtEmgName">Emergency Contact Name</label>
                                            </td>
                                            <td width="50%">
                                                <asp:TextBox ID="txtEmgName" runat="server" CssClass="w-75" Style="text-transform: uppercase"></asp:TextBox><br />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="Dynamic" ForeColor="Red" Font-Bold="true" runat="server" ErrorMessage="Enter Name" ControlToValidate="txtEmgName"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" Display="Dynamic" ForeColor="Red" Font-Bold="true" ErrorMessage="Invalid Last Name (Number and symbols are not allowed)" ControlToValidate="txtEmgName" ValidationExpression="^[a-zA-Z]+$"></asp:RegularExpressionValidator>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label for="txtEmgAddress">Emergency Contact Address</label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtEmgAddress" runat="server" TextMode="MultiLine" Rows="2" CssClass="w-75" Style="text-transform: uppercase"></asp:TextBox><br />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" Display="Dynamic" ForeColor="Red" Font-Bold="true" runat="server" ErrorMessage="Enter Address" ControlToValidate="txtEmgAddress"></asp:RequiredFieldValidator>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label for="txtEmgMobileNo">Emergency Contact Mobile No. </label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtEmgMobileNo" runat="server" MaxLength="10" CssClass="w-75" Style="text-transform: uppercase"></asp:TextBox><br />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" Display="Dynamic" ForeColor="Red" Font-Bold="true" runat="server" ErrorMessage="Enter Mobile no." ControlToValidate="txtEmgMobileNo"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" Display="Dynamic" ForeColor="Red" Font-Bold="true" ErrorMessage="Invalid Mobile no." ValidationExpression="\d{10}" ControlToValidate="txtEmgMobileNo"></asp:RegularExpressionValidator>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-center">
                                                <asp:Button ID="btnSaveDetails" runat="server" CssClass="btn btn-sm btn-primary w-50" Text="Save Details" />
                                            </td>
                                            <td class="text-center">
                                                <asp:Button ID="btnNext" runat="server" CssClass="btn btn-sm btn-primary w-50" OnClick="btnNext_Click" Text="Next" />
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

