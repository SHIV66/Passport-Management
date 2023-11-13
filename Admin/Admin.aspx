<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="Admin" %>

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
                                <h2 class="display-7">Admin Panel
                                </h2>
                            </div>
                            <div class="card-body">
                                <table class="table">
                                    
                                    <tbody>
                                        <tr>
                                            <td>Total Level 1 Officers :</td>
                                            <td>
                                                <asp:Label ID="lblLvl1" runat="server" ForeColor="Green" Font-Italic="true" Font-Bold="true" Text="0"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Total Level 2 Officers :</td>
                                            <td>
                                                <asp:Label ID="lblLvl2" runat="server" ForeColor="Green" Font-Italic="true" Font-Bold="true" Text="0"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Total Level 3 Officers (Police Verification) :</td>
                                            <td>
                                                <asp:Label ID="lblLvl3" runat="server" ForeColor="Green" Font-Italic="true" Font-Bold="true" Text="0"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Total Level 4 Officers (Police Verification) :</td>
                                            <td>
                                                <asp:Label ID="lblLvl4" runat="server" ForeColor="Green" Font-Italic="true" Font-Bold="true" Text="0"></asp:Label>
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

