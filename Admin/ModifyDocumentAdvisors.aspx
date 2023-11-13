<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="ModifyDocumentAdvisors.aspx.cs" Inherits="Admin_ModifyDocumentAdvisors" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

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
                                <h2 class="display-7">Document Advisor
                                </h2>
                            </div>
                            <div class="card-body">
                                <table class="table table-borderless">
                                    <tr>
                                        <td>New Document </td>
                                        <td>
                                            <asp:TextBox ID="txtDoc" CssClass="form-control form-control-sm" runat="server"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:Button ID="btnAddDoc" CssClass="btn btn-primary btn-sm w-75" runat="server" Text="Add New Doc" OnClick="btnAddDoc_Click" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>New Document Type</td>
                                        <td>
                                            <asp:TextBox ID="txtDocType" CssClass="form-control form-control-sm" runat="server"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:Button ID="btnAddDocType" CssClass="btn btn-primary btn-sm w-75" runat="server" Text="Add New Doc Type" OnClick="btnAddDocType_Click" />
                                        </td>
                                    </tr>
                                </table>
                                <hr />
                                <table class="table table-borderless">
                                    <tr>
                                        <td>Select DocType</td>
                                        <td colspan="2">
                                            <ajaxToolkit:ComboBox ID="cbDocType" runat="server" OnSelectedIndexChanged="cbDocType_SelectedIndexChanged" DropDownStyle="DropDownList" AutoCompleteMode="SuggestAppend" AutoPostBack="true"></ajaxToolkit:ComboBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="20%">Eligible Docs
                                        </td>
                                        <td width="40$">
                                            <asp:GridView ID="gvEligibleDocs" runat="server" AutoGenerateColumns="False" AllowSorting="True">
                                                <Columns>
                                                    <asp:BoundField DataField="did" HeaderText="ID" ItemStyle-Width="10">
                                                        <ItemStyle Width="10px"></ItemStyle>
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="dname" HeaderText="Document" ItemStyle-Width="150">
                                                        <ItemStyle Width="150px"></ItemStyle>
                                                    </asp:BoundField>
                                                </Columns>
                                            </asp:GridView>
                                        </td>
                                        <td width="40%">
                                            <ajaxToolkit:PopupControlExtender ID="PopupControlExtender1" TargetControlID="lblSelectMore" PopupControlID="pnlAllDocsCheckboxes" Position="Bottom" runat="server"></ajaxToolkit:PopupControlExtender>
                                            <asp:Label ID="lblSelectMore" CssClass="btn btn-info btn-sm" runat="server" Text="+"></asp:Label>
                                            <asp:Panel ID="pnlAllDocsCheckboxes" CssClass="bg-light w-25 border" runat="server">
                                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                    <ContentTemplate>
                                                        <asp:CheckBoxList ID="cblAllDocs" runat="server" CssClass="table table-sm">

                                                        </asp:CheckBoxList>
                                                        <asp:Button ID="btnAddEligibleDocs" CssClass="btn btn-primary btn-sm w-100" runat="server" Text="Add Docs" OnClick="btnAddEligibleDocs_Click" />
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </asp:Panel>
                                        </td>
                                    </tr>
                                </table>

                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>

    </div>
</asp:Content>

