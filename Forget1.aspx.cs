using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Net;


public partial class Forget1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        String password;
        String mycon = @"Data Source=.\MYSQL2016;Initial Catalog=cafa_management_syustem; Integrated Security=True";
        String myquery = "Select * from tblRegistered where username='" + txtName.Text + "' and email='" + txtEmail.Text + "'";
        SqlConnection con = new SqlConnection(mycon);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = myquery;
        cmd.Connection = con;
        SqlDataAdapter da = new SqlDataAdapter();
        da.SelectCommand = cmd;
        DataSet ds = new DataSet();
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            //Label3.Text = "Data Found";

            password = ds.Tables[0].Rows[0]["password"].ToString();
            sendpassword(password, txtEmail.Text);
            lblError.Text = "Your Password Has Been Sent to Registered Email Address. Check Your Mail Inbox";
            Response.Redirect("Login1.aspx");

        }
        else
        {
            lblError.Text = "Your Username is Not Valid or Email Not Registered";

        }
        con.Close();
      //  Response.Redirect("Login1.aspx");

    }
    private void sendpassword(String password, String email)
    {
        SmtpClient smtp = new SmtpClient();
        smtp.Host = "smtp.gmail.com";
        smtp.Port = 587; //25 487
        smtp.Credentials = new System.Net.NetworkCredential("khamraisarthak7866@gmail.com", "rxnvsiinadgsrdps");
        smtp.EnableSsl = true;
        MailMessage msg = new MailMessage();
        msg.Subject = "Forgot Password ( Cafe Management System )";
        msg.Body = "Dear " + txtName.Text + ", Your Password is  " + password + "\n\n\nThanks & Regards\nCafe Management System";
        string toaddress = txtEmail.Text;
        msg.To.Add(toaddress);
        string fromaddress = "Cafe Management System <khamraisarthak7866@gmail.com>";
        msg.From = new MailAddress(fromaddress);
        try
        {
            smtp.Send(msg);


        }
        catch
        {
            throw;
        }
    }
}