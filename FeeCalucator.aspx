<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="FeeCalucator.aspx.cs" Inherits="FeeCalucator" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="card">
            <div class="card-body">
                <div class="jumbotron">
                    <h1>Fees Calculator</h1>
                    <p>Fields marked with asterisk (*) are mandatory</p>
                    <p>Important Information: Passport application can be processed at any PSK/POPSK/PSLK WITHIN INDIA irrespective of your residential address.</p>
                </div>
                <table class="table">
                    <tr>
                        <td>Select Passport Type : </td>
                        <td>
                            <asp:RadioButtonList ID="rbPtype" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Value="Normal">Normal</asp:ListItem>
                                <asp:ListItem Value="Tatkal">Tatkal</asp:ListItem>
                            </asp:RadioButtonList>

                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>Select Passport Size : </td>
                        <td>
                            <asp:RadioButtonList ID="rbPsize" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Value="36">36</asp:ListItem>
                                <asp:ListItem Value="60">60</asp:ListItem>
                            </asp:RadioButtonList></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Label ID="lblFees" ForeColor="Olive" Font-Bold="true" runat="server" Text=""></asp:Label></td>
                        <td>
                            <asp:Button ID="btnCheck" runat="server" CssClass="btn btn-primary" Text="Get Fees" OnClick="btnCheck_Click" /></td>
                    </tr>

                </table>
                <hr />
            </div>
        </div>


    </div>
</asp:Content>

