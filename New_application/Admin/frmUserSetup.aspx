<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="frmUserSetup.aspx.cs" Inherits="New_application.Admin.frmUserSetup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card">
        <main id="main">
            <div class="needs-validation" novalidate="novalidate">
                <div class="pagetitle">
                    <h1 style="font-family: 'bootstrap-icons'">User Setup</h1>
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
                                    <asp:Label ID="lblUSRcode" runat="server" Text="User Code"></asp:Label>
                                </div>
                                <div class="input-group input-group-sm has-validation">
                                    <asp:TextBox ID="txtUSRcode" runat="server" class="form-control" placeholder="User Code" required="submit"></asp:TextBox>
                                    <div class="invalid-tooltip">select</div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-label text-danger">
                                    <asp:Label ID="lblLGNid" runat="server" Text="Login ID"></asp:Label>
                                </div>
                                <div class="input-group input-group-sm has-validation">
                                    <asp:TextBox ID="txtLGNid" placeholder="Login ID" runat="server" class="form-control" required="submit"></asp:TextBox>
                                    <div class="invalid-tooltip">select</div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-label text-danger">
                                    <asp:Label ID="lblFullNa" runat="server" Text="Full Name"></asp:Label>
                                </div>
                                <div class="input-group input-group-sm has-validation">
                                    <asp:TextBox ID="txtFullname" runat="server" class="form-control" placeholder="Full name" required="submit"></asp:TextBox>
                                    <div class="invalid-tooltip">select</div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-label">
                                    <asp:Label ID="lblDepNa" runat="server" Text="Depart Name"></asp:Label>
                                </div>
                                <div class="input-group input-group-sm has-validation">
                                    <asp:TextBox ID="txtDepNa" placeholder="Depart Name" runat="server" class="form-control" required="submit"></asp:TextBox>
                                    <div class="invalid-tooltip">select</div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-label">
                                    <asp:Label ID="lblDesig" runat="server" Text="Designation"></asp:Label>
                                </div>
                                <div class="input-group input-group-sm has-validation">
                                    <asp:TextBox ID="txtDesig" runat="server" class="form-control" placeholder="Designation" required="submit"></asp:TextBox>
                                    <div class="invalid-tooltip">select</div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-label text-danger">
                                    <asp:Label ID="lblConNum" runat="server" Text="Contact Number"></asp:Label>
                                </div>
                                <div class="input-group input-group-sm has-validation">
                                    <asp:TextBox ID="txtConNum" placeholder="Contact Number" runat="server" class="form-control" required="submit"></asp:TextBox>
                                    <div class="invalid-tooltip">select</div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-label text-danger">
                                    <asp:Label ID="lblEmaAdd" runat="server" Text="Email Address"></asp:Label>
                                </div>
                                <div class="input-group input-group-sm has-validation">
                                    <asp:TextBox ID="txtEmaAdd" runat="server" class="form-control" placeholder="Email Address" required="submit"></asp:TextBox>
                                    <div class="invalid-tooltip">select</div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-label text-danger">
                                    <asp:Label ID="lblRoleNa" runat="server" Text="Role Name"></asp:Label>
                                </div>
                                <div class="input-group input-group-sm has-validation">
                                    <asp:TextBox ID="txtUsername" runat="server" class="form-control input-sm" required="submit"></asp:TextBox>
                                    <span class="input-group-btn">
                                        <button class="form-control input-sm" runat="server" style="height: 31px">
                                            <span class="fa fa-search" aria-hidden="true"></span>
                                        </button>
                                    </span>
                                    <div class="invalid-tooltip">select</div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-label text-danger">
                                    <asp:Label ID="lblCNIC" runat="server" Text="CNIC"></asp:Label>
                                </div>
                                <div class="input-group input-group-sm has-validation">
                                    <asp:TextBox ID="txtCNIC" runat="server" class="form-control" placeholder="CNIC" required="submit"></asp:TextBox>
                                    <div class="invalid-tooltip">select</div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-label text-danger">
                                    <asp:Label ID="Label2" runat="server" Text="Status"></asp:Label>
                                </div>
                                <div class="input-group input-group-sm has-validation">
                                    <asp:DropDownList ID="ddlSta" Class="form-select" runat="server"></asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-label text-danger">
                                    <asp:Label ID="lblPass" runat="server" Text="Password"></asp:Label>
                                </div>
                                <div class="input-group input-group-sm has-validation">
                                    <asp:TextBox ID="txtpassword" runat="server" class="form-control" placeholder="Password" required="submit"></asp:TextBox>
                                    <div class="invalid-tooltip">select</div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-label text-danger">
                                    <asp:Label ID="lblConPass" runat="server" Text="Password"></asp:Label>
                                </div>
                                <div class="input-group input-group-sm has-validation">
                                    <asp:TextBox ID="txtConpass" placeholder="Confirm Password" runat="server" class="form-control" required="submit"></asp:TextBox>
                                    <div class="invalid-tooltip">select</div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </main>
    </div>
</asp:Content>
