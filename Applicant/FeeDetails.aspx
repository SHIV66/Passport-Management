<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="FeeDetails.aspx.cs" Inherits="Applicant_FeeDetails" %>

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
                                    <div class="list-group-item list-group-item-action">Terms</div>
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
                                            <td>
                                                <h4>
                                                    <label for="txtEmgName">Total Fees </label>
                                                </h4>
                                            </td>
                                            <td>
                                                <asp:Label ID="lblFees" Font-Bold="false" Font-Italic="true" Font-Size="Large" runat="server" Text="Rs. 2000"></asp:Label>

                                            </td>
                                        </tr>
                                        <tr>
                                            <th width="30%">Self Declaration
                                            </th>
                                            <th width="70%"></th>
                                        </tr>
                                        <tr>
                                            <td colspan="2">I owe allegiance to the sovereignty , unity & integrity of India, and have not voluntarily acquired citizenship or travel document of any
                                                                other country. I have not lost, surrendered or been deprived of the the citizenship of India and I affirm that the information given by me in
                                                                this form and the enclosures is true and I solely responsible for its accuracy, and I am liable to be penalized or prosecuted if found
                                                                otherwise. I am aware that under the Passport Act, 1967 it is a criminal offence to furnish any false information or to suppress any material
                                                                information with a view to obtaining passport or travel document.
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="border p-2">

                                                    <asp:CheckBox ID="cbSelf" runat="server" />
                                                    
                                                I Agree</td>
                                            </div>
                                            <td><asp:Label ID="lblError" runat="server" Font-Bold="true" ForeColor="Red" Text=""></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td class="text-center"></td>
                                            <td class="text-center">
                                                <asp:Button ID="btnNext" runat="server" CssClass="btn btn-sm btn-primary w-50" OnClick="btnNext_Click" Text="Submit" />
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

