<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="ResidentialDetails.aspx.cs" Inherits="Applicant_ResidentialDetails" %>

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
                    Stage
                </div>
                <div class="card-body p-0 ">
                    <div id="list-example" class="list-group">
                        <div class="list-group-item list-group-item-action bg-success text-light">Passport Type</div>
                        <div class="list-group-item list-group-item-action bg-success text-light ">Personal Details</div>
                        <div class="list-group-item list-group-item-action bg-success text-light">Family Details</div>
                        <div class="list-group-item list-group-item-action border-right-warning">Residential Details</div>
                        <div class="list-group-item list-group-item-action">Emergency Contact Details</div>
                        <div class="list-group-item list-group-item-action">Terms</div>
                    </div>

                </div>
            </div>
        </div>
        <div class="col-md-9">
            <div class="card">
                <div class="card-header">
                    <h2 class="display-7">Residential Details
                    </h2>
                </div>
                <div class="card-body">
                    <table class="table table-borderless pt-0 pb-0">
                        <tbody>
                            <tr>
                                <td width="50%">
                                    <label for="rbAddressOOI">Is your present address  out of India?</label>
                                </td>
                                <td width="50%">
                                    <asp:RadioButtonList ID="rbAddressOOI" runat="server" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" AutoPostBack="true">
                                        <asp:ListItem Value="YES">Yes</asp:ListItem>
                                        <asp:ListItem Value="NO">No</asp:ListItem>
                                    </asp:RadioButtonList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" Display="Dynamic" Font-Bold="true" ForeColor="Red" runat="server" ErrorMessage="Select present address location" ControlToValidate="rbAddressOOI"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <asp:Panel ID="Panel1" runat="server">
                                <tr>
                                    <td>
                                        <label for="OOI_country">Select Country</label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="cbCountries" CssClass="form-control form-control-sm" runat="server" AutoPostBack="false">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label for="OOI_address">House No, Street Name, City</label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="OOI_address" runat="server" TextMode="MultiLine" Rows="3" CssClass="w-100" Style="text-transform: uppercase"></asp:TextBox><br />
                                        <asp:RequiredFieldValidator ID="rvooiadresss" Display="Dynamic" ForeColor="Red" Font-Bold="true" runat="server" ErrorMessage="Enter Address" ControlToValidate="OOI_address"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </asp:Panel>
                            <asp:Panel ID="Panel2" runat="server">
                                <tr>
                                    <td>
                                        <label for="txt_ind_address">House No. & Street Name</label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_ind_address" runat="server" TextMode="MultiLine" Rows="3" CssClass="w-100" Style="text-transform: uppercase"></asp:TextBox><br>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="Dynamic" ForeColor="Red" Font-Bold="true" runat="server" ErrorMessage="Enter Address" ControlToValidate="txt_ind_address"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label for="cb_state">Select State</label>
                                    </td>
                                    <td>
                                        <%--<asp:DropDownList ID="cb_State" runat="server"   OnSelectedIndexChanged="cb_State_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>--%>
                                        <ajaxToolkit:ComboBox ID="cb_State" runat="server" OnSelectedIndexChanged="cb_State_SelectedIndexChanged" AutoCompleteMode="SuggestAppend" AutoPostBack="true"></ajaxToolkit:ComboBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label for="cb_District">Select District</label>
                                    </td>
                                    <td>
                                        <ajaxToolkit:ComboBox ID="cb_District" runat="server" AutoPostBack="true" AutoCompleteMode="SuggestAppend"></ajaxToolkit:ComboBox>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <label for="txtPincode">Pincode</label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtPincode" runat="server" MaxLength="6" CssClass="w-75"></asp:TextBox><br />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Display="Dynamic" ForeColor="Red" Font-Bold="true" runat="server" ErrorMessage="Enter pincode" ControlToValidate="txtPincode"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" Display="Dynamic" ForeColor="Red" Font-Bold="true" ErrorMessage="Invalid Pincode" ValidationExpression="^[1-9]{1}[0-9]{2}\s{0,1}[0-9]{3}$" ControlToValidate="txtPincode"></asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Permanent Address
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="chk_perm" runat="server" OnCheckedChanged="chk_perm_CheckedChanged" AutoPostBack="true" />
                                        &nbsp; Same as Above
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label for="txt_perm_ind_address">House No. & Street Name</label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txt_perm_ind_address" runat="server" TextMode="MultiLine" Rows="3" CssClass="w-100" Style="text-transform: uppercase"></asp:TextBox><br />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" Display="Dynamic" ForeColor="Red" Font-Bold="true" runat="server" ErrorMessage="Enter Address" ControlToValidate="txt_perm_ind_address"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label for="cb_PermState">Select State</label>
                                    </td>
                                    <td>
                                        <%--<asp:DropDownList ID="cb_State" runat="server"   OnSelectedIndexChanged="cb_State_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>--%>
                                        <ajaxToolkit:ComboBox ID="cb_PermState" runat="server" OnSelectedIndexChanged="cb_PermState_SelectedIndexChanged" AutoCompleteMode="SuggestAppend" AutoPostBack="true"></ajaxToolkit:ComboBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label for="cb_PermDistrict">Select District</label>
                                    </td>
                                    <td>
                                        <ajaxToolkit:ComboBox ID="cb_PermDistrict" runat="server" AutoPostBack="true" AutoCompleteMode="SuggestAppend"></ajaxToolkit:ComboBox>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <label for="txtPermPincode">Pincode</label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtPermPincode" runat="server" MaxLength="6" CssClass="w-75"></asp:TextBox><br />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" Display="Dynamic" ForeColor="Red" Font-Bold="true" runat="server" ErrorMessage="Enter pincode" ControlToValidate="txtPincode"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" Display="Dynamic" ForeColor="Red" Font-Bold="true" ErrorMessage="Invalid Pincode" ValidationExpression="^[1-9]{1}[0-9]{2}\s{0,1}[0-9]{3}$" ControlToValidate="txtPermPincode"></asp:RegularExpressionValidator>
                                    </td>
                                </tr>


                            </asp:Panel>
                            <tr>
                                <td>
                                    <label for="txtMobileNo">Mobile No. *</label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtMobileNo" runat="server" TextMode="Phone" MaxLength="10" CssClass="w-75"></asp:TextBox><br />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" Display="Dynamic" ForeColor="Red" Font-Bold="true" runat="server" ErrorMessage="Enter Mobile no." ControlToValidate="txtMobileNo"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" Display="Dynamic" ForeColor="Red" Font-Bold="true" ErrorMessage="Invalid Mobile no." ValidationExpression="\d{10}" ControlToValidate="txtMobileNo"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="txtTelephone">Telephone No. </label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtTelephone" runat="server" TextMode="Number" MaxLength="10" CssClass="w-75"></asp:TextBox><br />

                                               
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" Display="Dynamic" ForeColor="Red" Font-Bold="true" ErrorMessage="Invalid Telephone no." ValidationExpression="\d{6,10}" ControlToValidate="txtTelephone"></asp:RegularExpressionValidator>

                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="txtEmail">Email Id </label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtEmail" runat="server" CssClass="w-75"></asp:TextBox><br />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" Display="Dynamic" ForeColor="Red" Font-Bold="true" runat="server" ErrorMessage="Enter Email" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="valEmail" runat="server" Display="Dynamic" ForeColor="Red" Font-Bold="true" ErrorMessage="Invalid Email" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="text-center">
                                    <%--<asp:Button ID="btnSaveDetails" runat="server" CssClass="btn btn-sm btn-primary w-50" Text="Save Details" OnClick="btnSaveDetails_Click" />--%>
                                </td>
                                <td class="text-center">
                                    <asp:Button ID="btnNext" runat="server" CssClass="btn btn-sm btn-primary w-50" Text="Next" OnClick="btnNext_Click" />
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

