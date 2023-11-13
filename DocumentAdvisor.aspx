<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="DocumentAdvisor.aspx.cs" Inherits="DocumentAdvisor" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="card">
            <div class="card-body">
                <div class="jumbotron">
                    <h1>Document Advisor</h1>
                    <p>Important Information: Passport application can be processed at any PSK/POPSK/PSLK WITHIN INDIA irrespective of your residential address.</p>
                </div>
                <table class="table">
                    <tr>
                        <td>Select Document Type : </td>
                        <td>
                            <asp:DropDownList ID="cbDocType" runat="server" CssClass="form-control" OnSelectedIndexChanged="cbDocType_SelectedIndexChanged"  AutoPostBack="true"></asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>List of Eligible Documents : </td>
                        <td>
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
                    </tr>

                </table>
                <hr />
            </div>
        </div>


    </div>
</asp:Content>

