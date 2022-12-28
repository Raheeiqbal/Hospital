<%@ Page Title="" Language="C#" MasterPageFile="~/LOVMaster.Master" AutoEventWireup="true" CodeBehind="LovRole.aspx.cs" Inherits="New_application.Lov.LovRole" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        //function ClosePop(controlID, Code, Desc, btnid) {
        //    debugger;
        //    window.opener.document.all(controlID).value = Code + '~' + Desc;
        //    window.opener.document.all(controlID).focus;
        //    if (btnid != "") { window.opener.document.all(btnid).click(); }
        //    self.close();
        //}

        function ClosePop(controlID, cval) {
            debugger;
            window.opener.document.getElementById(controlID).value = cval;
            self.close();
            window.close();
        }
    </script>
    <div class="card">
        <div class="card-body">
            <h5 class="card-title">Role</h5>
            <table class="table table-bordered table table-striped table table-hover" id="dataTable" width="100%" cellspacing="0">
                <asp:Repeater ID="rpt_data" runat="server" OnItemDataBound="rpt_data_ItemDataBound">
                    <HeaderTemplate>
                        <thead>
                            <tr>
                                <th>Role Code</th>
                                <th>Role Name</th>
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
                                <asp:Label ID="RoleNa" runat="server" Text='<%# Eval("Role_Name") %>'></asp:Label>
                            </td>
                            <td align="" style="width: 87px">
                                <asp:Button ID="btnSelect" class="btn btn-primary" runat="server" Text="Select"  OnClick="btnSelect_Click"/>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </table>
        </div>
    </div>
</asp:Content>
