<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="OfficerDashboard.aspx.cs" Inherits="OfficerDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
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
                                    <a class="list-group-item list-group-item-action" href="/Officer/OfficerDashboard.aspx">Dashboard</a>
                                    <a class="list-group-item list-group-item-action" href="/Officer/PendingApplicationsList.aspx">View Pending Applications</a>
                                    <a class="list-group-item list-group-item-action" href="/FeeCalucator.aspx">Fee Calculator</a>
                                    <a class="list-group-item list-group-item-action" href="/DocumentAdvisor.aspx">Document Advisor</a>
                                    <a class="list-group-item list-group-item-action" href="/ChangePassword.aspx">Change Password</a>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                    <div class="col-md-8">
                        <div class="card">
                            <div class="card-header">
                                <h1 class="display-6">Applicant Dashboard
                                </h1>
                            </div>
                            <div class="card-body">
                                <table class="table">
                                    
                                    <tbody>
                                        <tr>
                                            <td>Total Pending Applications</td>
                                            <td>
                                                <asp:Label ID="lblPending" runat="server" ForeColor="Red" Font-Italic="true" Font-Bold="true" Text="0"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Total approved Applications</td>
                                            <td>
                                                <asp:Label ID="lblApproved" runat="server" ForeColor="Green" Font-Italic="true" Font-Bold="true" Text="0"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Total rejected Applications</td>
                                            <td>
                                                <asp:Label ID="lblRejected" runat="server" ForeColor="Orange" Font-Italic="true" Font-Bold="true" Text="0"></asp:Label>
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

