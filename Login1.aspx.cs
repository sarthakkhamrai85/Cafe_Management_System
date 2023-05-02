using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Login1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        /* if (txtName.Text != "" && txtPassword.Text != "")
        {
            if (Session["Email"].ToString() == txtName.Text && Session["Password"].ToString() == txtPassword.Text)
            {
                Response.Redirect("product1.aspx");
            }
            else
            {
                lblError.Text = "User name and password does not match";
            }
     }
        else
        {
            lblError.Text = "please fill in care fully !!";
        } */

        string Email = txtName.Text.Trim();
        string password = txtPassword.Text.Trim();


        
        string cs = ConfigurationManager.ConnectionStrings["DBCS8"].ConnectionString;
        DataTable dt = new DataTable();
        using (SqlConnection con = new SqlConnection(cs))
        {
            con.Open();
            SqlCommand CmdInsert = new SqlCommand();
            CmdInsert.Connection = con;
            CmdInsert.CommandText = "select password from tblRegistered where Password=@Password and Email=@Email";
            CmdInsert.Parameters.AddWithValue("@Password",password);
            CmdInsert.Parameters.AddWithValue("@Email",Email);
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = CmdInsert;
            da.Fill(dt);
        }
        if (dt.Rows.Count == 1)
        {
            Response.Redirect("product1.aspx");
        }
        else
        {
            lblError.Text = "User name and password does not match";
        }
    }
    protected void  linkregistered_Click(object sender, EventArgs e)
{
        Response.Redirect("Register1.aspx");
}
    protected void linkForget_Click(object sender, EventArgs e)
    {
        Response.Redirect("Forget1.aspx");
    }
  
}
