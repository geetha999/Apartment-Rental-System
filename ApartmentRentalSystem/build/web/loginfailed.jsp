
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
          <li class="show"><img width="940" height="600" src="images/home_1.jpg"  /></li>
          <li><img width="940" height="600" src="images/home_2.jpg"  /></li>
          <li><img width="940" height="600" src="images/adminhome.jpg"  /></li>
        </ul> 
	  </div><!--close slideshow  -->
	  <div id="content">
              <div class="content_item">
                  
                  <h1>Invalid Login or Password. <a href='index.jsp'> Try Again</a>
                </h1>
                  
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

