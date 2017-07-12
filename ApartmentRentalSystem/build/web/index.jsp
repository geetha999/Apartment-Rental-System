<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html>

<head>
  <title>Apartment Rental System</title>
  <meta name="description" content="website description" />
  <meta name="keywords" content="website keywords, website keywords" />
  <meta http-equiv="content-type" content="text/html; charset=windows-1252" />
  <link rel="stylesheet" type="text/css" href="css/style.css" />
  <!-- modernizr enables HTML5 elements and feature detects -->
  <script type="text/javascript" src="js/modernizr-1.5.min.js"></script>
  <style>
.button{
                   font-weight: bold;
                font-size: 100%;
                font-family: Arial;
                width: 80px;
                height: 25px;
                margin-left: 30px
            }
 </style>

</head>

<body>
  <div id="main">
    <header>
        <script>
		function submit_form(target) {
                    document.getElementById("loginform").action = target;
                    document.getElementById("loginform").method = 'post';
                   document.getElementById("loginform").submit();
		}
		
</script>
	  <div id="banner">
	    <div id="welcome">
	      <h2>Apartment Rental System</h2>
	    </div><!--close welcome-->			  	
	  </div><!--close banner-->	
	</header>
	
	
	<div id="site_content">		

        <div class="slideshow">
	<!-- <div style="width: 940px; height: 800px; float: left;"> -->
        <ul class="slideshow">
        <!-- <ul style="width: 940px; height: 300px; float: left;"> -->
          <li class="show"><img width="940" height="600" src="images/tenanthome.png"  /></li>
          <li><img width="940" height="600" src="images/home5.jpg"  /></li>
          <li><img width="940" height="600" src="images/home4.jpg"  /></li>
        </ul> 
	  </div><!--close slideshow  -->
	  <div id="content">
              <div class="content_item">
                  
                  <form method="POST" id="loginform" name="loginform" >
  <table border="0" cellspacing="5" style="color: white">
    <tr>
      <th align="right">Username:</th>
      <td align="left"><input type="text" name="login"></td>
    </tr>
    <tr>
      <th align="right">Password:</th>
      <td align="left"><input type="password" name="passwd"></td>
    </tr>
    <tr>
      <td align="right"><input type="submit" class="button" value="Log In" onclick="submit_form('login.jsp');"></td>
      <td align="left"><input type="submit" class="button" value="Register" onclick="submit_form('registrationForm.jsp');" </td>
    </tr>
  </table>
</form>
                  
               </div><!--close content_item-->
         </div><!--close content-->   
	
	</div><!--close site_content-->
    
    <footer>
	  
    </footer> 
  
  </div><!--close main-->
  
  <!-- javascript at the bottom for fast page loading -->
  <script type="text/javascript" src="js/jquery.min.js"></script>
  <script type="text/javascript" src="js/image_slide.js"></script>
  
</body>
</html>

