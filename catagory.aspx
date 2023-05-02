<%@ Page Language="C#" AutoEventWireup="true" CodeFile="catagory.aspx.cs" Inherits="catagory" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="catgory.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <nav class="navMenu">
    <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">product</asp:LinkButton>
      &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;
      <asp:LinkButton ID="LinkButton2" runat="server">Catagory</asp:LinkButton>
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
                    <asp:TextBox ID="txtCategoryid" runat="server" class='input-line full-width' placeholder="Enter your category id"></asp:TextBox>
                    <asp:TextBox ID="txtCategoriesname" runat="server" class='input-line full-width'
                        placeholder="Enter your category name"></asp:TextBox>
                    <asp:TextBox ID="txtQuantity" runat="server" class='input-line full-width' placeholder="Enter your  Quantity"></asp:TextBox>
                </div>
                <asp:Button ID="btnInsert" runat="server" Text="Save" Height="37px" OnClick="btnInsert_Click" />
                <asp:Button ID="btnSearch" runat="server" Text="Search" Height="37px" OnClick="btnSearch_Click" />
                <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
            </div>
            <asp:Panel ID="panelView" runat="server" Style="margin-right: 0px" Width="1038px">
                <div class="intro">
                </div>
                <div class="gvContainer">
                    <asp:GridView ID="gvLeader" CssClass="gv" runat="server" AutoGenerateColumns="False"
                        Width="1018px" DataKeyNames="Catid" OnRowCancelingEdit="gvLeader_RowCancelingEdit"
                        OnRowEditing="gvLeader_RowEditing" OnRowUpdating="gvLeader_RowUpdating" OnRowDeleting="gvLeader_RowDeleting">
                        <Columns>
                            <asp:TemplateField HeaderText="Quantity" ItemStyle-CssClass="gvitem" HeaderStyle-CssClass="gvheader">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Quantity") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtEditQuantity" CssClass="gvTextbox" runat="server" Text='<%# Bind("Quantity") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <HeaderStyle CssClass="gvheader"></HeaderStyle>
                                <ItemStyle CssClass="gvitem"></ItemStyle>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Category Id" ItemStyle-CssClass="gvitem" HeaderStyle-CssClass="gvheader">
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("Catid") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("Catid") %>'></asp:Label>
                                </EditItemTemplate>
                                <HeaderStyle CssClass="gvheader"></HeaderStyle>
                                <ItemStyle CssClass="gvitem"></ItemStyle>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Catgory Name" ItemStyle-CssClass="gvitem" HeaderStyle-CssClass="gvheader">
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("CName") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtEditCname" CssClass="gvTextbox" runat="server" Text='<%# Bind("CName") %>'></asp:TextBox>
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
    </form>
</body>
</html>
