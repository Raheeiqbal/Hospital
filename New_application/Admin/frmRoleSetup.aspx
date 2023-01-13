<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="frmRoleSetup.aspx.cs" Inherits="New_application.Admin.frmRoleSetup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script>
        debugger;
        $('document').ready(function () {
            $(".selectAll").on("click", function (e) {
                debugger;
                if ($(this).is(":checked")) {
                    rpt_data.rows().select();
                } else {
                    rpt_data.rows().deselect();
                }
            });
        })
    </script>
    <div class="card">
        <main id="main">
            <%--<formview id="formview1" runat="server">--%>
            <div class="needs-validation" novalidate="novalidate">
                <div class="pagetitle">
                    <h1 style="font-family: 'bootstrap-icons'">Role Setup</h1>
                </div>
                <hr />
                <div class="col-md-12 col-lg-12 col-sm-12">
                    <div class="row">
                        <div class="col-md-12">
                            <asp:Button ID="button" runat="server" Text="Add New" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#ExtralargeModal" OnClick="button_Click" />
                        </div>
                    </div>
                    <hr />
                    <div class="modal fade" id="ExtralargeModal" tabindex="-1">
                        <div class="modal-dialog modal-xl">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title">Extra Large Modal</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <asp:Button ID="btnSubmit" class="btn btn-primary" type="submit" runat="server" Text="Submit" OnClientClick="return confirm('Do you want to submit?')" OnClick="btnSubmit_Click" />
                                            <asp:Button ID="btnReset" class="btn btn-primary" runat="server" Text="Reset" OnClick="btnReset_Click" OnClientClick="return confirm('Do you want Reset?')" />
                                        </div>
                                    </div>
                                    <hr />
                                    <div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-label text-danger">
                                                    <asp:Label ID="lblrolcode" runat="server" Text="Role Code"></asp:Label>
                                                </div>
                                                <div class="input-group input-group-sm has-validation">
                                                    <asp:TextBox ID="txtrolcode" runat="server" class="form-control bg-secondary-light" placeholder="Role Code" ReadOnly="true" AutoPostBack="false"></asp:TextBox>

                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-label text-danger">
                                                    <asp:Label ID="lblLGNid" runat="server" Text="Role Name"></asp:Label>
                                                </div>
                                                <div class="input-group input-group-sm has-validation">
                                                    <asp:TextBox ID="txtrolName" placeholder="Role Name" runat="server" class="form-control" required="submit"></asp:TextBox>

                                                </div>
                                            </div>
                                        </div>
                                        <hr />
                                        <div class="card">
                                            <div class="card-body">
                                                <h5 class="card-title">Role</h5>
                                                <table class="table table-bordered table table-striped table table-hover" id="dataTable1" width="100%" cellspacing="0">
                                                    <asp:Repeater ID="rpt_data" runat="server">
                                                        <HeaderTemplate>
                                                            <thead>
                                                                <tr>
                                                                    <th>Form Name</th>
                                                                    <th class="text-center">
                                                                        <asp:CheckBox ID="CHK_VIEW_All"  Text=" View" runat="server" OnCheckedChanged="CHK_All_CheckedChanged" /></th>
                                                                    <th class="text-center">
                                                                        <asp:CheckBox ID="CHK_INS_All" AutoPostBack="true" Text=" Insert" runat="server" OnCheckedChanged="CHK_All_CheckedChanged" /></th>
                                                                    <th class="text-center">
                                                                        <asp:CheckBox ID="CHK_UPD_All" AutoPostBack="true" Text=" Update" runat="server" OnCheckedChanged="CHK_All_CheckedChanged" /></th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <tr>
                                                                <asp:Label ID="FormID" runat="server" Text='<%# Eval("FormID") %>' Visible="false"></asp:Label>
                                                                <td>
                                                                    <asp:Label ID="FormName" runat="server" Text='<%# Eval("Formname") %>'></asp:Label>
                                                                </td>
                                                                <td align="center">
                                                                    <asp:CheckBox ID="CHK_VIEW" class="text-center" runat="server" />
                                                                </td>
                                                                <td align="center">
                                                                    <asp:CheckBox ID="CHK_INS" class="text-center" runat="server" />
                                                                </td>
                                                                <td align="center">
                                                                    <asp:CheckBox ID="CHK_UPD" runat="server" />
                                                                </td>
                                                            </tr>
                                                        </ItemTemplate>
                                                    </asp:Repeater>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <h5 class="card-title">USER DETAILS</h5>
                    <table class="table table-bordered table table-striped table table-hover" id="dataTable" width="100%" cellspacing="0">
                        <asp:Repeater ID="rpt_roleDetail" runat="server">
                            <HeaderTemplate>
                                <thead>
                                    <tr>
                                        <th>User Code</th>
                                        <th>User Name</th>
                                        <th>Select</th>
                                    </tr>
                                </thead>
                                <tbody>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <asp:Label ID="RoleCo" runat="server" Text='<%# Eval("Role_Code") %>'></asp:Label>
                                    </td>
                                    <td align="center">
                                        <asp:Label ID="RoleNa" runat="server" Text='<%# Eval("Role_name") %>'></asp:Label>
                                    </td>
                                    <td align="" style="width: 87px">
                                        <asp:Button ID="btnSelect" class="btn btn-primary" runat="server" Text="Select" />
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </table>







                </div>
            </div>
            <%-- </formview>--%>
        </main>
    </div>
</asp:Content>
