<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="frmRoleSetup.aspx.cs" Inherits="New_application.Admin.frmRoleSetup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card">
        <main id="main">
            <div class="needs-validation" novalidate="novalidate">
                <div class="pagetitle">
                    <h1 style="font-family: 'bootstrap-icons'">Role Setup</h1>
                </div>
                <hr />
                <div class="col-md-12 col-lg-12 col-sm-12">
                    <div class="row">
                        <div class="col-md-12">
                            <asp:Button ID="btnSubmit" class="btn btn-primary" type="submit" runat="server" Text="Submit" />
                            <asp:Button ID="btnReset" class="btn btn-primary" runat="server" Text="Reset" />
                        </div>
                    </div>
                    <hr />
                    <div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-label text-danger">
                                    <asp:Label ID="lblUSRcode" runat="server" Text="Role Code"></asp:Label>
                                </div>
                                <div class="input-group input-group-sm has-validation">
                                    <asp:TextBox ID="txtrolcode" runat="server" class="form-control" placeholder="Role Code" required="submit"></asp:TextBox>
                                    <div class="invalid-tooltip">select</div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-label text-danger">
                                    <asp:Label ID="lblLGNid" runat="server" Text="Role Name"></asp:Label>
                                </div>
                                <div class="input-group input-group-sm has-validation">
                                    <asp:TextBox ID="txtrolid" placeholder="Role Name" runat="server" class="form-control" required="submit"></asp:TextBox>
                                    <div class="invalid-tooltip">select</div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <table style="width: 100%">
                                <tr>
                                    <td>
                                        <asp:GridView ID="GVADMIN" Width="100%" runat="server" CssClass="GridMain" AlternatingRowStyle-CssClass="alt" RowStyle-CssClass="tr" Font-Size="8pt" Font-Names="Verdana" DataKeyNames="" AutoGenerateColumns="False">
                                            <Columns>
                                                <asp:BoundField DataField="" ItemStyle-Width="550px" HeaderText="Form Name" ReadOnly="True" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
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
                                                        <asp:CheckBox ID="CHK_UPD-" runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>

                                    </td>
                                </tr>

                            </table>

                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
</asp:Content>
