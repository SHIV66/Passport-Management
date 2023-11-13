<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="verifyApplication.aspx.cs" Inherits="Officer_verifyApplication" %>

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
                                Information Corner
                            </div>
                            <div class="card-body p-0 ">
                                <div id="list-example" class="list-group">
                                    <a class="list-group-item list-group-item-action" href="/Officer/OfficerDashboard.aspx">Dashboard</a>
                                    <a class="list-group-item list-group-item-action" href="/Officer/PendingApplicationsList.aspx">View Pending Applications</a>
                                    <a class="list-group-item list-group-item-action" href="/FeeCalucator.aspx">Fee Calculator</a>
                                    <a class="list-group-item list-group-item-action" href="/DocumentAdvisor.aspx">Document Advisor</a>
                                    <a class="list-group-item list-group-item-action" href="/ChangePassword.aspx">Change Password</a>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="col-md-9">
                        <div class="card">
                            <div class="card-header">
                                <h1 class="display-6">Application 
                                </h1>
                            </div>
                            <div class="card-body">

                                <asp:UpdatePanel ID="upanel" runat="server">
                                    <ContentTemplate>
                                        <table class="table table-bordered pt-0 pb-0 ">
                                            <tr>
                                                <th colspan="4">
                                                    Personal Details
                                                </th>
                                            </tr>
                                            <tr>
                                                <td>Full Name : </td>
                                                <td colspan="3">
                                                    <asp:Label ID="lblFullName" runat="server" Text="Label"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="20%">Gender : </td>
                                                <td width="30%">
                                                    <asp:Label ID="lblGender" runat="server" Text="Label"></asp:Label>
                                                </td>
                                                <td width="20%">Date of Birth : </td>
                                                <td width="30%">
                                                    <asp:Label ID="lblDOB" runat="server" Text="Label"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Other Name : </td>
                                                <td colspan="3">
                                                    <asp:Label ID="lblotherName" runat="server" Text="Label"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Place of Birth : </td>
                                                <td colspan="3">
                                                    <asp:Label ID="lblbirthplace" runat="server" Text="Label"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Marital Status : </td>
                                                <td>
                                                    <asp:Label ID="lblMarital" runat="server" Text="Label"></asp:Label>
                                                </td>
                                                <td>Citizenship of India by : </td>
                                                <td>
                                                    <asp:Label ID="lblCitizenship" runat="server" Text="Label"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>PAN : </td>
                                                <td>
                                                    <asp:Label ID="lblPan" runat="server" Text="Label"></asp:Label>
                                                </td>
                                                <td>Voter ID : </td>
                                                <td>
                                                    <asp:Label ID="lbl_voterId" runat="server" Text="Label"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Employment Type : </td>
                                                <td>
                                                    <asp:Label ID="lblEmployment" runat="server" Text="Label"></asp:Label>
                                                </td>
                                                <td>is Your parent Govt servent?</td>
                                                <td>
                                                    <asp:Label ID="lblGovtserv" runat="server" Text="Label"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Eligible for Non-ECR?</td>
                                                <td>
                                                    <asp:Label ID="lblECR" runat="server" Text="Label"></asp:Label></td>
                                                <td>Aadhaar No.</td>
                                                <td>
                                                    <asp:Label ID="lblAdhaar" runat="server" Text="Label"></asp:Label></td>
                                            </tr>
                                            <tr>
                                                <th colspan="4">Guardian Details</th>
                                            </tr>
                                            <tr>
                                                <td>Guardian Type</td>
                                                <td colspan="3">
                                                    <asp:Label ID="lblGDType" runat="server" Text="Label"></asp:Label></td>
                                            </tr>
                                            <tr>
                                                <td>Guardian Name</td>
                                                <td colspan="3">
                                                    <asp:Label ID="lblGDname" runat="server" Text="Label"></asp:Label></td>
                                            </tr>
                                            <tr>
                                                <td>Mother's Name</td>
                                                <td colspan="3">
                                                    <asp:Label ID="lblMotherName" runat="server" Text="Label"></asp:Label></td>
                                            </tr>
                                            <tr>
                                                <th colspan="4">Residential Details</th>
                                            </tr>
                                            <tr>
                                                <td>Present Address</td>
                                                <td colspan="3">
                                                    <asp:Label ID="lblPresentAddress" runat="server" Text="Label"></asp:Label></td>
                                            </tr>
                                            <tr>
                                                <td>Permanent Address</td>
                                                <td colspan="3">
                                                    <asp:Label ID="lblPermanentAddress" runat="server" Text="Label"></asp:Label></td>
                                            </tr>
                                            <tr>
                                                <td>Mobile No.</td>
                                                <td >
                                                    <asp:Label ID="lblMobile" runat="server" Text="Label"></asp:Label></td>
                                                <td>Telephone No.</td>
                                                <td >
                                                    <asp:Label ID="lblTelephone" runat="server" Text="Label"></asp:Label></td>
                                            </tr>
                                            <tr>
                                                <td>Email Address</td>
                                                <td  colspan="3">
                                                    <asp:Label ID="lblEmail" runat="server" Text="Label"></asp:Label></td>
                                            </tr>
                                            <tr>
                                                <th colspan="4">Emergency Contact Details</th>
                                            </tr>
                                            <tr>
                                                <td>Person Name</td>
                                                <td  colspan="3">
                                                    <asp:Label ID="lblEmgName" runat="server" Text="Label"></asp:Label></td>
                                            </tr>
                                            <tr>
                                                <td>Address</td>
                                                <td  colspan="3">
                                                    <asp:Label ID="lblEmgAddress" runat="server" Text="Label"></asp:Label></td>
                                            </tr>
                                            <tr>
                                                <td>Contact</td>
                                                <td  colspan="3">
                                                    <asp:Label ID="lblEmgContact" runat="server" Text="Label"></asp:Label></td>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <asp:GridView ID="gvDocList" CssClass="table table-bordered" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White" OnRowCommand="gvDocList_RowCommand"
                                                        runat="server" AutoGenerateColumns="False" AllowSorting="True">
                                                        <Columns>
                                                            <asp:BoundField DataField="documentType" HeaderText="Type" ItemStyle-Width="100">
                                                                <ItemStyle Width="100px"></ItemStyle>
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="documentID" HeaderText="ID" ItemStyle-Width="10">
                                                                <ItemStyle Width="10px"></ItemStyle>
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="documentName" HeaderText="Document" ItemStyle-Width="100">
                                                                <ItemStyle Width="100px"></ItemStyle>
                                                            </asp:BoundField>
                                                            <asp:TemplateField HeaderText="Action">

                                                                <ItemTemplate>

                                                                    <%--<ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" BackgroundCssClass="modalBackground" PopupControlID="Panel1" TargetControlID="LinkButton1" CancelControlID="btnClose"></ajaxToolkit:ModalPopupExtender>--%>

                                                                    <asp:HiddenField ID="HiddenField1" Value='<%# Eval("id") %>' runat="server" />
                                                                    <a href='<%# "/Documents/"+Eval("id")+".pdf" %>' target="_blank">Display</a>
                                                                    <%--<asp:LinkButton ID="LinkButton1" runat="server" CommandName="Verify" CommandArgument='<%#Eval("id")%>'>Display</asp:LinkButton>--%>

                                                                </ItemTemplate>
                                                                <ItemStyle Width="100px" />
                                                            </asp:TemplateField>
                                                        </Columns>

                                                        <HeaderStyle BackColor="#3AC0F2" ForeColor="White"></HeaderStyle>
                                                    </asp:GridView>

                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <b>Your Comments : </b>
                                                </td>
                                                <td colspan="3">
                                                    <asp:TextBox ID="txtComments" TextMode="MultiLine" CssClass="w-100" Rows="4" runat="server"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="rfComment" runat="server" ForeColor="Red" ControlToValidate="txtComments" ErrorMessage="Enter Comments"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" class="text-center">
                                                    <asp:Button ID="btnreject" OnClick="btnreject_Click" runat="server" CssClass="btn btn-sm btn-danger w-50" Text="Reject" />
                                                </td>
                                                <td colspan="2" class="text-center">
                                                    <asp:Button ID="btnapprove" runat="server" OnClick="btnapprove_Click" CssClass="btn btn-sm btn-success w-50" Text="Approve" />
                                                </td>
                                            </tr>
                                        </table>

                                    </ContentTemplate>
                                </asp:UpdatePanel>
                                <%--<asp:Panel ID="Panel1" CssClass="modalPopup" Enabled="false" runat="server" Height="800" Width="600">
                                    <iframe src='' height="600" width="400"></iframe>
                                    <asp:Button ID="btnClose" runat="server" Text="Close" />
                                </asp:Panel>--%>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>

    </div>

</asp:Content>

