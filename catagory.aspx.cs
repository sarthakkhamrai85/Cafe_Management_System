using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class catagory : System.Web.UI.Page
{
    public void Alert(string message)
    {
        var m = new System.Web.Script.Serialization.JavaScriptSerializer().Serialize(message);
        var script = string.Format("alert({0});", m);
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alert", script, true);
    }
    public void gvLeaderLoad()
    {
        string cs = ConfigurationManager.ConnectionStrings["DBCS4"].ConnectionString;
        DataTable dt = new DataTable();
        using (SqlConnection con = new SqlConnection(cs))
        {
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = new SqlCommand("select * from tblCatagory", con);  
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
        string Quintity = txtQuantity.Text.Trim();
        string id = txtCategoryid.Text.Trim();
        string catagory = txtCategoriesname.Text.Trim();

        string cs = ConfigurationManager.ConnectionStrings["DBCS4"].ConnectionString;


        using (SqlConnection con = new SqlConnection(cs))
        {
            con.Open();
            SqlCommand cmdInsert = new SqlCommand();
            cmdInsert.Connection = con;
            cmdInsert.CommandText = "insert into tblCatagory values(@Quantity,@Catid,@CName)";
            cmdInsert.Parameters.AddWithValue("@Quantity", Quintity);
            cmdInsert.Parameters.AddWithValue("@Catid", id);
            cmdInsert.Parameters.AddWithValue("@CName", catagory);
            cmdInsert.ExecuteNonQuery();
            lblError.Text = "Data insert Sucessfully";
            Response.Redirect(Request.RawUrl);

        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("product1.aspx");
    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        Response.Redirect("Billing1.aspx");
    }
    protected void LinkButton4_Click(object sender, EventArgs e)
    {
        Response.Redirect("Home.aspx");
    }
    protected void gvLeader_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvLeader.EditIndex = e.NewEditIndex;
        gvLeaderLoad();
        gvLeader.EditRowStyle.BackColor = System.Drawing.Color.LightPink;
    }
    protected void gvLeader_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        string cid = gvLeader.DataKeys[e.RowIndex].Value.ToString();
        string quantity = (gvLeader.Rows[e.RowIndex].FindControl("txtEditQuantity") as TextBox).Text.Trim();
        string Cname = (gvLeader.Rows[e.RowIndex].FindControl("txtEditCname") as TextBox).Text.Trim();

        string cs = ConfigurationManager.ConnectionStrings["DBCS4"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                    SqlCommand cmdUpdateUser = new SqlCommand();
                    cmdUpdateUser.Connection = con;
                    cmdUpdateUser.CommandText = "update tblCatagory set Quantity = @Quantity, CName = @CName where Catid = @Catid";
                    cmdUpdateUser.Parameters.AddWithValue("@Quantity", quantity);
                    cmdUpdateUser.Parameters.AddWithValue("@CName", Cname);
                    cmdUpdateUser.Parameters.AddWithValue("@Catid", cid);
                    
                    cmdUpdateUser.ExecuteNonQuery();

                  
                    gvLeader.EditIndex = -1;
                    gvLeaderLoad();
                    string message = " updated successfully.";
                    Alert(message);
                    gvLeader.Rows[e.RowIndex].BackColor = System.Drawing.Color.LightGreen;
            }
        }
    protected void gvLeader_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvLeader.EditIndex = -1;
        gvLeaderLoad();
    }
    protected void gvLeader_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
          string Catid = gvLeader.DataKeys[e.RowIndex].Value.ToString();

        string cs = ConfigurationManager.ConnectionStrings["DBCS4"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "delete from tblCatagory where Catid=@Catid ";
            cmd.Parameters.AddWithValue("@Catid", Catid);
            con.Open();
            cmd.ExecuteNonQuery();


            gvLeader.EditIndex = -1;
            gvLeaderLoad();
            string message = " Delete successfully.";
            Alert(message);
         
        }
    }


    protected void btnSearch_Click(object sender, EventArgs e)
    {
        string Pcatagories = txtCategoriesname.Text.Trim();

        btnSearch.Enabled = false;
        string cs = ConfigurationManager.ConnectionStrings["DBCS4"].ConnectionString;

        DataTable dt = new DataTable();
        using (SqlConnection con = new SqlConnection(cs))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "select * from tblProductList where Pcatagories=@Pcatagories ";
            cmd.Parameters.AddWithValue("@Pcatagories", Pcatagories);
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            da.Fill(dt);
            con.Close();
        }

        if (dt.Rows.Count != 0)
        {
            txtCategoriesname.Text = dt.Rows[0]["Pcatagories"].ToString().Trim();
           txtCategoriesname.Enabled = false;
           txtQuantity.Text = dt.Rows[0]["Pquntity"].ToString().Trim();
           txtCategoriesname.Text = dt.Rows[0]["Pcatagories"].ToString().Trim();

        }
        else
        {
            lblError.Text = "No data found!";
        }
    }
}