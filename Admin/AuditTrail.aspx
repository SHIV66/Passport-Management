<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="AuditTrail.aspx.cs" Inherits="Admin_AuditTrail" %>

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
                                Admin Dashboard
                            </div>
                            <div class="card-body p-0 ">
                                <div id="list-example" class="list-group">
                                    <a class="list-group-item list-group-item-action" href="/Admin/Admin.aspx">Admin Panel</a>
                                    <a class="list-group-item list-group-item-action" href="/Admin/ManageOfficers.aspx">Manage Officers</a>
                                    <a class="list-group-item list-group-item-action" href="/Admin/ModifyDocumentAdvisors.aspx">Modify Document Advisor</a>
                                    <a class="list-group-item list-group-item-action" href="/Admin/ModifyFees.aspx">Modify Fees</a>
                                    <a class="list-group-item list-group-item-action" href="/Admin/AuditTrail.aspx">Audit Trail</a>
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
                                

                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>

    </div>

</asp:Content>

