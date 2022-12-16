<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="frmRoleSetup.aspx.cs" Inherits="New_application.Admin.frmRoleSetup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card">
        <main id="main">
            <div class="needs-validation">
                <div class="pagetitle">
                    <h1 style="font-family: 'bootstrap-icons'">Role Setup</h1>
                </div>
                <hr />
                <div class="col-md-12 col-lg-12 col-sm-12">
                    <div class="row">
                        <div class="col-md-12">
                            <asp:Button ID="btnSubmit" class="btn btn-primary" type="submit" runat="server" Text="Submit" OnClick="btnSubmit_Click"/>
                            <asp:Button ID="btnReset" class="btn btn-primary" runat="server" Text="Reset" />
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
                                    <asp:TextBox ID="txtrolcode" runat="server" class="form-control" placeholder="Role Code" disabled=""></asp:TextBox>
                                    <div class="invalid-tooltip">select</div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-label text-danger">
                                    <asp:Label ID="lblLGNid" runat="server" Text="Role Name"></asp:Label>
                                </div>
                                <div class="input-group input-group-sm has-validation">
                                    <asp:TextBox ID="txtrolName" placeholder="Role Name" runat="server" class="form-control" required="submit"></asp:TextBox>
                                    <div class="invalid-tooltip">select</div>
                                </div>
                            </div>
                        </div>
                        <hr />
                        <%--<div class="col-md-12">
                            <table style="width: 100%">
                                <tr>
                                    <td>
                                        <asp:GridView ID="GVADMIN" Width="100%" Class="form-control" runat="server" DataKeyNames=""  AutoGenerateColumns="False">
                                            <Columns>
                                                <asp:BoundField DataField="Formname" ItemStyle-Width="550px" HeaderText="Form Name" ReadOnly="True" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
                                                <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                    <HeaderTemplate>
                                                        <asp:CheckBox ID="CHK_VIEW_All" AutoPostBack="true" Text=" View" runat="server" />
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="CHK_VIEW" runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                    <HeaderTemplate>
                                                        <asp:CheckBox ID="CHK_INS_All" AutoPostBack="true" Text=" Insert" runat="server" />
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="CHK_INS" runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                    <HeaderTemplate>
                                                        <asp:CheckBox ID="CHK_UPD_All" AutoPostBack="true" Text=" Update" runat="server" />
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="CHK_UPD" runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>

                                    </td>
                                </tr>

                            </table>

                        </div>--%>

                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">Role</h5>
                                <table class="table table-bordered table table-striped table table-hover" id="dataTable" width="100%" cellspacing="0">
                                    <asp:Repeater ID="rpt_data" runat="server">
                                        <HeaderTemplate>
                                            <thead>
                                                <tr>
                                                    <th>Form Name</th>
                                                    <th class="text-center">
                                                        <asp:CheckBox ID="CHK_VIEW_All" AutoPostBack="true" Text=" View" runat="server" OnCheckedChanged="CHK_All_CheckedChanged" /></th>
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
        </main>
    </div>
</asp:Content>
