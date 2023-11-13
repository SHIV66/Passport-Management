<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="ApplicationsList.aspx.cs" Inherits="Applicant_ApplicationsList" %>

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
                                <h1 class="display-6">Application List
                                </h1>
                            </div>
                            <div class="card-body">
                                <asp:GridView ID="gvApplicationList" CssClass="table table-bordered" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White" OnRowCommand="gvApplicationList_RowCommand" OnRowDataBound="gvApplicationList_RowDataBound"
                                    runat="server" AutoGenerateColumns="False" AllowSorting="True">
                                    <Columns>
                                        <asp:BoundField DataField="form_id" HeaderText="ID" ItemStyle-Width="10">
                                            <ItemStyle Width="10px"></ItemStyle>
                                        </asp:BoundField>
                                        <asp:BoundField DataField="name" HeaderText="Name" ItemStyle-Width="150">
                                            <ItemStyle Width="150px"></ItemStyle>
                                        </asp:BoundField>
                                        <asp:BoundField DataField="ap_date" HeaderText="Created On" ItemStyle-Width="150">
                                            <ItemStyle Width="150px"></ItemStyle>
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="Action">

                                            <ItemTemplate>
                                                <asp:HiddenField ID="HiddenField1" Value='<%# Eval("stage") %>' runat="server" />
                                                <asp:LinkButton ID="LinkButton1" runat="server" CommandName="continue" CommandArgument='<%# Eval("stage")+","+ Eval("id")%>'>Continue</asp:LinkButton>
                                                <asp:Label ID="lblStatus" runat="server" Text="Submitted"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle Width="150px" />
                                        </asp:TemplateField>
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

