<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="ModifyFees.aspx.cs" Inherits="Admin_ModifyFees" %>

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
                                <h2 class="display-7">Fees Module
                                </h2>
                            </div>
                            <div class="card-body">
                                <table class="table table-borderless">
                                    <thead>
                                        <th></th>
                                        <th>Old Fees</th>
                                        <th>New Fees</th>
                                        <th></th>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>Base Processing Fee : </td>
                                            <td>
                                                <asp:Label ID="lblOldBaseFee" ForeColor="Olive" Font-Bold="true" runat="server" Text=""></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtBaseFees" runat="server"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:Button ID="btnUpdateBase" CssClass="btn btn-primary btn-sm" runat="server" Text="Update" OnClick="btnUpdateBase_Click"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Tatkal Fees : </td>
                                            <td>
                                                <asp:Label ID="lblOldTatkalFee" ForeColor="Olive" Font-Bold="true" runat="server" Text=""></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtTatkalFees" runat="server"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:Button ID="btnUpdateTatkal" CssClass="btn btn-primary btn-sm" runat="server" Text="Update" OnClick="btnUpdateTatkal_Click"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Extra Pages Fees : </td>
                                            <td>
                                                <asp:Label ID="lblOldEPFees" ForeColor="Olive" Font-Bold="true" runat="server" Text=""></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtEPFees" runat="server"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:Button ID="btnUpdateEPFees" CssClass="btn btn-primary btn-sm" runat="server" Text="Update" OnClick="btnUpdateEPFees_Click"/>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <hr />
                                    <asp:Label ID="lblStatus" ForeColor="Green" Font-Bold="true" runat="server" Text=""></asp:Label>
                                <hr />
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>

    </div>
</asp:Content>

