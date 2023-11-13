 <%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="SelectLocation.aspx.cs" Inherits="Applicant_SelectLocation" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

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
                                    <a class="list-group-item list-group-item-action" href="/Applicant/PersonalDetails.aspx">Personal Details</a>
                                    <a class="list-group-item list-group-item-action" href="/Applicant/FamilyDetails.aspx">Family Details</a>
                                    <a class="list-group-item list-group-item-action" href="/Applicant/ResidentialDetails.aspx">Residential Details</a>
                                    <a class="list-group-item list-group-item-action" href="/Applicant/EmgContact.aspx">Emergency Contact Details</a>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                    <div class="col-md-8">
                        <div class="card">
                            <div class="card-header">
                                <h1 class="display-6">Select Your Area
                                </h1>
                            </div>
                            <div class="card-body">
                                <table class="table table-borderless">
                                    <tbody>
                                        <tr>
                                            <td><label for="cbState">Select State</label></td>
                                            <td>
                                                <%--<asp:DropDownList ID="ddState" runat="server" OnSelectedIndexChanged="ddState_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>--%>
                                                <ajaxToolkit:ComboBox ID="cbState" runat="server" OnSelectedIndexChanged="cbState_SelectedIndexChanged1" AutoPostBack="True" AutoCompleteMode="Suggest"></ajaxToolkit:ComboBox> 
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label for="cbDistrict">Select District</label></td>
                                            <td>
                                                <%--<asp:DropDownList ID="ddDistrict" runat="server">                                                </asp:DropDownList>--%>
                                                <ajaxToolkit:ComboBox ID="cbDistrict" AutoPostBack="True" runat="server" AutoCompleteMode="Suggest" OnSelectedIndexChanged="cbDistrict_SelectedIndexChanged"></ajaxToolkit:ComboBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <asp:Button ID="btnNext" runat="server" CssClass="btn btn-sm btn-primary" Text="Next" OnClick="btnNext_Click1" />

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

