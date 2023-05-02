using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Register1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string text = (Guid.NewGuid().ToString()).Substring(0, 5);
        Response.Cookies["Captcha"]["value"] = text;
        imagecaptcha.ImageUrl = "captcha.aspx";
        lblcap.Visible = false;
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        Session["Name"] = txtName.Text;
        Session["Email"] = txtEmail.Text;
        Session["Phone"] = txtPhone.Text;
        Session["Address"] = txtAddress.Text;
        Session["Password"] = txtPassword.Text;
        Session["Conpassword"] = txtConpassword.Text;

        if (txtName.Text != "" && txtEmail.Text != "" && txtAddress.Text != "" && txtPhone.Text != "" && txtPassword.Text != "" && txtConpassword.Text != "" && txtcaptcha.Text != "")
        {

            if (txtcaptcha.Text.ToString() == Request.Cookies["Captcha"]["value"] && txtPassword.Text == txtConpassword.Text)
            {

                MailMessage mail = new MailMessage();
                mail.To.Add(txtEmail.Text.ToString().Trim());
                mail.From = new MailAddress("khamraisarthak7866@gmail.com");
                mail.Subject = "Cafe Management System";
                mail.Body = "<p>sir <br/>You have Sucessfully Registered in our Cafe</p>";
                mail.IsBodyHtml = true;
                SmtpClient smtp = new SmtpClient();
                smtp.Port = 587;
                smtp.EnableSsl = true;
                smtp.UseDefaultCredentials = false;
                smtp.Host = "smtp.gmail.com";
                smtp.Credentials = new System.Net.NetworkCredential("khamraisarthak7866@gmail.com", "rxnvsiinadgsrdps");
                smtp.Send(mail);

            }
            else
            {
                lblcap.Text = "this is not currect";

            }



            string name = txtName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string phone = txtPhone.Text.Trim();
            string address = txtAddress.Text.Trim();
            string password = txtPassword.Text.Trim();


            string cs = ConfigurationManager.ConnectionStrings["DBCS5"].ConnectionString;


            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmdInsert = new SqlCommand();
                cmdInsert.Connection = con;
                cmdInsert.CommandText = "insert into tblRegistered values(@username,@Email,@Phone,@Address,@Password)";
                cmdInsert.Parameters.AddWithValue("@username", name);
                cmdInsert.Parameters.AddWithValue("@Email", email);
                cmdInsert.Parameters.AddWithValue("@Phone", phone);
                cmdInsert.Parameters.AddWithValue("@Address", address);
                cmdInsert.Parameters.AddWithValue("@Password", password);
                cmdInsert.ExecuteNonQuery();
                Response.Redirect(Request.RawUrl);
                lblError.Text = "Sucessfully Registered";
                con.Close();
            }

        }
        else
        {
            lblError.Text = "Please Fill in carefully!!!";
        }
      
    }

    protected void btnSign_in_Click(object sender, EventArgs e)
    {
        Response.Redirect("Login1.aspx");
    }
}