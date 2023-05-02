using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Product1 : System.Web.UI.Page
{
    public void Alert(string message)
    {
        var m = new System.Web.Script.Serialization.JavaScriptSerializer().Serialize(message);
        var script = string.Format("alert({0});", m);
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", script, true);
    }
    public void gvLeaderLoad()
    {
        string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        DataTable dt = new DataTable();
        using (SqlConnection con = new SqlConnection(cs))
        {
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = new SqlCommand("select * from tblProductList", con);
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
    protected void btnInsert_Click(object sender, EventArgs e)
    {
        string name = txtProduct.Text.Trim();
        string price = txtProductprice.Text.Trim();
        string catagories = txtCategories.Text.Trim();
        string quntity = txtQuantity.Text.Trim();

        string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;


        using (SqlConnection con = new SqlConnection(cs))
        {
            con.Open();
            SqlCommand cmdInsert = new SqlCommand();
            cmdInsert.Connection = con;
            cmdInsert.CommandText = "insert into tblProductList values(@PName,@Pprice,@Pcatagories,@Pquntity)";
            cmdInsert.Parameters.AddWithValue("@PName", name);
            cmdInsert.Parameters.AddWithValue("@Pprice", price);
            cmdInsert.Parameters.AddWithValue("@Pcatagories", catagories);
            cmdInsert.Parameters.AddWithValue("@Pquntity", quntity);
            cmdInsert.ExecuteNonQuery();
            lblError.Text = "Data Insert Sucessfully";
            Response.Redirect(Request.RawUrl);

        }
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Response.Redirect("catagory.aspx");
    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        Response.Redirect("Billing1.aspx");
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
        string Pcatagories = gvLeader.DataKeys[e.RowIndex].Value.ToString();
        string PName = (gvLeader.Rows[e.RowIndex].FindControl("txtEditPName") as TextBox).Text.Trim();
        string Pprice = (gvLeader.Rows[e.RowIndex].FindControl("txtEditPrice") as TextBox).Text.Trim();
        string Pquntity = (gvLeader.Rows[e.RowIndex].FindControl("txtEditQuantity") as TextBox).Text.Trim();

        string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

        using (SqlConnection con = new SqlConnection(cs))
        {
            con.Open();
            SqlCommand cmdUpdateUser = new SqlCommand();
            cmdUpdateUser.Connection = con;
            cmdUpdateUser.CommandText = "update tblProductList set PName = @PName, Pprice = @Pprice, Pquntity=@Pquntity where Pcatagories = @Pcatagories";
            cmdUpdateUser.Parameters.AddWithValue("@PName", PName);
            cmdUpdateUser.Parameters.AddWithValue("@Pprice", Pprice);
            cmdUpdateUser.Parameters.AddWithValue("@Pquntity", Pquntity);
            cmdUpdateUser.Parameters.AddWithValue("@Pcatagories", Pcatagories);
            cmdUpdateUser.ExecuteNonQuery();


            gvLeader.EditIndex = -1;
            gvLeaderLoad();
            string message = "Leader updated successfully.";
            Alert(message);
            gvLeader.Rows[e.RowIndex].BackColor = System.Drawing.Color.LightGreen;
        }
    }
    protected void gvLeader_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string Pcatagories = gvLeader.DataKeys[e.RowIndex].Value.ToString();

        string cs = ConfigurationManager.ConnectionStrings["DBCS4"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "delete from tblProductList where Pcatagories=@Pcatagories ";
            cmd.Parameters.AddWithValue("@Pcatagories", Pcatagories);
            con.Open();
            cmd.ExecuteNonQuery();


            gvLeader.EditIndex = -1;
            gvLeaderLoad();
            string message = " Delete successfully.";
            Alert(message);
         
        }
    
    }
    protected void gvLeader_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvLeader.EditIndex = e.NewEditIndex;
        gvLeaderLoad();
        gvLeader.EditRowStyle.BackColor = System.Drawing.Color.LightPink;
    }
}