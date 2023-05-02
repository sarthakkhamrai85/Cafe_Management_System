<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Product1.aspx.cs" Inherits="Product1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Product1.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .bold-line
        {
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <nav class="navMenu">
    <asp:LinkButton ID="LinkButton1" runat="server">product</asp:LinkButton>
      &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;
      <asp:LinkButton ID="LinkButton2" runat="server" onclick="LinkButton2_Click">Catagory</asp:LinkButton>
       &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       <asp:LinkButton ID="LinkButton3" runat="server" onclick="LinkButton3_Click">Billing</asp:LinkButton>
      &nbsp;&nbsp; 
      <asp:LinkButton ID="LinkButton4" runat="server" onclick="LinkButton4_Click">Logout</asp:LinkButton>
      <div class="dot"></div>
    </nav>
    <div class='bold-line'>
    </div>
    <div class='container'>
        <div class='window'>
            <div class='overlay'>
            </div>
            <div class='content'>
                <div class='input-fields'>
                    <asp:TextBox ID="txtProduct" runat="server" class='input-line full-width' placeholder="Enter your product name"></asp:TextBox>
                    <asp:TextBox ID="txtCategories" runat="server" class='input-line full-width' placeholder="Enter your product catagory"></asp:TextBox>
                    <asp:TextBox ID="txtProductprice" runat="server" class='input-line full-width' placeholder="Enter youe product price"></asp:TextBox>
                    <asp:TextBox ID="txtQuantity" runat="server" class='input-line full-width' placeholder="Enter your product Quantity"></asp:TextBox>
                </div>
                <asp:Button ID="btnInsert" runat="server" Text="Save" Height="37px" OnClick="btnInsert_Click" />
                <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
                <asp:Panel ID="panelView" runat="server" Style="margin-right: 0px" Width="1103px">
                    <div class="intro">
                    </div>
                    <div class="gvContainer">
                        <asp:GridView ID="gvLeader" CssClass="gv" runat="server" AutoGenerateColumns="False"
                            Width="1083px" DataKeyNames="Pcatagories" OnRowCancelingEdit="gvLeader_RowCancelingEdit"
                            OnRowDeleting="gvLeader_RowDeleting" OnRowEditing="gvLeader_RowEditing" OnRowUpdating="gvLeader_RowUpdating">
                            <Columns>
                                <asp:TemplateField HeaderText="Product Name" ItemStyle-CssClass="gvitem" HeaderStyle-CssClass="gvheader">
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("PName") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtEditPName" CssClass="gvTextbox" runat="server" Text='<%# Bind("PName") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <HeaderStyle CssClass="gvheader"></HeaderStyle>
                                    <ItemStyle CssClass="gvitem"></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Price" ItemStyle-CssClass="gvitem" HeaderStyle-CssClass="gvheader">
                                    <ItemTemplate>
                                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("Pprice") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtEditPrice" CssClass="gvTextbox" runat="server" Text='<%# Bind("Pprice") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <HeaderStyle CssClass="gvheader"></HeaderStyle>
                                    <ItemStyle CssClass="gvitem"></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Category Name" ItemStyle-CssClass="gvitem" HeaderStyle-CssClass="gvheader">
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("Pcatagories") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("Pcatagories") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <HeaderStyle CssClass="gvheader"></HeaderStyle>
                                    <ItemStyle CssClass="gvitem"></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Quantity" ItemStyle-CssClass="gvitem" HeaderStyle-CssClass="gvheader">
                                    <ItemTemplate>
                                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("Pquntity") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtEditQuantity" CssClass="gvTextbox" runat="server" Text='<%# Bind("Pquntity") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <HeaderStyle CssClass="gvheader"></HeaderStyle>
                                    <ItemStyle CssClass="gvitem"></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Action" ItemStyle-CssClass="gvaction" HeaderStyle-CssClass="gvheader">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="txtEdit" CssClass="gvbtn" runat="server" CommandName="Edit" OnClientClick="return confirm('Do you want to edit the selected row?')"
                                            ToolTip="Edit"><i class="fas fa-user-edit"></i>Edit</asp:LinkButton>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:LinkButton ID="txtUpdate" CssClass="gvbtn" runat="server" CommandName="Update"
                                            OnClientClick="return confirm('Do you want to update?')" ToolTip="Update row"><i class="fas fa-save"></i>Update</asp:LinkButton>
                                        <asp:LinkButton ID="LinkButton4" CssClass="gvbtn" runat="server" CommandName="Delete"
                                            OnClientClick="return confirm('Do you want to Delete?')" ToolTip="Delete row"><i class="fas fa-save"></i>Delete</asp:LinkButton>
                                        <asp:LinkButton ID="txtCancel" CssClass="gvbtn" runat="server" CommandName="Cancel"
                                            OnClientClick="return confirm('All unsaved data will be lost!')" ToolTip="Cancel editing"><i class="fas fa-window-close"></i>Cancel</asp:LinkButton>
                                    </EditItemTemplate>
                                    <HeaderStyle CssClass="gvheader"></HeaderStyle>
                                    <ItemStyle CssClass="gvaction"></ItemStyle>
                                </asp:TemplateField>
                            </Columns>
                            <EmptyDataTemplate>
                                <div class="error">
                                    <asp:Label ID="lblError" runat="server" Text="No data found."></asp:Label>
                                </div>
                            </EmptyDataTemplate>
                        </asp:GridView>
                    </div>
                </asp:Panel>
            </div>
    </form>
</body>
</html>
