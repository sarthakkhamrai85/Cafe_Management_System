using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Billing1 : System.Web.UI.Page
{
    public void Alert(string message)
    {
        var m = new System.Web.Script.Serialization.JavaScriptSerializer().Serialize(message);
        var script = string.Format("alert({0});", m);
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", script, true);
    }
    public void gvLeaderLoad()
    {
        string cs = ConfigurationManager.ConnectionStrings["DBCS1"].ConnectionString;

        DataTable dt = new DataTable();
        using (SqlConnection con = new SqlConnection(cs))
        {
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = new SqlCommand("select * from tblBilling", con);
            da.Fill(dt);
        }
        gvLeader.DataSource = dt;
        gvLeader.DataBind();
        if (dt.Rows.Count == 0)
        {
            Label lbl = gvLeader.Controls[0].Controls[0].FindControl("lblError") as Label;
            lbl.Text = "No data found.";
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!IsPostBack)
        {
            gvLeaderLoad();
        }

    }
    public void Txt()
    {
        int t1, t2;
        bool b1 = int.TryParse(txtproductPrice.Text,out t1);
        bool b2 = int.TryParse(txtQuantity.Text, out t2);
        if (b1 && b2)
        {
            txtTotal.Text = (t1 * t2).ToString();
        }
        else
        {
            txtTotal.Text = "Worng input!!";
        }

    }
    protected void btnInsert_Click(object sender, EventArgs e)
    {
        string name = txtProductName.Text.Trim();
        string price = txtproductPrice.Text.Trim();
        string quantity = txtQuantity.Text.Trim();
        string billing = txtBillingdate.Text.Trim();
        string catgpry = txtProductCatagory.Text.Trim();
        string total = txtTotal.Text.Trim();
        string phone = txtPhoneno.Text.Trim();
        string cname = txtCustomrname.Text.Trim();

        string cs = ConfigurationManager.ConnectionStrings["DBCS1"].ConnectionString;


        using (SqlConnection con = new SqlConnection(cs))
        {
            con.Open();
            SqlCommand cmdInsert = new SqlCommand();
            cmdInsert.Connection = con;
            cmdInsert.CommandText = "insert into tblBilling values(@Pname,@Pprice,@PQty,@Billing,@catagory,@total,@Phone,@Cname)";
            cmdInsert.Parameters.AddWithValue("@Pname", name);
            cmdInsert.Parameters.AddWithValue("@Pprice", price);
            cmdInsert.Parameters.AddWithValue("@PQty", quantity);
            cmdInsert.Parameters.AddWithValue("@Billing", billing);
            cmdInsert.Parameters.AddWithValue("@catagory", catgpry);
            cmdInsert.Parameters.AddWithValue("@total", total);
            cmdInsert.Parameters.AddWithValue("@Phone", phone);
            cmdInsert.Parameters.AddWithValue("@Cname", cname);
            cmdInsert.ExecuteNonQuery();
            lblError.Text = "Data insert Sucessfully";
            Response.Redirect(Request.RawUrl);

        }
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        btnSearch.Enabled = false;
        string CName = txtProductCatagory.Text.Trim();


        string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

        DataTable dt = new DataTable();
        using (SqlConnection con = new SqlConnection(cs))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "select * from tblCatagory where CName=@CName ";
            cmd.Parameters.AddWithValue("@CName", CName);
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            da.Fill(dt);
            con.Close();
        }

        if (dt.Rows.Count != 0)
        {
            txtProductCatagory.Text = dt.Rows[0]["CName"].ToString().Trim();
            txtProductCatagory.Enabled = false;
            txtcategoryid.Text = dt.Rows[0]["Catid"].ToString().Trim();
            txtProductCatagory.Text = dt.Rows[0]["CName"].ToString().Trim();
            
        }
        else
        {
            lblError.Text = "No data found!";
        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("product1.aspx");
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Response.Redirect("catagory.aspx");
    }
    protected void LinkButton4_Click(object sender, EventArgs e)
    {
        Response.Redirect("Home.aspx");
    }
    protected void gvLeader_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvLeader.EditIndex = -1;
        gvLeaderLoad();
    }
    protected void gvLeader_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        string Phone = gvLeader.DataKeys[e.RowIndex].Value.ToString();
        string Pname = (gvLeader.Rows[e.RowIndex].FindControl("txtEditPname") as TextBox).Text.Trim();
        string Pprice = (gvLeader.Rows[e.RowIndex].FindControl("txtEditPrice") as TextBox).Text.Trim();
        string PQty = (gvLeader.Rows[e.RowIndex].FindControl("txtEditQuantity") as TextBox).Text.Trim();
        string Billing = (gvLeader.Rows[e.RowIndex].FindControl("txtEditBilling") as TextBox).Text.Trim();
        string total = (gvLeader.Rows[e.RowIndex].FindControl("txtEdittotal") as TextBox).Text.Trim();
        string catagory = (gvLeader.Rows[e.RowIndex].FindControl("txtEditCategory") as TextBox).Text.Trim();
        string Cname = (gvLeader.Rows[e.RowIndex].FindControl("txtEditCname") as TextBox).Text.Trim();


        string cs = ConfigurationManager.ConnectionStrings["DBCS1"].ConnectionString;

        using (SqlConnection con = new SqlConnection(cs))
        {
            con.Open();
            SqlCommand cmdUpdateUser = new SqlCommand();
            cmdUpdateUser.Connection = con;
            cmdUpdateUser.CommandText = "update tblBilling set Pname = @Pname, Pprice = @Pprice, PQty = @PQty, Billing = @Billing, catagory = @catagory, total = @total, Cname = @Cname  where Phone = @Phone";
            cmdUpdateUser.Parameters.AddWithValue("@Pname", Pname);
            cmdUpdateUser.Parameters.AddWithValue("@Pprice", Pprice);
            cmdUpdateUser.Parameters.AddWithValue("@PQty", PQty);
            cmdUpdateUser.Parameters.AddWithValue("@Billing",Billing);
            cmdUpdateUser.Parameters.AddWithValue("@catagory",catagory);
            cmdUpdateUser.Parameters.AddWithValue("@total", total);
            cmdUpdateUser.Parameters.AddWithValue("@Cname", Cname);
            cmdUpdateUser.Parameters.AddWithValue("@Phone", Phone);
            cmdUpdateUser.ExecuteNonQuery();


            gvLeader.EditIndex = -1;
            gvLeaderLoad();
            string message = "Leader updated successfully.";
            Alert(message);
            gvLeader.Rows[e.RowIndex].BackColor = System.Drawing.Color.LightGreen;
        }
    }
    protected void gvLeader_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvLeader.EditIndex = e.NewEditIndex;
        gvLeaderLoad();
        gvLeader.EditRowStyle.BackColor = System.Drawing.Color.LightPink;
    }
    protected void gvLeader_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string Phone = gvLeader.DataKeys[e.RowIndex].Value.ToString();

        string cs = ConfigurationManager.ConnectionStrings["DBCS1"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "delete from tblBilling where Phone=@Phone ";
            cmd.Parameters.AddWithValue("@Phone", Phone);
            con.Open();
            cmd.ExecuteNonQuery();


            gvLeader.EditIndex = -1;
            gvLeaderLoad();
            string message = " Delete successfully.";
            Alert(message);

        }
    }
    protected void txtQuantity_TextChanged(object sender, EventArgs e)
    {
        Txt();
    }
    protected void txtproductPrice_TextChanged(object sender, EventArgs e)
    {
        Txt();
    }
}