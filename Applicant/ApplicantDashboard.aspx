<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="ApplicantDashboard.aspx.cs" Inherits="ApplicantDashboard" %>

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
                                    <a class="list-group-item list-group-item-action" href="/Applicant/ApplicantDashboard.aspx">Dashboard</a>
                                    <a class="list-group-item list-group-item-action" href="/Applicant/ApplicationsList.aspx">View Saved/Submitted Applications</a>
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
                                <ul>
                                    <li>
                                        <a href="/Applicant/SelectLocation.aspx">Apply for Fresh Passport</a>
                                    </li>
                                </ul>

                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>

    </div>


</asp:Content>

