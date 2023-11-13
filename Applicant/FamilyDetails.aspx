<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="FamilyDetails.aspx.cs" Inherits="Applicant_FamilyDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
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
                                    <div class="list-group-item list-group-item-action bg-success text-light " >Personal Details</div>
                                    <div class="list-group-item list-group-item-action border-right-warning" >Family Details</div>
                                    <div class="list-group-item list-group-item-action ">Residential Details</div>
                                    <div class="list-group-item list-group-item-action ">Emergency Contact Details</div>
                                    <div class="list-group-item list-group-item-action">Documents Upload</div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="col-md-9">
                        <div class="card">
                            <div class="card-header">
                                <h2 class="display-7">Family Details
                                </h2>
                            </div>
                            <div class="card-body">
                                <table class="table table-borderless pt-0 pb-0">
                                    <tbody>
                                        <tr>
                                            <td width="50%">
                                                <label for="txtGuardFname">Guardian Type</label>
                                            </td>
                                            <td width="50%">
                                                <asp:RadioButtonList ID="rbGuardianType" runat="server" RepeatDirection="Horizontal">
                                                    <asp:ListItem Value="Legal">Legal Guardian</asp:ListItem>
                                                    <asp:ListItem Value="Father">Father</asp:ListItem>
                                                </asp:RadioButtonList>
                                                
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" Display="Dynamic" Font-Bold="true" ForeColor="Red" runat="server" ErrorMessage="Select Guardian type" ControlToValidate="rbGuardianType"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td >
                                                <label for="txtGuardFname">Guardian's Given Name </label>
                                            </td>
                                            <td >
                                                <asp:TextBox ID="txtGuardFname" runat="server" CssClass="w-75" Style="text-transform: uppercase"></asp:TextBox><br>
                                                <asp:RequiredFieldValidator ID="rvFirstname" Display="Dynamic" ForeColor="Red" Font-Bold="true" runat="server" ErrorMessage="Enter Name" ControlToValidate="txtGuardFname"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="valFirstname" runat="server" Display="Dynamic" ForeColor="Red" Font-Bold="true" ErrorMessage="Invalid Name (Number and symbols are not allowed)" ControlToValidate="txtGuardFname" ValidationExpression="^[a-zA-Z]+$"></asp:RegularExpressionValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label for="txtGuardLname">Guardian's Surname </label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtGuardLname" runat="server" CssClass="w-75" Style="text-transform: uppercase"></asp:TextBox><br />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="Dynamic" ForeColor="Red" Font-Bold="true" runat="server" ErrorMessage="Enter Name" ControlToValidate="txtGuardLname"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" Display="Dynamic" ForeColor="Red" Font-Bold="true" ErrorMessage="Invalid Last Name (Number and symbols are not allowed)" ControlToValidate="txtGuardLname" ValidationExpression="^[a-zA-Z]+$"></asp:RegularExpressionValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label for="txtMotherFname">Mother's Given Name</label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtMotherFname" runat="server" CssClass="w-75" Style="text-transform: uppercase"></asp:TextBox><br>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Display="Dynamic" ForeColor="Red" Font-Bold="true" runat="server" ErrorMessage="Enter Name" ControlToValidate="txtMotherFname"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" Display="Dynamic" ForeColor="Red" Font-Bold="true" ErrorMessage="Invalid Name (Number and symbols are not allowed)" ControlToValidate="txtMotherFname" ValidationExpression="^[a-zA-Z]+$"></asp:RegularExpressionValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label for="txtMotherLname">Mother's Surname</label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtMotherLname" runat="server" CssClass="w-75" Style="text-transform: uppercase"></asp:TextBox><br>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" Display="Dynamic" ForeColor="Red" Font-Bold="true" runat="server" ErrorMessage="Enter Name" ControlToValidate="txtMotherLname"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" Display="Dynamic" ForeColor="Red" Font-Bold="true" ErrorMessage="Invalid Name (Number and symbols are not allowed)" ControlToValidate="txtMotherLname" ValidationExpression="^[a-zA-Z]+$"></asp:RegularExpressionValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-center">
                                                <asp:Button ID="btnSaveDetails" OnClick="btnSaveDetails_Click" runat="server" CssClass="btn btn-sm btn-primary w-50" Text="Save Details" />
                                            </td>
                                            <td class="text-center">
                                                <asp:Button ID="btnNext" runat="server" CssClass="btn btn-sm btn-primary w-50" Text="Next" OnClick="btnNext_Click" />
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

