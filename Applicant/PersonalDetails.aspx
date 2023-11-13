<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="PersonalDetails.aspx.cs" Inherits="Applicant_PersonalDetails" %>

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
                                    <div class="list-group-item list-group-item-action border-right-warning ">Personal Details</div>
                                    <div class="list-group-item list-group-item-action">Family Details</div>
                                    <div class="list-group-item list-group-item-action ">Residential Details</div>
                                    <div class="list-group-item list-group-item-action ">Emergency Contact Details</div>
                                    <div class="list-group-item list-group-item-action">Documents Upload</div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="col-md-9">
                        <div class="card">
                            <div class="card-header">
                                <h2 class="display-7">Personal Details
                                </h2>
                            </div>
                            <div class="card-body">
                                <table class="table table-borderless pt-0 pb-0">
                                    <tbody>
                                        <tr>
                                            <td width="50%">
                                                <label for="txtFname">Given Name </label>
                                                <br>
                                                <small>(First Name + Middle Name<br>
                                                    Initials and honorifics (e.g. Dr.,Col.,etc.) are not allowed.)</small>
                                            </td>
                                            <td width="50%">
                                                <asp:TextBox ID="txtFname" runat="server" CssClass="form-control form-control-sm w-75" Style="text-transform: uppercase"></asp:TextBox><br />
                                                <asp:RequiredFieldValidator ID="rvFirstname" Display="Dynamic" ForeColor="Red" Font-Bold="true" runat="server" ErrorMessage="Enter Given Name" ControlToValidate="txtFname"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="valFirstname" runat="server" Display="Dynamic" ForeColor="Red" Font-Bold="true" ErrorMessage="Invalid Given Name (Number and symbols are not allowed)" ControlToValidate="txtFname" ValidationExpression="^[a-zA-Z]+$"></asp:RegularExpressionValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label for="txtLname">Last Name</label></td>
                                            <td>
                                                <asp:TextBox ID="txtLname" runat="server" CssClass="form-control form-control-sm w-75" Style="text-transform: uppercase"></asp:TextBox><br />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" Display="Dynamic" ForeColor="Red" Font-Bold="true" runat="server" ErrorMessage="Enter Last Name" ControlToValidate="txtLname"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" Display="Dynamic" ForeColor="Red" Font-Bold="true" ErrorMessage="Invalid Last Name (Number and symbols are not allowed)" ControlToValidate="txtLname" ValidationExpression="^[a-zA-Z]+$"></asp:RegularExpressionValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label for="rdGender">Gender</label></td>
                                            <td>
                                                <asp:RadioButtonList ID="rbGender"  runat="server" RepeatDirection="Horizontal">
                                                    <asp:ListItem Value="Male">&nbsp;Male</asp:ListItem>
                                                    <asp:ListItem Value="Female">&nbsp;Female</asp:ListItem>
                                                    <asp:ListItem Value="Transgender">&nbsp;Transgender</asp:ListItem>
                                                </asp:RadioButtonList>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="Dynamic" Font-Bold="true" ForeColor="Red" runat="server" ErrorMessage="Select Gender" ControlToValidate="rbGender"></asp:RequiredFieldValidator>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label for="txtDob">Date of Birth</label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtDob" runat="server" CssClass="form-control form-control-sm w-75"></asp:TextBox>
                                                <ajaxToolkit:CalendarExtender ID="clDob" runat="server" TargetControlID="txtDob" Format="dd-MM-yyyy" /><br />
                                                <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Birthdate is greater than today's date" ControlToValidate="txtDob" Display="Dynamic" MinimumValue="01-01-1880" ForeColor="Red" Font-Bold="true" Type="Date"></asp:RangeValidator>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" Display="Dynamic" ForeColor="Red" Font-Bold="true" runat="server" ErrorMessage="Enter Date of birth" ControlToValidate="txtDob"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" Display="Dynamic" ForeColor="Red" Font-Bold="true" ErrorMessage="Invalid Date of birth (Format : dd-mm-yyyy)" ControlToValidate="txtDob" ValidationExpression="(0[1-9]|1[012])[-](0[1-9]|[12][0-9]|3[01])[-]\d{4}"></asp:RegularExpressionValidator>

                                            </td>
                                        </tr>

                                        <tr>
                                            <td>
                                                <label for="rbOaYes">Have you ever been known by other names (aliases)?</label></td>
                                            <td>

                                                <asp:RadioButton ID="rbOaYes" runat="server" GroupName="OtherAlias" OnCheckedChanged="rbOaYes_CheckedChanged" AutoPostBack="True" />&nbsp;Yes&nbsp;&nbsp;
                                                <asp:RadioButton ID="rbOaNo" runat="server" GroupName="OtherAlias" OnCheckedChanged="rbOaNo_CheckedChanged" AutoPostBack="True" />&nbsp;No
                                            </td>
                                        </tr>
                                        <asp:Panel ID="Panel1" runat="server">
                                            <tr>
                                                <td>Given Name (Other Alias)</td>
                                                <td>
                                                    <asp:TextBox ID="txtOaFname" runat="server" CssClass="w-75" Style="text-transform: uppercase"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Last Name (Other Alias)</td>
                                                <td>
                                                    <asp:TextBox ID="txtOaLname" runat="server" CssClass="w-75" Style="text-transform: uppercase"></asp:TextBox></td>
                                            </tr>

                                        </asp:Panel>
                                        <tr>
                                            <td>Is your Place of Birth out of India?</td>
                                            <td>
                                                <asp:RadioButton ID="rbBoI_yes" runat="server" GroupName="rbBirthPlace" AutoPostBack="True" OnCheckedChanged="rbBoI_yes_CheckedChanged" />&nbsp;Yes&nbsp;&nbsp;
                                                <asp:RadioButton ID="rbBoI_no" runat="server" GroupName="rbBirthPlace" AutoPostBack="True" OnCheckedChanged="rbBoI_no_CheckedChanged" />&nbsp;No
                                            </td>
                                        </tr>
                                        <asp:Panel ID="pnl_birth" runat="server">
                                            <tr>
                                                <td>Country</td>
                                                <td>
                                                    <ajaxToolkit:ComboBox ID="cbCountries" runat="server" AutoPostBack="True"></ajaxToolkit:ComboBox>
                                                </td>
                                            </tr>
                                        </asp:Panel>
                                        <tr>
                                            <td>Place of Birth (Village/Town/City)</td>
                                            <td>
                                                <asp:TextBox ID="txtPlaceofBirth" runat="server" CssClass="form-control form-control-sm w-75" Style="text-transform: uppercase"></asp:TextBox>
                                                
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" Display="Dynamic" Font-Bold="true" ForeColor="Red" runat="server" ErrorMessage="Enter Place of birth" ControlToValidate="txtPlaceofBirth"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Marital Status</td>
                                            <td>
                                                <asp:DropDownList ID="cbMarital" CssClass="form-control form-control-sm w-75" runat="server">
                                                    
                                                    <asp:ListItem Value="">Select</asp:ListItem>
                                                    <asp:ListItem Value="Widow/Widower">Widow/Widower</asp:ListItem>
                                                    <asp:ListItem Value="Divorced">Divorced</asp:ListItem>
                                                    <asp:ListItem Value="Single">Single</asp:ListItem>
                                                    <asp:ListItem Value="Married">Married</asp:ListItem>
                                                    <asp:ListItem Value="Separated">Separated</asp:ListItem>
                                                </asp:DropDownList>
                                                <br />

                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" Display="Dynamic" Font-Bold="true" ForeColor="Red" runat="server" ErrorMessage="Select Marital status" ControlToValidate="cbMarital"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Citizenship of India by</td>
                                            <td>
                                                <asp:RadioButtonList ID="rbCitizen" runat="server" RepeatDirection="Horizontal">
                                                    <asp:ListItem Value="Birth">&nbsp;Birth</asp:ListItem>
                                                    <asp:ListItem Value="Registration/Naturalization">&nbsp;Registration/Naturalization</asp:ListItem>
                                                    <asp:ListItem Value="Descent">&nbsp;Descent</asp:ListItem>
                                                </asp:RadioButtonList>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Display="Dynamic" ForeColor="Red" Font-Bold="true" runat="server" ErrorMessage="Select Citizenship by" ControlToValidate="rbCitizen"></asp:RequiredFieldValidator>


                                            </td>
                                        </tr>
                                        <tr>
                                            <td>PAN (if available)</td>
                                            <td>
                                                <asp:TextBox ID="txtPAN" runat="server" CssClass="form-control form-control-sm w-75"  Style="text-transform: uppercase"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Voter ID (if available)</td>
                                            <td>
                                                <asp:TextBox ID="txtVoterID" runat="server" CssClass="form-control form-control-sm w-75"  Style="text-transform: uppercase"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Employment Type</td>
                                            <td>
                                                <asp:DropDownList ID="cbEmploymentType" CssClass="form-control form-control-sm w-75"  runat="server">
                                                    
                                                    <asp:ListItem Value="">Select</asp:ListItem>
                                                    <asp:ListItem Value="Goverment">Goverment </asp:ListItem>
                                                    <asp:ListItem Value="Private">Private</asp:ListItem>
                                                    <asp:ListItem Value="Not Employed">Not Employed</asp:ListItem>
                                                    <asp:ListItem Value="Student">Student</asp:ListItem>
                                                    <asp:ListItem Value="Retired">Retired</asp:ListItem>
                                                </asp:DropDownList>
                                                
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" Display="Dynamic" Font-Bold="true" ForeColor="Red" runat="server" ErrorMessage="Select Employment type" ControlToValidate="cbEmploymentType"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Is either of your parent (in case of minor)/spouse, a government servant?</td>
                                            <td>
                                                <asp:RadioButtonList ID="rbParentGovSrv" runat="server" RepeatDirection="Horizontal">
                                                    <asp:ListItem Value="Yes">Yes</asp:ListItem>
                                                    <asp:ListItem Value="No">No</asp:ListItem>
                                                </asp:RadioButtonList>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" Display="Dynamic" Font-Bold="true" ForeColor="Red" runat="server" ErrorMessage="Select Yes or No" ControlToValidate="rbParentGovSrv"></asp:RequiredFieldValidator>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Educational qualification</td>
                                            <td>
                                                <asp:DropDownList ID="cbEduQual" CssClass="form-control form-control-sm w-75" runat="server">
                                                    
                                                    <asp:ListItem Value="">Select</asp:ListItem>
                                                    <asp:ListItem Value="Graduate+">Graduate And Above</asp:ListItem>
                                                    <asp:ListItem Value="7-">7th Pass or less</asp:ListItem>
                                                    <asp:ListItem Value="10+">10th Pass or above</asp:ListItem>
                                                    <asp:ListItem Value="8-9">Between 8th and 9th Standard</asp:ListItem>
                                                </asp:DropDownList>
                                                
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" Display="Dynamic" Font-Bold="true" ForeColor="Red" runat="server" ErrorMessage="Select Employment type" ControlToValidate="cbEduQual"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Is applicant eligible for Non-ECR category</td>
                                            <td>
                                                <asp:RadioButtonList ID="rbECR" runat="server" RepeatDirection="Horizontal">
                                                    <asp:ListItem Value="Yes">Yes</asp:ListItem>
                                                    <asp:ListItem Value="No">No</asp:ListItem>
                                                </asp:RadioButtonList>
                                                
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" Display="Dynamic" Font-Bold="true" ForeColor="Red" runat="server" ErrorMessage="Select ECR type" ControlToValidate="rbECR"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Visible distinguishing mark</td>
                                            <td>
                                                <asp:TextBox ID="txtVisibleMark" runat="server" CssClass="form-control form-control-sm w-75" ></asp:TextBox></td>
                                        </tr>
                                        <tr>
                                            <td>Aadhaar Number</td>
                                            <td>
                                                <asp:TextBox ID="txtAadhar" runat="server" CssClass="form-control form-control-sm w-75" ></asp:TextBox>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" Display="Dynamic" ForeColor="Red" Font-Bold="true" ErrorMessage="Invalid Aadhaar number" ControlToValidate="txtAadhar" ValidationExpression="\d{16}"></asp:RegularExpressionValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-center"></td>
                                            <td class="text-center">
                                                <asp:Button ID="btnNext" runat="server" OnClick="btnNext_Click" CssClass="btn btn-sm btn-primary w-50" Text="Next" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">

                                                <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
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

