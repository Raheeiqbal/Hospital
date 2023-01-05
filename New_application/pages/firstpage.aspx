<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="firstpage.aspx.cs" Inherits="New_application.pages.firstpage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card">
        <main id="main">
            <div class="needs-validation" novalidate="novalidate">
                <div class="pagetitle">
                    <h1 style="font-family: 'bootstrap-icons'">Registration</h1>
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
                    <div class="">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-label">
                                    <asp:Label ID="lblFstname" runat="server" Text="First Name"></asp:Label>
                                </div>
                                <div class="input-group input-group-sm has-validation">
                                    <asp:TextBox ID="txtFstname" runat="server" class="form-control" placeholder="Your Name" required="submit"></asp:TextBox>
                                     
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-label">
                                    <asp:Label ID="lblLstname" runat="server" Text="Last Name"></asp:Label>
                                </div>
                                <div class="input-group input-group-sm has-validation">
                                    <asp:TextBox ID="txtLstname" placeholder="Last Name" runat="server" class="form-control" required="submit"></asp:TextBox>
                                     
                                </div>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-label">
                                    <asp:Label ID="lblAddress" runat="server" Text="Address"></asp:Label>
                                </div>
                                <div class="input-group input-group-sm has-validation">
                                    <asp:TextBox ID="txtAddress" runat="server" class="form-control" placeholder="Address" required="submit"></asp:TextBox>
                                     
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-label">
                                    <asp:Label ID="lblZip" runat="server" Text="Zip Code"></asp:Label>
                                </div>
                                <div class="input-group input-group-sm has-validation">
                                    <asp:TextBox ID="txtZipCode" runat="server" class="form-control" placeholder="Zip Code" required="submit"></asp:TextBox>
                                     
                                </div>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-label">
                                    <asp:Label ID="lblCity" runat="server" Text="City"></asp:Label>
                                </div>
                                <div class="input-group input-group-sm has-validation">
                                    <asp:DropDownList ID="ddlCity" class="form-select" runat="server" required="submit">
                                        <asp:ListItem Selected="False">---Select City---</asp:ListItem>
                                    </asp:DropDownList>
                                     
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-label">
                                    <asp:Label ID="lblCountry" runat="server" Text="Country"></asp:Label>
                                </div>
                                <div class="input-group input-group-sm has-validation">
                                    <asp:DropDownList ID="ddlCon" class="form-select" runat="server" required="submit">
                                        <asp:ListItem Selected="False">---Select Country---</asp:ListItem>
                                    </asp:DropDownList>
                                     
                                </div>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-label">
                                    <asp:Label ID="lblPhoneNum" runat="server" Text="Phone Number"></asp:Label>
                                </div>
                                <div class="input-group input-group-sm has-validation">
                                    <asp:TextBox ID="txtPhoneNum" runat="server" class="form-control" placeholder="Phone Number" required="submit"></asp:TextBox>
                                     
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-label">
                                    <asp:Label ID="lblCNICNum" runat="server" Text="CNIC"></asp:Label>
                                </div>
                                <div class="input-group input-group-sm has-validation">
                                    <asp:TextBox ID="txtCNIC" runat="server" class="form-control" placeholder="CNIC" required="submit"></asp:TextBox>
                                     
                                </div>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-label">
                                    <asp:Label ID="lblGender" runat="server" Text="Gender"></asp:Label>
                                </div>
                                <div class="input-group input-group-sm has-validation">
                                    <asp:DropDownList ID="ddlGender" class="form-select" runat="server" required="submit">
                                        <asp:ListItem Selected="False">---Select Gender---</asp:ListItem>
                                    </asp:DropDownList>
                                     
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-label">
                                    <asp:Label ID="lblRegID" runat="server" Text="Registration ID"></asp:Label>
                                </div>
                                <div class="input-group input-group-sm has-validation">
                                    <asp:TextBox ID="txtRegID" runat="server" class="form-control" ReadOnly="true" placeholder="Registration ID" required="submit"></asp:TextBox>
                                     
                                </div>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-label">
                                    <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label>
                                </div>
                                <div class="input-group input-group-sm has-validation">
                                    <span class="input-group-text" id="inputGroupPrepend">@</span>
                                    <asp:TextBox ID="txtEmail" runat="server" class="form-control" placeholder="Email" required="submit"></asp:TextBox>
                                    <div class="invalid-feedback">Please enter your username.</div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-label">
                                    <asp:Label ID="lblDate" runat="server" Text="Date of Birth"></asp:Label>
                                </div>
                                <div class="input-group input-group-sm has-validation">
                                    <asp:TextBox ID="txtDate" runat="server" class="form-control" TextMode="Date" required="submit"></asp:TextBox>
                                     
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
</asp:Content>
