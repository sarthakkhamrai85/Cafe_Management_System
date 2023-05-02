<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>>Cafe Management System</title>
    <link href="Home.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<body>
    <form id="form1" runat="server">
    <header class="header">
 <h2><i class="fab fa-atlassian"> <strong>CAFE MANAGEMENT SYSTEM</strong></i></h2>
 <nav class="navbar">
    <asp:LinkButton ID="lbtnLogin" runat="server">Home</asp:LinkButton>
    <asp:LinkButton ID="lbtnNeedBlood" runat="server" >About</asp:LinkButton>
    <asp:LinkButton ID="lbtnAboutUs" runat="server" >Services</asp:LinkButton>
    <asp:LinkButton ID="lbtnRegister" runat="server">Contact</asp:LinkButton>
    </nav>

</header>
    <section class="home" id="home">

    <div class="content">
        <h3>WELCOME TO OUR CAFE</h3>
        <p>Starts Cafe Management System</p>
       <asp:LinkButton ID="btnLogin" runat="server" BorderWidth="3px" onclick="btnLogin_Click" 
           >Login Now</asp:LinkButton>
            <asp:LinkButton ID="btnRegister" runat="server" BorderWidth="3px" onclick="btnRegister_Click" 
           >Register Now</asp:LinkButton>
    </div>
    
   
</section>
    <!-- home section ends -->
    <!-- footer section starts  -->
    <section class="footer">

    <div class="box-container">

        <div class="box">
            <h3> Online Cafa Management System <i class="fab fa-atlassian"></i> </h3>
            <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Aliquam, saepe.</p>
            <div class="share">
                <a href="https://www.facebook.com/" class="fab fa-facebook-f"></a>
                <a href="#" class="fab fa-twitter"></a>
                <a href="#" class="fab fa-instagram"></a>
                <a href="#" class="fab fa-linkedin"></a>
            </div>
        </div>

        <div class="box">
            <h3>contact info</h3>
            <a href="#" class="links"> <i class="fas fa-phone"></i> 7866087836 </a>
            <a href="#" class="links"> <i class="fas fa-phone"></i> 7001982895 </a>
            <a href="#" class="links"> <i class="fas fa-envelope"></i> sarthak332@gmail.com </a>
            <a href="#" class="links"> <i class="fas fa-map-marker-alt"></i> Midnapore, West Bengal, India </a>
        </div>

        <div class="box">
            <h3>quick links</h3>
            <a href="#" class="links"> <i class="fas fa-arrow-right"></i> Home </a>
            <a href="#" class="links"> <i class="fas fa-arrow-right"></i> Login </a>
            <a href="#" class="links"> <i class="fas fa-arrow-right"></i>Register </a>
            <a href="#" class="links"> <i class="fas fa-arrow-right"></i> Service</a>
            <a href="#" class="links"> <i class="fas fa-arrow-right"></i> Review </a>
            <a href="#" class="links"> <i class="fas fa-arrow-right"></i> News </a>
        </div>

        <div class="box">
            <h3>Newsletter</h3>
            <p>subscribe for latest updates</p>
            <input type="email" placeholder="your email" class="email">
            <input type="submit" value="subscribe" class="btn">
            
        </div>

    </div>

    <div class="credit"> created by | <span> Sarthak Khamrai </span> | All Rights Reserved </div>

</section>
    <!-- footer section ends -->
    <script src="https://unpkg.com/swiper@7/swiper-bundle.min.js"></script>
    <!-- custom js file link  -->
    <script src="js/script.js"></script>
    </form>
</body>
</html>
