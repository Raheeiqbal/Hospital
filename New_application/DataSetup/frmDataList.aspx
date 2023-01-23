<%@ Page Title="" Language="C#" MasterPageFile="~/mainPage.Master" AutoEventWireup="true" CodeBehind="frmDataList.aspx.cs" Inherits="New_application.DataSetup.frmDataList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="card">
        <main id="main">
            <div class="needs-validation">
                <div class="pagetitle">
                    <h1 style="font-family: 'bootstrap-icons'">Data List</h1>
                </div>
                <hr />
                <div class="col-md-12 col-lg-12 col-sm-12">
                    <div class="row">
                        <div class="col-md-12">
                            <asp:Button ID="btnAddN" class="btn btn-primary" runat="server" Text="Add New" />
                            <asp:Button ID="btnReset" class="btn btn-primary" runat="server" Text="Reset" OnClientClick="return confirm('Do you want Reset?')" />
                        </div>
                    </div>
                </div>
                <hr />

                <div class="col-md-12">
                    <div class="row">
                        <div class="form-group">
                            <label>Wild Card Search</label>
                            <div class="form-group input-group">
                                <asp:TextBox ID="txtSrch" runat="server" class="form-control" MaxLength="100"></asp:TextBox>
                                <span class="input-group-btn">
                                    <asp:Button ID="btnSearch" runat="server" class="btn btn-primary" Text="Search" />
                                </span>
                            </div>
                        </div>
                    </div>
                    <hr />
                    <div class="col-md-12">
                        <table>
                            <tr>
                                <td class="col-md-12">
                                    <table>
                                        <tr>
                                            <td>Page Size</td>
                                            <td>
                                                <asp:DropDownList ID="ddlPageSize" Width="80px" class="form-select" runat="server" AutoPostBack="true">
                                                    <asp:ListItem Value="20">20</asp:ListItem>
                                                    <asp:ListItem Value="50">50</asp:ListItem>
                                                    <asp:ListItem Value="100">100</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td class="">
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:DropDownList ID="ddlExport" Width="180px" class="form-select" runat="server">
                                                    <asp:ListItem Value="EXL">Export To Excel</asp:ListItem>
                                                    <asp:ListItem Value="DOC">Export To Word</asp:ListItem>
                                                    <asp:ListItem Value="PDF">Export To PDF</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                                <button class="btn btn-primary"><span class="bi bi-download" text="export" aria-hidden="true"></span></button>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="row">
                        <%-- <asp:GridView ID="GrdList" runat="server" class="table table-bordered table table-striped table table-hover table-responsive" AllowSorting="true" OnSorting="GrdList_Sorting" DataKeyNames="rowid" ShowHeaderWhenEmpty="True" PageSize="20" AllowPaging="True"
                            AutoGenerateColumns="False" Width="100%" OnPageIndexChanging="GrdList_PageIndexChanging1" OnRowDataBound="GrdList_RowDataBound" OnSelectedIndexChanged="GrdList_SelectedIndexChanged">
                            <AlternatingRowStyle CssClass="alt" />
                            <PagerStyle CssClass="pgr" />
                        </asp:GridView>--%>
                        <div class="row">
                            <asp:GridView ID="GrdList" runat="server" class="table table-bordered table table-striped table table-hover table-responsive" Width="100%" CellSpacing="0"></asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
</asp:Content>
