<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="SubmittedApplicationsList.aspx.cs" Inherits="Officer_SubmittedApplicationsList" %>

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
                                    <a class="list-group-item list-group-item-action" href="/Officer/SubmittedApplicationsList.aspx">View Submitted Applications</a>
                                    <a class="list-group-item list-group-item-action" href="/FeeCalucator.aspx">Fee Calculator</a>
                                    <a class="list-group-item list-group-item-action" href="/AppointmentStatus.aspx">Appointment Availability Status</a>
                                    <a class="list-group-item list-group-item-action" href="/DocumentAdvisor.aspx">Document Advisor</a>
                                    <a class="list-group-item list-group-item-action" href="/ChangePassword.aspx">Change Password</a>
                                    <a class="list-group-item list-group-item-action" href="/ModifyProfile.aspx">Modify Profile</a>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                    <div class="col-md-8">
                        <div class="card">
                            <div class="card-header">
                                <h1 class="display-6">Pending Applications
                                </h1>
                            </div>
                            <div class="card-body">
                                <asp:GridView ID="gvSubmittedApplicationList" CssClass="table table-bordered" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White"  OnRowDataBound="gvSubmittedApplicationList_RowDataBound"
                                    runat="server" AutoGenerateColumns="False" AllowSorting="True">
                                    <Columns>
                                        <asp:BoundField DataField="form_id" HeaderText="ID" ItemStyle-Width="10">
                                            <ItemStyle Width="10px"></ItemStyle>
                                        </asp:BoundField>
                                        <asp:BoundField DataField="name" HeaderText="Name" ItemStyle-Width="150">
                                            <ItemStyle Width="150px"></ItemStyle>
                                        </asp:BoundField>
                                    </Columns>

                                    <HeaderStyle BackColor="#3AC0F2" ForeColor="White"></HeaderStyle>
                                </asp:GridView>

                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>

    </div>

</asp:Content>

