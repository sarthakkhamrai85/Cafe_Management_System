<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Billing1.aspx.cs" Inherits="Billing1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Billing1.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <nav class="navMenu">
    <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">product</asp:LinkButton>
      &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;
      <asp:LinkButton ID="LinkButton2" runat="server" onclick="LinkButton2_Click">Catagory</asp:LinkButton>
       &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       <asp:LinkButton ID="LinkButton3" runat="server">Billing</asp:LinkButton>
      &nbsp;&nbsp; 
      <asp:LinkButton ID="LinkButton4" runat="server" onclick="LinkButton4_Click">Logout</asp:LinkButton>
      <div class="dot"></div>
    </nav>
    <div class='container'>
        <div class='window'>
            <div class='content'>
                <div class='input-fields'>
                    <asp:TextBox ID="txtCustomrname" runat="server" class='input-line full-width' placeholder="Enter your custome name"
                        Width="327px"></asp:TextBox>
                    <br />
                    <asp:TextBox ID="txtProductName" runat="server" class='input-line full-width' placeholder="Product name"
                        Width="327px"></asp:TextBox>
                    <br />
                    <asp:TextBox ID="txtQuantity" runat="server" class='input-line full-width' placeholder="Enter your product quantity"
                        Width="327px" ontextchanged="txtQuantity_TextChanged" ></asp:TextBox>
                    <br />
                    <asp:TextBox ID="txtproductPrice" runat="server" class='input-line full-width' placeholder="Enter your product price"
                        Width="327px" ontextchanged="txtproductPrice_TextChanged" AutoPostBack="true" ></asp:TextBox>
                    <br />
                    <asp:TextBox ID="txtProductCatagory" runat="server" class='input-line full-width'
                        placeholder="product Catagory" Width="327px"></asp:TextBox>
                    <br />
                    <asp:TextBox ID="txtcategoryid" runat="server" class='input-line full-width' placeholder="category id"
                        Width="327px"></asp:TextBox>
                    <br />
                    <asp:TextBox ID="txtBillingdate" runat="server" class='input-line full-width' placeholder="Enter your Billing date"
                        Width="327px" TextMode="DateTimeLocal"></asp:TextBox>
                    <br />
                    <asp:TextBox ID="txtPhoneno" runat="server" class='input-line full-width' placeholder="Enter your Phone number"
                        Width="327px"></asp:TextBox>
                    <br />
                    <asp:TextBox ID="txtTotal" runat="server" class='input-line full-width' placeholder="Total"
                        Width="327px"></asp:TextBox>
                </div>
                <asp:Button ID="btnInsert" runat="server" Text="Save" Height="37px" OnClick="btnInsert_Click" />
                <asp:Button ID="btnSearch" runat="server" Text="Search" Height="33px" OnClick="btnSearch_Click" />
                <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
                <asp:Panel ID="panelView" runat="server" Style="margin-right: 0px" Width="1397px">
                    <div class="intro">
                    </div>
                    <div class="gvContainer">
                        <asp:GridView ID="gvLeader" CssClass="gv" runat="server" AutoGenerateColumns="False"
                            Width="1454px" DataKeyNames="Phone" OnRowCancelingEdit="gvLeader_RowCancelingEdit"
                            OnRowDeleting="gvLeader_RowDeleting" OnRowEditing="gvLeader_RowEditing" OnRowUpdating="gvLeader_RowUpdating">
                            <Columns>
                                <asp:TemplateField HeaderText="Product Name" ItemStyle-CssClass="gvitem" HeaderStyle-CssClass="gvheader">
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Pname") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtEditPname" CssClass="gvTextbox" runat="server" Text='<%# Bind("Pname") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <HeaderStyle CssClass="gvheader"></HeaderStyle>
                                    <ItemStyle CssClass="gvitem"></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Phone No" ItemStyle-CssClass="gvitem" HeaderStyle-CssClass="gvheader">
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("Phone") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("Phone") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <HeaderStyle CssClass="gvheader"></HeaderStyle>
                                    <ItemStyle CssClass="gvitem"></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Product Price" ItemStyle-CssClass="gvitem" HeaderStyle-CssClass="gvheader">
                                    <ItemTemplate>
                                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("Pprice") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtEditPrice" CssClass="gvTextbox" runat="server" Text='<%# Bind("Pprice") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <HeaderStyle CssClass="gvheader"></HeaderStyle>
                                    <ItemStyle CssClass="gvitem"></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Product Quantity" ItemStyle-CssClass="gvitem" HeaderStyle-CssClass="gvheader">
                                    <ItemTemplate>
                                        <asp:Label ID="Label6" runat="server" Text='<%# Eval("PQty") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtEditQuantity" CssClass="gvTextbox" runat="server" Text='<%# Bind("PQty") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <HeaderStyle CssClass="gvheader"></HeaderStyle>
                                    <ItemStyle CssClass="gvitem"></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Billing Date" ItemStyle-CssClass="gvitem" HeaderStyle-CssClass="gvheader">
                                    <ItemTemplate>
                                        <asp:Label ID="Label7" runat="server" Text='<%# Eval("Billing") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtEditBilling" CssClass="gvTextbox" runat="server" Text='<%# Bind("Billing") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <HeaderStyle CssClass="gvheader"></HeaderStyle>
                                    <ItemStyle CssClass="gvitem"></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total Price" ItemStyle-CssClass="gvitem" HeaderStyle-CssClass="gvheader">
                                    <ItemTemplate>
                                        <asp:Label ID="Label8" runat="server" Text='<%# Eval("total") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtEdittotal" CssClass="gvTextbox" runat="server" Text='<%# Bind("total") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <HeaderStyle CssClass="gvheader"></HeaderStyle>
                                    <ItemStyle CssClass="gvitem"></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Catgory Name" ItemStyle-CssClass="gvitem" HeaderStyle-CssClass="gvheader">
                                    <ItemTemplate>
                                        <asp:Label ID="Label9" runat="server" Text='<%# Eval("catagory") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtEditCategory" CssClass="gvTextbox" runat="server" Text='<%# Bind("catagory") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <HeaderStyle CssClass="gvheader"></HeaderStyle>
                                    <ItemStyle CssClass="gvitem"></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Customer Name" ItemStyle-CssClass="gvitem" HeaderStyle-CssClass="gvheader">
                                    <ItemTemplate>
                                        <asp:Label ID="Label10" runat="server" Text='<%# Eval("Cname") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtEditCname" CssClass="gvTextbox" runat="server" Text='<%# Bind("Cname") %>'></asp:TextBox>
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
