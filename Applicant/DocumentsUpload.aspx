<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="DocumentsUpload.aspx.cs" Inherits="Applicant_DocumentsUpload" %>

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
                                    <div class="list-group-item list-group-item-action bg-success text-light">Residential Details</div>
                                    <div class="list-group-item list-group-item-action bg-success text-light">Emergency Contact Details</div>
                                    <div class="list-group-item list-group-item-action border-right-warning">Documents Upload</div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="col-md-9">
                        <div class="card">
                            <div class="card-header">
                                <h2 class="display-7">Upload Required Documents
                                </h2>
                            </div>
                            <div class="card-body">
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        <table class="table  pt-0 pb-0 w-100">
                                            <tbody>
                                                <tr>
                                                    <th width="20%">Required Documents</th>
                                                    <th width="40%">Options</th>
                                                    <th width="40%">Action</th>
                                                </tr>
                                                <asp:Panel ID="Panel1" runat="server" Visible="false">
                                                    <tr>
                                                        <td>Address Proof</td>
                                                        <td>
                                                            <asp:RadioButtonList ID="rblAddress" AutoPostBack="true" OnSelectedIndexChanged="rblAddress_SelectedIndexChanged" CssClass="w-100" runat="server">
                                                            </asp:RadioButtonList>
                                                        </td>
                                                        <td>
                                                            <ajaxToolkit:AjaxFileUpload ID="afAddress" runat="server" OnUploadComplete="afAddress_UploadComplete" Enabled="false" AllowedFileTypes="pdf" MaxFileSize="2048" MaximumNumberOfFiles="1" />
                                                        </td>
                                                    </tr>
                                                </asp:Panel>
                                                <asp:Panel ID="Panel2" runat="server" Visible="false">
                                                    <tr>
                                                        <td>ID Proof</td>
                                                        <td>
                                                            <asp:HiddenField ID="hfIDproof" runat="server" />
                                                            <asp:RadioButtonList ID="rblIDproof" CssClass="w-100" runat="server" AutoPostBack="true" OnSelectedIndexChanged="rblIDproof_SelectedIndexChanged">
                                                            </asp:RadioButtonList>
                                                        </td>
                                                        <td>
                                                            <ajaxToolkit:AjaxFileUpload ID="afIDproof" OnUploadComplete="afIDproof_UploadComplete" runat="server" Enabled="false" AllowedFileTypes="pdf" MaxFileSize="2048" MaximumNumberOfFiles="1" />
                                                        </td>
                                                    </tr>
                                                </asp:Panel>
                                                <asp:Panel ID="Panel3" runat="server" Visible="false">
                                                    <tr>
                                                        <td>Name Change Proof</td>
                                                        <td>
                                                            <asp:HiddenField ID="hfNameChange" runat="server" Value="" />
                                                            <asp:RadioButtonList ID="rblNameChange" AutoPostBack="true" OnSelectedIndexChanged="rblNameChange_SelectedIndexChanged" CssClass="w-100" runat="server">
                                                            </asp:RadioButtonList>
                                                        </td>
                                                        <td>
                                                            <ajaxToolkit:AjaxFileUpload ID="afNameChange" runat="server" OnUploadComplete="afNameChange_UploadComplete" Enabled="false" AllowedFileTypes="pdf" MaxFileSize="2048" MaximumNumberOfFiles="1" />
                                                            
                                                        </td>
                                                    </tr>
                                                </asp:Panel>
                                                <asp:Panel ID="Panel4" runat="server" Visible="false">
                                                    <tr>
                                                        <td>Nationality Proof</td>
                                                        <td>
                                                            <asp:HiddenField ID="hfNationality" runat="server" Value="" />
                                                            <asp:RadioButtonList ID="rblNationality" AutoPostBack="true" OnSelectedIndexChanged="rblNationality_SelectedIndexChanged" CssClass="w-100" runat="server">
                                                            </asp:RadioButtonList>
                                                        </td>
                                                        <td>
                                                            <ajaxToolkit:AjaxFileUpload ID="afNationality" runat="server" OnUploadComplete="afNationality_UploadComplete" Enabled="false" AllowedFileTypes="pdf" MaxFileSize="2048" MaximumNumberOfFiles="1" />
                                                            
                                                        </td>
                                                    </tr>
                                                </asp:Panel>

                                                <asp:Panel ID="Panel5" runat="server" Visible="false">
                                                    <tr>
                                                        <td>Annexure 'H'</td>
                                                        <td>
                                                            <asp:HiddenField ID="hfAnnexureH" runat="server" Value="" />
                                                            <asp:RadioButtonList ID="rblAnnexureH" AutoPostBack="true" OnSelectedIndexChanged="rblAnnexureH_SelectedIndexChanged" CssClass="w-100" runat="server">
                                                            </asp:RadioButtonList>
                                                        </td>
                                                        <td>
                                                            <ajaxToolkit:AjaxFileUpload ID="afAnnexure" runat="server" OnUploadComplete="afAnnexure_UploadComplete" Enabled="false" AllowedFileTypes="pdf" MaxFileSize="2048" MaximumNumberOfFiles="1" />
                                                        
                                                        </td>
                                                    </tr>
                                                </asp:Panel>
                                                <tr>
                                                    <td colspan="2"><asp:Label ID="lblError" runat="server" Visible="false" ForeColor="Red" Font-Italic="true"></asp:Label></td>
                                                    <td class="text-center">
                                                        <asp:Button ID="btnNext" runat="server" CssClass="btn btn-sm btn-primary w-50" OnClick="btnNext_Click" Text="Next" />
                                                    </td>
                                                </tr>
                                            </tbody>

                                        </table>
                                    </ContentTemplate>
                                </asp:UpdatePanel>


                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>

    </div>
</asp:Content>

